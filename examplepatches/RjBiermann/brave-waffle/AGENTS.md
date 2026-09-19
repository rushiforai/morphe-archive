# AGENTS.md — morphe-patches (patch repo)

GitHub: `RjBiermann/brave-waffle`. Kotlin Morphe patches for AIO Streamer
(`com.streamdev.aiostreamer` v6.7.1, versionCode 6719, phone+TV in one universal APK —
TV UI is runtime-detected via `hasSystemFeature("android.software.leanback")` in
`smali/dp0.smali`). Workspace-level notes (layout, stock APK, emulator recipes) are in
`../AGENTS.md`; builder specifics in `../builder/AGENTS.md`.

## Document index

| File | Contents |
|---|---|
| `AGENTS.md` (this file) | Upstream relationship, build, release rules, patch API gotchas, test recipe |
| `AGENTS-patches.md` | Patch knowledge: API surface, PRO hook, hash validation, each patch's internals |
| `AGENTS-login.md` | Login state model (not-logged-in / free / PRO), per-state behavior table |
| `AGENTS-tv.md` | TV gate chain (patched), server walls, TV emulator notes |

## Upstream (MorpheApp/morphe-patches)

This repo is a **third-party patches repo** (fork of `MorpheApp/morphe-patches-template`
— the official way to ship patches for other apps; upstream accepts PRs only for
YouTube/YT Music/Reddit and encourages separate repos otherwise). Upstream is the
reference for the patch API — analyze it when unsure: `git clone --depth 1
https://github.com/MorpheApp/morphe-patches`.

Key facts from upstream (v1.43.0, 147 patches):

- Same gradle plugin we use: `app.morphe.patches` **1.3.4**, resolved from
  `maven.pkg.github.com/MorpheApp/registry` (gradle property `gpr.user`/`gpr.key`,
  env `GITHUB_ACTOR`/`GITHUB_TOKEN`). Upstream pins `morphe-patcher` **1.10.0**
  (ours 1.13.0); both use `app.morphe:morphe-patches-library` **1.6.2**.
- Patch DSL: `bytecodePatch(name, description, use, fingerprint, execute)`,
  `resourcePatch(name, description, default)` — a resource patch is a plain lambda
  over the APK resources; patches compose with `dependsOn(...)`. Options declared
  inside the patch: `stringOption(key, default, values, title)`,
  `booleanOption(...)`, read via `option.value!!`.
- dexlib2 helpers (from `app.morphe.patcher.extensions.InstructionExtensions`):
  `addInstruction(index, smali)`, `addInstructions(index, """smali""")`,
  `addInstructionsWithLabels(index, """smali with :labels""")`, `replaceInstruction`.
- `app.morphe.util` (patches-library): `Fingerprint(...).matchAllMethodIndicesForEach
  { index }` — match by string literals (`string("...")` filters) or custom
  `{ _, classDef -> }` predicates, applies to every match; also
  `findInstructionIndicesReversed`, `findMutableMethodOf`, `asSequence`.
- Structure upstream: `patches/src/main/kotlin/app/morphe/patches/<app>/<area>/`,
  `extensions/` = Android library modules (default namespace `app.morphe.extension`)
  bundled into the APK and invoked via injected `invoke-static` calls;
  `patches/stub` = `compileOnly` Android API stubs. A patch without extension code
  needs none of that — our repo is bytecode-only.
- Upstream's `publish` gradle task depends on `generatePatchesList` (that's why
  semantic-release runs it); generated files (README list, `patches-bundle.json`,
  `patches-list.json`) are CI artifacts, not hand-edited.

## Build & release

```bash
# local build — gh token has read:packages, so no separate PAT needed:
# GITHUB_ACTOR=RjBiermann GITHUB_TOKEN=$(gh auth token) works
export GITHUB_ACTOR=RjBiermann GITHUB_TOKEN=$(gh auth token)
./gradlew :patches:build -q    # → patches/build/libs/patches-*.mpp
```

- CI releases `patches-*.mpp` on every push (semantic-release, conventional commits).
  **A push IS a release — always verify locally first**: build the .mpp, patch the stock
  APK with `../bin/morphe-desktop.jar` (see Test below), and check the result (at minimum
  all patches apply and the patched APK decodes; ideally emulator spot-check) BEFORE
  `git push`.
- Release rules: `feat:` → minor, `fix:` → patch, `chore:` → no release.
- Generated files (`README.md` patches list, `patches-bundle.json`, `CHANGELOG.md`)
  are CI-generated — don't hand-edit; they update only on releases.
- `git pull --rebase` before push (semantic-release commits tags/files on remote).
- CI release-run FAIL on non-main branches is only the semantic-release dev-branch
  backmerge (no dev branch exists) — the .mpp asset is published regardless.

## Test

Patch a local APK and verify (recipe in `../AGENTS.md`). Morphe Desktop CLI
expected at `../bin/morphe-desktop.jar`.

```bash
java -jar ../bin/morphe-desktop.jar patch ../<stock apk>.apk -o out.apk -p <mpp>
```

## Gotchas

- Morphe CLI flag differences vs ReVanced: `list-patches --patches=<file>` (`-p` is
  `--with-packages`, a boolean!). j-hc's utils.sh already falls back to the right form.
- `--patches` accepts a GitHub `owner/repo` URL directly with the morphe CLI.
- `appIconColor` in Compatibility must be 0xRRGGBB (no alpha byte), Kotlin `Int`.
- Strings in patches: Morphe patcher v1.13 patch API — string replacement via
  `string(<url>).matchAllMethodIndicesForEach` from `app.morphe.util`
  (needs `app.morphe:morphe-patches-library:1.6.2` in deps; NOT part of morhe-patcher;
  see "Upstream" section in AGENTS.md for the full DSL).
- Fork conventions vs upstream: `group = "app.ais"`, namespace `app.ais.patches`,
  `compileOnly(libs.gson)` also declared (upstream has gson only in the
  patchListGenerator classpath); extensions/stub modules removed — keep bytecode-only.
- Registry auth: Morphe gradle plugin resolves from `maven.pkg.github.com/MorpheApp/registry`
  — works in Actions with GITHUB_TOKEN; locally `gh auth token` (which now includes
  `read:packages`) passed as `GITHUB_ACTOR`/`GITHUB_TOKEN` works too.
- Patch API: `bytecodePatch(name, description, default=true)`,
  `Fingerprint(definingClass, name, returnType)`, `method.addInstruction(index, "<smali>")`;
  no `InterfaceReference` class in this dexlib2 fork — use `MethodReference` +
  check `definingClass`/`name`.
