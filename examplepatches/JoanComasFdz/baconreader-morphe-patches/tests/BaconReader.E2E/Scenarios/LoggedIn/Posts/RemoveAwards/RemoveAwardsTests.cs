// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Posts;

/// <summary>
/// "Remove awards": no award icons on posts and comments, in the card and list views and on the post's screen; no "Give
/// Award" or "View Award Details" in the menus of the cards, the action bars and the post's screen; no "Hide Reddit
/// Awards" in the "List View" and "Detail View" settings. The patch also names the action bars' buttons after their
/// actions, so a scenario finds their "More options".
/// </summary>
public sealed class RemoveAwardsTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Remove awards takes awards and their actions out of posts, comments and settings
          Given Reddit has a post "Golden post" in r/e2e with 3 Silver awards
          And the post "Golden post" has a comment "Golden comment" with 2 Silver awards
          And BaconReader is patched with every patch
          And BaconReader is open
          And the test account is logged in
          When I select the "e2e" feed
          # BaconReader starts in the card view.
          Then the post "Golden post" shows no award
          When I tap the menu button of the post "Golden post"
          # "Give Award" and "View Award Details" came after "Block User".
          Then the menu offers "Block User"
          And the menu doesn't offer "Give Award" or "View Award Details"
          When I tap Back
          And I tap "More options" in the toolbar
          And I tap "List View"
          Then the post "Golden post" shows no award
          When I swipe the post "Golden post" to its action bar
          And I tap "More options" in the post's action bar
          Then the menu offers "Block User"
          And the menu doesn't offer "Give Award" or "View Award Details"
          When I tap Back
          # The first Back closes the menu; the row shows its action bar until the second.
          And I tap Back
          And I tap the post "Golden post"
          Then the post shows no award
          And the comment "Golden comment" shows no award
          When I tap the menu button of the post's bar
          Then the menu offers "Block User"
          And the menu doesn't offer "Give Award" or "View Award Details"
          When I tap Back
          And I swipe the comment "Golden comment" to its action bar
          And I tap "More options" in the comment's action bar
          Then the menu offers "Block User"
          And the menu doesn't offer "Give Award" or "View Award Details"
          When I tap Back
          And I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "List View"
          # "Hide Reddit Awards" came between "Quick View" and "Adaptive Card Height".
          Then "List View" doesn't offer "Hide Reddit Awards"
          When I tap Back
          And I tap "Detail View"
          # "Hide Reddit Awards" came after "Play v.redd.it video with highest bitrate".
          Then "Detail View" doesn't offer "Hide Reddit Awards"
        """)]
    public async Task RemoveAwardsTakesAwardsAndTheirActionsOutOfPostsCommentsAndSettings(Screen screen)
    {
        // Given
        Reddit.HasAPostWithSilverAwards("Golden post", "e2e", 3);
        Reddit.ThePost("Golden post").HasACommentWithSilverAwards("Golden comment", 2);
        await Phone.BaconReader.OpenAsync();
        await Phone.BaconReader.LogInWithTheTestAccountAsync();

        // When
        await Phone.BaconReader.Main.Toolbar.SelectFeedAsync(new Feed.Subreddit("e2e"));
        await Phone.BaconReader.Main.Toolbar.WaitUntilFeedShownAsync(new Feed.Subreddit("e2e"));
        await Phone.BaconReader.Main.Posts.WaitUntilOnlyPostsShownAsync("Golden post");

        // Then
        // BaconReader starts in the card view.
        var card = await Phone.BaconReader.Main.Posts.ReadPostAsync("Golden post");
        Asserting.That(card).ShowsNoAward();

        // When
        await Phone.BaconReader.Main.Posts.ClickMenuButtonAsync("Golden post");
        await Phone.BaconReader.PostMenu.WaitUntilShownAsync();

        // Then
        // "Give Award" and "View Award Details" came after "Block User".
        var cardMenu = await Phone.BaconReader.PostMenu.ReadAsync();
        Asserting.That(cardMenu)
            .Offers(new PostMenuEntry.BlockUser())
            .DoesntOffer(new PostMenuEntry.GiveAward(), new PostMenuEntry.ViewAwardDetails());

        // When
        await Phone.GoBackAsync();
        await Phone.BaconReader.Main.Toolbar.ClickMoreOptionsAsync();
        await Phone.BaconReader.Main.Toolbar.MoreOptions.WaitUntilShownAsync();
        await Phone.BaconReader.Main.Toolbar.MoreOptions.ClickAsync(new OverflowMenuEntry.ListView());
        await Phone.BaconReader.Main.Posts.WaitUntilShownAsRowsAsync();

        // Then
        var row = await Phone.BaconReader.Main.Posts.ReadPostAsync("Golden post");
        Asserting.That(row).ShowsNoAward();

        // When
        await Phone.BaconReader.Main.Posts.SwipeToActionBarAsync("Golden post");
        await Phone.BaconReader.Main.Posts.WaitUntilActionBarShownAsync();
        await Phone.BaconReader.Main.Posts.ClickActionBarMoreOptionsAsync();
        await Phone.BaconReader.PostMenu.WaitUntilShownAsync();

        // Then
        var rowMenu = await Phone.BaconReader.PostMenu.ReadAsync();
        Asserting.That(rowMenu)
            .Offers(new PostMenuEntry.BlockUser())
            .DoesntOffer(new PostMenuEntry.GiveAward(), new PostMenuEntry.ViewAwardDetails());

        // When
        await Phone.GoBackAsync();
        await Phone.GoBackAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Golden post");
        await Phone.BaconReader.Detail.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("Golden comment");

        // Then
        var post = await Phone.BaconReader.Detail.ReadPostAsync();
        var comment = await Phone.BaconReader.Detail.Comments.ReadAsync("Golden comment");
        Asserting.That(post).ShowsNoAward();
        Asserting.That(comment).ShowsNoAward();

        // When
        await Phone.BaconReader.Detail.ClickMenuButtonAsync();
        await Phone.BaconReader.PostMenu.WaitUntilShownAsync();

        // Then
        var postMenu = await Phone.BaconReader.PostMenu.ReadAsync();
        Asserting.That(postMenu)
            .Offers(new PostMenuEntry.BlockUser())
            .DoesntOffer(new PostMenuEntry.GiveAward(), new PostMenuEntry.ViewAwardDetails());

        // When
        await Phone.GoBackAsync();
        await Phone.BaconReader.Detail.Comments.SwipeToActionBarAsync("Golden comment");
        await Phone.BaconReader.Detail.Comments.WaitUntilActionBarShownAsync();
        await Phone.BaconReader.Detail.Comments.ClickActionBarMoreOptionsAsync();
        await Phone.BaconReader.PostMenu.WaitUntilShownAsync();

        // Then
        var commentMenu = await Phone.BaconReader.PostMenu.ReadAsync();
        Asserting.That(commentMenu)
            .Offers(new PostMenuEntry.BlockUser())
            .DoesntOffer(new PostMenuEntry.GiveAward(), new PostMenuEntry.ViewAwardDetails());

        // When
        await Phone.GoBackAsync();
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.ListView());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.ListView());
        await Phone.BaconReader.Settings.WaitUntilSectionShownAsync(new SettingsSection.ListView());

        // Then
        // "Hide Reddit Awards" came between "Quick View" and "Adaptive Card Height".
        var listView = await Phone.BaconReader.Settings.ReadSectionAsync();
        Asserting.That(listView).DoesntOffer(new BaconReaderSetting.HideRedditAwards());

        // When
        await Phone.GoBackAsync();
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.DetailView());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.DetailView());
        await Phone.BaconReader.Settings.WaitUntilSectionShownAsync(new SettingsSection.DetailView());

        // Then
        // "Hide Reddit Awards" came after "Play v.redd.it video with highest bitrate".
        var detailView = await Phone.BaconReader.Settings.ReadSectionAsync();
        Asserting.That(detailView).DoesntOffer(new BaconReaderSetting.HideRedditAwards());
    }
}
