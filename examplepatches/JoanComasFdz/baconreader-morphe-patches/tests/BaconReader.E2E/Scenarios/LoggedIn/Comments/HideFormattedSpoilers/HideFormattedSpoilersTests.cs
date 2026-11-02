// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Reddit;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Comments;

/// <summary>
/// "Hide formatted spoilers": BaconReader hides spoilers with formatting, a link or code behind the spoiler box, as it
/// hides plain ones, until a tap shows them; a link in one opens only once it shows. A hidden spoiler reads as "spoiler"
/// to accessibility, which is how the test sees it: the box only paints over the text.
/// </summary>
public sealed class HideFormattedSpoilersTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Hide formatted spoilers hides spoilers with formatting, a link or code until tapped
          Given Reddit has a post "Spoilers" in r/e2e
          And the post "Spoilers" has a comment ">!the butler did it!<"
          And the post "Spoilers" has a comment ">!the **gardener** did it!<"
          And the post "Spoilers" has a comment that is a spoiler "the chef" linking to an image
          And the post "Spoilers" has a comment ">!`butler()`!<"
          And BaconReader is patched with every patch
          And BaconReader is open
          And the test account is logged in
          When I tap the post "Spoilers"
          # Not on the screen: a hidden spoiler is a box painted over its text, which reads as "spoiler" to accessibility.
          # BaconReader hides a plain spoiler itself; the patch must leave it hidden.
          Then the comment "the butler did it" is hidden behind a spoiler
          And the comment "the gardener did it" is hidden behind a spoiler
          And the comment "the chef" is hidden behind a spoiler
          And the comment "butler()" is hidden behind a spoiler
          When I tap the comment "the gardener did it"
          Then the comment "the gardener did it" shows its spoiler
          When I tap the comment "butler()"
          Then the comment "butler()" shows its spoiler
          When I tap the comment "the chef"
          # The first tap shows the spoiler; the link waits for the next one.
          Then the comment "the chef" shows its spoiler
          When I tap the comment "the chef"
          Then BaconReader's photo viewer shows
          # Not on the screen: the fake Reddit records what BaconReader asked for.
          And Reddit served the image "the chef" links to
        """)]
    public async Task HideFormattedSpoilersHidesSpoilersWithFormattingALinkOrCodeUntilTapped(Screen screen)
    {
        // Given
        Reddit.HasAPost("Spoilers", "e2e");
        Reddit.ThePost("Spoilers").HasAComment(">!the butler did it!<");
        Reddit.ThePost("Spoilers").HasAComment(">!the **gardener** did it!<");
        Reddit.ThePost("Spoilers").HasACommentThatIsASpoilerLinkingToAnImage("the chef");
        Reddit.ThePost("Spoilers").HasAComment(">!`butler()`!<");
        await Phone.BaconReader.OpenAsync();
        await Phone.BaconReader.LogInWithTheTestAccountAsync();

        // When
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Spoilers");
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("butler()");

        // Then
        // Not on the screen: a hidden spoiler is a box painted over its text, which reads as "spoiler" to accessibility.
        // BaconReader hides a plain spoiler itself; the patch must leave it hidden.
        var plain = await Phone.BaconReader.Detail.Comments.ReadReadingAsync("the butler did it");
        var bold = await Phone.BaconReader.Detail.Comments.ReadReadingAsync("the gardener did it");
        var link = await Phone.BaconReader.Detail.Comments.ReadReadingAsync("the chef");
        var code = await Phone.BaconReader.Detail.Comments.ReadReadingAsync("butler()");
        Asserting.That(plain).IsHiddenBehindASpoiler();
        Asserting.That(bold).IsHiddenBehindASpoiler();
        Asserting.That(link).IsHiddenBehindASpoiler();
        Asserting.That(code).IsHiddenBehindASpoiler();

        // When
        await Phone.BaconReader.Detail.Comments.ClickTextAsync("the gardener did it");
        await Phone.BaconReader.Detail.Comments.WaitUntilSpoilersShownAsync("the gardener did it");

        // Then
        var boldShown = await Phone.BaconReader.Detail.Comments.ReadReadingAsync("the gardener did it");
        Asserting.That(boldShown).ShowsItsSpoiler();

        // When
        await Phone.BaconReader.Detail.Comments.ClickTextAsync("butler()");
        await Phone.BaconReader.Detail.Comments.WaitUntilSpoilersShownAsync("butler()");

        // Then
        var codeShown = await Phone.BaconReader.Detail.Comments.ReadReadingAsync("butler()");
        Asserting.That(codeShown).ShowsItsSpoiler();

        // When
        await Phone.BaconReader.Detail.Comments.ClickTextAsync("the chef");
        await Phone.BaconReader.Detail.Comments.WaitUntilSpoilersShownAsync("the chef");

        // Then
        // The first tap shows the spoiler; the link waits for the next one.
        var linkShown = await Phone.BaconReader.Detail.Comments.ReadReadingAsync("the chef");
        Asserting.That(linkShown).ShowsItsSpoiler();

        // When
        await Phone.BaconReader.Detail.Comments.ClickTextAsync("the chef");
        await Phone.BaconReader.PhotoViewer.WaitUntilShownAsync();

        // Then
        var viewer = await Phone.BaconReader.PhotoViewer.ReadAsync();
        // Not on the screen: the fake Reddit records what BaconReader asked for.
        var served = Reddit.ReadMediaServed();
        Asserting.That(viewer).IsShown();
        Asserting.That(served).ServedTheImageOf("the chef");
    }
}
