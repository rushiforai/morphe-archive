// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Posts;

/// <summary>
/// "Select text": "Select text" right after "Copy" in the menus of posts (the card's ⋮, the list row's action bar, the
/// post's screen) and of comments (their action bar). It shows the post's title and text, or the comment's text, in a
/// dialog where a long press selects a part, which Android's "Copy" copies. Show tables' tables show as text, and
/// spoilers show.
/// </summary>
public sealed class SelectTextTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Select text shows a post's or comment's text to select and copy a part of it
          Given Reddit has a post "Bread recipe" in r/e2e with the text "Mix the flour with water. Bake for 20 minutes."
          And the post "Bread recipe" has a comment "Rye flour, not wheat."
          And the post "Bread recipe" has a comment "Proportions" with the table:
            | Flour | Water  |
            | 500 g | 300 ml |
          And the post "Bread recipe" has a comment ">!the crust burns!<"
          And BaconReader is patched with every patch
          And BaconReader is open
          And the test account is logged in
          When I select the "e2e" feed
          And I tap the menu button of the post "Bread recipe"
          Then the menu offers "Select text" right after "Copy"
          When I tap "Select text"
          Then the dialog shows "Bread recipe", then "Mix the flour with water. Bake for 20 minutes."
          When I long press "Bread", the first word of the dialog's text
          # Android's own "Copy" floats over the selection, where UiAutomator can't tap it: the test copies with Ctrl+C.
          And I copy the selection
          # Not on the screen: Android's clipboard.
          Then the clipboard holds "Bread"
          When I tap "CLOSE"
          And I tap "More options" in the toolbar
          And I tap "List View"
          And I swipe the post "Bread recipe" to its action bar
          And I tap "More options" in the post's action bar
          Then the menu offers "Select text" right after "Copy"
          When I tap "Select text"
          Then the dialog shows "Bread recipe", then "Mix the flour with water. Bake for 20 minutes."
          When I tap "CLOSE"
          # The row shows its action bar until Back.
          And I tap Back
          And I tap the post "Bread recipe"
          And I tap the menu button of the post's bar
          Then the menu offers "Select text" right after "Copy"
          When I tap "Select text"
          Then the dialog shows "Bread recipe", then "Mix the flour with water. Bake for 20 minutes."
          When I tap "CLOSE"
          And I swipe the comment "Rye flour, not wheat." to its action bar
          And I tap "More options" in the comment's action bar
          Then the menu offers "Select text" right after "Copy"
          When I tap "Select text"
          Then the dialog shows "Rye flour, not wheat."
          When I long press "Rye", the first word of the dialog's text
          # Android's own "Copy" floats over the selection, where UiAutomator can't tap it: the test copies with Ctrl+C.
          And I copy the selection
          # Not on the screen: Android's clipboard.
          Then the clipboard holds "Rye"
          When I tap "CLOSE"
          # The comment shows its action bar until Back.
          And I tap Back
          And I swipe the comment "Proportions" to its action bar
          And I tap "More options" in the comment's action bar
          And I tap "Select text"
          # Show tables draws the table as a grid; here it is text, one line a row.
          Then the dialog shows "Proportions", then "Flour | Water\n500 g | 300 ml"
          When I tap "CLOSE"
          And I tap Back
          And I swipe the comment "the crust burns" to its action bar
          And I tap "More options" in the comment's action bar
          And I tap "Select text"
          # The spoiler shows as plain text, without its box or a tap.
          Then the dialog shows "the crust burns"
        """)]
    public async Task SelectTextShowsAPostsOrCommentsTextToSelectAndCopyAPartOfIt(Screen screen)
    {
        // Given
        Reddit.HasAPostWithTheText("Bread recipe", "e2e", "Mix the flour with water. Bake for 20 minutes.");
        Reddit.ThePost("Bread recipe").HasAComment("Rye flour, not wheat.");
        Reddit.ThePost("Bread recipe").HasACommentWithTheTable("Proportions",
        [
            ["Flour", "Water"],
            ["500 g", "300 ml"],
        ]);
        Reddit.ThePost("Bread recipe").HasAComment(">!the crust burns!<");
        await Phone.BaconReader.OpenAsync();
        await Phone.BaconReader.LogInWithTheTestAccountAsync();

        // When
        await Phone.BaconReader.Main.Toolbar.SelectFeedAsync(new Feed.Subreddit("e2e"));
        await Phone.BaconReader.Main.Toolbar.WaitUntilFeedShownAsync(new Feed.Subreddit("e2e"));
        await Phone.BaconReader.Main.Posts.WaitUntilOnlyPostsShownAsync("Bread recipe");
        await Phone.BaconReader.Main.Posts.ClickMenuButtonAsync("Bread recipe");
        await Phone.BaconReader.PostMenu.WaitUntilShownAsync();

        // Then
        var cardMenu = await Phone.BaconReader.PostMenu.ReadAsync();
        Asserting.That(cardMenu).OffersRightAfter(new PostMenuEntry.SelectText(), new PostMenuEntry.Copy());

        // When
        await Phone.BaconReader.PostMenu.ClickAsync(new PostMenuEntry.SelectText());
        await Phone.BaconReader.SelectText.WaitUntilShownAsync();

        // Then
        var cardText = await Phone.BaconReader.SelectText.ReadAsync();
        Asserting.That(cardText).ShowsTheText("Bread recipe", "Mix the flour with water. Bake for 20 minutes.");

        // When
        await Phone.BaconReader.SelectText.LongClickFirstWordAsync();
        // Android's own "Copy" floats over the selection, where UiAutomator can't tap it: the test copies with Ctrl+C.
        await Phone.BaconReader.SelectText.CopySelectionAsync();

        // Then
        // Not on the screen: Android's clipboard.
        var title = await Phone.Clipboard.ReadAsync();
        Asserting.That(title).Holds("Bread");

        // When
        await Phone.BaconReader.SelectText.ClickCloseAsync();
        await Phone.BaconReader.SelectText.WaitUntilClosedAsync();
        await Phone.BaconReader.Main.Toolbar.ClickMoreOptionsAsync();
        await Phone.BaconReader.Main.Toolbar.MoreOptions.WaitUntilShownAsync();
        await Phone.BaconReader.Main.Toolbar.MoreOptions.ClickAsync(new OverflowMenuEntry.ListView());
        await Phone.BaconReader.Main.Posts.WaitUntilShownAsRowsAsync();
        await Phone.BaconReader.Main.Posts.SwipeToActionBarAsync("Bread recipe");
        await Phone.BaconReader.Main.Posts.WaitUntilActionBarShownAsync();
        await Phone.BaconReader.Main.Posts.ClickActionBarMoreOptionsAsync();
        await Phone.BaconReader.PostMenu.WaitUntilShownAsync();

        // Then
        var rowMenu = await Phone.BaconReader.PostMenu.ReadAsync();
        Asserting.That(rowMenu).OffersRightAfter(new PostMenuEntry.SelectText(), new PostMenuEntry.Copy());

        // When
        await Phone.BaconReader.PostMenu.ClickAsync(new PostMenuEntry.SelectText());
        await Phone.BaconReader.SelectText.WaitUntilShownAsync();

        // Then
        var rowText = await Phone.BaconReader.SelectText.ReadAsync();
        Asserting.That(rowText).ShowsTheText("Bread recipe", "Mix the flour with water. Bake for 20 minutes.");

        // When
        await Phone.BaconReader.SelectText.ClickCloseAsync();
        await Phone.BaconReader.SelectText.WaitUntilClosedAsync();
        await Phone.GoBackAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Bread recipe");
        await Phone.BaconReader.Detail.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("Rye flour, not wheat.");
        await Phone.BaconReader.Detail.ClickMenuButtonAsync();
        await Phone.BaconReader.PostMenu.WaitUntilShownAsync();

        // Then
        var postMenu = await Phone.BaconReader.PostMenu.ReadAsync();
        Asserting.That(postMenu).OffersRightAfter(new PostMenuEntry.SelectText(), new PostMenuEntry.Copy());

        // When
        await Phone.BaconReader.PostMenu.ClickAsync(new PostMenuEntry.SelectText());
        await Phone.BaconReader.SelectText.WaitUntilShownAsync();

        // Then
        var postText = await Phone.BaconReader.SelectText.ReadAsync();
        Asserting.That(postText).ShowsTheText("Bread recipe", "Mix the flour with water. Bake for 20 minutes.");

        // When
        await Phone.BaconReader.SelectText.ClickCloseAsync();
        await Phone.BaconReader.SelectText.WaitUntilClosedAsync();
        await Phone.BaconReader.Detail.Comments.SwipeToActionBarAsync("Rye flour, not wheat.");
        await Phone.BaconReader.Detail.Comments.WaitUntilActionBarShownAsync();
        await Phone.BaconReader.Detail.Comments.ClickActionBarMoreOptionsAsync();
        await Phone.BaconReader.PostMenu.WaitUntilShownAsync();

        // Then
        var commentMenu = await Phone.BaconReader.PostMenu.ReadAsync();
        Asserting.That(commentMenu).OffersRightAfter(new PostMenuEntry.SelectText(), new PostMenuEntry.Copy());

        // When
        await Phone.BaconReader.PostMenu.ClickAsync(new PostMenuEntry.SelectText());
        await Phone.BaconReader.SelectText.WaitUntilShownAsync();

        // Then
        var commentText = await Phone.BaconReader.SelectText.ReadAsync();
        Asserting.That(commentText).ShowsTheText("Rye flour, not wheat.");

        // When
        await Phone.BaconReader.SelectText.LongClickFirstWordAsync();
        // Android's own "Copy" floats over the selection, where UiAutomator can't tap it: the test copies with Ctrl+C.
        await Phone.BaconReader.SelectText.CopySelectionAsync();

        // Then
        // Not on the screen: Android's clipboard.
        var word = await Phone.Clipboard.ReadAsync();
        Asserting.That(word).Holds("Rye");

        // When
        await Phone.BaconReader.SelectText.ClickCloseAsync();
        await Phone.BaconReader.SelectText.WaitUntilClosedAsync();
        await Phone.GoBackAsync();
        await Phone.BaconReader.Detail.Comments.SwipeToActionBarAsync("Proportions");
        await Phone.BaconReader.Detail.Comments.WaitUntilActionBarShownAsync();
        await Phone.BaconReader.Detail.Comments.ClickActionBarMoreOptionsAsync();
        await Phone.BaconReader.PostMenu.WaitUntilShownAsync();
        await Phone.BaconReader.PostMenu.ClickAsync(new PostMenuEntry.SelectText());
        await Phone.BaconReader.SelectText.WaitUntilShownAsync();

        // Then
        // Show tables draws the table as a grid; here it is text, one line a row.
        var table = await Phone.BaconReader.SelectText.ReadAsync();
        Asserting.That(table).ShowsTheText("Proportions", "Flour | Water\n500 g | 300 ml");

        // When
        await Phone.BaconReader.SelectText.ClickCloseAsync();
        await Phone.BaconReader.SelectText.WaitUntilClosedAsync();
        await Phone.GoBackAsync();
        await Phone.BaconReader.Detail.Comments.SwipeToActionBarAsync("the crust burns");
        await Phone.BaconReader.Detail.Comments.WaitUntilActionBarShownAsync();
        await Phone.BaconReader.Detail.Comments.ClickActionBarMoreOptionsAsync();
        await Phone.BaconReader.PostMenu.WaitUntilShownAsync();
        await Phone.BaconReader.PostMenu.ClickAsync(new PostMenuEntry.SelectText());
        await Phone.BaconReader.SelectText.WaitUntilShownAsync();

        // Then
        // The spoiler shows as plain text, without its box or a tap.
        var spoiler = await Phone.BaconReader.SelectText.ReadAsync();
        Asserting.That(spoiler).ShowsTheText("the crust burns");
    }
}
