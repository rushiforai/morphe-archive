// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Vocabulary;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// The main screen's toolbar: the name of the feed shown, which opens the list of feeds, then Refresh, Search and More
/// options. It scrolls away with the posts and comes back on any scroll up (its layout's <c>scroll|enterAlways</c>):
/// after the list was scrolled down to a post, a tap on it first scrolls the posts up a little, as a user does.
/// </summary>
public sealed class Toolbar(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By Title = Locate.AppId("toolbarTitle");
    private static readonly OpenQA.Selenium.By MoreOptionsButton = Locate.Description("More options");
    private static readonly OpenQA.Selenium.By RefreshButton = Locate.Description("Refresh");
    private static readonly OpenQA.Selenium.By Posts = Locate.AppId("rv_links");

    /// <summary>The list of feeds the feed's name opens.</summary>
    public FeedList FeedList { get; } = new(driver);

    /// <summary>The menu "More options" opens.</summary>
    public OverflowMenu MoreOptions { get; } = new(driver);

    /// <summary>Waits until the toolbar shows a feed's name.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Title, TimeSpan.FromSeconds(10), "The main screen's toolbar");

    /// <summary>Selects <paramref name="feed"/>: taps the feed's name, then <paramref name="feed"/> in the list it opens.</summary>
    public async Task SelectFeedAsync(Feed feed)
    {
        await ClickFeedNameAsync();
        await FeedList.WaitUntilShownAsync();
        await FeedList.ClickAsync(feed);
    }

    /// <summary>Taps the feed's name, which opens the list of feeds.</summary>
    public async Task ClickFeedNameAsync()
    {
        await BringBackAsync(driver, Title, "The feed's name");
        await OnScreen.PressAsync(driver, Title);
    }

    /// <summary>Taps "More options", which opens its menu.</summary>
    public async Task ClickMoreOptionsAsync()
    {
        await BringBackAsync(driver, MoreOptionsButton, "\"More options\"");
        await OnScreen.PressAsync(driver, MoreOptionsButton);
    }

    /// <summary>Taps "Refresh", which loads the feed's posts again.</summary>
    public async Task ClickRefreshAsync()
    {
        await BringBackAsync(driver, RefreshButton, "\"Refresh\"");
        await OnScreen.PressAsync(driver, RefreshButton);
    }

    /// <summary>
    /// Scrolls the posts up a little when the toolbar's <paramref name="button"/> isn't shown, which brings the toolbar
    /// back, and waits until it shows. The left menu's button is the toolbar's too.
    /// </summary>
    internal static async Task BringBackAsync(AndroidDriver driver, OpenQA.Selenium.By button, string what)
    {
        if (await Task.Run(() => driver.FindElements(button).Any(shown => shown.Displayed)))
        {
            return;
        }

        await OnScreen.DoAsync(driver, () => OnScreen.ScrollGesture(driver, driver.FindElement(Posts), "up", 0.2));
        await Waiting.UntilShownAsync(driver, button, TimeSpan.FromSeconds(5), $"{what} in the toolbar");
    }

    /// <summary>Waits until the toolbar names <paramref name="feed"/>.</summary>
    public Task WaitUntilFeedShownAsync(Feed feed) =>
        Waiting.UntilShownAsync(driver, Locate.AppIdWithText("toolbarTitle", feed.ToShownText()), TimeSpan.FromSeconds(10), $"The toolbar naming the \"{feed.ToShownText()}\" feed");

    /// <summary>Whether the toolbar shows "Account colors"' line along its bottom.</summary>
    public Task<ToolbarLineSnapshot> ReadLineAsync() => ToolbarLine.ReadAsync(driver);

    /// <summary>What the toolbar shows: the feed it names, and its buttons.</summary>
    public Task<ToolbarSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new ToolbarSnapshot(FeedShowing.ReadFeed(driver.FindElement(Title).Text.Trim()))
        {
            Buttons = [.. ToolbarButtonShowing.Listed.Where(button => driver.FindElements(Locate.Description(button.ToShownText())).Any(shown => shown.Displayed))],
        });
}

/// <summary>What the toolbar shows: the feed it names, and its buttons, in its order.</summary>
public sealed record ToolbarSnapshot(Feed Feed)
{
    public System.Collections.Immutable.ImmutableArray<ToolbarButton> Buttons { get; init; } = [];
}
