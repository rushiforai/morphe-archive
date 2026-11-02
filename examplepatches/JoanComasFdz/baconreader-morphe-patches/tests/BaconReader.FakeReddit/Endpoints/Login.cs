// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using System.Net;
using System.Text;
using BaconReader.FakeReddit.World;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;

namespace BaconReader.FakeReddit.Endpoints;

/// <summary>
/// Reddit's OAuth login, as an app's web view goes through it:
/// <list type="number">
/// <item>the login page (<c>/api/v1/authorize.compact</c>, or without <c>.compact</c>): "Log In", the fields in elements
/// with Reddit's ids, <c>login-username</c> and <c>login-password</c>, and a "Log In" button; first Reddit's cookie banner,
/// when the world asks for it (<see cref="LoginPageOptions.ShowCookieBanner"/>);</item>
/// <item>with a known account and its password, the connect page: "Hey, &lt;user&gt;! &lt;app&gt; would like to connect
/// with your reddit account", the permissions asked, and "Accept"; a wrong password shows the login page again with
/// Reddit's error;</item>
/// <item>"Accept" redirects (302) to <c>&lt;redirect_uri&gt;?state=&lt;state&gt;&amp;code=&lt;code&gt;</c>, which the app catches;</item>
/// <item><c>POST /api/v1/access_token</c>, with Basic auth by the client ID, trades the code, or a refresh token, for a
/// token.</item>
/// </list>
/// Each step records the client ID, redirect URI and User-Agent it saw (<see cref="RedditWorld.Logins"/>).
/// </summary>
internal static class Login
{
    // The apps Reddit names on the connect page, by client ID: RedReader's, which "Spoof client" logs in as, and
    // BaconReader's own.
    private static readonly ImmutableDictionary<string, string> Apps = new Dictionary<string, string>
    {
        ["yH0aTnJEt6qUgGn835B4vg"] = "RedReader (Release)",
        ["zACVn0dSFGdWqQ"] = "BaconReader",
    }.ToImmutableDictionary();

    // What Reddit lists on the connect page for each scope an app asks for.
    private static readonly ImmutableDictionary<string, string> Scopes = new Dictionary<string, string>
    {
        ["account"] = "Update preferences and related account information. Will not have access to your email or password.",
        ["creddits"] = "Spend my reddit gold creddits on giving gold to other users.",
        ["edit"] = "Edit and delete my comments and submissions.",
        ["flair"] = "Select my subreddit flair. Change link flair on my submissions.",
        ["history"] = "Access my voting history and comments or submissions I've saved or hidden.",
        ["identity"] = "Access my reddit username and signup date.",
        ["modconfig"] = "Manage the configuration, sidebar, and CSS of subreddits I moderate.",
        ["modflair"] = "Manage and assign flair in subreddits I moderate.",
        ["modposts"] = "Approve, remove, mark nsfw, and distinguish content in subreddits I moderate.",
        ["mysubreddits"] = "Access the list of subreddits I moderate, contribute to, and subscribe to.",
        ["privatemessages"] = "Access my inbox and send private messages to other users.",
        ["read"] = "Access posts and comments through my account.",
        ["report"] = "Report content for rules violations. Hide & show individual submissions.",
        ["save"] = "Save and unsave comments and submissions.",
        ["submit"] = "Submit links and comments from my account.",
        ["subscribe"] = "Manage my subreddit subscriptions. Manage \"friends\" - users whose content I follow.",
        ["vote"] = "Submit and change my votes on comments and submissions.",
    }.ToImmutableDictionary();

    // The authorize request's fields the login carries from page to page.
    private static readonly string[] Carried = ["client_id", "response_type", "state", "redirect_uri", "duration", "scope"];

    public static void Map(WebApplication app, RedditWorld world)
    {
        foreach (var path in new[] { "/api/v1/authorize.compact", "/api/v1/authorize", "/login.compact", "/login" })
        {
            app.MapGet(path, (HttpContext context) =>
            {
                var request = Carry(context.Request.Query.ToDictionary(field => field.Key, field => field.Value.ToString()));
                world.Record(new LoginSeen("authorize", request.GetValueOrDefault("client_id"), request.GetValueOrDefault("redirect_uri"), UserAgent(context)));
                return Page(LogInPage(request, error: null, world.LoginPage.ShowCookieBanner));
            });
            app.MapPost(path, async (HttpContext context) =>
            {
                var form = await Answers.ReadFormAsync(context.Request);
                var request = Carry(form);
                Account? account;
                lock (world.Sync)
                {
                    account = world.FindAccount(form.GetValueOrDefault("username") ?? "") is { } found && found.Password == form.GetValueOrDefault("password")
                        ? found
                        : null;
                }

                world.Record(new LoginSeen("log in", request.GetValueOrDefault("client_id"), request.GetValueOrDefault("redirect_uri"), UserAgent(context)));
                return account is null
                    ? Page(LogInPage(request, "Incorrect username or password", cookieBanner: false))
                    : Page(ConnectPage(request, account));
            });
        }

        // The web view asks for the login page's icon; the fake's pages have none.
        app.MapGet("/favicon.ico", () => Results.NoContent());

        app.MapGet("/api/v1/authorize/answer", (HttpContext context) =>
        {
            var query = context.Request.Query;
            var redirect = query["redirect_uri"].ToString();
            var state = query["state"].ToString();
            world.Record(new LoginSeen("accept", query["client_id"], redirect, UserAgent(context)));
            if (query["authorize"] != "Accept")
            {
                return Results.Redirect($"{redirect}?state={state}&error=access_denied");
            }

            string code;
            lock (world.Sync)
            {
                code = world.FindAccount(query["user"].ToString()) is { } account ? world.IssueCode(account) : "";
            }

            return Results.Redirect($"{redirect}?state={state}&code={code}");
        });

        app.MapPost("/api/v1/access_token", async (HttpContext context) =>
        {
            var form = await Answers.ReadFormAsync(context.Request);
            var clientId = BasicUser(context.Request.Headers.Authorization.ToString());
            world.Record(new LoginSeen("token", clientId, form.GetValueOrDefault("redirect_uri"), UserAgent(context)));
            lock (world.Sync)
            {
                Account? account = form.GetValueOrDefault("grant_type") switch
                {
                    "authorization_code" => world.RedeemCode(form.GetValueOrDefault("code") ?? ""),
                    "refresh_token" => world.AccountOfToken(form.GetValueOrDefault("refresh_token") ?? ""),
                    _ => null,
                };
                if (clientId is null || account is null)
                {
                    return Results.Json(new { error = "invalid_grant" }, statusCode: StatusCodes.Status400BadRequest);
                }

                var refresh = form.GetValueOrDefault("refresh_token") ?? world.IssueToken(account, "refresh");
                return Answers.Json(new
                {
                    access_token = world.IssueToken(account, "access"),
                    token_type = "bearer",
                    expires_in = 86400,
                    refresh_token = refresh,
                    scope = form.GetValueOrDefault("scope") ?? "*",
                });
            }
        });
    }

    private static ImmutableDictionary<string, string> Carry(IReadOnlyDictionary<string, string> fields) =>
        Carried.Where(fields.ContainsKey).ToImmutableDictionary(name => name, name => fields[name]);

    private static string? UserAgent(HttpContext context) => context.Request.Headers.UserAgent.ToString() is { Length: > 0 } agent ? agent : null;

    // The client ID of "Authorization: Basic base64(<client id>:<secret>)".
    private static string? BasicUser(string authorization)
    {
        if (!authorization.StartsWith("Basic ", StringComparison.OrdinalIgnoreCase))
        {
            return null;
        }

        try
        {
            var decoded = Encoding.UTF8.GetString(Convert.FromBase64String(authorization["Basic ".Length..].Trim()));
            return decoded.Split(':', 2)[0];
        }
        catch (FormatException)
        {
            return null;
        }
    }

    private static IResult Page(string html) => Results.Content(html, "text/html; charset=utf-8");

    private static string Hidden(IReadOnlyDictionary<string, string> fields) =>
        string.Concat(fields.Select(field => $"<input type=\"hidden\" name=\"{Encode(field.Key)}\" value=\"{Encode(field.Value)}\">"));

    private static string Encode(string text) => WebUtility.HtmlEncode(text);

    private static string LogInPage(ImmutableDictionary<string, string> request, string? error, bool cookieBanner) =>
        Document("Log In", $"""
            {(cookieBanner ? CookieBanner : "")}
            <h1>Log In</h1>
            <form method="post">
              {Hidden(request)}
              <div id="login-username"><label>Email or username<input type="text" name="username" autocomplete="username"></label></div>
              <div id="login-password"><label>Password<input type="password" name="password" autocomplete="current-password"></label></div>
              {(error is null ? "" : $"<p class=\"error\">{Encode(error)}</p>")}
              <button type="submit">Log In</button>
            </form>
            """);

    private const string CookieBanner = """
        <div id="cookie-banner">
          <p>Let us know your cookie preferences</p>
          <button type="button" onclick="document.getElementById('cookie-banner').remove()">Reject Optional Cookies</button>
          <button type="button" onclick="document.getElementById('cookie-banner').remove()">Accept All</button>
        </div>
        """;

    private static string ConnectPage(ImmutableDictionary<string, string> request, Account account)
    {
        var app = Apps.GetValueOrDefault(request.GetValueOrDefault("client_id") ?? "", "An app");
        var scopes = (request.GetValueOrDefault("scope") ?? "").Split([',', ' '], StringSplitOptions.RemoveEmptyEntries);
        var permissions = string.Concat(scopes.Select(scope => $"<li>{Encode(Scopes.GetValueOrDefault(scope, scope))}</li>"));
        var answer = Hidden(request.Add("user", account.Name));
        return Document("Authorize", $"""
            <p>Hey, {Encode(account.Name)}! {Encode(app)} would like to connect with your reddit account</p>
            <p>Allow {Encode(app)} to:</p>
            <ul>{permissions}</ul>
            <form method="get" action="/api/v1/authorize/answer">
              {answer}
              <button type="submit" name="authorize" value="Decline">Decline</button>
              <button type="submit" name="authorize" value="Accept">Accept</button>
            </form>
            """);
    }

    private static string Document(string title, string body) => $$"""
        <!doctype html>
        <html lang="en">
        <head>
          <meta charset="utf-8">
          <meta name="viewport" content="width=device-width, initial-scale=1">
          <title>{{title}}</title>
          <style>
            body { font-family: sans-serif; margin: 16px; }
            input { display: block; width: 100%; margin: 4px 0 12px; padding: 8px; font-size: 16px; }
            button { padding: 10px 16px; font-size: 16px; margin: 4px 4px 4px 0; }
            .error { color: #d93a00; }
            #cookie-banner { border: 1px solid #ccc; padding: 8px; margin-bottom: 16px; }
          </style>
        </head>
        <body>
        {{body}}
        </body>
        </html>
        """;
}
