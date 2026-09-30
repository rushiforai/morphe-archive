# Pixiv Morphe Patches — Scripts & Tooling Index

This directory contains automation, testing, and debugging utilities for the Pixiv Morphe patch suite.

---

## Script Overview

| Script | Purpose | Usage |
| :--- | :--- | :--- |
| **[`test-patches.ps1`](test-patches.ps1)** | **Automated E2E Verification**: Builds MPP, patches APK, deploys to device, and runs the 6-point combo synchronization visual test suite (Feed, Detail, Recommended, Downloader, Enhanced Viewer, Popular Search). | `.\scripts\test-patches.ps1` |
| **[`emulator-bootstrap.ps1`](emulator-bootstrap.ps1)** | **Environment Bootstrap**: Checks/starts emulator, waits for full OS boot, unlocks keyguard, clears ANRs, deploys APK, and launches Pixiv. | `.\scripts\emulator-bootstrap.ps1` |
| **[`emulator-cli.ps1`](emulator-cli.ps1)** | **Interactive CLI Toolkit**: Dot-sourceable PowerShell module providing fast one-liners for live debugging, DOM inspection, and tall screenshots. | `. .\scripts\emulator-cli.ps1` |

> [!NOTE]
> The primary build entry point remains at the repository root: **[`build-mpp.ps1`](../build-mpp.ps1)** (and `build-mpp.bat`), analogous to `gradlew`.

---

## Interactive Developer Toolkit (`emulator-cli.ps1`)

Import all helper functions into your current PowerShell session:

```powershell
. .\scripts\emulator-cli.ps1
```

### Available Helper Commands

- **`Capture-Screen [-Name <string>] [-WaitForNode <id>] [-Wait]`**  
  Captures clean binary PNGs using on-device storage + ADB pull (preventing PowerShell text encoding corruption) and mirrors to `captures/latest.png`.
  ```powershell
  Capture-Screen "detail.png" -WaitForNode "tool_bar"
  ```

- **`Capture-TallScreen [-Name <string>] [-ScrollSteps <int>]`**  
  Captures multi-step scrolling screenshots and stitches them seamlessly into a single tall image (e.g. capturing header art, metadata, recommended works, and comments together).
  ```powershell
  Capture-TallScreen "tall_artwork_detail.png" -ScrollSteps 3
  ```

- **`Dump-Ui [-Filter <regex>]`**  
  Dumps and filters the active UI hierarchy directly into formatted PowerShell objects with bounding box centers.
  ```powershell
  Dump-Ui -Filter "Download"
  ```

- **`Tap-Node [-Desc <str>] [-Id <str>] [-Text <str>]`**  
  Locates a matching element on screen and automatically taps its center coordinate.
  ```powershell
  Tap-Node -Desc "Download"
  ```

- **`Open-Work -IllustId <id> [-Wait]`**  
  Directly deep-links into an illustration without navigating browser choosers.
  ```powershell
  Open-Work -IllustId "121352238" -Wait
  ```

- **`Test-EnhancedViewer [-IllustId <id>]`**  
  Runs a targeted two-step capture comparing the instantaneous placeholder against the settled high-resolution image.

---

## Automated Verification Suite (`test-patches.ps1`)

Runs the end-to-end regression test suite using **Combo Synchronization** (Window Focus + UI Hierarchy + Render Settle + Logcat Corroboration):

```powershell
.\scripts\test-patches.ps1
```

Outputs 7 canonical captures into `captures/`:
1. `test_01_feed.png`: Feed adblocker and thumbnail flags.
2. `test_02_ai_detail.png`: Single top AI warning banner & title tag.
3. `test_03_recommended.png`: Recommended Works section below fold.
4. `test_04_download_grid.png`: Multi-image download picker grid.
5. `test_05a_fullscreen_half_loaded.png` / `test_05b_fullscreen_highres.png`: Instant low-res placeholder, discreet HD loading badge, and subsequent full-res swap.
6. `test_06_popular_search.png`: Popular search tab preview API routing & persistent trial bypass.
7. `test_07_mute_settings.png`: Unlimited mute settings list and local persistence across restart.
