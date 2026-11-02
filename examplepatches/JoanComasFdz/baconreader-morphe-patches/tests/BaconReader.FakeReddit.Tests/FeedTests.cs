// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Net;
using System.Text.Json;
using BaconReader.FakeReddit.Tests.Support;

namespace BaconReader.FakeReddit.Tests;

/// <summary>The feeds: which posts each shows, in which order, a page at a time, and every post as BaconReader needs it.</summary>
public sealed class FeedTests(FakeRedditFixture fixture) : FakeRedditTest(fixture)
{
    [Theory]
    [InlineData("/.json?obey_over18=false")]
    [InlineData("/r/All/.json")]
    [InlineData("/comments/10000/.json")]
    [InlineData("/r/e2e/about.json")]
    [InlineData("/r/e2e/stylesheet.json")]
    public async Task Reddit_refuses_a_logged_out_app_with_403_Blocked(string path)
    {
        World.AddPost("e2e", "Hidden from the logged out");

        using var response = await SendAsync(HttpMethod.Get, path);

        Assert.Equal(HttpStatusCode.Forbidden, response.StatusCode);
        Assert.Equal("Blocked", await response.Content.ReadAsStringAsync(TestContext.Current.CancellationToken));
        Assert.Empty(World.Unhandled);
    }

    [Fact]
    public async Task A_logged_out_app_gets_the_feeds_when_the_world_lets_it()
    {
        World.BlocksLoggedOut = false;
        World.AddPost("e2e", "Shown");

        using var response = await SendAsync(HttpMethod.Get, "/.json");

        Assert.Equal(["Shown"], Titles(await ReadJsonAsync(response)));
    }

    [Fact]
    public async Task The_front_page_of_an_account_without_subscriptions_shows_the_default_subreddits_posts()
    {
        World.AddPost("e2e", "In a default");
        World.Subreddit("hidden_away").IsDefault = false;
        World.AddPost("hidden_away", "Not in a default");

        var listing = await GetJsonAsync("/.json?obey_over18=false");

        Assert.Equal(["In a default"], Titles(listing));
    }

    [Fact]
    public async Task The_front_page_logged_in_shows_the_accounts_subscriptions()
    {
        World.AddPost("e2e", "Subscribed");
        World.AddPost("elsewhere", "Not subscribed");
        var account = World.AddAccount("e2e_user", "pw");
        World.Subscribe(account, "e2e");
        var token = await LogInAsync(account);

        var listing = await GetJsonAsync("/.json?obey_over18=true", token);

        Assert.Equal(["Subscribed"], Titles(listing));
    }

    [Theory]
    [InlineData("/r/All/.json")]
    [InlineData("/r/all.json")]
    [InlineData("/r/all")]
    [InlineData("/r/ALL/")]
    [InlineData("/r/popular/.json")]
    public async Task All_and_popular_show_every_post_whatever_the_paths_case_json_and_slash(string path)
    {
        World.AddPost("e2e", "First");
        World.Subreddit("other").IsDefault = false;
        World.AddPost("other", "Second");

        var listing = await GetJsonAsync(path);

        Assert.Equal(["First", "Second"], Titles(listing).Order());
    }

    [Fact]
    public async Task A_subreddit_shows_only_its_posts_and_an_unknown_one_answers_404()
    {
        World.AddPost("e2e", "Here");
        World.AddPost("other", "There");

        var listing = await GetJsonAsync("/r/e2e/.json");
        using var unknown = await SendAsync(HttpMethod.Get, "/r/nowhere/.json", await ReaderAsync());

        Assert.Equal(["Here"], Titles(listing));
        Assert.Equal(HttpStatusCode.NotFound, unknown.StatusCode);
    }

    [Fact]
    public async Task New_shows_the_newest_first_and_top_the_highest_score_first()
    {
        World.AddPost("e2e", "Old and loved", post => post.PostedAgo(TimeSpan.FromHours(5)).WithScore(500));
        World.AddPost("e2e", "Fresh", post => post.WithScore(3));

        var newest = await GetJsonAsync("/r/e2e/new.json");
        var top = await GetJsonAsync("/r/e2e/top.json?t=all");
        var topOfTheHour = await GetJsonAsync("/r/e2e/top.json?t=hour");

        Assert.Equal(["Fresh", "Old and loved"], Titles(newest));
        Assert.Equal(["Old and loved", "Fresh"], Titles(top));
        Assert.Equal(["Fresh"], Titles(topOfTheHour));
    }

    [Fact]
    public async Task A_feed_pages_by_limit_and_after()
    {
        for (var post = 1; post <= 5; post++)
        {
            World.AddPost("e2e", $"Post {post}", build => build.WithScore(10 - post));
        }

        var first = await GetJsonAsync("/r/e2e/.json?limit=2");
        var after = first.GetProperty("data").GetProperty("after").GetString();
        var second = await GetJsonAsync($"/r/e2e/.json?limit=2&after={after}");
        var last = await GetJsonAsync($"/r/e2e/.json?limit=2&after={second.GetProperty("data").GetProperty("after").GetString()}");

        Assert.Equal(["Post 1", "Post 2"], Titles(first));
        Assert.Equal(["Post 3", "Post 4"], Titles(second));
        Assert.Equal(["Post 5"], Titles(last));
        Assert.Equal(JsonValueKind.Null, last.GetProperty("data").GetProperty("after").ValueKind);
    }

    [Fact]
    public async Task Every_thing_is_exactly_kind_then_data_as_BaconReaders_parser_needs()
    {
        World.AddPost("e2e", "A post");

        var listing = await GetJsonAsync("/r/e2e/.json");

        Assert.Equal(["kind", "data"], listing.EnumerateObject().Select(property => property.Name));
        var child = listing.GetProperty("data").GetProperty("children")[0];
        Assert.Equal(["kind", "data"], child.EnumerateObject().Select(property => property.Name));
        Assert.Equal("t3", child.GetProperty("kind").GetString());
    }

    [Fact]
    public async Task A_post_has_every_field_BaconReader_reads_without_a_null_check()
    {
        World.AddPost("e2e", "A post", post => post.WithText("Some *text*"));

        var post = (await GetJsonAsync("/r/e2e/.json")).GetProperty("data").GetProperty("children")[0].GetProperty("data");

        foreach (var field in new[] { "over_18", "is_self", "saved", "hidden", "archived", "is_gallery" })
        {
            Assert.True(post.GetProperty(field).ValueKind is JsonValueKind.True or JsonValueKind.False, $"{field} should be a boolean.");
        }

        foreach (var field in new[] { "author", "id", "name", "title", "subreddit", "permalink", "url", "thumbnail" })
        {
            Assert.Equal(JsonValueKind.String, post.GetProperty(field).ValueKind);
        }

        Assert.True(post.GetProperty("is_self").GetBoolean());
        Assert.StartsWith("t3_", post.GetProperty("name").GetString());
        Assert.Equal("self", post.GetProperty("thumbnail").GetString());
        Assert.Equal("&lt;!-- SC_OFF --&gt;&lt;div class=\"md\"&gt;&lt;p&gt;Some &lt;em&gt;text&lt;/em&gt;&lt;/p&gt;\n&lt;/div&gt;&lt;!-- SC_ON --&gt;", post.GetProperty("selftext_html").GetString());
    }

    [Fact]
    public async Task An_image_post_points_its_url_thumbnail_and_preview_at_the_fakes_media()
    {
        World.AddPost("e2e", "A picture", post => post.WithImage());

        var post = (await GetJsonAsync("/r/e2e/.json")).GetProperty("data").GetProperty("children")[0].GetProperty("data");
        var url = post.GetProperty("url").GetString()!;
        using var image = await SendAsync(HttpMethod.Get, new Uri(url).PathAndQuery);

        Assert.StartsWith(Server.Url + "/_media/i.redd.it/", url);
        Assert.False(post.GetProperty("is_self").GetBoolean());
        Assert.Equal(url, post.GetProperty("thumbnail").GetString());
        Assert.Equal(url, post.GetProperty("preview").GetProperty("images")[0].GetProperty("source").GetProperty("url").GetString());
        Assert.Equal(HttpStatusCode.OK, image.StatusCode);
        Assert.Equal("image/jpeg", image.Content.Headers.ContentType!.MediaType);
    }

    [Fact]
    public async Task The_default_subreddits_come_in_BaconReaders_servers_format()
    {
        World.Subreddit("e2e");
        World.Subreddit("not_default").IsDefault = false;

        var defaults = await GetJsonAsync("/_onelouder/explore-api/def_subs.json");

        var subreddit = Assert.Single(defaults.GetProperty("app").GetProperty("top_level_categories")[0].GetProperty("subreddits").EnumerateArray());
        Assert.Equal("e2e", subreddit.GetProperty("display_name").GetString());
        Assert.StartsWith("t5_", subreddit.GetProperty("name").GetString());
    }

    [Fact]
    public async Task A_subreddits_about_is_a_t5()
    {
        World.Subreddit("e2e");

        var about = await GetJsonAsync("/r/e2e/about.json");

        Assert.Equal("t5", about.GetProperty("kind").GetString());
        Assert.Equal("e2e", about.GetProperty("data").GetProperty("display_name").GetString());
    }
}
