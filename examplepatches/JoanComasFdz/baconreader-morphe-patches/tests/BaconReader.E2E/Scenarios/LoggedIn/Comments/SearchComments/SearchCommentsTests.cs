// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Comments;

/// <summary>
/// "Search comments": a search button next to "COLLAPSE ALL" opens a find bar over a post's comments, which finds the
/// comments with a text or user name, also collapsed ones, counts and jumps between them, or shows only them; "SEARCH
/// ALL" first loads the comments behind "load more comments".
/// </summary>
public sealed class SearchCommentsTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Search comments finds comments by text and user name, also collapsed and not yet loaded ones
          Given Reddit has a post "Breakfast" in r/e2e
          And the post "Breakfast" has a comment "The bacon is crispy" by u/alice
          And the post "Breakfast" has a comment "I like eggs" by u/bob
          And the comment "I like eggs" has a reply "Bacon goes with eggs"
          And the post "Breakfast" has a comment "More bacon please" by u/carol
          And Reddit has a post "Long thread" in r/e2e
          And the post "Long thread" has 500 comments, "Comment 1" to "Comment 500"
          And the comment "Comment 2" has the replies "Reply 1 to Comment 2", "Reply 2 to Comment 2" and "Reply 3 to Comment 2"
          And BaconReader is patched with every patch
          And BaconReader is open
          And the test account is logged in
          When I tap the post "Breakfast"
          Then "Search comments" sits right before "COLLAPSE ALL"
          When I tap "Search comments"
          And I type "bacon" in "Search comments"
          Then the search shows "1/3"
          When I tap "Next match"
          Then the search shows "2/3"
          And the comment "Bacon goes with eggs" shows
          When I tap "Show only matching comments"
          Then the comments are "The bacon is crispy", "Bacon goes with eggs" and "More bacon please", in this order
          When I tap "Show only matching comments"
          And I type "bob" in "Search comments"
          Then the search shows "1/1"
          And the comment "I like eggs" shows
          When I tap "Close search"
          And I tap "COLLAPSE ALL"
          Then the comment "I like eggs" shows "1 hidden comment"
          When I tap "Search comments"
          And I type "bacon" in "Search comments"
          # The reply hidden in the collapsed "I like eggs" counts too.
          Then the search shows "1/3"
          When I tap "Next match"
          Then the search shows "2/3"
          And the comment "Bacon goes with eggs" shows
          When I tap "Close search"
          And I go back to the posts
          And I tap the post "Long thread"
          And I tap "Search comments"
          And I type "Reply 3" in "Search comments"
          # Its replies are behind "load more comments (3 replies)", not loaded yet.
          Then the search shows "0/0"
          And the search offers "SEARCH ALL"
          When I tap "SEARCH ALL"
          Then the search shows "1/1"
          And the comment "Reply 3 to Comment 2" shows
        """)]
    public async Task SearchCommentsFindsCommentsByTextAndUserNameAlsoCollapsedAndNotYetLoadedOnes(Screen screen)
    {
        // Given
        Reddit.HasAPost("Breakfast", "e2e");
        Reddit.ThePost("Breakfast").HasACommentBy("The bacon is crispy", "alice");
        Reddit.ThePost("Breakfast").HasACommentBy("I like eggs", "bob");
        Reddit.ThePost("Breakfast").TheComment("I like eggs").HasAReply("Bacon goes with eggs");
        Reddit.ThePost("Breakfast").HasACommentBy("More bacon please", "carol");
        Reddit.HasAPost("Long thread", "e2e");
        Reddit.ThePost("Long thread").HasComments(500);
        Reddit.ThePost("Long thread").TheComment("Comment 2").HasTheReplies("Reply 1 to Comment 2", "Reply 2 to Comment 2", "Reply 3 to Comment 2");
        await Phone.BaconReader.OpenAsync();
        await Phone.BaconReader.LogInWithTheTestAccountAsync();

        // When
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Breakfast");
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("More bacon please");

        // Then
        var sortBar = await Phone.BaconReader.Detail.SortBar.ReadLayoutAsync();
        Asserting.That(sortBar).SearchSitsRightBeforeCollapseAll();

        // When
        await Phone.BaconReader.Detail.SortBar.ClickSearchCommentsAsync();
        await Phone.BaconReader.Detail.CommentSearch.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.CommentSearch.TypeAsync("bacon");
        await Phone.BaconReader.Detail.CommentSearch.WaitUntilSearchedAsync();

        // Then
        var bacon = await Phone.BaconReader.Detail.CommentSearch.ReadAsync();
        Asserting.That(bacon).ShowsTheCount("1/3");

        // When
        await Phone.BaconReader.Detail.CommentSearch.ClickNextMatchAsync();
        await Phone.BaconReader.Detail.CommentSearch.WaitUntilSearchedAsync();

        // Then
        var next = await Phone.BaconReader.Detail.CommentSearch.ReadAsync();
        var shown = await Phone.BaconReader.Detail.Comments.ReadShownAsync();
        Asserting.That(next).ShowsTheCount("2/3");
        Asserting.That(shown).ShowsTheComment("Bacon goes with eggs");

        // When
        await Phone.BaconReader.Detail.CommentSearch.ClickShowOnlyMatchingCommentsAsync();
        await Phone.BaconReader.Detail.CommentSearch.WaitUntilSearchedAsync();

        // Then
        var matching = await Phone.BaconReader.Detail.Comments.ReadShownAsync();
        Asserting.That(matching).ShowsTheComments("The bacon is crispy", "Bacon goes with eggs", "More bacon please");

        // When
        await Phone.BaconReader.Detail.CommentSearch.ClickShowOnlyMatchingCommentsAsync();
        await Phone.BaconReader.Detail.CommentSearch.TypeAsync("bob");
        await Phone.BaconReader.Detail.CommentSearch.WaitUntilSearchedAsync();

        // Then
        var bob = await Phone.BaconReader.Detail.CommentSearch.ReadAsync();
        var bobs = await Phone.BaconReader.Detail.Comments.ReadShownAsync();
        Asserting.That(bob).ShowsTheCount("1/1");
        Asserting.That(bobs).ShowsTheComment("I like eggs");

        // When
        await Phone.BaconReader.Detail.CommentSearch.ClickCloseSearchAsync();
        await Phone.BaconReader.Detail.CommentSearch.WaitUntilClosedAsync();
        await Phone.BaconReader.Detail.SortBar.ClickCollapseAllAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilCollapsedAsync("I like eggs");

        // Then
        var collapsed = await Phone.BaconReader.Detail.Comments.ReadCollapsedAsync("I like eggs");
        Asserting.That(collapsed).ShowsHidden("1 hidden comment");

        // When
        await Phone.BaconReader.Detail.SortBar.ClickSearchCommentsAsync();
        await Phone.BaconReader.Detail.CommentSearch.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.CommentSearch.TypeAsync("bacon");
        await Phone.BaconReader.Detail.CommentSearch.WaitUntilSearchedAsync();

        // Then
        // The reply hidden in the collapsed "I like eggs" counts too.
        var inCollapsed = await Phone.BaconReader.Detail.CommentSearch.ReadAsync();
        Asserting.That(inCollapsed).ShowsTheCount("1/3");

        // When
        await Phone.BaconReader.Detail.CommentSearch.ClickNextMatchAsync();
        await Phone.BaconReader.Detail.CommentSearch.WaitUntilSearchedAsync();

        // Then
        var nextInCollapsed = await Phone.BaconReader.Detail.CommentSearch.ReadAsync();
        var expanded = await Phone.BaconReader.Detail.Comments.ReadShownAsync();
        Asserting.That(nextInCollapsed).ShowsTheCount("2/3");
        Asserting.That(expanded).ShowsTheComment("Bacon goes with eggs");

        // When
        await Phone.BaconReader.Detail.CommentSearch.ClickCloseSearchAsync();
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Long thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilLoadMoreShownAsync("load more comments (3 replies)");
        await Phone.BaconReader.Detail.SortBar.ClickSearchCommentsAsync();
        await Phone.BaconReader.Detail.CommentSearch.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.CommentSearch.TypeAsync("Reply 3");
        await Phone.BaconReader.Detail.CommentSearch.WaitUntilSearchedAsync();

        // Then
        // Its replies are behind "load more comments (3 replies)", not loaded yet.
        var notLoaded = await Phone.BaconReader.Detail.CommentSearch.ReadAsync();
        Asserting.That(notLoaded).ShowsTheCount("0/0").OffersSearchAll();

        // When
        await Phone.BaconReader.Detail.CommentSearch.ClickSearchAllAsync();
        await Phone.BaconReader.Detail.CommentSearch.WaitUntilSearchedAsync();

        // Then
        var loaded = await Phone.BaconReader.Detail.CommentSearch.ReadAsync();
        var found = await Phone.BaconReader.Detail.Comments.ReadShownAsync();
        Asserting.That(loaded).ShowsTheCount("1/1");
        Asserting.That(found).ShowsTheComment("Reply 3 to Comment 2");
    }
}
