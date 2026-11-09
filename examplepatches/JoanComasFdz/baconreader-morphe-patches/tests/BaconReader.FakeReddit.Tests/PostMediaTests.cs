// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Net;
using System.Text;
using System.Text.Json;
using BaconReader.FakeReddit.Tests.Support;
using BaconReader.FakeReddit.World;

namespace BaconReader.FakeReddit.Tests;

/// <summary>Media posts and their thumbnails: videos, signed previews, link posts, NSFW and spoiler posts, galleries, crossposts; and users' avatars.</summary>
public sealed class PostMediaTests(FakeRedditFixture fixture) : FakeRedditTest(fixture)
{
    [Fact]
    public async Task A_video_post_has_its_reddit_video_and_the_fake_serves_its_playlist_and_both_renditions()
    {
        var post = World.AddPost("e2e", "Watch this", build => build.AsVideo());
        var id = post.VideoId!;

        var data = await ReadPostAsync(post);

        Assert.True(data.GetProperty("is_video").GetBoolean());
        Assert.Equal("v.redd.it", data.GetProperty("domain").GetString());
        var url = data.GetProperty("url").GetString()!;
        Assert.Equal($"{Server.Url}/_media/v.redd.it/{id}", url);
        // As v.redd.it does, the video's own address redirects to www.reddit.com/video/<id>, which leads a browser to the
        // post and refuses other clients; BaconReader's rewrite of the address is that lookup.
        using (var redirect = await SendAsync(HttpMethod.Get, new Uri(url).PathAndQuery))
        {
            Assert.Equal(HttpStatusCode.Redirect, redirect.StatusCode);
            Assert.Equal($"{Server.Url}/video/{id}", redirect.Headers.Location!.ToString());
        }

        foreach (var lookup in new[] { $"/video/{id}", $"/_media/www.reddit.com/video/{id}" })
        {
            using var browser = new HttpRequestMessage(HttpMethod.Get, lookup);
            browser.Headers.UserAgent.ParseAdd("Mozilla/5.0 (Linux; Android 17)");
            using var toPost = await Client.SendAsync(browser, TestContext.Current.CancellationToken);
            Assert.Equal(HttpStatusCode.Redirect, toPost.StatusCode);
            Assert.Equal("https://www.reddit.com" + post.Permalink, toPost.Headers.Location!.ToString());
            using var app = await SendAsync(HttpMethod.Get, lookup);
            Assert.Equal(HttpStatusCode.Forbidden, app.StatusCode);
        }

        var video = data.GetProperty("media").GetProperty("reddit_video");
        Assert.Equal($"{Server.Url}/_media/v.redd.it/{id}/DASH_240.mp4?source=fallback", video.GetProperty("fallback_url").GetString());
        // HTML-escaped, as Reddit sends it without raw_json.
        Assert.Equal($"{Server.Url}/_media/v.redd.it/{id}/DASHPlaylist.mpd?a=e2e&amp;v=1&amp;f=sd", video.GetProperty("dash_url").GetString());
        Assert.False(video.GetProperty("is_gif").GetBoolean());
        Assert.Equal(video.GetRawText(), data.GetProperty("secure_media").GetProperty("reddit_video").GetRawText());
        var playlist = Encoding.UTF8.GetString(MediaAsset.DashPlaylist.Bytes);
        Assert.Contains("<BaseURL>DASH_240.mp4</BaseURL>", playlist);
        Assert.Contains("<BaseURL>DASH_AUDIO_128.mp4</BaseURL>", playlist);
        await AssertServesAsync($"{Server.Url}/_media/v.redd.it/{id}/DASHPlaylist.mpd", "application/dash+xml", MediaAsset.DashPlaylist.Bytes);
        await AssertServesAsync($"{Server.Url}/_media/v.redd.it/{id}/DASH_240.mp4?source=fallback", "video/mp4", MediaAsset.DashVideo.Bytes);
        await AssertServesAsync($"{Server.Url}/_media/v.redd.it/{id}/DASH_AUDIO_128.mp4", "audio/mp4", MediaAsset.DashAudio.Bytes);
        // BaconReader plays it by its HLS playlist, whose own playlists sit next to it.
        await AssertServesAsync(video.GetProperty("hls_url").GetString()!, "application/vnd.apple.mpegurl", MediaAsset.HlsPlaylist.Bytes);
        await AssertServesAsync($"{Server.Url}/_media/v.redd.it/{id}/HLS_240.m3u8", "application/vnd.apple.mpegurl", MediaAsset.HlsVideo.Bytes);
        await AssertServesAsync($"{Server.Url}/_media/v.redd.it/{id}/HLS_AUDIO_128.m3u8", "application/vnd.apple.mpegurl", MediaAsset.HlsAudio.Bytes);
        Assert.Contains("BYTERANGE=\"817@0\"", Encoding.UTF8.GetString(MediaAsset.HlsVideo.Bytes));
        await AssertServesAsync(data.GetProperty("thumbnail").GetString()!, "image/jpeg", MediaAsset.Jpeg.Bytes);
    }

    [Fact]
    public async Task Media_answer_HEAD_with_their_size()
    {
        var post = World.AddPost("e2e", "Dancing", build => build.WithGif());

        using var head = await SendAsync(HttpMethod.Head, new Uri(post.Url!).PathAndQuery);

        Assert.Equal(HttpStatusCode.OK, head.StatusCode);
        Assert.Equal(MediaAsset.LargeGif.Bytes.Length, head.Content.Headers.ContentLength);
    }

    [Fact]
    public async Task A_GIF_post_has_a_still_as_preview_another_as_thumbnail_and_the_GIF_in_its_preview_variants()
    {
        var post = World.AddPost("e2e", "Dancing", build => build.WithGif());

        var data = await ReadPostAsync(post);

        var image = data.GetProperty("preview").GetProperty("images")[0];
        Assert.Equal(post.Url, image.GetProperty("variants").GetProperty("gif").GetProperty("source").GetProperty("url").GetString());
        Assert.NotEqual(data.GetProperty("thumbnail").GetString(), image.GetProperty("source").GetProperty("url").GetString());
        await AssertServesAsync(image.GetProperty("source").GetProperty("url").GetString()!, "image/jpeg", MediaAsset.Jpeg.Bytes);
        await AssertServesAsync(data.GetProperty("thumbnail").GetString()!, "image/jpeg", MediaAsset.Jpeg.Bytes);
        await AssertServesAsync(post.Url!, "image/gif", MediaAsset.LargeGif.Bytes);
    }

    [Fact]
    public async Task A_gallery_post_links_its_gallery_on_Reddit_as_E2E_fake_Reddit_leaves_it()
    {
        var post = World.AddPost("e2e", "Album", build => build.AsGallery());

        Assert.Equal($"https://www.reddit.com/gallery/{post.Id}", (await ReadPostAsync(post)).GetProperty("url").GetString());
    }

    [Fact]
    public void The_web_page_asks_for_itself_again_once_its_script_ran()
    {
        var page = Encoding.UTF8.GetString(MediaAsset.WebPage.Bytes);

        Assert.Contains("textContent = \"JavaScript is on\"", page);
        Assert.Contains("fetch(location.pathname + \"?script=ran\")", page);
    }

    [Fact]
    public async Task A_video_post_without_sound_has_no_sound_track_in_its_playlists()
    {
        var post = World.AddPost("e2e", "Silent clip", build => build.AsVideo(withSound: false));
        var id = post.VideoId!;

        var video = (await ReadPostAsync(post)).GetProperty("media").GetProperty("reddit_video");

        Assert.False(video.GetProperty("has_audio").GetBoolean());
        await AssertServesAsync($"{Server.Url}/_media/v.redd.it/{id}/DASHPlaylist.mpd", "application/dash+xml", MediaAsset.SilentDashPlaylist.Bytes);
        await AssertServesAsync($"{Server.Url}/_media/v.redd.it/{id}/HLSPlaylist.m3u8", "application/vnd.apple.mpegurl", MediaAsset.SilentHlsPlaylist.Bytes);
        Assert.DoesNotContain("audio", Encoding.UTF8.GetString(MediaAsset.SilentDashPlaylist.Bytes));
        Assert.DoesNotContain("AUDIO", Encoding.UTF8.GetString(MediaAsset.SilentHlsPlaylist.Bytes));
        using var audio = await SendAsync(HttpMethod.Get, $"/_media/v.redd.it/{id}/DASH_AUDIO_128.mp4");
        Assert.Equal(HttpStatusCode.NotFound, audio.StatusCode);
    }

    [Fact]
    public async Task A_comment_with_a_video_has_the_sound_track_too()
    {
        var post = World.AddPost("e2e", "Weekly thread");
        var comment = World.AddComment(post, "Here is a video", build => build.WithVideo());
        var id = Assert.Single(comment.Media.Keys);

        await AssertServesAsync($"{Server.Url}/_media/v.redd.it/{id}/DASH_AUDIO_128.mp4", "audio/mp4", MediaAsset.DashAudio.Bytes);
    }

    [Fact]
    public async Task A_signed_thumbnail_is_escaped_and_served_only_once_unescaped()
    {
        var post = World.AddPost("e2e", "Signed", build => build.WithImage().WithASignedThumbnail());

        var thumbnail = (await ReadPostAsync(post)).GetProperty("thumbnail").GetString()!;

        Assert.Contains("?width=140&amp;height=105&amp;", thumbnail);
        using var escaped = await SendAsync(HttpMethod.Get, new Uri(thumbnail).PathAndQuery);
        Assert.Equal(HttpStatusCode.Forbidden, escaped.StatusCode);
        Assert.Empty(World.Unhandled);
        await AssertServesAsync(thumbnail.Replace("&amp;", "&", StringComparison.Ordinal), "image/jpeg", MediaAsset.Jpeg.Bytes);
    }

    [Fact]
    public async Task A_link_post_with_a_preview_has_no_thumbnail_and_its_page_is_served()
    {
        var post = World.AddPost("e2e", "Read this", build => build.LinkingToAPageWithAPreview());

        var data = await ReadPostAsync(post);

        Assert.Equal("default", data.GetProperty("thumbnail").GetString());
        Assert.False(data.GetProperty("is_self").GetBoolean());
        var preview = data.GetProperty("preview").GetProperty("images")[0].GetProperty("source").GetProperty("url").GetString()!;
        await AssertServesAsync(preview, "image/jpeg", MediaAsset.Jpeg.Bytes);
        await AssertServesAsync(data.GetProperty("url").GetString()!, "text/html", MediaAsset.WebPage.Bytes);
        Assert.Contains("JavaScript is off", Encoding.UTF8.GetString(MediaAsset.WebPage.Bytes));
    }

    [Fact]
    public async Task NSFW_and_spoiler_posts_name_their_thumbnail_and_keep_their_preview()
    {
        var nsfw = World.AddPost("e2e", "Hot", build => build.WithImage().Nsfw());
        var spoiler = World.AddPost("e2e", "Ending", build => build.WithImage().Spoiler());

        var nsfwData = await ReadPostAsync(nsfw);
        var spoilerData = await ReadPostAsync(spoiler);

        Assert.Equal("nsfw", nsfwData.GetProperty("thumbnail").GetString());
        Assert.True(nsfwData.GetProperty("over_18").GetBoolean());
        Assert.Equal("spoiler", spoilerData.GetProperty("thumbnail").GetString());
        Assert.True(spoilerData.GetProperty("spoiler").GetBoolean());
        Assert.Equal(JsonValueKind.Object, spoilerData.GetProperty("preview").ValueKind);
    }

    [Fact]
    public async Task A_gallery_has_its_images_with_escaped_previews_and_a_crosspost_shares_it()
    {
        var gallery = World.AddPost("e2e", "Album", build => build.AsGallery(images: 2));
        var crosspost = World.AddPost("e2e", "Shared album", build => build.CrosspostOf(gallery));

        var galleryData = await ReadPostAsync(gallery);
        var crosspostData = await ReadPostAsync(crosspost);

        var items = galleryData.GetProperty("gallery_data").GetProperty("items");
        Assert.Equal(2, items.GetArrayLength());
        var first = galleryData.GetProperty("media_metadata").GetProperty(items[0].GetProperty("media_id").GetString()!);
        var previews = first.GetProperty("p").EnumerateArray().ToList();
        Assert.Equal([108, 216, 320], previews.Select(preview => preview.GetProperty("x").GetInt32()));
        Assert.Contains("?width=216&amp;crop=smart&amp;", previews[1].GetProperty("u").GetString());
        // Its full image, where the gallery viewer loads it.
        await AssertServesAsync($"{Server.Url}/_media/i.redd.it/{items[0].GetProperty("media_id").GetString()}.jpeg", "image/jpeg", MediaAsset.Jpeg.Bytes);
        Assert.False(crosspostData.GetProperty("is_gallery").GetBoolean());
        Assert.Equal("default", crosspostData.GetProperty("thumbnail").GetString());
        Assert.Equal(galleryData.GetProperty("url").GetString(), crosspostData.GetProperty("url").GetString());
        Assert.Equal(gallery.FullName, crosspostData.GetProperty("crosspost_parent").GetString());
        var shared = Assert.Single(crosspostData.GetProperty("crosspost_parent_list").EnumerateArray());
        Assert.True(shared.GetProperty("is_gallery").GetBoolean());
        Assert.Equal("Album", shared.GetProperty("title").GetString());
    }

    [Fact]
    public async Task The_avatars_of_users_are_answered_by_their_fullnames_and_served()
    {
        var post = World.AddPost("e2e", "Weekly thread");
        World.AddComment(post, "Hi", build => build.By("avatar_user"));
        World.GiveAvatar("avatar_user");

        var fullName = (await GetJsonAsync($"/comments/{post.Id}/.json"))[1].GetProperty("data").GetProperty("children")[0].GetProperty("data").GetProperty("author_fullname").GetString()!;
        var users = await GetJsonAsync($"/api/user_data_by_account_ids?ids={fullName},t2_nobody");

        var user = users.GetProperty(fullName);
        Assert.Equal("avatar_user", user.GetProperty("name").GetString());
        Assert.False(users.TryGetProperty("t2_nobody", out _));
        await AssertServesAsync(user.GetProperty("profile_img").GetString()!, "image/png", MediaAsset.Png.Bytes);
    }

    [Fact]
    public async Task A_see_through_avatar_is_served_as_a_see_through_png()
    {
        var path = World.GiveAvatar("glass_user", seeThrough: true);

        await AssertServesAsync(World.MediaUrl(path), "image/png", MediaAsset.SeeThroughPng.Bytes);
    }

    [Fact]
    public async Task A_trouble_with_times_hits_only_the_first_requests()
    {
        var post = World.AddPost("e2e", "Signed", build => build.WithImage());
        var path = new Uri(post.Thumbnail!).AbsolutePath;
        World.AddTrouble(new RequestTrouble((method, asked) => asked == path, TimeSpan.Zero, Status: 500, Times: 2));

        var statuses = new List<HttpStatusCode>();
        for (var request = 0; request < 3; request++)
        {
            using var answer = await SendAsync(HttpMethod.Get, path);
            statuses.Add(answer.StatusCode);
        }

        Assert.Equal([HttpStatusCode.InternalServerError, HttpStatusCode.InternalServerError, HttpStatusCode.OK], statuses);
    }

    private async Task<JsonElement> ReadPostAsync(Post post) =>
        (await GetJsonAsync($"/comments/{post.Id}/.json"))[0].GetProperty("data").GetProperty("children")[0].GetProperty("data");

    private async Task AssertServesAsync(string url, string contentType, byte[] bytes)
    {
        using var served = await SendAsync(HttpMethod.Get, new Uri(url).PathAndQuery);
        Assert.Equal(HttpStatusCode.OK, served.StatusCode);
        Assert.Equal(contentType, served.Content.Headers.ContentType!.MediaType);
        Assert.Equal(bytes, await served.Content.ReadAsByteArrayAsync(TestContext.Current.CancellationToken));
    }
}
