// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Media;

/// <summary>
/// "Save videos with sound": "Save to device" saves a Reddit video's picture, its fallback MP4; the patch then
/// downloads the sound track its DASH playlist names and puts it in the saved file. A video whose playlist has no sound
/// track is left as it is. The first save asks for a folder: Downloads/BaconReader.
/// </summary>
public sealed class SaveVideosWithSoundTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Save videos with sound adds the sound to a saved Reddit video
          Given Reddit has a video post "Watch this" in r/e2e with sound
          And Reddit has a video post "Silent clip" in r/e2e without sound
          And BaconReader is patched with every patch
          And BaconReader is open
          And the test account is logged in
          When I select the "e2e" feed
          And I tap "More options" in the toolbar
          And I tap "List View"
          And I tap the thumbnail of "Watch this"
          And I tap "More options" in the toolbar
          And I tap "Save"
          And I tap "SAVE TO DEVICE" on "Where do you want to save?"
          And I tap "OPEN" on "Image storage location"
          And I choose the folder Downloads/BaconReader
          Then Downloads/BaconReader holds "watch_this.mp4"
          # Not on the screen: the file is read with ffprobe.
          And "watch_this.mp4" has a video track and a sound track
          When I go back to the posts
          And I tap the thumbnail of "Silent clip"
          And I tap "More options" in the toolbar
          And I tap "Save"
          And I tap "SAVE TO DEVICE" on "Where do you want to save?"
          Then Downloads/BaconReader holds "silent_clip.mp4"
          # Its DASH playlist has no sound track: the saved video is left as it is.
          And "silent_clip.mp4" has a video track and no sound track
        """)]
    public async Task SaveVideosWithSoundAddsTheSoundToASavedRedditVideo(Screen screen)
    {
        // Given
        Reddit.HasAVideoPostWithSound("Watch this", "e2e");
        Reddit.HasAVideoPostWithoutSound("Silent clip", "e2e");
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
        await Phone.BaconReader.Main.Posts.ClickThumbnailAsync("Watch this");
        await Phone.BaconReader.MediaViewer.WaitUntilShownAsync();
        await Phone.BaconReader.MediaViewer.ClickMoreOptionsAsync();
        await Phone.BaconReader.MediaViewer.MoreOptions.WaitUntilEntryShownAsync(new OverflowMenuEntry.Save());
        await Phone.BaconReader.MediaViewer.MoreOptions.ClickAsync(new OverflowMenuEntry.Save());
        await Phone.BaconReader.WhereToSave.WaitUntilShownAsync();
        await Phone.BaconReader.WhereToSave.ClickSaveToDeviceAsync();
        await Phone.BaconReader.ImageStorageLocation.WaitUntilShownAsync();
        await Phone.BaconReader.ImageStorageLocation.ClickOpenAsync();
        await Phone.FolderPicker.WaitUntilShownAsync();
        await Phone.FolderPicker.ChooseDownloadsBaconReaderAsync();
        await Phone.Downloads.WaitUntilFileSavedAsync("watch_this.mp4");

        // Then
        var saved = await Phone.Downloads.ReadAsync();
        // Not on the screen: the file is read with ffprobe.
        var withSound = await Phone.Downloads.ReadVideoAsync("watch_this.mp4");
        Asserting.That(saved).Holds("watch_this.mp4");
        Asserting.That(withSound).HasAVideoTrackAndASoundTrack();

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickThumbnailAsync("Silent clip");
        await Phone.BaconReader.MediaViewer.WaitUntilShownAsync();
        await Phone.BaconReader.MediaViewer.ClickMoreOptionsAsync();
        await Phone.BaconReader.MediaViewer.MoreOptions.WaitUntilEntryShownAsync(new OverflowMenuEntry.Save());
        await Phone.BaconReader.MediaViewer.MoreOptions.ClickAsync(new OverflowMenuEntry.Save());
        await Phone.BaconReader.WhereToSave.WaitUntilShownAsync();
        await Phone.BaconReader.WhereToSave.ClickSaveToDeviceAsync();
        await Phone.Downloads.WaitUntilFileSavedAsync("silent_clip.mp4");

        // Then
        var savedAgain = await Phone.Downloads.ReadAsync();
        // Its DASH playlist has no sound track: the saved video is left as it is.
        var silent = await Phone.Downloads.ReadVideoAsync("silent_clip.mp4");
        Asserting.That(savedAgain).Holds("silent_clip.mp4");
        Asserting.That(silent).HasAVideoTrackAndNoSoundTrack();
    }
}
