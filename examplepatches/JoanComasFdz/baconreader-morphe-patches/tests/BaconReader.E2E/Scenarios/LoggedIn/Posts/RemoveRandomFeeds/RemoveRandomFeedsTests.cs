// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Posts;

/// <summary>
/// "Remove Random feeds": Random and My Random are gone from the feed list. Reddit removed r/random and r/myrandom in
/// December 2024, so they never load.
/// </summary>
public sealed class RemoveRandomFeedsTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Remove Random feeds leaves Random and My Random out of the feed list
          Given Reddit has a post "Hello from r/e2e" in r/e2e
          And BaconReader is patched with every patch
          And BaconReader is open
          And the test account is logged in
          When I tap the feed's name in the toolbar
          Then the feed list shows "Front Page", "All", "Popular", "Friends" and "e2e", in this order
          And the feed list shows neither "Random" nor "My Random"
        """)]
    public async Task RemoveRandomFeedsLeavesRandomAndMyRandomOutOfTheFeedList(Screen screen)
    {
        // Given
        Reddit.HasAPost("Hello from r/e2e", "e2e");
        await Phone.BaconReader.OpenAsync();
        await Phone.BaconReader.LogInWithTheTestAccountAsync();

        // When
        await Phone.BaconReader.Main.Toolbar.ClickFeedNameAsync();
        await Phone.BaconReader.Main.Toolbar.FeedList.WaitUntilShownAsync();

        // Then
        var feeds = await Phone.BaconReader.Main.Toolbar.FeedList.ReadAsync();
        Asserting.That(feeds)
            .ShowsTheFeedsInThisOrder(new Feed.FrontPage(), new Feed.All(), new Feed.Popular(), new Feed.Friends(), new Feed.Subreddit("e2e"))
            .ShowsNoneOf(new Feed.Random(), new Feed.MyRandom());
    }
}
