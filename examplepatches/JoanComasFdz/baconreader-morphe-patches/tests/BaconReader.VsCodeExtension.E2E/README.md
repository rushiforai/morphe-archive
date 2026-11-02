<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->

# BaconReader.VsCodeExtension.E2E: end-to-end tests of the VS Code extension

The e2e scenarios of the VS Code e2e recordings extension ([tools/vscode-extension](../../tools/vscode-extension/README.md)):
each Gherkin about what it shows in VS Code (its CodeLens, play button and recording panel) is one scenario here, played
in VS Code for the web in Chromium, on the desktop. No phone and no patched app: the files it opens are fixtures.
Their code rules: [E2E-TEST-CODE-RULES.md](E2E-TEST-CODE-RULES.md). A PR that adds or changes them shows them on the PR
like the app's: their Gherkins and their GIFs and MP4s (under a "🖥️ Desktop" subtitle), posted by the "E2E videos"
workflow ([docs/hosting.md](../../docs/hosting.md), "E2E videos on pull requests").

It is destiny-loopsmith's
[Loopsmith.VsCodeExtension.E2E](https://github.com/JoanComasFdz/destiny-loopsmith/tree/main/tests/Loopsmith.VsCodeExtension.E2E)
for BaconReader's scenarios: one release, `prs-resources`, and the phone's and the desktop's screens.

## Run and record

`tools/e2e/record.sh` runs them with the app's scenarios (its header says how to choose); they need no phone:

```bash
tools/e2e/record.sh --no-video Recordings             # this project's scenarios, unrecorded: the fast run while developing
tools/e2e/record.sh --no-video CodeLensTests          # one class
tools/e2e/record.sh --changed-since origin/<base>     # recorded: out/Recordings/<scenario>-desktop.gif + .mp4, right before a push
```

For this project it:
1. installs VS Code for the web's runner once (`npm ci` in `vscode-web/`: `@vscode/test-web`, pinned in
   `vscode-web/package-lock.json`; its `node_modules/` is never committed);
2. serves VS Code for the web, the build `vscode-web/package.json`'s `config.vscodeCommit` names (1.142.0; downloaded
   once into `${E2E_VSCODE_CACHE:-~/.cache/baconreader/vscode-web}`), with the extension under development (the folder
   `tools/vscode-extension`, as it is: the extension has no build) and opened on `Workspace/`;
3. runs the scenarios with `E2E_VSCODE_URL` set to it (and `E2E_VIDEO_DIR` when recording), and makes each run's GIF and
   MP4, trimmed from when VS Code's workbench showed (the e2e tool's `find-home`).

`--changed-since` picks every scenario of this project when the extension (`tools/vscode-extension`) or a file of
`Workspace/` changed. Without `E2E_VSCODE_URL` the scenarios are skipped, so `dotnet test` runs only their checks that
need no browser (`ScenarioShapeTests`, `AssetNamingTests`). The extension's own logic has unit tests too:
`node --test tools/vscode-extension/test/*.test.js`.

The browser is the Chromium the cloud image ships in `/opt/pw-browsers` (`PLAYWRIGHT_BROWSERS_PATH`), which the pinned
`Microsoft.Playwright` (`Directory.Packages.props`) drives; the dev container installs the same build
([.devcontainer/README.md](../../.devcontainer/README.md)).

To update VS Code: set `config.vscodeCommit` and `config.vscodeVersion` in `vscode-web/package.json` to a stable build's
(`https://update.code.visualstudio.com/api/update/web-standalone/stable/latest` names the latest); to update the runner,
`npm install --prefix tests/BaconReader.VsCodeExtension.E2E/vscode-web @vscode/test-web@<version>`.

## Where tests go

`Scenarios/<domain folder>/<Topic>Tests.cs`, by what the developer does with the extension: `Recordings/` (seeing a
scenario's recordings: `CodeLensTests`, `PlayHereTests`, `RecordingPanelTests`, `RefreshTests`). The domain folder is the
namespace after `.Scenarios.`, and the folder their GIFs go in under `out/`: a new one must not take an app domain
folder's name (`Startup`, `LoggedIn`).

## The fake GitHub and the workspace

No scenario reaches GitHub. `Infrastructure/Fakes/FakeGitHub.cs` answers the extension's requests for the release
(`prs-resources`) with the recordings the scenario's Given put there, named as the workflow names them, and their
downloads with the cards in `Infrastructure/Fakes/Media/` ("Phone" / "Desktop", "fake e2e recording": small GIFs, and
MP4s in VP9, which the image's Chromium plays; the real recordings are H.264, which only Chrome and VS Code's own builds
play). `Workspace/` holds the scenario files the scenarios open: copies of app scenarios cut short, a file that isn't a
scenario file, and a desktop scenario whose asset names pass 200 characters.

## Isolation and parallelism

Each scenario gets its own browser context (VS Code keeps its state in the context's IndexedDB) and its own fake GitHub,
so scenarios share nothing and run in any order. Two run at a time (`xunit.runner.json`): VS Code for the web is heavy.
