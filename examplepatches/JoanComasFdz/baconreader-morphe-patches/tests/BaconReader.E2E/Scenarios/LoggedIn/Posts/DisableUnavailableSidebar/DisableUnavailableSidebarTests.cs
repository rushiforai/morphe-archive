// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Posts;

/// <summary>
/// "Disable unavailable sidebar": "View Sidebar" in the post list's "More options" is greyed out on feeds without a
/// sidebar (Front Page, All, Popular, Friends, multireddits), and stays enabled on a subreddit. Random, until its posts
/// load, too; "Remove Random feeds" takes it out of the feed list, so no scenario reaches it.
/// </summary>
public sealed class DisableUnavailableSidebarTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Disable unavailable sidebar greys out View Sidebar on feeds without a sidebar
          Given Reddit has a post "Hello from r/e2e" in r/e2e
          And BaconReader is patched with every patch
          And BaconReader is open
          And the test account is logged in
          When I tap "More options" in the toolbar
          # The toolbar shows the "Front Page" feed.
          Then "View Sidebar" is greyed out
          When I tap Back
          And I select the "All" feed
          And I tap "More options" in the toolbar
          Then "View Sidebar" is greyed out
          When I tap Back
          And I select the "Popular" feed
          And I tap "More options" in the toolbar
          Then "View Sidebar" is greyed out
          When I tap Back
          And I select the "Friends" feed
          And I tap "More options" in the toolbar
          Then "View Sidebar" is greyed out
          When I tap Back
          And I select the "e2e" feed
          And I tap "More options" in the toolbar
          Then "View Sidebar" is enabled
        """)]
    public async Task DisableUnavailableSidebarGreysOutViewSidebarOnFeedsWithoutASidebar(Screen screen)
    {
        // Given
        Reddit.HasAPost("Hello from r/e2e", "e2e");
        await Phone.BaconReader.OpenAsync();
        await Phone.BaconReader.LogInWithTheTestAccountAsync();

        // When
        await Phone.BaconReader.Main.Toolbar.ClickMoreOptionsAsync();
        await Phone.BaconReader.Main.Toolbar.MoreOptions.WaitUntilShownAsync();

        // Then
        // The toolbar shows the "Front Page" feed.
        var frontPage = await Phone.BaconReader.Main.Toolbar.MoreOptions.ReadAsync();
        Asserting.That(frontPage).IsGreyedOut(new OverflowMenuEntry.ViewSidebar());

        // When
        await Phone.GoBackAsync();
        await Phone.BaconReader.Main.Toolbar.SelectFeedAsync(new Feed.All());
        await Phone.BaconReader.Main.Toolbar.WaitUntilFeedShownAsync(new Feed.All());
        await Phone.BaconReader.Main.Toolbar.ClickMoreOptionsAsync();
        await Phone.BaconReader.Main.Toolbar.MoreOptions.WaitUntilShownAsync();

        // Then
        var all = await Phone.BaconReader.Main.Toolbar.MoreOptions.ReadAsync();
        Asserting.That(all).IsGreyedOut(new OverflowMenuEntry.ViewSidebar());

        // When
        await Phone.GoBackAsync();
        await Phone.BaconReader.Main.Toolbar.SelectFeedAsync(new Feed.Popular());
        await Phone.BaconReader.Main.Toolbar.WaitUntilFeedShownAsync(new Feed.Popular());
        await Phone.BaconReader.Main.Toolbar.ClickMoreOptionsAsync();
        await Phone.BaconReader.Main.Toolbar.MoreOptions.WaitUntilShownAsync();

        // Then
        var popular = await Phone.BaconReader.Main.Toolbar.MoreOptions.ReadAsync();
        Asserting.That(popular).IsGreyedOut(new OverflowMenuEntry.ViewSidebar());

        // When
        await Phone.GoBackAsync();
        await Phone.BaconReader.Main.Toolbar.SelectFeedAsync(new Feed.Friends());
        await Phone.BaconReader.Main.Toolbar.WaitUntilFeedShownAsync(new Feed.Friends());
        await Phone.BaconReader.Main.Toolbar.ClickMoreOptionsAsync();
        await Phone.BaconReader.Main.Toolbar.MoreOptions.WaitUntilShownAsync();

        // Then
        var friends = await Phone.BaconReader.Main.Toolbar.MoreOptions.ReadAsync();
        Asserting.That(friends).IsGreyedOut(new OverflowMenuEntry.ViewSidebar());

        // When
        await Phone.GoBackAsync();
        await Phone.BaconReader.Main.Toolbar.SelectFeedAsync(new Feed.Subreddit("e2e"));
        await Phone.BaconReader.Main.Toolbar.WaitUntilFeedShownAsync(new Feed.Subreddit("e2e"));
        await Phone.BaconReader.Main.Toolbar.ClickMoreOptionsAsync();
        await Phone.BaconReader.Main.Toolbar.MoreOptions.WaitUntilShownAsync();

        // Then
        var subreddit = await Phone.BaconReader.Main.Toolbar.MoreOptions.ReadAsync();
        Asserting.That(subreddit).IsEnabled(new OverflowMenuEntry.ViewSidebar());
    }
}
