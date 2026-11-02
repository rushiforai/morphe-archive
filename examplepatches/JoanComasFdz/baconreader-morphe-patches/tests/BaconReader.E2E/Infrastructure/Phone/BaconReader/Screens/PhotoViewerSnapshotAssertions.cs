// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks of BaconReader's photo viewer.</summary>
public static class PhotoViewerSnapshotAssertions
{
    /// <summary>BaconReader's photo viewer shows, with its photo.</summary>
    public static AssertingThat<PhotoViewerSnapshot> IsShown(this AssertingThat<PhotoViewerSnapshot> that)
    {
        Assert.True(that.InstanceToAssert.Shown, "BaconReader's photo viewer doesn't show, but it was expected with the image.");
        return that;
    }
}
