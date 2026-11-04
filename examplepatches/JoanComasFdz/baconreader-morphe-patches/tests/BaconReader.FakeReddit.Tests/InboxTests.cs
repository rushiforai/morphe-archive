// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Text.Json;
using BaconReader.FakeReddit.Tests.Support;

namespace BaconReader.FakeReddit.Tests;

/// <summary>An account's inbox: its messages, the unread ones, marking them as read, and <c>has_mail</c>.</summary>
public sealed class InboxTests(FakeRedditFixture fixture) : FakeRedditTest(fixture)
{
    [Fact]
    public async Task The_inbox_lists_the_messages_newest_first_as_t4s()
    {
        var account = World.AddAccount("e2e_user", "pw");
        World.AddMessage(account, "Older", "First body");
        World.AddMessage(account, "Newer", "Second body");
        var token = await LogInAsync(account);

        var inbox = await GetJsonAsync("/message/inbox/.json", token);

        var children = inbox.GetProperty("data").GetProperty("children").EnumerateArray().ToList();
        Assert.Equal(["t4", "t4"], children.Select(child => child.GetProperty("kind").GetString()));
        Assert.Equal(["Newer", "Older"], children.Select(child => child.GetProperty("data").GetProperty("subject").GetString()));
        var newest = children[0].GetProperty("data");
        Assert.True(newest.GetProperty("new").GetBoolean());
        Assert.Equal("Second body", newest.GetProperty("body").GetString());
        Assert.Equal("e2e_sender", newest.GetProperty("author").GetString());
        Assert.Equal("e2e_user", newest.GetProperty("dest").GetString());
        Assert.False(newest.GetProperty("was_comment").GetBoolean());
        Assert.Equal(JsonValueKind.String, newest.GetProperty("replies").ValueKind);
    }

    [Fact]
    public async Task Reading_a_message_leaves_it_out_of_unread_and_clears_has_mail_once_none_is_left()
    {
        var account = World.AddAccount("e2e_user", "pw");
        var first = World.AddMessage(account, "First", "Body");
        World.AddMessage(account, "Second", "Body");
        var token = await LogInAsync(account);

        var before = await GetJsonAsync("/api/v1/me.json", token);
        (await SendAsync(HttpMethod.Post, "/api/read_message", token, new Dictionary<string, string> { ["id"] = first.FullName })).Dispose();
        var unread = await GetJsonAsync("/message/unread/.json", token);
        var meWithOneUnread = await GetJsonAsync("/api/v1/me.json", token);
        (await SendAsync(HttpMethod.Post, "/api/read_all_messages", token)).Dispose();
        var meWithNone = await GetJsonAsync("/api/v1/me.json", token);

        Assert.True(before.GetProperty("has_mail").GetBoolean());
        Assert.Equal(2, before.GetProperty("inbox_count").GetInt32());
        Assert.Equal(["Second"], unread.GetProperty("data").GetProperty("children").EnumerateArray().Select(child => child.GetProperty("data").GetProperty("subject").GetString()));
        Assert.True(meWithOneUnread.GetProperty("has_mail").GetBoolean());
        Assert.False(meWithNone.GetProperty("has_mail").GetBoolean());
        Assert.Equal(0, meWithNone.GetProperty("inbox_count").GetInt32());
        Assert.Equal(["read_message", "read_all_messages"], World.Actions.Select(action => action.Name));
    }

    [Fact]
    public async Task A_reply_to_the_accounts_comment_is_in_its_inbox_as_a_comment_reply()
    {
        var account = World.AddAccount("e2e_user", "pw");
        var post = World.AddPost("e2e", "Introductions");
        var mine = World.AddComment(post, "Welcome", comment => comment.By("e2e_user"));
        var reply = World.AddReply(mine, "Thanks for having me", comment => comment.By("other_user"));
        World.AddReply(mine, "Talking to myself", comment => comment.By("e2e_user"));
        var token = await LogInAsync(account);

        var comments = await GetJsonAsync("/message/comments/.json", token);
        var messages = await GetJsonAsync("/message/messages/.json", token);
        (await SendAsync(HttpMethod.Post, "/api/read_message", token, new Dictionary<string, string> { ["id"] = reply.FullName })).Dispose();
        var unread = await GetJsonAsync("/message/unread/.json", token);

        var entry = Assert.Single(comments.GetProperty("data").GetProperty("children").EnumerateArray());
        Assert.Equal("t1", entry.GetProperty("kind").GetString());
        var data = entry.GetProperty("data");
        Assert.True(data.GetProperty("was_comment").GetBoolean());
        Assert.Equal(reply.FullName, data.GetProperty("name").GetString());
        Assert.Equal(mine.FullName, data.GetProperty("parent_id").GetString());
        Assert.Equal("Thanks for having me", data.GetProperty("body").GetString());
        Assert.Equal("other_user", data.GetProperty("author").GetString());
        Assert.Equal("e2e", data.GetProperty("subreddit").GetString());
        Assert.Equal("Introductions", data.GetProperty("link_title").GetString());
        Assert.StartsWith(post.Permalink + reply.Id, data.GetProperty("context").GetString(), StringComparison.Ordinal);
        Assert.Empty(messages.GetProperty("data").GetProperty("children").EnumerateArray());
        Assert.Empty(unread.GetProperty("data").GetProperty("children").EnumerateArray());
    }

    [Fact]
    public async Task A_reply_to_a_private_message_is_answered_as_a_message_and_recorded()
    {
        var account = World.AddAccount("e2e_user", "pw");
        var message = World.AddMessage(account, "Hello", "A private message");
        var token = await LogInAsync(account);

        using var answer = await SendAsync(HttpMethod.Post, "/api/comment", token, new Dictionary<string, string>
        {
            ["thing_id"] = message.FullName,
            ["text"] = "Thanks for writing",
            ["api_type"] = "json",
        });
        var json = JsonDocument.Parse(await answer.Content.ReadAsStringAsync(TestContext.Current.CancellationToken)).RootElement.GetProperty("json");

        Assert.Empty(json.GetProperty("errors").EnumerateArray());
        var thing = Assert.Single(json.GetProperty("data").GetProperty("things").EnumerateArray());
        Assert.Equal("t4", thing.GetProperty("kind").GetString());
        Assert.Equal("Thanks for writing", thing.GetProperty("data").GetProperty("body").GetString());
        Assert.Equal("Thanks for writing", Assert.Single(message.SentReplies).Body);
        Assert.Equal(message.FullName, Assert.Single(World.Actions).Form["thing_id"]);
    }

    [Fact]
    public async Task A_subreddits_post_requirements_are_answered_or_reddits_defaults()
    {
        var account = World.AddAccount("e2e_user", "pw");
        World.Subreddit("e2e");
        World.Subreddit("strict").PostRequirements = new(MinLength: 10, MaxLength: 100);
        World.Subreddit("linksonly").PostRequirements = new(TextNotAllowed: true);
        var token = await LogInAsync(account);

        var open = await GetJsonAsync("/api/v1/e2e/post_requirements", token);
        var strict = await GetJsonAsync("/api/v1/strict/post_requirements", token);
        var linksOnly = await GetJsonAsync("/api/v1/linksonly/post_requirements", token);
        using var missing = await SendAsync(HttpMethod.Get, "/api/v1/nowhere/post_requirements", token);

        Assert.Equal("none", open.GetProperty("body_restriction_policy").GetString());
        Assert.Equal(JsonValueKind.Null, open.GetProperty("body_text_max_length").ValueKind);
        Assert.Equal(10, strict.GetProperty("body_text_min_length").GetInt32());
        Assert.Equal(100, strict.GetProperty("body_text_max_length").GetInt32());
        Assert.Equal("notAllowed", linksOnly.GetProperty("body_restriction_policy").GetString());
        Assert.Equal(System.Net.HttpStatusCode.NotFound, missing.StatusCode);
    }
}
