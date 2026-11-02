// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.VsCodeExtension.E2E.Infrastructure;
using BaconReader.VsCodeExtension.E2E.Infrastructure.Vocabulary;
using BaconReader.VsCodeExtension.E2E.Infrastructure.Workbench;
using JoanComasFdz.AssertingThat;

namespace BaconReader.VsCodeExtension.E2E.Scenarios.Recordings;

/// <summary>
/// "Play e2e recording of this scenario": the editor's play button and the Command Palette play the scenario the cursor is
/// in, a way to play that a finger reaches (a CodeLens or a hover's link is hard to tap on a phone).
/// </summary>
public sealed class PlayHereTests : BaseE2E
{
    [Theory, PlayOnDesktop]
    [TestDescription("""
        @desktop
        Scenario: The editor's play button plays the scenario the cursor is in
          # Desktop only: the extension runs in VS Code on a desktop.
          Given the release holds the recordings of "SpoofClientTests.cs" from PR #36 · V1 and PR #41 · V1
          And "Scenarios/Startup/Account/SpoofClient/SpoofClientTests.cs" is open
          When I tap the line "When I open BaconReader"
          And I tap "BaconReader Morphe: Play e2e recording of this scenario" in the editor's title bar
          Then the panel "Recording · BaconReaderPatchedWithSpoofClientLogsInToRedditAsRedReader" shows beside the code
          And its tabs are "Phone", "Phone" selected
          And it plays "pr-41-v1-bacon-reader-patched-with-spoof-client-logs-in-to-reddit-as-red-reader-phone.mp4"
        """)]
    public async Task TheEditorsPlayButtonPlaysTheScenarioTheCursorIsIn(Screen screen)
    {
        // Given
        GitHub.Release.AddRecordingsOf(new ScenarioFile.SpoofClient(), new Recording(36, 1), new Recording(41, 1));
        await Workbench.Explorer.OpenAsync(new ScenarioFile.SpoofClient());
        await Workbench.Editor.WaitUntilRecordingsShownAsync();

        // When
        await Workbench.Editor.ClickLineAsync("When I open BaconReader");
        await Workbench.Editor.ClickTitleBarButtonAsync("BaconReader Morphe: Play e2e recording of this scenario");
        await Workbench.RecordingPanel.WaitUntilPlayingAsync();

        // Then
        var layout = await Workbench.RecordingPanel.ReadLayoutAsync();
        Asserting.That(layout).IsBesideTheCode();
        var panel = await Workbench.RecordingPanel.ReadAsync();
        Asserting.That(panel)
            .HasEditorTab("Recording · BaconReaderPatchedWithSpoofClientLogsInToRedditAsRedReader")
            .HasTabSelected("Phone", "Phone")
            .Plays("pr-41-v1-bacon-reader-patched-with-spoof-client-logs-in-to-reddit-as-red-reader-phone.mp4");
    }

    [Theory, PlayOnDesktop]
    [TestDescription("""
        @desktop
        Scenario: The Command Palette plays the scenario below the cursor when the cursor is above every scenario
          # Desktop only: the extension runs in VS Code on a desktop.
          Given the release holds the recordings of "SpoofClientTests.cs" from PR #36 · V1 and PR #41 · V1
          And "Scenarios/Startup/Account/SpoofClient/SpoofClientTests.cs" is open
          When I tap the line "public sealed class SpoofClientTests : BaseE2E"
          And I run "BaconReader Morphe: Play e2e recording of this scenario" from the Command Palette
          Then the panel "Recording · BaconReaderPatchedWithSpoofClientLogsInToRedditAsRedReader" shows beside the code
          And its tabs are "Phone", "Phone" selected
          And it plays "pr-41-v1-bacon-reader-patched-with-spoof-client-logs-in-to-reddit-as-red-reader-phone.mp4"
        """)]
    public async Task TheCommandPalettePlaysTheScenarioBelowTheCursorWhenTheCursorIsAboveEveryScenario(Screen screen)
    {
        // Given
        GitHub.Release.AddRecordingsOf(new ScenarioFile.SpoofClient(), new Recording(36, 1), new Recording(41, 1));
        await Workbench.Explorer.OpenAsync(new ScenarioFile.SpoofClient());
        await Workbench.Editor.WaitUntilRecordingsShownAsync();

        // When
        await Workbench.Editor.ClickLineAsync("public sealed class SpoofClientTests : BaseE2E");
        await Workbench.CommandPalette.RunAsync("BaconReader Morphe: Play e2e recording of this scenario");
        await Workbench.RecordingPanel.WaitUntilPlayingAsync();

        // Then
        var layout = await Workbench.RecordingPanel.ReadLayoutAsync();
        Asserting.That(layout).IsBesideTheCode();
        var panel = await Workbench.RecordingPanel.ReadAsync();
        Asserting.That(panel)
            .HasEditorTab("Recording · BaconReaderPatchedWithSpoofClientLogsInToRedditAsRedReader")
            .HasTabSelected("Phone", "Phone")
            .Plays("pr-41-v1-bacon-reader-patched-with-spoof-client-logs-in-to-reddit-as-red-reader-phone.mp4");
    }
}
