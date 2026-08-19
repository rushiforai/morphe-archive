# Agent guide — Morphe patch development

This repo is an agent-friendly workspace for building Morphe Android patches. **Scripts are tools, not a pipeline.** You decide what to patch by exploring decompiled sources — nothing here prescribes patch strategy.

## Goal

Figure out what bytecode to change in a target app, implement Morphe patches in Kotlin, build a `.mpp` bundle, and verify it applies cleanly.

## Quick reference

| Tool | Command |
|------|---------|
| Environment check | `scripts/check_env.sh` |
| Download app | `scripts/fetch_apk.sh <app_id>` |
| Extract bundle | `scripts/extract_apk.sh <app_id>` |
| Decompile | `scripts/decompile.sh <app_id>` |
| Analysis hints | `scripts/analyze.sh <app_id>` |
| Build `.mpp` | `scripts/build.sh` |
| Verify patch | `scripts/verify_patch.sh <app_id>` |

Or use the Makefile: `make fetch APP=meteo3b`, etc.

## App configs

Each target app has metadata in `config/apps/<app_id>.yaml`:

- `package` — Android package name
- `apkpure_slug` — used by `fetch_apk.sh`
- `analysis_dir` — where all artifacts live (gitignored)

Copy `config/apps/_template.yaml` for a new app. Config tells you **where things are**, not **what to patch**.

Current apps: `meteo3b` (3B Meteo — reference implementation), `electron` (battery health info).

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

## Workflow (flexible)

Use any tool, in any order, as many times as needed:

1. **Get the app** — `fetch_apk.sh`, `extract_apk.sh`, `decompile.sh` (skip steps if artifacts already exist)
2. **Explore** — roam `jadx_out/` and `apktool_out/`; form your own plan
3. **Study the example** — see `patches/src/main/kotlin/app/riky/patches/meteo3b/`:
   - `Fingerprints.kt` — Morphe `Fingerprint` objects targeting specific methods
   - `HideAdsPatch.kt` — `bytecodePatch` with smali `addInstructions` overrides
   - `shared/Constants.kt` — `Compatibility` block for the app
4. **Implement** — create `Fingerprints.kt`, `*Patch.kt`, update `Constants.kt` for your app
5. **Build** — `scripts/build.sh` → `patches/build/libs/patches-*.mpp`
6. **Verify** — `scripts/verify_patch.sh <app_id>` applies the `.mpp` to a base APK

### Verify assertions (optional)

When you know what your patches change, add checks:

**In config** (`config/apps/<app_id>.yaml`):

```yaml
verify:
  apk: analysis/example/extract/com.example.app.apk
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

## Adding a new app

1. Copy `config/apps/_template.yaml` → `config/apps/<app_id>.yaml`
2. Add a `Compatibility` entry in `patches/src/main/kotlin/app/riky/patches/shared/Constants.kt`
3. Create `patches/src/main/kotlin/app/riky/patches/<app_id>/` with fingerprints and patches
4. Use the scripts to fetch/decompile/explore — no bash changes needed

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

## Release rules

This is a personal repo: **one branch (`main`) only**. There is no `dev` branch, prerelease flow, or backmerge — push to `main` and semantic-release handles versioning.

- Develop on `main`; semantic-release publishes from pushes to `main`
- Use [conventional commits](https://www.conventionalcommits.org/) (`feat:`, `fix:`, `bump:`)
- **Never hand-edit** `patches-list.json`, `patches-bundle.json`, or `CHANGELOG.md` — semantic-release generates them
- CI runs `./gradlew :patches:buildAndroid` on non-release pushes

## License and attribution

Fork of [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template). GPL-3.0 — see `LICENSE` and `NOTICE`.

- Credit Morphe contributors for template-derived tooling; credit modifications in `NOTICE` / README
- Product name: **Riky's Morphe Patches** (distinct from Morphe itself; see `NOTICE` branding rules)
- Erasing git history is fine for GPL if distributed source keeps notices and states modifications

## Prerequisites

Run `scripts/check_env.sh` when something fails. Requires:

- JDK 17+ (`JAVA_HOME`)
- GitHub Packages auth (`gpr.user` / `gpr.key` in `~/.gradle/gradle.properties`, or `GITHUB_ACTOR` + `GITHUB_TOKEN`)
- `ANDROID_HOME` (for extension builds)
- `curl`, `unzip`, `rg`, `jadx`, `apktool`, `python3`

## Morphe docs

- [Morphe documentation](https://github.com/MorpheApp/morphe-documentation)
- [Morphe Patches template](https://github.com/MorpheApp/morphe-patches-template)
- [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) for manual patching
