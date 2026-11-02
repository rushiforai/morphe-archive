// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Reddit;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Posts;

/// <summary>
/// "Fix lost post votes": a vote on a post made while its comments load stays in the post list. The copy of the post
/// that comes with the comments was requested before the vote, and replaced the voted post in the list.
/// </summary>
public sealed class FixLostPostVotesTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Fix lost post votes keeps a vote made on a post while its comments load
          Given Reddit has a post "Vote while loading" in r/e2e
          And the post "Vote while loading" has a comment "First comment"
          # Reddit's answer holds the post as it was when BaconReader asked for it: before the vote.
          And Reddit answers the comments of the post "Vote while loading" 8 seconds late
          And BaconReader is patched with every patch
          And BaconReader is open
          And the test account is logged in
          When I tap the post "Vote while loading"
          And I upvote the post while its comments load
          And I wait until the comment "First comment" shows
          And I go back to the posts
          Then the post "Vote while loading" shows 2 points
          # Not on the screen: the fake Reddit records what BaconReader sent.
          And Reddit got an upvote on the post "Vote while loading"
          When I tap the post "Vote while loading"
          # Tapping the upvote again takes the vote back.
          And I upvote the post while its comments load
          And I wait until the comment "First comment" shows
          And I go back to the posts
          Then the post "Vote while loading" shows 1 points
          When I tap the post "Vote while loading"
          And I downvote the post while its comments load
          And I wait until the comment "First comment" shows
          And I go back to the posts
          Then the post "Vote while loading" shows 0 points
        """)]
    public async Task FixLostPostVotesKeepsAVoteMadeOnAPostWhileItsCommentsLoad(Screen screen)
    {
        // Given
        Reddit.HasAPost("Vote while loading", "e2e");
        Reddit.ThePost("Vote while loading").HasAComment("First comment");
        Reddit.AnswersTheCommentsOfThePostLate("Vote while loading", 8);
        await Phone.BaconReader.OpenAsync();
        await Phone.BaconReader.LogInWithTheTestAccountAsync();

        // When
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Vote while loading");
        await Phone.BaconReader.Detail.UpvoteWhileTheCommentsLoadAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("First comment");
        await Phone.BaconReader.GoBackToThePostsAsync();

        // Then
        var upvoted = await Phone.BaconReader.Main.Posts.ReadPostAsync("Vote while loading");
        // Not on the screen: the fake Reddit records what BaconReader sent.
        var votes = Reddit.ReadVotes();
        Asserting.That(upvoted).ShowsPoints(2);
        Asserting.That(votes).GotAnUpvoteOn("Vote while loading");

        // When
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Vote while loading");
        await Phone.BaconReader.Detail.UpvoteWhileTheCommentsLoadAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("First comment");
        await Phone.BaconReader.GoBackToThePostsAsync();

        // Then
        var takenBack = await Phone.BaconReader.Main.Posts.ReadPostAsync("Vote while loading");
        Asserting.That(takenBack).ShowsPoints(1);

        // When
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Vote while loading");
        await Phone.BaconReader.Detail.DownvoteWhileTheCommentsLoadAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("First comment");
        await Phone.BaconReader.GoBackToThePostsAsync();

        // Then
        var downvoted = await Phone.BaconReader.Main.Posts.ReadPostAsync("Vote while loading");
        Asserting.That(downvoted).ShowsPoints(0);
    }
}
