// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Net;
using BaconReader.FakeReddit.Tests.Support;
using BaconReader.FakeReddit.World;

namespace BaconReader.FakeReddit.Tests;

/// <summary>
/// YouTube, where "E2E fake Reddit" moves YouTube's oEmbed endpoint (<c>/_youtube/oembed</c>) and thumbnails
/// (<c>/_media/i.ytimg.com/…</c>): answered as YouTube answered on 2026-11-04.
/// </summary>
public sealed class YouTubeTests(FakeRedditFixture fixture) : FakeRedditTest(fixture)
{
    [Fact]
    public async Task A_videos_oEmbed_is_YouTubes_answer_with_its_title_and_channel()
    {
        var video = World.YouTube.AddVideo("Cooking pasta at home", "e2ekitchen");

        using var response = await OEmbedAsync(video.Link);

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
        var answer = await ReadJsonAsync(response);
        Assert.Equal(
            ["title", "author_name", "author_url", "type", "height", "width", "version", "provider_name", "provider_url", "thumbnail_height", "thumbnail_width", "thumbnail_url", "html"],
            answer.EnumerateObject().Select(property => property.Name));
        Assert.Equal("Cooking pasta at home", answer.GetProperty("title").GetString());
        Assert.Equal("https://www.youtube.com/@e2ekitchen", answer.GetProperty("author_url").GetString());
        // A video id is 11 letters, digits, "-" or "_": the patches take only those.
        Assert.Matches("^[A-Za-z0-9_-]{11}$", video.Id);
    }

    [Theory]
    [InlineData("https://youtu.be/{0}?t=83")]
    [InlineData("https://www.youtube.com/shorts/{0}")]
    [InlineData("https://m.youtube.com/watch?feature=share&v={0}")]
    public async Task A_short_link_a_Short_and_a_watch_page_with_more_parameters_find_the_video(string link)
    {
        var video = World.YouTube.AddVideo("Short clip", "e2ekitchen");

        using var response = await OEmbedAsync(string.Format(System.Globalization.CultureInfo.InvariantCulture, link, video.Id));

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
        Assert.Equal("Short clip", (await ReadJsonAsync(response)).GetProperty("title").GetString());
    }

    [Fact]
    public async Task A_removed_video_and_one_YouTube_never_had_are_404_Not_Found()
    {
        var removed = World.YouTube.AddVideo("Gone video", "e2e_creator", removed: true);

        using var gone = await OEmbedAsync(removed.Link);
        using var never = await OEmbedAsync("https://www.youtube.com/watch?v=abcdefghijk");

        foreach (var response in new[] { gone, never })
        {
            Assert.Equal(HttpStatusCode.NotFound, response.StatusCode);
            Assert.Equal("Not Found", await response.Content.ReadAsStringAsync(TestContext.Current.CancellationToken));
        }
    }

    [Fact]
    public async Task A_videos_thumbnails_are_served_at_the_fakes_address()
    {
        var video = World.YouTube.AddVideo("Listed video", "e2ekitchen");

        using var mq = await SendAsync(HttpMethod.Get, new Uri(video.Thumbnail).PathAndQuery);
        using var hq = await SendAsync(HttpMethod.Get, $"/_media/i.ytimg.com/vi/{video.Id}/hqdefault.jpg");

        Assert.StartsWith($"{Server.Url}/_media/i.ytimg.com/vi/{video.Id}/", video.Thumbnail, StringComparison.Ordinal);
        Assert.Equal(HttpStatusCode.OK, mq.StatusCode);
        Assert.Equal(HttpStatusCode.OK, hq.StatusCode);
        Assert.Equal(MediaAsset.Jpeg.Bytes, await mq.Content.ReadAsByteArrayAsync(TestContext.Current.CancellationToken));
    }

    // The request "Embed comment images" sends: the link URL-encoded in "url", with "format=json".
    private Task<HttpResponseMessage> OEmbedAsync(string link) =>
        SendAsync(HttpMethod.Get, "/_youtube/oembed?format=json&url=" + Uri.EscapeDataString(link));
}
