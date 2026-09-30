# Oyasumi Patches

Morphe patches for a small set of Android apps. Every patch is declared against the exact package and version it was derived from, and every fingerprint comes from that build's own decompiled output. See [`reference/NOTES.md`](reference/NOTES.md) for the recorded package, class, method, string, and instruction details behind each patch.

Adding support for a new app release means re-deriving its fingerprints: releases rename the obfuscated classes and methods an app ships, so a patch that matched one version will not match the next.

## Implementing a patch

Follow this workflow for every new patch:

1. Define the user-visible behavior in one sentence.
2. Choose the target package and the exact app version that will be supported. Keep the compatibility declaration pinned to versions that have been verified.
3. Capture a clean reference build and record the relevant class, method, strings, resources, and instruction sequence in `reference/NOTES.md`.
4. Build a fingerprint from stable anchors. Prefer strings, access flags, return and parameter types, and distinctive instructions; avoid relying on obfuscated names when a more stable anchor exists.
5. Implement the smallest safe change with `bytecodePatch` or `resourcePatch`. Use an extension only when the behavior cannot be expressed cleanly in the patch DSL.
6. Give the patch a clear name, one-line description, category when useful, and an intentional default state.
7. Compile the patch project, apply the bundle to the pinned reference build, and exercise the changed flow on a device.
8. Update the generated patch list and README sections through the release tooling.

## Patch structure

Place each patch and its fingerprints in a small feature package under `patches/src/main/kotlin/app/<app>/patches/<feature>/`, so patches for different apps never share a package. Keep shared compatibility metadata in a dedicated object per app, only when more than one patch uses it. A patch should contain:

- A `bytecodePatch` or `resourcePatch` declaration.
- A `compatibleWith` declaration tied to the verified target.
- Fingerprints that are specific enough to avoid accidental matches.
- The smallest possible instruction or resource edit.
- A user-facing name and description that describe the behavior, not the implementation.

For bytecode changes, confirm register types and instruction width before inserting instructions. For resource changes, verify the resource path and count every replacement anchor. Never guess class names, method signatures, or opcodes; obtain them from the reference build first.

## Extensions

Extensions are appropriate for logic that is too large or stateful for an inline patch. Keep extension APIs small, inject only what the patch needs, and verify that the extension artifact is built with the patch bundle. Do not add an extension for a simple return-early edit or constant replacement. No patch in this repository currently ships an extension, so the `extensions/` directory is absent until one is needed.

## Repository layout

```text
patches/       Kotlin patch definitions and fingerprints
reference/     Small, non-sensitive reverse-engineering notes
AGENTS.md      Agent and maintenance rules
```

Large APKs, extracted binaries, secrets, and generated build output must stay outside version control. Keep only the notes needed to reproduce a fingerprint.

## Building

Install the required Java and Node.js toolchains, then run:

```bash
./gradlew :patches:compileKotlin
./gradlew buildAndroid
```

The built `.mpp` bundle is written under `patches/build/libs`. Test the bundle with Morphe Desktop or a device build before publishing it.

## Generated release data

`patches-list.json` is generated from compiled patches and is consumed by external tools. The release workflow also updates the README patch section between the markers below and produces `patches-bundle.json` for a release. Do not hand-maintain generated app or patch entries.

## Available patches

<!-- PATCHES_START -->
> **[v0.3.2](https://github.com/dunecache/oyasumi-patches/releases/tag/v0.3.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;4 patches total
<details open>
<summary>📦 ADM&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 14.0.39 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable ads](#disable-ads) | Skip ADM's Appodeal and AppBrain ad setup and display routines, and the Telegram join prompt. |  |
| [Disable rating prompts](#disable-rating-prompts) | Skip ADM's automatic rating prompt. The menu item that opens the same dialog on request is left intact. |  |
| [Increase connection limits](#increase-connection-limits) | Raise the download ceilings to 32 simultaneous downloads and 64 connections per download, and set torrent defaults to 500 global and 100 per torrent. |  |

</details>

<details open>
<summary>📦 1DM&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 18.2 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable home screen ads](#disable-home-screen-ads) | Keep 1DM's home screen banner from loading, rotating, or rendering. |  |

</details>

<!-- PATCHES_END -->

## Further documentation

See the [Morphe patcher documentation](https://github.com/MorpheApp/morphe-documentation) for the current patch API and [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) for applying a local bundle.
