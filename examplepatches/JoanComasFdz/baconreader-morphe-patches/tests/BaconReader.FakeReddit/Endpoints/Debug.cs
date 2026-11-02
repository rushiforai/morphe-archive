// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.FakeReddit.World;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;

namespace BaconReader.FakeReddit.Endpoints;

/// <summary>
/// The world's operations and logs over HTTP, under <c>/_fake/</c>, to look at or poke the fake by hand while debugging
/// (<c>curl</c>, or the phone's browser). Tests call <see cref="RedditWorld"/> directly.
/// </summary>
internal static class Debug
{
    public static void Map(WebApplication app, RedditWorld world)
    {
        app.MapGet("/_fake/requests", () => Results.Json(world.Requests));
        app.MapGet("/_fake/unhandled", () => Results.Json(world.Unhandled));
        app.MapGet("/_fake/actions", () => Results.Json(world.Actions));
        app.MapGet("/_fake/logins", () => Results.Json(world.Logins));
        app.MapGet("/_fake/world", () =>
        {
            lock (world.Sync)
            {
                return Results.Json(new
                {
                    accounts = world.AccountsUnlocked.Select(account => new { account.Name, account.Subscriptions }),
                    subreddits = world.SubredditsUnlocked.Select(subreddit => new { subreddit.Name, subreddit.IsDefault }),
                    posts = world.PostsUnlocked.Select(post => new { post.Id, subreddit = post.Subreddit.Name, post.Title, comments = post.CommentCount }),
                });
            }
        });

        app.MapPost("/_fake/reset", () =>
        {
            world.Reset();
            return Results.NoContent();
        });
        app.MapPost("/_fake/accounts", (NewAccount account) => Results.Json(new { world.AddAccount(account.Name, account.Password).Id }));
        app.MapPost("/_fake/subscriptions", (NewSubscription subscription) =>
        {
            lock (world.Sync)
            {
                if (world.FindAccount(subscription.Account) is not { } account)
                {
                    return Results.NotFound();
                }

                world.Subscribe(account, subscription.Subreddit);
                return Results.NoContent();
            }
        });
        app.MapPost("/_fake/posts", (NewPost post) =>
        {
            var made = world.AddPost(post.Subreddit, post.Title, build =>
            {
                if (post.Text is not null)
                {
                    build.WithText(post.Text);
                }

                if (post.Url is not null)
                {
                    build.LinkingTo(post.Url);
                }

                if (post.Image)
                {
                    build.WithImage();
                }

                if (post.Gif)
                {
                    build.WithGif();
                }
            });
            return Results.Json(new { made.Id, made.Permalink });
        });
        app.MapPost("/_fake/comments", (NewComment comment) =>
        {
            Post? post;
            Comment? parent;
            lock (world.Sync)
            {
                post = world.FindPost(comment.Post);
                parent = comment.Parent is null ? null : world.FindComment(comment.Parent);
            }

            if (post is null)
            {
                return Results.NotFound();
            }

            void Build(CommentBuilder build)
            {
                if (comment.Gif)
                {
                    build.WithGif();
                }

                if (comment.Image)
                {
                    build.WithImage();
                }
            }

            var made = parent is null ? world.AddComment(post, comment.Body, Build) : world.AddReply(parent, comment.Body, Build);
            return Results.Json(new { made.Id });
        });
        app.MapPut("/_fake/media/{**path}", async (HttpContext context, string path) =>
        {
            using var bytes = new MemoryStream();
            await context.Request.Body.CopyToAsync(bytes);
            var url = world.AddMedia(path, context.Request.ContentType ?? "application/octet-stream", bytes.ToArray());
            return Results.Json(new { url });
        });
    }

    internal sealed record NewAccount(string Name, string Password);

    internal sealed record NewSubscription(string Account, string Subreddit);

    internal sealed record NewPost(string Subreddit, string Title, string? Text = null, string? Url = null, bool Image = false, bool Gif = false);

    internal sealed record NewComment(string Post, string Body, string? Parent = null, bool Gif = false, bool Image = false);
}
