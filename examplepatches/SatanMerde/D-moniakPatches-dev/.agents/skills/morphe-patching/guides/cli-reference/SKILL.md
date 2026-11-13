---
name: morphe-cli-reference
description: Morphe CLI v1.17.0 (morphe-desktop) complete command reference — patch, list-patches, list-versions, options-create, utility install/uninstall. Use when running CLI commands, testing patches, or troubleshooting CLI usage.
---

> **When to use:** User wants to run CLI commands — patching, listing, installing, testing. Always resolve MPP path from `gradle.properties` version first. Output patched APKs to `analysis/<app>/builds/`. Use `-f` for split APK base.apk or bundle files.

# Morphe CLI v1.17.0 Reference

- CLI jar: `morphe-cli.jar` (symlink at project root, run `./setup-cli.sh` to download)
- Upstream repo: `MorpheApp/morphe-desktop`
- Runtime requirement: **JRE 21+**
- Data root: normally `morphe-data/` beside the real jar; writable `MORPHE_DATA_DIR` wins,
  with the documented home/XDG fallback when jar-adjacent storage is unavailable.
  Downloaded bundles are under `patches/`; logs, scratch files, and default `morphe.keystore`
  live in the same root.
- MPP path: always resolve from `gradle.properties` version (see below)

## Signing Key

The CLI signs by default with the resolved data-root `morphe.keystore`; no extra flag is needed.
That key is stable for desktop runs but is not automatically the same key stored on a phone.
Export/import the key or use the same custom `--keystore` when Desktop and Manager must share a
signing identity.

Custom BKS, PKCS12, and JKS inputs are byte-sniffed. PKCS12/JKS are converted to a separate BKS
working copy; the source is never modified.

```bash
# Stable desktop default key
java -jar morphe-cli.jar patch -p patches.mpp -o out.apk input.apk

# Explicit shared/custom key
java -jar morphe-cli.jar patch -p patches.mpp \
  --keystore my.keystore --keystore-password secret \
  -o out.apk input.apk
```

## Split APK Support

The CLI auto-detects and merges complete split containers:

| Format | Extension |
|--------|-----------|
| Standard complete APK | `.apk` |
| XAPK container | `.xapk` |
| APKM container | `.apkm` |
| APKS container | `.apks` |

Pass the complete container when one exists. An extracted base APK is useful for analysis but
cannot supply omitted split resources, code, or native libraries.

## Getting the MPP path

Always use this pattern to get the exact MPP file:

```bash
PATCHES_DIR="${MORPHE_PATCHES_DIR:-morphe-patches}"
VER=$(grep "^version" "${PATCHES_DIR}/gradle.properties" | cut -d= -f2 | tr -d ' ')
MPP="${PATCHES_DIR}/patches/build/libs/patches-${VER}.mpp"
```

## patch — Patch an APK

```bash
java -jar morphe-cli.jar patch -p "$MPP" [options] <apk>
```

| Flag | Short | Description | Default |
|------|-------|-------------|---------|
| `--patches` | `-p` | Path to MPP file OR GitHub/GitLab/release URL (required, repeatable) | |
| `--out` | `-o` | Output APK path. If omitted, saved next to input in app-named subfolder | |
| `--install` | `-i` | Install via ADB after patching (optional device serial follows) | |
| `--enable` | `-e` | Enable patch by name (scoped to the preceding `--patches`) | |
| `--disable` | `-d` | Disable patch by name | |
| `--ei` | | Enable patch by index (combined list across all bundles) | |
| `--di` | | Disable patch by index | |
| `--exclusive` | | Disable all except enabled patches | false |
| `--options` | `-O` | Set patch option: `-Okey=value` | |
| `--options-file` | | Path to options JSON file (auto-generated from MPP if missing) | |
| `--options-update` | | Auto-update options JSON after patching | false |
| `--force` | `-f` | Skip version compatibility check | false |
| `--mount` | | Boolean flag — when combined with `-i`, install by mounting (root required) | false |
| `--unsigned` | | Don't sign the output APK | false |
| `--keystore` | | Custom keystore file path (BKS, PKCS12, or JKS; byte-sniffed, original unchanged) | |
| `--keystore-password` | | Keystore password | (empty) |
| `--keystore-entry-alias` | | Key alias | Morphe |
| `--keystore-entry-password` | | Key entry password | |
| `--signer` | | Signer name | Morphe |
| `--striplibs` | | Keep only specified architectures (comma-separated, e.g. `arm64-v8a,x86`) | |
| `--temporary-files-path` | `-t` | Custom temp directory | |
| `--result-file` | `-r` | Save JSON patching report to file | |
| `--disable-purge` | | Keep scratch files after patching | false |
| `--continue-on-error` | | Don't stop on first patch failure | false |
| `--bytecode-mode` | | DEX processing: FULL, STRIP_SAFE, or STRIP_FAST | STRIP_FAST |
| `--prerelease` | | Fetch dev pre-release from repo URL | false |
| `--verify-with-sdk` | | Verify patched DEX/APK with Android SDK tools | |

### Standard patch (default keystore)

`-f` is `--force` (skip the version-compatibility check); the APK is the positional last argument.

```bash
java -jar morphe-cli.jar patch \
  -p "$MPP" \
  -o analysis/<app>/builds/<app>_patched.apk \
  -f analysis/<app>/apk/<app>_<version>.<ext>
```

### Patch + install via ADB

```bash
java -jar morphe-cli.jar patch \
  -p "$MPP" \
  -o analysis/<app>/builds/<app>_patched.apk \
  -f -i analysis/<app>/apk/<app>_<version>.<ext>
```

### Patch + mount-install (root)

```bash
# --mount is a boolean flag used alongside -i
java -jar morphe-cli.jar patch \
  -p "$MPP" \
  -o analysis/<app>/builds/<app>_patched.apk \
  -f -i --mount analysis/<app>/apk/<app>_<version>.<ext>
```

### Exclusive mode (only specific patches)

```bash
java -jar morphe-cli.jar patch \
  -p "$MPP" \
  --exclusive -e "Premium Unlock" -e "Remove Ads" \
  -o analysis/<app>/builds/<app>_patched.apk \
  -f analysis/<app>/apk/<app>_<version>.<ext>
```

### With patch options

```bash
java -jar morphe-cli.jar patch \
  -p "$MPP" \
  -e "Patch Name" -Okey=value \
  -f analysis/<app>/apk/<app>_<version>.<ext>
```

### Use GitHub/GitLab repo URL directly

```bash
# Stable release (latest)
java -jar morphe-cli.jar patch -p https://github.com/user/patches input.apk

# Pre-release (dev branch)
java -jar morphe-cli.jar patch -p https://github.com/user/patches --prerelease input.apk

# GitLab repo
java -jar morphe-cli.jar patch -p https://gitlab.com/user/patches input.apk
```

### Multiple bundles

Name flags are scoped to the bundle that immediately preceded them:

```bash
java -jar morphe-cli.jar patch \
  -p https://github.com/user/bundle-a -e "Patch A" \
  -p local-bundle.mpp -e "Patch B" \
  input.apk
```

### Keep temp files for debugging

```bash
java -jar morphe-cli.jar patch -p "$MPP" --disable-purge -f input.apk
```

### Save patching result report

```bash
java -jar morphe-cli.jar patch -p "$MPP" -r result.json input.apk
```

## list-patches — List available patches

```bash
java -jar morphe-cli.jar list-patches --patches "$MPP" [options]
```

| Flag | Short | Description | Default |
|------|-------|-------------|---------|
| `--patches` | | Path to MPP file (required, repeatable) | |
| `--with-packages` | `-p` | Show compatible packages | false |
| `--with-versions` | `-v` | Show compatible versions | false |
| `--with-options` | `-o` | Show patch options | false |
| `--with-descriptions` | `-d` | Show descriptions | true |
| `--with-universal-patches` | `-u` | Show universal patches | true |
| `--index` | `-i` | Show patch index (position in combined list) | true |
| `--include-experimental` | `-x` | Include experimental app versions | false |
| `--filter-package-name` | `-f` | Filter by package name | |
| `--prerelease` | | Fetch dev pre-release from repo URL | false |
| `--out` | | Write to file instead of stdout | |

### Examples

```bash
# Full listing
java -jar morphe-cli.jar list-patches --patches "$MPP" -pvo

# Filter by app
java -jar morphe-cli.jar list-patches --patches "$MPP" -f com.truecaller -pvo

# Include experimental versions
java -jar morphe-cli.jar list-patches --patches "$MPP" -pvox

# Save to file
java -jar morphe-cli.jar list-patches --patches "$MPP" -pvo --out patches.txt
```

## list-versions — Show recommended versions

```bash
java -jar morphe-cli.jar list-versions --patches "$MPP" [options]
```

| Flag | Short | Description | Default |
|------|-------|-------------|---------|
| `--patches` | | Path to MPP file (required, repeatable) | |
| `--filter-package-names` | `-f` | Filter by package name (repeatable) | |
| `--count-unused-patches` | `-u` | Include non-default patches in count | false |
| `--include-experimental` | `-x` | Include experimental versions | false |
| `--prerelease` | | Fetch dev pre-release from repo URL | false |

### Examples

```bash
java -jar morphe-cli.jar list-versions --patches "$MPP"
java -jar morphe-cli.jar list-versions --patches "$MPP" -f com.truecaller
java -jar morphe-cli.jar list-versions --patches "$MPP" -ux
```

## options-create — Generate options JSON

`--out` is required. If `--options-file` is passed to `patch` and the file doesn't exist,
it is auto-generated from the MPP before patching begins.

```bash
java -jar morphe-cli.jar options-create -p "$MPP" -o options.json [options]
```

| Flag | Short | Description |
|------|-------|-------------|
| `--patches` | `-p` | Path to MPP file (required) |
| `--out` | `-o` | Output JSON file path (required) |
| `--filter-package-name` | `-f` | Filter by package name |
| `--prerelease` | | Fetch dev pre-release from repo URL |

## utility install — Install APK via ADB

```bash
java -jar morphe-cli.jar utility install -a <apk> [options] [deviceSerials...]
```

| Flag | Short | Description |
|------|-------|-------------|
| `--apk` | `-a` | APK file to install (required) |
| `--mount` | `-m` | Mount over existing app; takes the package name as argument |
| `--route-links` | | Route app's supported web links to it ("open with") |
| `--disable-stock` | | With --route-links: takes stock package name; stops it from handling those links |

### Examples

```bash
# Standard install
java -jar morphe-cli.jar utility install -a analysis/<app>/builds/<app>_patched.apk

# Install on specific device
java -jar morphe-cli.jar utility install -a app_patched.apk ABC123DEF

# Mount install (root) — -m takes the package name
java -jar morphe-cli.jar utility install -a app_patched.apk -m com.example.app

# Install + route links (--disable-stock takes the stock package name)
java -jar morphe-cli.jar utility install -a app_patched.apk \
  --route-links --disable-stock com.example.app
```

## utility uninstall — Uninstall app

```bash
java -jar morphe-cli.jar utility uninstall -p <packageName> [options] [deviceSerials...]
```

| Flag | Short | Description |
|------|-------|-------------|
| `--package-name` | `-p` | Package name (required) |
| `--unmount` | `-u` | Unmount instead of uninstall |

## utility clear-cache

⚠ **Mutating command — explicit-only.** Deletes cached files immediately with no prompt.
Inspect flags safely with `--help`:

```bash
java -jar morphe-cli.jar utility clear-cache --help
```

| Flag | Description |
|------|-------------|
| `--info` | Show per-category breakdown of what was cleared and space freed |

Do not include `clear-cache` in routine build/deploy workflows.

## Full Workflow

```bash
# 1. Build patches
PATCHES_DIR="${MORPHE_PATCHES_DIR:-morphe-patches}"
cd "${PATCHES_DIR}" && ./gradlew buildAndroid && cd ..

# 2. Get MPP path
VER=$(grep "^version" "${PATCHES_DIR}/gradle.properties" | cut -d= -f2 | tr -d ' ')
MPP="${PATCHES_DIR}/patches/build/libs/patches-${VER}.mpp"

# 3. List patches
java -jar morphe-cli.jar list-patches --patches "$MPP" -pvo

# 4. Patch + install
java -jar morphe-cli.jar patch \
  -p "$MPP" \
  -o analysis/<app>/builds/<app>_patched.apk \
  -f -i analysis/<app>/apk/<app>_<version>.<ext>
```
