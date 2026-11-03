// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Net;
using System.Text.Json;
using BaconReader.FakeReddit.Tests.Support;

namespace BaconReader.FakeReddit.Tests;

/// <summary>Posts' flairs, a subreddit's list of them and a search by them; posts' and comments' awards.</summary>
public sealed class FlairAndAwardTests(FakeRedditFixture fixture) : FakeRedditTest(fixture)
{
    [Fact]
    public async Task A_posts_flair_is_its_text_css_class_and_richtext_as_Reddit_sends_them()
    {
        World.AddPost("e2e", "Flaired", post => post.WithFlair("Weekly Discussion"));
        World.AddPost("e2e", "Plain");

        var posts = Posts(await GetJsonAsync("/r/e2e/.json"));

        var flaired = posts["Flaired"];
        Assert.Equal("Weekly Discussion", flaired.GetProperty("link_flair_text").GetString());
        Assert.Equal("weekly-discussion", flaired.GetProperty("link_flair_css_class").GetString());
        Assert.Equal("richtext", flaired.GetProperty("link_flair_type").GetString());
        var part = Assert.Single(flaired.GetProperty("link_flair_richtext").EnumerateArray());
        Assert.Equal("text", part.GetProperty("e").GetString());
        Assert.Equal("Weekly Discussion", part.GetProperty("t").GetString());
        var plain = posts["Plain"];
        Assert.Equal(JsonValueKind.Null, plain.GetProperty("link_flair_text").ValueKind);
        Assert.Equal(JsonValueKind.Null, plain.GetProperty("link_flair_css_class").ValueKind);
        Assert.Empty(plain.GetProperty("link_flair_richtext").EnumerateArray());
    }

    [Theory]
    [InlineData("/api/link_flair.json?r=e2e&name=e2e_reader")]
    [InlineData("/r/e2e/api/link_flair.json")]
    public async Task A_subreddit_lists_the_flairs_it_lets_users_choose_in_its_order(string path)
    {
        World.Subreddit("e2e").LinkFlairs = ["Discussion", "News"];

        var flairs = await GetJsonAsync(path);

        Assert.Equal(["Discussion", "News"], flairs.EnumerateArray().Select(flair => flair.GetProperty("text").GetString()!).ToArray());
        Assert.All(flairs.EnumerateArray(), flair => Assert.False(flair.GetProperty("text_editable").GetBoolean()));
    }

    [Fact]
    public async Task Reddit_refuses_the_flairs_of_a_subreddit_that_keeps_them_private()
    {
        World.Subreddit("quiet");

        using var response = await SendAsync(HttpMethod.Get, "/api/link_flair.json?r=quiet&name=e2e_reader", await ReaderAsync());

        Assert.Equal(HttpStatusCode.Forbidden, response.StatusCode);
        Assert.Empty(World.Unhandled);
    }

    [Fact]
    public async Task A_search_by_flairs_in_a_subreddit_finds_its_posts_with_one_of_them()
    {
        World.AddPost("e2e", "Discussed", post => post.WithFlair("Discussion"));
        World.AddPost("e2e", "Announced", post => post.WithFlair("News"));
        World.AddPost("e2e", "Asked", post => post.WithFlair("Question"));
        World.AddPost("e2e", "Plain");
        World.AddPost("elsewhere", "Discussed elsewhere", post => post.WithFlair("Discussion"));

        var one = await GetJsonAsync("/r/e2e/search.json?q=flair_name%3A%22Discussion%22&restrict_sr=on&sort=hot");
        var two = await GetJsonAsync("/r/e2e/search.json?q=flair_name%3A%22Discussion%22+OR+flair_name%3A%22News%22&restrict_sr=on&sort=hot");

        Assert.Equal(["Discussed"], Titles(one));
        Assert.Equal(["Announced", "Discussed"], Titles(two).Order().ToArray());
    }

    [Fact]
    public async Task A_post_and_a_comment_with_silver_send_their_awards_and_gildings_with_an_icon_the_fake_serves()
    {
        var post = World.AddPost("e2e", "Golden", built => built.WithSilver(3));
        World.AddComment(post, "Golden comment", built => built.WithSilver(2));

        var thread = await GetJsonAsync($"/comments/{post.Id}.json");

        var link = thread[0].GetProperty("data").GetProperty("children")[0].GetProperty("data");
        var comment = thread[1].GetProperty("data").GetProperty("children")[0].GetProperty("data");
        AssertSilver(link, 3);
        AssertSilver(comment, 2);
        var icon = new Uri(link.GetProperty("all_awardings")[0].GetProperty("icon_url").GetString()!).AbsolutePath;
        using var served = await SendAsync(HttpMethod.Get, icon);
        Assert.Equal(HttpStatusCode.OK, served.StatusCode);
    }

    private static void AssertSilver(JsonElement thing, int count)
    {
        var award = Assert.Single(thing.GetProperty("all_awardings").EnumerateArray());
        Assert.Equal("gid_1", award.GetProperty("id").GetString());
        Assert.Equal("Silver", award.GetProperty("name").GetString());
        Assert.Equal(count, award.GetProperty("count").GetInt32());
        Assert.Equal(count, thing.GetProperty("total_awards_received").GetInt32());
        Assert.Equal(count, thing.GetProperty("gildings").GetProperty("gid_1").GetInt32());
        Assert.Equal(count, thing.GetProperty("gilded").GetInt32());
    }

    private static Dictionary<string, JsonElement> Posts(JsonElement listing) =>
        listing.GetProperty("data").GetProperty("children").EnumerateArray()
            .Select(child => child.GetProperty("data"))
            .ToDictionary(post => post.GetProperty("title").GetString()!);
}
