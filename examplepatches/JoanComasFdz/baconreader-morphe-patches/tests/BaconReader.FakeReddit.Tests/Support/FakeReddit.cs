// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Net;
using System.Net.Http.Headers;
using System.Text;
using System.Text.Json;
using BaconReader.FakeReddit.World;

namespace BaconReader.FakeReddit.Tests.Support;

/// <summary>One fake Reddit per test class, on a free port; each test starts from an empty world.</summary>
public sealed class FakeRedditFixture : IAsyncLifetime
{
    public FakeRedditServer Server { get; private set; } = null!;

    public async ValueTask InitializeAsync() => Server = await FakeRedditServer.StartAsync("http://127.0.0.1:0");

    public async ValueTask DisposeAsync() => await Server.DisposeAsync();
}

/// <summary>A test of the fake: its world, emptied, and an HTTP client that talks to it as the phone does.</summary>
public abstract class FakeRedditTest : IClassFixture<FakeRedditFixture>, IDisposable
{
    protected FakeRedditTest(FakeRedditFixture fixture)
    {
        Server = fixture.Server;
        World.Reset();
        Client = new HttpClient(new HttpClientHandler { AllowAutoRedirect = false }) { BaseAddress = new Uri(Server.Url) };
        // BaconReader's own User-Agent, which .NET's header parser refuses: no space before the "(".
        Client.DefaultRequestHeaders.TryAddWithoutValidation("User-Agent", "BaconReader/6.1.4(Android 14; Google Nexus 5)");
    }

    protected FakeRedditServer Server { get; }

    protected RedditWorld World => Server.World;

    protected HttpClient Client { get; }

    public void Dispose()
    {
        Client.Dispose();
        GC.SuppressFinalize(this);
    }

    /// <summary>
    /// GETs <paramref name="path"/> as <paramref name="token"/>'s account, or a reader's logged in for it (Reddit refuses a
    /// logged-out app), and reads its JSON.
    /// </summary>
    protected async Task<JsonElement> GetJsonAsync(string path, string? token = null)
    {
        using var response = await SendAsync(HttpMethod.Get, path, token ?? await ReaderAsync());
        Assert.True(response.IsSuccessStatusCode, $"GET {path} answered {(int)response.StatusCode}: {await response.Content.ReadAsStringAsync(TestContext.Current.CancellationToken)}");
        return await ReadJsonAsync(response);
    }

    /// <summary>The token of "e2e_reader", an account with no subscriptions, made and logged in on first use.</summary>
    protected async Task<string> ReaderAsync() =>
        readerToken ??= await LogInAsync(World.AddAccount("e2e_reader", "pw"));

    private string? readerToken;

    /// <summary>Sends a request as <paramref name="token"/>'s account, or logged out when it's null.</summary>
    protected async Task<HttpResponseMessage> SendAsync(HttpMethod method, string path, string? token = null, IDictionary<string, string>? form = null)
    {
        using var request = new HttpRequestMessage(method, path);
        if (token is not null)
        {
            request.Headers.Authorization = new AuthenticationHeaderValue("bearer", token);
        }

        if (form is not null)
        {
            request.Content = new FormUrlEncodedContent(form);
        }

        return await Client.SendAsync(request, TestContext.Current.CancellationToken);
    }

    protected static async Task<JsonElement> ReadJsonAsync(HttpResponseMessage response)
    {
        using var document = JsonDocument.Parse(await response.Content.ReadAsStringAsync(TestContext.Current.CancellationToken));
        return document.RootElement.Clone();
    }

    /// <summary>Logs <paramref name="account"/> in through the fake's login, as the app does, and returns its access token.</summary>
    protected async Task<string> LogInAsync(Account account, string clientId = "yH0aTnJEt6qUgGn835B4vg", string redirectUri = "redreader://rr_oauth_redir")
    {
        var accept = $"/api/v1/authorize/answer?client_id={clientId}&state=1&redirect_uri={Uri.EscapeDataString(redirectUri)}&user={account.Name}&authorize=Accept";
        using var redirected = await SendAsync(HttpMethod.Get, accept);
        var code = System.Web.HttpUtility.ParseQueryString(redirected.Headers.Location!.Query)["code"]!;
        using var request = new HttpRequestMessage(HttpMethod.Post, "/api/v1/access_token")
        {
            Content = new FormUrlEncodedContent(new Dictionary<string, string>
            {
                ["grant_type"] = "authorization_code",
                ["code"] = code,
                ["redirect_uri"] = redirectUri,
            }),
        };
        request.Headers.Authorization = new AuthenticationHeaderValue("Basic", Convert.ToBase64String(Encoding.UTF8.GetBytes(clientId + ":secret")));
        using var token = await Client.SendAsync(request, TestContext.Current.CancellationToken);
        Assert.Equal(HttpStatusCode.OK, token.StatusCode);
        return (await ReadJsonAsync(token)).GetProperty("access_token").GetString()!;
    }

    /// <summary>The titles of a Listing's posts, in order.</summary>
    protected static string[] Titles(JsonElement listing) =>
        [.. listing.GetProperty("data").GetProperty("children").EnumerateArray().Select(child => child.GetProperty("data").GetProperty("title").GetString()!)];
}
