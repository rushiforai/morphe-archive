// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.Startup.Links;

/// <summary>
/// "Prompt to open Reddit links": BaconReader asks once whether to open Android's "Open by default" screen, where the user
/// selects the Reddit links to open in it, since Android doesn't let it select them itself.
/// </summary>
public sealed class PromptToOpenRedditLinksTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWith(Patch.PromptToOpenRedditLinks)]
    [TestDescription("""
        @phone
        Scenario: Prompt to open Reddit links asks once and Set up opens Android's Open by default screen
          Given BaconReader is patched with "Prompt to open Reddit links"
          And BaconReader is installed
          When I open BaconReader
          And I tap "GOT IT :(" on "FINAL RELEASE ANNOUNCEMENT!"
          # The prompt waits until the announcement is closed.
          Then BaconReader asks "Open Reddit links with BaconReader?"
          And it offers "Not now" and "Set up"
          When I tap "Set up" on "Open Reddit links with BaconReader?"
          Then Android shows "Open by default" for "BaconReader Premium"
          # reddit.com verifies only Reddit's own app: "0 verified links".
          And "Links to open in this app" lists no link
          When I tap "Add link"
          And I tick "reddit.com"
          And I tap "Add"
          Then "Links to open in this app" lists "reddit.com"
          When I go back
          And I force stop BaconReader
          And I open BaconReader
          # Opened again with its data kept: "Set up" answered the prompt.
          Then the toolbar shows the "Front Page" feed
          And "Open Reddit links with BaconReader?" doesn't show
        """)]
    public async Task PromptToOpenRedditLinksAsksOnceAndSetUpOpensAndroidsOpenByDefaultScreen(Screen screen)
    {
        // Given

        // When
        await Phone.Launcher.OpenBaconReaderAsync();
        await Phone.BaconReader.FinalReleaseAnnouncement.WaitUntilShownAsync();
        await Phone.BaconReader.FinalReleaseAnnouncement.ClickGotItAsync();
        await Phone.BaconReader.OpenRedditLinksPrompt.WaitUntilShownAsync();

        // Then
        // The prompt waits until the announcement is closed.
        var prompt = await Phone.BaconReader.OpenRedditLinksPrompt.ReadAsync();
        Asserting.That(prompt).IsShown().OffersNotNowAndSetUp();

        // When
        await Phone.BaconReader.OpenRedditLinksPrompt.ClickSetUpAsync();
        await Phone.OpenByDefault.WaitUntilShownAsync();

        // Then
        // reddit.com verifies only Reddit's own app: "0 verified links".
        var openByDefault = await Phone.OpenByDefault.ReadAsync();
        Asserting.That(openByDefault).IsOpenByDefaultFor("BaconReader Premium").ListsNoLink();

        // When
        await Phone.OpenByDefault.ClickAddLinkAsync();
        await Phone.OpenByDefault.SupportedLinks.WaitUntilShownAsync();
        await Phone.OpenByDefault.SupportedLinks.TickAsync(new AppLink.RedditCom());
        await Phone.OpenByDefault.SupportedLinks.ClickAddAsync();
        await Phone.OpenByDefault.WaitUntilShownAsync();

        // Then
        var selected = await Phone.OpenByDefault.ReadAsync();
        Asserting.That(selected).ListsLink(new AppLink.RedditCom());

        // When
        await Phone.GoBackAsync();
        await Phone.BaconReader.Main.WaitUntilShownAsync();
        await Phone.AppInfo.ForceStopBaconReaderAsync();
        await Phone.Launcher.OpenBaconReaderAsync();
        await Phone.BaconReader.Main.WaitUntilShownAsync();
        await Phone.BaconReader.OpenRedditLinksPrompt.WaitUntilNotShownAsync();

        // Then
        // Opened again with its data kept: "Set up" answered the prompt.
        var toolbar = await Phone.BaconReader.Main.Toolbar.ReadAsync();
        var promptAgain = await Phone.BaconReader.OpenRedditLinksPrompt.ReadAsync();
        Asserting.That(toolbar).ShowsFeed(new Feed.FrontPage());
        Asserting.That(promptAgain).IsNotShown();
    }
}
