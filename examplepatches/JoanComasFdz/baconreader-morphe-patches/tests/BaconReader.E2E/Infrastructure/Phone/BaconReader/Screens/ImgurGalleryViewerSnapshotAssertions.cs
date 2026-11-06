// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks of the Imgur album viewer.</summary>
public static class ImgurGalleryViewerSnapshotAssertions
{
    /// <summary>
    /// The album shows its image <paramref name="position"/> of <paramref name="count"/>: an image over
    /// <paramref name="count"/> thumbnails, with an arrow back unless it is the first and an arrow forward unless it is the
    /// last.
    /// </summary>
    public static AssertingThat<ImgurGalleryViewerSnapshot> ShowsItsImage(this AssertingThat<ImgurGalleryViewerSnapshot> that, int position, int count)
    {
        var viewer = that.InstanceToAssert;
        Assert.True(
            viewer.ShowsImage && !viewer.PlaysVideo && viewer.Thumbnails == count && viewer.ShowsBack == position > 1 && viewer.ShowsForward == position < count,
            $"The album shows {Describe(viewer)}, but its image {position} of {count} was expected.");
        return that;
    }

    /// <summary>The album plays its video.</summary>
    public static AssertingThat<ImgurGalleryViewerSnapshot> PlaysItsVideo(this AssertingThat<ImgurGalleryViewerSnapshot> that)
    {
        var viewer = that.InstanceToAssert;
        Assert.True(viewer.PlaysVideo, $"The album shows {Describe(viewer)}, but its video playing was expected.");
        return that;
    }

    /// <summary>No thumbnail of the album is marked as a video.</summary>
    public static AssertingThat<ImgurGalleryViewerSnapshot> MarksNoThumbnailAsAVideo(this AssertingThat<ImgurGalleryViewerSnapshot> that)
    {
        var viewer = that.InstanceToAssert;
        Assert.True(viewer.VideoThumbnails == 0, $"{viewer.VideoThumbnails} of the album's {viewer.Thumbnails} thumbnails are marked as a video, but none was expected.");
        return that;
    }

    /// <summary>The album's one thumbnail is marked as a video.</summary>
    public static AssertingThat<ImgurGalleryViewerSnapshot> MarksItsThumbnailAsAVideo(this AssertingThat<ImgurGalleryViewerSnapshot> that)
    {
        var viewer = that.InstanceToAssert;
        Assert.True(
            viewer is { Thumbnails: 1, VideoThumbnails: 1 },
            $"{viewer.VideoThumbnails} of the album's {viewer.Thumbnails} thumbnails are marked as a video, but its one thumbnail marked was expected.");
        return that;
    }

    private static string Describe(ImgurGalleryViewerSnapshot viewer) =>
        $"{(viewer.PlaysVideo ? "a video playing" : viewer.ShowsImage ? "an image" : "no image")} over {viewer.Thumbnails} thumbnails, "
        + $"{(viewer.ShowsBack ? "with" : "without")} an arrow back and {(viewer.ShowsForward ? "with" : "without")} an arrow forward";
}
