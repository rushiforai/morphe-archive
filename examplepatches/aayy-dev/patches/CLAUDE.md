# CLAUDE.md — working on this repo

Guidance for any agent (or human) working in this repository. Read it before building,
patching, or cutting a release. It captures the non-obvious quirks that have already cost real
debugging time — follow it and you skip the same dead ends.

## What this repo is

Personal **Morphe** patches. Morphe (an app on [morphe.software](https://morphe.software)) patches
an app's **official APK on the device** (ReVanced-style, bytecode + manifest level). There is no
fork of the target app to ship and no build server to run — the user patches the stock APK on their
phone and Morphe re-signs it with their own on-device key.

- GitHub: **`aayy-dev/patches`** (public). Remote `origin` = `https://github.com/aayy-dev/patches.git`.
- This is an **independent project, not affiliated with Morphe.** Per Morphe's `NOTICE`
  (clause 7c), **never use "Morphe" as the project/repo/product name** — only descriptive references
  like "patches for use with Morphe" are allowed. That is why the repo is named `patches`, not `morphe`.
- Patches currently cover **Bitwarden** (`com.x8bit.bitwarden`) and **Native Alpha**
  (`com.cylonid.nativealpha`).

## Layout

```
patches/src/main/kotlin/dev/aayy/bwpatches/
  shared/Constants.kt          # Compatibility objects (one per target app)
  passkey/                     # Bitwarden passkey patches
  nativealpha/                 # Native Alpha patches
  util/PatchListGenerator.kt   # generates patches-list.json
extensions/extension/src/main/java/dev/aayy/bwpatches/extension/
                               # Java "extensions": runtime code injected into the target app
patches-bundle.json            # Morphe source manifest (version + download_url + created_at)
patches-list.json              # generated patch index (committed)
README.md                      # user-facing: how to add the source & patch
```

A **patch** = a Kotlin file using the `patch(name=, description=, default=) { compatibleWith(...);
extendWith(...); execute { } }` DSL (patcher API 2.3.0). An **extension** = a Java class compiled to
`extension.mpe` and injected into the app; a patch wires calls to it via `extendWith(...)` +
`invoke-static`. Extension Java package **must** match the smali descriptor used in the patch
(e.g. `Ldev/aayy/bwpatches/extension/PasskeyUv;`).

## Toolchain (hard requirements)

- **Build the `.mpp` bundle with JDK 21.** (`java -version` should show 21.)
- **Apply headlessly with the Morphe Desktop CLI jar, which needs JDK 26+.** On this machine:
  `export JAVA_HOME=/opt/homebrew/opt/openjdk` (currently JDK 27). The CLI jar lives at
  `/tmp/morphe-dist/morphe-desktop-2.1.1-all.jar` (re-download if gone).
- Android SDK at `/Users/aayush/Library/Android/sdk`; `aapt2`/`dexdump` under `build-tools/37.0.0/`.

### `gradle.properties` — needed to build, never commit

The Gradle build needs **read access to MorpheApp's GitHub Packages**. `gradle.properties` is
**gitignored** and holds:

```
gpr.user=aayy-dev
gpr.key=<a GitHub PAT with read:packages>
version = <current version>
```

**Never commit or print `gpr.key`.** A fresh checkout / cloud session without this file **cannot
build** (this is exactly why the Native Alpha patches were written in a cloud session but built here).

### `local.properties` — needed or the bundle is silently broken

Also **gitignored**. Must contain:

```
sdk.dir=/Users/aayush/Library/Android/sdk
```

**Without it, `buildAndroid` produces an `.mpp` with NO `classes.dex`.** Morphe **Manager** (on the
phone) loads patches via `loadPatchesFromDex`, so a dex-less bundle shows up as **"0 patches / 0
patchable apps"** — while the Desktop CLI (which uses `loadPatchesFromJar`) still works, so the
problem is easy to miss. Setting `ANDROID_HOME` as an env var is **not** enough; the file must exist.

## Building

```bash
./gradlew generatePatchesList
./gradlew buildAndroid          # MUST run last — see below
unzip -l patches/build/libs/patches-*.mpp | grep classes.dex   # must print a line
```

- **Run `buildAndroid` LAST.** `generatePatchesList` triggers a plain `build` that overwrites the
  `.mpp` with a non-dexed (JAR-only) one. If you run them in the other order you ship a bundle that
  loads as 0 patches on the phone.
- Always confirm `classes.dex` is in the `.mpp` before releasing or handing it to the user.
- Output: `patches/build/libs/patches-<version>.mpp`.

## Headless verification (before giving the user anything to test)

Apply the built bundle to the real target APK with the Desktop CLI and inspect the result — don't
assume a clean compile means the bytecode is right.

```bash
export JAVA_HOME=/opt/homebrew/opt/openjdk
"$JAVA_HOME/bin/java" -jar /tmp/morphe-dist/morphe-desktop-2.1.1-all.jar patch \
  --patches patches/build/libs/patches-<version>.mpp \
  -e "Patch name A" -e "Patch name B" --exclusive -f \
  -o /tmp/out.apk  /path/to/official.apk
```

- `-e "<name>"` selects a patch by its `name =`; `--exclusive` runs only those; `-f` ignores version
  gating.
- Verify manifest changes: `aapt2 dump xmltree --file AndroidManifest.xml /tmp/out.apk`.
- Verify bytecode: extract `classes*.dex` and `dexdump -d`. **Pipe `dexdump` output through
  `LC_ALL=C grep -a`** — the dump contains bytes that make `awk`/default-locale tools choke on
  "multibyte conversion failure".

Test APK sources used so far: Native Alpha 1.5.2 →
`https://apt.izzysoft.de/fdroid/repo/com.cylonid.nativealpha_1520.apk`; Bitwarden from APKMirror
(Play build = split bundle `.apkm`) or Bitwarden's GitHub releases (F-Droid = single `.apk`).
**Download untrusted APKs into their own empty dir and pass paths as args.**

## Releasing — and the ONE-RELEASE-TAG RULE

> **Whenever you cut a new release, delete EVERY older release and its tag, so the repo always has
> exactly ONE release and ONE tag (the latest).** This was the confirmed cause of Morphe failing to
> update from patches v1.3.1 → v1.5.0: leftover older releases/tags stopped Morphe from picking up
> the new version. Keep it to a single latest tag and updates work.

"Delete the tag" means **all three**: the GitHub Release, the remote git tag, and the local git tag.

```bash
# After the new release vX.Y.Z is published and verified, remove each older one:
gh release delete vOLD --repo aayy-dev/patches --yes      # GitHub release
git push origin :refs/tags/vOLD                           # remote tag
git tag -d vOLD                                           # local tag
```

### Manual release steps (CI is disabled — see below)

1. Bump `version` in **gradle.properties** (local, gitignored).
2. `./gradlew generatePatchesList && ./gradlew buildAndroid` (buildAndroid **last**); confirm
   `classes.dex` is in the `.mpp`.
3. Update **`patches-bundle.json`**:
   - `version` → new version.
   - `download_url` → `https://github.com/aayy-dev/patches/releases/download/vX.Y.Z/patches-X.Y.Z.mpp`.
   - `created_at` → UTC, format **`YYYY-MM-DDTHH:MM:SS`**, **NO trailing `Z`** (generate with
     `date -u +%Y-%m-%dT%H:%M:%S`). Morphe parses it as a `LocalDateTime`; a trailing `Z` makes the
     **entire source fail to load** ("patch bundle could not be downloaded").
   - Commit the regenerated `patches-list.json` too.
4. Commit, `git tag vX.Y.Z`, push `main` and the tag.
5. `gh release create vX.Y.Z patches/build/libs/patches-X.Y.Z.mpp --repo aayy-dev/patches` (make sure
   it is **not** a prerelease — Morphe uses `releases/latest`, which ignores prereleases).
6. **Apply the one-release-tag rule above: delete all older releases + tags.**

### After releasing: the "unnamed source" cache gotcha (not a bug)

Right after you push a release, Morphe Manager may show the source as **"unnamed" with 0 patches**,
or fail to read the metadata. This is almost always `raw.githubusercontent.com`'s **~5-minute CDN
cache** serving the old/empty `patches-bundle.json`, not a real break. Confirm the live bundle is
valid (`curl -s "https://raw.githubusercontent.com/aayy-dev/patches/main/patches-bundle.json?cb=$(date +%s)"`
→ HTTP 200, correct `version`); if it is, just **wait a couple minutes and refresh the source again**
in Morphe. Don't re-cut the release or change the manifest to chase this.

How Morphe consumes this: it reads `raw.githubusercontent.com/aayy-dev/patches/main/patches-bundle.json`
for the version/`download_url`, then downloads that `.mpp` release asset. A private repo would need a
PAT detour; this repo is public, so the asset downloads directly.

### What the user still has to do

Updating the source in Morphe does **not** change an already-installed patched app. The version shown
on an app's card is the **installed app's patch version**; it only advances when the user
**re-patches** and reinstalls.

## Patch-authoring quirks

- **Be obfuscation-robust.** Bitwarden is minified: never match obfuscated class/field names. Anchor
  on kept names — `com.bitwarden.ui.R$string.*` resource names, `-keep`'d `com.bitwarden.**` classes —
  plus structure. Native Alpha's release builds are **not** minified, so its names (e.g.
  `com.cylonid.nativealpha.ShortcutDialogFragment.addShortcutToHomeScreen`) are stable and can be
  matched directly.
- Make a patch **fail loud** (`throw PatchException(...)`) when its target isn't found, rather than
  silently no-op — Morphe then reports it instead of shipping a broken app.
- **Don't inject a `goto` that skips a method's `try` region or its leading register setup** — it
  orphans the catch handler and causes an ART `VerifyError` (app crashes on launch, even after
  reinstall). Rewrite the specific branch in place instead. (This is what broke the v1.3.0 auto-trust
  attempt.)
- **`replaceInstruction(s)` replaces the SAME number of instructions it compiles.** To swap one
  instruction for several, use `removeInstruction(i)` then `addInstructions(i, ...)`, or
  `replaceInstruction` the call site + `addInstructions` before it (see KeepShortcutIconShapePatch).
- Top-level helpers `classDefForEach` / `mutableClassDefBy` need `import app.morphe.patcher.patch.*`.

## Version-agnostic compatibility (don't re-introduce version prompts)

Every `Compatibility` in `Constants.kt` uses `targets = listOf(AppTarget(version = null))`. Morphe's
`PatchInfo.supports()` returns true for **any** app version only when no specific version is listed
(`versions = targets.mapNotNull { it.version }.takeIf { isNotEmpty() }` → null). **Pinning a concrete
version** makes every other build show an "unsupported / experimental version — bypass / accept risk"
prompt. Leave `version = null` unless there's a real reason to gate.

## Runtime constraints to remember (re-signing side effects)

Morphe re-signs the patched APK with the user's key, which breaks anything tied to the **original
signing certificate**:

- **App Links / Digital Asset Links verification fails** (the `.well-known/assetlinks.json` check
  pins the stock cert). This breaks Custom-Tabs **AuthTab** secure-channel flows — notably
  **Bitwarden's Duo 2FA browser callback** ("an error has occurred / unable to process your request"
  on login). Manually enabling "Open supported links" does **not** fix it. Workaround: use a
  non-browser 2FA method (TOTP).
- **Passkey browser-signature allowlist:** if the user's **browser is also Morphe-patched** (re-signed),
  Bitwarden rejects it ("browser signature does not match"). The `TrustResignedBrowserPatch` handles
  this by routing a signature mismatch to Bitwarden's existing "trust this browser?" prompt (a
  singleton swap that constructs nothing — don't replace it with a catch-block rewrite that builds a
  Success object; register layouts differ between builds and it yields "Passkeys not supported").
- Native push / FCM is **not** broken by re-signing (depends on package name + Firebase config, not
  the cert) — so the Play build's native push still works after patching.

## Git & security hygiene

- **Commit author:** use the no-reply identity `aayy-dev <275768457+aayy-dev@users.noreply.github.com>`.
  **Never** commit the user's work email (`aayush.agarwal@unleashedbrands.com`) — scrub it if it
  appears.
- **NO Claude attribution, ever.** No `Co-Authored-By:` trailers, no `Claude-Session:` / session
  links, no "Generated with Claude" lines — in commits, tags, release notes, or PRs. Every commit's
  author AND committer must be the `aayy-dev` no-reply identity, never `Claude <noreply@anthropic.com>`.
  The repo's `.claude/settings.json` sets `attribution` to empty and `sessionUrl: false`; honor it.
- **Check incoming commits before merging** work from another session/branch:
  `git log main..<branch> --format='%an <%ae>%n%B' | grep -iE 'co-authored|claude-session|anthropic'`
  must print nothing. If it matches, rewrite those commits first — don't merge them as-is.
- **Work directly on `main` by default.** New patches, extensions, docs, and release chores all go
  straight onto `main`. The repo should normally have exactly **one branch (`main`)**, and local must
  match GitHub (same branches, same tags — prune stale ones on both sides).
- **Use a separate branch only for one case:** making **experimental / risky changes to an existing,
  already-working patch**, where you need `main` to keep holding the known-good version while you try
  something that might break it. In that case branch off `main`, iterate there, and once it's verified
  working, **fast-forward it into `main` and delete the branch (local + origin)** so `main` is the only
  branch again. (Brand-new patches are not this case — build them on `main`.)
- **Never commit** `gradle.properties`, `local.properties`, `morphe-signing.key`, or any `*.apk`
  (all gitignored).
- **CI (`.github/workflows/release.yml`) is `workflow_dispatch`-only / disabled** (it needs the
  Packages PAT as a secret). Releases are **manual** (steps above). **Do not** wire a **self-hosted
  runner** to this **public** repo.

## Device testing

- Real test device over adb: `adb connect s26fe:5555` (Samsung). Emulators may also be connected.
- To install a patched build the user must **uninstall the original first** (different signature), so
  have them **export the app's backup** beforehand when data matters (e.g. Native Alpha web apps,
  Bitwarden vault).
- Diagnose runtime failures from `adb logcat` on the real device, not assumptions.
