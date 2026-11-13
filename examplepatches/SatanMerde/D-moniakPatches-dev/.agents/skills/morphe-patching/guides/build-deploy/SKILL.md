---
name: build-deploy-troubleshoot
description: Build, test, deploy, and troubleshoot Morphe patches — gradle commands, CLI usage, git workflow, common errors and fixes. Use when building patches, testing with CLI, deploying releases, or debugging issues.
---

> **When to use:** User wants to build patches, deploy releases, or troubleshoot build/git issues. All development happens on `dev` branch — never commit to main directly. Always `git pull` after push.

# Build, Deploy & Troubleshoot

## Prerequisites

- **JDK 21** recommended for patch development because it matches template CI. The desktop
  source documents JDK 17 as its own build minimum; the installed CLI requires **JRE 21+**.
- GitHub PAT with `read:packages` in `~/.gradle/gradle.properties`.
- Template versions: plugin `app.morphe.patches` **1.3.4**, patcher **1.14.1**, Gradle **9.7.1**.

## Build

```bash
# Build patches
PATCHES_DIR="${MORPHE_PATCHES_DIR:-morphe-patches}"
cd "${PATCHES_DIR}" && ./gradlew buildAndroid && cd ..

# Get MPP path (always use this, never glob)
VER=$(grep "^version" "${PATCHES_DIR}/gradle.properties" | cut -d= -f2 | tr -d ' ')
MPP="${PATCHES_DIR}/patches/build/libs/patches-${VER}.mpp"
```

CLI jar: `morphe-cli.jar` (symlink at project root, run `./setup-cli.sh` to download).
Default keystore: `morphe-data/morphe.keystore` (no flag needed). Pass `--keystore <path>` only
for a custom key (BKS, PKCS12, or JKS; byte-sniffed, original unchanged).

## CLI Usage

```bash
# List patches
java -jar morphe-cli.jar list-patches --patches "$MPP" -pvo

# Patch APK (output to builds/, default keystore)
java -jar morphe-cli.jar patch \
  -p "$MPP" \
  -o analysis/<app>/builds/<app>_patched.apk \
  -f analysis/<app>/apk/<app>_<version>.<ext>

# Device-changing commands below are explicit-only: show the target and wait for confirmation.
# Patch + install via ADB
java -jar morphe-cli.jar patch \
  -p "$MPP" \
  -o analysis/<app>/builds/<app>_patched.apk \
  -f -i analysis/<app>/apk/<app>_<version>.<ext>

# Patch + mount-install (root) — --mount is a boolean flag combined with -i
java -jar morphe-cli.jar patch \
  -p "$MPP" \
  -o analysis/<app>/builds/<app>_patched.apk \
  -f -i --mount analysis/<app>/apk/<app>_<version>.<ext>

# Install existing patched APK
java -jar morphe-cli.jar utility install -a analysis/<app>/builds/<app>_patched.apk

# Mount install via utility — -m takes the package name
java -jar morphe-cli.jar utility install -a app_patched.apk -m com.example.app

# Exclusive mode (only specific patches)
java -jar morphe-cli.jar patch \
  -p "$MPP" \
  --exclusive -e "Patch Name" \
  -o analysis/<app>/builds/<app>_patched.apk \
  -f analysis/<app>/apk/<app>_<version>.<ext>
```

The CLI accepts `.apk`, `.apkm`, `.xapk`, and `.apks`. For split apps, pass the complete
container. A base APK extracted for analysis cannot provide omitted split resources or libraries.

## Git / Release Workflow

| Branch | Purpose | Release Type |
|--------|---------|-------------|
| `dev` | Development & testing | Pre-release (v1.x.0-dev.N) |
| `main` | Stable (after verified) | Stable (v1.x.0) |

- **All development on `dev`** — never commit directly to main
- Releases driven by semantic-release (conventional commits only)
- Conventional commits: `feat:` (minor), `fix:` (patch), `docs:`/`chore:` (no release)
- ALWAYS `git pull` after push — GitHub Actions auto-commits `CHANGELOG.md`,
  `gradle.properties`, `patches-bundle.json`, `patches-list.json`, and README
  (provenance attestation included)

## Troubleshooting

| Error | Fix |
|-------|-----|
| Build auth failure | Set `gpr.user`/`gpr.key` in `~/.gradle/gradle.properties` |
| Wrong JDK / CLI fails | Check `JAVA_HOME`; CLI needs JRE 21+, build recommends JDK 21 |
| Fingerprint match failure | Verify smali, update filters for new app version |
| `instructionMatches` without `filters` | Add `filters` to fingerprint or don't use `instructionMatches` |
| Patched app crashes | Check `adb logcat`, verify register numbers in smali |
| "Not compatible with device" | Use XAPK/APKM with correct `ApkFileType` |
| Push rejected | `git pull` first (CI auto-updated files) |
| Duplicate .mpp in release | `gh release delete-asset v1.2.0 old.mpp` |
| Google login fails | Expected — signature mismatch after re-signing |
| Multiple .mpp files in build | Use version from gradle.properties, not glob |

## Debugging

```bash
adb logcat | grep 'morphe\|AndroidRuntime'
```
