// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Net;
using System.Net.Sockets;
using BaconReader.FakeReddit.Endpoints;
using BaconReader.FakeReddit.World;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.WebUtilities;
using Microsoft.AspNetCore.Routing.Constraints;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace BaconReader.FakeReddit;

/// <summary>
/// The fake Reddit: an ASP.NET Core minimal API on Kestrel, on a real port the phone reaches (through
/// <c>adb reverse</c>), answering BaconReader patched with "E2E fake Reddit" from <see cref="World"/>. It runs inside the
/// test process; a test builds its Reddit data in <see cref="World"/> and reads there what the app sent.
/// <list type="bullet">
/// <item>Reddit's API (www, oauth and api all land here): feeds, comments, subreddits, the account, actions. A path works
/// with and without <c>.json</c> and a trailing slash, in any case. A request with <c>Authorization: bearer &lt;token&gt;</c>
/// is that account's; one without is logged out.</item>
/// <item>Reddit's login: its login and connect pages, the redirect with a code, the token.</item>
/// <item><c>/_media/&lt;host&gt;/&lt;path&gt;</c>: media files (i.redd.it, preview.redd.it, v.redd.it).</item>
/// <item><c>/_onelouder/</c>: BaconReader's own server's default subreddits.</item>
/// <item><c>/_fake/</c>: the world's operations and logs over HTTP, for debugging.</item>
/// <item>Anything else: 404, logged in <see cref="RedditWorld.Unhandled"/>.</item>
/// </list>
/// </summary>
public sealed class FakeRedditServer : IAsyncDisposable
{
    internal const string Unhandled = "fake-reddit-unhandled";

    private readonly WebApplication app;

    private FakeRedditServer(WebApplication app, RedditWorld world, string url)
    {
        this.app = app;
        World = world;
        Url = url;
    }

    /// <summary>The fake's URL as the phone reaches it: what "E2E fake Reddit" points the app at.</summary>
    public string Url { get; }

    /// <summary>The fake's Reddit: what it answers and what it saw.</summary>
    public RedditWorld World { get; }

    /// <summary>
    /// Starts the fake on <paramref name="url"/>'s port, on this machine's loopback, where <c>adb reverse</c> forwards the
    /// phone's port to. Port 0 takes a free port, which <see cref="Url"/> then names.
    /// </summary>
    public static async Task<FakeRedditServer> StartAsync(string url)
    {
        var requested = new Uri(url);
        var port = requested.Port == 0 ? FreePort() : requested.Port;
        var listening = new UriBuilder(requested) { Port = port }.Uri.ToString().TrimEnd('/');

        var builder = WebApplication.CreateSlimBuilder();
        builder.Logging.ClearProviders();
        builder.Services.AddRouting(options => options.SetParameterPolicy<RegexInlineRouteConstraint>("regex"));
        builder.WebHost.UseKestrel(kestrel => kestrel.ListenLocalhost(port));
        var app = builder.Build();
        var world = new RedditWorld(listening);
        Map(app, world);
        try
        {
            await app.StartAsync();
        }
        catch
        {
            await app.DisposeAsync();
            throw;
        }

        return new FakeRedditServer(app, world, listening);
    }

    public async ValueTask DisposeAsync()
    {
        await app.StopAsync();
        await app.DisposeAsync();
    }

    // Waits a trouble's delay; false when the app gave up waiting first.
    private static async Task<bool> WaitAsync(TimeSpan delay, HttpContext context)
    {
        try
        {
            await Task.Delay(delay, context.RequestAborted);
            return true;
        }
        catch (OperationCanceledException)
        {
            return false;
        }
    }

    private static int FreePort()
    {
        using var listener = new TcpListener(IPAddress.Loopback, 0);
        listener.Start();
        return ((IPEndPoint)listener.LocalEndpoint).Port;
    }

    private static void Map(WebApplication app, RedditWorld world)
    {
        // Every request but the debugging ones is logged, with whose it was and what the fake answered.
        app.Use(async (context, next) =>
        {
            var raw = context.Request.Path.Value ?? "/";
            context.Request.Path = RedditPaths.Normalize(raw);
            await next(context);
            if (!raw.StartsWith("/_fake/", StringComparison.Ordinal))
            {
                world.Record(
                    new RecordedRequest(
                        DateTimeOffset.UtcNow,
                        context.Request.Method,
                        raw,
                        context.Request.QueryString.Value ?? "",
                        context.Items[Caller.AccountKey] as string,
                        context.Request.Headers.UserAgent.ToString(),
                        context.Response.StatusCode),
                    handled: !context.Items.ContainsKey(Unhandled));
            }
        });

        // The requests a test picked are held back, dropped or failed (RequestTrouble): after the logging above, so it
        // records what they got.
        app.Use(async (context, next) =>
        {
            if (world.TroubleOf(context.Request.Method, context.Request.Path.Value ?? "/") is not { } trouble)
            {
                await next(context);
                return;
            }

            if (trouble.Status is null && !trouble.Drops)
            {
                // Held back: the answer is what the world held when the request came, sent after the delay.
                var body = context.Response.Body;
                using var answer = new MemoryStream();
                context.Response.Body = answer;
                await next(context);
                context.Response.Body = body;
                if (await WaitAsync(trouble.Delay, context))
                {
                    answer.Position = 0;
                    await answer.CopyToAsync(body, context.RequestAborted);
                }

                return;
            }

            if (!await WaitAsync(trouble.Delay, context))
            {
                return;
            }

            if (trouble.Drops)
            {
                context.Abort();
                return;
            }

            await Answers.Error(trouble.Status!.Value, ReasonPhrases.GetReasonPhrase(trouble.Status.Value), trouble.Explanation).ExecuteAsync(context);
        });

        // Routing matches the normalized path: it runs after the middleware above.
        app.UseRouting();
        Listings.Map(app, world);
        Accounts.Map(app, world);
        Actions.Map(app, world);
        Login.Map(app, world);
        Media.Map(app, world);
        Debug.Map(app, world);
        app.MapFallback((HttpContext context) =>
        {
            context.Items[Unhandled] = true;
            return Results.Json(new { message = "Not Found", error = 404 }, statusCode: StatusCodes.Status404NotFound);
        });
    }
}
