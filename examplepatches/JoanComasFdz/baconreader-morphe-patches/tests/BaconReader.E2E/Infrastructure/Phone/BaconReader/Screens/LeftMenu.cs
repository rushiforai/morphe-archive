// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.E2E.Infrastructure.Vocabulary;
using OpenQA.Selenium.Appium.Android;
using OpenQA.Selenium.Appium.Android.Enums;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// The main screen's left menu, which the toolbar's menu button opens: "Add account" or the user name logged in, then the
/// account's entries (Profile, Inbox…) and the app's (Subreddit, Settings…).
/// </summary>
public sealed class LeftMenu(AndroidDriver driver)
{
    // "Navigate up", and while it shows the orange envelope of unread messages, "Navigate up, orange envelope" (from
    // the test-only "E2E inbox envelope label").
    private static readonly OpenQA.Selenium.By MenuButton = Locate.DescriptionStartingWith("Navigate up");
    private const string EnvelopeLabel = ", orange envelope";
    private static readonly OpenQA.Selenium.By Menu = Locate.AppId("drawerView");
    private static readonly OpenQA.Selenium.By Entry = Locate.AppId("text");

    /// <summary>Opens the menu: taps the toolbar's menu button.</summary>
    public Task OpenAsync() => OnScreen.PressAsync(driver, MenuButton);

    /// <summary>
    /// Waits until the menu is shown, slid all the way in (where it is no longer changes from one look to the next): a
    /// tap while it still slides lands where its entry is no more.
    /// </summary>
    public Task WaitUntilShownAsync()
    {
        System.Drawing.Rectangle? last = null;
        return Waiting.UntilAsync(
            () =>
            {
                var shown = driver.FindElements(Menu).FirstOrDefault(menu => menu.Displayed);
                var now = shown is null ? (System.Drawing.Rectangle?)null : new System.Drawing.Rectangle(shown.Location, shown.Size);
                var settled = now is not null && now == last;
                last = now;
                return settled;
            },
            TimeSpan.FromSeconds(10),
            "The main screen's left menu sliding in");
    }

    /// <summary>
    /// Taps <paramref name="entry"/>, which opens what it names over the menu. On the emulator BaconReader at times ignored
    /// the tap, and a tap again 20 s later opened it; on the Pixel 6 Pro no tap was ignored in 4 runs of every scenario
    /// (2026-10-31), so it taps once.
    /// </summary>
    public Task ClickAsync(MenuEntry entry) => OnScreen.PressAsync(driver, Locate.AppIdWithText("text", entry.ToShownText()));

    /// <summary>Closes the menu, as Android's Back does.</summary>
    public Task CloseAsync() => OnScreen.DoAsync(driver, () => driver.PressKeyCode(AndroidKeyCode.Back));

    /// <summary>
    /// What the button that opens the menu shows: the orange envelope while there are unread messages, otherwise the menu
    /// icon. UiAutomator can't tell the two images apart; the test-only "E2E inbox envelope label" names the envelope in
    /// the button's description.
    /// </summary>
    public Task<LeftMenuButtonSnapshot> ReadButtonAsync() =>
        OnScreen.ReadAsync(driver, () => new LeftMenuButtonSnapshot(
            driver.FindElement(MenuButton).GetAttribute("content-desc")?.EndsWith(EnvelopeLabel, StringComparison.Ordinal) == true));

    /// <summary>What the menu shows: its entries, top to bottom.</summary>
    public Task<LeftMenuSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new LeftMenuSnapshot(
            [.. driver.FindElement(Menu).FindElements(Entry).Select(entry => MenuEntryShowing.ReadMenuEntry(entry.Text.Trim()))]));
}

/// <summary>What the toolbar's button that opens the left menu shows: the orange envelope of unread messages, or the menu icon.</summary>
public sealed record LeftMenuButtonSnapshot(bool ShowsTheOrangeEnvelope);

/// <summary>What the left menu shows: its entries, top to bottom.</summary>
public sealed record LeftMenuSnapshot(ImmutableArray<MenuEntry> Entries);
