# Contributing & Version Control Standard

This repository is held to a stricter standard than an ordinary application, for three reasons:

1. **The release artifact is a binary** (`.mpp`, `.mpe`) that other people install. A release has to
   be reproducible from its tag — otherwise nobody can tell which bundle someone is actually
   running when something goes wrong.
2. **Patches attach to the bytecode of one APK version.** One anchor moves and the patch either
   fails, or — worse — "succeeds" without doing anything.
3. **Several files here are generated** (`patches-list.json`, `patches-bundle.json`, `CHANGELOG.md`,
   the version in `gradle.properties`, the patch table in `README.md`). Edit them by hand and the
   next release breaks.

So: every change must be traceable to evidence, and no one edits release history.

## 1. Branch model

There is one working branch. Changes are committed straight to `dev`; there is no per-change
branch and no pull request for one.

| Branch | Holds | Who writes to it |
|---|---|---|
| `main` | stable releases | only through a merge from `dev` |
| `dev` | day-to-day integration, pre-releases | direct commits |

- Start: `git switch dev && git pull origin dev`.
- `main` **never** takes a direct commit. The `dev → main` merge is opened automatically as a PR by
  `.github/workflows/open_pull_request.yml` whenever `dev` is pushed; merging it is the stable
  release.
- Do not: force-push `main` or `dev`, squash-merge, rebase a pushed branch, or amend a released
  commit. Release commits are written by semantic-release; rewriting one makes the next release
  compute the wrong history.
- Never push to `main`; it changes only through the `dev → main` merge.

## 2. Commit convention

`type(scope): summary` — Conventional Commits. The release effect is configured in `.releaserc`:

| type | effect |
|---|---|
| `feat` | minor |
| `fix`, `perf`, `bump` | patch |
| `build` with scope `Needs bump` | patch |
| `chore`, `build`, `docs`, `refactor`, `test` | no release |

- **The scope is optional.** When it is written, it names the app and the patch, `TikTok/Custom
  font`, matching the directory under `patches/tiktok/customfont/`. The changelog renders it as a
  bold prefix, so `fix(TikTok/Download):` reaches a user as `* **TikTok/Download:** ...`. A commit
  without one reaches them as a bare sentence, which is fine when the subject already says which app
  and which surface it is about.

Summary rules:

- The summary says **what changes for the user**, not "fix bug" or "update".
- **A new patch** reads ``Add `Patch name` patch``. A switch or option inside a patch that already
  exists reads ``Add "setting name" setting`` or ``Add "option name" option``.
- **A bug fix names the symptom, not the fix.** The reader wants to know whether the thing they
  reported is gone, so the summary is the defect: a noun phrase (`Wrong flyout drawable`) or a
  negative sentence (`Music videos do not play at 1x speed`). The repair goes in the body.
- **A new app version** reads ``Add support for `47.2.0` `` or, when untested,
  ``Add experimental support for `47.2.0` ``.
- Anything that fits none of those is still allowed, but it reads as prose in the changelog, so
  prefer the closest pattern above.

| type | summary |
|---|---|
| `feat` | ``Add `Custom font` setting`` · ``Add "Hide ads" to the feed`` |
| `fix` | `Screen draws under the system bars` · `Segments may not load for some versions` |
| `bump` | ``Add support for `47.2.0` `` |
| `perf` | a symptom, like `fix`: what was slow or heavy before |

Other message rules:

- One commit, one reason. Keep a behaviour change, an anchor change, docs and tooling in separate
  commits — a reviewer has to judge them apart, and the changelog is generated from this.
- Use the commit body when the decision is not obvious from the summary: what was tried, what
  happened, what is still unproven.
- **A revert is a commit, not a message about a commit.** `Revert "feat: something"` and
  `Reapply "feat: something"` are not Conventional Commits: the analyzer reads the type as `Revert`
  or `Reapply`, finds neither in the release rules, and so publishes nothing. Worse, it treats the
  original `feat` as cancelled and the pair as a single no-op, which silently left a feature in the
  bundle that no release ever asked for. To undo a pushed commit, run `git revert` and let it write
  `revert(scope): ...`; to bring it back, make a new `feat`. Never hand-write a subject that quotes
  another commit's.

## 3. Gates before a commit

On NixOS the toolchain is one command: `nix develop`, or `direnv allow` once and the shell loads on
entry. `flake.nix` pins Temurin 21, Node LTS, Python 3 and the helpers the gates use; the Gradle
wrapper still owns Gradle, and the Android SDK still comes from `local.properties`.

Run what applies, and keep the output in the commit body:

| Changed | Command | What it proves |
|---|---|---|
| anything | `./gradlew buildAndroid` | the bundle still builds |
| patches / extensions | `tools/mppcheck/run.sh patches/build/libs/patches-*.mpp` | every class in the bundle loads (no missing runtime dependency) |
| anchors / hooks / fingerprints | `tools/dexprobe/run.sh VerifyAnchors "<apk>"` | the anchors still exist and are still unique. When one fails, [docs/anchor-stability.md](docs/anchor-stability.md) says what each anchor is, why it was chosen, and what the patch does when it is gone |
| runtime behaviour | test on a device, copy the `TIKTOK_HANDLE` lines | the claim actually happened |
| code / docs | `graphify update .` | the graph is not stale |

A behaviour change is **not** done without a device log line, or a written statement of why it could
not be tested yet.

## 4. What to check before committing

- **English throughout.** Code, comments, documentation, log messages and commit messages are in
  English, so that anyone reading a file — including whoever picks up a bug report months later —
  can follow it. The one exception is quoted user-visible text from an app or a device log.
- **Structural anchors, not obfuscated names.** Match from the signature or the invoked call, never
  from a method or class name; those change with every build.
- **No baked registers or ids.** Use `requireLocals`/`requireRegisters` with
  `getFreeRegisterProvider`/`findFreeRegister`; resolve resource ids at runtime instead of writing a
  number.
- **Fail hard, never silently.** An unexpected anchor shape throws `PatchException`. A patch that
  "succeeds" without doing anything costs more than a patch that fails the build.
- **The extension is defensive at the system boundary** and logs every decision branch — succeeded,
  no data, did not match — not only the success.
- **Evidence, not claims.** Gate output, or the device log lines.

## 5. Release flow

1. Push to `dev` → semantic-release publishes a **pre-release** (`vX.Y.Z-dev.N`). That is the
   channel users opt into by enabling *pre-release* in Morphe Manager, so a pre-release is a
   published artifact even though it is not the stable one.
2. Merge the `dev → main` PR (opened automatically) → **stable release**: tag, GitHub release, the
   `.mpp` attached as an asset, then an automatic backmerge `main → dev`.
3. If a release is broken: **add a fix commit** through `dev`. Do not rewrite history.

Releases are driven by `release.yml` and `.releaserc`. If something custom is needed, change those
two — do not write a separate release script beside them, and do not move the work into a manual
process.

Never, for any reason:

- create a GitHub release by hand,
- edit `CHANGELOG.md`, `patches-list.json`, `patches-bundle.json`, the version in
  `gradle.properties`, or the `<!-- PATCHES_START -->` section of `README.md` — `.releaserc` and
  `release.yml` write all of them,
- force-push a release commit.

## 6. What belongs in the repository

**Commit:** patch sources (`patches/src`), extensions (`extensions/*/src`), the verification harness
(`tools/`), `docs/`, this file, the Gradle wrapper, `gradle/libs.versions.toml`, workflows,
`.releaserc`, `package.json` and `package-lock.json`.

**Never commit:**

| Path | Why |
|---|---|
| `keystore.jks`, `*.jks`, `*.keystore` | Signing key. If it leaks, anyone can publish releases that look official. Keep it outside the repo, or in a CI secret. |
| `*.apk`, `*.idsig` | Third-party APKs and patched output: hundreds of MB, and copyrighted. |
| `*.log`, `result.txt` | Device dumps. Attach a summary of the lines that matter, not the raw file. |
| `**/build/`, `.gradle/`, `node_modules/` | Build output. |
| `graphify-out/` | Local graph cache (3 MB+) that regenerates on every change and will conflict if two people run it. Rebuild with `graphify extract .`; the only part worth sharing is `GRAPH_REPORT.md`. |
| `local.properties`, `gradle.local.properties` | SDK paths and local credentials. |

**Assistant and agent flow stays local and ignored.** Instructions written for a coding assistant
(`AGENTS.md`), its configuration and learned preferences (`.commandcode/`), its caches and context
graphs (`graphify-out/`), and `.agents/` or tool-specific directories (`.claude/`, `.cursor/`) are
working files for one machine. They are not part of the shared standard, they are not reviewed, and
they are not committed. Anything a teammate needs to know belongs in this file or in `docs/`.

Housekeeping note: `.gitignore` carries a `./gradle.properties` line that has no effect — that file
**is** tracked and has to be, because the release plugin writes the version into it. The line should
be removed so it does not mislead; if the intent was to keep a token out of the repository, use a
different file name (`gradle.local.properties`) or an environment variable.

## 7. Evidence-based workflow

Work that touches bytecode or on-device rendering follows this order, without skipping steps:

1. **State a hypothesis**, and what would prove it wrong.
2. **Verify offline first** with the APK probes (`tools/dexprobe`, `tools/smaliprobe`). Far cheaper
   than one patch-install-look cycle.
3. **Add logging** when the outcomes cannot be told apart on screen: every decision branch, capped
   in volume.
4. **Build and run the gates** (section 3).
5. **Test on a device and read the log**, then conclude. If the log does not contain the evidence
   being looked for, the next step is to improve the logging — not to guess.
6. **Write down what is still unproven**, in the commit body and in `docs/`.

## 8. Quick reference

| Change | Branch | Commit | Gates | Release |
|---|---|---|---|---|
| behaviour fix in a patch | `dev` | `fix(...)` | build, mppcheck, VerifyAnchors, device log | patch |
| new patch or surface | `dev` | `feat(...)` | plus updated VerifyAnchors | minor |
| support for a new APK version | `dev` | `feat(...)` / `bump(...)` | VerifyAnchors against the new APK | minor / patch |
| docs, tools, CI | `dev` | `docs(...)`, `chore(...)` | build | none |
| stable release | merge `dev → main` | (written by semantic-release) | CI | stable |
