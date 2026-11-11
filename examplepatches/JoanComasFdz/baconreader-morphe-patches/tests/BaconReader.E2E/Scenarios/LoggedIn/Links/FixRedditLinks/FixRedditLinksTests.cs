// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Reddit;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Links;

/// <summary>
/// "Fix Reddit links": Reddit's share links, and links to posts without their subreddit, to galleries, to videos and to
/// posts on a user's profile, open in BaconReader instead of its browser, or the profile, even with BaconReader's "Open
/// links inside app" off. A gallery post's own thumbnail and link still open its gallery; a video's link opens the post
/// its redirect leads to, or plays the video when no post has it; and the slide show of a link post to a gallery
/// fetches the gallery's post, and that of a link post to a video plays the video.
/// </summary>
public sealed class FixRedditLinksTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Fix Reddit links opens share links and other Reddit links in BaconReader
          Given Reddit has a video post "Clip" in r/e2e
          And Reddit has a post "Links" in r/e2e
          And Reddit has a post "Shared post" in r/e2e
          And Reddit has a gallery post "Holiday photos" in r/e2e
          And Reddit has a post "Profile post" on the test account's profile
          And Reddit has a link post "Shared as a link" in r/e2e linking to a share link of the post "Shared post"
          And Reddit has a link post "Album link" in r/e2e linking to the gallery of "Holiday photos"
          And Reddit has a link post "Video link" in r/e2e linking to the video of "Clip"
          And the post "Links" has a comment "Shared" linking to a share link of the post "Shared post"
          And the post "Links" has a comment "Shared from a profile" linking to a profile share link of the post "Profile post"
          And the post "Links" has a comment "Expired share" linking to a share link Reddit no longer knows in r/e2e
          And the post "Links" has a comment "No subreddit" linking to the post "Shared post" without its subreddit
          And the post "Links" has a comment "Gallery" linking to the gallery of "Holiday photos"
          And the post "Links" has a comment "On a profile" linking to the post "Profile post" on the test account's profile
          And the post "Links" has a comment "Video" linking to the video of "Clip"
          And the post "Links" has a comment "Lone video" linking to a video Reddit has no post for
          And BaconReader is patched with every patch
          And the test account is logged in
          And BaconReader is open
          When I tap the post "Links"
          And I tap the link "Shared"
          Then BaconReader shows the post "Shared post"
          # On the setup page: the fake Reddit records what BaconReader asked for.
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
          When I go back
          And I go back
          And I tap the post "Holiday photos"
          And I tap the thumbnail in the post's header
          Then the gallery shows its first image
          When I go back
          And I tap "www.reddit.com" in the post's header
          Then the gallery shows its first image
          When I go back
          Then BaconReader shows the post "Holiday photos"
          When I go back
          And I tap the post "Links"
          And I tap the link "Video"
          Then BaconReader shows the post "Clip"
          # On the setup page: the fake Reddit records what BaconReader asked for. Reddit redirects a video's address to its post only for a browser.
          And Reddit redirected the video of "Clip" to its post
          When I go back
          And I tap the link "Lone video"
          Then the video plays
          When I go back
          And I go back
          And I tap the post "Album link"
          And I tap "Slide Show View" in the toolbar
          # "Auto load web links in Slide Show" is off: a gallery waits for a tap too.
          And I tap "Tap to open link"
          Then the gallery shows its first image
          When I tap "Detail View" in the toolbar
          And I go back to the posts
          And I tap the post "Video link"
          And I tap "Slide Show View" in the toolbar
          Then the video plays
          When I tap "Detail View" in the toolbar
          And I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Other"
          And I tap "Open links inside app"
          And I go back to the posts
          And I tap the post "Links"
          And I tap the link "No subreddit"
          Then BaconReader shows the post "Shared post"
        """)]
    public async Task FixRedditLinksOpensShareLinksAndOtherRedditLinksInBaconReader(Screen screen)
    {
        // Given
        Reddit.HasAVideoPost("Clip", "e2e");
        Reddit.HasAPost("Links", "e2e");
        Reddit.HasAPost("Shared post", "e2e");
        Reddit.HasAGalleryPost("Holiday photos", "e2e");
        Reddit.HasAPostOnTheTestAccountsProfile("Profile post");
        Reddit.HasALinkPostLinkingToAShareLinkOfThePost("Shared as a link", "e2e", "Shared post");
        Reddit.HasALinkPostLinkingToTheGalleryOf("Album link", "e2e", "Holiday photos");
        Reddit.HasALinkPostLinkingToTheVideoOf("Video link", "e2e", "Clip");
        Reddit.ThePost("Links").HasACommentLinkingToAShareLinkOfThePost("Shared", "Shared post");
        Reddit.ThePost("Links").HasACommentLinkingToAProfileShareLinkOfThePost("Shared from a profile", "Profile post");
        Reddit.ThePost("Links").HasACommentLinkingToAShareLinkRedditNoLongerKnowsIn("Expired share", "e2e");
        Reddit.ThePost("Links").HasACommentLinkingToThePostWithoutItsSubreddit("No subreddit", "Shared post");
        Reddit.ThePost("Links").HasACommentLinkingToTheGalleryOf("Gallery", "Holiday photos");
        Reddit.ThePost("Links").HasACommentLinkingToThePostOnTheTestAccountsProfile("On a profile", "Profile post");
        Reddit.ThePost("Links").HasACommentLinkingToTheVideoOf("Video", "Clip");
        Reddit.ThePost("Links").HasACommentLinkingToAVideoRedditHasNoPostFor("Lone video");
        Reddit.TheTestAccountIsLoggedIn();
        await Phone.BaconReader.OpenAsync();

        // When
        await Phone.BaconReader.Main.Posts.WaitUntilPostShownAsync("Links");
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Links");
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("Shared");
        await Phone.BaconReader.Detail.Comments.ClickLinkAsync("Shared");
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Shared post");

        // Then
        var shared = await Phone.BaconReader.Detail.ReadPostAsync();
        // On the setup page: the fake Reddit records what BaconReader asked for.
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
        await Phone.BaconReader.Main.Posts.WaitUntilPostShownAsync("Shared as a link");
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Shared as a link");
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Shared as a link");
        await Phone.BaconReader.Detail.ClickHeaderLinkAsync("www.reddit.com");
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Shared post");

        // Then
        var sharedAsALink = await Phone.BaconReader.Detail.ReadPostAsync();
        Asserting.That(sharedAsALink).ShowsThePost("Shared post");

        // When
        await Phone.BaconReader.Detail.ClickBackAsync();
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Shared as a link");
        await Phone.BaconReader.Detail.ClickBackAsync();
        await Phone.BaconReader.Main.Posts.WaitUntilPostShownAsync("Holiday photos");
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Holiday photos");
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Holiday photos");
        await Phone.BaconReader.Detail.ClickHeaderThumbnailAsync();
        await Phone.BaconReader.MediaViewer.WaitUntilGalleryShownAsync();

        // Then
        var galleryFromTheThumbnail = await Phone.BaconReader.MediaViewer.ReadAsync();
        Asserting.That(galleryFromTheThumbnail).ShowsTheGalleryWith(1);

        // When
        await Phone.BaconReader.MediaViewer.ClickBackAsync();
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Holiday photos");
        await Phone.BaconReader.Detail.ClickHeaderLinkAsync("www.reddit.com");
        await Phone.BaconReader.MediaViewer.WaitUntilGalleryShownAsync();

        // Then
        var galleryFromTheLink = await Phone.BaconReader.MediaViewer.ReadAsync();
        Asserting.That(galleryFromTheLink).ShowsTheGalleryWith(1);

        // When
        await Phone.BaconReader.MediaViewer.ClickBackAsync();
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Holiday photos");

        // Then
        var galleryPost = await Phone.BaconReader.Detail.ReadPostAsync();
        Asserting.That(galleryPost).ShowsThePost("Holiday photos");

        // When
        await Phone.BaconReader.Detail.ClickBackAsync();
        await Phone.BaconReader.Main.Posts.WaitUntilPostShownAsync("Links");
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Links");
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("Video");
        await Phone.BaconReader.Detail.Comments.ClickLinkAsync("Video");
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Clip");

        // Then
        var video = await Phone.BaconReader.Detail.ReadPostAsync();
        // On the setup page: the fake Reddit records what BaconReader asked for.
        var videoRedirects = Reddit.ReadRequestsForVideoRedirects();
        Asserting.That(video).ShowsThePost("Clip");
        Asserting.That(videoRedirects).RedirectedTheVideoToItsPost("Clip");

        // When
        await Phone.BaconReader.Detail.ClickBackAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("Lone video");
        await Phone.BaconReader.Detail.Comments.ClickLinkAsync("Lone video");
        await Phone.BaconReader.MediaViewer.WaitUntilVideoPlaysAsync();

        // Then
        var loneVideo = await Phone.BaconReader.MediaViewer.ReadAsync();
        Asserting.That(loneVideo).PlaysTheVideo();

        // When
        await Phone.BaconReader.MediaViewer.ClickBackAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("Lone video");
        await Phone.BaconReader.Detail.ClickBackAsync();
        await Phone.BaconReader.Main.Posts.WaitUntilPostShownAsync("Album link");
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Album link");
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Album link");
        await Phone.BaconReader.SlideShow.ClickSlideShowViewAsync();
        // "Auto load web links in Slide Show" is off: a gallery waits for a tap too.
        await Phone.BaconReader.SlideShow.WaitUntilTapToOpenLinkShownAsync();
        await Phone.BaconReader.SlideShow.ClickTapToOpenLinkAsync();
        await Phone.BaconReader.SlideShow.WaitUntilGalleryShownAsync();

        // Then
        var albumLink = await Phone.BaconReader.SlideShow.ReadAsync();
        Asserting.That(albumLink).ShowsTheGalleryWith(1);

        // When
        await Phone.BaconReader.SlideShow.ClickDetailViewAsync();
        await Phone.BaconReader.SlideShow.WaitUntilDetailViewShownAsync();
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.WaitUntilPostShownAsync("Video link");
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Video link");
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Video link");
        await Phone.BaconReader.SlideShow.ClickSlideShowViewAsync();
        await Phone.BaconReader.SlideShow.WaitUntilVideoPlaysAsync();

        // Then
        var videoLink = await Phone.BaconReader.SlideShow.ReadAsync();
        Asserting.That(videoLink).PlaysTheVideo();

        // When
        await Phone.BaconReader.SlideShow.ClickDetailViewAsync();
        await Phone.BaconReader.SlideShow.WaitUntilDetailViewShownAsync();
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Other());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Other());
        await Phone.BaconReader.Settings.WaitUntilSectionShownAsync(new SettingsSection.Other());
        await Phone.BaconReader.Settings.TickAsync(new BaconReaderSetting.OpenLinksInsideApp());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.WaitUntilPostShownAsync("Links");
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Links");
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("No subreddit");
        await Phone.BaconReader.Detail.Comments.ClickLinkAsync("No subreddit");
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Shared post");

        // Then
        var outsideApp = await Phone.BaconReader.Detail.ReadPostAsync();
        Asserting.That(outsideApp).ShowsThePost("Shared post");
    }
}
