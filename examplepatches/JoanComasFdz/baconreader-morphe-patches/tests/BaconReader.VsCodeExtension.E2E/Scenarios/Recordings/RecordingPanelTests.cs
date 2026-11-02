// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.VsCodeExtension.E2E.Infrastructure;
using BaconReader.VsCodeExtension.E2E.Infrastructure.Vocabulary;
using BaconReader.VsCodeExtension.E2E.Infrastructure.Workbench;
using JoanComasFdz.AssertingThat;

namespace BaconReader.VsCodeExtension.E2E.Scenarios.Recordings;

/// <summary>The panel beside the code: a scenario's recording, a tab per screen, every version it was recorded in.</summary>
public sealed class RecordingPanelTests : BaseE2E
{
    [Theory, PlayOnDesktop]
    [TestDescription("""
        @desktop
        Scenario: Play phone recording opens the phone video beside the code
          # Desktop only: the extension runs in VS Code on a desktop.
          Given the release holds the recordings of "SpoofClientTests.cs" from PR #36 · V1 and PR #41 · V1
          And "Scenarios/Startup/Account/SpoofClient/SpoofClientTests.cs" is open
          When I tap "Play phone recording" in its CodeLens
          Then the panel "Recording · BaconReaderPatchedWithSpoofClientLogsInToRedditAsRedReader" shows beside the code
          And its title is "BaconReader patched with Spoof client logs in to Reddit as RedReader"
          And it reads "SpoofClientTests · Startup/Account · PR #41 · V1"
          And its tabs are "Phone", "Phone" selected
          And it plays "pr-41-v1-bacon-reader-patched-with-spoof-client-logs-in-to-reddit-as-red-reader-phone.mp4", with its controls
          And "Open in e2e player ↗" goes to "https://joancomasfdz.github.io/baconreader-morphe-patches/e2e-player.html?v=pr-41-v1-bacon-reader-patched-with-spoof-client-logs-in-to-reddit-as-red-reader-phone.mp4"
        """)]
    public async Task PlayPhoneRecordingOpensThePhoneVideoBesideTheCode(Screen screen)
    {
        // Given
        GitHub.Release.AddRecordingsOf(new ScenarioFile.SpoofClient(), new Recording(36, 1), new Recording(41, 1));
        await Workbench.Explorer.OpenAsync(new ScenarioFile.SpoofClient());
        await Workbench.Editor.WaitUntilRecordingsShownAsync();

        // When
        await Workbench.Editor.ClickCodeLensAsync("Play phone recording");
        await Workbench.RecordingPanel.WaitUntilPlayingAsync();

        // Then
        var layout = await Workbench.RecordingPanel.ReadLayoutAsync();
        Asserting.That(layout).IsBesideTheCode();
        var panel = await Workbench.RecordingPanel.ReadAsync();
        Asserting.That(panel)
            .HasEditorTab("Recording · BaconReaderPatchedWithSpoofClientLogsInToRedditAsRedReader")
            .HasTitle("BaconReader patched with Spoof client logs in to Reddit as RedReader")
            .Reads("SpoofClientTests · Startup/Account · PR #41 · V1")
            .HasTabSelected("Phone", "Phone")
            .Plays("pr-41-v1-bacon-reader-patched-with-spoof-client-logs-in-to-reddit-as-red-reader-phone.mp4")
            .HasVideoControls()
            .LinksToThePlayer("https://joancomasfdz.github.io/baconreader-morphe-patches/e2e-player.html?v=pr-41-v1-bacon-reader-patched-with-spoof-client-logs-in-to-reddit-as-red-reader-phone.mp4");
    }

    [Theory, PlayOnDesktop]
    [TestDescription("""
        @desktop
        Scenario: Recorded in lists every version newest first and plays the one picked
          # Desktop only: the extension runs in VS Code on a desktop.
          Given the release holds the recordings of "SpoofClientTests.cs" from PR #36 · V1 and PR #41 · V1
          And it holds its recordings from PR #31 · V2, as GIFs only
          And "Scenarios/Startup/Account/SpoofClient/SpoofClientTests.cs" is open
          When I tap "Play phone recording" in its CodeLens
          Then the panel's "Recorded in" lists "PR #41 · V1", "PR #36 · V1" and "PR #31 · V2"
          And "PR #41 · V1" is picked
          When I tap "PR #36 · V1" in "Recorded in"
          Then it reads "SpoofClientTests · Startup/Account · PR #36 · V1"
          And "PR #36 · V1" is picked
          And it plays "pr-36-v1-bacon-reader-patched-with-spoof-client-logs-in-to-reddit-as-red-reader-phone.mp4"
          When I tap "PR #31 · V2" in "Recorded in"
          Then it shows the GIF "pr-31-v2-bacon-reader-patched-with-spoof-client-logs-in-to-reddit-as-red-reader-phone.gif"
          And it shows no "Open in e2e player ↗"
        """)]
    public async Task RecordedInListsEveryVersionNewestFirstAndPlaysTheOnePicked(Screen screen)
    {
        // Given
        GitHub.Release.AddRecordingsOf(new ScenarioFile.SpoofClient(), new Recording(36, 1), new Recording(41, 1));
        GitHub.Release.AddRecordingsOf(new ScenarioFile.SpoofClient(), new Recording(31, 2, HasMp4s: false));
        await Workbench.Explorer.OpenAsync(new ScenarioFile.SpoofClient());
        await Workbench.Editor.WaitUntilRecordingsShownAsync();

        // When
        await Workbench.Editor.ClickCodeLensAsync("Play phone recording");
        await Workbench.RecordingPanel.WaitUntilPlayingAsync();

        // Then
        var newest = await Workbench.RecordingPanel.ReadAsync();
        Asserting.That(newest)
            .ListsVersions("PR #41 · V1", "PR #36 · V1", "PR #31 · V2")
            .HasPicked("PR #41 · V1");

        // When
        await Workbench.RecordingPanel.ClickVersionAsync("PR #36 · V1");
        await Workbench.RecordingPanel.WaitUntilPlayingAsync();

        // Then
        var older = await Workbench.RecordingPanel.ReadAsync();
        Asserting.That(older)
            .Reads("SpoofClientTests · Startup/Account · PR #36 · V1")
            .HasPicked("PR #36 · V1")
            .Plays("pr-36-v1-bacon-reader-patched-with-spoof-client-logs-in-to-reddit-as-red-reader-phone.mp4");

        // When
        await Workbench.RecordingPanel.ClickVersionAsync("PR #31 · V2");
        await Workbench.RecordingPanel.WaitUntilPlayingAsync();

        // Then
        var gifsOnly = await Workbench.RecordingPanel.ReadAsync();
        Asserting.That(gifsOnly)
            .ShowsGif("pr-31-v2-bacon-reader-patched-with-spoof-client-logs-in-to-reddit-as-red-reader-phone.gif")
            .HasNoPlayerLink();
    }
}
