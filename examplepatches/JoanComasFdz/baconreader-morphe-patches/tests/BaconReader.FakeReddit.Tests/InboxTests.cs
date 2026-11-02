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
}
