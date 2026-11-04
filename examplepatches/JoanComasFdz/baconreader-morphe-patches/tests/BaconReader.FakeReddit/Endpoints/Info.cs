// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.FakeReddit.Json;
using BaconReader.FakeReddit.World;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;

namespace BaconReader.FakeReddit.Endpoints;

/// <summary>
/// Reddit's <c>api/info?url=&lt;url&gt;</c>: a Listing of the posts that link to the URL, newest first. A video's
/// address on v.redd.it, <c>https://v.redd.it/&lt;id&gt;</c>, finds the video's post and the crossposts of it, which link
/// to it too.
/// </summary>
internal static class Info
{
    private const string VideoHost = "v.redd.it/";

    public static void Map(WebApplication app, RedditWorld world)
    {
        var things = new Things(world);
        app.MapGet("/api/info", (HttpContext context) =>
        {
            lock (world.Sync)
            {
                var viewer = Caller.Read(context, world, out var refused);
                if (refused is not null)
                {
                    return refused;
                }

                var url = context.Request.Query["url"].ToString();
                var posts = world.Posts
                    .Where(post => LinksTo(post, url))
                    .OrderByDescending(post => post.Created)
                    .Select(post => things.Link(post, viewer))
                    .ToArray();
                return Answers.Json(ListingData.Listing(posts));
            }
        });
    }

    private static bool LinksTo(Post post, string url)
    {
        // v.redd.it/<id>, on Reddit or where "E2E fake Reddit" moves it.
        var video = url.IndexOf(VideoHost, StringComparison.Ordinal);
        if (video >= 0)
        {
            return (post.CrosspostOf ?? post).VideoId == url[(video + VideoHost.Length)..].TrimEnd('/');
        }

        return url.Length > 0 && post.Url == url;
    }
}
