// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Reddit;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Posts;

/// <summary>
/// "Fix slide show": in the Slide Show View, each post's page fits the screen, its card ending above the sort bar and
/// the bottom bar, and an image post's long text, expanded, scrolls inside the card to its end. BaconReader sized the
/// page from the display, which newer Android versions report with the status and navigation bars, so the page ran on
/// behind the bottom bar; an expanded text was cut off at the card's bottom.
/// </summary>
public sealed class FixSlideShowTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Fix slide show fits each post to the screen and scrolls a post's long text
          Given Reddit has an image post "Long caption" in r/e2e with 25 paragraphs of text, "Paragraph 1" to "Paragraph 25"
          And Reddit has a gallery post "Three photos" in r/e2e of 3 images
          And BaconReader is patched with every patch
          And the test account is logged in
          And BaconReader is open
          When I tap the post "Long caption"
          And I tap "Slide Show View" in the toolbar
          # The page used to run on behind the bottom bar, cutting the post's text.
          Then the post's card ends above the bottom bar
          And the post's text shows "...see more" above the bottom bar
          When I tap the post's text
          And I scroll the post's text to its end
          Then the post's text shows "Paragraph 25" above the bottom bar
          When I tap "Detail View" in the toolbar
          And I go back to the posts
          And I tap the post "Three photos"
          And I tap "Slide Show View" in the toolbar
          # "Auto load web links in Slide Show" is off: a gallery waits for a tap.
          And I tap "Tap to open link"
          Then the gallery's thumbnails show above the bottom bar
          When I tap "Detail View" in the toolbar
        """)]
    public async Task FixSlideShowFitsEachPostToTheScreenAndScrollsAPostsLongText(Screen screen)
    {
        // Given
        Reddit.HasAnImagePostWithParagraphs("Long caption", "e2e", 25);
        Reddit.HasAGalleryPostOf("Three photos", "e2e", 3);
        Reddit.TheTestAccountIsLoggedIn();
        await Phone.BaconReader.OpenAsync();

        // When
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Long caption");
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Long caption");
        await Phone.BaconReader.SlideShow.ClickSlideShowViewAsync();
        await Phone.BaconReader.SlideShow.WaitUntilSlideShowShownAsync();
        await Phone.BaconReader.SlideShow.WaitUntilPostTextShownAsync();

        // Then
        // The page used to run on behind the bottom bar, cutting the post's text.
        var page = await Phone.BaconReader.SlideShow.ReadLayoutAsync();
        Asserting.That(page)
            .TheCardEndsAboveTheBottomBar()
            .ThePostTextShowsAboveTheBottomBar("...see more");

        // When
        await Phone.BaconReader.SlideShow.ClickPostTextAsync();
        await Phone.BaconReader.SlideShow.WaitUntilPostTextExpandedAsync();
        await Phone.BaconReader.SlideShow.ScrollPostTextToItsEndAsync();

        // Then
        var scrolled = await Phone.BaconReader.SlideShow.ReadLayoutAsync();
        Asserting.That(scrolled).ThePostTextShowsAboveTheBottomBar("Paragraph 25");

        // When
        await Phone.BaconReader.SlideShow.ClickDetailViewAsync();
        await Phone.BaconReader.SlideShow.WaitUntilDetailViewShownAsync();
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.WaitUntilPostShownAsync("Three photos");
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Three photos");
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Three photos");
        await Phone.BaconReader.SlideShow.ClickSlideShowViewAsync();
        // "Auto load web links in Slide Show" is off: a gallery waits for a tap.
        await Phone.BaconReader.SlideShow.WaitUntilTapToOpenLinkShownAsync();
        await Phone.BaconReader.SlideShow.ClickTapToOpenLinkAsync();
        await Phone.BaconReader.SlideShow.WaitUntilGalleryShownAsync();

        // Then
        var gallery = await Phone.BaconReader.SlideShow.ReadLayoutAsync();
        Asserting.That(gallery).TheGalleryThumbnailsShowAboveTheBottomBar();

        // When
        await Phone.BaconReader.SlideShow.ClickDetailViewAsync();
        await Phone.BaconReader.SlideShow.WaitUntilDetailViewShownAsync();
    }
}
