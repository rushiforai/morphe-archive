// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Posts;

/// <summary>
/// "Flair filter": a "Flair" button in the sort bar of a subreddit (not of the Front Page, All or Popular) lists the
/// subreddit's flairs, Reddit's list or, when Reddit keeps it private, the flairs of the posts loaded, and shows only
/// the posts with the flairs ticked, through a Reddit search in the subreddit.
/// </summary>
public sealed class FlairFilterTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Flair filter shows only the posts with the chosen flairs
          Given Reddit has a post "Weekly discussion" in r/e2e with the flair "Discussion"
          And Reddit has a post "Release news" in r/e2e with the flair "News"
          And Reddit has a post "No flair here" in r/e2e
          And r/e2e lets users choose the flairs "Discussion", "News" and "Meta"
          And Reddit has a post "Ask anything" in r/quiet with the flair "Question"
          And Reddit has a post "Nothing to see" in r/plain
          And BaconReader is patched with every patch
          And BaconReader is open
          And the test account is logged in
          When I select the "Front Page" feed
          Then the sort bar shows no "Flair"
          When I select the "All" feed
          Then the sort bar shows no "Flair"
          When I select the "Popular" feed
          Then the sort bar shows no "Flair"
          When I select the "e2e" feed
          Then the sort bar shows "Flair"
          When I tap "Flair" in the sort bar
          # r/e2e's flairs, as Reddit lists them: no post has "Meta".
          Then "Show posts with flair" offers "Discussion", "News" and "Meta", none ticked
          When I tick "Discussion"
          And I tap "APPLY"
          Then the feed shows only the post "Weekly discussion" with the flair "Discussion"
          And the sort bar shows "Discussion"
          When I tap "Discussion" in the sort bar
          Then "Show posts with flair" offers "Discussion", "News" and "Meta", with "Discussion" ticked
          When I tick "News"
          And I tap "APPLY"
          Then the feed shows only the posts "Release news" with the flair "News" and "Weekly discussion" with the flair "Discussion"
          And the sort bar shows "Discussion, News"
          When I tap "Discussion, News" in the sort bar
          And I tap "CLEAR"
          Then the feed shows the posts "No flair here", "Release news" and "Weekly discussion"
          And the sort bar shows "Flair"
          When I select the "quiet" feed
          And I tap "Flair" in the sort bar
          # Reddit keeps r/quiet's flairs private: the list is the flairs of the posts BaconReader loaded.
          Then "Show posts with flair" offers "Question", none ticked
          When I tap "CANCEL"
          And I select the "plain" feed
          And I tap "Flair" in the sort bar
          Then "Show posts with flair" says "No flairs found yet. Scroll the subreddit to load posts with flairs, then try again."
        """)]
    public async Task FlairFilterShowsOnlyThePostsWithTheChosenFlairs(Screen screen)
    {
        // Given
        Reddit.HasAPostWithTheFlair("Weekly discussion", "e2e", "Discussion");
        Reddit.HasAPostWithTheFlair("Release news", "e2e", "News");
        Reddit.HasAPost("No flair here", "e2e");
        Reddit.TheSubredditLetsUsersChooseTheFlairs("e2e", "Discussion", "News", "Meta");
        Reddit.HasAPostWithTheFlair("Ask anything", "quiet", "Question");
        Reddit.HasAPost("Nothing to see", "plain");
        await Phone.BaconReader.OpenAsync();
        await Phone.BaconReader.LogInWithTheTestAccountAsync();

        // When
        await Phone.BaconReader.Main.Toolbar.SelectFeedAsync(new Feed.FrontPage());
        await Phone.BaconReader.Main.Toolbar.WaitUntilFeedShownAsync(new Feed.FrontPage());
        await Phone.BaconReader.Main.Posts.WaitUntilPostsShownAsync();

        // Then
        var frontPage = await Phone.BaconReader.Main.SortBar.ReadAsync();
        Asserting.That(frontPage).ShowsNoFlairFilter();

        // When
        await Phone.BaconReader.Main.Toolbar.SelectFeedAsync(new Feed.All());
        await Phone.BaconReader.Main.Toolbar.WaitUntilFeedShownAsync(new Feed.All());
        await Phone.BaconReader.Main.Posts.WaitUntilPostsShownAsync();

        // Then
        var all = await Phone.BaconReader.Main.SortBar.ReadAsync();
        Asserting.That(all).ShowsNoFlairFilter();

        // When
        await Phone.BaconReader.Main.Toolbar.SelectFeedAsync(new Feed.Popular());
        await Phone.BaconReader.Main.Toolbar.WaitUntilFeedShownAsync(new Feed.Popular());
        await Phone.BaconReader.Main.Posts.WaitUntilPostsShownAsync();

        // Then
        var popular = await Phone.BaconReader.Main.SortBar.ReadAsync();
        Asserting.That(popular).ShowsNoFlairFilter();

        // When
        await Phone.BaconReader.Main.Toolbar.SelectFeedAsync(new Feed.Subreddit("e2e"));
        await Phone.BaconReader.Main.Toolbar.WaitUntilFeedShownAsync(new Feed.Subreddit("e2e"));
        await Phone.BaconReader.Main.Posts.WaitUntilOnlyPostsShownAsync("Weekly discussion", "Release news", "No flair here");
        await Phone.BaconReader.Main.SortBar.WaitUntilFlairFilterShowsAsync("Flair");

        // Then
        var subreddit = await Phone.BaconReader.Main.SortBar.ReadAsync();
        Asserting.That(subreddit).ShowsFlairFilter("Flair");

        // When
        await Phone.BaconReader.Main.SortBar.ClickFlairFilterAsync();
        await Phone.BaconReader.FlairFilter.WaitUntilShownAsync();

        // Then
        // r/e2e's flairs, as Reddit lists them: no post has "Meta".
        var offered = await Phone.BaconReader.FlairFilter.ReadAsync();
        Asserting.That(offered).Offers("Discussion", "News", "Meta").Ticks();

        // When
        await Phone.BaconReader.FlairFilter.TickAsync("Discussion");
        await Phone.BaconReader.FlairFilter.ClickAsync(new FlairFilterButton.Apply());
        await Phone.BaconReader.Main.Posts.WaitUntilOnlyPostsShownAsync("Weekly discussion");
        await Phone.BaconReader.Main.SortBar.WaitUntilFlairFilterShowsAsync("Discussion");

        // Then
        var discussion = await Phone.BaconReader.Main.Posts.ReadAsync();
        var discussionBar = await Phone.BaconReader.Main.SortBar.ReadAsync();
        Asserting.That(discussion).ShowsOnlyThePosts(new ShownPost("Weekly discussion", "Discussion"));
        Asserting.That(discussionBar).ShowsFlairFilter("Discussion");

        // When
        await Phone.BaconReader.Main.SortBar.ClickFlairFilterAsync();
        await Phone.BaconReader.FlairFilter.WaitUntilShownAsync();

        // Then
        var ticked = await Phone.BaconReader.FlairFilter.ReadAsync();
        Asserting.That(ticked).Offers("Discussion", "News", "Meta").Ticks("Discussion");

        // When
        await Phone.BaconReader.FlairFilter.TickAsync("News");
        await Phone.BaconReader.FlairFilter.ClickAsync(new FlairFilterButton.Apply());
        await Phone.BaconReader.Main.Posts.WaitUntilOnlyPostsShownAsync("Release news", "Weekly discussion");
        await Phone.BaconReader.Main.SortBar.WaitUntilFlairFilterShowsAsync("Discussion, News");

        // Then
        var both = await Phone.BaconReader.Main.Posts.ReadAsync();
        var bothBar = await Phone.BaconReader.Main.SortBar.ReadAsync();
        Asserting.That(both).ShowsOnlyThePosts(new ShownPost("Release news", "News"), new ShownPost("Weekly discussion", "Discussion"));
        Asserting.That(bothBar).ShowsFlairFilter("Discussion, News");

        // When
        await Phone.BaconReader.Main.SortBar.ClickFlairFilterAsync();
        await Phone.BaconReader.FlairFilter.WaitUntilShownAsync();
        await Phone.BaconReader.FlairFilter.ClickAsync(new FlairFilterButton.Clear());
        await Phone.BaconReader.Main.Posts.WaitUntilOnlyPostsShownAsync("No flair here", "Release news", "Weekly discussion");
        await Phone.BaconReader.Main.SortBar.WaitUntilFlairFilterShowsAsync("Flair");

        // Then
        var cleared = await Phone.BaconReader.Main.Posts.ReadAsync();
        var clearedBar = await Phone.BaconReader.Main.SortBar.ReadAsync();
        Asserting.That(cleared).ShowsThePosts("No flair here", "Release news", "Weekly discussion");
        Asserting.That(clearedBar).ShowsFlairFilter("Flair");

        // When
        await Phone.BaconReader.Main.Toolbar.SelectFeedAsync(new Feed.Subreddit("quiet"));
        await Phone.BaconReader.Main.Toolbar.WaitUntilFeedShownAsync(new Feed.Subreddit("quiet"));
        await Phone.BaconReader.Main.Posts.WaitUntilOnlyPostsShownAsync("Ask anything");
        await Phone.BaconReader.Main.SortBar.ClickFlairFilterAsync();
        await Phone.BaconReader.FlairFilter.WaitUntilShownAsync();

        // Then
        // Reddit keeps r/quiet's flairs private: the list is the flairs of the posts BaconReader loaded.
        var seen = await Phone.BaconReader.FlairFilter.ReadAsync();
        Asserting.That(seen).Offers("Question").Ticks();

        // When
        await Phone.BaconReader.FlairFilter.ClickAsync(new FlairFilterButton.Cancel());
        await Phone.BaconReader.Main.Toolbar.SelectFeedAsync(new Feed.Subreddit("plain"));
        await Phone.BaconReader.Main.Toolbar.WaitUntilFeedShownAsync(new Feed.Subreddit("plain"));
        await Phone.BaconReader.Main.Posts.WaitUntilOnlyPostsShownAsync("Nothing to see");
        await Phone.BaconReader.Main.SortBar.ClickFlairFilterAsync();
        await Phone.BaconReader.FlairFilter.WaitUntilShownAsync();

        // Then
        var none = await Phone.BaconReader.FlairFilter.ReadAsync();
        Asserting.That(none).Says("No flairs found yet. Scroll the subreddit to load posts with flairs, then try again.");
    }
}
