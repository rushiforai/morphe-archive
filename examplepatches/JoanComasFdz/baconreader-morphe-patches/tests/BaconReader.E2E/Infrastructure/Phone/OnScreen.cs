// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Diagnostics;
using System.Drawing;
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

    // When each driver's last step ended (one scenario at a time on a driver, its steps one after another).
    private static readonly ConditionalWeakTable<AndroidDriver, Stopwatch> SinceLastStep = [];

    // The recording that draws each driver's taps (the scenario's that is playing on it, when it records).
    private static readonly ConditionalWeakTable<AndroidDriver, ScreenRecording> TapsDrawnOn = [];

    // The view the last wait found on each driver, with the locator it found it with (Waiting.UntilShownAsync): the step
    // right after it, on the same locator, taps it without finding it again, one round trip (~0.25 s) less. A run of
    // the LoggedIn scenarios found a view again right after its wait 334 times (2026-11-07). Any other step drops it.
    private static readonly ConditionalWeakTable<AndroidDriver, Found> HandedOver = [];

    private sealed record Found(By Target, IWebElement View);

    private static bool Recording => E2EDevice.VideoDirectory is not null;

    /// <summary>Has <paramref name="recording"/> draw the taps <paramref name="driver"/> makes from now on.</summary>
    public static void DrawTapsOn(AndroidDriver driver, ScreenRecording recording) => TapsDrawnOn.AddOrUpdate(driver, recording);

    /// <summary>
    /// Forgets <paramref name="driver"/>'s scenario once it ends: its recording and its last step. The next scenario
    /// plays on the same driver (<see cref="BaseE2E"/>).
    /// </summary>
    public static void ForgetScenarioOn(AndroidDriver driver)
    {
        TapsDrawnOn.Remove(driver);
        SinceLastStep.Remove(driver);
        HandedOver.Remove(driver);
    }

    /// <summary>
    /// Hands the next step <paramref name="view"/>, which a wait just found with <paramref name="target"/>: a tap on
    /// <paramref name="target"/> right after takes it instead of finding it again. Not while recording: the ring asks the
    /// view for its bounds first, and a recording isn't run for speed.
    /// </summary>
    internal static void HandOver(AndroidDriver driver, By target, IWebElement view)
    {
        if (!Recording)
        {
            HandedOver.AddOrUpdate(driver, new Found(target, view));
        }
    }

    /// <summary>
    /// Taps the one element <paramref name="target"/> finds, at its center, after the recording has shown where for
    /// <see cref="TapShown"/>.
    /// </summary>
    public static Task PressAsync(AndroidDriver driver, By target) => TouchAsync(driver, target, element => element.Click());

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

    /// <summary>
    /// Taps at the point <paramref name="find"/> returns (the center of a view of a <see cref="ScreenSnapshot"/>), as
    /// <see cref="PressAsync(AndroidDriver, By)"/> does: no round trip to find the view, and none to ask its bounds.
    /// </summary>
    public static Task PressAtAsync(AndroidDriver driver, Func<Point> find) =>
        TouchAtAsync(driver, find, point => driver.ExecuteScript("mobile: clickGesture", new Dictionary<string, object>
        {
            ["x"] = point.X,
            ["y"] = point.Y,
        }));

    /// <summary>
    /// Touches at the point <paramref name="find"/> returns with <paramref name="touch"/> (a long press, a swipe from
    /// there), after the recording has shown where for <see cref="TapShown"/>: its ring stays until the touch ends.
    /// </summary>
    public static async Task TouchAtAsync(AndroidDriver driver, Func<Point> find, Action<Point> touch)
    {
        await WaitForActionGapAsync(driver);
        var point = await Task.Run(find);
        if (TapsDrawnOn.TryGetValue(driver, out var recording))
        {
            var shown = Stopwatch.GetTimestamp();
            await Task.Delay(TapShown);
            await Task.Run(() => touch(point));
            recording.NoteTap(point.X, point.Y, shown, Stopwatch.GetTimestamp());
        }
        else
        {
            await Task.Run(() => touch(point));
        }

        NoteStepEnded(driver);
    }

    /// <summary>Does <paramref name="act"/> on the one element <paramref name="target"/> finds.</summary>
    public static async Task ActAsync(AndroidDriver driver, By target, Action<IWebElement> act)
    {
        var handed = TakeHandedOver(driver, target);
        await WaitForActionGapAsync(driver);
        await Task.Run(() => OnFound(driver, target, handed, act));
        NoteStepEnded(driver);
    }

    // A touch on the view target finds: the one handed over, if any, else found now.
    private static Task TouchAsync(AndroidDriver driver, By target, Action<IWebElement> touch)
    {
        var handed = TakeHandedOver(driver, target);
        return TouchAsync(driver, () => handed ?? driver.FindElement(target), element =>
        {
            if (element == handed)
            {
                OnFound(driver, target, handed, touch);
            }
            else
            {
                touch(element);
            }
        });
    }

    // Does act on the view handed over, or on the one target finds when none was or it has gone since (the screen
    // redrew it): then on the new one.
    private static void OnFound(AndroidDriver driver, By target, IWebElement? handed, Action<IWebElement> act)
    {
        if (handed is not null)
        {
            try
            {
                act(handed);
                return;
            }
            catch (StaleElementReferenceException)
            {
                RunLog.RetryFired("OnScreen: the view a wait found went stale, found again", 1, target.ToString());
            }
        }

        act(driver.FindElement(target));
    }

    /// <summary>
    /// Whether two locators find the same views: the same kind and the same text. Appium's own locators don't compare
    /// what they look for: two UiSelectors were Equal, and a tap on "Not now" tapped the dialog's title a wait had found.
    /// </summary>
    internal static bool SameLocator(By one, By other) =>
        one.GetType() == other.GetType() && one.ToString() == other.ToString();

    private static IWebElement? TakeHandedOver(AndroidDriver driver, By target)
    {
        var handed = HandedOver.TryGetValue(driver, out var found) && SameLocator(found.Target, target) ? found.View : null;
        HandedOver.Remove(driver);
        return handed;
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
    /// button at the end of a web page), and back the other way each time it can't scroll further.
    /// </summary>
    public static async Task ScrollToAsync(AndroidDriver driver, By scrollable, By target, string what)
    {
        await WaitForActionGapAsync(driver);
        // Down first, then up once the list can't scroll further down: the target may be above the screen. Then down again
        // once it can't scroll further up: on the Pixel 6 Pro the Front Page jumped back to its top right after the login,
        // in 1 run of 5 of Fix Reddit links' first step (2026-11-03), and a swipe during the jump couldn't scroll.
        var direction = "down";
        IWebElement? shown;
        for (var screens = 0; (shown = await Task.Run(() => ShownOnScreen(driver, target))) is null; screens++)
        {
            if (screens == 20)
            {
                throw new InvalidOperationException($"{what} wasn't on the screen after scrolling 20 screens down and up.");
            }

            var canScrollMore = await Task.Run(() => driver.ExecuteScript("mobile: scrollGesture", new Dictionary<string, object>
            {
                ["elementId"] = ((OpenQA.Selenium.Appium.AppiumElement)driver.FindElement(scrollable)).Id,
                ["direction"] = direction,
                ["percent"] = 0.75,
            }));
            if (canScrollMore is false)
            {
                if (direction == "up")
                {
                    RunLog.RetryFired("OnScreen.ScrollToAsync: scrolling down again from the top", screens + 1, what);
                }

                direction = direction == "down" ? "up" : "down";
            }
        }

        NoteStepEnded(driver);
        HandOver(driver, target, shown);
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
        HandedOver.Remove(driver);
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

    private static IWebElement? ShownOnScreen(AndroidDriver driver, By target) =>
        driver.FindElements(target).FirstOrDefault(element => element.Displayed && element.Size.Height > 0);

    private static void NoteStepEnded(AndroidDriver driver) => SinceLastStep.AddOrUpdate(driver, Stopwatch.StartNew());
}
