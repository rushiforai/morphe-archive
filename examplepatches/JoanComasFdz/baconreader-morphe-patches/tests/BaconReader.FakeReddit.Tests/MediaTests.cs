// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Net;
using System.Text;
using System.Text.Json;
using BaconReader.FakeReddit.Tests.Support;
using BaconReader.FakeReddit.World;

namespace BaconReader.FakeReddit.Tests;

/// <summary>Media in comments and post texts: uploaded images and videos, links to image and video files, and the files the fake serves for them.</summary>
public sealed class MediaTests(FakeRedditFixture fixture) : FakeRedditTest(fixture)
{
    [Fact]
    public async Task A_comment_with_an_image_has_its_previews_url_in_its_body_a_bare_link_in_its_html_and_its_metadata()
    {
        var post = World.AddPost("e2e", "Weekly thread");
        var comment = World.AddComment(post, "Here is an image", build => build.WithImage());
        var id = Assert.Single(comment.Media.Keys);

        var data = await ReadCommentAsync(post);

        // As Reddit sends one: the preview's URL on a line of its own, not ![img](id) as for a GIF.
        var preview = $"{Server.Url}/_media/preview.redd.it/{id}.png?width=320&format=png&auto=webp&s=e2e";
        Assert.Equal($"Here is an image\n\n{preview}", data.GetProperty("body").GetString());
        var metadata = data.GetProperty("media_metadata").GetProperty(id);
        Assert.Equal("Image", metadata.GetProperty("e").GetString());
        Assert.Equal("image/png", metadata.GetProperty("m").GetString());
        Assert.Equal(preview, metadata.GetProperty("s").GetProperty("u").GetString());
        var linked = preview.Replace("&", "&amp;amp;", StringComparison.Ordinal);
        Assert.Contains($"&lt;p&gt;&lt;a href=\"{linked}\"&gt;{linked}&lt;/a&gt;&lt;/p&gt;", data.GetProperty("body_html").GetString());
        await AssertServesAsync(preview, "image/png", MediaAsset.Png.Bytes);
    }

    [Fact]
    public async Task A_jpeg_uploaded_in_a_comment_is_a_pjpg_preview_as_Reddit_names_it()
    {
        var post = World.AddPost("e2e", "Weekly thread");
        var comment = World.AddComment(post, "", build => build.WithImage(MediaAsset.Jpeg));
        var id = Assert.Single(comment.Media.Keys);

        var data = await ReadCommentAsync(post);

        Assert.Equal($"{Server.Url}/_media/preview.redd.it/{id}.jpg?width=320&format=pjpg&auto=webp&s=e2e", data.GetProperty("body").GetString());
    }

    [Fact]
    public async Task A_comment_with_a_video_links_its_player_and_the_fake_serves_its_DASH_playlist_and_rendition()
    {
        var post = World.AddPost("e2e", "Weekly thread");
        var comment = World.AddComment(post, "Here is a video", build => build.WithVideo());
        var id = Assert.Single(comment.Media.Keys);

        var data = await ReadCommentAsync(post);

        // Named by the comment's own id, as in Reddit's API.
        var player = $"https://reddit.com/link/{comment.Id}/video/{id}/player";
        Assert.Equal($"Here is a video\n\n{player}", data.GetProperty("body").GetString());
        Assert.Contains($"&lt;a href=\"{player}\"&gt;{player}&lt;/a&gt;", data.GetProperty("body_html").GetString());
        var metadata = data.GetProperty("media_metadata").GetProperty(id);
        Assert.Equal("RedditVideo", metadata.GetProperty("e").GetString());
        Assert.Equal(320, metadata.GetProperty("x").GetInt32());
        Assert.Equal(240, metadata.GetProperty("y").GetInt32());
        Assert.False(metadata.GetProperty("isGif").GetBoolean());
        var playlist = $"{Server.Url}/_media/v.redd.it/{id}/DASHPlaylist.mpd";
        Assert.Equal(playlist, metadata.GetProperty("dashUrl").GetString());
        await AssertServesAsync(playlist, "application/dash+xml", MediaAsset.DashPlaylist.Bytes);
        Assert.Contains("<BaseURL>DASH_240.mp4</BaseURL>", Encoding.UTF8.GetString(MediaAsset.DashPlaylist.Bytes));
        await AssertServesAsync($"{Server.Url}/_media/v.redd.it/{id}/DASH_240.mp4", "video/mp4", MediaAsset.DashVideo.Bytes);
        // BaconReader turns a link containing "v.redd.it" into one with "www.reddit.com/video".
        await AssertServesAsync($"{Server.Url}/_media/www.reddit.com/video/{id}/DASHPlaylist.mpd", "application/dash+xml", MediaAsset.DashPlaylist.Bytes);
    }

    [Fact]
    public async Task Links_to_an_image_and_a_video_are_bare_links_to_files_the_fake_serves()
    {
        var post = World.AddPost("e2e", "Weekly thread");
        var image = World.AddComment(post, "Here is an image link", build => build.LinkingToAnImage());
        var video = World.AddComment(post, "Here is a video link", build => build.LinkingToAVideo());

        var page = await GetJsonAsync($"/comments/{post.Id}/.json");

        var comments = page[1].GetProperty("data").GetProperty("children");
        var imageUrl = image.Body.Split("\n\n")[1];
        var videoUrl = video.Body.Split("\n\n")[1];
        Assert.Matches($"^{Server.Url}/_media/example.com/[0-9a-z]+e2elink.jpg$", imageUrl);
        Assert.Matches($"^{Server.Url}/_media/example.com/[0-9a-z]+e2elink.mp4$", videoUrl);
        Assert.Contains($"&lt;a href=\"{imageUrl}\"&gt;{imageUrl}&lt;/a&gt;", comments[0].GetProperty("data").GetProperty("body_html").GetString());
        Assert.False(comments[0].GetProperty("data").TryGetProperty("media_metadata", out _));
        await AssertServesAsync(imageUrl, "image/jpeg", MediaAsset.Jpeg.Bytes);
        await AssertServesAsync(videoUrl, "video/mp4", MediaAsset.LongMp4.Bytes);
    }

    [Fact]
    public async Task A_text_post_with_an_image_has_its_previews_url_in_its_text_a_bare_link_in_its_html_and_its_metadata()
    {
        var post = World.AddPost("e2e", "A picture in text", build => build.WithTextAndImage("Look at this"));
        var id = Assert.Single(post.Media.Keys);

        var page = await GetJsonAsync($"/comments/{post.Id}/.json");

        var data = page[0].GetProperty("data").GetProperty("children")[0].GetProperty("data");
        Assert.True(data.GetProperty("is_self").GetBoolean());
        var preview = $"{Server.Url}/_media/preview.redd.it/{id}.png?width=320&format=png&auto=webp&s=e2e";
        Assert.Equal($"Look at this\n\n{preview}", data.GetProperty("selftext").GetString());
        Assert.Equal(preview, data.GetProperty("media_metadata").GetProperty(id).GetProperty("s").GetProperty("u").GetString());
        var linked = preview.Replace("&", "&amp;amp;", StringComparison.Ordinal);
        Assert.Contains($"&lt;p&gt;Look at this&lt;/p&gt;\n&lt;p&gt;&lt;a href=\"{linked}\"&gt;{linked}&lt;/a&gt;&lt;/p&gt;", data.GetProperty("selftext_html").GetString());
        await AssertServesAsync(preview, "image/png", MediaAsset.Png.Bytes);
    }

    // The data of the post's one comment.
    private async Task<JsonElement> ReadCommentAsync(Post post)
    {
        var page = await GetJsonAsync($"/comments/{post.Id}/.json");
        return page[1].GetProperty("data").GetProperty("children")[0].GetProperty("data");
    }

    private async Task AssertServesAsync(string url, string contentType, byte[] bytes)
    {
        using var served = await SendAsync(HttpMethod.Get, new Uri(url).PathAndQuery);
        Assert.Equal(HttpStatusCode.OK, served.StatusCode);
        Assert.Equal(contentType, served.Content.Headers.ContentType!.MediaType);
        Assert.Equal(bytes, await served.Content.ReadAsByteArrayAsync(TestContext.Current.CancellationToken));
    }
}
