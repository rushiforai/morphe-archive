// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.E2E.Infrastructure.Vocabulary;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// The list of feeds the toolbar's feed name opens: Front Page, All, Popular, Friends, then the account's subreddits.
/// </summary>
public sealed class FeedList(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By Entry = Locate.AppId("text");

    /// <summary>Waits until the list shows its first feed, "Front Page".</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Locate.AppIdWithText("text", new Feed.FrontPage().ToShownText()), TimeSpan.FromSeconds(10), "The toolbar's list of feeds");

    /// <summary>Taps <paramref name="feed"/>, which opens its posts.</summary>
    public Task ClickAsync(Feed feed) => OnScreen.PressAsync(driver, Locate.AppIdWithText("text", feed.ToShownText()));

    /// <summary>What the list shows: its feeds, top to bottom.</summary>
    public Task<FeedListSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new FeedListSnapshot(
            [.. driver.FindElements(Entry).Where(entry => entry.Displayed).Select(entry => FeedShowing.ReadFeed(entry.Text.Trim()))]));
}

/// <summary>What the toolbar's list of feeds shows: its feeds, top to bottom.</summary>
public sealed record FeedListSnapshot(ImmutableArray<Feed> Feeds);
