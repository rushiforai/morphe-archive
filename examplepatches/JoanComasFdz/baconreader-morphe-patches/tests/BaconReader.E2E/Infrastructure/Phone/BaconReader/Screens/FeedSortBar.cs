// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// The main screen's bar over the posts: the feed's sort ("Best", "What's hot") and, on a subreddit, the button "Flair
/// filter" adds before the sort icon, which shows "Flair", or the flairs chosen ("Discussion, News"). The patch makes
/// that button and names it "Flair filter", or "Flair filter: &lt;the flairs chosen&gt;".
/// </summary>
public sealed class FeedSortBar(AndroidDriver driver)
{
    private const string FlairFilterDescription = "Flair filter";
    private static readonly OpenQA.Selenium.By FlairFilterButton = Locate.DescriptionStartingWith(FlairFilterDescription);

    /// <summary>Taps the button of "Flair filter", whatever it shows, which opens "Show posts with flair".</summary>
    public Task ClickFlairFilterAsync() => OnScreen.PressAsync(driver, FlairFilterButton);

    /// <summary>Waits until the button of "Flair filter" shows <paramref name="shown"/>: "Flair", or the flairs chosen.</summary>
    public Task WaitUntilFlairFilterShowsAsync(string shown) =>
        Waiting.UntilAsync(
            () => driver.FindElements(FlairFilterButton).Any(button => button.Displayed && button.Text.Trim() == shown),
            TimeSpan.FromSeconds(10),
            $"\"{shown}\" in the sort bar");

    /// <summary>What the bar shows of "Flair filter": its button's text, or null when it shows no such button.</summary>
    public Task<FeedSortBarSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new FeedSortBarSnapshot(
            driver.FindElements(FlairFilterButton).FirstOrDefault(button => button.Displayed)?.Text.Trim()));
}

/// <summary>What the main screen's sort bar shows of "Flair filter": its button's text (null without the button).</summary>
public sealed record FeedSortBarSnapshot(string? FlairFilter);
