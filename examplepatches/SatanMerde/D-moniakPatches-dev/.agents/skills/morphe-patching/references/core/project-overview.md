# MorpheApp Project Overview

Morphe is an Android app modification/patching ecosystem. It modifies APK bytecode and resources to add features, remove limitations, and customize apps.

## Repository Architecture

| Repo | Purpose | Language |
|------|---------|----------|
| morphe-patcher | Core patcher engine (bytecode/resource manipulation via Smali + Apktool) | Kotlin |
| morphe-patches | Official patches (YouTube/Music/Reddit) | Kotlin + Java |
| morphe-patches-template | Template repo for creating custom patch bundles | Kotlin |
| morphe-desktop | Terminal-based patching tool (formerly morphe-cli) | Kotlin |
| morphe-library | Shared utilities (APK signing, installation, ADB) | Kotlin (KMP) |
| morphe-patches-library | Shared code for patch bundles | Java |
| morphe-patches-gradle-plugin | Gradle plugin `app.morphe.patches` for building patches | Kotlin |

## Key Concepts
- **Patch**: Code that modifies an APK. Types: `BytecodePatch`, `ResourcePatch`, `RawResourcePatch`
- **Fingerprint**: Partial method description used to locate obfuscated methods across app updates
- **Extension**: Precompiled DEX file merged into the patched app (complex Java/Kotlin logic)
- **MPP file**: Morphe Patches Package — a JAR containing patches + DEX for Android execution
- **Compatibility**: Declares which app package/versions a patch targets

## Build System
- Gradle with Kotlin DSL
- Plugin: `app.morphe.patches` **1.3.4** (settings plugin)
- Patcher: **1.14.1**
- Gradle: **9.7.1**, Java 21 CI target
- Registry: `maven.pkg.github.com/MorpheApp/registry` (requires GitHub PAT with `read:packages`)
- Auth: `~/.gradle/gradle.properties` with `gpr.user` and `gpr.key`
- JDK 21 recommended (aligns with template CI); JDK 17 is the minimum stated in desktop source
- CLI runtime requires **JRE 21+**
- `./gradlew buildAndroid` compiles patches to MPP (JAR + DEX)

## Template Release Process
- Releases are driven by semantic-release (conventional commits only)
- `dev` branch → pre-release (e.g. `v1.2.0-dev.1`); `main` branch → stable (e.g. `v1.2.0`)
- GitHub Actions auto-commits after release: `CHANGELOG.md`, `gradle.properties`,
  `patches-bundle.json`, `patches-list.json`, and `README.md`
- Released MPP artifacts receive build-provenance attestations
- Always `git pull` after pushing — auto-committed files will otherwise cause push conflicts

## Our Patches Repo
- Configured via `MORPHE_PATCHES_DIR` environment variable (default: `morphe-patches/`)
- Dev branch for work, main for releases
- Check existing apps:
  ```bash
  PATCHES_DIR="${MORPHE_PATCHES_DIR:-morphe-patches}"
  find "${PATCHES_DIR}/patches/src/main/kotlin" -mindepth 4 -maxdepth 4 -type d 2>/dev/null
  ```

## License
- GPL-3.0-only. See the repository `LICENSE` file.
