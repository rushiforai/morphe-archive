// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Net;
using BaconReader.FakeReddit.Tests.Support;

namespace BaconReader.FakeReddit.Tests;

/// <summary>What the fake logs: every request, whose it was, and the requests no endpoint answers.</summary>
public sealed class LogTests(FakeRedditFixture fixture) : FakeRedditTest(fixture)
{
    [Fact]
    public async Task A_request_no_endpoint_answers_is_a_404_logged_as_unhandled()
    {
        using var response = await SendAsync(HttpMethod.Get, "/api/v1/something_new.json?x=1");

        Assert.Equal(HttpStatusCode.NotFound, response.StatusCode);
        var unhandled = Assert.Single(World.Unhandled);
        Assert.Equal("/api/v1/something_new.json", unhandled.Path);
        Assert.Equal("?x=1", unhandled.Query);
    }

    [Fact]
    public async Task A_media_file_the_store_doesnt_hold_is_unhandled_and_a_404_reddit_answers_isnt()
    {
        using var missing = await SendAsync(HttpMethod.Get, "/_media/i.redd.it/missing.gif");
        using var noPost = await SendAsync(HttpMethod.Get, "/comments/zzzzz/.json", await ReaderAsync());

        Assert.Equal(HttpStatusCode.NotFound, missing.StatusCode);
        Assert.Equal(HttpStatusCode.NotFound, noPost.StatusCode);
        Assert.Equal("/_media/i.redd.it/missing.gif", Assert.Single(World.Unhandled).Path);
    }

    [Fact]
    public async Task Every_request_is_logged_with_its_account_and_user_agent_but_the_debugging_ones()
    {
        var token = await LogInAsync(World.AddAccount("e2e_user", "pw"));
        var loggingIn = World.Requests.Length;

        (await SendAsync(HttpMethod.Get, "/_fake/world")).Dispose();
        (await SendAsync(HttpMethod.Get, "/hot.json")).Dispose();
        (await SendAsync(HttpMethod.Get, "/hot.json", token)).Dispose();

        Assert.Equal(loggingIn + 2, World.Requests.Length);
        var loggedOut = World.Requests[^2];
        Assert.Equal("/hot.json", loggedOut.Path);
        Assert.Null(loggedOut.Account);
        Assert.Equal("BaconReader/6.1.4(Android 14; Google Nexus 5)", loggedOut.UserAgent);
        Assert.Equal("e2e_user", World.Requests[^1].Account);
    }

    [Fact]
    public async Task BaconReaders_v_redd_it_rewrite_reaches_the_same_file()
    {
        World.AddMedia("v.redd.it/abc/DASH_480.mp4", "video/mp4", [1, 2, 3]);

        using var rewritten = await SendAsync(HttpMethod.Get, "/_media/www.reddit.com/video/abc/DASH_480.mp4");

        Assert.Equal(HttpStatusCode.OK, rewritten.StatusCode);
        Assert.Equal([1, 2, 3], await rewritten.Content.ReadAsByteArrayAsync(TestContext.Current.CancellationToken));
    }

    [Fact]
    public async Task The_debugging_api_builds_the_same_world_the_tests_do()
    {
        using var made = await Client.PostAsync(
            "/_fake/posts",
            new StringContent("""{"subreddit": "e2e", "title": "Made over HTTP", "gif": true}""", System.Text.Encoding.UTF8, "application/json"),
            TestContext.Current.CancellationToken);

        Assert.Equal(HttpStatusCode.OK, made.StatusCode);
        Assert.Equal(["Made over HTTP"], Titles(await GetJsonAsync("/r/e2e/.json")));
    }
}
