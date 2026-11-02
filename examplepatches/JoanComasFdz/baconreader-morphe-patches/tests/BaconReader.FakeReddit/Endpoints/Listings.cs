// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.FakeReddit.Json;
using BaconReader.FakeReddit.World;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;

namespace BaconReader.FakeReddit.Endpoints;

/// <summary>
/// Reddit's feeds and posts: the Front Page, r/all, r/popular, a subreddit (or several, "a+b"), each in Reddit's sorts,
/// paged by <c>after</c>, <c>before</c> and <c>limit</c>, <c>top</c> and <c>controversial</c> by <c>t</c>; a post's
/// comments; a subreddit's about; the default subreddits, Reddit's and BaconReader's server's.
/// </summary>
internal static class Listings
{
    private const string Sorts = "regex(^(best|hot|new|top|rising|controversial)$)";

    public static void Map(WebApplication app, RedditWorld world)
    {
        var things = new Things(world);

        app.MapGet("/", (HttpContext context) => Feed(context, world, things, null, "best"));
        app.MapGet($"/{{sort:{Sorts}}}", (HttpContext context, string sort) => Feed(context, world, things, null, sort));
        app.MapGet("/r/{subreddit}", (HttpContext context, string subreddit) => Feed(context, world, things, subreddit, "best"));
        app.MapGet($"/r/{{subreddit}}/{{sort:{Sorts}}}", (HttpContext context, string subreddit, string sort) =>
            Feed(context, world, things, subreddit, sort));

        app.MapGet("/comments/{id}/{**rest}", (HttpContext context, string id, string? rest) =>
            CommentsOf(context, world, things, id, rest));
        app.MapGet("/r/{subreddit}/comments/{id}/{**rest}", (HttpContext context, string id, string? rest) =>
            CommentsOf(context, world, things, id, rest));

        app.MapGet("/r/{subreddit}/about", (HttpContext context, string subreddit) =>
        {
            lock (world.Sync)
            {
                var viewer = Caller.Read(context, world, out var refused);
                return refused
                    ?? (world.FindSubreddit(subreddit) is { } found
                        ? Answers.Json(things.Subreddit(found, viewer))
                        : Answers.Error(StatusCodes.Status404NotFound, "Not Found"));
            }
        });

        // BaconReader reads a subreddit's stylesheet for its spoiler styles; the fake's subreddits have none.
        app.MapGet("/r/{subreddit}/stylesheet", (HttpContext context) =>
        {
            Caller.Read(context, world, out var refused);
            return refused ?? Answers.Json(new { kind = "stylesheet", data = new { images = Array.Empty<object>(), subreddit_id = "", stylesheet = "" } });
        });

        app.MapGet("/reddits/popular", (HttpContext context) => Subreddits(context, world, things, _ => true));
        app.MapGet("/subreddits/popular", (HttpContext context) => Subreddits(context, world, things, _ => true));
        app.MapGet("/reddits/default", (HttpContext context) => Subreddits(context, world, things, subreddit => subreddit.IsDefault));
        app.MapGet("/subreddits/default", (HttpContext context) => Subreddits(context, world, things, subreddit => subreddit.IsDefault));

        // BaconReader's own server, now shut down, named the default subreddits; the app reads only the first category.
        app.MapGet("/_onelouder/explore-api/def_subs", () =>
        {
            lock (world.Sync)
            {
                var defaults = world.SubredditsUnlocked
                    .Where(subreddit => subreddit.IsDefault)
                    .Select(subreddit => new { name = subreddit.FullName, display_name = subreddit.Name })
                    .ToArray();
                return Answers.Json(new { app = new { top_level_categories = new[] { new { name = "Default", subreddits = defaults } } } });
            }
        });
    }

    private static IResult Feed(HttpContext context, RedditWorld world, Things things, string? subreddit, string sort)
    {
        lock (world.Sync)
        {
            var viewer = Caller.Read(context, world, out var refused);
            if (refused is not null)
            {
                return refused;
            }

            var posts = PostsOf(world, subreddit, viewer);
            if (posts is null)
            {
                return Answers.Error(StatusCodes.Status404NotFound, "Not Found");
            }

            sort = sort.ToLowerInvariant();
            var query = context.Request.Query;
            var visible = posts
                .Where(post => viewer is null || !post.HiddenBy.Contains(viewer.Name))
                .Where(post => Within(post, sort, query["t"].ToString()));
            var sorted = Sort(visible, sort, pinStickied: subreddit is not null).ToList();
            return Answers.Json(Page(sorted, query, post => post.FullName, post => things.Link(post, viewer)));
        }
    }

    // The posts a feed shows: null when it names a subreddit the world doesn't have, as Reddit answers 404.
    private static IEnumerable<Post>? PostsOf(RedditWorld world, string? subreddit, Account? viewer)
    {
        var all = world.PostsUnlocked;
        if (subreddit is null)
        {
            var subscribed = viewer?.Subscriptions ?? [];
            return subscribed.Count > 0
                ? all.Where(post => subscribed.Contains(post.Subreddit.Name, StringComparer.OrdinalIgnoreCase))
                : all.Where(post => post.Subreddit.IsDefault);
        }

        if (subreddit.Equals("all", StringComparison.OrdinalIgnoreCase) || subreddit.Equals("popular", StringComparison.OrdinalIgnoreCase))
        {
            return all;
        }

        var names = subreddit.Split('+', StringSplitOptions.RemoveEmptyEntries);
        if (names.Any(name => world.FindSubreddit(name) is null))
        {
            return null;
        }

        return all.Where(post => names.Contains(post.Subreddit.Name, StringComparer.OrdinalIgnoreCase));
    }

    private static IEnumerable<Post> Sort(IEnumerable<Post> posts, string sort, bool pinStickied)
    {
        var sorted = sort switch
        {
            "new" or "rising" => posts.OrderByDescending(post => post.Created).ThenByDescending(post => post.Order),
            "top" => posts.OrderByDescending(post => post.Score).ThenByDescending(post => post.Order),
            "controversial" => posts.OrderBy(post => post.Score).ThenByDescending(post => post.Order),
            _ => posts.OrderByDescending(post => post.Score).ThenByDescending(post => post.Created).ThenByDescending(post => post.Order),
        };

        // A subreddit's hot feed starts with its stickied posts.
        return pinStickied && sort is "best" or "hot" ? sorted.OrderByDescending(post => post.IsStickied) : sorted;
    }

    private static bool Within(Post post, string sort, string time)
    {
        if (sort is not ("top" or "controversial"))
        {
            return true;
        }

        var age = DateTimeOffset.UtcNow - post.Created;
        return time.ToLowerInvariant() switch
        {
            "hour" => age <= TimeSpan.FromHours(1),
            "day" => age <= TimeSpan.FromDays(1),
            "week" => age <= TimeSpan.FromDays(7),
            "month" => age <= TimeSpan.FromDays(31),
            "year" => age <= TimeSpan.FromDays(366),
            _ => true,
        };
    }

    /// <summary>A Listing of one page of <paramref name="items"/>, as <c>after</c>, <c>before</c> and <c>limit</c> pick it.</summary>
    internal static Thing Page<T>(IReadOnlyList<T> items, IQueryCollection query, Func<T, string> fullName, Func<T, Thing> thing)
    {
        var limit = int.TryParse(query["limit"], out var asked) ? Math.Clamp(asked, 1, 100) : 25;
        var after = query["after"].ToString();
        var before = query["before"].ToString();
        int start;
        if (after.Length > 0)
        {
            start = IndexOf(items, fullName, after) + 1;
        }
        else if (before.Length > 0)
        {
            var end = IndexOf(items, fullName, before);
            start = Math.Max(0, (end < 0 ? items.Count : end) - limit);
        }
        else
        {
            start = 0;
        }

        var page = items.Skip(start).Take(limit).ToList();
        var nextAfter = start + page.Count < items.Count && page.Count > 0 ? fullName(page[^1]) : null;
        var nextBefore = start > 0 && page.Count > 0 ? fullName(page[0]) : null;
        return ListingData.Listing([.. page.Select(thing)], nextAfter, nextBefore);
    }

    private static int IndexOf<T>(IReadOnlyList<T> items, Func<T, string> fullName, string name)
    {
        for (var index = 0; index < items.Count; index++)
        {
            if (string.Equals(fullName(items[index]), name, StringComparison.OrdinalIgnoreCase))
            {
                return index;
            }
        }

        return -1;
    }

    // [the post's Listing, its comments' Listing]; the path may go on to a slug and one comment, whose thread it shows.
    private static IResult CommentsOf(HttpContext context, RedditWorld world, Things things, string id, string? rest)
    {
        lock (world.Sync)
        {
            var viewer = Caller.Read(context, world, out var refused);
            if (refused is not null)
            {
                return refused;
            }

            if (world.FindPost(id) is not { } post)
            {
                return Answers.Error(StatusCodes.Status404NotFound, "Not Found");
            }

            var focus = rest?.Split('/', StringSplitOptions.RemoveEmptyEntries) is [_, var commentId, ..]
                ? world.FindComment(commentId)
                : null;
            var sort = context.Request.Query["sort"].ToString();
            IEnumerable<Comment> Order(IEnumerable<Comment> comments) => SortComments(comments, sort);
            if (focus is not null)
            {
                return Answers.Json(new[]
                {
                    ListingData.Listing([things.Link(post, viewer)]),
                    ListingData.Listing([things.Comment(focus, viewer)]),
                });
            }

            // About 200 comments, or the request's limit, up to 500; the rest behind "load more comments".
            var limit = int.TryParse(context.Request.Query["limit"], out var asked) && asked > 0 ? asked : (int?)null;
            var tree = CommentTree.Limited(post.Comments, limit, Order);
            return Answers.Json(new[]
            {
                ListingData.Listing([things.Link(post, viewer)]),
                ListingData.Listing(things.Children(post.Comments, post.FullName, 0, viewer, tree)),
            });
        }
    }

    internal static IEnumerable<Comment> SortComments(IEnumerable<Comment> comments, string sort) =>
        sort.ToLowerInvariant() switch
        {
            "new" => comments.OrderByDescending(comment => comment.Created),
            "old" => comments.OrderBy(comment => comment.Created),
            "controversial" => comments.OrderBy(comment => comment.Score),
            // confidence (Best), top, and the rest: the highest score first, the oldest first among equals.
            _ => comments.OrderByDescending(comment => comment.Score),
        };

    private static IResult Subreddits(HttpContext context, RedditWorld world, Things things, Func<Subreddit, bool> which)
    {
        lock (world.Sync)
        {
            var viewer = Caller.Read(context, world, out var refused);
            if (refused is not null)
            {
                return refused;
            }

            var subreddits = world.SubredditsUnlocked.Where(which).ToList();
            return Answers.Json(Page(subreddits, context.Request.Query, subreddit => subreddit.FullName, subreddit => things.Subreddit(subreddit, viewer)));
        }
    }
}
