# Pixiv Morphe Patches - Workspace Guidelines

## Git & Repository Invariants
- **No GPG Signing**: Always execute git commits with `--no-gpg-sign` (or ensure `git config commit.gpgsign false`).
- **Target Remote**: Push strictly to `origin main` (`https://github.com/Fripe070/PixivPatches`). Never push to upstream or foreign repositories.
- **Branch Invariant**: Production code lives on `main`. Releases are automated through annotated or lightweight tags (`v*`).

## Repository Architecture & Components
This repository produces a Morphe `.mpp` patch bundle for the official Pixiv Android app (`jp.pxv.android` v6.196.0):
1. **Patches module (`patches/`)**: Defines Morphe bytecode hooks (smali instructions, class/method transforms) applied by Morphe Patcher/CLI to the target APK.
2. **Extensions module (`extensions/pixiv/`)**: Companion runtime Kotlin code compiled into DEX (`pixiv.mpe`), embedded into the `.mpp` bundle, and invoked directly by bytecode hooks.
3. **Morphe Manager Metadata (`patches-bundle.json`)**: Manifest consumed by Morphe Manager at `https://raw.githubusercontent.com/Fripe070/PixivPatches/main/patches-bundle.json` to resolve updates.

## Reverse-Engineering & Inspection Protocol
When researching Pixiv obfuscated classes, layouts, or IDs:
- **Decompiled Java Sources (`tools/decompiled/sources/`)**: The complete, pre-decompiled codebase with 14,000+ semantic mappings is stored here. **DO NOT run ad-hoc JADX single-class dumps.** Always grep or view these files directly.
- **Bytecode Reference Invariant**: Every renamed class in `tools/decompiled/sources/` retains its original smali name in its header comment (`/* JADX INFO: renamed from: <smali> */`). Use this original name when creating Morphe bytecode hooks (e.g. `mutableClassDefBy("L<smali>;")`).
- **Interactive JADX GUI**: Use `tools/jadx/bin/jadx-gui.bat ..\pixiv-base.apk` for symbol renaming (`N`), xref lookup (`X`), and visual inspection.
- **Continuous Mapping Protocol**: When you identify an obfuscated class/method, **append it** to `tools/generate-jobf.py` under `# 2b. Curated Reverse-Engineering Targets`:
  ```python
  add_class("raw_smali_name", "jp.pxv.android.package.SemanticName")
  ```
  **DO NOT trigger a full JADX re-decompilation mid-task**—this locks up files for concurrent agents. Continue using the class immediately in hooks. Decompiled sources will be batch regenerated during release milestones.
- **Apktool / Decoded Resources**: Decoded layouts, strings, and drawables reside in `tools/apktool_out/res/`.
- **Reference Clones**: When inspecting reference repos, shallow clone locally (`git clone --depth 1 <url>`) and clean up temporary directories when done.

## Local Build Pipelines

### Primary: Fast Offline Pipeline (`build-mpp.ps1`)
Use `.\build-mpp.ps1` for local validation. It compiles extension Kotlin with `kotlinc`, runs `d8` to dex it, packages the `.mpp`, validates definitions via `morphe-cli`, and runs `dexdump` verification in ~15 seconds:
```powershell
.\build-mpp.ps1
# Or with an explicit version override:
.\build-mpp.ps1 -Version "<version>"
```

### Secondary: Gradle Multi-Project Build (CI Pipeline)
Used in GitHub Actions. Requires network access or Gradle cache:
```bash
./gradlew :patches:buildAndroid -Pversion=<version> --no-daemon
```

## Emulator & Device Testing Procedure

> [!TIP]
> **Choose the right test level:**
> - To test compilation only: `.\build-mpp.ps1` (~15s).
> - For full regression testing across all features: run `.\scripts\test-patches.ps1` directly—it **automatically** builds the MPP, patches the APK, installs it, and runs visual tests. Do not run manual build/deploy steps beforehand.
> - For targeted interactive debugging: use the steps below.

1. **Locations**:
   - ADB: `$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe`
   - CLI: `..\tools\morphe-cli.jar`
   - Base APK: `..\pixiv-base.apk` (`jp.pxv.android` v6.196.0)
   - Target Device: `emulator-5554` (`Pixel_8_API_35`)
2. **Interactive Build & Patch** (when manually debugging):
   - Build MPP: `.\build-mpp.ps1`
   - Patch APK: `java -jar ..\tools\morphe-cli.jar patch -p (Get-Item patches\build\libs\*.mpp).FullName -o pixiv-patched.apk ..\pixiv-base.apk`
3. **Deploy & Launch**:
   - Install: `& $adb -s emulator-5554 install -r -d pixiv-patched.apk`
   - Launch: `& $adb -s emulator-5554 shell monkey -p jp.pxv.android -c android.intent.category.LAUNCHER 1`
   - Deep-Link: `& $adb -s emulator-5554 shell am start -a android.intent.action.VIEW -d "https://www.pixiv.net/artworks/<ID>" -p jp.pxv.android` (Always specify `-p jp.pxv.android`, otherwise Android opens the web browser instead of the app). Or use `Open-Work -IllustId "<ID>" -Wait` from `scripts/emulator-cli.ps1`.
4. **Verification & Debugging**:
   - **Live Logs**:
     ```powershell
     & $adb -s emulator-5554 logcat -c; & $adb -s emulator-5554 logcat -v time | Select-String "Pixiv|Morphe"
     ```
   - **Screenshot Conventions & Capture**:
     - **Storage Location**: Always save screenshots inside the `captures/` directory (which is gitignored). **Never dump screenshots, image files, or UI hierarchy JSON in the root workspace directory.**
     - **Directory Setup**: Ensure the directory exists before capturing:
       ```powershell
       New-Item -ItemType Directory -Force -Path captures | Out-Null
       ```
     - **Naming Pattern**: Name files descriptively using feature and state prefixes:
       `captures/<feature>_<screen-or-state>_<detail>.png`
       - ✅ **Good**: `captures/ai_banner_detail_top.png`, `captures/viewer_pinch_zoom_hd.png`, `captures/adblock_feed_home.png`
       - ❌ **Bad**: `screenshot.png`, `screencap.png`, `test.png`, `screenshot_main.png` (prevents cross-agent overwrite collisions and ambiguities)
     - **Capture Command (with Live Preview Mirror)**:
       Save to a descriptive file for agent reasoning and mirror to `captures/latest.png` (or `captures/<feature>_latest.png`) so a user's pinned preview tab auto-refreshes in real time:
       ```powershell
       & $adb -s emulator-5554 exec-out screencap -p > captures/<feature>_<screen>_<detail>.png
       Copy-Item captures/<feature>_<screen>_<detail>.png captures/latest.png -Force
       ```
     - **Hygiene**: Delete or archive transient captures after verifying changes to prevent disk clutter.

## Step-by-Step GitHub Release Procedure
Whenever code, extensions, or patch definitions are ready for a new release:

1. **Update Version**:
   - In `patches/build.gradle.kts`, update the default fallback version:
     ```kotlin
     version = (project.findProperty("version") as? String) ?: "<new-version>"
     ```
2. **Local Build & Sanity Check**:
   - Run `.\build-mpp.ps1` to ensure compilation, bytecode hooks, DEX generation, and `dexdump` verification succeed with code 0.
3. **Batch Refresh Decompiled Sources**:
   - Run `..\tools\update-sources.ps1` to compile any newly recorded mappings into `tools/decompiled/sources/`.
4. **Commit & Push to Main**:
   - `git add <relevant files>` (do not stage in-progress parallel agent work)
   - `git commit --no-gpg-sign -m "chore(release): bump version to <version>"`
   - `git push origin main`
5. **Tag & Trigger Automated GitHub Actions Release**:
   - Create and push a matching version tag:
     ```bash
     git tag v<version>
     git push origin v<version>
     ```
   - GitHub Actions (`.github/workflows/build.yml`) will automatically:
     1. Build the Android `.mpp` patch bundle with `-Pversion=<version>`.
     2. Create the GitHub Release and upload `pixiv-patches-<version>.mpp`.
     3. Generate `patches-bundle.json` with matching version and download URLs.
     4. Commit and push the manifest back to `main` with `[skip ci]`.
   - Morphe Manager will immediately resolve the new release on next refresh.
