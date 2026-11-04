// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on the media viewer.</summary>
public static class MediaViewerSnapshotAssertions
{
    /// <summary>The media shows its loading bar with "<paramref name="size"/>", such as "GIF · 0.4 MB".</summary>
    public static AssertingThat<MediaViewerSnapshot> ShowsItsLoadingBarWith(this AssertingThat<MediaViewerSnapshot> that, string size)
    {
        var shown = that.InstanceToAssert.Loading;
        Assert.True(
            shown == $"Loading media, {size}",
            shown is null ? $"The media shows no loading bar, but one with \"{size}\" was expected." : $"The media's loading bar shows \"{shown}\", but \"Loading media, {size}\" was expected.");
        return that;
    }

    /// <summary>The media shows its loading bar as failed: "Media failed to load".</summary>
    public static AssertingThat<MediaViewerSnapshot> ShowsItsLoadingBarAsFailed(this AssertingThat<MediaViewerSnapshot> that)
    {
        var shown = that.InstanceToAssert.Loading;
        Assert.True(
            shown == "Media failed to load",
            shown is null ? "The media shows no loading bar, but one that failed was expected." : $"The media's loading bar shows \"{shown}\", but \"Media failed to load\" was expected.");
        return that;
    }

    /// <summary>The media's player plays a video.</summary>
    public static AssertingThat<MediaViewerSnapshot> PlaysTheVideo(this AssertingThat<MediaViewerSnapshot> that)
    {
        Assert.True(that.InstanceToAssert.PlaysAVideo, "The media viewer shows no video, but one playing was expected.");
        return that;
    }

    /// <summary>The media shows no loading bar.</summary>
    public static AssertingThat<MediaViewerSnapshot> ShowsNoLoadingBar(this AssertingThat<MediaViewerSnapshot> that)
    {
        var shown = that.InstanceToAssert.Loading;
        Assert.True(shown is null, $"The media shows its loading bar, \"{shown}\", but none was expected.");
        return that;
    }

    /// <summary>
    /// The gallery shows, its image over a strip of its <paramref name="count"/> thumbnails, its loading bar gone: the
    /// first image, which Reddit served whole (<c>RedditGalleryRequestsSnapshot</c>).
    /// </summary>
    public static AssertingThat<MediaViewerSnapshot> ShowsTheGalleryWith(this AssertingThat<MediaViewerSnapshot> that, int count)
    {
        var viewer = that.InstanceToAssert;
        Assert.True(
            viewer.GalleryThumbnails == count && viewer.Loading is null,
            $"The gallery shows {viewer.GalleryThumbnails} thumbnails{(viewer.Loading is null ? "" : $" and its loading bar, \"{viewer.Loading}\"")}, but its first image over {count} thumbnails was expected.");
        return that;
    }
}
