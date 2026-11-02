// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Misc;

/// <summary>
/// "Show request errors": a failed Reddit request shows its actual error, such as "reddit: 404 Not Found", instead of
/// BaconReader's message that it stopped working in July 2023.
/// </summary>
public sealed class ShowRequestErrorsTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Show request errors shows why Reddit didn't send a feed's posts
          Given Reddit has a post "Behind an error" in r/broken
          And Reddit answers the posts of r/broken with "500 Internal Server Error"
          And Reddit has a post "Behind a refusal" in r/moderated
          And Reddit refuses the posts of r/moderated with "403 Forbidden", explaining "You need to be a moderator to do that"
          And Reddit has a post "Behind a dropped connection" in r/dropped
          And Reddit drops the connection when asked for the posts of r/dropped
          And BaconReader is patched with every patch
          And BaconReader is open
          And the test account is logged in
          When I tap the feed's name in the toolbar
          And I tap "broken" in the feed list
          Then the feed shows the error "reddit: 500 Internal Server Error"
          When I tap the feed's name in the toolbar
          And I tap "moderated" in the feed list
          # BaconReader shows Reddit's explanation instead of the status when Reddit sends one.
          Then the feed shows the error "reddit: You need to be a moderator to do that"
          When I tap the feed's name in the toolbar
          And I tap "dropped" in the feed list
          # No answer from Reddit: the error is the HTTP client's own.
          Then the feed shows the error "The target server failed to respond"
        """)]
    public async Task ShowRequestErrorsShowsWhyRedditDidntSendAFeedsPosts(Screen screen)
    {
        // Given
        Reddit.HasAPost("Behind an error", "broken");
        Reddit.AnswersThePostsWith("broken", "500 Internal Server Error");
        Reddit.HasAPost("Behind a refusal", "moderated");
        Reddit.RefusesThePostsWith("moderated", "403 Forbidden", "You need to be a moderator to do that");
        Reddit.HasAPost("Behind a dropped connection", "dropped");
        Reddit.DropsTheConnectionForThePosts("dropped");
        await Phone.BaconReader.OpenAsync();
        await Phone.BaconReader.LogInWithTheTestAccountAsync();

        // When
        await Phone.BaconReader.Main.Toolbar.ClickFeedNameAsync();
        await Phone.BaconReader.Main.Toolbar.FeedList.WaitUntilShownAsync();
        await Phone.BaconReader.Main.Toolbar.FeedList.ClickAsync(new Feed.Subreddit("broken"));
        await Phone.BaconReader.Main.Posts.WaitUntilMessageShownAsync();

        // Then
        var failed = await Phone.BaconReader.Main.Posts.ReadAsync();
        Asserting.That(failed).ShowsTheError("reddit: 500 Internal Server Error");

        // When
        await Phone.BaconReader.Main.Toolbar.ClickFeedNameAsync();
        await Phone.BaconReader.Main.Toolbar.FeedList.WaitUntilShownAsync();
        await Phone.BaconReader.Main.Toolbar.FeedList.ClickAsync(new Feed.Subreddit("moderated"));
        await Phone.BaconReader.Main.Posts.WaitUntilMessageShownAsync();

        // Then
        // BaconReader shows Reddit's explanation instead of the status when Reddit sends one.
        var refused = await Phone.BaconReader.Main.Posts.ReadAsync();
        Asserting.That(refused).ShowsTheError("reddit: You need to be a moderator to do that");

        // When
        await Phone.BaconReader.Main.Toolbar.ClickFeedNameAsync();
        await Phone.BaconReader.Main.Toolbar.FeedList.WaitUntilShownAsync();
        await Phone.BaconReader.Main.Toolbar.FeedList.ClickAsync(new Feed.Subreddit("dropped"));
        await Phone.BaconReader.Main.Posts.WaitUntilMessageShownAsync();

        // Then
        // No answer from Reddit: the error is the HTTP client's own.
        var dropped = await Phone.BaconReader.Main.Posts.ReadAsync();
        Asserting.That(dropped).ShowsTheError("The target server failed to respond");
    }
}
