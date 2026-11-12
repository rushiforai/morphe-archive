// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;

/// <summary>What a test checks on a comment's video in full screen.</summary>
public static class VideoFullScreenLayoutSnapshotAssertions
{
    /// <summary>The video fills the screen: its view covers the whole window.</summary>
    public static AssertingThat<VideoFullScreenLayoutSnapshot> FillsTheScreen(this AssertingThat<VideoFullScreenLayoutSnapshot> that)
    {
        var layout = that.InstanceToAssert;
        Assert.True(
            layout.Video == layout.Window,
            $"The full screen shows the video in {layout.Video}, but the whole window, {layout.Window}, was expected.");
        return that;
    }

    /// <summary>The screen is turned sideways: the window is wider than high.</summary>
    public static AssertingThat<VideoFullScreenLayoutSnapshot> IsSideways(this AssertingThat<VideoFullScreenLayoutSnapshot> that)
    {
        var layout = that.InstanceToAssert;
        Assert.True(
            layout.Window.Width > layout.Window.Height,
            $"The full screen is {layout.Window.Width}×{layout.Window.Height} px, but a screen turned sideways, wider than high, was expected.");
        return that;
    }
}
