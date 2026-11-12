// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on where a comment's video is: its size against the comment's and against 200×200.</summary>
public static class CommentVideoLayoutSnapshotAssertions
{
    // A view's bounds are whole pixels: a size in dp may round either way.
    private const int RoundingPixels = 2;

    /// <summary>The comment's video fits in 200×200 dp, so it's narrower than the comment: the patch's small size.</summary>
    public static AssertingThat<CommentVideoLayoutSnapshot> TheVideoFitsIn200By200(this AssertingThat<CommentVideoLayoutSnapshot> that)
    {
        var layout = that.InstanceToAssert;
        var video = layout.Video ?? throw new Xunit.Sdk.XunitException("The comment shows no video, but one that fits in 200×200 was expected.");
        var box = (int)Math.Round(200 * layout.PixelsPerDp) + RoundingPixels;
        Assert.True(
            video.Width <= box && video.Height <= box && video.Width < layout.Comment.Width,
            $"The comment's video is {Dp(video.Width, layout)}×{Dp(video.Height, layout)} dp, in a comment {Dp(layout.Comment.Width, layout)} dp wide, but it was expected to fit in 200×200.");
        return that;
    }

    /// <summary>The comment's video is as wide as the comment, edge to edge.</summary>
    public static AssertingThat<CommentVideoLayoutSnapshot> TheVideoFillsTheCommentsWidth(this AssertingThat<CommentVideoLayoutSnapshot> that)
    {
        var layout = that.InstanceToAssert;
        var video = layout.Video ?? throw new Xunit.Sdk.XunitException("The comment shows no video, but one as wide as the comment was expected.");
        Assert.True(
            Math.Abs(video.Left - layout.Comment.Left) <= RoundingPixels && Math.Abs(video.Right - layout.Comment.Right) <= RoundingPixels,
            $"The comment's video spans x {video.Left}–{video.Right} px, but the comment's width, x {layout.Comment.Left}–{layout.Comment.Right} px, was expected.");
        return that;
    }

    private static int Dp(int pixels, CommentVideoLayoutSnapshot layout) => (int)Math.Round(pixels / layout.PixelsPerDp);
}
