// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.Startup.Misc;

/// <summary>"Disable final release announcement": BaconReader opens without its "FINAL RELEASE ANNOUNCEMENT!" goodbye.</summary>
public sealed class DisableFinalReleaseAnnouncementTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWith(Patch.DisableFinalReleaseAnnouncement)]
    [TestDescription("""
        @phone
        Scenario: BaconReader patched with Disable final release announcement opens without the final release announcement
          Given BaconReader is patched with "Disable final release announcement"
          And BaconReader is installed
          When I open BaconReader
          Then the toolbar shows the "Front Page" feed
          And "FINAL RELEASE ANNOUNCEMENT!" doesn't show
        """)]
    public async Task BaconReaderPatchedWithDisableFinalReleaseAnnouncementOpensWithoutTheFinalReleaseAnnouncement(Screen screen)
    {
        // Given

        // When
        await Phone.Launcher.OpenBaconReaderAsync();
        await Phone.BaconReader.Main.WaitUntilShownAsync();
        await Phone.BaconReader.FinalReleaseAnnouncement.WaitUntilNotShownAsync();

        // Then
        var toolbar = await Phone.BaconReader.Main.Toolbar.ReadAsync();
        var announcement = await Phone.BaconReader.FinalReleaseAnnouncement.ReadAsync();
        Asserting.That(toolbar).ShowsFeed(new Feed.FrontPage());
        Asserting.That(announcement).IsNotShown();
    }
}
