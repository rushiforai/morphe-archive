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

    /// <summary>The dialog "Select text" opens from a post's or a comment's menu.</summary>
    public SelectTextDialog SelectText { get; } = new(driver);

    /// <summary>"Show posts with flair", which the button of "Flair filter" in the sort bar opens.</summary>
    public FlairFilter FlairFilter { get; } = new(driver);

    /// <summary>"Color for &lt;user name&gt;", which an account's circle in the left menu opens ("Account colors").</summary>
    public AccountColorPicker AccountColorPicker { get; } = new(driver);

    /// <summary>The menu a message of the inbox opens when tapped.</summary>
    public MessageMenu MessageMenu { get; } = new(driver);

    /// <summary>The full-screen viewer a double tap on an image opens ("Embed comment images").</summary>
    public ImageViewer ImageViewer { get; } = new(driver);

    /// <summary>A comment's video in full screen ("Embed comment images").</summary>
    public VideoFullScreen VideoFullScreen { get; } = new(driver);

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
    /// shown; in a LoggedIn scenario, whose app starts logged in ("the test account is logged in", before it), until its
    /// feed shows its posts (<see cref="WaitUntilLoggedInFeedShownAsync"/>).
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
        if (patches is PatchSet.Every)
        {
            await WaitUntilLoggedInFeedShownAsync();
        }
    }

    /// <summary>
    /// Waits until the feed of the app that started logged in shows its posts.
    /// <para>
    /// Logged in at its start, BaconReader loads the Front Page and, as the test account has no subscriptions, subscribes
    /// it to every default subreddit, both at once. A Front Page loaded after the first subscription and before the one of
    /// the scenario's subreddit shows "No data": Reddit shows an account with subscriptions only theirs. On the Pixel 6 Pro
    /// that happened in 3 runs of 31 of Markdown editor's (2026-11-05), after a login through the screens. So on "No data"
    /// it taps "Refresh", as the user would, and the Front Page loads with every subscription.
    /// </para>
    /// </summary>
    private async Task WaitUntilLoggedInFeedShownAsync()
    {
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

            await OnScreen.PressBackAsync(driver);
            await Task.Delay(TimeSpan.FromSeconds(1));
        }
    }

    /// <summary>
    /// Goes back to the main screen's posts with Android's Back, as many times as it takes (from a post, from the
    /// settings and the left menu they were opened from), and waits until they show. It looks once before the first
    /// Back, without waiting: on a post's comments, waiting there for the posts only ran out its 3 s, 63 times in a run
    /// of Embed comment images. From a patches' settings page it takes 5 Backs (the patches' settings, BaconReader's
    /// settings with its "Restart to apply changes?" dialog, the dialog, the main screen with the left menu open, the
    /// menu), and the phone can let a Back go by while a screen changes: once, 8 Backs didn't get there (2026-11-07).
    /// It looks before each Back, so the Backs it has to spare never go past the posts.
    /// </summary>
    public async Task GoBackToThePostsAsync()
    {
        const int MostBacks = 12;
        for (var backs = 0; !(backs == 0 ? await Main.ShowsThePostsNowAsync() : await Main.ShowsThePostsAsync()); backs++)
        {
            if (backs == MostBacks)
            {
                throw new InvalidOperationException($"The main screen's posts didn't show after going back {MostBacks} times.");
            }

            await OnScreen.PressBackAsync(driver);
        }

        await Main.Posts.WaitUntilPostsShownAsync();
    }
}
