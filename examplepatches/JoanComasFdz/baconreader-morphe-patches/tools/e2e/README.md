# E2E tools

The scripts that record the e2e scenarios (the app's on the phone, the VS Code extension's in VS Code for the web)
and post them on a PR ([docs/hosting.md](../../docs/hosting.md), "E2E videos on pull requests").

- `record.sh`: plays and records the scenarios a PR added or changed and writes `out/<domain folder>/<gif name>.gif` and
  `.mp4` and `out/scenarios.json`, with the e2e tool's `write-scenarios` (below).
- `push-gifs.sh`: pushes those recordings to a throwaway `e2e-gifs/pr-<n>-<sha>` branch, which
  `.github/workflows/e2e-videos.yml` posts on the PR with the e2e tool:

  ```bash
  tools/e2e/push-gifs.sh [<PR number>] [--out <dir>] [--message <what changed>] [--dry-run]
  ```

  `--out` is `out/` by default. The PR is the branch's open one when `gh` reaches GitHub's API; otherwise (a cloud
  session whose proxy refuses it) the number is required and isn't checked (the workflow's check job checks it). The
  branch's head must already be on GitHub. Exit codes: 0 pushed (or nothing to push: an empty `scenarios.json`, or a dry
  run), 1 the branch isn't pushed / is behind, no open PR, or the `e2e-gifs/…` branch already exists, 2 a bad argument,
  no PR number without a working `gh`, or no `scenarios.json`.

## The e2e tool

`BaconReader.E2ETools` (.NET) posts a PR's recorded scenarios and cleans `prs-resources` when the PR closes; it also does
the steps the scripts hand it. Either run it with `dotnet run`, or build it once and run the DLL (what `record.sh` should
do, so each step doesn't build again):

```bash
dotnet run --project tools/e2e/BaconReader.E2ETools -c Release -v q -- <command> ...
# or
dotnet build tools/e2e/BaconReader.E2ETools -c Release --nologo -v q
dotnet tools/e2e/BaconReader.E2ETools/bin/Release/net10.0/BaconReader.E2ETools.dll <command> ...
```

Every command prints its results on stdout and its errors on stderr, and exits **0** when it did its job, **1** when it
couldn't (the error says why) and **2** for a command line it doesn't take (the error shows the usage).

### `post` (the workflow)

```bash
... post --pr <n> --commit <sha> [--out <dir>] [--repo <owner/repo>] [--dry-run]
... post --pr <n> --closed [--merged] [--repo <owner/repo>] [--dry-run]
```

Uses the `gh` CLI (`GH_TOKEN`) on `--repo` or `GITHUB_REPOSITORY`. The first form uploads `<out>/scenarios.json`'s
GIFs and MP4s (`--out` is `out` by default; the workflow passes `e2e-gifs`) to `prs-resources`, creating that
pre-release if it doesn't exist, posts the next `## ✅ Scenarios (V<N>)` comment and collapses and hides the earlier ones.
The second keeps only the PR's newest version in `prs-resources` and shrinks its older posts (`--merged` is only logged:
a merged PR and one closed without merging are cleaned alike). `--dry-run` prints what it would upload, create, post,
edit, hide or delete instead of doing it (it still reads from GitHub).

### `write-scenarios` (`record.sh`, after the recording)

```bash
... write-scenarios <out dir> <selection.tsv> [<record.json> ...]
```

- `<out dir>`: an existing folder; the tool writes `<out dir>/scenarios.json` there (replacing it). It doesn't create
  the folder, and checks no GIF or MP4: `record.sh` must have made them at the paths below.
- `<selection.tsv>`: an existing file, possibly empty, saying why each class was picked (`--changed-since`). One line
  per reason, tab-separated, the class being the scenario class's simple name (the record's `class`):

  ```text
  <Class>	changed
  <Class>	fixtures	<path of a changed fixture file, relative to its project>
  ```

  A class with a `changed` line, or with no line at all (named on the command line), is `"selected": "changed"`; a
  class with only `fixtures` lines is `"selected": "fixtures"` with those paths, sorted, each once. Empty lines and any
  other lines are ignored.
- `<record.json> ...`: zero or more records, one per recorded run, in the order `scenarios.json` should list them.
  Each is a `ScenarioRecording` (`tests/BaconReader.E2E.Shared/ScenarioRecording.cs`) serialized camelCase:

  ```json
  {"domain": "Account", "class": "SpoofClientTests", "method": "OpensTheFrontPage", "title": "Opens the front page",
   "gherkin": "@phone\nScenario: Opens the front page\n...", "screen": "phone", "gif": "opens-the-front-page-phone",
   "patches": ["Spoof client"], "homeShownSeconds": 4.31, "passed": true}
  ```

  `domain`, `class`, `method`, `title`, `screen`, `gif` (the GIF's name, no folder, no extension) and `passed` are
  required; `gherkin`, `patches` and `homeShownSeconds` may be missing or null.

It writes `scenarios.json`, one entry per record, and prints the summary:

```json
[
  {
    "domain": "Account",
    "class": "SpoofClientTests",
    "method": "OpensTheFrontPage",
    "title": "Opens the front page",
    "gherkin": "@phone\nScenario: Opens the front page\n...",
    "patches": ["Spoof client"],
    "screen": "phone",
    "gif": "Account/opens-the-front-page-phone.gif",
    "mp4": "Account/opens-the-front-page-phone.mp4",
    "startupSeconds": 4.3,
    "passed": true,
    "selected": "changed"
  }
]
```

```text

Scenarios:
  passed     startup 4.3 s  Account/opens-the-front-page-phone.gif
  FAILED   app never shown  Comments/ShowTables/shows-a-table-phone.gif  (re-recorded: Fixtures/x.json changed)
```

`gif` and `mp4` are `<domain>/<gif>.gif` and `.mp4`, relative to `<out dir>`: where `record.sh` converts each run's
video to. `startupSeconds` is `homeShownSeconds` to a tenth (null when it was). A re-recorded entry has
`"selected": "fixtures"` and `"fixtures": [...]` instead. No records writes `[]`. Exit codes: 0 written (also when
runs failed: `record.sh` checks `"passed": false` in `scenarios.json` itself), 1 a record that can't be read or lacks a
required field (the error names the file), a selection file that can't be read, or `scenarios.json` that can't be
written, 2 fewer than two arguments.

### `report-runs` (`record.sh --no-video`)

```bash
... report-runs <results.trx> [<results.trx> ...]
```

Reads the TRX files `dotnet test --logger "trx;LogFileName=<name>.trx"` wrote (the scenarios write no record when
nothing is recorded) and prints each run, by name, with its result and time:

```text

Runs (unrecorded):
  skipped    0.0 s  <test name>
   passed   12.3 s  <test name> [📱 Phone]
   FAILED   62.0 s  <test name> [📱 Phone]
```

Exit codes: 0 at least one run passed or failed (a failed run doesn't fail it: `dotnet test`'s own exit code says
that), 1 a file is missing ("No test results were written (x.trx).") or isn't a TRX file, or no run passed or failed
("No scenario ran.": none matched the filter, or all were skipped), 2 no file given.

### `list-files` (`push-gifs.sh`)

```bash
... list-files <scenarios.json>
```

Prints the files `scenarios.json` lists, relative to its folder, one per line, each once: each entry's `gif`, then its
`mp4`. Nothing for `[]`. Exit codes: 0 listed, 1 the file can't be read or isn't a JSON array, 2 not exactly one
argument.

### `free-port`, `vscode-commit`, `find-home` (`record.sh`, the VS Code extension's scenarios)

```bash
... free-port
... vscode-commit <package.json>
... find-home <record.json>
```

- `free-port` prints a free local TCP port, for VS Code for the web.
- `vscode-commit` prints the VS Code build a runner's `package.json` pins (`config.vscodeCommit`:
  `tests/BaconReader.VsCodeExtension.E2E/vscode-web/package.json`).
- `find-home` prints `<domain> <gif> <screen> <second>` for a browser run's record: the second its video
  (`<name>.webm`, next to the record) first looks like the screenshot of VS Code's workbench the test took
  (`<name>.home.png`; ffmpeg's SSIM, `HomeFinding`), or the record's `homeShownSeconds` without a screenshot.
  `record.sh` trims the video there.

Exit codes: 0 printed, 1 the file can't be read (or ffmpeg can't read the video), 2 a bad command line.

### `pack-vsix` (the dev container)

```bash
... pack-vsix <extension folder> <license> <.vsix>
```

Zips `tools/vscode-extension` into a `.vsix` as vsce lays one out (`VsixPacking`): `extension/` with `package.json`,
`extension.js`, `README.md` and the license as `LICENSE.txt`, then `vsix/extension.vsixmanifest` and
`vsix/Content_Types.xml` at its root, replacing the `.vsix` there.
`.devcontainer/6-install-e2e-recordings-extension.sh` runs it. Exit codes: 0 packed, 1 a file can't be read or the
`.vsix` written, 2 a bad command line.

## The projects

- `BaconReader.E2ETools`: the e2e tool's host. It reads `scenarios.json`, the recordings and the files the scripts name,
  and calls `gh` and `git` (`Hosting/`): posting (`ScenarioPosting`), closing (`PrClosing`) and the scripts' steps
  (`RecordingSteps`).
- `BaconReader.E2ETools.Core`: its logic, pure: the post (`PostWriting`), its versions and what becomes of the earlier
  ones (`PostVersioning`: collapsed, hidden, shrunk), the assets' names (`ReleaseNaming`, mirrored by
  `site/e2e-player.html`), what `prs-resources` keeps when a PR closes (`ReleaseCleaning`), what to upload
  (`UploadPlanning`), "What changed" (`CommitDescribing`), the unrecorded runs' table (`RunReporting`),
  `scenarios.json` (`ScenarioListing`), where a browser video starts (`HomeFinding`), the `.vsix`'s layout
(`VsixPacking`), the JSON it reads and sends (`JsonReading`), the command lines
  (`CommandReading`, `OptionsReading`) and its own `Optional`/`Result` (`Functional.cs`).
- `BaconReader.E2ETools.Tests`: their tests (CI runs them). An architecture test keeps Core free of I/O and the host free
  of any other project, so the workflow builds the tool in seconds.
