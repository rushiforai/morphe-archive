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
/// <c>401 AuthorizationHeaderMissing</c>, one with a token it never gave <c>401 Unauthorized</c>. BaconReader without
/// "Fix Redgifs API" asks for a token once when it starts, at <c>POST v2/oauth/client</c> with its own client ID and
/// secret. RedGIFs still gave that client a token on 2026-11-08 (<c>token_type</c> Bearer, <c>expires_in</c> 28 days,
/// <c>scope</c> read, <c>access_token</c>), and so does the fake, a token it takes with any User-Agent. Another client
/// gets RedGIFs' answer of 2026-11-07 to a client it doesn't know, <c>401 Unauthorized</c> "client not found", and a
/// form without <c>grant_type</c> or <c>client_id</c> <c>400 FormValueNotSet</c>. "Fix Redgifs API" answers that request
/// itself.
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

        app.MapPost("/_redgifs/v2/oauth/client", async (HttpContext context) =>
        {
            var form = await Answers.ReadFormAsync(context.Request);
            var missing = new[] { "grant_type", "client_id" }.FirstOrDefault(field => !form.ContainsKey(field));
            var baconReaders = form.GetValueOrDefault("client_id") == BaconReaderClientId
                && form.GetValueOrDefault("client_secret") == BaconReaderClientSecret;
            Dictionary<string, object?> answer;
            int status;
            lock (world.Sync)
            {
                (status, answer) = missing is not null
                    ? (400, Error("FormValueNotSet", $"request parameter \"{missing}\" is missing", 400))
                    : baconReaders
                        ? (200, ClientToken(world.RedGifs.IssueClientToken()))
                        : (401, ClientNotFound());
            }

            return Results.Text(RedditJson.Serialize(answer), "application/json; charset=utf-8", statusCode: status);
        });

        app.MapGet("/_redgifs/v2/gifs/{id}", (HttpContext context, string id) =>
        {
            var userAgent = context.Request.Headers.UserAgent.ToString();
            var authorization = context.Request.Headers.Authorization.ToString();
            var token = authorization.StartsWith("Bearer ", StringComparison.Ordinal) ? authorization["Bearer ".Length..] : null;
            lock (world.Sync)
            {
                // A client token works with any User-Agent, a temporary token only with the one it was given to.
                var givenTo = token is null ? null : world.RedGifs.IsClientToken(token) ? userAgent : world.RedGifs.UserAgentOf(token);
                var (status, answer) = token is null
                    ? (401, Error("AuthorizationHeaderMissing", "Authorization header is missing.", null))
                    : givenTo is null
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

    // RedGIFs' error: {"error": {"code": …, "description": …}}, or with a message and its status for a 401 or 400.
    private static Dictionary<string, object?> Error(string code, string description, int? status)
    {
        var error = new Dictionary<string, object?> { ["code"] = code, [status is null ? "description" : "message"] = description };
        if (status is not null)
        {
            error["status"] = status;
        }

        return new() { ["error"] = error };
    }

    // BaconReader's own OAuth client, which RedGIFs still knew on 2026-11-08.
    private const string BaconReaderClientId = "182fead4604-0d50-626a-0005-14c54fc45b2f";
    private const string BaconReaderClientSecret = "c7bc32e63583502f24760ba1949039f3";

    // RedGIFs' answer to BaconReader's client of 2026-11-08, its fields in that order: a read token for 28 days.
    private static Dictionary<string, object?> ClientToken(string token) => new()
    {
        ["token_type"] = "Bearer",
        ["expires_in"] = 2419200,
        ["scope"] = "read",
        ["access_token"] = token,
    };

    // RedGIFs' answer to an OAuth client it doesn't know, with the page on API access twice.
    private static Dictionary<string, object?> ClientNotFound() => new()
    {
        ["error"] = new Dictionary<string, object?>
        {
            ["code"] = "Unauthorized",
            ["message"] = "client not found",
            ["status"] = 401,
            ["rtfm"] = "https://github.com/Redgifs/api/wiki/API-access",
        },
        ["docs"] = "https://github.com/Redgifs/api/wiki/API-access",
    };

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
