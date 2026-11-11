// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Reddit;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Media;

/// <summary>
/// "Fix meme templates": the drawing screen's meme templates were on BaconReader's server, which answers 404 for all
/// of them. The patch shows Imgflip's 100 most used templates instead, as Imgflip's thumbnails, and downloads a tapped
/// one at full size as the drawing's background. A template Imgflip doesn't have at full size leaves the grid open.
/// </summary>
public sealed class FixMemeTemplatesTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Fix meme templates shows Imgflip's templates and draws on the one tapped
          Given Imgflip has its meme templates
          And Imgflip has removed its template "Two Buttons"
          And Reddit has a post "Meme thread" in r/e2e
          And the post "Meme thread" has a comment "Reply here"
          And BaconReader is patched with every patch
          And the test account is logged in
          And BaconReader is open
          When I tap the post "Meme thread"
          And I swipe the comment "Reply here" to its action bar
          And I tap "Comment" in the comment's action bar
          And I type "My meme"
          And I tap "Attach media"
          And I tap "Draw"
          And I tap "Camera"
          And I tap "Memes"
          Then the meme templates show
          # On the setup page: the fake Imgflip records what BaconReader asked for. A thumbnail shows no text to read.
          And Imgflip served the thumbnail of every template shown
          # "Two Buttons" is the second template.
          When I tap the template "Two Buttons"
          # The patch says "Could not load the full template" in a toast, which UiAutomator2 doesn't see.
          Then the meme templates still show
          # "Drake Hotline Bling" is the first template.
          When I tap the template "Drake Hotline Bling"
          Then the drawing screen shows
          # On the setup page: the patch downloads the template at full size, not the grid's thumbnail.
          And Imgflip served the template "Drake Hotline Bling" at full size
          When I tap "Accept"
          # BaconReader puts the drawing in the reply as a tag.
          Then the text box shows "My meme #IMG_01"
        """)]
    public async Task FixMemeTemplatesShowsImgflipsTemplatesAndDrawsOnTheOneTapped(Screen screen)
    {
        // Given
        Reddit.ImgflipHasItsMemeTemplates();
        Reddit.ImgflipHasRemovedItsTemplate("Two Buttons");
        Reddit.HasAPost("Meme thread", "e2e");
        Reddit.ThePost("Meme thread").HasAComment("Reply here");
        Reddit.TheTestAccountIsLoggedIn();
        await Phone.BaconReader.OpenAsync();

        // When
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Meme thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("Reply here");
        await Phone.BaconReader.Detail.Comments.SwipeToActionBarAsync("Reply here");
        await Phone.BaconReader.Detail.Comments.WaitUntilActionBarShownAsync();
        await Phone.BaconReader.Detail.Comments.ClickActionBarCommentAsync();
        await Phone.BaconReader.ReplyScreen.WaitUntilShownAsync();
        await Phone.BaconReader.ReplyScreen.Editor.TypeAsync("My meme");
        await Phone.BaconReader.ReplyScreen.ClickAttachMediaAsync();
        await Phone.BaconReader.ReplyScreen.AttachMedia.WaitUntilShownAsync();
        await Phone.BaconReader.ReplyScreen.AttachMedia.ClickAsync(new MediaSource.Draw());
        await Phone.BaconReader.DrawChat.WaitUntilShownAsync();
        await Phone.BaconReader.DrawChat.ClickCameraAsync();
        await Phone.BaconReader.DrawChat.Background.WaitUntilShownAsync();
        await Phone.BaconReader.DrawChat.Background.ClickAsync(new DrawingBackground.Memes());
        await Phone.BaconReader.MemeTemplates.WaitUntilShownAsync();
        var shownTemplates = await Phone.BaconReader.MemeTemplates.ReadAsync();
        await Reddit.WaitUntilImgflipServedTheThumbnailsAsync(shownTemplates.Thumbnails);

        // Then
        // On the setup page: the fake Imgflip records what BaconReader asked for. A thumbnail shows no text to read.
        var templates = await Phone.BaconReader.MemeTemplates.ReadAsync();
        var thumbnails = Reddit.ReadRequestsForTheThumbnailsOfTheFirstTemplates(templates.Thumbnails);
        Asserting.That(templates).ShowTheTemplates();
        Asserting.That(thumbnails).ServedEveryThumbnail();

        // When
        // "Two Buttons" is the second template.
        await Phone.BaconReader.MemeTemplates.ClickTemplateAsync(Reddit.ThePlaceOfTheTemplate("Two Buttons"));
        await Reddit.WaitUntilImgflipAnsweredTheTemplateAsync("Two Buttons");
        await Phone.BaconReader.MemeTemplates.WaitUntilLoadingEndedAsync();

        // Then
        // The patch says "Could not load the full template" in a toast, which UiAutomator2 doesn't see.
        var stillTemplates = await Phone.BaconReader.MemeTemplates.ReadAsync();
        Asserting.That(stillTemplates).ShowTheTemplates();

        // When
        // "Drake Hotline Bling" is the first template.
        await Phone.BaconReader.MemeTemplates.ClickTemplateAsync(Reddit.ThePlaceOfTheTemplate("Drake Hotline Bling"));
        await Phone.BaconReader.DrawChat.WaitUntilShownAsync();

        // Then
        // On the setup page: the patch downloads the template at full size, not the grid's thumbnail.
        var drawing = await Phone.BaconReader.DrawChat.ReadAsync();
        var drake = Reddit.ReadRequestsForTheTemplateAtFullSize("Drake Hotline Bling");
        Asserting.That(drawing).IsShown();
        Asserting.That(drake).ServedItAtFullSize();

        // When
        await Phone.BaconReader.DrawChat.ClickAcceptAsync();
        await Phone.BaconReader.ReplyScreen.Editor.WaitUntilTextShownAsync("My meme #IMG_01");

        // Then
        // BaconReader puts the drawing in the reply as a tag.
        var reply = await Phone.BaconReader.ReplyScreen.Editor.ReadAsync();
        Asserting.That(reply).ShowsTheText("My meme #IMG_01");
    }
}
