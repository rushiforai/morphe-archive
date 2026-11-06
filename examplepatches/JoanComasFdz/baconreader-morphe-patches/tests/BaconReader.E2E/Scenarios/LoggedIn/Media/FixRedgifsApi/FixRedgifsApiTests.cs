// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Reddit;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Media;

/// <summary>
/// "Fix Redgifs API": BaconReader asks RedGIFs for a video with a temporary token, which the patch asks RedGIFs for in
/// place of the OAuth token RedGIFs no longer gives, sent with the User-Agent it was given to. RedGIFs ties a token to
/// the phone's address: once the phone joins another network, it refuses the token, and the patch asks for a new one.
/// </summary>
public sealed class FixRedgifsApiTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Fix Redgifs API plays RedGIFs videos with a temporary token, and with a new one once the phone joins another network
          Given Reddit has a RedGIFs post "First clip" in r/e2e
          And Reddit has a RedGIFs post "Second clip" in r/e2e
          And BaconReader is patched with every patch
          And BaconReader is open
          And the test account is logged in
          When I tap the post "First clip"
          And I tap the thumbnail in the post's header
          Then the video plays
          # Not on the screen: the fake RedGIFs records what BaconReader asked for.
          And RedGIFs answered the video of "First clip" to BaconReader's temporary token and User-Agent
          When I go back
          And I go back to the posts
          # Not on the phone: the fake RedGIFs refuses the tokens it gave, "401 WrongSender", as RedGIFs does once the phone's address changes.
          And the phone joins another network
          And I tap the post "Second clip"
          And I tap the thumbnail in the post's header
          Then the video plays
          # Not on the screen: the fake RedGIFs records what BaconReader asked for.
          And BaconReader asked RedGIFs for a new temporary token
        """)]
    public async Task FixRedgifsApiPlaysRedGIFsVideosWithATemporaryTokenAndWithANewOneOnceThePhoneJoinsAnotherNetwork(Screen screen)
    {
        // Given
        Reddit.HasARedGifsPost("First clip", "e2e");
        Reddit.HasARedGifsPost("Second clip", "e2e");
        await Phone.BaconReader.OpenAsync();
        await Phone.BaconReader.LogInWithTheTestAccountAsync();

        // When
        await Phone.BaconReader.Main.Posts.ClickPostAsync("First clip");
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("First clip");
        await Phone.BaconReader.Detail.ClickHeaderThumbnailAsync();
        await Phone.BaconReader.MediaViewer.WaitUntilVideoPlaysAsync();

        // Then
        var first = await Phone.BaconReader.MediaViewer.ReadAsync();
        // Not on the screen: the fake RedGIFs records what BaconReader asked for.
        var firstLookups = Reddit.ReadRedGifsLookupsOfTheVideoOf("First clip");
        Asserting.That(first).PlaysTheVideo();
        Asserting.That(firstLookups).AnsweredToBaconReadersTemporaryTokenAndUserAgent();

        // When
        await Phone.BaconReader.MediaViewer.ClickBackAsync();
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("First clip");
        await Phone.BaconReader.GoBackToThePostsAsync();
        // Not on the phone: the fake RedGIFs refuses the tokens it gave, "401 WrongSender", as RedGIFs does once the phone's address changes.
        Reddit.ThePhoneJoinsAnotherNetwork();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Second clip");
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Second clip");
        await Phone.BaconReader.Detail.ClickHeaderThumbnailAsync();
        await Phone.BaconReader.MediaViewer.WaitUntilVideoPlaysAsync();

        // Then
        var second = await Phone.BaconReader.MediaViewer.ReadAsync();
        // Not on the screen: the fake RedGIFs records what BaconReader asked for.
        var tokens = Reddit.ReadRedGifsTemporaryTokens();
        Asserting.That(second).PlaysTheVideo();
        Asserting.That(tokens).AskedForANewTemporaryToken();
    }
}
