// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.VsCodeExtension.E2E.Infrastructure;
using BaconReader.VsCodeExtension.E2E.Infrastructure.Vocabulary;
using BaconReader.VsCodeExtension.E2E.Infrastructure.Workbench;
using JoanComasFdz.AssertingThat;

namespace BaconReader.VsCodeExtension.E2E.Scenarios.Recordings;

/// <summary>Reading the release again, for a recording posted after the file was opened.</summary>
public sealed class RefreshTests : BaseE2E
{
    [Theory, PlayOnDesktop]
    [TestDescription("""
        @desktop
        Scenario: Refreshing finds a recording posted after the file was opened
          # Desktop only: the extension runs in VS Code on a desktop.
          Given the release holds no recording of "EmbedCommentImagesTests.cs"
          And "Scenarios/LoggedIn/Comments/EmbedCommentImages/EmbedCommentImagesTests.cs" is open, its CodeLens reading "No recording yet"
          When the release gets the recordings of "EmbedCommentImagesTests.cs" from PR #44 · V1
          And I run "BaconReader Morphe: Refresh e2e recordings" from the Command Palette
          Then the CodeLens above its method reads "Play phone recording" and "PR #44 · V1"
        """)]
    public async Task RefreshingFindsARecordingPostedAfterTheFileWasOpened(Screen screen)
    {
        // Given
        GitHub.Release.HasNoRecordingOf(new ScenarioFile.EmbedCommentImages());
        await Workbench.Explorer.OpenAsync(new ScenarioFile.EmbedCommentImages());
        await Workbench.Editor.WaitUntilCodeLensShowsAsync("No recording yet");

        // When
        GitHub.Release.AddRecordingsOf(new ScenarioFile.EmbedCommentImages(), new Recording(44, 1));
        await Workbench.CommandPalette.RunAsync("BaconReader Morphe: Refresh e2e recordings");
        await Workbench.Editor.WaitUntilCodeLensShowsAsync("PR #44 · V1");

        // Then
        var codeLens = await Workbench.Editor.ReadCodeLensAsync();
        Asserting.That(codeLens).ReadsAboveTheScenario("Play phone recording", "PR #44 · V1");
    }
}
