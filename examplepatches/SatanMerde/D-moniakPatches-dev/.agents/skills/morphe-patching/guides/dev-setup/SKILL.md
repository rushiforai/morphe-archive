---
name: dev-environment-setup
description: Complete Morphe development environment setup — prerequisites, cloning repos, gradle auth, IDE config, build commands. Use when setting up a new dev environment or troubleshooting build/auth issues.
---

# Morphe Development Environment Setup

## Prerequisites

- **JDK 21** recommended for development (aligns with template CI). JDK 17 is the stated
  minimum in the desktop source, but JDK 21 gives a unified workspace/CI toolchain.
- **JRE 21+** required to run the CLI (`morphe-cli.jar`).
- Android reverse engineering tools for analysis: jadx, baksmali (local analysis/tests only —
  patch builds use the patcher's own pinned baksmali/smali fork, not the distro package)
- ripgrep (rg) for fast code search
- GitHub CLI (gh) for auth and releases
- Python tools via uvx: apkid, androguard

> **Note:** `baksmali`/`smali` from apt is fine for local DEX analysis and manual smali reading.
> It is **not** used during `./gradlew buildAndroid` — the Gradle plugin uses its own pinned fork.

## Quick Install (analysis tools)

```bash
sudo apt install -y openjdk-21-jdk jadx libsmali-java apktool aapt ripgrep adb dex2jar gh
# Python tools — no install needed, uvx runs latest version
# uvx apkid app.apk
# uvx androguard analyze -i app.apk
```

## GitHub Auth

```bash
gh auth login
TOKEN=$(gh auth token)
mkdir -p ~/.gradle
cat > ~/.gradle/gradle.properties << EOF
gpr.user = <GitHub username>
gpr.key = $TOKEN
EOF
```

## Clone Repos

```bash
mkdir morphe && cd morphe
# Template for creating custom patches
git clone https://github.com/MorpheApp/morphe-patches-template
# Optional: clone official patches for reference
git clone https://github.com/MorpheApp/morphe-patches
git clone https://github.com/MorpheApp/morphe-patcher
```

The CLI binary (`morphe-cli.jar`) is downloaded by `./setup-cli.sh` — no need to build
`morphe-desktop` locally.

## Gradle Plugin Config

`settings.gradle.kts` (template already has this configured):
```kotlin
pluginManagement {
    repositories {
        gradlePluginPortal()
        google()
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                username = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")
                password = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")
            }
        }
        maven { url = uri("https://jitpack.io") }
    }
}
plugins { id("app.morphe.patches") version "1.3.4" }
```

`patches/build.gradle.kts`:
```kotlin
group = "app.mypatches"
patches {
    about {
        name = "My Patches"
        description = "Custom patches"
        source = "git@github.com:user/repo.git"
        author = "Author"
        contact = "na"
        website = "na"
        license = "GPLv3"
    }
}
```

Extension `build.gradle.kts`:
```kotlin
extension { name = "extensions/extension.mpe" }
android { namespace = "app.morphe.extension" }
```

## Build Commands

```bash
# Build patches → patches/build/libs/patches-<version>.mpp
PATCHES_DIR="${MORPHE_PATCHES_DIR:-morphe-patches}"
cd "${PATCHES_DIR}" && ./gradlew buildAndroid
```

## Signing Key

The CLI uses the resolved data-root `morphe.keystore` by default. It is stable for desktop
runs but is not automatically the same key stored by Morphe Manager on a phone. No project-root
keystore is required.

To share an identity, export/import the key or pass the same custom `--keystore <path>`. BKS,
PKCS12, and JKS inputs are supported; PKCS12/JKS are converted to a copy and the source is unchanged.

## Troubleshooting

- **Auth failure**: Check `~/.gradle/gradle.properties` has `gpr.user` and `gpr.key`
- **Wrong JDK / CLI fails**: Ensure `JAVA_HOME` points to JDK 21+; CLI requires JRE 21+
- **MPP file names change after releases**: Run `git pull` then re-read `gradle.properties`
- **Composite builds**: If `morphe-patcher` exists as sibling dir, it's auto-included
