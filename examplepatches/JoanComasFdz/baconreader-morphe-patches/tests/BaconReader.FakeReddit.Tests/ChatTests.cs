// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Net;
using BaconReader.FakeReddit.Tests.Support;
using BaconReader.FakeReddit.World;

namespace BaconReader.FakeReddit.Tests;

/// <summary>
/// Reddit's chat, <c>www.reddit.com/chat</c>, where "E2E fake Reddit" moves www.reddit.com: a plain page of the fake's
/// own, not Reddit's chat, which is a website with no API.
/// </summary>
public sealed class ChatTests(FakeRedditFixture fixture) : FakeRedditTest(fixture)
{
    [Theory]
    [InlineData("/chat")]
    [InlineData("/chat/room/e2e")]
    public async Task The_chat_and_its_pages_are_a_page_with_its_heading_and_links(string path)
    {
        var post = World.AddPost("e2e", "Weekly thread");
        World.Chat.AddLink("A post someone shared", "https://www.reddit.com" + post.Permalink);

        using var response = await SendAsync(HttpMethod.Get, path);

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
        Assert.Equal("text/html", response.Content.Headers.ContentType!.MediaType);
        var html = await response.Content.ReadAsStringAsync(TestContext.Current.CancellationToken);
        Assert.Contains($"<h1>{ChatPage.Heading}</h1>", html);
        Assert.Contains($"<a href=\"https://www.reddit.com{post.Permalink}\">A post someone shared</a>", html);
        Assert.Empty(World.Unhandled);
    }

    [Fact]
    public async Task A_new_scenario_starts_with_a_chat_without_links()
    {
        World.Chat.AddLink("Old link", "https://www.reddit.com/r/e2e/");
        World.Reset();

        using var response = await SendAsync(HttpMethod.Get, "/chat");

        Assert.DoesNotContain("Old link", await response.Content.ReadAsStringAsync(TestContext.Current.CancellationToken));
    }
}
