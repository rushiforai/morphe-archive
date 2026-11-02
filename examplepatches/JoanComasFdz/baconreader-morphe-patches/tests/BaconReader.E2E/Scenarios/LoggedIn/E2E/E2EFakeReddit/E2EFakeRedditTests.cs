// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.E2E;

/// <summary>
/// "E2E fake Reddit" (test only), which BaseE2E patches every scenario's app with: BaconReader talks to the fake Reddit,
/// and, once logged in (Reddit refuses a logged-out app), shows what a scenario's Given made there.
/// </summary>
public sealed class E2EFakeRedditTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: BaconReader logged in shows the posts Reddit has in All
          Given Reddit has a post "First fake post" in r/e2e
          And Reddit has a post "Second fake post" in r/e2e
          And BaconReader is patched with every patch
          And BaconReader is open
          And the test account is logged in
          When I select "All" in the toolbar's feed list
          Then the toolbar shows the "All" feed
          And the feed shows the posts "First fake post" and "Second fake post"
        """)]
    public async Task BaconReaderLoggedInShowsThePostsRedditHasInAll(Screen screen)
    {
        // Given
        Reddit.HasAPost("First fake post", "e2e");
        Reddit.HasAPost("Second fake post", "e2e");
        await Phone.BaconReader.OpenAsync();
        await Phone.BaconReader.LogInWithTheTestAccountAsync();

        // When
        await Phone.BaconReader.Main.Toolbar.SelectFeedAsync(new Feed.All());
        await Phone.BaconReader.Main.Posts.WaitUntilPostsShownAsync();

        // Then
        var toolbar = await Phone.BaconReader.Main.Toolbar.ReadAsync();
        var posts = await Phone.BaconReader.Main.Posts.ReadAsync();
        Asserting.That(toolbar).ShowsFeed(new Feed.All());
        Asserting.That(posts).ShowsThePosts("First fake post", "Second fake post");
    }
}
