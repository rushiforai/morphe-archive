// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Diagnostics;
using System.Net;
using System.Text.Json;
using BaconReader.FakeReddit.Tests.Support;
using BaconReader.FakeReddit.World;

namespace BaconReader.FakeReddit.Tests;

/// <summary>The requests a test makes wait or fail (<see cref="RequestTrouble"/>), as a slow or failing Reddit does.</summary>
public sealed class TroubleTests(FakeRedditFixture fixture) : FakeRedditTest(fixture)
{
    [Fact]
    public async Task A_failing_feed_answers_its_status_and_Reddits_error_and_the_others_answer_as_usual()
    {
        World.AddPost("broken", "Never shown");
        World.AddPost("e2e", "Shown");
        World.AddTrouble(new RequestTrouble(RedditWorld.PostsOf("broken"), TimeSpan.Zero, 500));
        var token = await ReaderAsync();

        using var failed = await SendAsync(HttpMethod.Get, "/r/broken/hot.json", token);
        var body = await ReadJsonAsync(failed);
        var other = await GetJsonAsync("/r/e2e/.json", token);

        Assert.Equal(HttpStatusCode.InternalServerError, failed.StatusCode);
        Assert.Equal("Internal Server Error", failed.ReasonPhrase);
        Assert.Equal("Internal Server Error", body.GetProperty("message").GetString());
        Assert.Equal(500, body.GetProperty("error").GetInt32());
        Assert.Equal(["Shown"], Titles(other));
        Assert.Empty(World.Unhandled);
        Assert.Contains(World.Requests, request => request.Path == "/r/broken/hot.json" && request.Status == 500);
    }

    [Fact]
    public async Task A_failure_with_an_explanation_sends_Reddits_explanation()
    {
        World.AddPost("explained", "Never shown");
        World.AddTrouble(new RequestTrouble(RedditWorld.PostsOf("explained"), TimeSpan.Zero, 403, "You need to be a moderator"));

        using var failed = await SendAsync(HttpMethod.Get, "/r/explained.json", await ReaderAsync());
        var body = await ReadJsonAsync(failed);

        Assert.Equal(HttpStatusCode.Forbidden, failed.StatusCode);
        Assert.Equal("You need to be a moderator", body.GetProperty("explanation").GetString());
        Assert.Equal("Forbidden", body.GetProperty("message").GetString());
    }

    [Fact]
    public async Task A_held_back_comments_answer_is_the_post_as_it_was_asked_for_and_other_posts_answer_at_once()
    {
        var slow = World.AddPost("e2e", "Slow thread");
        var fast = World.AddPost("e2e", "Fast thread");
        World.AddTrouble(new RequestTrouble(RedditWorld.CommentsOf(slow), TimeSpan.FromSeconds(1)));
        var token = await ReaderAsync();

        var asking = Stopwatch.StartNew();
        var comments = GetJsonAsync($"{slow.Permalink}.json", token);
        await Task.Delay(TimeSpan.FromMilliseconds(300), TestContext.Current.CancellationToken);
        (await SendAsync(HttpMethod.Post, "/api/vote", token, new Dictionary<string, string> { ["id"] = slow.FullName, ["dir"] = "1" })).Dispose();
        var fastWatch = Stopwatch.StartNew();
        await GetJsonAsync($"/comments/{fast.Id}.json", token);
        fastWatch.Stop();
        var post = (await comments)[0].GetProperty("data").GetProperty("children")[0].GetProperty("data");
        asking.Stop();

        Assert.True(fastWatch.Elapsed < TimeSpan.FromSeconds(1), $"The other post's comments took {fastWatch.Elapsed}.");
        Assert.True(asking.Elapsed >= TimeSpan.FromSeconds(1), $"The held-back comments took {asking.Elapsed}.");
        Assert.Equal("Slow thread", post.GetProperty("title").GetString());
        // Asked for before the vote: the answer doesn't have it, though the world does.
        Assert.Equal(JsonValueKind.Null, post.GetProperty("likes").ValueKind);
        Assert.Equal(1, post.GetProperty("score").GetInt32());
        Assert.Equal(1, slow.Votes["e2e_reader"]);
    }

    [Fact]
    public async Task A_dropped_request_gets_no_answer()
    {
        World.AddPost("dropped", "Never shown");
        World.AddTrouble(new RequestTrouble(RedditWorld.PostsOf("dropped"), TimeSpan.Zero, Drops: true));
        var token = await ReaderAsync();

        await Assert.ThrowsAsync<HttpRequestException>(() => SendAsync(HttpMethod.Get, "/r/dropped.json", token));
    }

    [Fact]
    public async Task Reset_clears_the_troubles()
    {
        World.AddPost("broken", "Shown again");
        World.AddTrouble(new RequestTrouble(RedditWorld.PostsOf("broken"), TimeSpan.Zero, 500));

        World.Reset();
        World.AddPost("broken", "Shown again");
        var listing = await GetJsonAsync("/r/broken.json");

        Assert.Equal(["Shown again"], Titles(listing));
    }
}
