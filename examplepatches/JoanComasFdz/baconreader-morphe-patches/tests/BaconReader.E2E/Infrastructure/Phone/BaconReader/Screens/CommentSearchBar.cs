// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Diagnostics;
using OpenQA.Selenium;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// The find bar "Search comments" opens over the sort bar: its field, the count of matches ("1/3", the current one of
/// all), "SEARCH ALL" while comments behind "load more comments" aren't loaded, and its buttons, named by their
/// descriptions. The patch names the field and the count <c>baconreader_patches_comment_search_field</c> and
/// <c>baconreader_patches_comment_search_count</c>. It searches a moment after the field changes.
/// </summary>
public sealed class CommentSearchBar(AndroidDriver driver)
{
    private static readonly By Field = Locate.AppId("baconreader_patches_comment_search_field");
    private static readonly By Count = Locate.AppId("baconreader_patches_comment_search_count");
    private static readonly By SearchAll = Locate.Text("SEARCH ALL");

    // How long the count has to stay the same to be the search's: the patch searches 0.3 s after the field changes.
    private static readonly TimeSpan Settled = TimeSpan.FromSeconds(1);

    /// <summary>Waits until the find bar shows its field.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Field, TimeSpan.FromSeconds(10), "The find bar's field, \"Search comments\"");

    /// <summary>Types <paramref name="text"/> in the field, instead of what it held.</summary>
    public Task TypeAsync(string text) =>
        OnScreen.ActAsync(driver, Field, field =>
        {
            field.Clear();
            field.SendKeys(text);
        });

    /// <summary>Taps "Next match", which moves to the next match and scrolls to its comment.</summary>
    public Task ClickNextMatchAsync() => OnScreen.PressAsync(driver, Locate.Description("Next match"));

    /// <summary>Taps "Show only matching comments", which switches between those and every comment.</summary>
    public Task ClickShowOnlyMatchingCommentsAsync() => OnScreen.PressAsync(driver, Locate.Description("Show only matching comments"));

    /// <summary>Taps "Close search", which closes the find bar.</summary>
    public Task ClickCloseSearchAsync() => OnScreen.PressAsync(driver, Locate.Description("Close search"));

    /// <summary>Taps "SEARCH ALL", which loads the comments behind "load more comments", then searches again.</summary>
    public Task ClickSearchAllAsync() => OnScreen.PressAsync(driver, SearchAll);

    /// <summary>Waits until the find bar is closed: the sort bar's "Search comments" shows again.</summary>
    public Task WaitUntilClosedAsync() =>
        Waiting.UntilAsync(() => driver.FindElements(Field).Count == 0, TimeSpan.FromSeconds(10), "The find bar closing");

    /// <summary>
    /// Waits until the search is done: the count shows, stays the same for a second, and "SEARCH ALL" isn't loading
    /// ("LOADING…").
    /// </summary>
    public Task WaitUntilSearchedAsync()
    {
        string? last = null;
        var since = Stopwatch.StartNew();
        return Waiting.UntilAsync(
            () =>
            {
                var count = driver.FindElements(Count).FirstOrDefault()?.Text ?? "";
                var loading = driver.FindElements(Locate.Text("LOADING…")).Count > 0;
                if (count != last || loading || count.Length == 0)
                {
                    last = count;
                    since.Restart();
                    return false;
                }

                return since.Elapsed >= Settled;
            },
            TimeSpan.FromSeconds(30),
            "The comment search finishing");
    }

    /// <summary>What the find bar shows: its count of matches, and whether it offers "SEARCH ALL".</summary>
    public Task<CommentSearchSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new CommentSearchSnapshot(
            driver.FindElement(Count).Text.Trim(),
            driver.FindElements(SearchAll).Count > 0));
}

/// <summary>What the find bar shows: its count of matches ("1/3"), and whether it offers "SEARCH ALL".</summary>
public sealed record CommentSearchSnapshot(string Count, bool OffersSearchAll);
