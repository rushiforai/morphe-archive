# AGENTS.md

Operating guide for this repository. `CLAUDE.md` imports this file, so these rules
apply to every agent session. For *what we have learned* about Morphe and specific
apps, read `docs/` — this file is only about *how to work here*.

## What this repo is

`jackblk`'s personal Morphe patches. Morphe patches rewrite an Android app's
compiled bytecode (smali) to change behaviour — here, to unlock premium features.
A patch has two parts: a **Fingerprint** (locates a method inside the obfuscated
APK) and a **patch body** (rewrites that method's bytecode).

## Scratch / working directory

- Use `./tmp` for ALL temporary work. It is gitignored. **Never** use the system
  `/tmp`.
- Decompiled apps go in `./tmp/{package.name}-{version}` (e.g.
  `./tmp/net.relaxio.sleepo-4.3.0`).
- Extracted APKs and other scratch artifacts also live under `./tmp`.

## Toolchain

- **Java 21** (Homebrew OpenJDK) — required by Gradle and the Morphe CLI.
- **jadx** — decompiler for investigation. `brew install jadx`.
- **Morphe Desktop CLI** — `tmp/morphe-desktop-*.jar`. Applies patches and
  installs APKs. It does **not** decompile.
  - `java -jar tmp/morphe-desktop-<ver>-all.jar --help`
  - Subcommands: `patch`, `list-patches`, `list-versions`, `options-create`, `utility`.

## Investigating an app (before writing any patch)

1. An `.xapk` is a zip of split APKs. The premium logic lives in the **base**
   APK only (`{package}.apk`), never the `config.*` splits. Extract it:
   `unzip -o tmp/<app>.xapk <package>.apk -d tmp/work`
2. Read `manifest.json` inside the xapk for `package_name`, `version_name`,
   `version_code`. `com.android.vending.BILLING` in permissions = Play Billing.
3. Decompile the base APK (skip resources for speed):
   `jadx --no-res -d tmp/{package}-{version} tmp/work/<package>.apk`
4. Grep the decompiled sources for the premium gate:
   `rg -il 'premium|subscri|isPro|billing|purchase|entitle' tmp/{package}-{version}/sources`
   The goal is to find the small set of methods that answer "is the user
   premium / is this content locked?". Those become fingerprint targets.

## Writing patches

- Source lives in `patches/src/main/kotlin/app/jackblk/patches/<app>/`.
- One `Fingerprints.kt` (the search queries) + one `*Patch.kt` (the rewrite) per app,
  mirroring `tmp/example-patches/calm-premium/` and the template's `example/`.
- Compatibility (app name, package, version targets) is declared in
  `patches/src/main/kotlin/app/jackblk/patches/shared/Constants.kt`.
- Common premium-unlock move: fingerprint the boolean check method, then force it:
  - return true:  `removeInstructions(0, instructions.count())` then
    `addInstructions(0, "const/4 v0, 0x1\nreturn v0")`
  - return false: same with `0x0`.
  See `docs/morphe-patching.md` for the full patch API notes and the Calm reference.

## Prerequisite: GitHub Packages auth (one-time)

The `app.morphe.patches` Gradle plugin resolves from the private registry
`maven.pkg.github.com/MorpheApp/registry`, which requires a **classic** GitHub PAT
with the `read:packages` scope. Fine-grained tokens do NOT work with GitHub Packages
(Maven) and return HTTP 401. Without a valid token, `./gradlew buildAndroid` fails with
"Plugin [id: 'app.morphe.patches'] was not found" (an HTTP 401 in `--info` logs).
Credentials are read from
`gpr.user`/`gpr.key` Gradle properties, falling back to `GITHUB_ACTOR`/`GITHUB_TOKEN`
env vars (see `settings.gradle.kts`). Configure once, globally (never commit tokens):

```
# ~/.gradle/gradle.properties
gpr.user=<github-username>
gpr.key=<PAT with read:packages>
```

## Build & apply locally

- Build the bundle: `./gradlew buildAndroid` → produces `patches/build/libs/patches-*.mpp`.
- Apply to an APK:
  `java -jar tmp/morphe-desktop-<ver>-all.jar patch -p patches/build/libs/patches-<ver>.mpp tmp/work/<package>.apk`
  (add `-i` to install to a connected ADB device; `-f` to skip version compatibility checks).

## Release workflow (from the template — do not deviate)

- **Do all work on the `dev` branch.**
- Use semantic commit messages. Keep to three types:
  - `feat:` new feature (creates a pre-release)
  - `fix:` a fix (creates a pre-release)
  - `chore:` change not shown in the user changelog (no release)
- For a stable release, merge `dev` into `main` (plain merge — no squash).
- Releases are automated by `release.yml` + `.releaserc`. Never create releases by hand.
- **Never** hand-edit generated files: `patches-list.json`, `patches-bundle.json`,
  `CHANGELOG.md`. Never force-push semantic-release commits.

## Conventions

- Work from the repo root; use paths relative to it. Do not use `git -C` or absolute paths.
- Make the smallest change that works. Do not touch unrelated files.
- Do not commit, push, or release without explicit confirmation.
