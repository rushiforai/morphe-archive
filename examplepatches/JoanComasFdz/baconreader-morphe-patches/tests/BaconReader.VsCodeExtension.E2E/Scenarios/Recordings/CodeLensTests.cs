// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.VsCodeExtension.E2E.Infrastructure;
using BaconReader.VsCodeExtension.E2E.Infrastructure.Vocabulary;
using BaconReader.VsCodeExtension.E2E.Infrastructure.Workbench;
using JoanComasFdz.AssertingThat;

namespace BaconReader.VsCodeExtension.E2E.Scenarios.Recordings;

/// <summary>The CodeLens above a scenario's method: its newest recording's screens, or that it has none.</summary>
public sealed class CodeLensTests : BaseE2E
{
    [Theory, PlayOnDesktop]
    [TestDescription("""
        @desktop
        Scenario: The CodeLens plays the newest recording
          # Desktop only: the extension runs in VS Code on a desktop.
          Given the release holds the recordings of "SpoofClientTests.cs" from PR #36 · V1 and PR #41 · V1
          When I open "Scenarios/Startup/Account/SpoofClient/SpoofClientTests.cs" in the explorer
          Then the CodeLens above its method reads "Play phone recording" and "PR #41 · V1"
          And no other line has a CodeLens
        """)]
    public async Task TheCodeLensPlaysTheNewestRecording(Screen screen)
    {
        // Given
        GitHub.Release.AddRecordingsOf(new ScenarioFile.SpoofClient(), new Recording(36, 1), new Recording(41, 1));

        // When
        await Workbench.Explorer.OpenAsync(new ScenarioFile.SpoofClient());
        await Workbench.Editor.WaitUntilRecordingsShownAsync();

        // Then
        var codeLens = await Workbench.Editor.ReadCodeLensAsync();
        Asserting.That(codeLens)
            .ReadsAboveTheScenario("Play phone recording", "PR #41 · V1")
            .HasNoOtherCodeLens();
    }

    [Theory, PlayOnDesktop]
    [TestDescription("""
        @desktop
        Scenario: A file that isn't a scenario file has no CodeLens
          # Desktop only: the extension runs in VS Code on a desktop.
          Given the release holds the recordings of "SpoofClientTests.cs" from PR #41 · V1
          And "Scenarios/Startup/Account/SpoofClient/SpoofClientTests.cs" is open, its CodeLens reading "PR #41 · V1"
          # Its name doesn't end in "Tests", so it holds no scenario, though it has the same method and [TestDescription].
          When I open "Scenarios/Startup/Account/SpoofClient/SpoofClientDraft.cs" in the explorer
          Then no line has a CodeLens
        """)]
    public async Task AFileThatIsntAScenarioFileHasNoCodeLens(Screen screen)
    {
        // Given
        GitHub.Release.AddRecordingsOf(new ScenarioFile.SpoofClient(), new Recording(41, 1));
        await Workbench.Explorer.OpenAsync(new ScenarioFile.SpoofClient());
        await Workbench.Editor.WaitUntilCodeLensShowsAsync("PR #41 · V1");

        // When
        await Workbench.Explorer.OpenAsync(new ScenarioFile.SpoofClientDraft());
        await Workbench.Editor.WaitUntilCodeLensSettledAsync();

        // Then
        var codeLens = await Workbench.Editor.ReadCodeLensAsync();
        Asserting.That(codeLens).HasNoCodeLens();
    }

    [Theory, PlayOnDesktop]
    [TestDescription("""
        @desktop
        Scenario: A scenario with no recording says so
          # Desktop only: the extension runs in VS Code on a desktop.
          Given the release holds no recording of "EmbedCommentImagesTests.cs"
          When I open "Scenarios/LoggedIn/Comments/EmbedCommentImages/EmbedCommentImagesTests.cs" in the explorer
          Then the CodeLens above its method reads "No recording yet"
        """)]
    public async Task AScenarioWithNoRecordingSaysSo(Screen screen)
    {
        // Given
        GitHub.Release.HasNoRecordingOf(new ScenarioFile.EmbedCommentImages());

        // When
        await Workbench.Explorer.OpenAsync(new ScenarioFile.EmbedCommentImages());
        await Workbench.Editor.WaitUntilRecordingsShownAsync();

        // Then
        var codeLens = await Workbench.Editor.ReadCodeLensAsync();
        Asserting.That(codeLens).ReadsAboveTheScenario("No recording yet");
    }

    [Theory, PlayOnDesktop]
    [TestDescription("""
        @desktop
        Scenario: A scenario named past two hundred characters finds its recording
          # Desktop only: the extension runs in VS Code on a desktop.
          Given the release holds the recordings of "LongNameTests.cs" from PR #43 · V3
          When I open "Scenarios/Recordings/LongNameTests.cs" in the explorer
          # Its assets' names would pass 200 characters: the workflow cuts them and ends them with a hash of the GIF's path.
          Then the CodeLens above its method reads "Play desktop recording" and "PR #43 · V3"
        """)]
    public async Task AScenarioNamedPastTwoHundredCharactersFindsItsRecording(Screen screen)
    {
        // Given
        GitHub.Release.AddRecordingsOf(new ScenarioFile.LongName(), new Recording(43, 3));

        // When
        await Workbench.Explorer.OpenAsync(new ScenarioFile.LongName());
        await Workbench.Editor.WaitUntilRecordingsShownAsync();

        // Then
        // Its assets' names would pass 200 characters: the workflow cuts them and ends them with a hash of the GIF's path.
        var codeLens = await Workbench.Editor.ReadCodeLensAsync();
        Asserting.That(codeLens).ReadsAboveTheScenario("Play desktop recording", "PR #43 · V3");
    }
}
