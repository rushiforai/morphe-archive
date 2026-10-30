# Lurk patches workspace

Read by Codex as AGENTS.md and by Claude through CLAUDE.md (`@AGENTS.md`).

Lurk, Jordan's Morphe privacy patch bundle, and the tooling around it. Main focus: privacy-focused
clients for Twitch (`tv.twitch.android.app`), Kick (`com.kick.mobile`) and Rumble (`com.rumble.battles`).
Use "Morphe" only descriptively ("patches for Morphe"), never as part of Lurk's name (see `NOTICE`).
The GitHub repo is `jordanwoodson/lurk-morphe-patches` for discovery: Lurk is the name, "morphe-patches" says what it is.
README.md is the public page. docs/development.md documents the layout, commands and workflow; read it
first. CONTRIBUTING.md has the rules contributors see; keep the two in line with this file.

## Rules

- **APK sources: APKMirror, Google Play or Uptodown only.** Never APKPure or any other mirror, not even
  for a quick look. Store APKs with `bin/apk-add` (checks the pinned signing cert) or `bin/apk-fetch`
  (Google Play).
- **Jordan writes his own patches.** Other people's Twitch/Kick/Rumble patch repos exist; don't copy or
  port them. Morphe's official repos (`bin/refs`) are fine as API reference.
- Generated output (decompiled code, patched APKs, emulator, screenshots) goes to `~/build/lurk-morphe-patches/`,
  never into the repo. `apks/` and `tools/` are gitignored.
- Use the `dev` branch and semantic commits (`feat:`, `fix:`, `chore:`). A pushed `feat:`/`fix:` on `dev`
  publishes a pre-release through `release.yml`. Don't hand-edit `patches-list.json`,
  `patches-bundle.json`, `CHANGELOG.md` or the README patch list.

## Conventions

- Patches live in `patches/src/main/kotlin/io/github/jordanwoodson/patches/<app>/<feature>/`, with the
  patch in `<Name>Patch.kt` and its fingerprints in `Fingerprints.kt`. Each app's `shared/Constants.kt`
  holds `COMPATIBILITY_<APP>`; every patch calls `compatibleWith(...)` with it. The settings, Lurk icon,
  Clone app, Change app name and Remove tracking permissions patches take their body from
  `patches/.../shared/apps/` (one `LurkApp` per app in `Apps.kt`); the app's file keeps name and description.
- When patches are tested on a new app version, update that version in the app's `targets`.
- Fingerprint on strings, method signatures and instruction patterns, not obfuscated class names.
  Fingerprint strings must be whole dex strings: Morphe Patcher 2.0 compares them exactly when a 2.0-built
  bundle is in the run (`tests/verify_fingerprint_strings.py`, part of `bin/test-host`).
- Java that runs inside the app goes in `extensions/` (`extensions/shared` has `Logger`, tag `lurk`).
  `patches/.../shared/Extensions.kt` has the extension paths and the Logger descriptor.
- Kick is React Native: logic is Hermes bytecode in `assets/index.android.bundle`. Use `hermesPatch`
  from morphe-patches-library for it; `bin/decompile kick` writes a disassembly and decompiled JS.
- Injected calls go through `invokeStatic()`/`requireLowRegisters()` from `patches/shared/Registers.kt`:
  Morphe drops a non-range invoke whose register is above v15 without an error. Every extension method a
  patch calls is listed in `tests/<app>/expected-hooks.txt`; `bin/verify-hooks <app> <apk>` checks they survived.
- Record every obfuscated name a patch matched with `Locators.record("<app>.<patch>.<what>", ...)`; the
  settings patch writes them to `assets/lurk/locators.json` and probes read that instead of pinning R8 names.
- No version literals outside `shared/Constants.kt` (a host check fails on new ones). Never rename a
  settings key: users' saved choices would reset.
- Switch defaults: a new patch is selected by default and its switch starts off, except lockout
  protection, local privacy, nags and restoring expected behavior; same-named patches share defaults across
  apps; patch-time-only changes (icon, name, clone, permissions, manifest) have no switch and say so.

## Commands

`bin/bootstrap` (setup), `bin/build`, `bin/apk-add <file>`, `bin/apk-fetch <app>`, `bin/apk-info`,
`bin/scan <app>`, `bin/decompile <app>`, `bin/patch <app> [--no-build] [--abi=x86_64] [--install=emulator-5580]`,
`bin/emu [--port N] start [SNAPSHOT]|stop|restart|save|load|snapshots|status|shot`, `bin/ui <command>`,
`bin/test-host`, `bin/test-<app>*`, `bin/verify-hooks <app> <apk>`, `bin/new-app`, `bin/refs`,
`bin/app-icon <app> <artwork.png>`. Version bumps: `bin/bump <app> <version> [file] [--pin]` (patches with
every patch forced on and groups the failures by cause), `bin/hermes-pin <app> [version]` (rewrites the
Hermes bundle SHA gate), then `bump(<app>): support <App> <version>` as the commit.

## Fast loop

The emulator is cheap to use when it is used this way (numbers measured on a KVM Linux host):

- `bin/emu start` boots `emulator-5580` from its last state in about 5 s (cold boot 15 s). Before a
  long manual setup (sign in, open a channel) `bin/emu save NAME`; later `bin/emu start NAME` boots
  into that state in 6 s and discards changes at stop, `bin/emu load NAME` jumps back in 2 s without a
  restart. `bin/emu restart` when `bin/emu status` shows QEMU above ~10 GB (the host renderer leaks
  per killed app process).
- `bin/build` takes ~35 s; patching plus install takes seconds. Iterate with
  `bin/patch <app> --no-build --install=emulator-5580 -- --exclusive -e "<Patch>"` (add the patches it
  depends on). Runtime switches need no re-patch: `bin/ui lurk <app>` opens the Lurk settings screen.
- Read the screen as text, not pixels: `bin/ui tree`; act with `bin/ui tap "<text>"`, `bin/ui wait
  "<text>"`, `bin/ui open <url> --app <app>`, `bin/ui launch <app>`, `bin/ui key back`; read hooks
  with `bin/ui log --dump` (tag `lurk`). `bin/ui shot` only when layout matters.
- Prefer `bin/test-host` (~40 s, no APK) and the `app_process` probes (`bin/test-<app>*`) over UI
  walks: they run the patched code on ART without a UI.
- A second emulator for parallel work: `bin/emu --port 5582 start`, then `--install=emulator-5582`
  and `export ANDROID_SERIAL=emulator-5582` for the test scripts. Worktrees share the main checkout's
  `apks/` and `tools/`.
- Emulator installs pick a stored x86_64 variant of the version when there is one (`bin/apk-info
  <app>` lists them); otherwise ARM code runs through the emulator's translation layer, which is slow
  and needs the native-library workaround in `docs/kick.md`. Store an x86_64 or universal build of
  each app version next to the phone's arm64 one.
