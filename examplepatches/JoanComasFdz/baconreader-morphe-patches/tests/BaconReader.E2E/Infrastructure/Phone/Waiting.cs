// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Diagnostics;
using OpenQA.Selenium;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>The page objects' waits: until something the user would see is on the screen.</summary>
public static class Waiting
{
    // Each poll is a round trip to the phone (~0.2–0.4 s from a cloud session) already: a short pause between them.
    private static readonly TimeSpan Poll = TimeSpan.FromMilliseconds(100);

    /// <summary>Waits up to <paramref name="timeout"/> until <paramref name="shown"/> finds an element shown on the screen.</summary>
    public static async Task UntilShownAsync(AndroidDriver driver, By shown, TimeSpan timeout, string what)
    {
        if (await FindWithinAsync(driver, shown, timeout, what) is null)
        {
            throw new TimeoutException($"{what} wasn't shown within {timeout.TotalSeconds:0} s.");
        }
    }

    /// <summary>Waits up to <paramref name="timeout"/> until <paramref name="condition"/> holds on the screen.</summary>
    public static async Task UntilAsync(Func<bool> condition, TimeSpan timeout, string what)
    {
        var took = Stopwatch.StartNew();
        var stale = 0;
        while (!await Task.Run(() => Holds(condition, ref stale)))
        {
            if (took.Elapsed >= timeout)
            {
                Note(what, took.Elapsed, timeout, seen: false, stale);
                throw new TimeoutException($"{what} didn't happen within {timeout.TotalSeconds:0} s.");
            }

            await Task.Delay(Poll);
        }

        Note(what, took.Elapsed, timeout, seen: true, stale);
    }

    /// <summary>
    /// The first element shown that <paramref name="shown"/> finds within <paramref name="timeout"/>, or null: a wait for
    /// <paramref name="what"/>.
    /// </summary>
    public static async Task<IWebElement?> FindWithinAsync(AndroidDriver driver, By shown, TimeSpan timeout, string what)
    {
        var took = Stopwatch.StartNew();
        var stale = 0;
        do
        {
            var found = await Task.Run(() => FindShown(driver, shown, ref stale));
            if (found is not null)
            {
                Note(what, took.Elapsed, timeout, seen: true, stale);
                return found;
            }

            await Task.Delay(Poll);
        }
        while (took.Elapsed < timeout);

        Note(what, took.Elapsed, timeout, seen: false, stale);
        return null;
    }

    // UiAutomator2 finds only views on the screen (its allowInvisibleElements setting is off), so a view found is shown:
    // no second round trip to ask. A view that goes stale while it's read (a list or a web page redrawing) isn't shown
    // yet: the next poll finds the new one. On the Pixel 6 Pro a view went stale in 1 wait of 4 runs of every scenario
    // (2026-10-31: an image under a comment loading).
    private static IWebElement? FindShown(AndroidDriver driver, By shown, ref int stale)
    {
        try
        {
            return driver.FindElements(shown).FirstOrDefault();
        }
        catch (StaleElementReferenceException)
        {
            stale++;
            return null;
        }
    }

    // A view that goes stale while the condition reads it (a web page redrawing) doesn't hold it yet.
    private static bool Holds(Func<bool> condition, ref int stale)
    {
        try
        {
            return condition();
        }
        catch (StaleElementReferenceException)
        {
            stale++;
            return false;
        }
    }

    private static void Note(string what, TimeSpan took, TimeSpan timeout, bool seen, int stale)
    {
        RunLog.WaitTook(what, took, timeout, seen);
        if (stale > 0)
        {
            RunLog.RetryFired("Waiting: a view went stale, read again", stale, what);
        }
    }
}
