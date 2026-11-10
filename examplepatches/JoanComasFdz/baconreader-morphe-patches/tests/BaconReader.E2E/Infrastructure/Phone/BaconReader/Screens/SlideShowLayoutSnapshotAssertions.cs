// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Drawing;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// What a test checks of where the slide show's post shows. The sort bar sits under the card, in the post's page: when it
/// shows above the bottom bar, the page ends there; when the page runs on behind the bottom bar, the sort bar isn't on
/// the screen.
/// </summary>
public static class SlideShowLayoutSnapshotAssertions
{
    // A view's bounds are whole pixels: a margin in dp may round either way.
    private const int RoundingPixels = 2;

    /// <summary>The post's card ends above the bottom bar, with the sort bar between them.</summary>
    public static AssertingThat<SlideShowLayoutSnapshot> TheCardEndsAboveTheBottomBar(this AssertingThat<SlideShowLayoutSnapshot> that)
    {
        var layout = that.InstanceToAssert;
        var sortBar = SortBarOrFail(layout, "The post's card");
        Assert.True(
            layout.Card.Bottom <= sortBar.Top + RoundingPixels && sortBar.Top < layout.BottomBar.Top,
            $"The post's card ends at y {layout.Card.Bottom} px and the sort bar spans y {sortBar.Top}–{sortBar.Bottom} px, but the card above the sort bar, above the bottom bar at y {layout.BottomBar.Top} px, was expected.");
        return that;
    }

    /// <summary>The post's text shows <paramref name="text"/>, and ends above the bottom bar.</summary>
    public static AssertingThat<SlideShowLayoutSnapshot> ThePostTextShowsAboveTheBottomBar(this AssertingThat<SlideShowLayoutSnapshot> that, string text)
    {
        var layout = that.InstanceToAssert;
        Assert.True(
            layout.PostText?.Contains(text, StringComparison.Ordinal) == true,
            $"The post's text {(layout.PostText is null ? "doesn't show" : $"shows \"{layout.PostText}\"")}, but \"{text}\" in it was expected.");
        var sortBar = SortBarOrFail(layout, "The post's text");
        var bounds = layout.PostTextBounds!.Value;
        Assert.True(
            bounds.Bottom <= sortBar.Top + RoundingPixels,
            $"The post's text ends at y {bounds.Bottom} px, but above the sort bar at y {sortBar.Top} px, above the bottom bar, was expected.");
        return that;
    }

    /// <summary>The gallery's strip of thumbnails shows above the bottom bar.</summary>
    public static AssertingThat<SlideShowLayoutSnapshot> TheGalleryThumbnailsShowAboveTheBottomBar(this AssertingThat<SlideShowLayoutSnapshot> that)
    {
        var layout = that.InstanceToAssert;
        var strip = layout.GalleryStrip ?? throw new Xunit.Sdk.XunitException("The post shows no gallery thumbnails, but a strip of them was expected.");
        var sortBar = SortBarOrFail(layout, "The gallery's thumbnails");
        Assert.True(
            strip.Bottom <= sortBar.Top + RoundingPixels,
            $"The gallery's thumbnails end at y {strip.Bottom} px, but above the sort bar at y {sortBar.Top} px, above the bottom bar, was expected.");
        return that;
    }

    private static Rectangle SortBarOrFail(SlideShowLayoutSnapshot layout, string what) =>
        layout.SortBar ?? throw new Xunit.Sdk.XunitException(
            $"{what} should end above the bottom bar, but the sort bar under the card isn't on the screen: the post runs on behind the bottom bar, at y {layout.BottomBar.Top} px.");
}
