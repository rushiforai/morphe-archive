// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Vocabulary;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// The main screen's toolbar: the name of the feed shown, which opens the list of feeds, then Refresh, Search and More
/// options.
/// </summary>
public sealed class Toolbar(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By Title = Locate.AppId("toolbarTitle");
    private static readonly OpenQA.Selenium.By MoreOptionsButton = Locate.Description("More options");

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
    public Task ClickFeedNameAsync() => OnScreen.PressAsync(driver, Title);

    /// <summary>Taps "More options", which opens its menu.</summary>
    public Task ClickMoreOptionsAsync() => OnScreen.PressAsync(driver, MoreOptionsButton);

    /// <summary>Waits until the toolbar names <paramref name="feed"/>.</summary>
    public Task WaitUntilFeedShownAsync(Feed feed) =>
        Waiting.UntilShownAsync(driver, Locate.AppIdWithText("toolbarTitle", feed.ToShownText()), TimeSpan.FromSeconds(10), $"The toolbar naming the \"{feed.ToShownText()}\" feed");

    /// <summary>What the toolbar shows: the feed it names.</summary>
    public Task<ToolbarSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new ToolbarSnapshot(FeedShowing.ReadFeed(driver.FindElement(Title).Text.Trim())));
}

/// <summary>What the toolbar shows: the feed it names.</summary>
public sealed record ToolbarSnapshot(Feed Feed);
