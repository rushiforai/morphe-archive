// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Net;
using BaconReader.FakeReddit.Tests.Support;
using BaconReader.FakeReddit.World;

namespace BaconReader.FakeReddit.Tests;

/// <summary>
/// X and Bluesky, where "E2E fake Reddit" moves X's embed service (<c>/_x/tweet-result</c>) and Bluesky's public API
/// (<c>/_bluesky/xrpc/…</c>): answered as they answered on 2026-11-04.
/// </summary>
public sealed class SocialPostsTests(FakeRedditFixture fixture) : FakeRedditTest(fixture)
{
    private static readonly DateTimeOffset Made = new(2025, 10, 2, 15, 22, 58, TimeSpan.Zero);

    [Fact]
    public async Task An_X_post_is_Xs_answer_with_its_author_text_and_date()
    {
        var post = World.X.AddPost("E2E Writer", "e2ewriter", "Just setting up", Made);

        using var response = await SendAsync(HttpMethod.Get, $"/_x/tweet-result?id={post.Id}&token=anything");

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
        var answer = await ReadJsonAsync(response);
        Assert.Equal("Just setting up", answer.GetProperty("text").GetString());
        Assert.Equal("2025-10-02T15:22:58.000Z", answer.GetProperty("created_at").GetString());
        Assert.Equal("E2E Writer", answer.GetProperty("user").GetProperty("name").GetString());
        Assert.Equal("e2ewriter", answer.GetProperty("user").GetProperty("screen_name").GetString());
        Assert.Equal(0, answer.GetProperty("mediaDetails").GetArrayLength());
        Assert.Matches(@"^https://x\.com/e2ewriter/status/\d+$", post.Link);
    }

    [Fact]
    public async Task An_X_photo_is_at_the_fakes_pbs_twimg_com_and_its_t_co_link_is_outside_the_range_shown()
    {
        var post = World.X.AddPost("E2E Writer", "e2ewriter", "A photo", Made, XMedia.Photo);

        using var response = await SendAsync(HttpMethod.Get, $"/_x/tweet-result?id={post.Id}&token=a");

        var answer = await ReadJsonAsync(response);
        var media = Assert.Single(answer.GetProperty("mediaDetails").EnumerateArray().ToArray());
        Assert.Equal("photo", media.GetProperty("type").GetString());
        Assert.Equal(post.Image, media.GetProperty("media_url_https").GetString());
        Assert.StartsWith($"{Server.Url}/_media/pbs.twimg.com/media/", post.Image, StringComparison.Ordinal);
        Assert.Equal(new[] { 0, "A photo".Length }, answer.GetProperty("display_text_range").EnumerateArray().Select(index => index.GetInt32()));
        Assert.StartsWith("A photo https://t.co/", answer.GetProperty("text").GetString(), StringComparison.Ordinal);
        // The patch asks for the small one.
        using var photo = await SendAsync(HttpMethod.Get, new Uri(post.Image!).AbsolutePath + "?name=small");
        Assert.Equal(HttpStatusCode.OK, photo.StatusCode);
    }

    [Fact]
    public async Task A_long_X_post_is_cut_at_279_characters_and_has_a_note_tweet()
    {
        var post = World.X.AddPost("E2E Writer", "e2ewriter", new string('a', 400), Made, @long: true);

        using var response = await SendAsync(HttpMethod.Get, $"/_x/tweet-result?id={post.Id}&token=a");

        var answer = await ReadJsonAsync(response);
        Assert.Equal(279, answer.GetProperty("text").GetString()!.Length);
        Assert.True(answer.TryGetProperty("note_tweet", out _));
    }

    [Fact]
    public async Task An_X_post_X_doesnt_have_is_a_404_page()
    {
        using var response = await SendAsync(HttpMethod.Get, "/_x/tweet-result?id=1999999999999999999&token=a");

        Assert.Equal(HttpStatusCode.NotFound, response.StatusCode);
        Assert.Equal("text/html", response.Content.Headers.ContentType!.MediaType);
    }

    [Theory]
    [InlineData(BlueskyEmbed.Images, "app.bsky.embed.images#view")]
    [InlineData(BlueskyEmbed.Video, "app.bsky.embed.video#view")]
    [InlineData(BlueskyEmbed.External, "app.bsky.embed.external#view")]
    [InlineData(BlueskyEmbed.Gallery, "app.bsky.embed.gallery#view")]
    public async Task A_Bluesky_post_is_Blueskys_thread_with_its_embed_and_its_picture_at_the_fakes_address(BlueskyEmbed embed, string type)
    {
        var post = World.Bluesky.AddPost("E2E Poster", "e2eposter.bsky.social", "Hello", Made, embed);

        using var response = await SendAsync(HttpMethod.Get, $"/_bluesky/xrpc/app.bsky.feed.getPostThread?depth=0&parentHeight=0&uri=at://{post.Handle}/app.bsky.feed.post/{post.Key}");

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
        var view = (await ReadJsonAsync(response)).GetProperty("thread").GetProperty("post");
        Assert.Equal("E2E Poster", view.GetProperty("author").GetProperty("displayName").GetString());
        Assert.Equal("Hello", view.GetProperty("record").GetProperty("text").GetString());
        Assert.Equal("2025-10-02T15:22:58.000Z", view.GetProperty("record").GetProperty("createdAt").GetString());
        Assert.Equal(type, view.GetProperty("embed").GetProperty("$type").GetString());
        Assert.Contains(post.Image!, view.GetProperty("embed").GetRawText(), StringComparison.Ordinal);
        using var picture = await SendAsync(HttpMethod.Get, new Uri(post.Image!).AbsolutePath);
        Assert.Equal(HttpStatusCode.OK, picture.StatusCode);
        Assert.Equal($"https://bsky.app/profile/e2eposter.bsky.social/post/{post.Key}", post.Link);
    }

    [Fact]
    public async Task A_Bluesky_post_Bluesky_doesnt_have_is_400_NotFound()
    {
        using var response = await SendAsync(HttpMethod.Get, "/_bluesky/xrpc/app.bsky.feed.getPostThread?depth=0&parentHeight=0&uri=at://e2eposter.bsky.social/app.bsky.feed.post/3e2epost99999");

        Assert.Equal(HttpStatusCode.BadRequest, response.StatusCode);
        Assert.Equal("NotFound", (await ReadJsonAsync(response)).GetProperty("error").GetString());
    }
}
