// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on a post's slide show.</summary>
public static class SlideShowSnapshotAssertions
{
    /// <summary>The gallery shows, its first image over a strip of its <paramref name="count"/> thumbnails.</summary>
    public static AssertingThat<SlideShowSnapshot> ShowsTheGalleryWith(this AssertingThat<SlideShowSnapshot> that, int count)
    {
        var shown = that.InstanceToAssert.GalleryThumbnails;
        Assert.True(shown == count, $"The slide show shows {shown} gallery thumbnails, but its first image over {count} was expected.");
        return that;
    }
}
