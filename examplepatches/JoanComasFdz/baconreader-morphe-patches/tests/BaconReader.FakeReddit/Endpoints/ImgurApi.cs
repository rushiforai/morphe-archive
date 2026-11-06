// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.FakeReddit.Json;
using BaconReader.FakeReddit.World;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;

namespace BaconReader.FakeReddit.Endpoints;

/// <summary>
/// Imgur's API, <c>https://api.imgur.com/3/</c>, where "E2E fake Reddit" moves it: <c>/_imgur/3/…</c>. It answers as
/// Imgur did on 2026-11-03 to BaconReader's client ID: <c>{"data": …, "success": true, "status": 200}</c>, with every
/// field of an image and of a gallery album, and <c>{"status": 404, "success": false, "data": {"error": "album not
/// found", …}}</c> for an album it doesn't know. A request without Imgur's <c>Authorization: Client-ID …</c> is refused.
/// </summary>
internal static class ImgurApi
{
    public static void Map(WebApplication app, RedditWorld world)
    {
        app.MapGet("/_imgur/3/album/{id}/images", (HttpContext context, string id) =>
            Answer(context, world, () => world.Imgur.FindAlbum(id) is { } album
                ? Data(album.Images.Select(Image))
                : Error(StatusCodes.Status404NotFound, "album not found", context)));

        app.MapGet("/_imgur/3/gallery/{id}", (HttpContext context, string id) =>
            Answer(context, world, () => world.Imgur.FindAlbum(id) is { InGallery: true } album
                ? Data(GalleryAlbum(album))
                // Imgur answers a gallery it doesn't know with its HTML 404 page.
                : Results.Text("<!DOCTYPE html><html><head><title>imgur: the simple 404 page</title></head></html>", "text/html; charset=utf-8", statusCode: StatusCodes.Status404NotFound)));

        app.MapPost("/_imgur/3/image", async (HttpContext context) =>
        {
            using var body = new MemoryStream();
            await context.Request.Body.CopyToAsync(body);
            return Answer(context, world, () =>
                world.Imgur.Upload(DateTimeOffset.UtcNow, context.Request.ContentType, context.Request.Headers.Authorization.ToString(), body.ToArray()) is { } image
                    ? Data(Uploaded(image))
                    // BaconReader's raw file sent as a form, which Android does without a content type.
                    : Error(StatusCodes.Status400BadRequest, "No image data was sent to the upload api", context));
        });
    }

    private static IResult Answer(HttpContext context, RedditWorld world, Func<IResult> answer)
    {
        if (!context.Request.Headers.Authorization.ToString().StartsWith("Client-ID ", StringComparison.Ordinal))
        {
            return Error(StatusCodes.Status401Unauthorized, "Authentication required", context);
        }

        lock (world.Sync)
        {
            return answer();
        }
    }

    private static IResult Data(object data) => Answers.Json(new { data, success = true, status = 200 });

    private static IResult Error(int status, string error, HttpContext context) =>
        Results.Text(
            RedditJson.Serialize(new { status, success = false, data = new { error, request = context.Request.Path.Value!["/_imgur".Length..], method = context.Request.Method } }),
            "application/json; charset=UTF-8",
            statusCode: status);

    // An image as Imgur's API sends it, each field in Imgur's order; a video has its MP4's size, its .gifv page and its
    // HLS playlist too (BaconReader reads only "mp4" and "link").
    private static Dictionary<string, object?> Image(ImgurImage image)
    {
        var fields = StillImage(image);
        if (image.IsVideo)
        {
            fields["has_sound"] = false;
            fields["hls"] = Path.ChangeExtension(image.Mp4, ".m3u8");
            fields["gifv"] = Path.ChangeExtension(image.Mp4, ".gifv");
            fields["mp4_size"] = MediaAsset.Mp4.Bytes.Length;
            fields["processing"] = new Dictionary<string, object?> { ["status"] = "completed" };
        }

        return fields;
    }

    private static Dictionary<string, object?> StillImage(ImgurImage image) => new()
    {
        ["id"] = image.Id,
        ["deletehash"] = "",
        ["account_id"] = null,
        ["account_url"] = null,
        ["ad_type"] = null,
        ["ad_url"] = null,
        ["title"] = null,
        ["description"] = null,
        ["name"] = image.Id,
        ["type"] = image.Type,
        ["width"] = image.Width,
        ["height"] = image.Height,
        ["size"] = 0,
        ["views"] = 0,
        ["section"] = null,
        ["vote"] = null,
        ["bandwidth"] = 0,
        ["animated"] = image.IsVideo,
        ["favorite"] = false,
        ["in_gallery"] = false,
        ["in_most_viral"] = false,
        ["has_sound"] = false,
        ["is_ad"] = false,
        ["nsfw"] = null,
        ["link"] = image.Link,
        ["tags"] = Array.Empty<object>(),
        ["datetime"] = 1508044859,
        ["mp4"] = image.Mp4,
        ["hls"] = "",
    };

    private static Dictionary<string, object?> GalleryAlbum(ImgurAlbum album) => new()
    {
        ["id"] = album.Id,
        ["title"] = album.Title,
        ["description"] = null,
        ["datetime"] = 1508044859,
        ["cover"] = album.Images.FirstOrDefault()?.Id,
        ["cover_width"] = album.Images.FirstOrDefault()?.Width,
        ["cover_height"] = album.Images.FirstOrDefault()?.Height,
        ["account_url"] = null,
        ["account_id"] = null,
        ["privacy"] = "hidden",
        ["layout"] = "blog",
        ["views"] = 0,
        ["link"] = album.Link,
        ["ups"] = 0,
        ["downs"] = 0,
        ["points"] = 0,
        ["score"] = 0,
        ["is_album"] = true,
        ["vote"] = null,
        ["favorite"] = false,
        ["nsfw"] = false,
        ["section"] = "",
        ["comment_count"] = 0,
        ["favorite_count"] = 0,
        ["topic"] = null,
        ["topic_id"] = null,
        ["images_count"] = album.Images.Length,
        ["in_gallery"] = true,
        ["is_ad"] = false,
        ["tags"] = Array.Empty<object>(),
        ["ad_type"] = 0,
        ["ad_url"] = "",
        ["in_most_viral"] = false,
        ["include_album_ads"] = false,
        ["images"] = album.Images.Select(Image).ToArray(),
        ["ad_config"] = new Dictionary<string, object?> { ["show_ads"] = false },
    };

    // What Imgur answers an upload: the new image, with its deletehash (BaconReader keeps it to make an album of several).
    private static Dictionary<string, object?> Uploaded(ImgurImage image)
    {
        var uploaded = Image(image);
        uploaded["deletehash"] = "e2e" + image.Id;
        return uploaded;
    }
}
