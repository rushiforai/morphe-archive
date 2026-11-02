// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;

/// <summary>
/// "Open Reddit links with BaconReader?", the dialog the "Prompt to open Reddit links" patch shows on the main screen while
/// no Reddit link opens in BaconReader, until it is answered: "Set up" opens Android's "Open by default" settings, "Not
/// now" closes it, and so does Back.
/// </summary>
public sealed class OpenRedditLinksPrompt(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By Title = Locate.Text("Open Reddit links with BaconReader?");
    private static readonly OpenQA.Selenium.By SetUp = Locate.Text("Set up");
    private static readonly OpenQA.Selenium.By NotNow = Locate.Text("Not now");

    // Its buttons: the bundle's branded dialog draws them as texts, not as Android's buttons.
    private static readonly OpenQA.Selenium.By[] Buttons = [NotNow, SetUp];

    /// <summary>Waits until the dialog is shown.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Title, TimeSpan.FromSeconds(10), "The \"Open Reddit links with BaconReader?\" dialog");

    /// <summary>
    /// Waits, once the main screen shows, as long as the dialog would take to show over it (5 s: the patch asks 1.5 s
    /// after the main screen resumes, and 0.6 s after another dialog closes), for one that should never come: it ends
    /// sooner when it does, for the check to say so.
    /// </summary>
    public async Task WaitUntilNotShownAsync() =>
        await Waiting.FindWithinAsync(driver, Title, TimeSpan.FromSeconds(5), "The \"Open Reddit links with BaconReader?\" dialog, which shouldn't show");

    /// <summary>Taps "Set up": Android's "Open by default" settings for BaconReader open.</summary>
    public Task ClickSetUpAsync() => OnScreen.PressAsync(driver, SetUp);

    /// <summary>Taps "Not now", which closes the dialog.</summary>
    public Task ClickNotNowAsync() => OnScreen.PressAsync(driver, NotNow);

    /// <summary>Whether the dialog is on the screen, and its buttons, left to right.</summary>
    public Task<OpenRedditLinksPromptSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () =>
        {
            if (driver.FindElements(Title).Count == 0)
            {
                return new OpenRedditLinksPromptSnapshot(false, []);
            }

            var buttons = Buttons
                .SelectMany(button => driver.FindElements(button))
                .OrderBy(button => button.Location.X)
                .Select(button => button.Text.Trim());
            return new OpenRedditLinksPromptSnapshot(true, [.. buttons]);
        });
}

/// <summary>Whether "Open Reddit links with BaconReader?" is on the screen, and its buttons, left to right.</summary>
public sealed record OpenRedditLinksPromptSnapshot(bool Shown, ImmutableArray<string> Buttons);
