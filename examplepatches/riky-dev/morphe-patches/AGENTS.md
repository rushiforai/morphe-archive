# Agent guide — Morphe patch development

Fork this repo to build your own Morphe patch bundle. **Scripts are tools, not a pipeline.** You point the agent at an app, list patch goals, and it researches bytecode, implements patches, and verifies locally before optional device testing.

## Goal

Figure out what bytecode to change in a target app, implement Morphe patches in Kotlin, build a `.mpp` bundle, and verify it applies cleanly.

## AI agent workflow

**Mandatory first step:** run `scripts/init_session.sh <app_id>` (or resume from existing `scratch/<app_id>/session.md`).

Cursor users: the [morphe-patch-workflow](.agents/skills/morphe-patch-workflow/SKILL.md) skill points here. Any agent can follow this section alone.

### Scratch workspace (`scratch/<app_id>/`)

Gitignored session state — survives context compaction within a workspace:

| File | Purpose |
|------|---------|
| `session.md` | Goals, acceptance criteria, progress (read SESSION HEADER first) |
| `hypotheses.md` | H1/H2/… with CONFIRMED / REJECTED / FIXED |
| `analysis-notes.md` | Class summaries — **read before re-opening smali** |
| `device-profile.yaml` | Device specs + cached nav coords |
| `ui-dump.xml` | Latest uiautomator dump (optional) |

Templates: [docs/templates/](docs/templates/). Deep retrospective: [docs/agent-device-workflow.md](docs/agent-device-workflow.md).

### Phase 0 — Environment (once per device)

```bash
scripts/check_env.sh
scripts/init_session.sh <app_id> --goal "your first patch goal"
```

Capture device info into `scratch/<app_id>/device-profile.yaml`:

```bash
adb devices -l
adb shell wm size          # → screen_size
adb shell wm density       # → density
adb shell getprop ro.product.model
```

Skip re-fetch/decompile if `analysis/<app_id>/jadx_out/` already exists.

### Phase 1 — Research (tiered gate)

**Fast path** — goal matches an existing patch pattern in this repo (e.g. `isPremium` → `const/4 v0, 0x1`):

1. `rg` for target method in `analysis/<app_id>/`
2. Read method body only
3. Short hypothesis in `hypotheses.md` (5 lines OK)
4. Write `analysis-notes.md` entry with **source path + method + line range**

**Full path** — novel bug or unclear root cause:

1. Write hypotheses to `scratch/<app_id>/hypotheses.md`
2. Investigate **one hypothesis at a time**
3. **No Kotlin edits** until one hypothesis is **CONFIRMED** with a specific fix strategy
4. Delegate surveys of 10+ files to a research subagent

### Phase 2 — Implement (one new patch per verify cycle)

1. Edit ONE new patch (+ fingerprints) under `patches/src/main/kotlin/app/riky/patches/<app_id>/`
2. `scripts/build.sh`
3. `scripts/verify_patch.sh <app_id>`
4. `scripts/check_patched_apk.sh` when `verify.smali_assertions` exist in config
5. Add smali assertions to config as you learn what changed

Study the reference: [patches/.../meteo3b/](patches/src/main/kotlin/app/riky/patches/meteo3b/).

When all goals are done: full bundle verify once more.

### Phase 3 — Device test (tiered — only when required)

Device testing is **not** mandatory for every goal. Check acceptance criteria in `session.md`:

- **Required:** crash fixes, regressions, UI behavior verification
- **Optional:** pure bytecode spoofs fully covered by smali assertions

When required:

```bash
scripts/patch_local.sh <app_id>
scripts/device_deploy.sh <app_id>
# navigate (see UI navigation below)
scripts/device_smoke.sh <app_id>    # omit --screenshot unless visual check needed
```

On failure: capture logcat evidence, update hypotheses, return to Phase 1.

### UI navigation (text-first)

Fallback chain — never blind tap → screenshot loops:

1. **uiautomator dump** → grep XML → compute tap center from bounds
2. **`device.nav` hints** in `config/apps/<app_id>.yaml`
3. **Cached coords** in `device-profile.yaml`
4. **Screenshot** — one per verification step, last resort only
5. **Stop** — report manual nav needed

```bash
adb shell uiautomator dump /sdcard/ui.xml
adb pull /sdcard/ui.xml scratch/<app_id>/ui-dump.xml
rg -i "pattern" scratch/<app_id>/ui-dump.xml
# bounds="[x1,y1][x2,y2]" → tap ((x1+x2)/2, (y1+y2)/2)
adb shell input tap X Y
```

### Token rules

1. **Write notes, don't re-read** — summarize each class in `analysis-notes.md`; re-read source only if verify fails
2. **Hypothesis-driven** — one active hypothesis at a time
3. **uiautomator before screenshots**
4. **Don't poll background shells** — wait for completion notification
5. **Local verify before device deploy**

### Session kickoff (what the user provides once)

```markdown
## Patch goals
1. [ ] Hide banner ads
   - Local done when: smali assertion on BannerManager
   - Device done when: smoke OK (or local-only if acceptable)
   - Limitations: none
```

## Quick reference

| Tool | Command |
|------|---------|
| **Start session** | `scripts/init_session.sh <app_id> [--goal "..."]` |
| Environment check | `scripts/check_env.sh` |
| Download app | `scripts/fetch_apk.sh <app_id>` |
| Extract bundle | `scripts/extract_apk.sh <app_id>` |
| Decompile | `scripts/decompile.sh <app_id>` |
| Analysis hints | `scripts/analyze.sh <app_id>` |
| Build `.mpp` | `scripts/build.sh` |
| Verify patch | `scripts/verify_patch.sh <app_id>` |
| Check patched APK | `scripts/check_patched_apk.sh <apk> <app_id>` |
| Setup Morphe CLI | `scripts/setup_tools.sh` |
| Patch APK locally | `scripts/patch_local.sh <app_id>` |
| Deploy to device | `scripts/device_deploy.sh <app_id>` |
| Device smoke test | `scripts/device_smoke.sh <app_id>` |
| Full device loop | `scripts/device_test.sh <app_id>` |

Or use the Makefile: `make session-init APP=meteo3b`, `make fetch APP=meteo3b`, etc.

## App configs

Each target app has metadata in `config/apps/<app_id>.yaml`:

- `package` — Android package name
- `apkpure_slug` — used by `fetch_apk.sh`
- `analysis_dir` — where all artifacts live (gitignored)
- `decompile` — optional OOM-safe jadx settings (large APKs)
- `device.nav` — optional UI tap hints (match strings)

Copy `config/apps/_template.yaml` for a new app. Config tells you **where things are**, not **what to patch**.

Example apps in this repo: `meteo3b` (minimal reference), `capcut`, `electron`, `komoot`.

## Sandbox layout

After using the tools, explore freely under `analysis/<app_id>/`:

```
analysis/meteo3b/
├── metadata.txt       # fetch_apk.sh output
├── *.xapk / *.apkm    # downloaded bundle
├── extract/           # unzipped APKs
├── jadx_out/sources/  # Java decompilation — primary exploration target
├── apktool_out/smali/ # smali — useful for bytecode details
└── report.txt         # optional hints from analyze.sh (NOT a patch plan)
```

Use `rg`, read files, trace call chains, compare smali. `analyze.sh` only surfaces common ad/premium/billing patterns as starting leads.

## Adding a new app

1. Copy `config/apps/_template.yaml` → `config/apps/<app_id>.yaml`
2. Add a `Compatibility` entry in `patches/src/main/kotlin/app/riky/patches/shared/Constants.kt`
3. Create `patches/src/main/kotlin/app/riky/patches/<app_id>/` with fingerprints and patches
4. `scripts/init_session.sh <app_id> --goal "..."`
5. Use fetch/decompile/explore scripts — no bash changes needed

## Patch source layout

```
patches/src/main/kotlin/app/riky/patches/
├── shared/Constants.kt          # Compatibility per app
├── meteo3b/                     # Reference example
│   ├── Fingerprints.kt
│   └── HideAdsPatch.kt
└── <your_app>/
    ├── Fingerprints.kt
    └── YourPatch.kt
```

Extensions (`.mpe` Java modules) live in `extensions/extension/` — only needed for runtime logic, not simple bytecode overrides.

### Verify assertions (optional)

When you know what your patches change, add checks:

**In config** (`config/apps/<app_id>.yaml`):

```yaml
verify:
  apk: analysis/example/extract/com.example.app.apk
  smali_assertions:
    - file: com/example/SomeClass.smali
      pattern: 'const/4 v0, 0x1'
      label: someMethod
  assertions:
    - file: com/example/SomeClass.java
      pattern: 'return true;'
      label: someMethod
```

**On CLI:**

```bash
scripts/verify_patch.sh meteo3b \
  --assert 'com/.../BannerManager.java' 'return "none";' evaluateProvider
```

Without assertions, verify only checks that patches apply without fingerprint errors.

## Release rules

Dual-branch flow matching the Morphe patches template: preview on `dev`, stable on `main`.

- Develop and preview on `dev`; `feat:` / `fix:` / `bump:` pushes publish GitHub **prereleases** (e.g. `v1.1.0-dev.1`)
- Ship stable by merging `dev` into `main` with a **merge commit** (do not squash)
- After a stable release, semantic-release **backmerges** `main` → `dev` automatically
- Use [conventional commits](https://www.conventionalcommits.org/) (`feat:`, `fix:`, `bump:`; `chore:` does not release)
- Version bumps: **minor** for a new app/patch (`feat:`), **patch** for fixes/app-version support (`fix:` / `bump:`), **major** only for breaking consumer changes (`feat!:` / `BREAKING CHANGE`) — not one major per app
- **Never hand-edit** `patches-list.json`, `patches-bundle.json`, or `CHANGELOG.md` — semantic-release generates them
- CI runs `./gradlew :patches:buildAndroid` on non-release pushes
- Users pick up prereleases by enabling **pre-release** for this source in Morphe Manager

## License and attribution

Fork of [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template). GPL-3.0 — see `LICENSE` and `NOTICE`.

- Credit Morphe contributors for template-derived tooling; credit modifications in `NOTICE` / README
- Product name: **riky's patches** (distinct from Morphe itself; see `NOTICE` branding rules)
- Erasing git history is fine for GPL if distributed source keeps notices and states modifications

## Prerequisites

Run `scripts/check_env.sh` when something fails. Requires:

- JDK 17+ (`JAVA_HOME`)
- GitHub Packages auth (`gpr.user` / `gpr.key` in `~/.gradle/gradle.properties`, or `GITHUB_ACTOR` + `GITHUB_TOKEN`)
- `ANDROID_HOME` (for extension builds)
- `curl`, `unzip`, `rg`, `jadx`, `apktool`, `python3`, `adb`

## Morphe docs

- [Morphe documentation](https://github.com/MorpheApp/morphe-documentation)
- [Morphe development guide](https://github.com/MorpheApp/morphe-documentation/blob/main/docs/morphe-development/README.md) — prerequisites, dev environment setup, fingerprints & patches
- [Morphe Patches template](https://github.com/MorpheApp/morphe-patches-template)
- [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) for manual patching

## Tooling note (MCP)

No MCP server is required. Use shell scripts and adb commands above — they work with any agent. Optional adb MCP is a future opt-in for Cursor-only setups; not part of the core framework.
