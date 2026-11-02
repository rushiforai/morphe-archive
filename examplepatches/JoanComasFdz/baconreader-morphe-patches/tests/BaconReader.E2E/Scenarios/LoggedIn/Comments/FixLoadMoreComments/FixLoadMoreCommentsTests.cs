// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Reddit;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Comments;

/// <summary>
/// "Fix load more comments": Reddit refuses "load more comments" (api/morechildren) to apps since October 2026, so
/// BaconReader loads the hidden comments from their threads: a reply's from its parent comment's thread, the post's own
/// from each comment's thread, 50 at a time.
/// </summary>
public sealed class FixLoadMoreCommentsTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Fix load more comments loads the hidden comments from their threads when Reddit refuses "load more comments"
          Given Reddit has a post "Long thread" in r/e2e
          And the post "Long thread" has 560 comments, "Comment 1" to "Comment 560"
          And the comment "Comment 1" has the replies "Reply 1 to Comment 1" and "Reply 2 to Comment 1"
          And the comment "Comment 2" has the replies "Reply 1 to Comment 2", "Reply 2 to Comment 2" and "Reply 3 to Comment 2"
          And Reddit refuses "load more comments" with "403 Blocked", as it does to apps since October 2026
          And BaconReader is patched with every patch
          And BaconReader is open
          And the test account is logged in
          When I tap the post "Long thread"
          # "Up to 2 replies" of "Load more comments" loads them right after the post's comments.
          Then the comment "Comment 1" shows the replies "Reply 1 to Comment 1" and "Reply 2 to Comment 1"
          And the comment "Comment 2" shows "load more comments (3 replies)"
          When I tap "load more comments (3 replies)"
          Then the comment "Comment 2" shows the replies "Reply 1 to Comment 2", "Reply 2 to Comment 2" and "Reply 3 to Comment 2"
          # 500 comments come with the post; the other 60 load at the end of the list, 50 and then 10.
          When I scroll to the end of the comments
          Then the comments end with "Comment 560"
          # Not on the screen: the fake Reddit records what BaconReader sent.
          And Reddit refused every "load more comments" BaconReader asked for
        """)]
    public async Task FixLoadMoreCommentsLoadsTheHiddenCommentsFromTheirThreadsWhenRedditRefusesLoadMoreComments(Screen screen)
    {
        // Given
        Reddit.HasAPost("Long thread", "e2e");
        Reddit.ThePost("Long thread").HasComments(560);
        Reddit.ThePost("Long thread").TheComment("Comment 1").HasTheReplies("Reply 1 to Comment 1", "Reply 2 to Comment 1");
        Reddit.ThePost("Long thread").TheComment("Comment 2").HasTheReplies("Reply 1 to Comment 2", "Reply 2 to Comment 2", "Reply 3 to Comment 2");
        Reddit.RefusesLoadMoreComments();
        await Phone.BaconReader.OpenAsync();
        await Phone.BaconReader.LogInWithTheTestAccountAsync();

        // When
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Long thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("Reply 2 to Comment 1");
        await Phone.BaconReader.Detail.Comments.WaitUntilLoadMoreShownAsync("load more comments (3 replies)");

        // Then
        // "Up to 2 replies" of "Load more comments" loads them right after the post's comments.
        var opened = await Phone.BaconReader.Detail.Comments.ReadShownAsync();
        Asserting.That(opened)
            .ShowsTheReplies("Comment 1", "Reply 1 to Comment 1", "Reply 2 to Comment 1")
            .ShowsLoadMore("Comment 2", "load more comments (3 replies)");

        // When
        await Phone.BaconReader.Detail.Comments.ClickLoadMoreAsync("load more comments (3 replies)");
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("Reply 3 to Comment 2");

        // Then
        var loaded = await Phone.BaconReader.Detail.Comments.ReadShownAsync();
        Asserting.That(loaded).ShowsTheReplies("Comment 2", "Reply 1 to Comment 2", "Reply 2 to Comment 2", "Reply 3 to Comment 2");

        // When
        await Phone.BaconReader.Detail.Comments.ScrollToTheEndAsync();

        // Then
        // 500 comments come with the post; the other 60 load at the end of the list, 50 and then 10.
        var end = await Phone.BaconReader.Detail.Comments.ReadShownAsync();
        // Not on the screen: the fake Reddit records what BaconReader sent.
        var asked = Reddit.ReadRequestsForLoadMoreComments();
        Asserting.That(end).EndsWithTheComment("Comment 560");
        Asserting.That(asked).WereAllRefused();
    }
}
