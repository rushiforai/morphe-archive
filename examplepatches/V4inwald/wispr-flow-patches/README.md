# Wispr Flow patches

Patches for the **Wispr Flow** Android app (`com.wispr.flowapp`), published in two forms:

1. a **standalone** reference implementation (Python + smali) that anyone can read, run and
   verify;
2. a **Morphe patch bundle** built from the same findings, so the patches can be applied on
   device with [Morphe](https://morphe.software).

The repository contains **no application code**: no APK, no DEX, no decompiled sources. It
carries tooling, the reverse-engineering evidence behind each hook, and the patches themselves.

Both patches are needed on a re-signed build: the app ships Play licensing, and without the
second patch it refuses to run. [`WHY.md`](WHY.md) explains that chain and why spoofing the
installer is the honest fix rather than a workaround.

## Patch on the phone with Morphe

The short path: nothing to build, nothing to transfer.

<a href="https://morphe.software/add-source?github=V4inwald/wispr-flow-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

Or manually: install [Morphe](https://morphe.software), open **Sources** → **Add source**, and
paste `V4inwald/wispr-flow-patches`.

Then pick Wispr Flow in Morphe, keep both patches enabled, and patch the input the manager
selects.

Morphe builds the bundle from [`patches/src`](patches/src) through the
[`app.morphe.patches`](settings.gradle.kts) plugin and publishes it as a release asset;
[`patches-bundle.json`](patches-bundle.json) is what the manager reads to find that asset. Every
release is signed with the key in [`morphe-signing.pub`](morphe-signing.pub): the manager pins the
key of the first bundle you install, and refuses a later release signed with another one.

Two things the manager does that the scripted pipeline does not: it handles the split bundle
itself, and it signs the patched app on your device. The result is the same two hooks.

## Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.3.0](https://github.com/V4inwald/wispr-flow-patches/releases/tag/v1.3.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Wispr Flow&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `com.wispr.flowapp`

**🎯 Supported versions:**

| 2.8.7 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Play Store install source](#play-store-install-source) | Reports the app as installed from the Play Store, so the bundled Play licensing check accepts a re-signed build. |  |
| [Unlimited words](#unlimited-words) | Removes the free-plan weekly word limit, so dictation keeps working past the quota. |  |

</details>

<!-- PATCHES_END -->

## Requirements for the scripted pipeline

* Linux x86-64 (the bootstrap fetches Linux builds)
* Python 3.11+
* JDK 17 — fetched by `scripts/bootstrap.sh`; nothing to install system-wide if you have one
* The **XAPK** (or the base APK plus its config splits) of the version you want to patch

An app bundle's base APK is not installable on its own: it declares
`android:requiredSplitTypes`, and a base-only install session fails with
`INSTALL_FAILED_MISSING_SPLIT`. `scripts/preflight.py` refuses that input and names the missing
split types.

## Usage

```bash
scripts/bootstrap.sh --keystore             # JDK, apktool, jadx, signing tools, local key
scripts/build.sh /path/to/wispr-flow.xapk   # patch, build, sign every split, verify
adb uninstall com.wispr.flowapp
adb install-multiple build/bundle/*.apk     # all pieces, one session, one signature
```

`scripts/build.sh` refuses to finish quietly. If the injected instruction is not present in
the dex that ends up inside the APK, if a split is missing, or if the bundle ends up with two
different signers, it reports a failure instead of handing over a broken build.

## How a patch is described

Each patch is a manifest under `patches/<name>/patch.json` plus a README. A hook is one of two
kinds:

* **`anchor`** — replaces one literal sequence of smali instructions with another, used when a
  method's whole logic is short-circuited. The original instructions stay below the injected
  block, unreachable, so the diff reads as a prefix.
* **`callsite`** — matches an `invoke-*` on a given signature and replaces the `move-result*`
  that follows it, leaving the call in place. Used when the same API is read from several
  classes and every read must be answered the same way.

Every hook carries a `why` and states how many sites it expects. Hooks are idempotent, refuse
to apply when the anchor is missing or the site count differs, and `--revert` restores the
original bytes — `scripts/apply_patches.py --revert` undoes a build.

## Repository layout

```
analysis/          reverse-engineering notes and the small tools that produced them
patches/           the patches: JSON manifests (standalone) and Kotlin sources (Morphe)
patches/src/       the Kotlin patches the Morphe bundle is built from
scripts/           bootstrap, preflight, decompile, apply, repack, sign, verify
tools/             downloaded toolchain and local keystore (gitignored)
tests/             unit tests over synthetic fixtures — no APK, no toolchain needed
.github/workflows/ build the bundle on pull requests and dev, release it on main and dev
```

The two forms read from one source of truth each — the JSON manifest for the scripted pipeline,
the Kotlin fingerprint for the bundle — and `scripts/verify_apk.py` checks the built dex against
the manifest, so a hook cannot drift unnoticed in the pipeline it guards.

## Scope and limits

These patches are for **personal, interoperable use on devices you own, on a copy of the app
you obtained yourself**. They change client-side logic only: no server is spoofed, nothing is
redistributed, and no entitlement is invented. See [`DISCLAIMER.md`](DISCLAIMER.md).

What is claimed here is what is observed offline: unit tests, a full build, a check of the
injected instructions in the built dex, and a check that the signed bundle is complete and
single-signed. Device behaviour — does the app launch, does dictation survive past the quota —
is the one thing no tool in this container can certify, and is not claimed.

## Development

`dev` is where changes land; every `feat:`/`fix:` there publishes a pre-release that Morphe shows
when pre-releases are enabled. When `dev` is ready it is merged into `main` by a pull request, and
that merge publishes the stable release. Commits follow Conventional Commits; `chore:` produces no
release.

## Licence

[GNU General Public License v3.0](LICENSE), like Morphe and its patch library, whose
`changePackageInstallerPatch` the install-source patch depends on.
