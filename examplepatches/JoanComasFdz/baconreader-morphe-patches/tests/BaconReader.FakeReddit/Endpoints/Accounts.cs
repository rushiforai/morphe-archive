// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.FakeReddit.Json;
using BaconReader.FakeReddit.World;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;

namespace BaconReader.FakeReddit.Endpoints;

/// <summary>
/// The logged-in account: who it is, its prefs, its subscriptions, its friends and blocked users, its multireddits and
/// its inbox, and other users' about.
/// </summary>
internal static class Accounts
{
    public static void Map(WebApplication app, RedditWorld world)
    {
        var things = new Things(world);

        app.MapGet("/api/v1/me", (HttpContext context) => Mine(context, world, account => Answers.Json(Things.User(account))));
        app.MapGet("/api/me", (HttpContext context) =>
            Mine(context, world, account => Answers.Json(new Thing("t2", Things.User(account)))));
        app.MapGet("/api/v1/me/prefs", (HttpContext context) => Mine(context, world, account => Answers.Json(account.Prefs)));
        app.MapGet("/api/v1/me/friends", (HttpContext context) => Mine(context, world, _ => Answers.Json(UserList())));
        app.MapGet("/prefs/blocked", (HttpContext context) => Mine(context, world, _ => Answers.Json(UserList())));
        app.MapGet("/api/multi/mine", (HttpContext context) => Mine(context, world, _ => Answers.Json(Array.Empty<object>())));
        app.MapGet("/message/{where}", (HttpContext context, string where) => Mine(context, world, account =>
            Answers.Json(Listings.Page(Inbox(account, where), context.Request.Query, message => message.FullName, things.Message))));

        app.MapGet("/reddits/mine", (HttpContext context) => Subscriptions(context, world, things));
        app.MapGet("/subreddits/mine/{where}", (HttpContext context) => Subscriptions(context, world, things));

        app.MapGet("/user/{name}/about", (HttpContext context, string name) =>
        {
            lock (world.Sync)
            {
                Caller.Read(context, world, out var refused);
                return refused
                    ?? (world.FindAccount(name) is { } account
                        ? Answers.Json(new Thing("t2", Things.User(account)))
                        : Answers.Error(StatusCodes.Status404NotFound, "Not Found"));
            }
        });
    }

    // What only an account sees: logged out, Reddit answers 401.
    private static IResult Mine(HttpContext context, RedditWorld world, Func<Account, IResult> answer)
    {
        lock (world.Sync)
        {
            var account = Caller.Read(context, world, out var refused);
            return refused ?? (account is null ? Answers.Error(StatusCodes.Status401Unauthorized, "Unauthorized") : answer(account));
        }
    }

    private static IResult Subscriptions(HttpContext context, RedditWorld world, Things things) =>
        Mine(context, world, account =>
        {
            var subscribed = account.Subscriptions.Select(name => world.FindSubreddit(name)).OfType<Subreddit>().ToList();
            return Answers.Json(Listings.Page(subscribed, context.Request.Query, subreddit => subreddit.FullName, subreddit => things.Subreddit(subreddit, account)));
        });

    // The messages of an inbox tab: inbox and messages hold every private message, unread the unread ones; the fake
    // sends none of the others (sent, comments, selfreply, mentions, moderator).
    private static List<Message> Inbox(Account account, string where) =>
        where.ToLowerInvariant() switch
        {
            "inbox" or "messages" => [.. account.Inbox],
            "unread" => [.. account.Inbox.Where(message => message.IsNew)],
            _ => [],
        };

    private static object UserList() => new { kind = "UserList", data = new { children = Array.Empty<object>() } };
}
