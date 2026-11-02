// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>The main screen's list of the feed's posts, under the toolbar and the sort bar.</summary>
public sealed class PostList(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By List = Locate.AppId("rv_links");
    private static readonly OpenQA.Selenium.By Title = Locate.AppId("title");
    private static readonly OpenQA.Selenium.By Message = Locate.AppId("errorText");
    private static readonly OpenQA.Selenium.By Card = Locate.AppId("card");
    private static readonly OpenQA.Selenium.By Points = Locate.AppId("points");

    // The message the list showed when last read: another feed's error stays shown while the next one loads.
    private string? messageBefore;

    /// <summary>Waits until the list shows a post (Reddit takes a moment to answer).</summary>
    public Task WaitUntilPostsShownAsync() =>
        Waiting.UntilShownAsync(driver, Title, TimeSpan.FromSeconds(10), "A post in the main screen's list");

    /// <summary>
    /// Waits until the list shows BaconReader's message instead of posts, when the feed failed to load: "Greetings! …
    /// BaconReader is no longer operational", or with "Show request errors" the request's error. A message the list
    /// showed when last read, another feed's, doesn't count.
    /// </summary>
    public Task WaitUntilMessageShownAsync() =>
        Waiting.UntilAsync(
            () => driver.FindElements(Message).FirstOrDefault(message => message.Displayed) is { } shown && shown.Text.Trim() != messageBefore,
            TimeSpan.FromSeconds(10),
            "BaconReader's message instead of the feed's posts");

    /// <summary>Taps the post titled <paramref name="title"/>, which opens it with its comments.</summary>
    public async Task ClickPostAsync(string title)
    {
        var post = Locate.AppIdWithText("title", title);
        await Waiting.UntilShownAsync(driver, post, TimeSpan.FromSeconds(10), $"The post \"{title}\" in the main screen's list");
        await OnScreen.PressAsync(driver, post);
    }

    /// <summary>
    /// What the list shows: the titles of the posts on the screen, top to bottom, or the message it shows instead of
    /// posts.
    /// </summary>
    public Task<PostListSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () =>
        {
            messageBefore = driver.FindElements(Message).FirstOrDefault(message => message.Displayed)?.Text.Trim();
            return new PostListSnapshot(
                [.. driver.FindElements(List).SelectMany(list => list.FindElements(Title)).Select(title => title.Text.Trim())],
                messageBefore);
        });

    /// <summary>What the post titled <paramref name="title"/> shows in the list: its points, between its vote arrows.</summary>
    public Task<PostSnapshot> ReadPostAsync(string title) =>
        OnScreen.ReadAsync(driver, () =>
        {
            var card = driver.FindElements(Card).FirstOrDefault(card => card.FindElements(Title).Any(shown => shown.Text.Trim() == title))
                ?? throw new InvalidOperationException($"The post \"{title}\" isn't on the screen.");
            return new PostSnapshot(title, card.FindElement(Points).Text.Trim());
        });
}

/// <summary>
/// What the list of posts shows: the titles of the posts on the screen, top to bottom, or the message it shows
/// instead of posts (null when it shows none).
/// </summary>
public sealed record PostListSnapshot(ImmutableArray<string> Titles, string? Message);

/// <summary>A post of the list: its title and its points, as shown.</summary>
public sealed record PostSnapshot(string Title, string Points);
