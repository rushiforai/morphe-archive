<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->

# End-to-end test code rules of the VS Code extension (binding)

These rules are binding for `tests/BaconReader.VsCodeExtension.E2E`, the e2e scenarios of the VS Code e2e recordings
extension (`tools/vscode-extension`).

They are the app's e2e rules, [tests/BaconReader.E2E/E2E-TEST-CODE-RULES.md](../BaconReader.E2E/E2E-TEST-CODE-RULES.md),
rule for rule: one Gherkin is one scenario, played on the screen its tag names, reading like the Gherkin line by line,
with everything that isn't the scenario in `Infrastructure/`. What both projects share (a Gherkin and its
`[TestDescription]`, `Screen` and `[PlayOnDesktop]`, `ScenarioNaming`, the record next to a video) is
`tests/BaconReader.E2E.Shared`. This file says only where this project differs. Like the app's, a Gherkin quotes what
the screen shows, never the extension's code.

## A full example

```csharp
using BaconReader.VsCodeExtension.E2E.Infrastructure;
using BaconReader.VsCodeExtension.E2E.Infrastructure.Vocabulary;
using BaconReader.VsCodeExtension.E2E.Infrastructure.Workbench;
using JoanComasFdz.AssertingThat;

namespace BaconReader.VsCodeExtension.E2E.Scenarios.Recordings;

public sealed class CodeLensTests : BaseE2E
{
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
}
```

## a. Test shape

As the app's rule a, except:
- every scenario is played on the desktop only: `[Theory, PlayOnDesktop]`, its Gherkin tagged `@desktop` with the `#`
  line `# Desktop only: the extension runs in VS Code on a desktop.` right under its `Scenario:` line (the extension is
  for VS Code on a desktop, in a browser or the app). `ScenarioShapeTests` fails any other screen or tag;
- no patches: there is no app, so no `[PatchedWith]` and no "BaconReader is patched with" line;
- the body calls only `Workbench` (VS Code as the user sees it), `GitHub` (the fake GitHub the extension reads) and
  `Asserting.That`.

## b. BaseE2E

`Infrastructure/BaseE2E.cs` owns everything that isn't the scenario, as the app's rule b, except:
- the skip: a scenario is skipped unless `E2E_VSCODE_URL` points at VS Code for the web with the extension, opened on
  `Workspace/` (`tools/e2e/record.sh` serves it: README, "Run and record");
- one Chromium for the whole run (`BrowserRun`), a fresh context per scenario; the window is the desktop's 1280×800, with
  a mouse, its video (Playwright's, a `.webm`) the same size, with a big pointer and a ring at each click drawn over it
  (`RecordingOverlay`: headless Chromium draws no pointer);
- **GitHub is faked** (`Infrastructure/Fakes/FakeGitHub.cs`), per scenario, never reached: the context's requests to
  `api.github.com` (the release `prs-resources` by its tag, then its assets) and to
  `github.com/…/releases/download/prs-resources/…` (a GIF or an MP4) are answered from the release the scenario fills
  (`GitHub.Release`), which starts empty; anything else answers 404;
- it opens VS Code and waits until its workbench is shown, noting when (the record's `homeShownSeconds`) and taking a
  screenshot of it (`<gif name>.home.png`), so `record.sh` trims VS Code's loading screen off the video;
- it gives the scenario its `Workbench` and its `GitHub`.

## c. Workbench

`Infrastructure/Workbench/` is an object model of VS Code as the user sees it, in place of the app's `Phone`, with its
members (Act, Wait, Read, `ReadLayoutAsync`), each going through `OnScreen`:
- `Workbench.Explorer` (the tree of `Workspace/`), `Workbench.Editor` (the scenario file's editor: its CodeLens, a
  click on a line, its title bar's buttons), `Workbench.RecordingPanel` (the extension's panel, a webview),
  `Workbench.CommandPalette`;
- **locators:** role + accessible name where VS Code gives one (a tree item, a tab, a command); the extension's own panel
  by its `data-testid` and `data-action` attributes (`extension.js`, `writePanel`); and VS Code's own class names, which
  have no role to find them by, only in `Infrastructure/Workbench/VsCodeDom.cs`, one constant each, so a VS Code update
  that renames one changes one line;
- **the panel is a webview:** its page sits in two frames drawn over its editor group
  (`FrameLocator(VsCodeDom.Webview).FrameLocator(VsCodeDom.WebviewContent)`). The frames keep their mouse events from
  the page, so `OnScreen` draws the pointer's last stretch and the click's ring itself for an action in the panel
  (`inPanel: true`, through `RecordingOverlay`'s hooks);
- VS Code's workbench doesn't scroll, so `OnScreen` scrolls nothing; it paces a recorded scenario (`--action-gap`) and
  glides the pointer to each action's target.

## d. Assertions

As the app's rule d: one `<Type>Assertions` class next to each snapshot, in the extension's words
(`ReadsAboveTheScenario(…)`, `HasNoOtherCodeLens()`, `Plays("pr-41-v1-….mp4")`, `IsBesideTheCode()`).

## e. Vocabulary

`Infrastructure/Vocabulary/` holds what a scenario sets up: `ScenarioFile` (a Dunet union, one case per scenario file of
`Workspace/`: its path, its scenario's method, domain folder and screens, the only place they live) and `Recording`
(`new Recording(41, 1)`: "PR #41 · V1", GIFs and MP4s; `HasMp4s: false` for GIFs only). An asset's name is never
written by hand in the fake: `FakeRelease` names each run as the workflow does (`AssetNaming`; `AssetNamingTests` checks
it against names `tools/e2e`'s `ReleaseNaming.NameAsset` wrote). A Gherkin's quoted asset name or URL is the quoted
string itself.

## f. The workspace

`Workspace/` is the folder VS Code for the web opens: its `.vscode/settings.json` (a dark theme, no welcome page, no
compact folders, a larger font for the videos) and the scenario files the scenarios open (`Workspace/Scenarios/`,
never compiled: the project leaves them out). A scenario needing a new kind of file adds one there, and its
`ScenarioFile` case.

## g. Isolation

Each scenario has its own browser context (VS Code's state is in its IndexedDB) and its own fake GitHub; the workspace is
only read. Two scenarios run at a time (`xunit.runner.json`).

## h. Adding a test

As the app's rule g, with `Scenarios/<domain folder>/` of this project (today `Recordings`), `Workspace/` for its
files, and `tools/e2e/record.sh --no-video <its class>` (it serves VS Code for the web; no phone). A class stays in
its domain folder (`Scenarios/Recordings/CodeLensTests.cs`), not in a folder of its own: there is no patch to name one
after.

## i. From a Gherkin to a scenario

| In the Gherkin | In the scenario |
|---|---|
| `@desktop` | `[Theory, PlayOnDesktop]` |
| `Given the release holds the recordings of "SpoofClientTests.cs" from PR #36 · V1 and PR #41 · V1` | `GitHub.Release.AddRecordingsOf(new ScenarioFile.SpoofClient(), new Recording(36, 1), new Recording(41, 1))` |
| `… from PR #31 · V2, as GIFs only` | `new Recording(31, 2, HasMp4s: false)` |
| `Given the release holds no recording of "EmbedCommentImagesTests.cs"` | `GitHub.Release.HasNoRecordingOf(new ScenarioFile.EmbedCommentImages())` |
| `"Scenarios/Startup/Account/SpoofClient/SpoofClientTests.cs" is open` / `I open … in the explorer` | `Explorer.OpenAsync(new ScenarioFile.SpoofClient())`, `Editor.WaitUntilRecordingsShownAsync()` |
| `I tap "Play phone recording" in its CodeLens` | `Editor.ClickCodeLensAsync("Play phone recording")`, `RecordingPanel.WaitUntilPlayingAsync()` |
| `I tap "PR #36 · V1" in "Recorded in"` | `RecordingPanel.ClickVersionAsync("PR #36 · V1")`, `RecordingPanel.WaitUntilPlayingAsync()` |
| `"…" is open, its CodeLens reading "PR #41 · V1"` | `Explorer.OpenAsync(…)`, `Editor.WaitUntilCodeLensShowsAsync("PR #41 · V1")` |
| `I run "BaconReader Morphe: Refresh e2e recordings" from the Command Palette` | `CommandPalette.RunAsync("BaconReader Morphe: Refresh e2e recordings")` |
| `the CodeLens above its method reads "…" and "…"` / `no other line has a CodeLens` | `Editor.ReadCodeLensAsync()`, `ReadsAboveTheScenario("…", "…")` / `HasNoOtherCodeLens()` |
| `no line has a CodeLens` (a file that gets none) | When ends with `Editor.WaitUntilCodeLensSettledAsync()` (VS Code draws a CodeLens a moment after a file opens); `ReadCodeLensAsync()`, `HasNoCodeLens()` |
| `it plays "….mp4", with its controls` | `Plays("….mp4")`, `HasVideoControls()` |
| `the panel "Recording · …" shows beside the code` | `RecordingPanel.ReadLayoutAsync()`, `IsBesideTheCode()`; `RecordingPanel.ReadAsync()`, `HasEditorTab("Recording · …")` |
| `its tabs are "Phone", "Phone" selected` | `HasTabSelected("Phone", "Phone")` |
| `it reads "…"` | `RecordingPanel.ReadAsync()`, `Reads("…")` |
| `"Open in e2e player ↗" goes to "…"` / `it shows no "Open in e2e player ↗"` | `LinksToThePlayer("…")` / `HasNoPlayerLink()` |
| `it shows the GIF "….gif"` | `ShowsGif("….gif")` |
