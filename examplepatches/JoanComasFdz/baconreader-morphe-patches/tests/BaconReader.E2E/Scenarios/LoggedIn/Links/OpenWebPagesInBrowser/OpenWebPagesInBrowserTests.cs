// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Phone.Chrome;
using BaconReader.E2E.Infrastructure.Reddit;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Links;

/// <summary>
/// "Open web pages in the browser": a link to a web page opens in the phone's browser, while images, GIFs, galleries
/// and videos keep opening in BaconReader, whether or not "Open links inside app" is on.
/// </summary>
public sealed class OpenWebPagesInBrowserTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Open web pages in the browser opens web pages in Chrome and keeps images and videos in BaconReader
          Given Reddit has a link post "Article" in r/e2e to a page that runs JavaScript
          And the post "Article" has a comment "Read the article" linking to a web page
          And Reddit has an image post "Photo" in r/e2e
          And Reddit has a video post "Clip" in r/e2e
          And BaconReader is patched with every patch
          And the test account is logged in
          And BaconReader is open
          When I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          Then the settings show "Open web pages in the browser" under "Links"
          And "Open web pages in the browser" is off
          When I go back to the posts
          # The link icon has no label: it is the chain icon in the post's bar.
          And I tap the link icon of the post "Article"
          # Off: BaconReader's own behaviour. "Open links inside app" is on, as it is by default.
          Then BaconReader's browser shows the page of "Article"
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I tap "Open web pages in the browser"
          And I go back to the posts
          And I tap the link icon of the post "Article"
          # The phone's browser is Chrome.
          Then Chrome shows the page of "Article"
          When I go back to BaconReader
          And I tap the post "Article"
          And I tap "127.0.0.1" in the post's header
          Then Chrome shows the page of "Article"
          When I go back to BaconReader
          And I tap the link "Read the article"
          Then Chrome shows the web page the comment "Read the article" links to
          When I go back to BaconReader
          And I go back to the posts
          And I tap the link icon of the post "Photo"
          Then BaconReader shows the image of "Photo"
          When I go back to the posts
          And I tap the link icon of the post "Clip"
          # BaconReader's player, its toolbar showing "v.redd.it".
          Then BaconReader plays the video of "Clip"
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Other"
          And I tap "Open links inside app"
          And I go back to the posts
          # Off, BaconReader opens every link in the phone's browser, images too.
          And I tap the link icon of the post "Photo"
          Then BaconReader shows the image of "Photo"
          When I go back to the posts
          And I tap the link icon of the post "Article"
          Then Chrome shows the page of "Article"
        """)]
    public async Task OpenWebPagesInTheBrowserOpensWebPagesInChromeAndKeepsImagesAndVideosInBaconReader(Screen screen)
    {
        // Given
        Reddit.HasALinkPostToAPageThatRunsJavaScript("Article", "e2e");
        Reddit.ThePost("Article").HasACommentLinkingToAWebPage("Read the article");
        Reddit.HasAnImagePost("Photo", "e2e");
        Reddit.HasAVideoPost("Clip", "e2e");
        Reddit.TheTestAccountIsLoggedIn();
        await Phone.BaconReader.OpenAsync();

        // When
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.OpenWebPagesInBrowser(), new PatchesSection.Links());

        // Then
        var place = await Phone.BaconReader.PatchesSettings.ReadPlaceAsync(new PatchSetting.OpenWebPagesInBrowser(), new PatchesSection.Links());
        var setting = await Phone.BaconReader.PatchesSettings.ReadSwitchAsync(new PatchSetting.OpenWebPagesInBrowser());
        Asserting.That(place).ShowsUnderItsSection();
        Asserting.That(setting).IsOff();

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.WaitUntilPostShownAsync("Article");
        await Phone.BaconReader.Main.Posts.ClickLinkIconAsync("Article");
        await Phone.BaconReader.MediaViewer.WaitUntilPageShownAsync();

        // Then
        // Off: BaconReader's own behaviour. "Open links inside app" is on, as it is by default.
        var ownBrowser = await Phone.BaconReader.MediaViewer.ReadAsync();
        Asserting.That(ownBrowser).ShowsThePage(Reddit.ThePageOf("Article"));

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.OpenWebPagesInBrowser(), new PatchesSection.Links());
        await Phone.BaconReader.PatchesSettings.TickAsync(new PatchSetting.OpenWebPagesInBrowser(), new PatchesSection.Links());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.WaitUntilPostShownAsync("Article");
        await Phone.BaconReader.Main.Posts.ClickLinkIconAsync("Article");
        await Phone.Chrome.WaitUntilPageShownAsync();

        // Then
        // The phone's browser is Chrome.
        var article = await Phone.Chrome.ReadAsync();
        Asserting.That(article).ShowsThePage(Reddit.ThePageOf("Article"));

        // When
        await Phone.Chrome.GoBackToBaconReaderAsync();
        await Phone.BaconReader.Main.Posts.WaitUntilPostShownAsync("Article");
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Article");
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Article");
        await Phone.BaconReader.Detail.ClickHeaderLinkAsync("127.0.0.1");
        await Phone.Chrome.WaitUntilPageShownAsync();

        // Then
        var fromTheHeader = await Phone.Chrome.ReadAsync();
        Asserting.That(fromTheHeader).ShowsThePage(Reddit.ThePageOf("Article"));

        // When
        await Phone.Chrome.GoBackToBaconReaderAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("Read the article");
        await Phone.BaconReader.Detail.Comments.ClickLinkAsync("Read the article");
        await Phone.Chrome.WaitUntilPageShownAsync();

        // Then
        var fromTheComment = await Phone.Chrome.ReadAsync();
        Asserting.That(fromTheComment).ShowsThePage(Reddit.ThePageTheCommentLinksTo("Read the article"));

        // When
        await Phone.Chrome.GoBackToBaconReaderAsync();
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Article");
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.WaitUntilPostShownAsync("Photo");
        await Phone.BaconReader.Main.Posts.ClickLinkIconAsync("Photo");
        await Phone.BaconReader.MediaViewer.WaitUntilImageShownAsync();

        // Then
        var photo = await Phone.BaconReader.MediaViewer.ReadAsync();
        Asserting.That(photo).ShowsAnImage();

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.WaitUntilPostShownAsync("Clip");
        await Phone.BaconReader.Main.Posts.ClickLinkIconAsync("Clip");
        await Phone.BaconReader.MediaViewer.WaitUntilVideoPlaysAsync();

        // Then
        // BaconReader's player, its toolbar showing "v.redd.it".
        var clip = await Phone.BaconReader.MediaViewer.ReadAsync();
        Asserting.That(clip).PlaysTheVideo();

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Other());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Other());
        await Phone.BaconReader.Settings.WaitUntilSectionShownAsync(new SettingsSection.Other());
        await Phone.BaconReader.Settings.TickAsync(new BaconReaderSetting.OpenLinksInsideApp());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.WaitUntilPostShownAsync("Photo");
        await Phone.BaconReader.Main.Posts.ClickLinkIconAsync("Photo");
        await Phone.BaconReader.MediaViewer.WaitUntilImageShownAsync();

        // Then
        // Off, BaconReader opens every link in the phone's browser, images too.
        var photoOutsideApp = await Phone.BaconReader.MediaViewer.ReadAsync();
        Asserting.That(photoOutsideApp).ShowsAnImage();

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.WaitUntilPostShownAsync("Article");
        await Phone.BaconReader.Main.Posts.ClickLinkIconAsync("Article");
        await Phone.Chrome.WaitUntilPageShownAsync();

        // Then
        var articleOutsideApp = await Phone.Chrome.ReadAsync();
        Asserting.That(articleOutsideApp).ShowsThePage(Reddit.ThePageOf("Article"));
    }
}
