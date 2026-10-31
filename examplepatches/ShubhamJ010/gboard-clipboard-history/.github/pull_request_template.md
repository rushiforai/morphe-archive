## Description

<!-- Provide a brief description of the changes introduced in this PR. -->

## Type of Change

- [ ] 🐛 Bug fix (non-breaking change fixing an issue)
- [ ] ✨ New feature (non-breaking change adding functionality)
- [ ] 🎨 UI / Theme refinement (Material 3, Monet dynamic palette, layout)
- [ ] ⚡ Performance / Bytecode optimization (DEX size, hook efficiency)
- [ ] 📝 Documentation update (README, metadata, setup guides)
- [ ] 🔧 Build / CI maintenance (Gradle, local build script, GitHub Actions)

## Components Modified

- [ ] `extensions/extension` (Java runtime extension, SQLite repository, ContentProvider, UI Activity)
- [ ] `patches` (Kotlin Morphe patches: carrier, history, sync, package rename)
- [ ] `settings.xml` / `setting_clipboard.xml` (Gboard preference hierarchy)
- [ ] `patches-bundle.json` / `patches-list.json` (Morphe repository metadata)
- [ ] Build & CI scripts (`scripts/build-mpp.sh`, `scripts/build-gradle.sh`, `scripts/build-all.sh`, `.github/workflows/build.yml`)

## On-Device Testing & Verification

- **Device Model**: 
- **Android Version**: 
- **Gboard Base Version**: 
- **Tested Scenarios**:
  - [ ] Standalone patch compilation (`./scripts/build-mpp.sh`) produces clean `.mpp`
  - [ ] Stock APK patching and signing produces functional `.apk`
  - [ ] App installs and runs as active IME without crash
  - [ ] Clipboard entry appears under `Gboard Settings -> Clipboard` (and NOT in root settings)
  - [ ] Foreground clip sync works when typing / copying across apps (e.g. Google Keep)
  - [ ] Clipboard History Material 3 UI displays properly with Monet palette
  - [ ] ContentProvider reads work via URI / access token

## Screenshots / Screen Recordings

<!-- Attach before/after screenshots or screen recordings if UI or layout was modified. -->

## Checklist

- [ ] My code follows the code style and conventions of this repository.
- [ ] I have tested these changes on a physical device or emulator.
- [ ] I have updated relevant documentation and metadata where applicable.
