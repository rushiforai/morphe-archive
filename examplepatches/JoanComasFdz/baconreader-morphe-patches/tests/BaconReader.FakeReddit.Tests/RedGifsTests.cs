// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Net;
using System.Text.Json;
using BaconReader.FakeReddit.Tests.Support;
using BaconReader.FakeReddit.World;

namespace BaconReader.FakeReddit.Tests;

/// <summary>
/// RedGIFs, where "E2E fake Reddit" moves RedGIFs' API (<c>/_redgifs/v2/…</c>), its videos and images under
/// <c>/_media/media.redgifs.com/…</c>: answered as RedGIFs answered on 2026-11-03.
/// </summary>
public sealed class RedGifsTests(FakeRedditFixture fixture) : FakeRedditTest(fixture)
{
    private const string UserAgent = "BaconReader";

    [Fact]
    public async Task A_temporary_token_is_RedGIFs_answer_with_the_User_Agent_it_was_given_to()
    {
        using var response = await SendRedGifsAsync("/_redgifs/v2/auth/temporary", null, UserAgent);

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
        var answer = await ReadJsonAsync(response);
        Assert.Equal(
            ["token", "addr", "agent", "session", "rtfm"],
            answer.EnumerateObject().Select(property => property.Name));
        Assert.Equal(UserAgent, answer.GetProperty("agent").GetString());
        var request = Assert.Single(World.RedGifs.Requests);
        Assert.Equal(RedGifsRequestKind.TemporaryToken, request.Kind);
        Assert.Equal(UserAgent, request.UserAgent);
    }

    [Fact]
    public async Task A_video_with_its_token_and_User_Agent_has_its_files_at_the_fakes_address()
    {
        var gif = World.RedGifs.AddGif();
        var token = await TemporaryTokenAsync();

        using var response = await SendRedGifsAsync($"/_redgifs/v2/gifs/{gif.Id}", token, UserAgent);

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
        var urls = (await ReadJsonAsync(response)).GetProperty("gif").GetProperty("urls");
        Assert.Equal(gif.Hd, urls.GetProperty("hd").GetString());
        Assert.Equal(gif.Thumbnail, urls.GetProperty("thumbnail").GetString());
        Assert.Equal($"https://www.redgifs.com/watch/{gif.Id}", urls.GetProperty("html").GetString());
        Assert.StartsWith($"{Server.Url}/_media/media.redgifs.com/", gif.Hd, StringComparison.Ordinal);
        // RedGIFs' ids are letters only, which "Fix list thumbnails" needs.
        Assert.Matches("^[a-z]+$", gif.Id);
        using var video = await SendAsync(HttpMethod.Get, new Uri(gif.Hd).PathAndQuery);
        Assert.Equal(HttpStatusCode.OK, video.StatusCode);
        var lookup = World.RedGifs.Requests[^1];
        Assert.Equal(new RedGifsRequest(RedGifsRequestKind.Gif, gif.Id, UserAgent, token, 200), lookup);
    }

    [Fact]
    public async Task A_token_with_another_User_Agent_or_after_the_tokens_are_forgotten_is_401_WrongSender()
    {
        var gif = World.RedGifs.AddGif();
        var token = await TemporaryTokenAsync();

        using var otherAgent = await SendRedGifsAsync($"/_redgifs/v2/gifs/{gif.Id}", token, "Mozilla/5.0");
        World.RedGifs.ForgetTokens();
        using var forgotten = await SendRedGifsAsync($"/_redgifs/v2/gifs/{gif.Id}", token, UserAgent);
        var newToken = await TemporaryTokenAsync();
        using var renewed = await SendRedGifsAsync($"/_redgifs/v2/gifs/{gif.Id}", newToken, UserAgent);

        await AssertErrorAsync(otherAgent, HttpStatusCode.Unauthorized, "WrongSender");
        await AssertErrorAsync(forgotten, HttpStatusCode.Unauthorized, "WrongSender");
        Assert.Equal(HttpStatusCode.OK, renewed.StatusCode);
    }

    [Fact]
    public async Task Without_a_token_or_with_one_RedGIFs_never_gave_is_401()
    {
        var gif = World.RedGifs.AddGif();

        using var none = await SendRedGifsAsync($"/_redgifs/v2/gifs/{gif.Id}", null, UserAgent);
        using var unknown = await SendRedGifsAsync($"/_redgifs/v2/gifs/{gif.Id}", "nevergiven", UserAgent);

        await AssertErrorAsync(none, HttpStatusCode.Unauthorized, "AuthorizationHeaderMissing");
        await AssertErrorAsync(unknown, HttpStatusCode.Unauthorized, "Unauthorized");
    }

    [Fact]
    public async Task A_deleted_video_is_410_and_one_RedGIFs_never_had_404()
    {
        var gif = World.RedGifs.AddGif(RedGifState.Deleted);
        var token = await TemporaryTokenAsync();

        using var deleted = await SendRedGifsAsync($"/_redgifs/v2/gifs/{gif.Id}", token, UserAgent);
        using var missing = await SendRedGifsAsync("/_redgifs/v2/gifs/neverthereatall", token, UserAgent);

        await AssertErrorAsync(deleted, HttpStatusCode.Gone, "GifDeleted");
        await AssertErrorAsync(missing, HttpStatusCode.NotFound, "GifNotFound");
    }

    private async Task<string> TemporaryTokenAsync()
    {
        using var response = await SendRedGifsAsync("/_redgifs/v2/auth/temporary", null, UserAgent);
        return (await ReadJsonAsync(response)).GetProperty("token").GetString()!;
    }

    // A request as the patch sends RedGIFs one: its token, if any, as a Bearer, and its User-Agent.
    private async Task<HttpResponseMessage> SendRedGifsAsync(string path, string? token, string userAgent)
    {
        using var request = new HttpRequestMessage(HttpMethod.Get, path);
        request.Headers.TryAddWithoutValidation("User-Agent", userAgent);
        if (token is not null)
        {
            request.Headers.TryAddWithoutValidation("Authorization", "Bearer " + token);
        }

        return await Client.SendAsync(request, TestContext.Current.CancellationToken);
    }

    private static async Task AssertErrorAsync(HttpResponseMessage response, HttpStatusCode status, string code)
    {
        Assert.Equal(status, response.StatusCode);
        JsonElement error = (await ReadJsonAsync(response)).GetProperty("error");
        Assert.Equal(code, error.GetProperty("code").GetString());
    }
}
