// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Reddit;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Media;

/// <summary>
/// "Improve post media loading": while a post's GIF downloads, a loading bar shows with its size, which the patch tells
/// UiAutomator in the media view's description ("Loading media, GIF · 0.4 MB"); a gallery's thumbnail strip loads small
/// previews, not the full images; and "JavaScript in link posts", "Blocked sites" and "Allowed sites" decide whether a
/// link post's page runs its script, in the post's slide show (BaconReader's own browser always runs it); and when an
/// image fails to load, the bar turns red, which the media view's description tells ("Media failed to load"). Left out:
/// the RedGIFs message, which needs RedGIFs.
/// </summary>
public sealed class ImprovePostMediaLoadingTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Improve post media loading shows the download of post media and runs JavaScript in link posts by its settings
          Given Reddit has a GIF post "Slow GIF" in r/e2e
          And Reddit answers the media of "Slow GIF" 8 seconds late
          And Reddit has a gallery post "Album" in r/e2e of 3 images
          And Reddit has an image post "Broken image" in r/e2e
          And Reddit answers the image of "Broken image" with an error
          And Reddit has a link post "Link with a preview" in r/e2e to a page that runs JavaScript
          And BaconReader is patched with every patch
          And BaconReader is open
          And the test account is logged in
          When I select the "e2e" feed
          And I tap "More options" in the toolbar
          And I tap "List View"
          And I tap the thumbnail of "Slow GIF"
          # The size Reddit tells for the GIF before it sends it.
          Then the media shows its loading bar with "GIF · 0.4 MB"
          When I wait for the GIF to arrive
          Then the media shows no loading bar
          When I go back to the posts
          And I tap the thumbnail of "Album"
          # Not on the screen: the fake Reddit records what BaconReader asked for.
          Then Reddit served the gallery's 3 thumbnails as previews 216 pixels wide, and no full image for them
          And the gallery shows its first image
          When I go back to the posts
          And I tap the thumbnail of "Broken image"
          Then the media shows its loading bar as failed
          When I go back to the posts
          And I tap the post "Link with a preview"
          And I tap "Slide Show View" in the toolbar
          And I tap "Tap to open link"
          # BaconReader's own browser, which a thumbnail opens, always runs JavaScript; the post's page in its slide show follows the settings.
          # "JavaScript in link posts" is on, and no site is blocked. Not on the screen: the page's script asks Reddit for the page again.
          Then the page of "Link with a preview" ran its script
          When I tap "Detail View" in the toolbar
          And I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I scroll to "Allowed sites"
          Then the settings show "JavaScript in link posts", "Blocked sites" and "Allowed sites", in this order
          # The page is on the fake Reddit's host, 127.0.0.1.
          When I tap "Blocked sites"
          And I type "127.0.0.1" in "Blocked sites"
          And I tap "OK"
          And I go back to the posts
          And I tap the post "Link with a preview"
          And I tap "Slide Show View" in the toolbar
          And I tap "Tap to open link"
          Then the page of "Link with a preview" didn't run its script
          When I tap "Detail View" in the toolbar
          And I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I scroll to "Allowed sites"
          And I tap "JavaScript in link posts"
          And I go back to the posts
          And I tap the post "Link with a preview"
          And I tap "Slide Show View" in the toolbar
          And I tap "Tap to open link"
          # Off, only the allowed sites run JavaScript.
          Then the page of "Link with a preview" didn't run its script
          When I tap "Detail View" in the toolbar
          And I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I scroll to "Allowed sites"
          And I tap "Allowed sites"
          And I type "127.0.0.1" in "Allowed sites"
          And I tap "OK"
          And I go back to the posts
          And I tap the post "Link with a preview"
          And I tap "Slide Show View" in the toolbar
          And I tap "Tap to open link"
          Then the page of "Link with a preview" ran its script
        """)]
    public async Task ImprovePostMediaLoadingShowsTheDownloadOfPostMediaAndRunsJavaScriptInLinkPostsByItsSettings(Screen screen)
    {
        // Given
        Reddit.HasAGifPost("Slow GIF", "e2e");
        Reddit.AnswersTheMediaOfThePostLate("Slow GIF", 8);
        Reddit.HasAGalleryPostOf("Album", "e2e", 3);
        Reddit.HasAnImagePost("Broken image", "e2e");
        Reddit.AnswersTheImageOfThePostWithAnError("Broken image");
        Reddit.HasALinkPostToAPageThatRunsJavaScript("Link with a preview", "e2e");
        await Phone.BaconReader.OpenAsync();
        await Phone.BaconReader.LogInWithTheTestAccountAsync();

        // When
        await Phone.BaconReader.Main.Toolbar.SelectFeedAsync(new Feed.Subreddit("e2e"));
        await Phone.BaconReader.Main.Toolbar.WaitUntilFeedShownAsync(new Feed.Subreddit("e2e"));
        await Phone.BaconReader.Main.Posts.WaitUntilPostsShownAsync();
        await Phone.BaconReader.Main.Toolbar.ClickMoreOptionsAsync();
        await Phone.BaconReader.Main.Toolbar.MoreOptions.WaitUntilShownAsync();
        await Phone.BaconReader.Main.Toolbar.MoreOptions.ClickAsync(new OverflowMenuEntry.ListView());
        await Phone.BaconReader.Main.Posts.WaitUntilShownAsRowsAsync();
        await Phone.BaconReader.Main.Posts.ClickThumbnailAsync("Slow GIF");
        await Phone.BaconReader.MediaViewer.WaitUntilLoadingWithSizeShownAsync();

        // Then
        // The size Reddit tells for the GIF before it sends it.
        var loading = await Phone.BaconReader.MediaViewer.ReadAsync();
        Asserting.That(loading).ShowsItsLoadingBarWith("GIF · 0.4 MB");

        // When
        await Phone.BaconReader.MediaViewer.WaitUntilLoadedAsync();

        // Then
        var loaded = await Phone.BaconReader.MediaViewer.ReadAsync();
        Asserting.That(loaded).ShowsNoLoadingBar();

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickThumbnailAsync("Album");
        await Phone.BaconReader.MediaViewer.WaitUntilGalleryShownAsync();

        // Then
        // Not on the screen: the fake Reddit records what BaconReader asked for.
        var gallery = Reddit.ReadRequestsForTheGalleryOf("Album");
        var shown = await Phone.BaconReader.MediaViewer.ReadAsync();
        Asserting.That(gallery).ServedItsThumbnailsAsPreviews(3, 216);
        Asserting.That(shown).ShowsTheGalleryWith(3);
        Asserting.That(gallery).ServedTheFirstImageWhole();

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickThumbnailAsync("Broken image");
        await Phone.BaconReader.MediaViewer.WaitUntilLoadingFailedAsync();

        // Then
        var failed = await Phone.BaconReader.MediaViewer.ReadAsync();
        Asserting.That(failed).ShowsItsLoadingBarAsFailed();

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Link with a preview");
        await Phone.BaconReader.Detail.WaitUntilShownAsync();
        await Phone.BaconReader.SlideShow.ClickSlideShowViewAsync();
        await Phone.BaconReader.SlideShow.WaitUntilTapToOpenLinkShownAsync();
        await Phone.BaconReader.SlideShow.ClickTapToOpenLinkAsync();
        await Phone.BaconReader.SlideShow.WaitUntilPageShownAsync();
        await Reddit.WaitUntilThePageOfThePostIsServedAsync("Link with a preview");

        // Then
        // "JavaScript in link posts" is on, and no site is blocked. Not on the screen: the page's script asks Reddit for the page again.
        var allSites = Reddit.ReadTheScriptRunsOfThePage("Link with a preview");
        Asserting.That(allSites).RanItsScript();

        // When
        await Phone.BaconReader.SlideShow.ClickDetailViewAsync();
        await Phone.BaconReader.SlideShow.WaitUntilDetailViewShownAsync();
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.AllowedSites());

        // Then
        var settings = await Phone.BaconReader.PatchesSettings.ReadAsync();
        Asserting.That(settings).ShowsTheSettings(new PatchSetting.JavaScriptInLinkPosts(), new PatchSetting.BlockedSites(), new PatchSetting.AllowedSites());

        // When
        // The page is on the fake Reddit's host, 127.0.0.1.
        await Phone.BaconReader.PatchesSettings.ClickAsync(new PatchSetting.BlockedSites());
        await Phone.BaconReader.PatchesSettings.WaitUntilTextFieldShownAsync();
        await Phone.BaconReader.PatchesSettings.TypeAsync("127.0.0.1");
        await Phone.BaconReader.PatchesSettings.ClickOkAsync();
        await Phone.BaconReader.PatchesSettings.WaitUntilDialogClosedAsync(new PatchSetting.BlockedSites());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Link with a preview");
        await Phone.BaconReader.Detail.WaitUntilShownAsync();
        await Phone.BaconReader.SlideShow.ClickSlideShowViewAsync();
        await Phone.BaconReader.SlideShow.WaitUntilTapToOpenLinkShownAsync();
        await Phone.BaconReader.SlideShow.ClickTapToOpenLinkAsync();
        await Phone.BaconReader.SlideShow.WaitUntilPageShownAsync();
        await Reddit.WaitUntilThePageOfThePostIsServedAsync("Link with a preview");

        // Then
        var blocked = Reddit.ReadTheScriptRunsOfThePage("Link with a preview");
        Asserting.That(blocked).DidntRunItsScript();

        // When
        await Phone.BaconReader.SlideShow.ClickDetailViewAsync();
        await Phone.BaconReader.SlideShow.WaitUntilDetailViewShownAsync();
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.AllowedSites());
        await Phone.BaconReader.PatchesSettings.TickAsync(new PatchSetting.JavaScriptInLinkPosts());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Link with a preview");
        await Phone.BaconReader.Detail.WaitUntilShownAsync();
        await Phone.BaconReader.SlideShow.ClickSlideShowViewAsync();
        await Phone.BaconReader.SlideShow.WaitUntilTapToOpenLinkShownAsync();
        await Phone.BaconReader.SlideShow.ClickTapToOpenLinkAsync();
        await Phone.BaconReader.SlideShow.WaitUntilPageShownAsync();
        await Reddit.WaitUntilThePageOfThePostIsServedAsync("Link with a preview");

        // Then
        // Off, only the allowed sites run JavaScript.
        var off = Reddit.ReadTheScriptRunsOfThePage("Link with a preview");
        Asserting.That(off).DidntRunItsScript();

        // When
        await Phone.BaconReader.SlideShow.ClickDetailViewAsync();
        await Phone.BaconReader.SlideShow.WaitUntilDetailViewShownAsync();
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.AllowedSites());
        await Phone.BaconReader.PatchesSettings.ClickAsync(new PatchSetting.AllowedSites());
        await Phone.BaconReader.PatchesSettings.WaitUntilTextFieldShownAsync();
        await Phone.BaconReader.PatchesSettings.TypeAsync("127.0.0.1");
        await Phone.BaconReader.PatchesSettings.ClickOkAsync();
        await Phone.BaconReader.PatchesSettings.WaitUntilDialogClosedAsync(new PatchSetting.AllowedSites());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Link with a preview");
        await Phone.BaconReader.Detail.WaitUntilShownAsync();
        await Phone.BaconReader.SlideShow.ClickSlideShowViewAsync();
        await Phone.BaconReader.SlideShow.WaitUntilTapToOpenLinkShownAsync();
        await Phone.BaconReader.SlideShow.ClickTapToOpenLinkAsync();
        await Phone.BaconReader.SlideShow.WaitUntilPageShownAsync();
        await Reddit.WaitUntilThePageOfThePostIsServedAsync("Link with a preview");

        // Then
        var allowed = Reddit.ReadTheScriptRunsOfThePage("Link with a preview");
        Asserting.That(allowed).RanItsScript();
    }
}
