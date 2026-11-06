// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Net;
using System.Net.Http.Headers;
using System.Text.Json;
using BaconReader.FakeReddit.Tests.Support;
using BaconReader.FakeReddit.World;

namespace BaconReader.FakeReddit.Tests;

/// <summary>
/// Imgur, where "E2E fake Reddit" moves Imgur's API (<c>/_imgur/3/…</c>) and images (<c>/_media/i.imgur.com/…</c>):
/// answered as Imgur answered BaconReader's client ID on 2026-11-03.
/// </summary>
public sealed class ImgurTests(FakeRedditFixture fixture) : FakeRedditTest(fixture)
{
    private const string ClientId = "Client-ID 0e0b3c91fc52809";

    [Fact]
    public async Task An_albums_images_are_Imgurs_answer_with_an_empty_mp4_for_a_still_image()
    {
        var album = World.Imgur.AddAlbum("Trip", 2);

        var answer = await GetImgurAsync($"/_imgur/3/album/{album.Id}/images");

        Assert.True(answer.GetProperty("success").GetBoolean());
        Assert.Equal(200, answer.GetProperty("status").GetInt32());
        var images = answer.GetProperty("data").EnumerateArray().ToArray();
        Assert.Equal(2, images.Length);
        Assert.Equal(album.Images[0].Id, images[0].GetProperty("id").GetString());
        Assert.Equal("image/jpeg", images[0].GetProperty("type").GetString());
        Assert.False(images[0].GetProperty("animated").GetBoolean());
        // Imgur sends "mp4" empty, not left out, for a still image.
        Assert.Equal("", images[0].GetProperty("mp4").GetString());
        Assert.Equal($"{Server.Url}/_media/i.imgur.com/{album.Images[0].Id}.jpeg", images[0].GetProperty("link").GetString());
        Assert.Equal($"https://imgur.com/a/{album.Id}", album.Link);
    }

    [Fact]
    public async Task A_video_of_an_album_has_its_mp4_as_its_link_and_its_mp4()
    {
        var album = World.Imgur.AddAlbum("Clips", 0, videos: 1);

        var answer = await GetImgurAsync($"/_imgur/3/album/{album.Id}/images");

        var video = Assert.Single(answer.GetProperty("data").EnumerateArray().ToArray());
        var mp4 = $"{Server.Url}/_media/i.imgur.com/{album.Images[0].Id}.mp4";
        Assert.Equal("video/mp4", video.GetProperty("type").GetString());
        Assert.True(video.GetProperty("animated").GetBoolean());
        Assert.Equal(mp4, video.GetProperty("mp4").GetString());
        Assert.Equal(mp4, video.GetProperty("link").GetString());
        await AssertServesAsync(mp4, "video/mp4", MediaAsset.Mp4.Bytes);
        // Its thumbnails are stills of it.
        await AssertServesAsync($"{Server.Url}/_media/i.imgur.com/{album.Images[0].Id}t.png", "image/jpeg", MediaAsset.Jpeg.Bytes);
    }

    [Fact]
    public async Task A_gallery_post_is_an_album_with_its_images_and_its_title()
    {
        var album = World.Imgur.AddAlbum("Cats", 2, inGallery: true);

        var answer = await GetImgurAsync($"/_imgur/3/gallery/{album.Id}");

        var data = answer.GetProperty("data");
        Assert.True(data.GetProperty("is_album").GetBoolean());
        Assert.Equal("Cats", data.GetProperty("title").GetString());
        Assert.Equal(2, data.GetProperty("images_count").GetInt32());
        Assert.Equal(2, data.GetProperty("images").GetArrayLength());
        Assert.Equal($"https://imgur.com/gallery/{album.Id}", data.GetProperty("link").GetString());
    }

    [Fact]
    public async Task An_unknown_album_is_Imgurs_404_and_an_unknown_gallery_its_404_page()
    {
        using var album = await SendImgurAsync(HttpMethod.Get, "/_imgur/3/album/nothere/images");
        using var gallery = await SendImgurAsync(HttpMethod.Get, "/_imgur/3/gallery/nothere");

        Assert.Equal(HttpStatusCode.NotFound, album.StatusCode);
        var error = (await ReadJsonAsync(album)).GetProperty("data");
        Assert.Equal("album not found", error.GetProperty("error").GetString());
        Assert.Equal("/3/album/nothere/images", error.GetProperty("request").GetString());
        Assert.Equal(HttpStatusCode.NotFound, gallery.StatusCode);
        Assert.Equal("text/html", gallery.Content.Headers.ContentType!.MediaType);
    }

    [Fact]
    public async Task A_request_without_Imgurs_client_ID_is_refused()
    {
        var album = World.Imgur.AddAlbum("Trip", 1);

        using var response = await SendAsync(HttpMethod.Get, $"/_imgur/3/album/{album.Id}/images");

        Assert.Equal(HttpStatusCode.Unauthorized, response.StatusCode);
    }

    [Fact]
    public async Task An_images_sizes_are_the_image_whatever_size_letter_and_extension_are_asked_for()
    {
        var image = World.Imgur.AddAlbum("Trip", 1).Images[0];

        await AssertServesAsync($"{Server.Url}/_media/i.imgur.com/{image.Id}.jpeg", "image/jpeg", MediaAsset.Jpeg.Bytes);
        await AssertServesAsync($"{Server.Url}/_media/i.imgur.com/{image.Id}t.png", "image/jpeg", MediaAsset.Jpeg.Bytes);
        await AssertServesAsync($"{Server.Url}/_media/i.imgur.com/{image.Id}l.jpg", "image/jpeg", MediaAsset.Jpeg.Bytes);
    }

    [Fact]
    public async Task An_upload_with_a_content_type_is_stored_answered_and_recorded()
    {
        using var content = new ByteArrayContent(MediaAsset.Png.Bytes);
        content.Headers.ContentType = new MediaTypeHeaderValue("application/octet-stream");

        using var response = await SendImgurAsync(HttpMethod.Post, "/_imgur/3/image", content);

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
        var data = (await ReadJsonAsync(response)).GetProperty("data");
        Assert.Equal("image/png", data.GetProperty("type").GetString());
        var link = data.GetProperty("link").GetString()!;
        Assert.StartsWith($"{Server.Url}/_media/i.imgur.com/", link, StringComparison.Ordinal);
        Assert.False(string.IsNullOrEmpty(data.GetProperty("deletehash").GetString()));
        await AssertServesAsync(link, "image/png", MediaAsset.Png.Bytes);
        var upload = Assert.Single(World.Imgur.Uploads);
        Assert.Equal("application/octet-stream", upload.ContentType);
        Assert.Equal(ClientId, upload.Authorization);
        Assert.True(upload.Accepted);
    }

    [Fact]
    public async Task An_upload_sent_as_a_form_without_an_image_content_type_is_refused_and_recorded()
    {
        // BaconReader's raw file, which Android sends as a form when no content type is set.
        using var content = new ByteArrayContent(MediaAsset.Png.Bytes);
        content.Headers.ContentType = new MediaTypeHeaderValue("application/x-www-form-urlencoded");

        using var response = await SendImgurAsync(HttpMethod.Post, "/_imgur/3/image", content);

        Assert.Equal(HttpStatusCode.BadRequest, response.StatusCode);
        Assert.False((await ReadJsonAsync(response)).GetProperty("success").GetBoolean());
        var upload = Assert.Single(World.Imgur.Uploads);
        Assert.Equal("application/x-www-form-urlencoded", upload.ContentType);
        Assert.False(upload.Accepted);
    }

    private async Task<JsonElement> GetImgurAsync(string path)
    {
        using var response = await SendImgurAsync(HttpMethod.Get, path);
        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
        return await ReadJsonAsync(response);
    }

    // A request as BaconReader sends Imgur one: with Imgur's client ID.
    private async Task<HttpResponseMessage> SendImgurAsync(HttpMethod method, string path, HttpContent? content = null)
    {
        using var request = new HttpRequestMessage(method, path) { Content = content };
        request.Headers.TryAddWithoutValidation("Authorization", ClientId);
        return await Client.SendAsync(request, TestContext.Current.CancellationToken);
    }

    private async Task AssertServesAsync(string url, string contentType, byte[] bytes)
    {
        using var served = await SendAsync(HttpMethod.Get, new Uri(url).PathAndQuery);
        Assert.Equal(HttpStatusCode.OK, served.StatusCode);
        Assert.Equal(contentType, served.Content.Headers.ContentType!.MediaType);
        Assert.Equal(bytes, await served.Content.ReadAsByteArrayAsync(TestContext.Current.CancellationToken));
    }
}
