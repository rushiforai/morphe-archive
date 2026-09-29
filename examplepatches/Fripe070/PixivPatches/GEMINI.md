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
- **Apktool / Decoded Resources**: Use `tools/apktool.jar` to decode resources (`tools/apktool_out/res`).
- **JADX Decompiler**: Use `tools/jadx/bin/jadx.bat` with `--single-class <full.class.Name>` against `pixiv-base.apk` to inspect decompiled Java without decompiling the entire 40MB APK at once.
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
1. **Locations**:
   - ADB: `$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe`
   - CLI: `tools\morphe-cli.jar`
   - Base APK: `pixiv-base.apk` (`jp.pxv.android` v6.196.0)
   - Target Device: `emulator-5554` (`Pixel_8_API_35`)
2. **Build & Patch**:
   - Build MPP: `.\build-mpp.ps1`
   - Patch APK: `java -jar tools\morphe-cli.jar patch -p (Get-Item patches\build\libs\*.mpp).FullName -o pixiv-patched.apk pixiv-base.apk`
3. **Deploy & Launch**:
   - Install: `& $adb -s emulator-5554 install -r -d pixiv-patched.apk`
   - Launch: `& $adb -s emulator-5554 shell monkey -p jp.pxv.android -c android.intent.category.LAUNCHER 1`
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
3. **Commit & Push to Main**:
   - `git add <relevant files>` (do not stage in-progress parallel agent work)
   - `git commit --no-gpg-sign -m "chore(release): bump version to <version>"`
   - `git push origin main`
4. **Tag & Trigger Automated GitHub Actions Release**:
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
