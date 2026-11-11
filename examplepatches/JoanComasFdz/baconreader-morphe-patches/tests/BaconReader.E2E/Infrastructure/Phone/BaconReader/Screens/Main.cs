// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>BaconReader's main screen (MainActivity): a feed of posts under its toolbar, and the left menu.</summary>
public sealed class Main(AndroidDriver driver, Action noteShown)
{
    private const string PostsListId = "rv_links";
    private const string MenuId = "drawerView";
    private static readonly OpenQA.Selenium.By PostsList = Locate.AppId(PostsListId);

    /// <summary>The bar at the top: the feed's name, Refresh, Search and More options.</summary>
    public Toolbar Toolbar { get; } = new(driver);

    /// <summary>The menu the toolbar's menu button opens: the account, then the app's screens.</summary>
    public LeftMenu LeftMenu { get; } = new(driver);

    /// <summary>The bar over the posts: their sort and, on a subreddit, "Flair filter".</summary>
    public FeedSortBar SortBar { get; } = new(driver);

    /// <summary>The feed's posts.</summary>
    public PostList Posts { get; } = new(driver);

    /// <summary>"Reddit chat"'s Chat, which shows in place of the posts.</summary>
    public ChatPage Chat { get; } = new(driver);

    /// <summary>
    /// Taps Android's Back, which closes this main screen when a link opened it over another screen, and goes back to
    /// that screen.
    /// </summary>
    public Task ClickBackAsync() => OnScreen.PressBackAsync(driver);

    /// <summary>
    /// Whether the main screen shows its posts, the left menu closed, within 3 s: a screen closing with Back takes a
    /// moment. Each look is one <see cref="ScreenSnapshot"/>.
    /// </summary>
    internal async Task<bool> ShowsThePostsAsync()
    {
        try
        {
            await Waiting.UntilAsync(() => ShowsThePosts(ScreenSnapshot.Take(driver)), TimeSpan.FromSeconds(3), "The main screen's posts");
            return true;
        }
        catch (TimeoutException)
        {
            return false;
        }
    }

    /// <summary>Whether the main screen shows its posts, the left menu closed, at this moment: one look, no wait.</summary>
    internal Task<bool> ShowsThePostsNowAsync() => Task.Run(() => ShowsThePosts(ScreenSnapshot.Take(driver)));

    private static bool ShowsThePosts(ScreenSnapshot screen) =>
        screen.WithAppId(PostsListId).Any(list => list.Displayed) && !screen.WithAppId(MenuId).Any(menu => menu.Displayed);

    /// <summary>Waits until the main screen is shown: its toolbar and the list its posts load into.</summary>
    public async Task WaitUntilShownAsync()
    {
        await Toolbar.WaitUntilShownAsync();
        await Waiting.UntilShownAsync(driver, PostsList, TimeSpan.FromSeconds(10), "The main screen's list of posts");
        noteShown();
    }
}
