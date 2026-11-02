// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.VsCodeExtension.E2E.Infrastructure;
using JoanComasFdz.AssertingThat;

namespace BaconReader.VsCodeExtension.E2E.Scenarios.Recordings;

/// <summary>A fixture of the VS Code extension's e2e scenarios: a desktop scenario whose asset names pass 200 characters.</summary>
public sealed class LongNameTests : BaseE2E
{
    [Theory, PlayOnDesktop]
    [TestDescription("""
        @desktop
        Scenario: A scenario whose title goes on and on past two hundred characters still finds its recording because the workflow shortens its asset names with a hash and the extension shortens them the same way
          Given VS Code is open on the workspace
        """)]
    public async Task AScenarioWhoseTitleGoesOnAndOnPastTwoHundredCharactersStillFindsItsRecordingBecauseTheWorkflowShortensItsAssetNamesWithAHashAndTheExtensionShortensThemTheSameWay(Screen screen)
    {
        // Given
        await Workbench.WaitUntilShownAsync();
    }
}
