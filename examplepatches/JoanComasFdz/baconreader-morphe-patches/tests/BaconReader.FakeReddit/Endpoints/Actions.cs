// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.FakeReddit.Json;
using BaconReader.FakeReddit.World;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;

namespace BaconReader.FakeReddit.Endpoints;

/// <summary>
/// What the app does to Reddit: votes, saves, hides, subscriptions, comments, edits and deletions, each recorded in
/// <see cref="RedditWorld.Actions"/> so a test can check it was sent, and applied to the world, so the next listing shows
/// it. Reddit answers most with <c>{}</c>; a comment or an edit with the comment. Actions need an account: logged out,
/// Reddit answers 401, and the action is still recorded.
/// </summary>
internal static class Actions
{
    // Reddit's actions BaconReader sends that change nothing the fake shows: recorded, answered {}.
    private static readonly string[] Recorded =
    [
        "report", "unread_message", "store_visits", "sendreplies", "marknsfw",
        "unmarknsfw", "lock", "unlock", "approve", "remove", "distinguish", "set_subreddit_sticky", "ignore_reports",
        "unignore_reports", "block", "block_user", "unfriend", "selectflair",
    ];

    public static void Map(WebApplication app, RedditWorld world)
    {
        var things = new Things(world);
        Act(app, world, "vote", (account, form) => Vote(world, account, form));
        Act(app, world, "save", (account, form) => Mark(world, form, account, saved: true));
        Act(app, world, "unsave", (account, form) => Mark(world, form, account, saved: false));
        Act(app, world, "hide", (account, form) => Hide(world, form, account, hidden: true));
        Act(app, world, "unhide", (account, form) => Hide(world, form, account, hidden: false));
        Act(app, world, "subscribe", (account, form) => Subscribe(world, account, form));
        Act(app, world, "comment", (account, form) => Comment(world, things, account, form));
        Act(app, world, "editusertext", (account, form) => Edit(world, things, account, form));
        Act(app, world, "del", (account, form) => Delete(world, form));
        Act(app, world, "read_message", (_, form) => Read(world, form));
        Act(app, world, "read_all_messages", (account, _) => ReadAll(account));
        Act(app, world, "morechildren", (account, form) => MoreChildren(world, things, account, form));
        foreach (var name in Recorded)
        {
            Act(app, world, name, (_, _) => Answers.Json(new { }));
        }
    }

    private static void Act(WebApplication app, RedditWorld world, string name, Func<Account, ImmutableDictionary<string, string>, IResult> apply) =>
        app.MapPost("/api/" + name, async (HttpContext context) =>
        {
            var form = await Answers.ReadFormAsync(context.Request);
            lock (world.Sync)
            {
                var account = Caller.Read(context, world, out var refused);
                world.Record(new RecordedAction(DateTimeOffset.UtcNow, name, account?.Name, form));
                return refused ?? (account is null ? Answers.Error(StatusCodes.Status401Unauthorized, "Unauthorized") : apply(account, form));
            }
        });

    // The comments behind a "load more comments" (children, their ids), each with all its replies, flat and in the
    // request's sort, each naming its parent: the app puts them in its tree. Refused while the world blocks it.
    private static IResult MoreChildren(RedditWorld world, Things things, Account account, ImmutableDictionary<string, string> form)
    {
        if (world.BlocksMoreChildren)
        {
            return Answers.BlockedByNetworkSecurity();
        }

        var post = world.FindPost((form.GetValueOrDefault("link_id") ?? "").Replace("t3_", "", StringComparison.Ordinal));
        var sort = form.GetValueOrDefault("sort") ?? "";
        IEnumerable<Comment> Thread(Comment comment) =>
            Listings.SortComments(comment.Replies, sort).SelectMany(Thread).Prepend(comment);
        var asked = (form.GetValueOrDefault("children") ?? "").Split(',', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries);
        var found = asked
            .Select(world.FindComment)
            .OfType<Comment>()
            .Where(comment => comment.Post == post);
        var answer = new MoreChildrenAnswer(new MoreChildrenJson([], new MoreChildrenData(
            [.. found.SelectMany(Thread).Select(comment => things.Comment(comment, account, CommentTree.Flat))])));
        return Answers.Json(answer);
    }

    private static IResult Vote(RedditWorld world, Account account, ImmutableDictionary<string, string> form)
    {
        var direction = int.TryParse(form.GetValueOrDefault("dir"), out var dir) ? Math.Sign(dir) : 0;
        var votes = Thing(world, form.GetValueOrDefault("id")) switch
        {
            Post post => post.Votes,
            Comment comment => comment.Votes,
            _ => null,
        };
        if (votes is not null)
        {
            if (direction == 0)
            {
                votes.Remove(account.Name);
            }
            else
            {
                votes[account.Name] = direction;
            }
        }

        return Answers.Json(new { });
    }

    private static IResult Mark(RedditWorld world, ImmutableDictionary<string, string> form, Account account, bool saved)
    {
        var savedBy = Thing(world, form.GetValueOrDefault("id")) switch
        {
            Post post => post.SavedBy,
            Comment comment => comment.SavedBy,
            _ => null,
        };
        if (saved)
        {
            savedBy?.Add(account.Name);
        }
        else
        {
            savedBy?.Remove(account.Name);
        }

        return Answers.Json(new { });
    }

    private static IResult Hide(RedditWorld world, ImmutableDictionary<string, string> form, Account account, bool hidden)
    {
        foreach (var id in (form.GetValueOrDefault("id") ?? "").Split(',', StringSplitOptions.RemoveEmptyEntries))
        {
            if (Thing(world, id) is Post post)
            {
                if (hidden)
                {
                    post.HiddenBy.Add(account.Name);
                }
                else
                {
                    post.HiddenBy.Remove(account.Name);
                }
            }
        }

        return Answers.Json(new { });
    }

    // id: the messages' fullnames, comma-separated.
    private static IResult Read(RedditWorld world, ImmutableDictionary<string, string> form)
    {
        foreach (var id in (form.GetValueOrDefault("id") ?? "").Split(',', StringSplitOptions.RemoveEmptyEntries))
        {
            if (id.StartsWith("t4_", StringComparison.OrdinalIgnoreCase) && world.FindMessage(id[3..]) is { } message)
            {
                message.IsNew = false;
            }
        }

        return Answers.Json(new { });
    }

    private static IResult ReadAll(Account account)
    {
        foreach (var message in account.Inbox)
        {
            message.IsNew = false;
        }

        return Answers.Json(new { });
    }

    // sr: subreddits' fullnames, comma-separated; or sr_name: their names.
    private static IResult Subscribe(RedditWorld world, Account account, ImmutableDictionary<string, string> form)
    {
        var byFullName = (form.GetValueOrDefault("sr") ?? "").Split(',', StringSplitOptions.RemoveEmptyEntries)
            .Select(fullName => world.SubredditsUnlocked.FirstOrDefault(subreddit => subreddit.FullName.Equals(fullName, StringComparison.OrdinalIgnoreCase))?.Name);
        var byName = (form.GetValueOrDefault("sr_name") ?? "").Split(',', StringSplitOptions.RemoveEmptyEntries);
        foreach (var name in byFullName.Concat(byName).OfType<string>())
        {
            if (form.GetValueOrDefault("action") == "unsub")
            {
                account.Subscriptions.RemoveAll(subscribed => subscribed.Equals(name, StringComparison.OrdinalIgnoreCase));
            }
            else
            {
                world.Subscribe(account, name);
            }
        }

        return Answers.Json(new { });
    }

    private static IResult Comment(RedditWorld world, Things things, Account account, ImmutableDictionary<string, string> form)
    {
        var text = form.GetValueOrDefault("text") ?? "";
        Comment? made = Thing(world, form.GetValueOrDefault("thing_id")) switch
        {
            Post post => world.AddComment(post, text, comment => comment.By(account.Name)),
            Comment parent => world.AddReply(parent, text, comment => comment.By(account.Name)),
            _ => null,
        };
        return made is null
            ? Answers.Json(FailsafeErrors("THREAD_LOCKED", "that thing is gone", "parent"))
            : Answers.Json(CommentAnswer(things.Comment(made, account)));
    }

    private static IResult Edit(RedditWorld world, Things things, Account account, ImmutableDictionary<string, string> form)
    {
        var text = form.GetValueOrDefault("text") ?? "";
        switch (Thing(world, form.GetValueOrDefault("thing_id")))
        {
            case Comment comment:
                comment.Body = text;
                return Answers.Json(CommentAnswer(things.Comment(comment, account)));
            case Post post:
                post.Text = text;
                return Answers.Json(CommentAnswer(things.Link(post, account)));
            default:
                return Answers.Json(FailsafeErrors("NOT_AUTHOR", "you can't edit that", "thing_id"));
        }
    }

    private static IResult Delete(RedditWorld world, ImmutableDictionary<string, string> form)
    {
        switch (Thing(world, form.GetValueOrDefault("id")))
        {
            case Comment comment:
                comment.Author = "[deleted]";
                comment.Body = "[deleted]";
                break;
            case Post post:
                post.Author = "[deleted]";
                post.Text = "[deleted]";
                break;
        }

        return Answers.Json(new { });
    }

    // A thing by its fullname: t3_ a post, t1_ a comment.
    private static object? Thing(RedditWorld world, string? fullName) =>
        fullName switch
        {
            ['t', '3', '_', .. var id] => world.FindPost(id),
            ['t', '1', '_', .. var id] => world.FindComment(id),
            _ => null,
        };

    private static object CommentAnswer(Thing thing) =>
        new { json = new { errors = Array.Empty<object>(), data = new { things = new[] { thing } } } };

    private static object FailsafeErrors(string reason, string explanation, string field) =>
        new { json = new { errors = new[] { new[] { reason, explanation, field } } } };
}
