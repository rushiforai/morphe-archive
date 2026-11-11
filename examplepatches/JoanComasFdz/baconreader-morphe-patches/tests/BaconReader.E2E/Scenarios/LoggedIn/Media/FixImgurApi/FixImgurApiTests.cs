// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Reddit;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Media;

/// <summary>
/// "Fix Imgur API": BaconReader asks Imgur's own API for an album's images instead of its RapidAPI proxy, which refuses
/// every request, shows a still image as an image and a video as a video, and uploads a reply's image with a content
/// type, which Imgur's API requires.
/// </summary>
public sealed class FixImgurApiTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Fix Imgur API opens Imgur albums, galleries and videos and uploads an image Imgur takes
          Given Imgur has an album "Trip" of 3 images
          And Imgur has a gallery post "Cats" of 2 images
          And Imgur has an album "Clips" of 1 video
          And Reddit has a link post "Trip album" in r/e2e linking to the Imgur album "Trip"
          And Reddit has a link post "Cats gallery" in r/e2e linking to the Imgur gallery post "Cats"
          And Reddit has a link post "Clips album" in r/e2e linking to the Imgur album "Clips"
          And Reddit has a post "Imgur thread" in r/e2e
          And the post "Imgur thread" has a comment "Reply here"
          And BaconReader is patched with every patch
          And the test account is logged in
          And BaconReader is open
          When I tap the post "Trip album"
          And I tap "imgur.com" in the post's header
          Then the album shows its image 1 of 3
          # Imgur sends a still image with an empty "mp4", which BaconReader alone takes for a video it can't play.
          And no thumbnail of the album is marked as a video
          # On the setup page: the fake Imgur records what BaconReader asked for.
          And Imgur served the images of the album "Trip"
          When I tap the album's next arrow
          Then the album shows its image 2 of 3
          When I go back
          And I go back to the posts
          And I tap the post "Cats gallery"
          And I tap "imgur.com" in the post's header
          Then the album shows its image 1 of 2
          # On the setup page: Imgur answers a gallery post at another address than an album.
          And Imgur served the gallery post "Cats"
          When I go back
          And I go back to the posts
          And I tap the post "Clips album"
          And I tap "imgur.com" in the post's header
          Then the album plays its video
          And the album's thumbnail is marked as a video
          When I go back
          And I go back to the posts
          And I tap the post "Imgur thread"
          And I swipe the comment "Reply here" to its action bar
          And I tap "Comment" in the comment's action bar
          And I type "My drawing"
          And I tap "Attach media"
          And I tap "Draw"
          And I draw a line
          And I tap "Accept"
          # BaconReader puts the drawing in the reply as a tag, and uploads it when the reply is sent.
          Then the text box shows "My drawing #IMG_01"
          # BaconReader describes the send button "Attach media", as the button before it.
          When I tap the send button
          # "Embed comment images" shows the uploaded image in place of Imgur's link.
          Then the comment "My drawing" shows 1 image
          # On the setup page: the fake Imgur records what BaconReader sent. Imgur refuses an upload without a content type.
          And Imgur got the upload with the content type "application/octet-stream"
        """)]
    public async Task FixImgurApiOpensImgurAlbumsGalleriesAndVideosAndUploadsAnImageImgurTakes(Screen screen)
    {
        // Given
        Reddit.ImgurHasAnAlbumOf("Trip", 3);
        Reddit.ImgurHasAGalleryPostOf("Cats", 2);
        Reddit.ImgurHasAnAlbumOfVideos("Clips", 1);
        Reddit.HasALinkPostLinkingToTheImgurAlbum("Trip album", "e2e", "Trip");
        Reddit.HasALinkPostLinkingToTheImgurGalleryPost("Cats gallery", "e2e", "Cats");
        Reddit.HasALinkPostLinkingToTheImgurAlbum("Clips album", "e2e", "Clips");
        Reddit.HasAPost("Imgur thread", "e2e");
        Reddit.ThePost("Imgur thread").HasAComment("Reply here");
        Reddit.TheTestAccountIsLoggedIn();
        await Phone.BaconReader.OpenAsync();

        // When
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Trip album");
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Trip album");
        await Phone.BaconReader.Detail.ClickHeaderLinkAsync("imgur.com");
        await Phone.BaconReader.ImgurGalleryViewer.WaitUntilImageShownAsync(1, 3);

        // Then
        var trip = await Phone.BaconReader.ImgurGalleryViewer.ReadAsync();
        // On the setup page: the fake Imgur records what BaconReader asked for.
        var tripRequests = Reddit.ReadRequestsForTheImgurAlbum("Trip");
        Asserting.That(trip).ShowsItsImage(1, 3)
            // Imgur sends a still image with an empty "mp4", which BaconReader alone takes for a video it can't play.
            .MarksNoThumbnailAsAVideo();
        Asserting.That(tripRequests).Served();

        // When
        await Phone.BaconReader.ImgurGalleryViewer.ClickNextAsync();
        await Phone.BaconReader.ImgurGalleryViewer.WaitUntilImageShownAsync(2, 3);

        // Then
        var secondImage = await Phone.BaconReader.ImgurGalleryViewer.ReadAsync();
        Asserting.That(secondImage).ShowsItsImage(2, 3);

        // When
        await Phone.BaconReader.ImgurGalleryViewer.ClickBackAsync();
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Trip album");
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Cats gallery");
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Cats gallery");
        await Phone.BaconReader.Detail.ClickHeaderLinkAsync("imgur.com");
        await Phone.BaconReader.ImgurGalleryViewer.WaitUntilImageShownAsync(1, 2);

        // Then
        var cats = await Phone.BaconReader.ImgurGalleryViewer.ReadAsync();
        // On the setup page: Imgur answers a gallery post at another address than an album.
        var catsRequests = Reddit.ReadRequestsForTheImgurGalleryPost("Cats");
        Asserting.That(cats).ShowsItsImage(1, 2);
        Asserting.That(catsRequests).Served();

        // When
        await Phone.BaconReader.ImgurGalleryViewer.ClickBackAsync();
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Cats gallery");
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Clips album");
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Clips album");
        await Phone.BaconReader.Detail.ClickHeaderLinkAsync("imgur.com");
        await Phone.BaconReader.ImgurGalleryViewer.WaitUntilVideoPlaysAsync();

        // Then
        var clips = await Phone.BaconReader.ImgurGalleryViewer.ReadAsync();
        Asserting.That(clips)
            .PlaysItsVideo()
            .MarksItsThumbnailAsAVideo();

        // When
        await Phone.BaconReader.ImgurGalleryViewer.ClickBackAsync();
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Clips album");
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Imgur thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("Reply here");
        await Phone.BaconReader.Detail.Comments.SwipeToActionBarAsync("Reply here");
        await Phone.BaconReader.Detail.Comments.WaitUntilActionBarShownAsync();
        await Phone.BaconReader.Detail.Comments.ClickActionBarCommentAsync();
        await Phone.BaconReader.ReplyScreen.WaitUntilShownAsync();
        await Phone.BaconReader.ReplyScreen.Editor.TypeAsync("My drawing");
        await Phone.BaconReader.ReplyScreen.ClickAttachMediaAsync();
        await Phone.BaconReader.ReplyScreen.AttachMedia.WaitUntilShownAsync();
        await Phone.BaconReader.ReplyScreen.AttachMedia.ClickAsync(new MediaSource.Draw());
        await Phone.BaconReader.DrawChat.WaitUntilShownAsync();
        await Phone.BaconReader.DrawChat.DrawALineAsync();
        await Phone.BaconReader.DrawChat.ClickAcceptAsync();
        await Phone.BaconReader.ReplyScreen.Editor.WaitUntilTextShownAsync("My drawing #IMG_01");

        // Then
        // BaconReader puts the drawing in the reply as a tag, and uploads it when the reply is sent.
        var reply = await Phone.BaconReader.ReplyScreen.Editor.ReadAsync();
        Asserting.That(reply).ShowsTheText("My drawing #IMG_01");

        // When
        // BaconReader describes the send button "Attach media", as the button before it.
        await Phone.BaconReader.ReplyScreen.ClickSendAsync();
        await Reddit.WaitUntilImgurGotAnUploadAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("My drawing");
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownAsync("My drawing");

        // Then
        // "Embed comment images" shows the uploaded image in place of Imgur's link.
        var drawing = await Phone.BaconReader.Detail.Comments.ReadAsync("My drawing");
        // On the setup page: the fake Imgur records what BaconReader sent. Imgur refuses an upload without a content type.
        var uploads = Reddit.ReadImgurUploads();
        Asserting.That(drawing).ShowsImages(1);
        Asserting.That(uploads).GotTheUploadWithTheContentType("application/octet-stream");
    }
}
