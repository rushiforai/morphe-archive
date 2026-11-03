// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Reddit;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Links;

/// <summary>
/// "Fix Reddit links": Reddit's share links, and links to posts without their subreddit, to galleries and to posts on a
/// user's profile, open in BaconReader instead of its browser, or the profile.
/// </summary>
public sealed class FixRedditLinksTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Fix Reddit links opens share links and other Reddit links in BaconReader
          Given Reddit has a post "Links" in r/e2e
          And Reddit has a post "Shared post" in r/e2e
          And Reddit has a gallery post "Holiday photos" in r/e2e
          And Reddit has a post "Profile post" on the test account's profile
          And Reddit has a link post "Shared as a link" in r/e2e linking to a share link of the post "Shared post"
          And the post "Links" has a comment "Shared" linking to a share link of the post "Shared post"
          And the post "Links" has a comment "Shared from a profile" linking to a profile share link of the post "Profile post"
          And the post "Links" has a comment "Expired share" linking to a share link Reddit no longer knows in r/e2e
          And the post "Links" has a comment "No subreddit" linking to the post "Shared post" without its subreddit
          And the post "Links" has a comment "Gallery" linking to the gallery of "Holiday photos"
          And the post "Links" has a comment "On a profile" linking to the post "Profile post" on the test account's profile
          And BaconReader is patched with every patch
          And BaconReader is open
          And the test account is logged in
          When I tap the post "Links"
          And I tap the link "Shared"
          Then BaconReader shows the post "Shared post"
          # Not on the screen: the fake Reddit records what BaconReader asked for.
          And Reddit answered the share link with the post's address
          When I go back
          And I tap the link "Shared from a profile"
          Then BaconReader shows the post "Profile post"
          When I go back
          And I tap the link "Expired share"
          # Reddit sends a share link it doesn't know to its subreddit.
          Then the toolbar shows the "e2e" feed
          When I go back
          And I tap the link "No subreddit"
          Then BaconReader shows the post "Shared post"
          When I go back
          And I tap the link "Gallery"
          Then BaconReader shows the post "Holiday photos"
          When I go back
          And I tap the link "On a profile"
          Then BaconReader shows the post "Profile post"
          And BaconReader doesn't show the test account's profile
          When I go back
          And I go back
          And I tap the post "Shared as a link"
          And I tap "www.reddit.com" in the post's header
          Then BaconReader shows the post "Shared post"
        """)]
    public async Task FixRedditLinksOpensShareLinksAndOtherRedditLinksInBaconReader(Screen screen)
    {
        // Given
        Reddit.HasAPost("Links", "e2e");
        Reddit.HasAPost("Shared post", "e2e");
        Reddit.HasAGalleryPost("Holiday photos", "e2e");
        Reddit.HasAPostOnTheTestAccountsProfile("Profile post");
        Reddit.HasALinkPostLinkingToAShareLinkOfThePost("Shared as a link", "e2e", "Shared post");
        Reddit.ThePost("Links").HasACommentLinkingToAShareLinkOfThePost("Shared", "Shared post");
        Reddit.ThePost("Links").HasACommentLinkingToAProfileShareLinkOfThePost("Shared from a profile", "Profile post");
        Reddit.ThePost("Links").HasACommentLinkingToAShareLinkRedditNoLongerKnowsIn("Expired share", "e2e");
        Reddit.ThePost("Links").HasACommentLinkingToThePostWithoutItsSubreddit("No subreddit", "Shared post");
        Reddit.ThePost("Links").HasACommentLinkingToTheGalleryOf("Gallery", "Holiday photos");
        Reddit.ThePost("Links").HasACommentLinkingToThePostOnTheTestAccountsProfile("On a profile", "Profile post");
        await Phone.BaconReader.OpenAsync();
        await Phone.BaconReader.LogInWithTheTestAccountAsync();

        // When
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Links");
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("Shared");
        await Phone.BaconReader.Detail.Comments.ClickLinkAsync("Shared");
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Shared post");

        // Then
        var shared = await Phone.BaconReader.Detail.ReadPostAsync();
        // Not on the screen: the fake Reddit records what BaconReader asked for.
        var shareLinks = Reddit.ReadRequestsForShareLinks();
        Asserting.That(shared).ShowsThePost("Shared post");
        Asserting.That(shareLinks).AnsweredTheShareLinkWithTheAddressOf("Shared post");

        // When
        await Phone.BaconReader.Detail.ClickBackAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("Shared from a profile");
        await Phone.BaconReader.Detail.Comments.ClickLinkAsync("Shared from a profile");
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Profile post");

        // Then
        var sharedFromAProfile = await Phone.BaconReader.Detail.ReadPostAsync();
        Asserting.That(sharedFromAProfile).ShowsThePost("Profile post");

        // When
        await Phone.BaconReader.Detail.ClickBackAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("Expired share");
        await Phone.BaconReader.Detail.Comments.ClickLinkAsync("Expired share");
        await Phone.BaconReader.Main.Toolbar.WaitUntilFeedShownAsync(new Feed.Subreddit("e2e"));

        // Then
        // Reddit sends a share link it doesn't know to its subreddit.
        var toolbar = await Phone.BaconReader.Main.Toolbar.ReadAsync();
        Asserting.That(toolbar).ShowsFeed(new Feed.Subreddit("e2e"));

        // When
        await Phone.BaconReader.Main.ClickBackAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("No subreddit");
        await Phone.BaconReader.Detail.Comments.ClickLinkAsync("No subreddit");
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Shared post");

        // Then
        var noSubreddit = await Phone.BaconReader.Detail.ReadPostAsync();
        Asserting.That(noSubreddit).ShowsThePost("Shared post");

        // When
        await Phone.BaconReader.Detail.ClickBackAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("Gallery");
        await Phone.BaconReader.Detail.Comments.ClickLinkAsync("Gallery");
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Holiday photos");

        // Then
        var gallery = await Phone.BaconReader.Detail.ReadPostAsync();
        Asserting.That(gallery).ShowsThePost("Holiday photos");

        // When
        await Phone.BaconReader.Detail.ClickBackAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("On a profile");
        await Phone.BaconReader.Detail.Comments.ClickLinkAsync("On a profile");
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Profile post");

        // Then
        var onAProfile = await Phone.BaconReader.Detail.ReadPostAsync();
        var profile = await Phone.BaconReader.Profile.ReadAsync();
        Asserting.That(onAProfile).ShowsThePost("Profile post");
        Asserting.That(profile).IsNotShown();

        // When
        await Phone.BaconReader.Detail.ClickBackAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("On a profile");
        await Phone.BaconReader.Detail.ClickBackAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Shared as a link");
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Shared as a link");
        await Phone.BaconReader.Detail.ClickHeaderLinkAsync("www.reddit.com");
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Shared post");

        // Then
        var sharedAsALink = await Phone.BaconReader.Detail.ReadPostAsync();
        Asserting.That(sharedAsALink).ShowsThePost("Shared post");
    }
}
