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

    /// <summary>The part of the post's text that says <paramref name="text"/> shows under the post's image.</summary>
    public static AssertingThat<PostTextLayoutSnapshot> ShowsUnderItsImage(this AssertingThat<PostTextLayoutSnapshot> that, string text)
    {
        var layout = that.InstanceToAssert;
        var image = layout.Image ?? throw new Xunit.Sdk.XunitException($"The post's text shows no image, but \"{text}\" under one was expected.");
        var part = layout.Parts.FirstOrDefault(shown => shown.Text == text)
            ?? throw new Xunit.Sdk.XunitException($"The post's text shows [{string.Join(", ", layout.Parts.Select(shown => $"\"{shown.Text}\""))}], but \"{text}\" was expected.");
        Assert.True(
            part.Bounds.Top >= image.Bottom - RoundingPixels,
            $"The post's text \"{text}\" starts at y {part.Bounds.Top} px, but under its image, which ends at y {image.Bottom} px, was expected.");
        return that;
    }

    /// <summary>The post's image spans the width of its text.</summary>
    public static AssertingThat<PostTextLayoutSnapshot> TheImageFillsTheTextsWidth(this AssertingThat<PostTextLayoutSnapshot> that)
    {
        var layout = that.InstanceToAssert;
        var image = layout.Image ?? throw new Xunit.Sdk.XunitException("The post's text shows no image, but one as wide as the text was expected.");
        Assert.True(
            Math.Abs(image.Left - layout.Text.Left) <= RoundingPixels && Math.Abs(image.Right - layout.Text.Right) <= RoundingPixels,
            $"The post's image spans x {image.Left}–{image.Right} px, but the text's width, x {layout.Text.Left}–{layout.Text.Right} px, was expected.");
        return that;
    }
}
