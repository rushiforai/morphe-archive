// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Reddit;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Media;

/// <summary>
/// "Fix list thumbnails": the list view loads thumbnails Reddit sends as signed previews (their "&amp;" unescaped) and
/// asks again for one that fails; a link post shows its preview as thumbnail, a crosspost of a gallery the preview of
/// its first image and BaconReader's gallery indicator, and in the card list a gallery and its crosspost show the
/// gallery's first image in their cards; spoiler thumbnails are blurred, and NSFW ones while "Show NSFW
/// images" is off; a RedGIFs post, which Reddit sends without a thumbnail, shows its video's, which the patch asks
/// RedGIFs for, and a link post to a YouTube video its video's, from YouTube. The patch describes a thumbnail it blurs
/// "Blurred thumbnail". Out of scope: embed thumbnails, which come from other hosts.
/// </summary>
public sealed class FixListThumbnailsTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Fix list thumbnails loads signed and failing thumbnails, finds missing ones and blurs NSFW and spoilers
          Given Reddit has an NSFW image post "NSFW picture" in r/e2e
          And Reddit has an image post "Signed thumbnail" in r/e2e whose thumbnail is a signed preview
          And Reddit has an image post "Flaky thumbnail" in r/e2e
          And Reddit answers the thumbnail of "Flaky thumbnail" with "500 Internal Server Error" the first 2 times
          And Reddit has a link post "Link with a preview" in r/e2e with a preview and no thumbnail
          And Reddit has a gallery post "Album" in r/e2e of 2 images
          And Reddit has a crosspost "Shared album" in r/e2e of the post "Album"
          And Reddit has a spoiler image post "Spoiler picture" in r/e2e
          And Reddit has a RedGIFs post "Clip" in r/e2e
          And YouTube has a video "Listed video" on the channel "@e2ekitchen"
          And Reddit has a link post "YouTube video" in r/e2e linking to the YouTube video "Listed video"
          And BaconReader is patched with every patch
          And the test account is logged in
          And BaconReader is open
          When I select the "e2e" feed
          And I tap "More options" in the toolbar
          And I tap "List View"
          # On the setup page: the fake Reddit records what BaconReader asked for. Reddit sends the signed URL with its "&" HTML-escaped, and refuses it so.
          Then Reddit served the thumbnail of "Signed thumbnail" with its "&" unescaped
          # On the setup page: a network hiccup; BaconReader asked once.
          And Reddit served the thumbnail of "Flaky thumbnail" on the third request
          And the post "Link with a preview" shows a thumbnail
          And Reddit served the preview of "Link with a preview"
          # A crosspost isn't a gallery itself: the shared post is.
          And the post "Shared album" shows the gallery indicator
          And Reddit served a preview of the first image of "Album"
          And the post "Spoiler picture" shows a blurred thumbnail
          # Reddit sends no thumbnail for it: the patch asks RedGIFs for the video's.
          And the post "Clip" shows a thumbnail
          # On the setup page: the fake RedGIFs records what BaconReader asked for.
          And RedGIFs served the thumbnail of "Clip"
          # Reddit sends no thumbnail for it: the patch takes the video's from YouTube.
          And the post "YouTube video" shows a thumbnail
          # On the setup page: the fake YouTube records what BaconReader asked for.
          And YouTube served the thumbnail of "Listed video"
          # BaconReader hides NSFW posts until "Show NSFW posts" is on.
          When I open the left menu
          And I tap "Settings"
          And I tap "Filters"
          And I tap "Show NSFW posts"
          And I go back to the posts
          And I tap "Refresh" in the toolbar
          # "Show NSFW images" turns on with "Show NSFW posts".
          Then the post "NSFW picture" shows a thumbnail that isn't blurred
          When I open the left menu
          And I tap "Settings"
          And I tap "Filters"
          And I tap "Show NSFW images"
          And I go back to the posts
          And I tap "Refresh" in the toolbar
          Then the post "NSFW picture" shows a blurred thumbnail
          When I tap "More options" in the toolbar
          And I tap "Card View"
          Then the post "Album" shows its first image in its card
          And the post "Shared album" shows its first image in its card
        """)]
    public async Task FixListThumbnailsLoadsSignedAndFailingThumbnailsFindsMissingOnesAndBlursNsfwAndSpoilers(Screen screen)
    {
        // Given
        Reddit.HasAnNsfwImagePost("NSFW picture", "e2e");
        Reddit.HasAnImagePostWithASignedThumbnail("Signed thumbnail", "e2e");
        Reddit.HasAnImagePost("Flaky thumbnail", "e2e");
        Reddit.AnswersTheThumbnailOfThePostWithTheFirstTimes("Flaky thumbnail", "500 Internal Server Error", 2);
        Reddit.HasALinkPostWithAPreviewAndNoThumbnail("Link with a preview", "e2e");
        Reddit.HasAGalleryPostOf("Album", "e2e", 2);
        Reddit.HasACrosspostOf("Shared album", "e2e", "Album");
        Reddit.HasASpoilerImagePost("Spoiler picture", "e2e");
        Reddit.HasARedGifsPost("Clip", "e2e");
        Reddit.YouTubeHasAVideo("Listed video", "@e2ekitchen");
        Reddit.HasALinkPostLinkingToTheYouTubeVideo("YouTube video", "e2e", "Listed video");
        Reddit.TheTestAccountIsLoggedIn();
        await Phone.BaconReader.OpenAsync();

        // When
        await Phone.BaconReader.Main.Toolbar.SelectFeedAsync(new Feed.Subreddit("e2e"));
        await Phone.BaconReader.Main.Toolbar.WaitUntilFeedShownAsync(new Feed.Subreddit("e2e"));
        await Phone.BaconReader.Main.Posts.WaitUntilPostsShownAsync();
        await Phone.BaconReader.Main.Toolbar.ClickMoreOptionsAsync();
        await Phone.BaconReader.Main.Toolbar.MoreOptions.WaitUntilShownAsync();
        await Phone.BaconReader.Main.Toolbar.MoreOptions.ClickAsync(new OverflowMenuEntry.ListView());
        await Phone.BaconReader.Main.Posts.WaitUntilShownAsRowsAsync();
        await Phone.BaconReader.Main.Posts.WaitUntilThumbnailShownAsync("Spoiler picture", PostThumbnail.Blurred);
        await Reddit.WaitUntilTheThumbnailOfThePostIsServedAsync("Flaky thumbnail");
        await Phone.BaconReader.Main.Posts.WaitUntilThumbnailShownAsync("Clip", PostThumbnail.Shown);
        await Reddit.WaitUntilTheRedGifsThumbnailOfThePostIsServedAsync("Clip");
        await Phone.BaconReader.Main.Posts.WaitUntilThumbnailShownAsync("YouTube video", PostThumbnail.Shown);
        await Reddit.WaitUntilTheYouTubeThumbnailOfTheVideoIsServedAsync("Listed video");

        // Then
        // On the setup page: the fake Reddit records what BaconReader asked for. Reddit sends the signed URL with its "&" HTML-escaped, and refuses it so.
        var signed = Reddit.ReadRequestsForTheThumbnailOf("Signed thumbnail");
        // On the setup page: a network hiccup; BaconReader asked once.
        var flaky = Reddit.ReadRequestsForTheThumbnailOf("Flaky thumbnail");
        var link = await Phone.BaconReader.Main.Posts.ReadPostAsync("Link with a preview");
        var preview = Reddit.ReadRequestsForThePreviewOf("Link with a preview");
        // A crosspost isn't a gallery itself: the shared post is.
        var crosspost = await Phone.BaconReader.Main.Posts.ReadPostAsync("Shared album");
        var gallery = Reddit.ReadRequestsForTheGalleryOf("Album");
        var spoiler = await Phone.BaconReader.Main.Posts.ReadPostAsync("Spoiler picture");
        // Reddit sends no thumbnail for it: the patch asks RedGIFs for the video's.
        var clip = await Phone.BaconReader.Main.Posts.ReadPostAsync("Clip");
        // On the setup page: the fake RedGIFs records what BaconReader asked for.
        var clipThumbnail = Reddit.ReadRequestsForTheRedGifsThumbnailOf("Clip");
        // Reddit sends no thumbnail for it: the patch takes the video's from YouTube.
        var youTubePost = await Phone.BaconReader.Main.Posts.ReadPostAsync("YouTube video");
        // On the setup page: the fake YouTube records what BaconReader asked for.
        var youTubeThumbnail = Reddit.ReadRequestsForTheYouTubeThumbnailOf("Listed video");
        Asserting.That(signed).ServedWithItsAmpersandsUnescaped();
        Asserting.That(flaky).ServedOnTheThirdRequest();
        Asserting.That(link).ShowsAThumbnail();
        Asserting.That(preview).Served();
        Asserting.That(crosspost).ShowsTheGalleryIndicator();
        Asserting.That(gallery).ServedAPreviewOfTheFirstImage();
        Asserting.That(spoiler).ShowsABlurredThumbnail();
        Asserting.That(clip).ShowsAThumbnail();
        Asserting.That(clipThumbnail).Served();
        Asserting.That(youTubePost).ShowsAThumbnail();
        Asserting.That(youTubeThumbnail).Served();

        // When
        // BaconReader hides NSFW posts until "Show NSFW posts" is on.
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Filters());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Filters());
        await Phone.BaconReader.Settings.WaitUntilSectionShownAsync(new SettingsSection.Filters());
        await Phone.BaconReader.Settings.TickAsync(new BaconReaderSetting.ShowNsfwPosts());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Toolbar.ClickRefreshAsync();
        await Phone.BaconReader.Main.Posts.WaitUntilPostShownAsync("NSFW picture");
        await Phone.BaconReader.Main.Posts.WaitUntilThumbnailShownAsync("NSFW picture", PostThumbnail.Shown);

        // Then
        // "Show NSFW images" turns on with "Show NSFW posts".
        var nsfw = await Phone.BaconReader.Main.Posts.ReadPostAsync("NSFW picture");
        Asserting.That(nsfw).ShowsAThumbnailThatIsntBlurred();

        // When
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Filters());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Filters());
        await Phone.BaconReader.Settings.WaitUntilSectionShownAsync(new SettingsSection.Filters());
        await Phone.BaconReader.Settings.TickAsync(new BaconReaderSetting.ShowNsfwImages());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Toolbar.ClickRefreshAsync();
        await Phone.BaconReader.Main.Posts.WaitUntilPostShownAsync("NSFW picture");
        await Phone.BaconReader.Main.Posts.WaitUntilThumbnailShownAsync("NSFW picture", PostThumbnail.Blurred);

        // Then
        var blurred = await Phone.BaconReader.Main.Posts.ReadPostAsync("NSFW picture");
        Asserting.That(blurred).ShowsABlurredThumbnail();

        // When
        await Phone.BaconReader.Main.Toolbar.ClickMoreOptionsAsync();
        await Phone.BaconReader.Main.Toolbar.MoreOptions.WaitUntilShownAsync();
        await Phone.BaconReader.Main.Toolbar.MoreOptions.ClickAsync(new OverflowMenuEntry.CardView());
        await Phone.BaconReader.Main.Posts.WaitUntilCardImageShownAsync("Album");
        await Phone.BaconReader.Main.Posts.WaitUntilCardImageShownAsync("Shared album");

        // Then
        var album = await Phone.BaconReader.Main.Posts.ReadPostAsync("Album");
        var sharedAlbum = await Phone.BaconReader.Main.Posts.ReadPostAsync("Shared album");
        Asserting.That(album).ShowsAnImageInItsCard();
        Asserting.That(sharedAlbum).ShowsAnImageInItsCard();
    }
}
