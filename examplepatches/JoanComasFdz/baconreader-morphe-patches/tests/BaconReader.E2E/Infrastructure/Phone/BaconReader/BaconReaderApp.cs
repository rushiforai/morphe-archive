// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Vocabulary;
using OpenQA.Selenium.Appium.Android;
using OpenQA.Selenium.Appium.Android.Enums;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader;

/// <summary>
/// BaconReader on the phone, as the user sees it: one object per screen (an activity: Screens/) and per dialog it shows
/// (Dialogs/), named and nested as the app names and nests them. It knows the scenario's patches
/// (<see cref="PatchSet"/>: a Startup scenario's own, or every patch): they decide which dialogs opening it shows. <paramref name="noteAppShown"/> tells
/// BaseE2E when the main screen first shows (the run's startup time).
/// </summary>
public sealed class BaconReaderApp(
    AndroidDriver driver,
    Launcher launcher,
    PatchSet patches,
    Action noteAppShown)
{
    /// <summary>The dialog a fresh BaconReader shows first, unless "Disable final release announcement" is patched in.</summary>
    public FinalReleaseAnnouncement FinalReleaseAnnouncement { get; } = new(driver);

    /// <summary>The dialog "Prompt to open Reddit links" shows once: "Open Reddit links with BaconReader?".</summary>
    public OpenRedditLinksPrompt OpenRedditLinksPrompt { get; } = new(driver);

    /// <summary>The main screen (MainActivity): a feed of posts under the toolbar.</summary>
    public Main Main { get; } = new(driver, noteAppShown);

    /// <summary>The screen "Add account" opens: Reddit's login in a web view.</summary>
    public LogIn LogIn { get; } = new(driver);

    /// <summary>The screen a post opens on (DetailActivity): the post and its comments.</summary>
    public Detail Detail { get; } = new(driver);

    /// <summary>The inbox, which the left menu's "Inbox" opens.</summary>
    public Inbox Inbox { get; } = new(driver);

    /// <summary>The menu a message of the inbox opens when tapped.</summary>
    public MessageMenu MessageMenu { get; } = new(driver);

    /// <summary>The full-screen viewer a double tap on an image opens ("Embed comment images").</summary>
    public ImageViewer ImageViewer { get; } = new(driver);

    /// <summary>BaconReader's own screen for a link to an image.</summary>
    public PhotoViewer PhotoViewer { get; } = new(driver);

    /// <summary>BaconReader's settings (SettingsActivity): the menu of its sections.</summary>
    public Settings Settings { get; } = new(driver);

    /// <summary>The patches' settings, which "Patches" in BaconReader's settings opens.</summary>
    public PatchesSettings PatchesSettings { get; } = new(driver);

    /// <summary>
    /// Opens BaconReader on its main screen, as a scenario's "Given BaconReader … is open" says: opens it from the
    /// launcher, taps "GOT IT :(" on the final release announcement
    /// and "Not now" on the prompt to open Reddit links when its patches show them, and waits until the main screen is
    /// shown.
    /// </summary>
    public async Task OpenAsync()
    {
        await launcher.OpenBaconReaderAsync();
        if (!patches.Includes(Patch.DisableFinalReleaseAnnouncement))
        {
            await FinalReleaseAnnouncement.WaitUntilShownAsync();
            await FinalReleaseAnnouncement.ClickGotItAsync();
        }

        if (patches.Includes(Patch.PromptToOpenRedditLinks))
        {
            await OpenRedditLinksPrompt.WaitUntilShownAsync();
            await OpenRedditLinksPrompt.ClickNotNowAsync();
        }

        await Main.WaitUntilShownAsync();
    }

    /// <summary>
    /// Logs the test account in from the main screen, as a scenario's "Given the test account is logged in" says: "Add
    /// account" in the left menu, Reddit's "Log In" with the test account, "Accept", then closes the left menu BaconReader
    /// comes back with, and waits until the feed shows its posts. On the emulator the login screen at times closed by
    /// itself while its fields were filled in, and it started again from "Add account"; on the Pixel 6 Pro it never did
    /// in 4 runs of every scenario (2026-10-31), so it logs in once.
    /// </summary>
    public async Task LogInWithTheTestAccountAsync()
    {
        await Main.LeftMenu.OpenAsync();
        await Main.LeftMenu.WaitUntilShownAsync();
        await Main.LeftMenu.ClickAsync(new MenuEntry.AddAccount());
        await LogIn.WaitUntilShownAsync();
        await LogIn.TypeTheTestAccountsUserNameAsync();
        await LogIn.TypeTheTestAccountsPasswordAsync();
        await LogIn.ClickLogInAsync();
        await LogIn.WaitUntilConnectShownAsync();
        await LogIn.ClickAcceptAsync();
        await Main.WaitUntilShownAsync();
        await Main.LeftMenu.WaitUntilShownAsync();
        await Main.LeftMenu.CloseAsync();
        await Main.Posts.WaitUntilPostsShownAsync();
    }

    /// <summary>
    /// Goes back to the main screen's posts with Android's Back, as many times as it takes (from a post, from the
    /// settings and the left menu they were opened from), and waits until they show.
    /// </summary>
    public async Task GoBackToThePostsAsync()
    {
        for (var backs = 0; !await Main.ShowsThePostsAsync(); backs++)
        {
            if (backs == 8)
            {
                throw new InvalidOperationException("The main screen's posts didn't show after going back 8 times.");
            }

            await OnScreen.DoAsync(driver, () => driver.PressKeyCode(AndroidKeyCode.Back));
        }

        await Main.Posts.WaitUntilPostsShownAsync();
    }
}
