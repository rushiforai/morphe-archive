// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Net;
using System.Net.Http.Headers;
using System.Text;
using BaconReader.FakeReddit.Tests.Support;

namespace BaconReader.FakeReddit.Tests;

/// <summary>The fake's login, step by step as BaconReader's web view goes through it, and what it records.</summary>
public sealed class LoginTests(FakeRedditFixture fixture) : FakeRedditTest(fixture)
{
    private const string RedReader = "yH0aTnJEt6qUgGn835B4vg";
    private const string RedReaderRedirect = "redreader://rr_oauth_redir";

    private static string Authorize(string clientId = RedReader) =>
        $"/api/v1/authorize.compact?client_id={clientId}&response_type=code&state=42&redirect_uri={RedReaderRedirect}&duration=permanent&scope=identity,read,vote";

    [Fact]
    public async Task The_login_page_has_Reddits_title_field_ids_and_button()
    {
        var page = await GetPageAsync(Authorize());

        Assert.Contains("<h1>Log In</h1>", page);
        Assert.Contains("id=\"login-username\"", page);
        Assert.Contains("id=\"login-password\"", page);
        Assert.Contains("<button type=\"submit\">Log In</button>", page);
        Assert.DoesNotContain("Let us know your cookie preferences", page);
    }

    [Fact]
    public async Task The_login_page_shows_the_cookie_banner_when_the_world_asks_for_it()
    {
        World.LoginPage.ShowCookieBanner = true;

        var page = await GetPageAsync(Authorize());

        Assert.Contains("Let us know your cookie preferences", page);
        Assert.Contains("Reject Optional Cookies", page);
    }

    [Fact]
    public async Task A_wrong_password_shows_the_login_page_again_with_Reddits_error()
    {
        World.AddAccount("e2e_user", "right");

        var page = await PostLogInAsync("e2e_user", "wrong");

        Assert.Contains("Incorrect username or password", page);
        Assert.Contains("id=\"login-username\"", page);
    }

    [Fact]
    public async Task The_right_password_asks_to_connect_the_app_its_client_id_names_and_lists_the_permissions()
    {
        World.AddAccount("e2e_user", "right");

        var page = await PostLogInAsync("e2e_user", "right");

        Assert.Contains("<p>Hey, e2e_user! RedReader (Release) would like to connect with your reddit account</p>", page);
        Assert.Contains("Access my reddit username and signup date.", page);
        Assert.Contains("Accept</button>", page);
    }

    [Fact]
    public async Task Accept_redirects_to_the_redirect_uri_with_the_state_and_a_code_the_token_endpoint_trades()
    {
        World.AddAccount("e2e_user", "right");

        using var accepted = await SendAsync(
            HttpMethod.Get,
            $"/api/v1/authorize/answer?client_id={RedReader}&state=42&redirect_uri={Uri.EscapeDataString(RedReaderRedirect)}&user=e2e_user&authorize=Accept");

        Assert.Equal(HttpStatusCode.Redirect, accepted.StatusCode);
        var location = accepted.Headers.Location!.OriginalString;
        Assert.StartsWith(RedReaderRedirect + "?state=42&code=", location);
        var token = await TradeAsync(new Dictionary<string, string>
        {
            ["grant_type"] = "authorization_code",
            ["code"] = location[(location.IndexOf("code=", StringComparison.Ordinal) + 5)..],
            ["redirect_uri"] = RedReaderRedirect,
        });
        Assert.Equal(HttpStatusCode.OK, token.Status);
        Assert.Contains("\"token_type\":\"bearer\"", token.Body);
        Assert.Contains("\"expires_in\":86400", token.Body);
        Assert.Contains("\"refresh_token\":", token.Body);
    }

    [Fact]
    public async Task Decline_redirects_with_access_denied()
    {
        World.AddAccount("e2e_user", "right");

        using var declined = await SendAsync(
            HttpMethod.Get,
            $"/api/v1/authorize/answer?client_id={RedReader}&state=42&redirect_uri={Uri.EscapeDataString(RedReaderRedirect)}&user=e2e_user&authorize=Decline");

        Assert.Equal(RedReaderRedirect + "?state=42&error=access_denied", declined.Headers.Location!.OriginalString);
    }

    [Fact]
    public async Task The_token_is_the_accounts_me_and_a_refresh_token_gets_a_new_one()
    {
        var account = World.AddAccount("e2e_user", "right");
        var token = await LogInAsync(account);

        var me = await GetJsonAsync("/api/v1/me", token);
        using var loggedOut = await SendAsync(HttpMethod.Get, "/api/v1/me");
        using var unknown = await SendAsync(HttpMethod.Get, "/api/v1/me", "not-a-token");

        Assert.Equal("e2e_user", me.GetProperty("name").GetString());
        Assert.NotEqual(DateTimeOffset.UtcNow.ToString("MM-dd"), DateTimeOffset.FromUnixTimeSeconds((long)me.GetProperty("created_utc").GetDouble()).ToString("MM-dd"));
        Assert.Equal(HttpStatusCode.Forbidden, loggedOut.StatusCode);
        Assert.Equal(HttpStatusCode.Unauthorized, unknown.StatusCode);
    }

    [Fact]
    public async Task The_login_records_the_client_id_redirect_uri_and_user_agent_it_saw()
    {
        var account = World.AddAccount("e2e_user", "right");
        Client.DefaultRequestHeaders.UserAgent.Clear();
        Client.DefaultRequestHeaders.UserAgent.ParseAdd("org.quantumbadger.redreader/1.25.1");

        await GetPageAsync(Authorize());
        await LogInAsync(account);

        var authorize = World.Logins.First(login => login.Step == "authorize");
        Assert.Equal(RedReader, authorize.ClientId);
        Assert.Equal(RedReaderRedirect, authorize.RedirectUri);
        Assert.Equal("org.quantumbadger.redreader/1.25.1", authorize.UserAgent);
        var token = World.Logins.First(login => login.Step == "token");
        Assert.Equal(RedReader, token.ClientId);
        Assert.Equal(RedReaderRedirect, token.RedirectUri);
    }

    [Fact]
    public async Task A_code_trades_once()
    {
        var account = World.AddAccount("e2e_user", "right");
        var code = await AcceptAsync(account.Name);
        var form = new Dictionary<string, string> { ["grant_type"] = "authorization_code", ["code"] = code, ["redirect_uri"] = RedReaderRedirect };

        var first = await TradeAsync(form);
        var second = await TradeAsync(form);

        Assert.Equal(HttpStatusCode.OK, first.Status);
        Assert.Equal(HttpStatusCode.BadRequest, second.Status);
    }

    private async Task<string> GetPageAsync(string path)
    {
        using var response = await SendAsync(HttpMethod.Get, path);
        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
        Assert.Equal("text/html", response.Content.Headers.ContentType!.MediaType);
        return await response.Content.ReadAsStringAsync(TestContext.Current.CancellationToken);
    }

    private async Task<string> PostLogInAsync(string user, string password)
    {
        using var response = await SendAsync(HttpMethod.Post, "/api/v1/authorize.compact", form: new Dictionary<string, string>
        {
            ["client_id"] = RedReader,
            ["state"] = "42",
            ["redirect_uri"] = RedReaderRedirect,
            ["scope"] = "identity,read",
            ["username"] = user,
            ["password"] = password,
        });
        return await response.Content.ReadAsStringAsync(TestContext.Current.CancellationToken);
    }

    private async Task<string> AcceptAsync(string user)
    {
        using var accepted = await SendAsync(
            HttpMethod.Get,
            $"/api/v1/authorize/answer?client_id={RedReader}&state=1&redirect_uri={Uri.EscapeDataString(RedReaderRedirect)}&user={user}&authorize=Accept");
        var location = accepted.Headers.Location!.OriginalString;
        return location[(location.IndexOf("code=", StringComparison.Ordinal) + 5)..];
    }

    private async Task<(HttpStatusCode Status, string Body)> TradeAsync(Dictionary<string, string> form)
    {
        using var request = new HttpRequestMessage(HttpMethod.Post, "/api/v1/access_token") { Content = new FormUrlEncodedContent(form) };
        request.Headers.Authorization = new AuthenticationHeaderValue("Basic", Convert.ToBase64String(Encoding.UTF8.GetBytes(RedReader + ":kDm2tYpu9DqyWFFyPlNcXGEni4k")));
        using var response = await Client.SendAsync(request, TestContext.Current.CancellationToken);
        return (response.StatusCode, await response.Content.ReadAsStringAsync(TestContext.Current.CancellationToken));
    }
}
