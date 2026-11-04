// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.FakeReddit.World;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;

namespace BaconReader.FakeReddit.Endpoints;

/// <summary>
/// Media files, where "E2E fake Reddit" moves Reddit's media hosts: <c>/_media/i.redd.it/x.gif</c> for
/// <c>https://i.redd.it/x.gif</c>. A file the store doesn't hold is unhandled: a test sent a URL it didn't serve. A
/// preview.redd.it URL whose query still has its "&amp;" HTML-escaped is refused, 403, as Reddit refuses one.
/// A video's own address, <c>v.redd.it/&lt;id&gt;</c>, redirects to <c>/video/&lt;id&gt;</c>, as v.redd.it redirects
/// to <c>www.reddit.com/video/&lt;id&gt;</c>, which redirects a browser to the video's post on www.reddit.com, refuses
/// other clients (403), and answers 404 for a video no post has.
/// </summary>
internal static class Media
{
    // BaconReader turns any link containing "v.redd.it" into one containing "www.reddit.com/video", by string replace.
    private const string RewrittenVideoHost = "www.reddit.com/video/";

    private const string SignedPreviewHost = "preview.redd.it/";

    public static void Map(WebApplication app, RedditWorld world)
    {
        app.MapGet("/video/{id}", (HttpContext context, string id) => VideoPost(context, world, id));

        // HEAD too: "Improve post media loading" asks a GIF's size before it downloads it.
        app.MapMethods("/_media/{**path}", [HttpMethods.Get, HttpMethods.Head], (HttpContext context, string path) =>
        {
            if (path.StartsWith(SignedPreviewHost, StringComparison.Ordinal) && context.Request.QueryString.Value?.Contains("amp;", StringComparison.Ordinal) == true)
            {
                // Reddit signs preview URLs (s=…) over their query: one whose "&" are still HTML-escaped doesn't match
                // its signature, and Reddit refuses it.
                return Results.Text("Forbidden", statusCode: StatusCodes.Status403Forbidden);
            }

            var stored = path.StartsWith(RewrittenVideoHost, StringComparison.Ordinal) ? "v.redd.it/" + path[RewrittenVideoHost.Length..] : path;
            lock (world.Sync)
            {
                // BaconReader's own lookup of a video's post, www.reddit.com/video/<id>.
                if (path.StartsWith(RewrittenVideoHost, StringComparison.Ordinal) && !path[RewrittenVideoHost.Length..].TrimEnd('/').Contains('/'))
                {
                    return VideoPost(context, world, path[RewrittenVideoHost.Length..].TrimEnd('/'));
                }

                // A video's own address, v.redd.it/<id>, redirects as v.redd.it does.
                if (stored.StartsWith("v.redd.it/", StringComparison.Ordinal) && stored.TrimEnd('/').Count(c => c == '/') == 1
                    && world.FindMedia(stored.TrimEnd('/') + "/DASHPlaylist.mpd") is not null)
                {
                    return Results.Redirect($"{world.BaseUrl}/video/{stored.TrimEnd('/')["v.redd.it/".Length..]}");
                }

                if (world.FindMedia(stored) is { } file)
                {
                    return Results.File(file.Bytes, file.ContentType, enableRangeProcessing: true);
                }
            }

            context.Items[FakeRedditServer.Unhandled] = true;
            return Results.NotFound();
        });
    }

    // www.reddit.com/video/<id>: a 302 to the video's post for a browser, which says "Mozilla/" in its User-Agent.
    private static IResult VideoPost(HttpContext context, RedditWorld world, string id)
    {
        if (!context.Request.Headers.UserAgent.ToString().Contains("Mozilla/", StringComparison.Ordinal))
        {
            return Results.Text("Forbidden", statusCode: StatusCodes.Status403Forbidden);
        }

        lock (world.Sync)
        {
            return world.Posts.FirstOrDefault(post => post.CrosspostOf is null && post.VideoId == id) is { } post
                ? Results.Redirect("https://www.reddit.com" + post.Permalink)
                : Results.NotFound();
        }
    }
}
