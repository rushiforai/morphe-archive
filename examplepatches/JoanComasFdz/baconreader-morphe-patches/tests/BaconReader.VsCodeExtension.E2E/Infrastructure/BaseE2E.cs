// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Diagnostics;
using System.Reflection;
using System.Text.Json;
using Microsoft.Playwright;
using Xunit.v3;

namespace BaconReader.VsCodeExtension.E2E.Infrastructure;

/// <summary>
/// Everything around a scenario that isn't the scenario (E2E-TEST-CODE-RULES.md, rule b):
/// - skips it unless <c>E2E_VSCODE_URL</c> points at VS Code for the web with the extension (tools/e2e/record.sh);
/// - one browser for the whole run (<see cref="BrowserRun"/>), a fresh context per scenario with its own storage, so
///   scenarios share nothing (VS Code keeps its state in the context's IndexedDB);
/// - a 1280×800 window with a mouse, its video the same size: the extension runs on a desktop (its scenarios are played
///   on <c>[PlayOnDesktop]</c> only, the app's on <c>[PlayOnPhone]</c>);
/// - GitHub, faked for the scenario (<see cref="Fakes.FakeGitHub"/>): its release starts empty, the scenario fills it;
/// - opens VS Code on a recorded page and waits until its workbench is shown, noting when, so record.sh trims the
///   loading screen off the video;
/// - when the run records (<c>E2E_VIDEO_DIR</c>): draws a big mouse pointer and a ring at each click
///   (<see cref="RecordingOverlay"/>), holds the workbench and the end on screen a moment, and saves the video, also when
///   the scenario fails, with its record next to it;
/// - gives the scenario its <see cref="Workbench"/> and its <see cref="GitHub"/>.
/// </summary>
public abstract class BaseE2E : IAsyncLifetime
{
    private static readonly TimeSpan ShownTimeout = TimeSpan.FromMinutes(3);
    private static readonly TimeSpan ActionTimeout = TimeSpan.FromSeconds(30);
    private static readonly TimeSpan Hold = TimeSpan.FromSeconds(2);
    private static readonly ViewportSize DesktopWindow = new() { Width = 1280, Height = 800 };

    private IBrowserContext? context;
    private IPage? page;
    private string? videoFolder;
    private readonly Stopwatch sinceOpened = new();
    private double? shownAt;
    private byte[]? shownScreenshot;
    private Screen screen;

    /// <summary>VS Code for the web as the user sees it, opened on Workspace/ with the extension.</summary>
    protected Workbench.Workbench Workbench { get; private set; } = null!;

    /// <summary>GitHub as the extension sees it: its release, prs-resources, filled by the scenario.</summary>
    protected Fakes.FakeGitHub GitHub { get; } = new();

    public async ValueTask InitializeAsync()
    {
        Assert.SkipWhen(E2EVsCode.Url is null, "E2E_VSCODE_URL isn't set: these scenarios need VS Code for the web with the extension (tools/e2e/record.sh).");

        var run = (BrowserRun)(await TestContext.Current.GetFixture(typeof(BrowserRun)))!;
        screen = ReadScreen();
        var browser = await run.OpenBrowserAsync();
        videoFolder = E2EVsCode.VideoDirectory is { } videos ? Path.Combine(videos, ".raw", Guid.NewGuid().ToString("N")) : null;
        context = await browser.NewContextAsync(new()
        {
            ViewportSize = DesktopWindow,
            RecordVideoDir = videoFolder,
            RecordVideoSize = videoFolder is null ? null : new RecordVideoSize { Width = DesktopWindow.Width, Height = DesktopWindow.Height },
        });
        context.SetDefaultTimeout((float)ActionTimeout.TotalMilliseconds);
        await GitHub.RouteAsync(context);
        if (videoFolder is not null)
        {
            await context.AddInitScriptAsync(RecordingOverlay.PointerScript + RecordingOverlay.TapRingScript);
        }

        // Started before the page (and its video). The video's clock runs behind it, so record.sh trims the video at the
        // first frame that looks like the screenshot taken when the workbench is noted (<name>.home.png; the e2e tool's find-home).
        sinceOpened.Start();
        page = await context.NewPageAsync();
        Workbench = new Workbench.Workbench(page);

        try
        {
            await page.GotoAsync(E2EVsCode.Url!);
            await Workbench.WaitUntilShownAsync(ShownTimeout);
        }
        catch (Exception)
        {
            // xunit doesn't dispose a test whose start failed: its video is saved here, as a failure.
            await CloseAsync(passed: false);
            throw;
        }

        shownAt = sinceOpened.Elapsed.TotalSeconds;
        TestContext.Current.SendDiagnosticMessage($"{DescribeScenario()}: workbench shown {shownAt:0.0} s after the page opened");
        if (videoFolder is not null)
        {
            shownScreenshot = await page.ScreenshotAsync();
            await Task.Delay(Hold);
        }
    }

    public async ValueTask DisposeAsync()
    {
        await CloseAsync(TestContext.Current.TestState?.Result == TestResult.Passed);
        GC.SuppressFinalize(this);
    }

    // Closes the context (once) and saves its video with the scenario's record.
    private async Task CloseAsync(bool passed)
    {
        if (context is null)
        {
            return;
        }

        var closing = context;
        context = null;
        if (videoFolder is not null && shownAt is not null)
        {
            await Task.Delay(Hold);
        }

        var video = page?.Video;
        await closing.CloseAsync();
        if (video is not null && E2EVsCode.VideoDirectory is { } videos)
        {
            await SaveRecordingAsync(videos, await video.PathAsync(), passed);
        }
    }

    // The screen the scenario's [PlayOnDesktop] row plays it on (its one argument).
    private static Screen ReadScreen() =>
        TestContext.Current.Test is IXunitTest { TestMethodArguments: [Screen played] } ? played : Screen.Desktop;

    private async Task SaveRecordingAsync(string videos, string rawVideo, bool passed)
    {
        var method = TestContext.Current.TestMethod?.MethodName ?? "unnamed";
        var gherkin = Gherkin.Read(GetType().GetMethod(method)?.GetCustomAttribute<TestDescriptionAttribute>()?.Gherkin ?? "");
        var domain = ScenarioNaming.ToDomainFolder(GetType());
        var gifName = ScenarioNaming.ToGifName(method, screen);
        var folder = Path.Combine(videos, domain);
        Directory.CreateDirectory(folder);
        File.Move(rawVideo, Path.Combine(folder, gifName + ".webm"), overwrite: true);
        var record = new ScenarioRecording(
            domain,
            GetType().Name,
            method,
            gherkin.Title.Length > 0 ? gherkin.Title : method,
            gherkin.Text,
            screen.ToString().ToLowerInvariant(),
            gifName,
            [],
            shownAt,
            passed);
        await File.WriteAllTextAsync(Path.Combine(folder, gifName + ".json"), JsonSerializer.Serialize(record, RecordingJson));
        if (shownScreenshot is not null)
        {
            await File.WriteAllBytesAsync(Path.Combine(folder, gifName + ".home.png"), shownScreenshot);
        }
    }

    private string DescribeScenario() => $"{GetType().Name}.{TestContext.Current.TestMethod?.MethodName} ({screen})";

    private static readonly JsonSerializerOptions RecordingJson = new() { WriteIndented = true, PropertyNamingPolicy = JsonNamingPolicy.CamelCase };
}
