// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Net;
using BaconReader.FakeReddit.Tests.Support;
using BaconReader.FakeReddit.World;

namespace BaconReader.FakeReddit.Tests;

/// <summary>
/// Imgflip, where "E2E fake Reddit" moves Imgflip's images (<c>/_media/i.imgflip.com/…</c>): answered as Imgflip
/// answered on 2026-11-05.
/// </summary>
public sealed class ImgflipTests(FakeRedditFixture fixture) : FakeRedditTest(fixture)
{
    [Fact]
    public void The_templates_are_the_patchs_hundred_in_its_order()
    {
        Assert.Equal(100, Imgflip.Templates.Count);
        Assert.Equal(100, Imgflip.Templates.Select(template => template.Id).Distinct().Count());
        Assert.Equal(new ImgflipTemplate("30b1gx.jpg", "Drake Hotline Bling"), Imgflip.Templates[0]);
        Assert.Equal(new ImgflipTemplate("1g8my4.jpg", "Two Buttons"), Imgflip.Templates[1]);
    }

    [Fact]
    public async Task Every_templates_thumbnail_is_a_jpeg()
    {
        World.Imgflip.AddTemplates();

        foreach (var template in Imgflip.Templates)
        {
            using var response = await SendAsync(HttpMethod.Get, "/_media/" + template.ThumbnailPath);
            Assert.Equal(HttpStatusCode.OK, response.StatusCode);
            Assert.Equal("image/jpeg", response.Content.Headers.ContentType!.MediaType);
        }

        Assert.Empty(World.Unhandled);
    }

    [Theory]
    [InlineData("Drake Hotline Bling", "image/jpeg")]
    [InlineData("Always Has Been", "image/png")]
    public async Task A_template_at_full_size_has_its_files_type(string name, string contentType)
    {
        World.Imgflip.AddTemplates();
        var template = Imgflip.FindTemplate(name)!;

        using var response = await SendAsync(HttpMethod.Get, "/_media/" + template.FullPath);

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
        Assert.Equal(contentType, response.Content.Headers.ContentType!.MediaType);
    }

    [Fact]
    public async Task A_removed_template_is_404_with_an_html_page_at_full_size_and_keeps_its_thumbnail()
    {
        World.Imgflip.AddTemplates();
        var template = World.Imgflip.RemoveTemplate("Two Buttons");

        using var full = await SendAsync(HttpMethod.Get, "/_media/" + template.FullPath);
        using var thumbnail = await SendAsync(HttpMethod.Get, "/_media/" + template.ThumbnailPath);

        Assert.Equal(HttpStatusCode.NotFound, full.StatusCode);
        Assert.Equal("text/html", full.Content.Headers.ContentType!.MediaType);
        Assert.Equal(HttpStatusCode.OK, thumbnail.StatusCode);
        Assert.Empty(World.Unhandled);
    }

    [Fact]
    public async Task Without_its_templates_Imgflip_leaves_a_request_unhandled()
    {
        using var response = await SendAsync(HttpMethod.Get, "/_media/" + Imgflip.Templates[0].FullPath);

        Assert.Equal(HttpStatusCode.NotFound, response.StatusCode);
        Assert.Equal("/_media/" + Imgflip.Templates[0].FullPath, Assert.Single(World.Unhandled).Path);
    }
}
