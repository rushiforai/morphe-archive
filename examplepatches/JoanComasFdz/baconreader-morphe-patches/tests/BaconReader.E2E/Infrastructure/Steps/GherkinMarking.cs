// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Diagnostics;
using System.Text.RegularExpressions;
using BaconReader.E2E.Infrastructure.Device;

namespace BaconReader.E2E.Infrastructure.Steps;

/// <summary>
/// Marks in a scenario's recording when each line of its Gherkin plays (<see cref="ScreenRecording.NoteLine"/>), for the
/// site's player to highlight it as the video passes it. A statement of the scenario starts when it asks BaseE2E for
/// <c>Phone</c> or <c>Reddit</c> (<see cref="NoteCaller"/>): its Given or When line is marked then. An assertion asks
/// for neither, so its Then line is marked once the scenario has gone past it: when the next statement starts, or when
/// the scenario ends. The scenario then stands still for <see cref="Hold"/> on each Then line, the screen it read on the
/// video, so each line is highlighted in turn. When the scenario fails, the line that failed is marked as failed: the
/// assertion its stack trace names, or else the line the last statement played or served.
/// <para>
/// With <see cref="IRecordedScreens"/>, each line shows on its own screen: the recording starts on the setup page, where
/// each Given line that sets up the fake holds once the page shows its result (<see cref="SetupHold"/>); once the app is
/// open, a When line that changes the fake shows the page before it plays and holds on its result, and each Then line
/// that checks what the fake saw (<see cref="FakeChecks"/>) holds on the page, which shows what the scenario read; the
/// app comes back for the next line on it.
/// </para>
/// </summary>
public sealed partial class GherkinMarking
{
    /// <summary>How long the recording stays on each Then line.</summary>
    public static readonly TimeSpan Hold = TimeSpan.FromMilliseconds(800);

    /// <summary>
    /// How long the recording stays on each line the setup page shows (<see cref="SetupPage"/>) when it can't say how much
    /// is new on it: the least <see cref="ReadingTime"/>.
    /// </summary>
    public static readonly TimeSpan SetupHold = TimeSpan.FromMilliseconds(1500);

    /// <summary>
    /// How long the recording stays on the setup page for its <paramref name="words"/> new words to be read: 1 s and
    /// 0.2 s a word, from <see cref="SetupHold"/> to 6 s.
    /// </summary>
    public static TimeSpan ReadingTime(int words) =>
        TimeSpan.FromSeconds(Math.Clamp(1 + 0.2 * words, SetupHold.TotalSeconds, 6));

    private readonly ScenarioSteps steps;
    private readonly ScreenRecording recording;
    private readonly Type scenario;
    private readonly IRecordedScreens? screens;

    // The last statement that started, an index in steps.Steps.
    private int reached = -1;

    // Whether the last statement set up the fake Reddit before the app opened: the next one waits for the setup page.
    private bool settingUp;

    // Whether the scenario asked for the phone yet: once it has, the app is open.
    private bool appOpened;

    // Whether the setup page is in front of the app: the recording starts on it.
    private bool onSetupPage = true;

    // Whether the last statement changed the fake once the app was open: the next one waits for the setup page.
    private bool showingChange;

    /// <summary>
    /// Marks the lines BaseE2E plays itself (<c>BaconReader is patched with …</c>) at <paramref name="started"/>, the
    /// recording's start (a <see cref="Stopwatch.GetTimestamp"/>), and the others as <paramref name="scenario"/>'s
    /// statements play them.
    /// </summary>
    /// <param name="screens">The setup page and the app, for each line to show on its own; none, and every line plays on the app.</param>
    public GherkinMarking(ScenarioSteps steps, ScreenRecording recording, Type scenario, long started, IRecordedScreens? screens = null)
    {
        this.screens = screens;
        this.steps = steps;
        this.recording = recording;
        this.scenario = scenario;
        foreach (var line in steps.PlayedByBaseE2E)
        {
            recording.NoteLine(line, started, failed: false);
        }
    }

    /// <summary>
    /// Called when the scenario asks for <c>Phone</c> or <c>Reddit</c> (<paramref name="reddit"/>): if a new statement of
    /// it starts, holds on the Given line before it if that one set up the fake Reddit before the app opened, and on the
    /// Then lines whose assertions passed since the last one, then marks its own line.
    /// </summary>
    public void NoteCaller(bool reddit = false)
    {
        var index = FindStatement();
        if (index <= reached)
        {
            if (!reddit)
            {
                ShowApp();
            }

            return;
        }

        if (settingUp || showingChange)
        {
            Thread.Sleep(screens?.WaitUntilSetupPageShowsTheFake() ?? SetupHold);
        }

        Thread.Sleep(HoldOnPassed(AssertionsSince(index)));
        settingUp = reddit && !appOpened;
        showingChange = reddit && appOpened && steps.Steps[index].Plays is not null && screens is not null;
        if (showingChange)
        {
            ShowSetupPage();
        }
        else if (!reddit)
        {
            ShowApp();
            appOpened = true;
            onSetupPage = false;
        }

        reached = index;
        if (steps.Steps[index].Plays is { } line)
        {
            recording.NoteLine(line, Stopwatch.GetTimestamp(), failed: false);
        }
    }

    /// <summary>
    /// Called when the scenario ends, before its recording stops: holds on the Then lines whose assertions passed since
    /// its last statement started, and, when it failed with <paramref name="stackTraces"/>, marks the line that failed.
    /// </summary>
    public async Task EndAsync(bool passed, IReadOnlyList<string?> stackTraces)
    {
        var pending = AssertionsSince(steps.Steps.Length);
        var failed = stackTraces.SelectMany(trace => AssertionCall().Matches(trace ?? "")).Select(call => call.Groups[1].Value).ToHashSet();
        if (passed || stackTraces.Count == 0)
        {
            await Task.Delay(HoldOnPassed(pending));
            return;
        }

        var failing = pending.FindIndex(assertion => assertion.Names.Any(failed.Contains));
        if (failing < 0)
        {
            if (reached >= 0)
            {
                recording.NoteLine(steps.Steps[reached].FailsAs, Stopwatch.GetTimestamp(), failed: true);
                await Task.Delay(Hold);
            }

            return;
        }

        var held = HoldOnPassed([.. pending.Take(failing)]);
        if (screens is not null)
        {
            ShowTheScreenOf(pending[failing]);
        }

        recording.NoteLine(pending[failing].Line, Stopwatch.GetTimestamp() + Ticks(held), failed: true);
        await Task.Delay(held + Hold);
    }

    // Marks each of these Then lines Hold after the one before, from now, and says how long to stand still for them; with
    // the screens, stands still on each on its own screen (the setup page for a line about the fake), and says none.
    private TimeSpan HoldOnPassed(List<Assertion> passed)
    {
        if (screens is not null)
        {
            foreach (var assertion in passed)
            {
                var hold = ShowTheScreenOf(assertion);
                recording.NoteLine(assertion.Line, Stopwatch.GetTimestamp(), failed: false);
                Thread.Sleep(hold);
            }

            return TimeSpan.Zero;
        }

        var now = Stopwatch.GetTimestamp();
        for (var at = 0; at < passed.Count; at++)
        {
            recording.NoteLine(passed[at].Line, now + Ticks(Hold * at), failed: false);
        }

        return Hold * passed.Count;
    }

    // A Then line about the fake on the setup page, once it shows what the scenario read, and how long to read it;
    // another on the app, Hold.
    private TimeSpan ShowTheScreenOf(Assertion assertion)
    {
        if (FakeChecks.IsAboutTheFake(assertion) && appOpened)
        {
            ShowSetupPage();
            return screens!.WaitUntilSetupPageShowsTheFake();
        }

        ShowApp();
        return Hold;
    }

    private void ShowSetupPage()
    {
        if (screens is not null && !onSetupPage)
        {
            screens.ShowSetupPage();
            onSetupPage = true;
        }
    }

    // The app back in front of the setup page, once it's open: before a statement on the phone.
    private void ShowApp()
    {
        if (screens is not null && onSetupPage && appOpened)
        {
            screens.ShowApp();
            onSetupPage = false;
        }
    }

    // The assertions of the statements between the last one that started and the one at `index`.
    private List<Assertion> AssertionsSince(int index) =>
        [.. steps.Steps.Skip(reached + 1).Take(index - reached - 1).SelectMany(step => step.Assertions)];

    // The statement of the scenario on the stack, by its line; -1 when the scenario isn't on it.
    private int FindStatement() => FindLine(scenario) is { } line ? steps.IndexOf(line) : -1;

    /// <summary>
    /// The line (1-based, in its file) of the first frame of <paramref name="scenario"/>'s code on the stack: its method,
    /// or the async state machine the compiler made of it; none when it isn't on the stack.
    /// </summary>
    internal static int? FindLine(Type scenario) =>
        new StackTrace(fNeedFileInfo: true).GetFrames()
            .Where(frame => frame.GetMethod()?.DeclaringType is { } type && (type == scenario || type.DeclaringType == scenario))
            .Select(frame => frame.GetFileLineNumber())
            .FirstOrDefault(line => line > 0) is var found and > 0 ? found : null;

    private static long Ticks(TimeSpan time) => (long)(time.TotalSeconds * Stopwatch.Frequency);

    // An assertion in a stack trace: "at …ScreenSnapshotAssertions.ShowsThePost(AssertingThat`1 that, …)".
    [GeneratedRegex(@"SnapshotAssertions\.(\w+)\(")]
    private static partial Regex AssertionCall();
}
