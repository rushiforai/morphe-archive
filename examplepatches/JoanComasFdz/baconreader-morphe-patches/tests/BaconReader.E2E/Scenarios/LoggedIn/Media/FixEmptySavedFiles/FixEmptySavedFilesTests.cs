// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Media;

/// <summary>
/// "Fix empty saved files": "Save to device" saves a post's media without leaving an empty file next to it. BaconReader
/// makes "&lt;title&gt;.jpg" first, then downloads into "&lt;title&gt;.&lt;the URL's extension&gt;", so every media
/// but a JPEG left an empty file; the patch removes it. The first save asks for a folder: Downloads/BaconReader.
/// </summary>
public sealed class FixEmptySavedFilesTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Fix empty saved files saves media without an empty file next to it
          Given Reddit has a GIF post "Dancing" in r/e2e
          And Reddit has an image post "Picture" in r/e2e
          And BaconReader is patched with every patch
          And BaconReader is open
          And the test account is logged in
          When I select the "e2e" feed
          And I tap "More options" in the toolbar
          And I tap "List View"
          And I tap the thumbnail of "Dancing"
          And I tap "More options" in the toolbar
          And I tap "Save"
          And I tap "SAVE TO DEVICE" on "Where do you want to save?"
          And I tap "OPEN" on "Image storage location"
          And I choose the folder Downloads/BaconReader
          # The name of a GIF post's file: its title and the extension of its URL. BaconReader made "dancing.jpg" first and left it empty.
          Then Downloads/BaconReader holds only "dancing.gif", not empty
          # A JPEG: the file BaconReader makes first is the one it saves.
          When I go back to the posts
          And I tap the thumbnail of "Picture"
          And I tap "More options" in the toolbar
          And I tap "Save"
          And I tap "SAVE TO DEVICE" on "Where do you want to save?"
          Then Downloads/BaconReader holds only "dancing.gif" and "picture.jpg", none of them empty
        """)]
    public async Task FixEmptySavedFilesSavesMediaWithoutAnEmptyFileNextToIt(Screen screen)
    {
        // Given
        Reddit.HasAGifPost("Dancing", "e2e");
        Reddit.HasAnImagePost("Picture", "e2e");
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
        await Phone.BaconReader.Main.Posts.ClickThumbnailAsync("Dancing");
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
        await Phone.Downloads.WaitUntilFileSavedAsync("dancing.gif");

        // Then
        // The name of a GIF post's file: its title and the extension of its URL. BaconReader made "dancing.jpg" first and left it empty.
        var gif = await Phone.Downloads.ReadAsync();
        Asserting.That(gif).HoldsOnly("dancing.gif");

        // When
        // A JPEG: the file BaconReader makes first is the one it saves.
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickThumbnailAsync("Picture");
        await Phone.BaconReader.MediaViewer.WaitUntilShownAsync();
        await Phone.BaconReader.MediaViewer.ClickMoreOptionsAsync();
        await Phone.BaconReader.MediaViewer.MoreOptions.WaitUntilEntryShownAsync(new OverflowMenuEntry.Save());
        await Phone.BaconReader.MediaViewer.MoreOptions.ClickAsync(new OverflowMenuEntry.Save());
        await Phone.BaconReader.WhereToSave.WaitUntilShownAsync();
        await Phone.BaconReader.WhereToSave.ClickSaveToDeviceAsync();
        await Phone.Downloads.WaitUntilFileSavedAsync("picture.jpg");

        // Then
        var both = await Phone.Downloads.ReadAsync();
        Asserting.That(both).HoldsOnly("dancing.gif", "picture.jpg");
    }
}
