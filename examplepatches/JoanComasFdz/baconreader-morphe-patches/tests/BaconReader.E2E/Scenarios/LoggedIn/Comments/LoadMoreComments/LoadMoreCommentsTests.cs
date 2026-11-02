// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Reddit;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Comments;

/// <summary>
/// "Load more comments": BaconReader asks Reddit for up to 500 comments when a post opens ("Comments to load", 200 to
/// 500), instead of Reddit's default of about 200, and loads the "load more comments" with
/// few replies right after the post's comments ("Auto-load "load more comments"").
/// </summary>
public sealed class LoadMoreCommentsTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Load more comments asks Reddit for up to 500 comments and loads the small "load more comments"
          Given Reddit has a post "Long thread" in r/e2e
          And the post "Long thread" has 500 comments, "Comment 1" to "Comment 500"
          And the comment "Comment 1" has the replies "Reply 1 to Comment 1" and "Reply 2 to Comment 1"
          And the comment "Comment 2" has the replies "Reply 1 to Comment 2", "Reply 2 to Comment 2" and "Reply 3 to Comment 2"
          And BaconReader is patched with every patch
          And BaconReader is open
          And the test account is logged in
          When I tap the post "Long thread"
          # Not on the screen: the fake Reddit records what BaconReader sent.
          Then Reddit got the request for the comments of "Long thread" with the limit 500
          # "Up to 2 replies", the default: the 2 replies of "Comment 1" load right after the post's comments.
          And the comment "Comment 1" shows the replies "Reply 1 to Comment 1" and "Reply 2 to Comment 1"
          And the comment "Comment 2" shows "load more comments (3 replies)"
          When I scroll to the end of the comments
          Then the comments end with "Comment 500"
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I scroll to "Auto-load "load more comments""
          Then the settings show "Comments to load" and "Auto-load "load more comments"", in this order
          When I tap "Comments to load"
          And I type "300" in "Comments to load"
          And I tap "OK"
          And I go back to the posts
          And I tap the post "Long thread"
          Then Reddit got the request for the comments of "Long thread" with the limit 300
          # Below Reddit's default: 200.
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I tap "Comments to load"
          And I type "100" in "Comments to load"
          And I tap "OK"
          And I go back to the posts
          And I tap the post "Long thread"
          Then Reddit got the request for the comments of "Long thread" with the limit 200
          # Above Reddit's maximum: 500.
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I tap "Comments to load"
          And I type "1000" in "Comments to load"
          And I tap "OK"
          And I go back to the posts
          And I tap the post "Long thread"
          Then Reddit got the request for the comments of "Long thread" with the limit 500
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I tap "Auto-load "load more comments""
          And I select "Off"
          And I go back to the posts
          And I tap the post "Long thread"
          Then the comment "Comment 1" shows "load more comments (2 replies)"
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I tap "Auto-load "load more comments""
          And I select "Up to 3 replies"
          And I go back to the posts
          And I tap the post "Long thread"
          Then the comment "Comment 1" shows the replies "Reply 1 to Comment 1" and "Reply 2 to Comment 1"
          And the comment "Comment 2" shows the replies "Reply 1 to Comment 2", "Reply 2 to Comment 2" and "Reply 3 to Comment 2"
        """)]
    public async Task LoadMoreCommentsAsksRedditForUpTo500CommentsAndLoadsTheSmallLoadMoreComments(Screen screen)
    {
        // Given
        Reddit.HasAPost("Long thread", "e2e");
        Reddit.ThePost("Long thread").HasComments(500);
        Reddit.ThePost("Long thread").TheComment("Comment 1").HasTheReplies("Reply 1 to Comment 1", "Reply 2 to Comment 1");
        Reddit.ThePost("Long thread").TheComment("Comment 2").HasTheReplies("Reply 1 to Comment 2", "Reply 2 to Comment 2", "Reply 3 to Comment 2");
        await Phone.BaconReader.OpenAsync();
        await Phone.BaconReader.LogInWithTheTestAccountAsync();

        // When
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Long thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("Reply 2 to Comment 1");
        await Phone.BaconReader.Detail.Comments.WaitUntilLoadMoreShownAsync("load more comments (3 replies)");

        // Then
        // Not on the screen: the fake Reddit records what BaconReader sent.
        var first = Reddit.ReadRequestsForTheCommentsOf("Long thread");
        // "Up to 2 replies", the default: the 2 replies of "Comment 1" load right after the post's comments.
        var shown = await Phone.BaconReader.Detail.Comments.ReadShownAsync();
        Asserting.That(first).LastAskedForTheLimit(500);
        Asserting.That(shown)
            .ShowsTheReplies("Comment 1", "Reply 1 to Comment 1", "Reply 2 to Comment 1")
            .ShowsLoadMore("Comment 2", "load more comments (3 replies)");

        // When
        await Phone.BaconReader.Detail.Comments.ScrollToTheEndAsync();

        // Then
        var end = await Phone.BaconReader.Detail.Comments.ReadShownAsync();
        Asserting.That(end).EndsWithTheComment("Comment 500");

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.AutoLoadLoadMoreComments());

        // Then
        var settings = await Phone.BaconReader.PatchesSettings.ReadAsync();
        Asserting.That(settings).ShowsTheSettings(new PatchSetting.CommentsToLoad(), new PatchSetting.AutoLoadLoadMoreComments());

        // When
        await Phone.BaconReader.PatchesSettings.ClickAsync(new PatchSetting.CommentsToLoad());
        await Phone.BaconReader.PatchesSettings.WaitUntilTextFieldShownAsync();
        await Phone.BaconReader.PatchesSettings.TypeAsync("300");
        await Phone.BaconReader.PatchesSettings.ClickOkAsync();
        await Phone.BaconReader.PatchesSettings.WaitUntilDialogClosedAsync(new PatchSetting.CommentsToLoad());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Long thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("Comment 1");

        // Then
        var three = Reddit.ReadRequestsForTheCommentsOf("Long thread");
        Asserting.That(three).LastAskedForTheLimit(300);

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ClickAsync(new PatchSetting.CommentsToLoad());
        await Phone.BaconReader.PatchesSettings.WaitUntilTextFieldShownAsync();
        await Phone.BaconReader.PatchesSettings.TypeAsync("100");
        await Phone.BaconReader.PatchesSettings.ClickOkAsync();
        await Phone.BaconReader.PatchesSettings.WaitUntilDialogClosedAsync(new PatchSetting.CommentsToLoad());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Long thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("Comment 1");

        // Then
        // Below Reddit's default: 200.
        var below = Reddit.ReadRequestsForTheCommentsOf("Long thread");
        Asserting.That(below).LastAskedForTheLimit(200);

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ClickAsync(new PatchSetting.CommentsToLoad());
        await Phone.BaconReader.PatchesSettings.WaitUntilTextFieldShownAsync();
        await Phone.BaconReader.PatchesSettings.TypeAsync("1000");
        await Phone.BaconReader.PatchesSettings.ClickOkAsync();
        await Phone.BaconReader.PatchesSettings.WaitUntilDialogClosedAsync(new PatchSetting.CommentsToLoad());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Long thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("Comment 1");

        // Then
        // Above Reddit's maximum: 500.
        var above = Reddit.ReadRequestsForTheCommentsOf("Long thread");
        Asserting.That(above).LastAskedForTheLimit(500);

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ClickAsync(new PatchSetting.AutoLoadLoadMoreComments());
        await Phone.BaconReader.PatchesSettings.WaitUntilChoiceShownAsync(new RepliesToAutoLoad.Off());
        await Phone.BaconReader.PatchesSettings.SelectAsync(new RepliesToAutoLoad.Off());
        await Phone.BaconReader.PatchesSettings.WaitUntilDialogClosedAsync(new PatchSetting.AutoLoadLoadMoreComments());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Long thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("Comment 1");
        await Phone.BaconReader.Detail.Comments.WaitUntilLoadMoreShownAsync("load more comments (2 replies)");

        // Then
        var off = await Phone.BaconReader.Detail.Comments.ReadShownAsync();
        Asserting.That(off).ShowsLoadMore("Comment 1", "load more comments (2 replies)");

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ClickAsync(new PatchSetting.AutoLoadLoadMoreComments());
        await Phone.BaconReader.PatchesSettings.WaitUntilChoiceShownAsync(new RepliesToAutoLoad.UpTo3Replies());
        await Phone.BaconReader.PatchesSettings.SelectAsync(new RepliesToAutoLoad.UpTo3Replies());
        await Phone.BaconReader.PatchesSettings.WaitUntilDialogClosedAsync(new PatchSetting.AutoLoadLoadMoreComments());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Long thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("Comment 1");
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("Reply 3 to Comment 2");

        // Then
        var upTo3 = await Phone.BaconReader.Detail.Comments.ReadShownAsync();
        Asserting.That(upTo3)
            .ShowsTheReplies("Comment 1", "Reply 1 to Comment 1", "Reply 2 to Comment 1")
            .ShowsTheReplies("Comment 2", "Reply 1 to Comment 2", "Reply 2 to Comment 2", "Reply 3 to Comment 2");
    }
}
