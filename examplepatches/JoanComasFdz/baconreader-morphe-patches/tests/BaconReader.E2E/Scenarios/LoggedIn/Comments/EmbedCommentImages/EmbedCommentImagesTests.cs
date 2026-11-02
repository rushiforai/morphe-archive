// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Comments;

/// <summary>
/// "Embed comment images": BaconReader shows the images, GIFs and videos of comments and post texts under the text, and
/// plays the videos in place. A tap switches an image between full width and 200×200, a double tap opens it in full
/// screen, a long press saves it to Downloads/BaconReader.
/// </summary>
public sealed class EmbedCommentImagesTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Embed comment images shows the media of comments and post texts and follows its settings
          Given Reddit has a post "Weekly thread" in r/e2e
          And the post "Weekly thread" has a comment "Here is an image" with an image
          And Reddit has a post "Media thread" in r/e2e
          And the post "Media thread" has a comment "Another image" with an image
          And the post "Media thread" has a comment "Here is a GIF" with a GIF
          And the post "Media thread" has a comment "Here is an image link" with a link to an image
          And the post "Media thread" has a comment "Here is a video" with a video
          And the post "Media thread" has a comment "Here is a video link" with a link to a video
          And the post "Media thread" has a comment "Just text"
          And Reddit has a post "A picture in text" in r/e2e with the text "Look at this" and an image
          And BaconReader is patched with every patch
          And BaconReader is open
          And the test account is logged in
          When I tap the post "Weekly thread"
          Then the comment "Here is an image" shows 1 image
          # "Full width by default" is off: an image starts at up to 200×200.
          And the image of the comment "Here is an image" fits in 200×200
          When I tap the image of the comment "Here is an image"
          Then the image of the comment "Here is an image" fills the comment's width
          When I tap the image of the comment "Here is an image"
          Then the image of the comment "Here is an image" fits in 200×200
          When I double tap the image of the comment "Here is an image"
          Then the image fills the screen
          When I tap Back
          And I long press the image of the comment "Here is an image"
          # BaconReader shows "Downloading image…" for a moment, but UiAutomator2 doesn't see that toast: the test can't check it.
          # Not on the screen: the test reads the phone's files.
          Then Downloads/BaconReader holds the image of the comment "Here is an image"
          When I go back to the posts
          And I tap the post "Media thread"
          And I scroll to the comment "Here is a GIF"
          Then the comment "Here is a GIF" shows 1 GIF
          When I scroll to the comment "Here is an image link"
          # The image takes the bare link's place: the link is dropped from the text.
          Then the comment "Here is an image link" shows 1 image
          And the comment "Here is an image link" shows no link
          When I scroll to the comment "Here is a video"
          Then the comment "Here is a video" shows a video
          When I tap the video of the comment "Here is a video"
          # A video that has ended shows its player's controls, with its position at its length.
          Then the video of the comment "Here is a video" played to "00:10" of "00:10"
          When I scroll to the comment "Here is a video link"
          And I tap the video of the comment "Here is a video link"
          Then the video of the comment "Here is a video link" played to "00:10" of "00:10"
          When I scroll to the comment "Just text"
          Then the comment "Just text" shows no image
          When I go back to the posts
          And I tap the post "A picture in text"
          Then the post's text "Look at this" shows 1 image
          And the image starts where the post's text starts
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          Then the settings show "Show images", "Full width by default", "Long press to download", "Load images only on Wi-Fi" and "Play videos in comments", in this order
          When I tap "Show images"
          And I go back to the posts
          And I tap the post "Weekly thread"
          Then the comment "Here is an image" shows no image
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I tap "Show images"
          And I go back to the posts
          And I tap the post "Weekly thread"
          Then the comment "Here is an image" shows 1 image
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I tap "Full width by default"
          And I go back to the posts
          And I tap the post "Media thread"
          # Not "Here is an image": the patch keeps the size an image's taps chose over the default.
          Then the image of the comment "Another image" fills the comment's width
          # "Full width by default" stays on: the next rounds don't depend on an image's size.
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I tap "Long press to download"
          And I go back to the posts
          And I tap the post "Weekly thread"
          And I long press the image of the comment "Here is an image"
          # Not on the screen: the test reads the phone's files. Only the image the first long press saved is there.
          Then Downloads/BaconReader holds the image of the comment "Here is an image"
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I tap "Play videos in comments"
          And I go back to the posts
          And I tap the post "Media thread"
          Then the comment "Here is a video" shows no video
        """)]
    public async Task EmbedCommentImagesShowsTheMediaOfCommentsAndPostTextsAndFollowsItsSettings(Screen screen)
    {
        // Given
        Reddit.HasAPost("Weekly thread", "e2e");
        Reddit.ThePost("Weekly thread").HasACommentWithAnImage("Here is an image");
        Reddit.HasAPost("Media thread", "e2e");
        Reddit.ThePost("Media thread").HasACommentWithAnImage("Another image");
        Reddit.ThePost("Media thread").HasACommentWithAGif("Here is a GIF");
        Reddit.ThePost("Media thread").HasACommentWithALinkToAnImage("Here is an image link");
        Reddit.ThePost("Media thread").HasACommentWithAVideo("Here is a video");
        Reddit.ThePost("Media thread").HasACommentWithALinkToAVideo("Here is a video link");
        Reddit.ThePost("Media thread").HasAComment("Just text");
        Reddit.HasAPostWithTheTextAndAnImage("A picture in text", "e2e", "Look at this");
        await Phone.BaconReader.OpenAsync();
        await Phone.BaconReader.LogInWithTheTestAccountAsync();

        // When
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Weekly thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownAsync("Here is an image");

        // Then
        // "Full width by default" is off: an image starts at up to 200×200.
        var image = await Phone.BaconReader.Detail.Comments.ReadAsync("Here is an image");
        var small = await Phone.BaconReader.Detail.Comments.ReadLayoutAsync("Here is an image");
        Asserting.That(image).ShowsImages(1);
        Asserting.That(small).TheImageFitsIn200By200();

        // When
        await Phone.BaconReader.Detail.Comments.ClickImageAsync("Here is an image");
        await Phone.BaconReader.Detail.Comments.WaitUntilImageResizedAsync("Here is an image");

        // Then
        var fullWidth = await Phone.BaconReader.Detail.Comments.ReadLayoutAsync("Here is an image");
        Asserting.That(fullWidth).TheImageFillsTheCommentsWidth();

        // When
        await Phone.BaconReader.Detail.Comments.ClickImageAsync("Here is an image");
        await Phone.BaconReader.Detail.Comments.WaitUntilImageResizedAsync("Here is an image");

        // Then
        var smallAgain = await Phone.BaconReader.Detail.Comments.ReadLayoutAsync("Here is an image");
        Asserting.That(smallAgain).TheImageFitsIn200By200();

        // When
        await Phone.BaconReader.Detail.Comments.DoubleClickImageAsync("Here is an image");
        await Phone.BaconReader.ImageViewer.WaitUntilShownAsync();

        // Then
        var viewer = await Phone.BaconReader.ImageViewer.ReadLayoutAsync();
        Asserting.That(viewer).FillsTheScreen();

        // When
        await Phone.BaconReader.ImageViewer.ClickBackAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownAsync("Here is an image");
        await Phone.BaconReader.Detail.Comments.LongClickImageAsync("Here is an image");
        await Phone.Downloads.WaitUntilImageSavedAsync();

        // Then
        // BaconReader shows "Downloading image…" for a moment, but UiAutomator2 doesn't see that toast: the test can't check it.
        // Not on the screen: the test reads the phone's files.
        var downloads = await Phone.Downloads.ReadAsync();
        var commentsImage = Reddit.ReadTheImageOfTheComment("Here is an image");
        Asserting.That(downloads).HoldsTheImage(commentsImage);

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Media thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.ScrollToCommentAsync("Here is a GIF");
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownAsync("Here is a GIF");

        // Then
        var gif = await Phone.BaconReader.Detail.Comments.ReadAsync("Here is a GIF");
        Asserting.That(gif).ShowsGifs(1);

        // When
        await Phone.BaconReader.Detail.Comments.ScrollToCommentAsync("Here is an image link");
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownAsync("Here is an image link");

        // Then
        // The image takes the bare link's place: the link is dropped from the text.
        var imageLink = await Phone.BaconReader.Detail.Comments.ReadAsync("Here is an image link");
        Asserting.That(imageLink).ShowsImages(1).ShowsNoLink();

        // When
        await Phone.BaconReader.Detail.Comments.ScrollToCommentAsync("Here is a video");
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownAsync("Here is a video");

        // Then
        var video = await Phone.BaconReader.Detail.Comments.ReadAsync("Here is a video");
        Asserting.That(video).ShowsAVideo();

        // When
        await Phone.BaconReader.Detail.Comments.ClickVideoAsync("Here is a video");
        await Phone.BaconReader.Detail.Comments.WaitUntilVideoEndedAsync("Here is a video");

        // Then
        // A video that has ended shows its player's controls, with its position at its length.
        var played = await Phone.BaconReader.Detail.Comments.ReadVideoAsync("Here is a video");
        Asserting.That(played).PlayedTo("00:10", "00:10");

        // When
        await Phone.BaconReader.Detail.Comments.ScrollToCommentAsync("Here is a video link");
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownAsync("Here is a video link");
        await Phone.BaconReader.Detail.Comments.ClickVideoAsync("Here is a video link");
        await Phone.BaconReader.Detail.Comments.WaitUntilVideoEndedAsync("Here is a video link");

        // Then
        var linkPlayed = await Phone.BaconReader.Detail.Comments.ReadVideoAsync("Here is a video link");
        Asserting.That(linkPlayed).PlayedTo("00:10", "00:10");

        // When
        await Phone.BaconReader.Detail.Comments.ScrollToCommentAsync("Just text");

        // Then
        var justText = await Phone.BaconReader.Detail.Comments.ReadAsync("Just text");
        Asserting.That(justText).ShowsNoImage();

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("A picture in text");
        await Phone.BaconReader.Detail.PostText.WaitUntilMediaShownAsync();

        // Then
        var postText = await Phone.BaconReader.Detail.PostText.ReadAsync();
        var postTextLayout = await Phone.BaconReader.Detail.PostText.ReadLayoutAsync();
        Asserting.That(postText).ShowsTheTextWithImages("Look at this", 1);
        Asserting.That(postTextLayout).TheImageStartsWhereTheTextStarts();

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();

        // Then
        var settings = await Phone.BaconReader.PatchesSettings.ReadAsync();
        Asserting.That(settings).ShowsTheSettings(
            new PatchSetting.ShowImages(),
            new PatchSetting.FullWidthByDefault(),
            new PatchSetting.LongPressToDownload(),
            new PatchSetting.LoadImagesOnlyOnWiFi(),
            new PatchSetting.PlayVideosInComments());

        // When
        await Phone.BaconReader.PatchesSettings.TickAsync(new PatchSetting.ShowImages());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Weekly thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilShownAsync();

        // Then
        var noImage = await Phone.BaconReader.Detail.Comments.ReadAsync("Here is an image");
        Asserting.That(noImage).ShowsNoImage();

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.TickAsync(new PatchSetting.ShowImages());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Weekly thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownAsync("Here is an image");

        // Then
        var imageAgain = await Phone.BaconReader.Detail.Comments.ReadAsync("Here is an image");
        Asserting.That(imageAgain).ShowsImages(1);

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.TickAsync(new PatchSetting.FullWidthByDefault());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Media thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownAsync("Another image");

        // Then
        // Not "Here is an image": the patch keeps the size an image's taps chose over the default.
        var fullWidthByDefault = await Phone.BaconReader.Detail.Comments.ReadLayoutAsync("Another image");
        Asserting.That(fullWidthByDefault).TheImageFillsTheCommentsWidth();

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.TickAsync(new PatchSetting.LongPressToDownload());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Weekly thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownAsync("Here is an image");
        await Phone.BaconReader.Detail.Comments.LongClickImageAsync("Here is an image");
        await Phone.Downloads.WaitUntilNoImageSavedAsync();

        // Then
        // Not on the screen: the test reads the phone's files. Only the image the first long press saved is there.
        var downloadsAgain = await Phone.Downloads.ReadAsync();
        Asserting.That(downloadsAgain).HoldsTheImage(commentsImage);

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.TickAsync(new PatchSetting.PlayVideosInComments());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Media thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.ScrollToCommentAsync("Here is a video");

        // Then
        var noVideo = await Phone.BaconReader.Detail.Comments.ReadAsync("Here is a video");
        Asserting.That(noVideo).ShowsNoVideo();
    }
}
