// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.FakeReddit.Json;
using BaconReader.FakeReddit.World;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;

namespace BaconReader.FakeReddit.Endpoints;

/// <summary>
/// RedGIFs' API, <c>https://api.redgifs.com/</c>, where "E2E fake Reddit" moves it: <c>/_redgifs/…</c>. A temporary
/// token is RedGIFs' answer of 2026-11-03 (<c>token</c>, <c>addr</c>, <c>agent</c>, <c>session</c>, <c>rtfm</c>), and it
/// works only with the User-Agent it was given to: another one is refused, <c>401 WrongSender</c>, as RedGIFs refuses
/// one used from another address. Every answer is RedGIFs' own of 2026-11-03: a video it never had is
/// <c>404 GifNotFound</c>, a deleted one <c>410 GifDeleted</c>, a request without a token
/// <c>401 AuthorizationHeaderMissing</c>, one with a token it never gave <c>401 Unauthorized</c>.
/// </summary>
internal static class RedGifsApi
{
    public static void Map(WebApplication app, RedditWorld world)
    {
        app.MapGet("/_redgifs/v2/auth/temporary", (HttpContext context) =>
        {
            var userAgent = context.Request.Headers.UserAgent.ToString();
            lock (world.Sync)
            {
                var token = world.RedGifs.IssueToken(userAgent);
                return Answers.Json(new
                {
                    token,
                    addr = "127.0.0.1",
                    agent = userAgent,
                    session = "e2e",
                    rtfm = "https://github.com/Redgifs/api/wiki/Temporary-tokens",
                });
            }
        });

        app.MapGet("/_redgifs/v2/gifs/{id}", (HttpContext context, string id) =>
        {
            var userAgent = context.Request.Headers.UserAgent.ToString();
            var authorization = context.Request.Headers.Authorization.ToString();
            var token = authorization.StartsWith("Bearer ", StringComparison.Ordinal) ? authorization["Bearer ".Length..] : null;
            lock (world.Sync)
            {
                var (status, answer) = token is null
                    ? (401, Error("AuthorizationHeaderMissing", "Authorization header is missing.", null))
                    : world.RedGifs.UserAgentOf(token) is not { } givenTo
                    ? (401, Error("Unauthorized", "Could not authenticate your request.", null))
                    : givenTo != userAgent
                        ? (401, Error("WrongSender", "This token belongs to a different device, please request a new one.", 401))
                        : world.RedGifs.FindGif(id) is not { } gif
                            ? (404, Error("GifNotFound", "Gif not found.", null))
                            : gif.State == RedGifState.Deleted
                                ? (410, Error("GifDeleted", "The requested gif was deleted and cannot be accessed.", null))
                                : (200, Gif(gif));
                world.RedGifs.RecordLookup(id, token, userAgent, status);
                return Results.Text(RedditJson.Serialize(answer), "application/json; charset=utf-8", statusCode: status);
            }
        });
    }

    // RedGIFs' error: {"error": {"code": …, "description": …}}, with its status when it is 401.
    private static Dictionary<string, object?> Error(string code, string description, int? status)
    {
        var error = new Dictionary<string, object?> { ["code"] = code, [status is null ? "description" : "message"] = description };
        if (status is not null)
        {
            error["status"] = status;
        }

        return new() { ["error"] = error };
    }

    // A video's information, every field in RedGIFs' order of 2026-11-03 (gif equatorialgrubbynoctilio). BaconReader
    // reads only gif.urls: hd to play, thumbnail or poster for the list.
    private static Dictionary<string, object?> Gif(RedGif gif) => new()
    {
        ["gif"] = new Dictionary<string, object?>
        {
            ["avgColor"] = "#000000",
            ["canBoost"] = false,
            ["createDate"] = 1762128000,
            ["contentType"] = null,
            ["cta"] = null,
            ["description"] = null,
            ["duration"] = 2.0,
            ["folders"] = null,
            ["gallery"] = null,
            ["hasAudio"] = true,
            ["height"] = MediaAsset.Mp4.Height,
            ["hideHome"] = false,
            ["hideTrending"] = false,
            ["hls"] = false,
            ["id"] = gif.Id,
            ["likes"] = 0,
            ["niches"] = Array.Empty<string>(),
            ["published"] = true,
            ["type"] = 1,
            ["sexuality"] = Array.Empty<string>(),
            ["tags"] = Array.Empty<string>(),
            ["urls"] = new Dictionary<string, object?>
            {
                ["poster"] = gif.Poster,
                ["html"] = gif.Link,
                ["sd"] = gif.Sd,
                ["hd"] = gif.Hd,
                ["thumbnail"] = gif.Thumbnail,
            },
            ["userName"] = "e2e_creator",
            ["verified"] = false,
            ["views"] = 0,
            ["width"] = MediaAsset.Mp4.Width,
            ["promoted"] = null,
        },
        ["user"] = new Dictionary<string, object?>
        {
            ["creationtime"] = 1762128000,
            ["description"] = null,
            ["followers"] = 0,
            ["following"] = 0,
            ["gifs"] = 1,
            ["name"] = "e2e_creator",
            ["profileImageUrl"] = null,
            ["profileUrl"] = null,
            ["publishedCollections"] = 0,
            ["publishedGifs"] = 1,
            ["studio"] = false,
            ["subscription"] = 0,
            ["url"] = "https://www.redgifs.com/users/e2e_creator",
            ["username"] = "e2e_creator",
            ["verified"] = false,
            ["views"] = 0,
        },
        ["niches"] = Array.Empty<object>(),
    };
}
