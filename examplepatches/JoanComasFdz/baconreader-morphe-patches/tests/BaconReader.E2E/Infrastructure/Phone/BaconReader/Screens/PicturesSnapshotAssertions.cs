// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on the pictures a comment or a post's text shows.</summary>
public static class PicturesSnapshotAssertions
{
    /// <summary>No two of its GIFs and images show the same picture: each media shows once.</summary>
    public static AssertingThat<PicturesSnapshot> ShowsNoPictureTwice(this AssertingThat<PicturesSnapshot> that)
    {
        var shown = that.InstanceToAssert;
        for (var first = 0; first < shown.Pictures.Length; first++)
        {
            for (var second = first + 1; second < shown.Pictures.Length; second++)
            {
                Assert.False(
                    shown.Pictures[first].LooksLike(shown.Pictures[second]),
                    $"{shown.ShownBy} shows the same picture twice, its picture {first + 1} and its picture {second + 1} of {shown.Pictures.Length}, but each picture was expected once.");
            }
        }

        return that;
    }
}
