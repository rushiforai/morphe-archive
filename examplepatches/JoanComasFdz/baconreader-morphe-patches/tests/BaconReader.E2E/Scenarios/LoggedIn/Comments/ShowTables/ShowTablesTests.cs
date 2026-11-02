// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Reddit;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Comments;

/// <summary>
/// "Show tables": BaconReader draws the tables of comments and post texts as a grid instead of "header: value" lines. A
/// table wider than the text gets "↔ Expand", and then scrolls sideways; links in cells open as anywhere else.
/// </summary>
public sealed class ShowTablesTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Show tables draws Reddit tables as grids, and wide ones expand and scroll sideways
          Given Reddit has a post "Tables" in r/e2e
          And the post "Tables" has a comment "Scores" with the table:
            | Player | Score |
            | Ann    | 12    |
            | Bob    | 7     |
          And the post "Tables" has a comment "Wide" with the table:
            | Player             | Team                   | Position   | Goals | Assists | Minutes played |
            | Annabelle Longname | Northern Rovers United | Midfielder | 12    | 7       | 1890           |
            | Bob                | City                   | Forward    | 20    | 3       | 2100           |
          And the post "Tables" has a comment "Links" with a table whose cell "Open picture" links to an image
          And Reddit has a post "Standings" in r/e2e with the text "Standings" and the table:
            | Team   | Points |
            | Rovers | 30     |
            | City   | 28     |
          And BaconReader is patched with every patch
          And BaconReader is open
          And the test account is logged in
          When I tap the post "Tables"
          Then the comment "Scores" shows a table with the rows "Player, Score", "Ann, 12" and "Bob, 7"
          And the columns of the comment "Scores"'s table don't overlap
          And the comment "Scores"'s table fits inside the screen
          And the comment "Scores"'s table shows no "↔ Expand"
          And the comment "Wide" shows a table with the rows "Player, Team, Position, Goals, Assists, Minutes played", "Annabelle Longname, Northern Rovers United, Midfielder, 12, 7, 1890" and "Bob, City, Forward, 20, 3, 2100"
          # Too wide for the text: its cells wrap until it's expanded.
          And the comment "Wide"'s table fits inside the screen
          When I tap "↔ Expand" on the comment "Wide"'s table
          Then the comment "Wide"'s table hides the column "Minutes played" past its right edge
          And the columns of the comment "Wide"'s table don't overlap
          When I swipe the comment "Wide"'s table to the left
          Then the comment "Wide"'s table shows "Minutes played" inside the screen
          When I tap "Fit to screen" on the comment "Wide"'s table
          Then the comment "Wide"'s table fits inside the screen
          When I scroll to the comment "Links"
          And I tap "Open picture" in the comment "Links"'s table
          Then BaconReader's photo viewer shows
          # Not on the screen: the fake Reddit records what BaconReader asked for.
          And Reddit served the image "Open picture" links to
          When I tap Back
          And I go back to the posts
          And I tap the post "Standings"
          Then the post's text shows a table with the rows "Team, Points", "Rovers, 30" and "City, 28"
          And the post's table fits inside the screen
        """)]
    public async Task ShowTablesDrawsRedditTablesAsGridsAndWideOnesExpandAndScrollSideways(Screen screen)
    {
        // Given
        Reddit.HasAPost("Tables", "e2e");
        Reddit.ThePost("Tables").HasACommentWithTheTable("Scores",
        [
            ["Player", "Score"],
            ["Ann", "12"],
            ["Bob", "7"],
        ]);
        Reddit.ThePost("Tables").HasACommentWithTheTable("Wide",
        [
            ["Player", "Team", "Position", "Goals", "Assists", "Minutes played"],
            ["Annabelle Longname", "Northern Rovers United", "Midfielder", "12", "7", "1890"],
            ["Bob", "City", "Forward", "20", "3", "2100"],
        ]);
        Reddit.ThePost("Tables").HasACommentWithATableWhoseCellLinksToAnImage("Links", "Open picture");
        Reddit.HasAPostWithTheTextAndTheTable("Standings", "e2e", "Standings",
        [
            ["Team", "Points"],
            ["Rovers", "30"],
            ["City", "28"],
        ]);
        await Phone.BaconReader.OpenAsync();
        await Phone.BaconReader.LogInWithTheTestAccountAsync();

        // When
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Tables");
        await Phone.BaconReader.Detail.Comments.WaitUntilTableShownAsync("Scores");
        await Phone.BaconReader.Detail.Comments.WaitUntilTableShownAsync("Wide");

        // Then
        var scores = await Phone.BaconReader.Detail.Comments.ReadTableAsync("Scores");
        var scoresLayout = await Phone.BaconReader.Detail.Comments.ReadTableLayoutAsync("Scores");
        var wide = await Phone.BaconReader.Detail.Comments.ReadTableAsync("Wide");
        // Too wide for the text: its cells wrap until it's expanded.
        var wideLayout = await Phone.BaconReader.Detail.Comments.ReadTableLayoutAsync("Wide");
        Asserting.That(scores).ShowsTheRows("Player, Score", "Ann, 12", "Bob, 7");
        Asserting.That(scoresLayout).ColumnsDontOverlap().FitsInsideTheScreen();
        Asserting.That(scores).ShowsNoButton(new TableButton.Expand());
        Asserting.That(wide).ShowsTheRows(
            "Player, Team, Position, Goals, Assists, Minutes played",
            "Annabelle Longname, Northern Rovers United, Midfielder, 12, 7, 1890",
            "Bob, City, Forward, 20, 3, 2100");
        Asserting.That(wideLayout).FitsInsideTheScreen();

        // When
        await Phone.BaconReader.Detail.Comments.ClickTableButtonAsync("Wide", new TableButton.Expand());
        await Phone.BaconReader.Detail.Comments.WaitUntilTableButtonShownAsync("Wide", new TableButton.FitToScreen());

        // Then
        var expanded = await Phone.BaconReader.Detail.Comments.ReadTableLayoutAsync("Wide");
        Asserting.That(expanded).HidesTheColumnPastItsRightEdge("Minutes played").ColumnsDontOverlap();

        // When
        await Phone.BaconReader.Detail.Comments.SwipeTableLeftAsync("Wide");
        await Phone.BaconReader.Detail.Comments.WaitUntilTableCellShownAsync("Wide", "Minutes played");

        // Then
        var scrolled = await Phone.BaconReader.Detail.Comments.ReadTableLayoutAsync("Wide");
        Asserting.That(scrolled).ShowsTheCellInsideTheScreen("Minutes played");

        // When
        await Phone.BaconReader.Detail.Comments.ClickTableButtonAsync("Wide", new TableButton.FitToScreen());
        await Phone.BaconReader.Detail.Comments.WaitUntilTableButtonShownAsync("Wide", new TableButton.Expand());

        // Then
        var fitted = await Phone.BaconReader.Detail.Comments.ReadTableLayoutAsync("Wide");
        Asserting.That(fitted).FitsInsideTheScreen();

        // When
        await Phone.BaconReader.Detail.Comments.ScrollToCommentAsync("Links");
        await Phone.BaconReader.Detail.Comments.ClickTableLinkAsync("Links", "Open picture");
        await Phone.BaconReader.PhotoViewer.WaitUntilShownAsync();

        // Then
        var viewer = await Phone.BaconReader.PhotoViewer.ReadAsync();
        // Not on the screen: the fake Reddit records what BaconReader asked for.
        var served = Reddit.ReadMediaServed();
        Asserting.That(viewer).IsShown();
        Asserting.That(served).ServedTheImageOf("Open picture");

        // When
        await Phone.BaconReader.PhotoViewer.ClickBackAsync();
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Standings");
        await Phone.BaconReader.Detail.PostText.WaitUntilTableShownAsync();

        // Then
        var standings = await Phone.BaconReader.Detail.PostText.ReadTableAsync();
        var standingsLayout = await Phone.BaconReader.Detail.PostText.ReadTableLayoutAsync();
        Asserting.That(standings).ShowsTheRows("Team, Points", "Rovers, 30", "City, 28");
        Asserting.That(standingsLayout).FitsInsideTheScreen();
    }
}
