// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>What a test checks on the media Reddit served: thumbnails, previews, galleries, avatars, a page's script.</summary>
public static class RedditMediaSnapshotAssertions
{
    /// <summary>Reddit served the file: one request for it was answered 200, or 206 for a part of it (a video's).</summary>
    public static AssertingThat<RedditMediaFileRequestsSnapshot> Served(this AssertingThat<RedditMediaFileRequestsSnapshot> that)
    {
        var media = that.InstanceToAssert;
        Assert.True(media.Requests.Any(request => request.Status is 200 or 206), $"Reddit was asked for {media.What} {Asked(media)}, but served it was expected.");
        return that;
    }

    /// <summary>Reddit didn't serve the file: no request for it was answered.</summary>
    public static AssertingThat<RedditMediaFileRequestsSnapshot> DidntServe(this AssertingThat<RedditMediaFileRequestsSnapshot> that)
    {
        var media = that.InstanceToAssert;
        var served = media.Requests.Count(request => request.Status is 200 or 206);
        Assert.True(served == 0, $"Reddit served {media.What} {served} times, but not serving it was expected.");
        return that;
    }

    /// <summary>
    /// Reddit served the signed file with its "&amp;" unescaped: Reddit sends the URL with "&amp;amp;", and refuses it so.
    /// </summary>
    public static AssertingThat<RedditMediaFileRequestsSnapshot> ServedWithItsAmpersandsUnescaped(this AssertingThat<RedditMediaFileRequestsSnapshot> that)
    {
        var media = that.InstanceToAssert;
        Assert.True(
            media.Requests.Any(request => request.Status == 200 && !request.Query.Contains("amp;", StringComparison.Ordinal)),
            $"Reddit was asked for {media.What} {Asked(media)}, but served it with its \"&\" unescaped was expected.");
        return that;
    }

    /// <summary>Reddit served the file on the third request, after failing the first two: BaconReader asked again.</summary>
    public static AssertingThat<RedditMediaFileRequestsSnapshot> ServedOnTheThirdRequest(this AssertingThat<RedditMediaFileRequestsSnapshot> that)
    {
        var media = that.InstanceToAssert;
        Assert.True(
            media.Requests.Length >= 3 && media.Requests[0].Status != 200 && media.Requests[1].Status != 200 && media.Requests[2].Status == 200,
            $"Reddit was asked for {media.What} {Asked(media)}, but served it on the third request was expected.");
        return that;
    }

    /// <summary>
    /// Reddit served each of the gallery's <paramref name="count"/> images as a preview <paramref name="width"/> pixels
    /// wide, the thumbnail strip's, and the full image only of the first, the one shown.
    /// </summary>
    public static AssertingThat<RedditGalleryRequestsSnapshot> ServedItsThumbnailsAsPreviews(this AssertingThat<RedditGalleryRequestsSnapshot> that, int count, int width)
    {
        var gallery = that.InstanceToAssert;
        var described = string.Join("; ", gallery.Images.Select((image, index) =>
            $"image {index + 1}: previews {(image.PreviewWidths.IsEmpty ? "none" : string.Join(", ", image.PreviewWidths))}, {(image.FullImage ? "the full image" : "no full image")}"));
        Assert.True(
            gallery.Images.Length == count
                && gallery.Images.All(image => image.PreviewWidths.Contains(width))
                && gallery.Images.Skip(1).All(image => !image.FullImage),
            $"Reddit served for \"{gallery.Title}\" {described}, but the {count} images as previews {width} pixels wide, and no full image but the first's, was expected.");
        return that;
    }

    /// <summary>Reddit served the gallery's first image whole: the image the gallery shows.</summary>
    public static AssertingThat<RedditGalleryRequestsSnapshot> ServedTheFirstImageWhole(this AssertingThat<RedditGalleryRequestsSnapshot> that)
    {
        var gallery = that.InstanceToAssert;
        Assert.True(gallery.Images is [{ FullImage: true }, ..], $"Reddit didn't serve the first image of \"{gallery.Title}\" whole, but the gallery was expected to show it.");
        return that;
    }

    /// <summary>Reddit served a preview of the gallery's first image, which a crosspost of it shows as thumbnail.</summary>
    public static AssertingThat<RedditGalleryRequestsSnapshot> ServedAPreviewOfTheFirstImage(this AssertingThat<RedditGalleryRequestsSnapshot> that)
    {
        var gallery = that.InstanceToAssert;
        Assert.True(
            gallery.Images is [{ PreviewWidths.IsEmpty: false }, ..],
            $"Reddit served no preview of the first image of \"{gallery.Title}\", but one was expected.");
        return that;
    }

    /// <summary>The page's script ran: it asked Reddit for the page again.</summary>
    public static AssertingThat<RedditPageScriptSnapshot> RanItsScript(this AssertingThat<RedditPageScriptSnapshot> that)
    {
        var page = that.InstanceToAssert;
        Assert.True(page.Ran, $"The page of \"{page.Title}\" didn't run its script, but it was expected to.");
        return that;
    }

    /// <summary>The page's script didn't run.</summary>
    public static AssertingThat<RedditPageScriptSnapshot> DidntRunItsScript(this AssertingThat<RedditPageScriptSnapshot> that)
    {
        var page = that.InstanceToAssert;
        Assert.True(!page.Ran, $"The page of \"{page.Title}\" ran its script, but it was expected not to.");
        return that;
    }

    private static string Asked(RedditMediaFileRequestsSnapshot media) =>
        media.Requests.IsEmpty
            ? "never"
            : $"{media.Requests.Length} times ({string.Join(", ", media.Requests.Select(request => $"{request.Status}{(request.Query.Length > 0 ? " for " + request.Query : "")}"))})";
}
