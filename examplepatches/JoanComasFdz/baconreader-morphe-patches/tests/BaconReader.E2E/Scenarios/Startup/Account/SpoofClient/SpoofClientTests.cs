// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Reddit;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.Startup.Account;

/// <summary>"Spoof client": BaconReader talks to Reddit as another app (RedReader by default), so logging in works again.</summary>
public sealed class SpoofClientTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWith(Patch.SpoofClient)]
    [TestDescription("""
        @phone
        Scenario: BaconReader patched with Spoof client logs in to Reddit as RedReader
          Given Reddit has a post "Hello from r/e2e" in r/e2e
          And the test account is subscribed to r/e2e
          And BaconReader is patched with "Spoof client"
          And BaconReader is installed
          When I open BaconReader
          And I tap "GOT IT :(" on "FINAL RELEASE ANNOUNCEMENT!"
          # Logged out, Reddit refuses BaconReader: the feed shows "Greetings!", BaconReader's "no longer operational" message.
          Then the feed shows no posts
          When I open the left menu
          And I tap "Add account"
          And I type the test account's user name in "Email or username"
          And I type the test account's password in "Password"
          And I tap "Log In"
          Then Reddit asks to connect "RedReader (Release)" with the test account
          When I tap "Accept"
          # BaconReader comes back from the login with the left menu open.
          Then the left menu shows the test account's user name
          # Not on the screen: the fake Reddit records what BaconReader sent.
          And Reddit saw RedReader's client ID, redirect URI and User-Agent
          When I close the left menu
          Then the toolbar shows the "Front Page" feed
          And the feed shows the post "Hello from r/e2e"
          # Not on the screen: the fake Reddit records what BaconReader sent.
          And Reddit got the request for the posts with RedReader's User-Agent
        """)]
    public async Task BaconReaderPatchedWithSpoofClientLogsInToRedditAsRedReader(Screen screen)
    {
        // Given
        Reddit.HasAPost("Hello from r/e2e", "e2e");
        Reddit.TheTestAccountIsSubscribedTo("e2e");

        // When
        await Phone.Launcher.OpenBaconReaderAsync();
        await Phone.BaconReader.FinalReleaseAnnouncement.WaitUntilShownAsync();
        await Phone.BaconReader.FinalReleaseAnnouncement.ClickGotItAsync();
        await Phone.BaconReader.Main.WaitUntilShownAsync();
        await Phone.BaconReader.Main.Posts.WaitUntilMessageShownAsync();

        // Then
        // Logged out, Reddit refuses BaconReader: the feed shows BaconReader's "no longer operational" message.
        var loggedOut = await Phone.BaconReader.Main.Posts.ReadAsync();
        Asserting.That(loggedOut).ShowsNoPosts();

        // When
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.AddAccount());
        await Phone.BaconReader.LogIn.WaitUntilShownAsync();
        await Phone.BaconReader.LogIn.TypeTheTestAccountsUserNameAsync();
        await Phone.BaconReader.LogIn.TypeTheTestAccountsPasswordAsync();
        await Phone.BaconReader.LogIn.ClickLogInAsync();
        await Phone.BaconReader.LogIn.WaitUntilConnectShownAsync();

        // Then
        var connect = await Phone.BaconReader.LogIn.ReadConnectAsync();
        Asserting.That(connect).AsksToConnect("RedReader (Release)").WithTheTestAccount();

        // When
        await Phone.BaconReader.LogIn.ClickAcceptAsync();
        await Phone.BaconReader.Main.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();

        // Then
        var menu = await Phone.BaconReader.Main.LeftMenu.ReadAsync();
        var login = Reddit.ReadLogin();
        Asserting.That(menu).ShowsTheTestAccountsUserName();
        Asserting.That(login).SawRedReadersClientIdRedirectUriAndUserAgent();

        // When
        await Phone.BaconReader.Main.LeftMenu.CloseAsync();
        await Phone.BaconReader.Main.Posts.WaitUntilPostsShownAsync();

        // Then
        var toolbar = await Phone.BaconReader.Main.Toolbar.ReadAsync();
        var posts = await Phone.BaconReader.Main.Posts.ReadAsync();
        // Not on the screen: the fake Reddit records what BaconReader sent.
        var requestsForPosts = Reddit.ReadRequestsForPosts();
        Asserting.That(toolbar).ShowsFeed(new Feed.FrontPage());
        Asserting.That(posts).ShowsThePosts("Hello from r/e2e");
        Asserting.That(requestsForPosts).CarriedRedReadersUserAgent();
    }
}
