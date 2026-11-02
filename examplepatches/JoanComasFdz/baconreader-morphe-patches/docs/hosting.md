# Hosting

## E2E videos on pull requests

Every pull request from a branch of this repository shows the end-to-end scenarios it added or changed
([tests/BaconReader.E2E](../tests/BaconReader.E2E/README.md), the app's, and
[tests/BaconReader.VsCodeExtension.E2E](../tests/BaconReader.VsCodeExtension.E2E/README.md), the VS Code e2e recordings
extension's) as GIFs, each with a **▶ Play MP4** link to the same run as a sharp video with controls, so a reviewer sees
them working without running anything. The session that works the PR records them, the app's on the phone and the
extension's in VS Code for the web; CI records nothing (it can't reach the phone). The extension
([tools/vscode-extension](../tools/vscode-extension/README.md)) plays the same recordings in VS Code, next to each
scenario's code.

- **What is recorded:** each run (a scenario played on the phone, the only phone) from the app's first
  screen on, its last frame held a moment, as a GIF (shown in the comment) and as an MP4 (H.264, playable, seekable and
  full-screen in the player page below). A cloud session reaches the phone at ~1–4 Mbit/s, so the screen is recorded
  small (576 px wide, ~1 Mbit/s). An extension scenario's run is VS Code for the web on the desktop (1280×800, a GIF 800 px
  wide), from when its workbench showed.
- **Who records:** the session, once, right before each push that adds or changes scenarios:
  `tools/e2e/record.sh --changed-since origin/dev` ([tools/e2e/README.md](../tools/e2e/README.md)), i.e. every
  scenario the branch adds or changes from where it left `dev`, not only those the push touched. `out/scenarios.json`
  keeps why each was picked: `"selected": "changed"` (its own file changed, or it was named on the command line), or
  `"selected": "fixtures"` with the changed `"fixtures"` when only a fixture it uses changed. Every scenario passes
  before the push; while developing, the session runs them unrecorded (`record.sh --no-video`) and records again when a
  scenario or a patch changes after the recording and before the push, so the posted GIFs match the pushed head. A PR
  that changes no scenario records and posts nothing.
- **How the GIFs get to GitHub:** a session can't upload a file to GitHub (its proxy lets only JSON request bodies
  through), but it can push. Right after the push (the first one once the PR is open), `tools/e2e/push-gifs.sh <PR>`
  pushes a throwaway branch **`e2e-gifs/pr-<n>-<short sha>`**: the branch's head, already on GitHub, plus one commit
  that adds `e2e-gifs/scenarios.json`, the GIFs and the MP4s (`e2e-gifs/<domain folder>/<gif name>.gif` and `.mp4`),
  and with `--message` `e2e-gifs/what-changed.md`, the post's "What changed". It stops when the head isn't pushed yet or
  that branch already exists, and never touches the working tree. A session whose `gh` can't reach GitHub's API passes
  the PR's number, unchecked there: the workflow checks it. The branch sits on the PR's head, not on an empty history,
  because a push runs the workflow file inside the pushed commit: the PR's own `.github/workflows/e2e-videos.yml`.
- **Why a branch, not a tag:** a session's git proxy refuses tag pushes and GitHub's Git-data API. A push to any branch
  makes GitHub's Pull requests page show a "<branch> had recent pushes · Compare & pull request" banner for about an hour,
  even after the branch is deleted: the accepted cost, ignore it.
- **What the workflow does** (`.github/workflows/e2e-videos.yml`, on a push to `e2e-gifs/**`): it checks the push (the
  name is `e2e-gifs/pr-<n>-<hex>`; PR #n is open and from this repository; the commit sits on a commit of the PR and only
  adds `e2e-gifs/scenarios.json`, `e2e-gifs/what-changed.md`, real GIFs (they start with `GIF8`) and real MP4s (an
  `ftyp` box first)), then the e2e tool (`dotnet run --project tools/e2e/BaconReader.E2ETools -- post … --out e2e-gifs`)
  uploads the GIFs and MP4s and posts them, and the branch is deleted whatever happened (the run's log says why one
  failed). A push that fails the checks uploads and posts nothing. The runner's own .NET 10 SDK builds the tool (it
  needs only its Core, so it builds in seconds); no phone, no ffmpeg.
- **Where the GIFs and MP4s go:** assets of one pre-release, **`prs-resources`**, never committed anywhere. The owner
  creates it once (step 3 of "One-time setup by the owner"), so the workflow only uploads to it. It never gets in the
  bundle's way: GitHub lists releases by their tag's commit, and its tag sits on the repository's first commit, so it
  comes after every bundle release, and Morphe Manager, with pre-releases on, takes the newest `dev` pre-release; and
  it is never the "previous tag" whose commits a bundle release's notes list. A release asset embedded as
  `![title](https://github.com/<owner>/<repo>/releases/download/prs-resources/<name>)` shows inline in GitHub (an MP4
  there only shows as a link, so the comment shows the GIF and links the MP4 to the player page below). Uploads use the
  workflow's `GITHUB_TOKEN` (contents and pull-requests write); no personal token.
- **The player page for MP4s:** GitHub draws a video player only for a video it stored itself, and no markdown can show
  one for an MP4 in a release. The site has a page that plays one:
  **`https://joancomasfdz.github.io/baconreader-morphe-patches/e2e-player.html?v=<asset>`** (`site/e2e-player.html`,
  published to the `gh-pages` branch by `.github/workflows/pages.yml` on every push to `main` or `dev` that changes `site/`), with
  the browser's own controls. `v` is an asset's name only,
  `pr-<n>-v<k>-<run>.mp4` (letters, digits and `-` in `<run>`); the page builds the URL itself,
  `https://github.com/JoanComasFdz/baconreader-morphe-patches/releases/download/prs-resources/<v>`, so it never plays a URL someone
  else chose, and any other `v` shows a short message. Above the video: the scenario's name from `<run>`, a link to PR
  #n, the version, the screen and the release. An asset that can't be loaded shows a message: an older version
  is deleted when its PR closes.
- **Naming:** `pr-<PR number>-v<version>-<run>.gif`, and the same name ending in `.mp4` for its MP4, e.g.
  `pr-12-v1-baconreader-patched-with-spoof-client-opens-phone.gif`.
  - `pr-<n>-` first, so a PR's assets sit together and its cleanup finds them (the dash after the number keeps `pr-7-`
    from matching `pr-70-`);
  - `v<version>`: 1, 2, 3… (no padding), one per `push-gifs.sh`. It is one more than the highest `## Scenarios (V<N>)`
    already in the workflow's comments on the PR (those by github-actions ending with its footer): nothing is stored
    anywhere else, and a reopened PR carries on from its last number;
  - `<run>`: the run's GIF name (`ScenarioNaming.ToGifName`: the scenario's method name in kebab-case, then its screen,
    `-phone`, or `-desktop` for an extension scenario; only a–z, 0–9 and `-`). Only when the whole name would pass 200 characters does it keep its start and end with
    `-<8 hex>`, the start of the SHA-256 of the GIF's path, so it stays unique and the same on every push.
- **The posts:** every version, V1 included, is a new comment on the PR, `## ✅ Scenarios (V<N>) · 12 scenarios`, or
  `## ❌ Scenarios (V<N>) · 12 scenarios · 1 failed` when any scenario failed. It starts with **What changed**:
  `push-gifs.sh --message "<text>"`'s text, word for word, or else the body of the PR head's commit message without its
  trailers, or its subject when it has no body (`--message` travels as a file because a one-paragraph text like
  `AFTER: …` looks like a trailer in a commit message). Each scenario shows once, as a closed `<details>` whose summary
  is its Gherkin's title in bold after ✅ or ❌. Inside it: its Gherkin in a `gherkin` block; a line
  `Patched with: Spoof client, …` naming the patches the app was patched with (none, no line); then a `#### 📱 Phone`
  subtitle (`#### 🖥️ Desktop` for an extension scenario; ❌ before it when that run failed) with the run's GIF, and
  below it **▶ Play MP4**. The GIF and that line
  both link to the player page with that run's MP4 (`https://<owner, lowercase>.github.io/<repo>/e2e-player.html?v=<MP4
  name>`), so a tap on the GIF opens the video instead of downloading the GIF. The scenarios the PR added or changed
  come first; those only re-recorded because a fixture they use changed follow under
  `### Re-recorded: their fixtures changed`, each naming its changed fixtures (with both kinds, the first sits under
  `### Added or changed by this PR`). Every post ends with `---` and `_Recorded by the e2e workflow · Claude Code_`. The
  workflow never touches the PR's description. `tools/e2e/BaconReader.E2ETools.Tests` tests the layout.
- **Earlier versions collapse and are hidden as Outdated:** once a new post is up, the tool edits each earlier post
  still open into a closed `<details>` holding it unchanged, summary **Scenarios (V1)** · 12 scenarios · replaced by V2,
  then hides every earlier post as Outdated (GraphQL's `minimizeComment`, with the workflow's token; a session gets 403
  from GraphQL). An edit or a hide GitHub refuses is a warning in the run's log, never a red run. `--dry-run` prints
  each edit and hide.
- **Failures:** a failing scenario still gets its GIF and its ❌ (the session fixes it before pushing, so it shouldn't
  happen), and never turns the run red. The run is red only when the workflow itself failed: a push that isn't a PR's
  GIFs, or GitHub refused an upload, the release's creation or a post.
- **One post per PR at a time** (the posting job's concurrency group is per PR, never cancelled midway), so two runs
  can't post the same version. GitHub keeps one waiting job per group: a post still waiting when a newer one arrives is
  skipped (its branch is deleted all the same), so push the GIFs once per round.
- **Cleanup:** when the PR is closed or merged, the workflow deletes any `e2e-gifs/pr-<n>-…` branch left behind, then
  runs the base branch's e2e tool, `post --closed` (with `--merged` for a merged PR; both are cleaned alike):
  - `prs-resources` keeps every GIF and MP4 of the PR's newest version and deletes its older versions'
    (`pr-<n>-v1-…` to `pr-<n>-v<N-1>-…`), so the PR's last post keeps showing its GIFs and playing its MP4s for good.
    The newest version is the highest `v<N>`, read as a number. Only names `pr-<n>-v<N>-…` of that PR are ever deleted:
    the owner's own assets and other PRs' are never touched. The job's log names each deleted asset and how many assets
    the release holds.
  - The PR's older posts would open onto broken images, so each is shrunk to one line: **Scenarios (V1)** · 12
    scenarios · replaced by V2 · recordings deleted when the PR closed (its footer kept as a hidden comment, its version
    still counted).
- **The release's limit:** a release holds at most 1,000 assets (a run takes two). The cleanup's log warns above 900.
  Near the limit, the owner creates a new pre-release (e.g. `prs-resources-2`) and points `PrsRelease` in
  `tools/e2e/BaconReader.E2ETools.Core/ReleaseNaming.cs` and `release` in `site/e2e-player.html` at it (or lets the
  workflow create it on the next post). The old release stays, so the posts that embed its GIFs keep showing them; their
  player links look in the new release, so their MP4s no longer play.
- Pull requests from forks are skipped (they never get a write token).

### One-time setup by the owner

1. **Run "Deploy site" once** (Actions → Deploy site → Run workflow), or merge a change under `site/`: it creates the
   `gh-pages` branch. Then **Settings → Pages → Build and deployment → Source: "Deploy from a branch", `gh-pages`,
   `/ (root)`.**
2. **Settings → Actions → General → Workflow permissions → "Read and write permissions"**, so the workflow's token
   can upload to `prs-resources`, comment and delete the `e2e-gifs/…` branches.

3. **Create `prs-resources` once.** The workflow can't: its tag goes on the repository's first commit, which holds
   workflow files, and a workflow's token may never create a ref to such a commit. With `gh` logged in with the
   `workflow` scope (`gh auth refresh -s workflow`), on one line:
   `gh release create prs-resources --prerelease --title prs-resources --notes "<the notes>" --target <the first commit of main> --repo JoanComasFdz/baconreader-morphe-patches`.

Nothing else.
