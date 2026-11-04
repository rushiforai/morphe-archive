// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Reddit;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Core;

/// <summary>
/// "Patches entry in settings": "Patches" at the end of BaconReader's settings menu opens the patches' settings, and the
/// bottom of the left menu shows the patches' version, "Patches &lt;version&gt; (&lt;patcher&gt;)". Reseam's bundle
/// names it; Morphe's always adds it, without a name.
/// </summary>
public sealed class PatchesEntryInSettingsTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Patches entry in settings adds "Patches" to BaconReader's settings and the patches' version to the left menu
          Given Reddit has a post "Hello from r/e2e" in r/e2e
          And BaconReader is patched with every patch
          And BaconReader is open
          And the test account is logged in
          When I open the left menu
          # "Patches <version> (<patcher>)": it changes with each build and patcher.
          Then the left menu shows the patches' version at its bottom
          When I tap "Settings"
          Then the settings show "Patches" last
          When I tap "Patches"
          Then BaconReader shows the patches' settings
        """)]
    public async Task PatchesEntryInSettingsAddsPatchesToBaconReadersSettingsAndThePatchesVersionToTheLeftMenu(Screen screen)
    {
        // Given
        Reddit.HasAPost("Hello from r/e2e", "e2e");
        await Phone.BaconReader.OpenAsync();
        await Phone.BaconReader.LogInWithTheTestAccountAsync();

        // When
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();

        // Then
        // "Patches <version> (<patcher>)": it changes with each build and patcher.
        var footer = await Phone.BaconReader.Main.LeftMenu.ReadFooterAsync();
        Asserting.That(footer).ShowsThePatchesVersionAtItsBottom();

        // When
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());

        // Then
        var menu = await Phone.BaconReader.Settings.ReadMenuAsync();
        Asserting.That(menu).ShowsLast(new SettingsSection.Patches());

        // When
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();

        // Then
        var patches = await Phone.BaconReader.PatchesSettings.ReadScreenAsync();
        Asserting.That(patches).IsShown();
    }
}
