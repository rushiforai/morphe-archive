// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on a text post's text.</summary>
public static class PostTextSnapshotAssertions
{
    /// <summary>The post's text is <paramref name="text"/>, and shows <paramref name="images"/> images under it.</summary>
    public static AssertingThat<PostTextSnapshot> ShowsTheTextWithImages(this AssertingThat<PostTextSnapshot> that, string text, int images)
    {
        var post = that.InstanceToAssert;
        Assert.True(
            post.Text == text && post.Images == images,
            $"The post's text shows \"{post.Text}\" and {post.Images} images, but \"{text}\" and {images} images were expected.");
        return that;
    }
}
