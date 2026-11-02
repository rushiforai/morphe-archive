// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on where a post's text and its image are.</summary>
public static class PostTextLayoutSnapshotAssertions
{
    // A view's bounds are whole pixels: a margin in dp may round either way.
    private const int RoundingPixels = 2;

    /// <summary>The post's image starts where its text starts: both have the same left edge.</summary>
    public static AssertingThat<PostTextLayoutSnapshot> TheImageStartsWhereTheTextStarts(this AssertingThat<PostTextLayoutSnapshot> that)
    {
        var layout = that.InstanceToAssert;
        var image = layout.Image ?? throw new Xunit.Sdk.XunitException("The post's text shows no image, but one starting where the text starts was expected.");
        Assert.True(
            Math.Abs(image.Left - layout.Text.Left) <= RoundingPixels,
            $"The post's image starts at x {image.Left} px, but where the post's text starts, x {layout.Text.Left} px, was expected.");
        return that;
    }
}
