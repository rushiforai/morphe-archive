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

    /// <summary>A user's profile (ProfileActivity), which a link to the user opens.</summary>
    public Profile Profile { get; } = new(driver);

    /// <summary>The inbox, which the left menu's "Inbox" opens.</summary>
    public Inbox Inbox { get; } = new(driver);

    /// <summary>The menu a post's or a comment's ⋮ opens.</summary>
    public PostMenu PostMenu { get; } = new(driver);

    /// <summary>"Show posts with flair", which the button of "Flair filter" in the sort bar opens.</summary>
    public FlairFilter FlairFilter { get; } = new(driver);

    /// <summary>The menu a message of the inbox opens when tapped.</summary>
    public MessageMenu MessageMenu { get; } = new(driver);

    /// <summary>The full-screen viewer a double tap on an image opens ("Embed comment images").</summary>
    public ImageViewer ImageViewer { get; } = new(driver);

    /// <summary>BaconReader's own screen for a link to an image.</summary>
    public PhotoViewer PhotoViewer { get; } = new(driver);

    /// <summary>The screen a post's thumbnail opens in the list view: its media, or its web page.</summary>
    public MediaViewer MediaViewer { get; } = new(driver);

    /// <summary>The Imgur album viewer (ImgurGalleryViewer), which an Imgur album post's link opens.</summary>
    public ImgurGalleryViewer ImgurGalleryViewer { get; } = new(driver);

    /// <summary>The drawing screen (DrawChat), which "Draw" in "Attach media" opens.</summary>
    public DrawChat DrawChat { get; } = new(driver);

    /// <summary>The meme templates' grid, which "Memes" in the drawing screen's "Choose" dialog opens.</summary>
    public MemeTemplates MemeTemplates { get; } = new(driver);

    /// <summary>The post's screen in its "Slide Show View": a link post's page.</summary>
    public SlideShow SlideShow { get; } = new(driver);

    /// <summary>"Submit a Post", which "Submit post" in the left menu opens.</summary>
    public SubmitPost SubmitPost { get; } = new(driver);

    /// <summary>"Where do you want to save?", which "Save" in the media viewer's "More options" opens.</summary>
    public WhereToSave WhereToSave { get; } = new(driver);

    /// <summary>"Image storage location", which asks for a folder the first time media is saved to the device.</summary>
    public ImageStorageLocation ImageStorageLocation { get; } = new(driver);

    /// <summary>The reply screen, "Post Comment", which "Comment" in a comment's action bar opens.</summary>
    public ReplyScreen ReplyScreen { get; } = new(driver);

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
    /// comes back with, and waits until the feed shows its posts.
    /// <para>
    /// Right after the login BaconReader loads the Front Page and, as the test account has no subscriptions, subscribes it
    /// to every default subreddit, both at once. A Front Page loaded after the first subscription and before the one of the
    /// scenario's subreddit shows "No data": Reddit shows an account with subscriptions only theirs. On the Pixel 6 Pro
    /// that happened in 3 runs of 31 of Markdown editor's (2026-11-05), and every subscription was answered within 0.4 s
    /// of the Front Page's request, 2 s before the left menu closes. So on "No data" it taps "Refresh", as the user would,
    /// and the Front Page loads with every subscription.
    /// </para>
    /// On the emulator the login screen at times closed by
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
        if (!await Main.Posts.WaitUntilPostsOrNoDataShownAsync())
        {
            RunLog.RetryFired("Log in: \"Refresh\" on the Front Page", 1, "it loaded while BaconReader subscribed the test account to the default subreddits, and shows \"No data\"");
            await Main.Toolbar.ClickRefreshAsync();
        }

        await Main.Posts.WaitUntilPostsShownAsync();
    }

    /// <summary>
    /// Goes back, Back after Back, until the main screen shows the chat's <paramref name="text"/>: from the settings, or
    /// from a post a chat link opened.
    /// </summary>
    public async Task GoBackToTheChatAsync(string text)
    {
        for (var backs = 0; !(await Main.Chat.ReadAsync()).Texts.Contains(text); backs++)
        {
            if (backs == 8)
            {
                throw new InvalidOperationException($"The chat didn't show \"{text}\" after going back 8 times.");
            }

            await OnScreen.DoAsync(driver, () => driver.PressKeyCode(AndroidKeyCode.Back));
            await Task.Delay(TimeSpan.FromSeconds(1));
        }
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
