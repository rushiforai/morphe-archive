// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;

/// <summary>What a test checks on the full-screen image viewer.</summary>
public static class ImageViewerLayoutSnapshotAssertions
{
    /// <summary>The image fills the screen: its view covers the whole window.</summary>
    public static AssertingThat<ImageViewerLayoutSnapshot> FillsTheScreen(this AssertingThat<ImageViewerLayoutSnapshot> that)
    {
        var layout = that.InstanceToAssert;
        Assert.True(
            layout.Image == layout.Window,
            $"The image viewer shows the image in {layout.Image}, but the whole window, {layout.Window}, was expected.");
        return that;
    }
}
