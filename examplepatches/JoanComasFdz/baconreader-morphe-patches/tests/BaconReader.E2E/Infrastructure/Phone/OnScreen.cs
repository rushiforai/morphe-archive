// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Diagnostics;
using System.Runtime.CompilerServices;
using BaconReader.E2E.Infrastructure.Device;
using OpenQA.Selenium;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>
/// Every Act and Read member of a page object goes through here (E2E-TEST-CODE-RULES.md, rule c), so the video shows
/// what the scenario does, one step at a time: when the run records, a step starts no sooner than
/// <see cref="E2EDevice.ActionGap"/> after the previous one ended (record.sh <c>--action-gap</c>), so the GIF doesn't tap
/// faster than the eye follows. A tap is shown before it happens: the recording draws a ring where it lands from
/// <see cref="TapShown"/> before the tap until just after it (<see cref="ScreenRecording.NoteTap"/>), so the video
/// shows what is tapped before the screen changes. Without a recording it goes on at once. Waits don't go through it.
/// </summary>
public static class OnScreen
{
    // How long a tap's ring is on the screen before the tap: ~6 of the GIF's 15 frames a second.
    private static readonly TimeSpan TapShown = TimeSpan.FromMilliseconds(400);

    // When each driver's last step ended (one driver per scenario, its steps one after another).
    private static readonly ConditionalWeakTable<AndroidDriver, Stopwatch> SinceLastStep = [];

    // The recording that draws each driver's taps (one per recorded scenario).
    private static readonly ConditionalWeakTable<AndroidDriver, ScreenRecording> TapsDrawnOn = [];

    private static bool Recording => E2EDevice.VideoDirectory is not null;

    /// <summary>Has <paramref name="recording"/> draw the taps <paramref name="driver"/> makes from now on.</summary>
    public static void DrawTapsOn(AndroidDriver driver, ScreenRecording recording) => TapsDrawnOn.AddOrUpdate(driver, recording);

    /// <summary>
    /// Taps the one element <paramref name="target"/> finds, at its center, after the recording has shown where for
    /// <see cref="TapShown"/>.
    /// </summary>
    public static Task PressAsync(AndroidDriver driver, By target) => TouchAsync(driver, () => driver.FindElement(target), element => element.Click());

    /// <summary>
    /// Taps the element <paramref name="find"/> returns (one that no locator finds alone: an image in a given comment),
    /// as <see cref="PressAsync(AndroidDriver, By)"/> does.
    /// </summary>
    public static Task PressAsync(AndroidDriver driver, Func<IWebElement> find) => TouchAsync(driver, find, element => element.Click());

    /// <summary>
    /// Touches the element <paramref name="find"/> returns with <paramref name="touch"/> (a double tap, a long press),
    /// after the recording has shown where for <see cref="TapShown"/>: its ring stays until the touch ends.
    /// </summary>
    public static async Task TouchAsync(AndroidDriver driver, Func<IWebElement> find, Action<IWebElement> touch)
    {
        await WaitForActionGapAsync(driver);
        var element = await Task.Run(find);
        if (TapsDrawnOn.TryGetValue(driver, out var recording))
        {
            // The ring's lead counts while its bounds come over the link: that round trip costs no time of its own.
            var shown = Stopwatch.GetTimestamp();
            var bounds = Task.Run(() => element.GetAttribute("bounds") ?? "");
            await Task.WhenAll(bounds, Task.Delay(TapShown));
            var (x, y) = Center(await bounds);
            await Task.Run(() => touch(element));
            recording.NoteTap(x, y, shown, Stopwatch.GetTimestamp());
        }
        else
        {
            await Task.Run(() => touch(element));
        }

        NoteStepEnded(driver);
    }

    /// <summary>Does <paramref name="act"/> on the one element <paramref name="target"/> finds.</summary>
    public static async Task ActAsync(AndroidDriver driver, By target, Action<IWebElement> act)
    {
        await WaitForActionGapAsync(driver);
        await Task.Run(() => act(driver.FindElement(target)));
        NoteStepEnded(driver);
    }

    /// <summary>Does <paramref name="act"/>, an action on the device rather than on a view (opening an app).</summary>
    public static async Task DoAsync(AndroidDriver driver, Action act)
    {
        await WaitForActionGapAsync(driver);
        await Task.Run(act);
        NoteStepEnded(driver);
    }

    /// <summary>
    /// Scrolls <paramref name="scrollable"/> down, a screen at a time, until <paramref name="target"/> is on the screen (a
    /// button at the end of a web page).
    /// </summary>
    public static async Task ScrollToAsync(AndroidDriver driver, By scrollable, By target, string what)
    {
        await WaitForActionGapAsync(driver);
        for (var screens = 0; !await Task.Run(() => IsOnScreen(driver, target)); screens++)
        {
            if (screens == 10)
            {
                throw new InvalidOperationException($"{what} wasn't on the screen after scrolling 10 screens down.");
            }

            await Task.Run(() => driver.ExecuteScript("mobile: scrollGesture", new Dictionary<string, object>
            {
                ["elementId"] = ((OpenQA.Selenium.Appium.AppiumElement)driver.FindElement(scrollable)).Id,
                ["direction"] = "down",
                ["percent"] = 0.75,
            }));
        }

        NoteStepEnded(driver);
    }

    /// <summary>
    /// Reads what the screen shows with <paramref name="read"/>. On the emulator a view read was at times replaced halfway
    /// (a feed still reloading), and it read again; on the Pixel 6 Pro no read went stale in 4 runs of every scenario
    /// (2026-10-31), the scenarios' waits having let the screen settle, so it reads once.
    /// </summary>
    public static async Task<T> ReadAsync<T>(AndroidDriver driver, Func<T> read)
    {
        await WaitForActionGapAsync(driver);
        var shown = await Task.Run(read);
        NoteStepEnded(driver);
        return shown;
    }

    private static async Task WaitForActionGapAsync(AndroidDriver driver)
    {
        if (Recording && SinceLastStep.TryGetValue(driver, out var since) && since.Elapsed < E2EDevice.ActionGap)
        {
            await Task.Delay(E2EDevice.ActionGap - since.Elapsed);
        }
    }

    // UiAutomator2's bounds, "[left,top][right,bottom]" in the screen's pixels: where its click lands.
    private static (int X, int Y) Center(string bounds)
    {
        var edges = bounds.Split(['[', ']', ','], StringSplitOptions.RemoveEmptyEntries)
            .Select(edge => int.Parse(edge, System.Globalization.CultureInfo.InvariantCulture))
            .ToArray();
        return ((edges[0] + edges[2]) / 2, (edges[1] + edges[3]) / 2);
    }

    private static bool IsOnScreen(AndroidDriver driver, By target) =>
        driver.FindElements(target).Any(element => element.Displayed && element.Size.Height > 0);

    private static void NoteStepEnded(AndroidDriver driver) => SinceLastStep.AddOrUpdate(driver, Stopwatch.StartNew());
}
