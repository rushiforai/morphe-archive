// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Net;
using BaconReader.FakeReddit.Tests.Support;

namespace BaconReader.FakeReddit.Tests;

/// <summary>Reddit's share links and gallery posts.</summary>
public sealed class ShareLinkTests(FakeRedditFixture fixture) : FakeRedditTest(fixture)
{
    [Fact]
    public async Task A_share_link_redirects_logged_out_to_what_it_opens_on_www_reddit_com_with_the_share_query()
    {
        var post = World.AddPost("e2e", "Shared post");
        var link = World.AddShareLink("r/e2e", post.Permalink);

        var response = await SendAsync(HttpMethod.Get, link);

        Assert.Equal(HttpStatusCode.MovedPermanently, response.StatusCode);
        Assert.Equal($"https://www.reddit.com{post.Permalink}", response.Headers.Location!.GetLeftPart(UriPartial.Path));
        Assert.Contains("share_id=", response.Headers.Location.Query, StringComparison.Ordinal);
    }

    [Fact]
    public async Task A_users_share_link_redirects_to_what_it_opens()
    {
        var link = World.AddShareLink("u/e2e_user", "/user/e2e_user/comments/abc12/profile_post/");

        var response = await SendAsync(HttpMethod.Get, link);

        Assert.Equal(HttpStatusCode.MovedPermanently, response.StatusCode);
        Assert.Equal("https://www.reddit.com/user/e2e_user/comments/abc12/profile_post/", response.Headers.Location!.GetLeftPart(UriPartial.Path));
    }

    [Fact]
    public async Task A_subreddits_share_link_reddit_does_not_know_redirects_to_the_subreddit()
    {
        var response = await SendAsync(HttpMethod.Get, "/r/e2e/s/Unknown123");

        Assert.Equal(HttpStatusCode.TemporaryRedirect, response.StatusCode);
        Assert.Equal("https://www.reddit.com/r/e2e/", response.Headers.Location!.ToString());
    }

    [Fact]
    public async Task A_gallery_post_links_to_its_gallery_and_names_its_image_in_gallery_data_and_media_metadata()
    {
        var post = World.AddPost("e2e", "Holiday photos", built => built.AsGallery());

        var page = await GetJsonAsync($"/comments/{post.Id}/.json");

        var data = page[0].GetProperty("data").GetProperty("children")[0].GetProperty("data");
        Assert.True(data.GetProperty("is_gallery").GetBoolean());
        Assert.Equal($"https://www.reddit.com/gallery/{post.Id}", data.GetProperty("url").GetString());
        var item = data.GetProperty("gallery_data").GetProperty("items")[0];
        var mediaId = item.GetProperty("media_id").GetString()!;
        Assert.Equal("Image", data.GetProperty("media_metadata").GetProperty(mediaId).GetProperty("e").GetString());
    }
}
