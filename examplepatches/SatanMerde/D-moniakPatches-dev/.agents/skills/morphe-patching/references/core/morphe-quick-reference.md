# Morphe Patch Development — Quick Reference

Always-loaded context for the morphe workspace.

## Workspace Layout

```
morphe/
├── morphe-patches/              # Patches repo — name set by MORPHE_PATCHES_DIR (default: morphe-patches)
├── analysis/<app>/              # APK analysis folders
│   ├── apk/                     # Original APKs (any format: .apk, .apkm, .xapk, .apks)
│   ├── decompiled/              # Java sources (from jadx)
│   ├── smali/                   # baksmali output
│   ├── builds/                  # Patched APKs
│   └── notes/                   # Analysis docs (recon.md, premium-bypass.md, etc.)
├── MorpheApp/                   # Official repos + community repos (gitignored)
├── morphe-cli.jar               # CLI symlink
├── AGENTS.md                    # Root agent prompt
└── .kiro/
    ├── agents/                  # Agent configs
    ├── prompts/                 # Agent prompt files
    ├── skills/                  # Skills (on-demand)
    ├── steering/                # Steering files (always loaded per agent)
    └── jadx-decompile           # Remote decompiler script (Kaggle)
```

The CLI normally stores working data in `morphe-data/` beside the real jar. A writable
`MORPHE_DATA_DIR` overrides it; home/XDG locations are fallbacks when jar-adjacent storage is
unavailable. The root contains downloaded `patches/`, logs, tmp files, and default
`morphe.keystore`. The key is stable across desktop runs but is not automatically copied to a
phone; export/import or configure one custom key when Desktop and Manager must share identity.
No project-root `Morphe.keystore` is required.

## Agents (6)

| Agent | Job |
|-------|-----|
| morphe | Root orchestrator — routes to correct agent |
| apk-recon | Quick APK identification (aapt, apkid) |
| apk-decompiler | Remote decompile via Kaggle |
| target-hunter | Search decompiled code + verify smali |
| patch-writer | Write Kotlin patches |
| patch-deployer | Build, test, deploy |

## Patches Directory Convention

All commands resolve the patches repo via the `MORPHE_PATCHES_DIR` environment variable:
```bash
PATCHES_DIR="${MORPHE_PATCHES_DIR:-morphe-patches}"
```
Set `MORPHE_PATCHES_DIR` in your shell profile or `.env` file if your repo uses a different name.

## Key Commands

```bash
PATCHES_DIR="${MORPHE_PATCHES_DIR:-morphe-patches}"

# Build
cd "${PATCHES_DIR}" && ./gradlew buildAndroid && cd ..

# Get MPP
VER=$(grep "^version" "${PATCHES_DIR}/gradle.properties" | cut -d= -f2 | tr -d ' ')
MPP="${PATCHES_DIR}/patches/build/libs/patches-${VER}.mpp"

# List patches
java -jar morphe-cli.jar list-patches --patches "$MPP" -pvo

# Patch APK (original from apk/ folder; default keystore in morphe-data/).
# -f is --force (skip version check); the APK path is the positional last argument.
java -jar morphe-cli.jar patch -p "$MPP" \
  -o analysis/<app>/builds/<app>_patched.apk -f analysis/<app>/apk/<app>_<version>.<ext>

# Decompile (Kaggle)
.kiro/jadx-decompile "<direct-download-url>" analysis/<app>/
```

## Git Workflow

- **All development on `dev` branch** — never commit to main directly
- `feat:` → minor release, `fix:` → patch release, `docs:`/`chore:` → no release
- Always `git pull` after push (CI auto-updates CHANGELOG.md, gradle.properties,
  patches-bundle.json, patches-list.json, and README.md)
- Merge dev → main only after verified and tested

## Patch Conventions

- Patches in: `${PATCHES_DIR}/patches/src/main/kotlin/<group>/patches/<app>/<category>/`
  - Discover `<group>` from existing source tree or `build.gradle.kts`, not assumed
- Each app: `shared/Constants.kt`, `<category>/Fingerprints.kt`, `<category>/*Patch.kt`
- Always `bytecodePatch` (fastest), `@Suppress("unused")` on vals
- Verify fingerprints against smali, never use obfuscated names
- Use `returnEarly(true)` for simple premium bypasses
- Use `BytecodeUtils` from `app.morphe.util` for advanced operations
