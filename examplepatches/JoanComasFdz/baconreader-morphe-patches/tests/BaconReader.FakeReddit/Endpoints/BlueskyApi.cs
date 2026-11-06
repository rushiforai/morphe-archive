// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Globalization;
using BaconReader.FakeReddit.Json;
using BaconReader.FakeReddit.World;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;

namespace BaconReader.FakeReddit.Endpoints;

/// <summary>
/// Bluesky's public API, <c>https://public.api.bsky.app/xrpc/…</c>, where "E2E fake Reddit" moves it:
/// <c>/_bluesky/xrpc/…</c>. It answers <c>app.bsky.feed.getPostThread</c> as Bluesky did on 2026-11-04, its fields in
/// Bluesky's order; a post Bluesky doesn't have is <c>400 {"error": "NotFound", …}</c>, as Bluesky answers one.
/// </summary>
internal static class BlueskyApi
{
    public static void Map(WebApplication app, RedditWorld world) =>
        app.MapGet("/_bluesky/xrpc/app.bsky.feed.getPostThread", (HttpContext context) =>
        {
            // at://<handle or DID>/app.bsky.feed.post/<record key>
            var uri = context.Request.Query["uri"].ToString();
            var parts = uri.StartsWith("at://", StringComparison.Ordinal) ? uri["at://".Length..].Split('/') : [];
            lock (world.Sync)
            {
                return parts.Length == 3 && parts[1] == "app.bsky.feed.post" && world.Bluesky.FindPost(Uri.UnescapeDataString(parts[0]), parts[2]) is { } post
                    ? Results.Text(RedditJson.Serialize(Thread(post)), "application/json; charset=utf-8", statusCode: 200)
                    : Results.Text(
                        RedditJson.Serialize(new { error = "NotFound", message = $"Post not found: {uri}" }),
                        "application/json; charset=utf-8",
                        statusCode: 400);
            }
        });

    // Bluesky's answer for at://bsky.app/app.bsky.feed.post/3mzhhvhjfwk22 on 2026-11-04 (and, for each embed, a post
    // with one), with the post's own values. The record's embed is left out: the patch reads the view's.
    private static Dictionary<string, object?> Thread(BlueskyPost post)
    {
        var created = post.CreatedAt.UtcDateTime.ToString("yyyy-MM-dd'T'HH:mm:ss.fff'Z'", CultureInfo.InvariantCulture);
        var postView = new Dictionary<string, object?>
        {
            ["uri"] = $"at://{post.Did}/app.bsky.feed.post/{post.Key}",
            ["cid"] = $"bafyreie2e{post.Key}",
            ["author"] = new Dictionary<string, object?>
            {
                ["did"] = post.Did,
                ["handle"] = post.Handle,
                ["displayName"] = post.Name,
                ["labels"] = Array.Empty<object>(),
                ["createdAt"] = "2023-04-12T04:53:57.057Z",
            },
            ["record"] = new Dictionary<string, object?>
            {
                ["$type"] = "app.bsky.feed.post",
                ["createdAt"] = created,
                ["langs"] = new[] { "en" },
                ["text"] = post.Text,
            },
        };
        if (Embed(post) is { } embed)
        {
            postView["embed"] = embed;
        }

        postView["bookmarkCount"] = 0;
        postView["replyCount"] = 0;
        postView["repostCount"] = 0;
        postView["likeCount"] = 0;
        postView["quoteCount"] = 0;
        postView["indexedAt"] = created;
        postView["labels"] = Array.Empty<object>();
        return new()
        {
            ["thread"] = new Dictionary<string, object?>
            {
                ["post"] = postView,
                ["threadContext"] = new Dictionary<string, object?>(),
                ["$type"] = "app.bsky.feed.defs#threadViewPost",
            },
        };
    }

    // The embed's view, as Bluesky sends each kind.
    private static Dictionary<string, object?>? Embed(BlueskyPost post)
    {
        var ratio = new Dictionary<string, object?> { ["height"] = MediaAsset.Jpeg.Height, ["width"] = MediaAsset.Jpeg.Width };
        return post.Embed switch
        {
            BlueskyEmbed.Images => new()
            {
                ["images"] = new[]
                {
                    new Dictionary<string, object?> { ["thumb"] = post.Image, ["fullsize"] = post.Image, ["alt"] = "", ["aspectRatio"] = ratio },
                },
                ["$type"] = "app.bsky.embed.images#view",
            },
            BlueskyEmbed.Video => new()
            {
                ["cid"] = $"bafkreie2e{post.Key}",
                ["playlist"] = post.Image!.Replace("thumbnail.jpg", "playlist.m3u8", StringComparison.Ordinal),
                ["thumbnail"] = post.Image,
                ["aspectRatio"] = ratio,
                ["presentation"] = "default",
                ["$type"] = "app.bsky.embed.video#view",
            },
            BlueskyEmbed.External => new()
            {
                ["external"] = new Dictionary<string, object?>
                {
                    ["uri"] = "https://example.com/e2e",
                    ["title"] = "An example page",
                    ["description"] = "A page the post links to.",
                    ["thumb"] = post.Image,
                },
                ["$type"] = "app.bsky.embed.external#view",
            },
            BlueskyEmbed.Gallery => new()
            {
                ["items"] = new[]
                {
                    new Dictionary<string, object?>
                    {
                        ["thumbnail"] = post.Image,
                        ["fullsize"] = post.Image,
                        ["alt"] = "",
                        ["aspectRatio"] = ratio,
                        ["$type"] = "app.bsky.embed.gallery#viewImage",
                    },
                },
                ["$type"] = "app.bsky.embed.gallery#view",
            },
            _ => null,
        };
    }
}
