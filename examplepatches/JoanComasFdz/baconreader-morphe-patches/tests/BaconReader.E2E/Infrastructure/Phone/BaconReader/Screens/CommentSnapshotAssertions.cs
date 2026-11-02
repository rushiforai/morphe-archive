// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on a comment: its text, and the GIFs, images and videos "Embed comment images" shows under it.</summary>
public static class CommentSnapshotAssertions
{
    /// <summary>The comment shows <paramref name="images"/> images (not GIFs) under its text.</summary>
    public static AssertingThat<CommentSnapshot> ShowsImages(this AssertingThat<CommentSnapshot> that, int images)
    {
        var comment = that.InstanceToAssert;
        Assert.True(
            comment.Images == images,
            $"The comment \"{comment.Text}\" shows {Media(comment)}, but {images} images were expected.");
        return that;
    }

    /// <summary>The comment shows <paramref name="gifs"/> GIFs under its text.</summary>
    public static AssertingThat<CommentSnapshot> ShowsGifs(this AssertingThat<CommentSnapshot> that, int gifs)
    {
        var comment = that.InstanceToAssert;
        Assert.True(
            comment.Gifs == gifs,
            $"The comment \"{comment.Text}\" shows {Media(comment)}, but {gifs} GIFs were expected.");
        return that;
    }

    /// <summary>The comment shows no image and no GIF.</summary>
    public static AssertingThat<CommentSnapshot> ShowsNoImage(this AssertingThat<CommentSnapshot> that)
    {
        var comment = that.InstanceToAssert;
        Assert.True(
            comment.Images == 0 && comment.Gifs == 0,
            $"The comment \"{comment.Text}\" shows {Media(comment)}, but no image was expected.");
        return that;
    }

    /// <summary>The comment's text shows no link: the patch dropped the bare link it shows as an image.</summary>
    public static AssertingThat<CommentSnapshot> ShowsNoLink(this AssertingThat<CommentSnapshot> that)
    {
        var comment = that.InstanceToAssert;
        Assert.False(
            comment.Text.Contains("http", StringComparison.Ordinal),
            $"The comment shows the text \"{comment.Text}\", but no link was expected in it.");
        return that;
    }

    /// <summary>The comment shows a video under its text.</summary>
    public static AssertingThat<CommentSnapshot> ShowsAVideo(this AssertingThat<CommentSnapshot> that)
    {
        var comment = that.InstanceToAssert;
        Assert.True(
            comment.Videos == 1,
            $"The comment \"{comment.Text}\" shows {Media(comment)}, but one video was expected.");
        return that;
    }

    /// <summary>The comment shows no video.</summary>
    public static AssertingThat<CommentSnapshot> ShowsNoVideo(this AssertingThat<CommentSnapshot> that)
    {
        var comment = that.InstanceToAssert;
        Assert.True(
            comment.Videos == 0,
            $"The comment \"{comment.Text}\" shows {Media(comment)}, but no video was expected.");
        return that;
    }

    private static string Media(CommentSnapshot comment) =>
        $"{comment.Images} images, {comment.Gifs} GIFs and {comment.Videos} videos";
}
