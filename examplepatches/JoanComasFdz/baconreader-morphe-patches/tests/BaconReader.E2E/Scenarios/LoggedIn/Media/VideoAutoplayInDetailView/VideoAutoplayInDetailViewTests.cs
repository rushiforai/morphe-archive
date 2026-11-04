// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Reddit;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Media;

/// <summary>
/// "Video autoplay in detail view": "Autoplay videos in Detail View", on by default, lets a video post's video play when
/// the post opens; off, the post shows its preview with a play button, described "Play video", and Reddit isn't asked
/// for the video until it is tapped. A GIF plays either way. BaconReader shows a post's media in its detail view only
/// with its own "Show large image" on.
/// </summary>
public sealed class VideoAutoplayInDetailViewTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Video autoplay in detail view shows a video post's preview with a play button while its setting is off
          Given Reddit has a video post "Watch this" in r/e2e
          And Reddit has a GIF post "Dancing" in r/e2e
          And BaconReader is patched with every patch
          And BaconReader is open
          And the test account is logged in
          When I select the "e2e" feed
          And I open the left menu
          And I tap "Settings"
          And I tap "Detail View"
          # BaconReader shows a post's media in its detail view only with "Show large image" on.
          And I tap "Show large image"
          And I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I scroll to "Autoplay videos in Detail View"
          Then the setting "Autoplay videos in Detail View" is on
          When I go back to the posts
          And I tap the post "Watch this"
          Then the post plays its video
          And Reddit served the video of "Watch this"
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I scroll to "Autoplay videos in Detail View"
          And I tap "Autoplay videos in Detail View"
          And I go back to the posts
          And I tap the post "Watch this"
          Then the post shows "Play video" over its preview
          And Reddit didn't serve the video of "Watch this" since the post opened
          When I tap "Play video"
          Then the post plays its video
          And Reddit served the video of "Watch this"
          When I go back to the posts
          And I tap the post "Dancing"
          # GIFs aren't affected.
          Then the post shows its GIF, without "Play video"
          And Reddit served the GIF of "Dancing"
        """)]
    public async Task VideoAutoplayInDetailViewShowsAVideoPostsPreviewWithAPlayButtonWhileItsSettingIsOff(Screen screen)
    {
        // Given
        Reddit.HasAVideoPost("Watch this", "e2e");
        Reddit.HasAGifPost("Dancing", "e2e");
        await Phone.BaconReader.OpenAsync();
        await Phone.BaconReader.LogInWithTheTestAccountAsync();

        // When
        await Phone.BaconReader.Main.Toolbar.SelectFeedAsync(new Feed.Subreddit("e2e"));
        await Phone.BaconReader.Main.Toolbar.WaitUntilFeedShownAsync(new Feed.Subreddit("e2e"));
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.DetailView());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.DetailView());
        await Phone.BaconReader.Settings.WaitUntilSectionShownAsync(new SettingsSection.DetailView());
        await Phone.BaconReader.Settings.TickAsync(new BaconReaderSetting.ShowLargeImage());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.AutoplayVideosInDetailView());

        // Then
        var autoplay = await Phone.BaconReader.PatchesSettings.ReadSwitchAsync(new PatchSetting.AutoplayVideosInDetailView());
        Asserting.That(autoplay).IsOn();

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Watch this");
        await Phone.BaconReader.Detail.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.PostMedia.WaitUntilVideoPlaysAsync();
        await Reddit.WaitUntilTheVideoOfThePostIsServedAsync("Watch this");

        // Then
        var playing = await Phone.BaconReader.Detail.PostMedia.ReadAsync();
        var video = Reddit.ReadRequestsForTheVideoOf("Watch this");
        Asserting.That(playing).PlaysItsVideo();
        Asserting.That(video).Served();

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.AutoplayVideosInDetailView());
        await Phone.BaconReader.PatchesSettings.TickAsync(new PatchSetting.AutoplayVideosInDetailView());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Watch this");
        await Phone.BaconReader.Detail.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.PostMedia.WaitUntilPlayVideoShownAsync();

        // Then
        var preview = await Phone.BaconReader.Detail.PostMedia.ReadAsync();
        var noVideo = Reddit.ReadRequestsForTheVideoOf("Watch this");
        Asserting.That(preview).ShowsPlayVideoOverItsPreview();
        Asserting.That(noVideo).DidntServe();

        // When
        await Phone.BaconReader.Detail.PostMedia.ClickPlayVideoAsync();
        await Phone.BaconReader.Detail.PostMedia.WaitUntilVideoPlaysAsync();
        await Reddit.WaitUntilTheVideoOfThePostIsServedAsync("Watch this");

        // Then
        var tapped = await Phone.BaconReader.Detail.PostMedia.ReadAsync();
        var tappedVideo = Reddit.ReadRequestsForTheVideoOf("Watch this");
        Asserting.That(tapped).PlaysItsVideo();
        Asserting.That(tappedVideo).Served();

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Dancing");
        await Phone.BaconReader.Detail.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.PostMedia.WaitUntilShownAsync();
        await Reddit.WaitUntilTheGifOfThePostIsServedAsync("Dancing");

        // Then
        // GIFs aren't affected.
        var gif = await Phone.BaconReader.Detail.PostMedia.ReadAsync();
        var gifServed = Reddit.ReadRequestsForTheGifOf("Dancing");
        Asserting.That(gif).ShowsItsMediaWithoutPlayVideo();
        Asserting.That(gifServed).Served();
    }
}
