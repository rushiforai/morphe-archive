<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->

# BaconReader Morphe e2e recordings (VS Code extension)

Shows each e2e scenario's recordings next to its code, in VS Code. A scenario is a method with a
`[TestDescription("""…""")]` in a `Scenarios/**/*Tests.cs` file: the app's (`tests/BaconReader.E2E`, played on the
phone) and this extension's own (`tests/BaconReader.VsCodeExtension.E2E`, played on the desktop). Its recordings are the
GIFs and MP4s the "E2E videos" workflow keeps in the `prs-resources` release
([docs/hosting.md](../../docs/hosting.md), "E2E videos on pull requests").

- **CodeLens** above the scenario's method, between its attributes and its declaration (next to other extensions'
  CodeLens, such as C# Dev Kit's "0 references"): `Play phone recording | PR #41 · V1`, a "Play" for each screen of its
  newest recording (the highest PR, then its highest version), or `No recording yet`.
- **Panel** beside the editor, opened by "Play … recording": the Gherkin's title, its class, domain folder, PR and
  version, a tab per screen (**Phone**, or **Desktop**), the MP4 with the browser's controls (the GIF when the run has
  no MP4, or when this VS Code can't play it), **Recorded in** with every PR and version of the scenario, newest first,
  and **Open in e2e player ↗** (the site's `e2e-player.html`).
- **Play e2e recording of this scenario**: the ▷ button in the editor's title bar of a scenario file, and **BaconReader
  Morphe: Play e2e recording of this scenario** in the Command Palette, open the panel on the scenario the cursor is in
  (the file's first one when the cursor is above them all), on its first screen.
- **BaconReader Morphe: Refresh e2e recordings** (Command Palette) reads the release again: a recording posted after the
  files were opened shows up. The release's read is also renewed when it is ten minutes old.

It finds a scenario's assets by their names: `pr-<n>-v<version>-<GIF name>.gif` / `.mp4`, the GIF name being the
method's name kebab-cased (Humanizer's rules) and its screen (`[PlayOnPhone]` → `-phone`, `[PlayOnDesktop]` →
`-desktop`), shortened with a hash past 200 characters (`tools/e2e/BaconReader.E2ETools.Core/ReleaseNaming.cs`,
`NameAsset`). It reads the release from GitHub's API (two requests and one per 100 assets): 60 requests an hour without
a sign-in, 5,000 with one. It asks VS Code for a GitHub sign-in silently, never with a prompt: VS Code hands an extension
a sign-in only once you have let it use one, so until then it reads the release without one. To let it, run
**BaconReader Morphe: Sign in to GitHub to read e2e recordings** once (or click **Sign in to GitHub** on the CodeLens,
which shows when the hourly limit is used up) and pick your account; from then on it uses it without asking.

## Install

### Codespaces and Dev Containers: already installed

The repository's dev container (`.devcontainer/`) installs the extension from this folder each time VS Code attaches to
it (`6-install-e2e-recordings-extension.sh`: it packs the `.vsix` with the e2e tool's `pack-vsix` and installs it with
VS Code's own CLI), so there is nothing to install: no Marketplace, no download. The extension is always the checkout's
own, so a branch's Codespace runs that branch's extension
([.devcontainer/README.md](../../.devcontainer/README.md) says what else the container has).

- **GitHub Codespaces:** on the repository's page, **Code** → **Codespaces** → **⋯** → **New with options…**, pick the
  branch, then **Create codespace** (a 4-core machine at least). Creating it takes a few minutes the first time.
- **Desktop VS Code** (with Docker on your computer and the Dev Containers extension): open a clone, then **Dev
  Containers: Reopen in Container**.

Once the container's setup has finished (its terminal says so), the Extensions view lists **BaconReader Morphe e2e
recordings**. If a scenario file shows no CodeLens yet, run **Developer: Reload Window** once. In a Codespace, VS Code
may already have your GitHub sign-in, so the extension can read the release with it from the start.

The same `.vsix` installs in any desktop VS Code: `.devcontainer/6-install-e2e-recordings-extension.sh --pack-only
<file>.vsix` packs it, then **Extensions: Install from VSIX…**. Both BaconReader patches repos have one, each with its
own name, commands and settings, so both install side by side.

## Settings

- `baconreaderMorphe.e2eRecordings.repository`: the repository whose release holds the recordings
  (`JoanComasFdz/baconreader-morphe-patches`).
- `baconreaderMorphe.e2eRecordings.release`: the release's tag (`prs-resources`).

## Develop

One file, `extension.js`: no build, no dependencies (VS Code loads it as it is, in a browser and on the desktop). Its
pure functions come first and are unit-tested: `node --test tools/vscode-extension/test/*.test.js`. How it behaves in
VS Code is checked by the e2e scenarios of `tests/BaconReader.VsCodeExtension.E2E` (its README), played in VS Code for
the web. `vsix/` holds the `.vsix`'s manifest; keep its name, publisher, version and display name in step with
`package.json` (the unit tests check them).

This folder is the same in both BaconReader patches repos but for the patcher's name: `extension.js`
reads its commands' and settings' prefix from `package.json` (`e2eRecordings.prefix`), and the "Shared VS Code
extension" workflow fails when the two differ in anything else
([AGENTS.md](../../AGENTS.md), "Shared and patcher-specific files").
