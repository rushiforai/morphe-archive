// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Media;

/// <summary>
/// "Swipe through albums": a swipe left or right on a Reddit gallery's or an Imgur album's image, or on an Imgur album's
/// video, goes to the next or previous item, as the arrows at the screen's sides do; zoomed in, a swipe still moves
/// around the image.
/// </summary>
public sealed class SwipeThroughAlbumsTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Swipe through albums goes to the next and the previous image of a Reddit gallery and an Imgur album
          Given Reddit has a gallery post "Album" in r/e2e of 3 images
          And Imgur has an album "Clip and photo" of 1 image and 1 video
          And Reddit has a link post "Mixed album" in r/e2e linking to the Imgur album "Clip and photo"
          And BaconReader is patched with every patch
          And the test account is logged in
          And BaconReader is open
          When I select the "e2e" feed
          And I tap "More options" in the toolbar
          And I tap "List View"
          And I tap the thumbnail of "Album"
          Then the gallery shows its image 1 of 3
          When I swipe left on the image
          Then the gallery shows its image 2 of 3
          When I swipe left on the image
          Then the gallery shows its image 3 of 3
          # The last image: there's none after it.
          When I swipe left on the image
          Then the gallery shows its image 3 of 3
          When I swipe right on the image
          Then the gallery shows its image 2 of 3
          When I zoom in on the image
          And I swipe left on the image
          # Zoomed in, a swipe moves around the image instead.
          Then the gallery shows its image 2 of 3
          When I go back to the posts
          And I tap the post "Mixed album"
          And I tap "imgur.com" in the post's header
          Then the album shows its image 1 of 2
          # The first image: there's none before it.
          When I swipe right on the image
          Then the album shows its image 1 of 2
          When I swipe left on the image
          Then the album plays its video
          When I swipe right on the video
          Then the album shows its image 1 of 2
        """)]
    public async Task SwipeThroughAlbumsGoesToTheNextAndThePreviousImageOfARedditGalleryAndAnImgurAlbum(Screen screen)
    {
        // Given
        Reddit.HasAGalleryPostOf("Album", "e2e", 3);
        Reddit.ImgurHasAnAlbumOfImagesAndVideos("Clip and photo", 1, 1);
        Reddit.HasALinkPostLinkingToTheImgurAlbum("Mixed album", "e2e", "Clip and photo");
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
        await Phone.BaconReader.Main.Posts.ClickThumbnailAsync("Album");
        await Phone.BaconReader.MediaViewer.WaitUntilGalleryImageShownAsync(1, 3);

        // Then
        var first = await Phone.BaconReader.MediaViewer.ReadAsync();
        Asserting.That(first).ShowsItsImage(1, 3);

        // When
        await Phone.BaconReader.MediaViewer.SwipeLeftOnTheImageAsync();
        await Phone.BaconReader.MediaViewer.WaitUntilGalleryImageShownAsync(2, 3);

        // Then
        var second = await Phone.BaconReader.MediaViewer.ReadAsync();
        Asserting.That(second).ShowsItsImage(2, 3);

        // When
        await Phone.BaconReader.MediaViewer.SwipeLeftOnTheImageAsync();
        await Phone.BaconReader.MediaViewer.WaitUntilGalleryImageShownAsync(3, 3);

        // Then
        var last = await Phone.BaconReader.MediaViewer.ReadAsync();
        Asserting.That(last).ShowsItsImage(3, 3);

        // When
        await Phone.BaconReader.MediaViewer.SwipeLeftOnTheImageAsync();
        await Phone.BaconReader.MediaViewer.WaitUntilGalleryImageShownAsync(3, 3);

        // Then
        // The last image: there's none after it.
        var stillLast = await Phone.BaconReader.MediaViewer.ReadAsync();
        Asserting.That(stillLast).ShowsItsImage(3, 3);

        // When
        await Phone.BaconReader.MediaViewer.SwipeRightOnTheImageAsync();
        await Phone.BaconReader.MediaViewer.WaitUntilGalleryImageShownAsync(2, 3);

        // Then
        var back = await Phone.BaconReader.MediaViewer.ReadAsync();
        Asserting.That(back).ShowsItsImage(2, 3);

        // When
        await Phone.BaconReader.MediaViewer.ZoomInOnTheImageAsync();
        await Phone.BaconReader.MediaViewer.SwipeLeftOnTheImageAsync();
        await Phone.BaconReader.MediaViewer.WaitUntilGalleryImageShownAsync(2, 3);

        // Then
        // Zoomed in, a swipe moves around the image instead.
        var zoomed = await Phone.BaconReader.MediaViewer.ReadAsync();
        Asserting.That(zoomed).ShowsItsImage(2, 3);

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Mixed album");
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Mixed album");
        await Phone.BaconReader.Detail.ClickHeaderLinkAsync("imgur.com");
        await Phone.BaconReader.ImgurGalleryViewer.WaitUntilImageShownAsync(1, 2);

        // Then
        var album = await Phone.BaconReader.ImgurGalleryViewer.ReadAsync();
        Asserting.That(album).ShowsItsImage(1, 2);

        // When
        await Phone.BaconReader.ImgurGalleryViewer.SwipeRightOnTheImageAsync();
        await Phone.BaconReader.ImgurGalleryViewer.WaitUntilImageShownAsync(1, 2);

        // Then
        // The first image: there's none before it.
        var stillFirst = await Phone.BaconReader.ImgurGalleryViewer.ReadAsync();
        Asserting.That(stillFirst).ShowsItsImage(1, 2);

        // When
        await Phone.BaconReader.ImgurGalleryViewer.SwipeLeftOnTheImageAsync();
        await Phone.BaconReader.ImgurGalleryViewer.WaitUntilVideoPlaysAsync();

        // Then
        var video = await Phone.BaconReader.ImgurGalleryViewer.ReadAsync();
        Asserting.That(video).PlaysItsVideo();

        // When
        await Phone.BaconReader.ImgurGalleryViewer.SwipeRightOnTheVideoAsync();
        await Phone.BaconReader.ImgurGalleryViewer.WaitUntilImageShownAsync(1, 2);

        // Then
        var image = await Phone.BaconReader.ImgurGalleryViewer.ReadAsync();
        Asserting.That(image).ShowsItsImage(1, 2);
    }
}
