// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Net;
using BaconReader.FakeReddit.Tests.Support;

namespace BaconReader.FakeReddit.Tests;

/// <summary>What the app does to Reddit: each action recorded for a test to check, and shown by the next listing.</summary>
public sealed class ActionTests(FakeRedditFixture fixture) : FakeRedditTest(fixture)
{
    [Fact]
    public async Task A_vote_is_recorded_and_the_post_then_shows_it()
    {
        var post = World.AddPost("e2e", "Vote on me", build => build.WithScore(10));
        var token = await LogInAsync(World.AddAccount("e2e_user", "pw"));

        using var voted = await SendAsync(HttpMethod.Post, "/api/vote", token, new Dictionary<string, string> { ["id"] = post.FullName, ["dir"] = "1" });
        var shown = (await GetJsonAsync("/r/e2e/.json", token)).GetProperty("data").GetProperty("children")[0].GetProperty("data");

        Assert.Equal(HttpStatusCode.OK, voted.StatusCode);
        var action = Assert.Single(World.Actions);
        Assert.Equal("vote", action.Name);
        Assert.Equal("e2e_user", action.Account);
        Assert.Equal(post.FullName, action.Form["id"]);
        Assert.True(shown.GetProperty("likes").GetBoolean());
        Assert.Equal(11, shown.GetProperty("score").GetInt32());
    }

    [Fact]
    public async Task Save_and_hide_show_in_the_accounts_listings()
    {
        var saved = World.AddPost("e2e", "Saved");
        var hidden = World.AddPost("e2e", "Hidden");
        var token = await LogInAsync(World.AddAccount("e2e_user", "pw"));

        (await SendAsync(HttpMethod.Post, "/api/save", token, new Dictionary<string, string> { ["id"] = saved.FullName })).Dispose();
        (await SendAsync(HttpMethod.Post, "/api/hide", token, new Dictionary<string, string> { ["id"] = hidden.FullName })).Dispose();
        var listing = await GetJsonAsync("/r/e2e/.json", token);
        var loggedOut = await GetJsonAsync("/r/e2e/.json");

        Assert.Equal(["Saved"], Titles(listing));
        Assert.True(listing.GetProperty("data").GetProperty("children")[0].GetProperty("data").GetProperty("saved").GetBoolean());
        Assert.Equal(["Hidden", "Saved"], Titles(loggedOut).Order());
    }

    [Fact]
    public async Task Subscribing_by_fullname_adds_the_subreddit_to_the_accounts_subscriptions()
    {
        var subreddit = World.Subreddit("e2e");
        var token = await LogInAsync(World.AddAccount("e2e_user", "pw"));

        (await SendAsync(HttpMethod.Post, "/api/subscribe", token, new Dictionary<string, string> { ["action"] = "sub", ["sr"] = subreddit.FullName })).Dispose();
        var mine = await GetJsonAsync("/reddits/mine.json", token);

        var only = Assert.Single(mine.GetProperty("data").GetProperty("children").EnumerateArray());
        Assert.Equal("e2e", only.GetProperty("data").GetProperty("display_name").GetString());
    }

    [Fact]
    public async Task A_comment_is_added_to_the_post_and_answered_as_Reddit_does()
    {
        var post = World.AddPost("e2e", "Thread");
        var token = await LogInAsync(World.AddAccount("e2e_user", "pw"));

        var answer = await ReadJsonAsync(await SendAsync(HttpMethod.Post, "/api/comment", token, new Dictionary<string, string>
        {
            ["api_type"] = "json",
            ["thing_id"] = post.FullName,
            ["text"] = "My reply",
        }));

        var thing = answer.GetProperty("json").GetProperty("data").GetProperty("things")[0];
        Assert.Equal("t1", thing.GetProperty("kind").GetString());
        Assert.Equal("My reply", thing.GetProperty("data").GetProperty("body").GetString());
        Assert.Equal("e2e_user", thing.GetProperty("data").GetProperty("author").GetString());
        Assert.Equal("My reply", Assert.Single(post.Comments).Body);
    }

    [Fact]
    public async Task An_action_logged_out_answers_403_and_is_still_recorded()
    {
        var post = World.AddPost("e2e", "Thread");

        using var response = await SendAsync(HttpMethod.Post, "/api/vote", form: new Dictionary<string, string> { ["id"] = post.FullName, ["dir"] = "1" });

        Assert.Equal(HttpStatusCode.Forbidden, response.StatusCode);
        var action = Assert.Single(World.Actions);
        Assert.Null(action.Account);
    }
}
