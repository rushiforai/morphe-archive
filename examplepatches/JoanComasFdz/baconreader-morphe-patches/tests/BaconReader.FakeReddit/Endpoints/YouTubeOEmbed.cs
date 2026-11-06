// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Text.RegularExpressions;
using BaconReader.FakeReddit.Json;
using BaconReader.FakeReddit.World;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;

namespace BaconReader.FakeReddit.Endpoints;

/// <summary>
/// YouTube's oEmbed endpoint, <c>https://www.youtube.com/oembed?format=json&amp;url=…</c>, where "E2E fake Reddit"
/// moves it: <c>/_youtube/oembed</c>. A video's answer is YouTube's of 2026-11-04, every field in its order; a video
/// YouTube removed or never had is <c>404</c> with the body <c>Not Found</c>, as YouTube answers one.
/// </summary>
internal static partial class YouTubeOEmbed
{
    public static void Map(WebApplication app, RedditWorld world) =>
        app.MapGet("/_youtube/oembed", (HttpContext context) =>
        {
            var url = context.Request.Query["url"].ToString();
            lock (world.Sync)
            {
                var id = VideoId().Match(url) is { Success: true } match
                    ? (match.Groups[1].Success ? match.Groups[1].Value : match.Groups[2].Value)
                    : null;
                return id is not null && world.YouTube.FindVideo(id) is { Removed: false } video
                    ? Results.Text(RedditJson.Serialize(Answer(video)), "application/json", statusCode: 200)
                    : Results.Text("Not Found", "application/json; charset=UTF-8", statusCode: 404);
            }
        });

    // A watch, youtu.be, shorts, live or embed link's video id, as the patches read it.
    [GeneratedRegex("(?:youtu\\.be/|/(?:shorts|live|embed|v)/)([A-Za-z0-9_-]{11})|[?&]v=([A-Za-z0-9_-]{11})")]
    private static partial Regex VideoId();

    // YouTube's answer for dQw4w9WgXcQ on 2026-11-04, with the video's own values. Its thumbnail_url is YouTube's own
    // address, as YouTube sends it: the patches load a video's thumbnail from its id, at i.ytimg.com, which the test patch
    // moves to the fake, and use this one only for a playlist, which the fake doesn't have.
    private static Dictionary<string, object?> Answer(YouTubeVideo video) => new()
    {
        ["title"] = video.Title,
        ["author_name"] = video.Channel,
        ["author_url"] = $"https://www.youtube.com/@{video.Channel}",
        ["type"] = "video",
        ["height"] = 113,
        ["width"] = 200,
        ["version"] = "1.0",
        ["provider_name"] = "YouTube",
        ["provider_url"] = "https://www.youtube.com/",
        ["thumbnail_height"] = 360,
        ["thumbnail_width"] = 480,
        ["thumbnail_url"] = $"https://i.ytimg.com/vi/{video.Id}/hqdefault.jpg",
        ["html"] = $"<iframe width=\"200\" height=\"113\" src=\"https://www.youtube.com/embed/{video.Id}?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen title=\"{video.Title}\"></iframe>",
    };
}
