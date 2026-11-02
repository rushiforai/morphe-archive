// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on where a comment's image is: its size against the comment's and against 200×200.</summary>
public static class CommentLayoutSnapshotAssertions
{
    // A view's bounds are whole pixels: a size in dp may round either way.
    private const int RoundingPixels = 2;

    /// <summary>The comment's image fits in 200×200 dp, so it's narrower than the comment: the patch's small size.</summary>
    public static AssertingThat<CommentLayoutSnapshot> TheImageFitsIn200By200(this AssertingThat<CommentLayoutSnapshot> that)
    {
        var layout = that.InstanceToAssert;
        var image = layout.Image ?? throw new Xunit.Sdk.XunitException("The comment shows no image, but one that fits in 200×200 was expected.");
        var box = (int)Math.Round(200 * layout.PixelsPerDp) + RoundingPixels;
        Assert.True(
            image.Width <= box && image.Height <= box && image.Width < layout.Comment.Width,
            $"The comment's image is {Dp(image.Width, layout)}×{Dp(image.Height, layout)} dp, in a comment {Dp(layout.Comment.Width, layout)} dp wide, but it was expected to fit in 200×200.");
        return that;
    }

    /// <summary>The comment's image is as wide as the comment, edge to edge.</summary>
    public static AssertingThat<CommentLayoutSnapshot> TheImageFillsTheCommentsWidth(this AssertingThat<CommentLayoutSnapshot> that)
    {
        var layout = that.InstanceToAssert;
        var image = layout.Image ?? throw new Xunit.Sdk.XunitException("The comment shows no image, but one as wide as the comment was expected.");
        Assert.True(
            Math.Abs(image.Left - layout.Comment.Left) <= RoundingPixels && Math.Abs(image.Right - layout.Comment.Right) <= RoundingPixels,
            $"The comment's image spans x {image.Left}–{image.Right} px, but the comment's width, x {layout.Comment.Left}–{layout.Comment.Right} px, was expected.");
        return that;
    }

    private static int Dp(int pixels, CommentLayoutSnapshot layout) => (int)Math.Round(pixels / layout.PixelsPerDp);
}
