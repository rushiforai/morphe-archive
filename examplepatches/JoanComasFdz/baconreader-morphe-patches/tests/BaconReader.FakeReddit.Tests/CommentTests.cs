// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Net;
using System.Text.Json;
using BaconReader.FakeReddit.Tests.Support;

namespace BaconReader.FakeReddit.Tests;

/// <summary>A post's comments: the post and its comment tree, Reddit's quirks included, and media uploaded in a comment.</summary>
public sealed class CommentTests(FakeRedditFixture fixture) : FakeRedditTest(fixture)
{
    [Theory]
    [InlineData("/comments/{0}/.json?sort=confidence")]
    [InlineData("/comments/{0}")]
    [InlineData("/r/e2e/comments/{0}/weekly_thread/.json")]
    public async Task A_posts_comments_are_its_listing_then_its_comment_tree(string path)
    {
        var post = World.AddPost("e2e", "Weekly thread");
        var top = World.AddComment(post, "Top comment");
        World.AddReply(top, "A reply");

        var page = await GetJsonAsync(string.Format(path, post.Id));

        Assert.Equal(2, page.GetArrayLength());
        Assert.Equal(["Weekly thread"], Titles(page[0]));
        var comment = page[1].GetProperty("data").GetProperty("children")[0];
        Assert.Equal("t1", comment.GetProperty("kind").GetString());
        Assert.Equal("Top comment", comment.GetProperty("data").GetProperty("body").GetString());
        Assert.Equal(0, comment.GetProperty("data").GetProperty("depth").GetInt32());
        Assert.Equal(post.FullName, comment.GetProperty("data").GetProperty("parent_id").GetString());
        var reply = comment.GetProperty("data").GetProperty("replies").GetProperty("data").GetProperty("children")[0].GetProperty("data");
        Assert.Equal("A reply", reply.GetProperty("body").GetString());
        Assert.Equal(1, reply.GetProperty("depth").GetInt32());
        Assert.Equal(top.FullName, reply.GetProperty("parent_id").GetString());
    }

    [Fact]
    public async Task A_comment_without_replies_has_an_empty_string_for_them_as_Reddit_sends()
    {
        var post = World.AddPost("e2e", "Thread");
        World.AddComment(post, "Alone");

        var page = await GetJsonAsync($"/comments/{post.Id}/.json");

        var replies = page[1].GetProperty("data").GetProperty("children")[0].GetProperty("data").GetProperty("replies");
        Assert.Equal(JsonValueKind.String, replies.ValueKind);
        Assert.Equal("", replies.GetString());
    }

    [Fact]
    public async Task A_comments_body_html_is_its_markdown_escaped_as_Reddit_does()
    {
        var post = World.AddPost("e2e", "Thread");
        World.AddComment(post, "Hello **world** & [a link](https://example.com)");

        var page = await GetJsonAsync($"/comments/{post.Id}/.json");

        var html = page[1].GetProperty("data").GetProperty("children")[0].GetProperty("data").GetProperty("body_html").GetString();
        Assert.Equal(
            "&lt;div class=\"md\"&gt;&lt;p&gt;Hello &lt;strong&gt;world&lt;/strong&gt; &amp;amp; &lt;a href=\"https://example.com\"&gt;a link&lt;/a&gt;&lt;/p&gt;\n&lt;/div&gt;",
            html);
    }

    [Fact]
    public async Task A_comment_with_a_gif_names_it_in_its_body_metadata_and_html_and_the_fake_serves_it()
    {
        var post = World.AddPost("e2e", "Weekly thread");
        var comment = World.AddComment(post, "", build => build.WithGif());
        var id = Assert.Single(comment.Media.Keys);

        var page = await GetJsonAsync($"/comments/{post.Id}/.json");

        var data = page[1].GetProperty("data").GetProperty("children")[0].GetProperty("data");
        Assert.Equal($"![gif]({id})", data.GetProperty("body").GetString());
        var metadata = data.GetProperty("media_metadata").GetProperty(id);
        Assert.Equal("valid", metadata.GetProperty("status").GetString());
        Assert.Equal("AnimatedImage", metadata.GetProperty("e").GetString());
        Assert.Equal("image/gif", metadata.GetProperty("m").GetString());
        var gif = metadata.GetProperty("s").GetProperty("gif").GetString()!;
        Assert.Equal($"{Server.Url}/_media/i.redd.it/{id}.gif", gif);
        Assert.Contains($"&lt;a href=\"{gif}\" target=\"_blank\"&gt;&lt;img src=\"{gif}\" width=\"240\" height=\"180\"&gt;&lt;/a&gt;", data.GetProperty("body_html").GetString());
        using var served = await SendAsync(HttpMethod.Get, new Uri(gif).PathAndQuery);
        Assert.Equal(HttpStatusCode.OK, served.StatusCode);
        Assert.Equal("image/gif", served.Content.Headers.ContentType!.MediaType);
    }

    [Fact]
    public async Task A_link_to_one_comment_shows_its_thread()
    {
        var post = World.AddPost("e2e", "Thread");
        World.AddComment(post, "Another");
        var wanted = World.AddComment(post, "Wanted");

        var page = await GetJsonAsync($"/r/e2e/comments/{post.Id}/thread/{wanted.Id}/.json");

        var only = Assert.Single(page[1].GetProperty("data").GetProperty("children").EnumerateArray());
        Assert.Equal("Wanted", only.GetProperty("data").GetProperty("body").GetString());
    }

    [Fact]
    public async Task An_unknown_post_answers_404()
    {
        using var response = await SendAsync(HttpMethod.Get, "/comments/zzzzz/.json", await ReaderAsync());

        Assert.Equal(HttpStatusCode.NotFound, response.StatusCode);
    }

    [Fact]
    public async Task Without_a_limit_a_post_shows_200_comments_and_the_rest_behind_one_load_more()
    {
        var post = World.AddPost("e2e", "Long thread");
        var comments = Enumerable.Range(1, 203).Select(n => World.AddComment(post, $"Comment {n}")).ToList();

        var page = await GetJsonAsync($"/comments/{post.Id}/.json");

        var children = page[1].GetProperty("data").GetProperty("children").EnumerateArray().ToList();
        Assert.Equal(201, children.Count);
        Assert.All(children[..200], child => Assert.Equal("t1", child.GetProperty("kind").GetString()));
        var more = children[200];
        Assert.Equal("more", more.GetProperty("kind").GetString());
        var data = more.GetProperty("data");
        Assert.Equal(3, data.GetProperty("count").GetInt32());
        Assert.Equal(post.FullName, data.GetProperty("parent_id").GetString());
        Assert.Equal(0, data.GetProperty("depth").GetInt32());
        Assert.Equal(comments[200].Id, data.GetProperty("id").GetString());
        Assert.Equal(comments[200].FullName, data.GetProperty("name").GetString());
        Assert.Equal(comments[200..].Select(comment => comment.Id), data.GetProperty("children").EnumerateArray().Select(id => id.GetString()));
    }

    [Theory]
    [InlineData(3, 3)]
    [InlineData(600, 500)]
    public async Task A_limit_shows_that_many_comments_a_level_at_a_time_up_to_500(int limit, int shown)
    {
        var post = World.AddPost("e2e", "Long thread");
        var first = World.AddComment(post, "First");
        for (var n = 0; n < 2; n++)
        {
            World.AddReply(first, $"Reply {n}");
        }

        for (var n = 0; n < 600; n++)
        {
            World.AddComment(post, $"Comment {n}");
        }

        var page = await GetJsonAsync($"/comments/{post.Id}/.json?limit={limit}");

        var children = page[1].GetProperty("data").GetProperty("children").EnumerateArray().ToList();
        Assert.Equal(shown, children.Count(child => child.GetProperty("kind").GetString() == "t1"));
        Assert.Equal("more", children[^1].GetProperty("kind").GetString());
        Assert.Equal(601 - shown, children[^1].GetProperty("data").GetProperty("count").GetInt32());
        // The top-level comments come first: the replies of "First" are behind a "load more comments" of their own.
        var replies = children[0].GetProperty("data").GetProperty("replies").GetProperty("data").GetProperty("children");
        var more = Assert.Single(replies.EnumerateArray());
        Assert.Equal("more", more.GetProperty("kind").GetString());
        Assert.Equal(2, more.GetProperty("data").GetProperty("count").GetInt32());
        Assert.Equal(first.FullName, more.GetProperty("data").GetProperty("parent_id").GetString());
        Assert.Equal(1, more.GetProperty("data").GetProperty("depth").GetInt32());
    }

    [Fact]
    public async Task Morechildren_answers_the_comments_asked_for_with_their_replies_flat()
    {
        var post = World.AddPost("e2e", "Thread");
        var first = World.AddComment(post, "First");
        var reply = World.AddReply(first, "Reply");
        World.AddReply(reply, "Reply to the reply");
        var second = World.AddComment(post, "Second");
        World.AddComment(post, "Not asked for");
        var token = await LogInAsync(World.AddAccount("e2e_user", "pw"));

        var answer = await ReadJsonAsync(await SendAsync(HttpMethod.Post, "/api/morechildren", token, new Dictionary<string, string>
        {
            ["link_id"] = post.FullName,
            ["api_type"] = "json",
            ["sort"] = "confidence",
            ["children"] = $"{first.Id},{second.Id}",
        }));

        var things = answer.GetProperty("json").GetProperty("data").GetProperty("things").EnumerateArray().ToList();
        Assert.Equal(["First", "Reply", "Reply to the reply", "Second"], things.Select(thing => thing.GetProperty("data").GetProperty("body").GetString()));
        Assert.All(things, thing => Assert.Equal("", thing.GetProperty("data").GetProperty("replies").GetString()));
        Assert.Equal(first.FullName, things[1].GetProperty("data").GetProperty("parent_id").GetString());
        Assert.Equal(2, things[2].GetProperty("data").GetProperty("depth").GetInt32());
        Assert.Contains(World.Actions, action => action.Name == "morechildren");
    }

    [Fact]
    public async Task Morechildren_answers_403_Blocked_while_the_world_blocks_it_and_threads_still_answer()
    {
        var post = World.AddPost("e2e", "Thread");
        var first = World.AddComment(post, "First");
        World.AddReply(first, "Reply");
        World.BlocksMoreChildren = true;
        var token = await LogInAsync(World.AddAccount("e2e_user", "pw"));

        using var refused = await SendAsync(HttpMethod.Post, "/api/morechildren", token, new Dictionary<string, string>
        {
            ["link_id"] = post.FullName,
            ["api_type"] = "json",
            ["children"] = first.Id,
        });
        var thread = await ReadJsonAsync(await SendAsync(HttpMethod.Get, $"/comments/{post.Id}/-/{first.Id}.json?limit=500", token));

        Assert.Equal(HttpStatusCode.Forbidden, refused.StatusCode);
        Assert.Equal("Blocked", refused.ReasonPhrase);
        Assert.Contains("You've been blocked by network security.", await refused.Content.ReadAsStringAsync(TestContext.Current.CancellationToken), StringComparison.Ordinal);
        var focus = thread[1].GetProperty("data").GetProperty("children")[0].GetProperty("data");
        Assert.Equal("First", focus.GetProperty("body").GetString());
        Assert.Equal("Reply", focus.GetProperty("replies").GetProperty("data").GetProperty("children")[0].GetProperty("data").GetProperty("body").GetString());
    }
}
