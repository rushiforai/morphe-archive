// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// "Submit a Post" (SubmitActivity), which "Submit post" in the left menu opens: a text post's title, its text in
/// "Message (Optional)", with "Markdown editor"'s formats and counter, and its subreddit in "Subreddit: r/".
/// </summary>
public sealed class SubmitPost(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By Title = Locate.AppIdWithText("toolbarTitle", "Submit a Post");
    private static readonly OpenQA.Selenium.By Subreddit = Locate.AppId("storySR");

    /// <summary>The post's text box, "Message (Optional)".</summary>
    public MarkdownEditor Editor { get; } = new(driver);

    /// <summary>Waits until the screen shows, its toolbar "Submit a Post".</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Title, TimeSpan.FromSeconds(10), "\"Submit a Post\"");

    /// <summary>Types <paramref name="subreddit"/> in "Subreddit: r/", in place of what it held.</summary>
    public Task TypeSubredditAsync(string subreddit) => OnScreen.ActAsync(driver, Subreddit, field => field.SendKeys(subreddit));
}
