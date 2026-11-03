# Nich87 Patches

Custom patches by Nich87 for use with [Morphe](https://morphe.software).
This is an independent project based on the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template).

Apple Music patches provide a Liquid Glass bottom bar and library import,
export and downloads. Each patch can be selected independently.

## Using the patches

Add this source in Morphe Manager:
<https://github.com/Nich87/nich87-patches>.

<a href="https://morphe.software/add-source?github=Nich87/nich87-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

Enable pre-releases for development builds from `dev`.

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/Nich87/nich87-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Apple Music&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `com.apple.android.music`

**🎯 Supported versions:**

| 7.0.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Library import, export and downloads](#library-import-export-and-downloads) | Adds JSON library and playlist backups, additive import, and a native download action for the entire library. |  |
| [Liquid Glass bottom bar](#liquid-glass-bottom-bar) | Adds a live refractive glass background and animated selection lens to Apple Music's bottom tabs. Refraction requires Android 13 or newer. |  |

</details>

<!-- PATCHES_END -->

## Development

Use JDK 21 and Android SDK Platform 36. Authenticate GitHub CLI with the
`read:packages` scope, then build on `dev`:

```sh
gh auth refresh --hostname github.com --scopes read:packages
./scripts/gradle.sh buildAndroid
```

The Android bundle is written to `patches/build/libs/patches-*.mpp`.
The local launcher reads credentials from GitHub CLI and uses a separate
temporary Gradle cache. It does not store the token in this repository.

See [DEVELOPMENT.md](DEVELOPMENT.md) for setup, validation and release rules,
and [CONTRIBUTING.md](CONTRIBUTING.md) for contributions. Coding agents must
also read [AGENTS.md](AGENTS.md) and the repository's development skill.

## License

Licensed under [GPLv3](LICENSE), with the name restrictions in [NOTICE](NOTICE).
