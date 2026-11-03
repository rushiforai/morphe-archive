// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.FakeReddit.World;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;

namespace BaconReader.FakeReddit.Endpoints;

/// <summary>
/// Reddit's share links, <c>/r/&lt;sub&gt;/s/&lt;code&gt;</c> and <c>/u/&lt;user&gt;/s/&lt;code&gt;</c>, as
/// www.reddit.com answers them, logged out too: a 301 to what the link opens, on www.reddit.com, with the share's query.
/// A subreddit's link with a code Reddit doesn't know gets a 307 to the subreddit.
/// </summary>
internal static class ShareLinks
{
    private const string Reddit = "https://www.reddit.com";

    // What Reddit adds to the address a share link leads to.
    private const string ShareQuery = "?share_id=E2eShareId&utm_medium=android_app&utm_name=androidcss&utm_source=share&utm_term=1";

    public static void Map(WebApplication app, RedditWorld world)
    {
        app.MapGet("/r/{subreddit}/s/{code}", (HttpContext context, string subreddit, string code) =>
            Answer(context, world, $"/r/{subreddit}/s/{code}", $"/r/{subreddit}/"));
        app.MapGet("/u/{user}/s/{code}", (HttpContext context, string user, string code) =>
            Answer(context, world, $"/u/{user}/s/{code}", null));
    }

    private static IResult Answer(HttpContext context, RedditWorld world, string path, string? unknown)
    {
        if (world.ShareLinkTarget(path) is { } target)
        {
            return Results.Redirect(Reddit + target + ShareQuery, permanent: true);
        }

        if (unknown is not null)
        {
            return Results.Redirect(Reddit + unknown, permanent: false, preserveMethod: true);
        }

        context.Items[FakeRedditServer.Unhandled] = true;
        return Results.NotFound();
    }
}
