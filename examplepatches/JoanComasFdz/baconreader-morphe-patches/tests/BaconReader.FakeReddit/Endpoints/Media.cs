// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.FakeReddit.World;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;

namespace BaconReader.FakeReddit.Endpoints;

/// <summary>
/// Media files, where "E2E fake Reddit" moves Reddit's media hosts: <c>/_media/i.redd.it/x.gif</c> for
/// <c>https://i.redd.it/x.gif</c>. A file the store doesn't hold is unhandled: a test sent a URL it didn't serve.
/// </summary>
internal static class Media
{
    // BaconReader turns any link containing "v.redd.it" into one containing "www.reddit.com/video", by string replace.
    private const string RewrittenVideoHost = "www.reddit.com/video/";

    public static void Map(WebApplication app, RedditWorld world) =>
        app.MapGet("/_media/{**path}", (HttpContext context, string path) =>
        {
            var stored = path.StartsWith(RewrittenVideoHost, StringComparison.Ordinal) ? "v.redd.it/" + path[RewrittenVideoHost.Length..] : path;
            lock (world.Sync)
            {
                if (world.FindMedia(stored) is { } file)
                {
                    return Results.File(file.Bytes, file.ContentType, enableRangeProcessing: true);
                }
            }

            context.Items[FakeRedditServer.Unhandled] = true;
            return Results.NotFound();
        });
}
