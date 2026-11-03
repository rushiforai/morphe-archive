// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Posts;

/// <summary>
/// "Text post icon": the button that opens a text post's text in the post list is a page icon with a chevron that
/// flips when the text opens, in the card and list views. The patch describes it "Show post text", or "Hide post text"
/// while the text is open, so a scenario reads the chevron's state.
/// </summary>
public sealed class TextPostIconTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Text post icon opens a text post's text with a page icon whose chevron flips
          Given Reddit has a post "Read me" in r/e2e with the text "The hidden text"
          And BaconReader is patched with every patch
          And BaconReader is open
          And the test account is logged in
          When I select the "e2e" feed
          # BaconReader starts in the card view. The icon's description says what tapping it does.
          Then the post "Read me" shows "Show post text"
          And the post "Read me" shows no text
          When I tap "Show post text" on the post "Read me"
          Then the post "Read me" shows the text "The hidden text"
          And the post "Read me" shows "Hide post text"
          When I tap "Hide post text" on the post "Read me"
          Then the post "Read me" shows no text
          And the post "Read me" shows "Show post text"
          When I tap "More options" in the toolbar
          And I tap "List View"
          Then the post "Read me" shows "Show post text"
          When I tap "Show post text" on the post "Read me"
          Then the post "Read me" shows the text "The hidden text"
          And the post "Read me" shows "Hide post text"
          When I tap "Hide post text" on the post "Read me"
          Then the post "Read me" shows no text
          And the post "Read me" shows "Show post text"
        """)]
    public async Task TextPostIconOpensATextPostsTextWithAPageIconWhoseChevronFlips(Screen screen)
    {
        // Given
        Reddit.HasAPostWithTheText("Read me", "e2e", "The hidden text");
        await Phone.BaconReader.OpenAsync();
        await Phone.BaconReader.LogInWithTheTestAccountAsync();

        // When
        await Phone.BaconReader.Main.Toolbar.SelectFeedAsync(new Feed.Subreddit("e2e"));
        await Phone.BaconReader.Main.Toolbar.WaitUntilFeedShownAsync(new Feed.Subreddit("e2e"));
        await Phone.BaconReader.Main.Posts.WaitUntilOnlyPostsShownAsync("Read me");

        // Then
        // BaconReader starts in the card view. The icon's description says what tapping it does.
        var cardClosed = await Phone.BaconReader.Main.Posts.ReadPostAsync("Read me");
        Asserting.That(cardClosed).ShowsTheTextButton(new TextPostButton.ShowPostText()).ShowsNoText();

        // When
        await Phone.BaconReader.Main.Posts.ClickTextButtonAsync("Read me", new TextPostButton.ShowPostText());
        await Phone.BaconReader.Main.Posts.WaitUntilPostTextShownAsync("Read me");

        // Then
        var cardOpen = await Phone.BaconReader.Main.Posts.ReadPostAsync("Read me");
        Asserting.That(cardOpen).ShowsTheText("The hidden text").ShowsTheTextButton(new TextPostButton.HidePostText());

        // When
        await Phone.BaconReader.Main.Posts.ClickTextButtonAsync("Read me", new TextPostButton.HidePostText());
        await Phone.BaconReader.Main.Posts.WaitUntilPostTextHiddenAsync("Read me");

        // Then
        var cardClosedAgain = await Phone.BaconReader.Main.Posts.ReadPostAsync("Read me");
        Asserting.That(cardClosedAgain).ShowsNoText().ShowsTheTextButton(new TextPostButton.ShowPostText());

        // When
        await Phone.BaconReader.Main.Toolbar.ClickMoreOptionsAsync();
        await Phone.BaconReader.Main.Toolbar.MoreOptions.WaitUntilShownAsync();
        await Phone.BaconReader.Main.Toolbar.MoreOptions.ClickAsync(new OverflowMenuEntry.ListView());
        await Phone.BaconReader.Main.Posts.WaitUntilShownAsRowsAsync();

        // Then
        var rowClosed = await Phone.BaconReader.Main.Posts.ReadPostAsync("Read me");
        Asserting.That(rowClosed).ShowsTheTextButton(new TextPostButton.ShowPostText());

        // When
        await Phone.BaconReader.Main.Posts.ClickTextButtonAsync("Read me", new TextPostButton.ShowPostText());
        await Phone.BaconReader.Main.Posts.WaitUntilPostTextShownAsync("Read me");

        // Then
        var rowOpen = await Phone.BaconReader.Main.Posts.ReadPostAsync("Read me");
        Asserting.That(rowOpen).ShowsTheText("The hidden text").ShowsTheTextButton(new TextPostButton.HidePostText());

        // When
        await Phone.BaconReader.Main.Posts.ClickTextButtonAsync("Read me", new TextPostButton.HidePostText());
        await Phone.BaconReader.Main.Posts.WaitUntilPostTextHiddenAsync("Read me");

        // Then
        var rowClosedAgain = await Phone.BaconReader.Main.Posts.ReadPostAsync("Read me");
        Asserting.That(rowClosedAgain).ShowsNoText().ShowsTheTextButton(new TextPostButton.ShowPostText());
    }
}
