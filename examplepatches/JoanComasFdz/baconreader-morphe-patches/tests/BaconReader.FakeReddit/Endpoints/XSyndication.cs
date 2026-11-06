// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.FakeReddit.Json;
using BaconReader.FakeReddit.World;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;

namespace BaconReader.FakeReddit.Endpoints;

/// <summary>
/// X's embed service, <c>https://cdn.syndication.twimg.com/tweet-result?id=…&amp;token=…</c>, where "E2E fake Reddit"
/// moves it: <c>/_x/tweet-result</c>. A post's answer is X's of 2026-11-04, its fields in X's order; a post X doesn't
/// have is <c>404</c> with an HTML page, as X answers one. X didn't check the token on 2026-11-04, and neither does the
/// fake.
/// </summary>
internal static class XSyndication
{
    public static void Map(WebApplication app, RedditWorld world) =>
        app.MapGet("/_x/tweet-result", (HttpContext context) =>
        {
            var id = context.Request.Query["id"].ToString();
            lock (world.Sync)
            {
                return world.X.FindPost(id) is { } post
                    ? Results.Text(RedditJson.Serialize(Answer(post)), "application/json; charset=utf-8", statusCode: 200)
                    : Results.Text(NotFoundPage, "text/html;charset=utf-8", statusCode: 404);
            }
        });

    // X's 404 page, shortened: the patch reads only its status.
    private const string NotFoundPage = "<!DOCTYPE html>\n<html lang=\"en\" class=\"dog\">\n  <head>\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <title>X / ?</title>\n  </head>\n  <body></body>\n</html>\n";

    // An answer as X sent on 2026-11-04 (posts 2117689265119473838, a photo; 2117488741698998660, a video;
    // 2117634594786705653, a long one). The text ends with the t.co link to its photo or video, outside the range
    // shown; a long post is cut at 279 characters and has "note_tweet".
    private static Dictionary<string, object?> Answer(XPost post)
    {
        var text = post.Long ? post.Text[..Math.Min(post.Text.Length, 279)] : post.Text;
        var shown = text.Length;
        var media = new List<Dictionary<string, object?>>();
        var entities = new Dictionary<string, object?>();
        if (post.Image is { } image)
        {
            var kind = post.Media == XMedia.Video ? "video" : "photo";
            var tco = $"https://t.co/e2e{post.Id[^7..]}";
            text = $"{text} {tco}";
            var link = new Dictionary<string, object?>
            {
                ["display_url"] = $"pic.x.com/e2e{post.Id[^7..]}",
                ["expanded_url"] = $"{post.Link}/{kind}/1",
                ["indices"] = new[] { shown + 1, text.Length },
                ["url"] = tco,
            };
            entities["media"] = new[] { link };
            media.Add(new Dictionary<string, object?>
            {
                ["display_url"] = link["display_url"],
                ["expanded_url"] = link["expanded_url"],
                ["ext_media_availability"] = new { status = "Available" },
                ["indices"] = link["indices"],
                ["media_url_https"] = image,
                ["original_info"] = new { focus_rects = Array.Empty<object>(), height = MediaAsset.Jpeg.Height, width = MediaAsset.Jpeg.Width },
                ["type"] = kind,
                ["url"] = tco,
            });
        }

        var answer = new Dictionary<string, object?>
        {
            ["__typename"] = "Tweet",
            ["favorite_count"] = 0,
            ["lang"] = "en",
            ["created_at"] = post.CreatedAt.UtcDateTime.ToString("yyyy-MM-dd'T'HH:mm:ss.fff'Z'", System.Globalization.CultureInfo.InvariantCulture),
            ["display_text_range"] = new[] { 0, shown },
            ["entities"] = entities,
            ["id_str"] = post.Id,
            ["text"] = text,
            ["user"] = new Dictionary<string, object?>
            {
                ["id_str"] = "1990000000",
                ["name"] = post.Name,
                ["screen_name"] = post.Handle,
                ["is_blue_verified"] = false,
                ["profile_image_shape"] = "Circle",
                ["verified"] = false,
                ["profile_image_url_https"] = "https://pbs.twimg.com/profile_images/e2e/e2e_normal.jpg",
            },
            ["edit_control"] = new { edit_tweet_ids = new[] { post.Id }, editable_until_msecs = "0", is_edit_eligible = false, edits_remaining = "5" },
            ["mediaDetails"] = media,
            ["photos"] = Array.Empty<object>(),
            ["conversation_count"] = 0,
            ["news_action_type"] = "conversation",
            ["isEdited"] = false,
            ["isStaleEdit"] = false,
        };
        if (post.Long)
        {
            answer["note_tweet"] = new { id = "Tm90ZVR3ZWV0UmVzdWx0czplMmU=" };
        }

        return answer;
    }
}
