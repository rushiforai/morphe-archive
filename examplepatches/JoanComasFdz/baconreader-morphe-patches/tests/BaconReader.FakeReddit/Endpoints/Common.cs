// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.FakeReddit.Json;
using BaconReader.FakeReddit.World;
using Microsoft.AspNetCore.Http;

namespace BaconReader.FakeReddit.Endpoints;

/// <summary>Reddit's paths, as the endpoints match them.</summary>
internal static class RedditPaths
{
    /// <summary>
    /// The path an endpoint matches: without <c>.json</c> and a trailing slash, its double slashes single
    /// (BaconReader asks for <c>//prefs/blocked</c>). Media and debugging paths are left as they are: a file's name
    /// keeps its extension.
    /// </summary>
    public static string Normalize(string path)
    {
        if (path.StartsWith("/_media/", StringComparison.Ordinal) || path.StartsWith("/_fake/", StringComparison.Ordinal))
        {
            return path;
        }

        while (path.Contains("//", StringComparison.Ordinal))
        {
            path = path.Replace("//", "/", StringComparison.Ordinal);
        }

        if (path.EndsWith(".json", StringComparison.OrdinalIgnoreCase))
        {
            path = path[..^".json".Length];
        }

        path = path.TrimEnd('/');
        return path.Length == 0 ? "/" : path;
    }
}

/// <summary>Who sent a request: the account of its <c>Authorization: bearer</c> token, or no one, logged out.</summary>
internal static class Caller
{
    public const string AccountKey = "fake-reddit-account";

    /// <summary>
    /// The account the request's token belongs to, null logged out. A token the fake didn't issue fails the request
    /// with 401, as Reddit does, and so does a logged-out request with 403 while the world blocks them
    /// (<see cref="RedditWorld.BlocksLoggedOut"/>): <paramref name="refused"/> is then the answer.
    /// </summary>
    public static Account? Read(HttpContext context, RedditWorld world, out IResult? refused)
    {
        refused = null;
        var authorization = context.Request.Headers.Authorization.ToString();
        if (!authorization.StartsWith("bearer ", StringComparison.OrdinalIgnoreCase))
        {
            if (world.BlocksLoggedOut)
            {
                refused = Answers.Blocked();
            }

            return null;
        }

        var account = world.AccountOfToken(authorization["bearer ".Length..].Trim());
        if (account is null)
        {
            refused = Answers.Error(StatusCodes.Status401Unauthorized, "Unauthorized");
            return null;
        }

        context.Items[AccountKey] = account.Name;
        return account;
    }
}

/// <summary>The fake's answers, written as Reddit writes them.</summary>
internal static class Answers
{
    public static IResult Json<T>(T value) => Results.Text(RedditJson.Serialize(value), "application/json; charset=UTF-8");

    /// <summary>
    /// Reddit's error answer: <c>{"message": "Not Found", "error": 404}</c>, and with <paramref name="explanation"/>,
    /// <c>{"explanation": …, "message": …, "error": …}</c>, as Reddit explains a refused request.
    /// </summary>
    public static IResult Error(int status, string message, string? explanation = null) =>
        Results.Text(
            explanation is null
                ? RedditJson.Serialize(new { message, error = status })
                : RedditJson.Serialize(new { explanation, message, error = status }),
            "application/json; charset=UTF-8",
            statusCode: status);

    /// <summary>
    /// What Reddit answers a logged-out BaconReader, even with "Spoof client": <c>HTTP 403 Blocked</c> (BaconReader then
    /// shows its "no longer operational" message).
    /// </summary>
    public static IResult Blocked() => Results.Text("Blocked", "text/plain; charset=utf-8", statusCode: StatusCodes.Status403Forbidden);

    /// <summary>
    /// What Reddit answers an app's <c>api/morechildren</c> since October 2026: <c>HTTP 403 Blocked</c> and an HTML page
    /// that starts "You've been blocked by network security.", whatever the app's client, token or User-Agent.
    /// </summary>
    public static IResult BlockedByNetworkSecurity() => new BlockedPage();

    /// <summary>The form fields of a POST, empty when it has none.</summary>
    public static async Task<ImmutableDictionary<string, string>> ReadFormAsync(HttpRequest request)
    {
        if (!request.HasFormContentType)
        {
            return ImmutableDictionary<string, string>.Empty;
        }

        var form = await request.ReadFormAsync();
        return form.ToImmutableDictionary(field => field.Key, field => field.Value.ToString());
    }
}

/// <summary>Reddit's network security page, with its reason phrase: <c>403 Blocked</c>.</summary>
internal sealed class BlockedPage : IResult
{
    private const string Html = """
        <!DOCTYPE html>
        <html lang="en"><head><meta charset="utf-8"><title>Blocked</title></head>
        <body><h1>whoa there, pardner!</h1>
        <p>You've been blocked by network security.</p>
        <p>To continue, log in to your Reddit account or use your developer token.</p>
        </body></html>
        """;

    public async Task ExecuteAsync(HttpContext context)
    {
        context.Response.StatusCode = StatusCodes.Status403Forbidden;
        context.Features.Get<Microsoft.AspNetCore.Http.Features.IHttpResponseFeature>()!.ReasonPhrase = "Blocked";
        context.Response.ContentType = "text/html; charset=utf-8";
        await context.Response.WriteAsync(Html);
    }
}
