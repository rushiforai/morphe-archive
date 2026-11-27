# Brave v1.100.58 Morphe Patch Suite — Manual QA Verification Checklist

This document provides a manual verification checklist for validating the patches in this repository targeting **Brave Browser Android `v1.100.58`** (`versionCode: 430005804`).

> **Note**: Helper QA server/fixture scripts are not bundled in this repository. Build the patch bundle via `./gradlew build`, patch a clean Brave v1.100.58 APK with Morphe CLI, install via `adb install`, and verify each scenario below against a local HTTP server (e.g., `http://127.0.0.1:8765/` with `adb reverse tcp:8765 tcp:8765`) or live test pages.

---

## 0. Pre-Flight Environment & Device Setup

| Step | Action | Verification Command | Expected Output | Status |
|:---|:---|:---|:---|:---|
| **0.1** | Build Patch Bundle | `./gradlew build` | `patches/build/libs/patches-1.0.0.mpp` created, exit code 0 | [ ] PASS / [ ] FAIL |
| **0.2** | Patch Brave APK | `java -jar morphe-cli.jar patch --patches patches/build/libs/patches-1.0.0.mpp --out brave-patched.apk base.apk` | Patched APK produced with 0 errors | [ ] PASS / [ ] FAIL |
| **0.3** | Setup Local Test Server (Optional) | `adb reverse tcp:8765 tcp:8765` | Returns exit code 0 | [ ] PASS / [ ] FAIL |
| **0.4** | Install Patched APK | `adb install -r brave-patched.apk` | `Success` (coexists with official Brave when Clone Package patch is enabled) | [ ] PASS / [ ] FAIL |

---

## 1. Core Infrastructure & Downloader Patches (Patches 1 – 6)

### Patch 1: Brave Core Infrastructure (Active Tab Tracking) `[STATUS: IMPLEMENTED IN MAIN]`
- **Target Class / Hook**: `Lorg/chromium/chrome/browser/ActivityTabProvider;->k(Lorg/chromium/chrome/browser/tab/Tab;)V`
- **Procedure**:
  1. Open tab 1 on `http://127.0.0.1:8765/` and trigger media detection.
  2. Open tab 2 to a clean local page (e.g., `about:blank` or second tab).
  3. Switch back and forth between tabs.
- **Pass/Fail Criteria**:
  - [ ] **PASS**: Toolbar download button badge reflects the active tab's detected media count instantly on tab switch; no cross-tab state leakage.
  - [ ] **FAIL**: Badge remains static or retains media count from inactive tabs.

---

### Patch 2: Media & HLS Downloader (Toolbar Button & UI) `[STATUS: IMPLEMENTED IN MAIN]`
- **Target Class / Hook**: `Lorg/chromium/chrome/browser/toolbar/top/ToolbarPhone;->onFinishInflate()V`
- **Procedure**:
  1. Inspect the top toolbar on `http://127.0.0.1:8765/`.
  2. Tap the custom download button in the toolbar buttons cluster.
  3. Verify the bottom sheet modal pops up.
- **Pass/Fail Criteria**:
  - [ ] **PASS**: Custom media button is placed right next to Shields/Tab Switcher, reacts to taps, displays media item bottom sheet with detected streams.
  - [ ] **FAIL**: Button missing, overlaps tab switcher, or crashes on tap.

---

### Patch 3: Toolbar Theme & Incognito Tint Synchronization `[STATUS: IMPLEMENTED IN MAIN]`
- **Target Class / Hook**: `Lorg/chromium/chrome/browser/toolbar/top/ToggleTabStackButton;->i(I)V`
- **Procedure**:
  1. Test custom toolbar button in Default Light Theme (`brandedColorScheme = 0`).
  2. Switch to Dark Theme (`brandedColorScheme = 1`).
  3. Open a New Incognito Tab (`brandedColorScheme = 2`).
- **Pass/Fail Criteria**:
  - [ ] **PASS**: Custom button icon color matches adjacent tab switcher icon 100% across Light (dark icon), Dark (light icon), and Incognito (purple/pure white icon) without lag.
  - [ ] **FAIL**: Button remains hardcoded gray/orange or displays incorrect contrast in Incognito.

---

### Patch 4: Direct Media Sniffer & HLS Multi-Variant Remuxing `[STATUS: IMPLEMENTED IN MAIN]`
- **Target Class / Hook**: `Brave_MediaBridge` & `Brave_HlsParser`
- **Procedure**:
  1. On Card 1, tap "Trigger Both Playback" (`direct_sample.mp4` and `direct_audio.mp3`).
  2. On Card 2, tap "MPEG-TS Multi-Variant" (`/fixtures/hls_ts/master.m3u8`).
  3. Open the Download Bottom Sheet and tap "Download 720p".
  4. Wait for download notification to complete; open resulting `.mp4` file in gallery/video player.
- **Pass/Fail Criteria**:
  - [ ] **PASS**: MPEG-TS segments remux into standard MP4 container; audio and video are strictly synchronized (sine tone matches visual pattern); duration is exactly 10s.
  - [ ] **FAIL**: Desync between audio and video, distorted tone, incomplete duration, or crash in `MediaDownloadService`.

---

### Patch 5: Clear-Key AES-128 HLS Decryption `[STATUS: IMPLEMENTED IN MAIN]`
- **Target Endpoint**: `http://127.0.0.1:8765/fixtures/hls_aes128/encrypted.m3u8`
- **Procedure**:
  1. Tap "AES-128 Encrypted" button on Card 2.
  2. Tap download button in toolbar; select AES-128 stream.
  3. Verify key retrieval from `/fixtures/hls_aes128/key.bin` and in-memory AES-CBC segment decryption.
- **Pass/Fail Criteria**:
  - [ ] **PASS**: Output `.mp4` plays cleanly with intact video test frames and 523Hz audio tone.
  - [ ] **FAIL**: Output file is 0 bytes, corrupted, or downloader throws `javax.crypto.BadPaddingException`.

---

### Patch 5b: Fragmented MP4 (fMP4 / CMAF) HLS Remuxing `[STATUS: IMPLEMENTED IN MAIN]`
- **Target Endpoint**: `http://127.0.0.1:8765/fixtures/hls_fmp4/fmp4.m3u8`
- **Procedure**:
  1. Tap "fMP4 / CMAF" button on Card 2.
  2. Open toolbar download bottom sheet; tap "Download fMP4 Stream".
  3. Verify downloader retrieves initialization segment (`init.mp4`), prepends it to fragmented `.m4s` segments, and produces standard playable `.mp4`.
- **Pass/Fail Criteria**:
  - [ ] **PASS**: Output `.mp4` plays cleanly with intact video test frames and 659Hz audio tone; duration matches playlist.
  - [ ] **FAIL**: Download hangs, output file is missing `moov` atom, or `MediaDownloadService` crashes.

---

### Patch 6: Cookie & Referer Gated Stream Forwarding `[STATUS: IMPLEMENTED IN MAIN]`
- **Target Endpoint**: `http://127.0.0.1:8765/gated/hls_ts/master.m3u8`
- **Procedure**:
  1. Tap "Gated Stream (Auth/Cookie)" button on Card 2.
  2. Confirm browser possesses `qa_session=brave_ok` cookie set by `/`.
  3. Initiate download through the toolbar bottom sheet.
- **Pass/Fail Criteria**:
  - [ ] **PASS**: Downloader passes active session cookie and Referer header; server returns HTTP 200 and download completes.
  - [ ] **FAIL**: Server returns HTTP 403 Forbidden; download fails with header missing error.

---

## 2. Security, UI & UX Patches (Patches 7 – 11)

### Patch 7: Mock DRM Stream Clean Rejection `[STATUS: IMPLEMENTED IN MAIN]`
- **Target Endpoint**: `http://127.0.0.1:8765/fixtures/hls_drm_mock/drm.m3u8`
- **Procedure**:
  1. Tap "Mock DRM (Widevine)" button on Card 2.
  2. Observe toolbar badge and sniffer log.
- **Pass/Fail Criteria**:
  - [ ] **PASS**: Stream is recognized as encrypted DRM (`SAMPLE-AES`, Widevine SystemID); sniffer skips stream cleanly; no crash occurs; user receives informative toast.
  - [ ] **FAIL**: Downloader crashes or attempts to download encrypted unplayable garbage.

---

### Patch 8: Image Bulk-Grabber & WebP-to-PNG/JPG Conversion `[STATUS: IMPLEMENTED IN MAIN]`
- **Target Card**: Card 3 (Image Bulk-Grabber)
- **Procedure**:
  1. Tap the custom toolbar download button and switch to the **Images** tab in the bottom sheet.
  2. Inspect the detected image list (tests both `src`, lazy-load attributes, and `srcset` attributes).
  3. Toggle "Convert WebP to PNG", select `hero_1200x800.webp`, and tap "Download Selected" / "Download All".
- **Pass/Fail Criteria**:
  - [ ] **PASS**: All 4 images `>= 500px` (`hero`, `landscape`, `portrait`, `square`) appear in the selector; `icon_100x100.webp` is filtered out; converted PNG opens cleanly in Android Gallery.
  - [ ] **FAIL**: Small icon appears in list, or WebP conversion fails/corrupts output.

---

### Patch 9: Fullscreen HTML5 Video Gestures & Controls `[STATUS: INTEGRATION READY (feat/gestures-clone-tools)]`
- **Target Card**: Card 4 (Fullscreen Video)
- **Target Hook**: `Lv28;->h(...)V` (`FullscreenManager`)
- **Procedure**:
  1. On Card 4, tap "Go Fullscreen" (using 30s test video).
  2. Swipe vertically on the **left 35%** of the screen.
  3. Swipe vertically on the **right 35%** of the screen.
  4. Swipe horizontally across the center (tests HTTP 206 Partial Content range seek).
  5. Long-press on the video.
  6. Tap once in the center without dragging.
- **Pass/Fail Criteria**:
  - [ ] **PASS**:
    - Left swipe adjusts system brightness (overlay indicator shows percentage).
    - Right swipe adjusts stream volume.
    - Horizontal swipe scrubs time forward/backward cleanly via HTTP 206 range requests.
    - Long-press triggers 2.0x playback speed; release restores 1.0x.
    - Single tap cleanly passes through to native video controls (play/pause).
  - [ ] **FAIL**: Gestures unresponsive, touch deadzones block play/pause controls, or crash on exiting fullscreen.

---

### Patch 10: Force Copy & Paste Bypass `[STATUS: BLUEPRINTED (RECON_DELTA.md Section 5)]`
- **Target Card**: Card 5 (Force Copy / Paste)
- **Target Hook**: `Ld14;` / CSS & JS event interceptors
- **Procedure**:
  1. In Card 5, attempt to long-press and select `TOKEN_BRAVE_QA_VERIFIED_FORCE_COPY_OK_2026`.
  2. Copy the token.
  3. Paste into the input field below.
- **Pass/Fail Criteria**:
  - [ ] **PASS**: Text selection handles appear despite `user-select: none`; copy action captures text into clipboard; paste completes without being blocked by page JS listeners.
  - [ ] **FAIL**: Text cannot be selected, or paste action is aborted by the hostile script.

---

### Patch 11: Element Zapper & Ad-Blocker Custom CSS `[STATUS: BLUEPRINTED (NOT IMPLEMENTED IN MAIN — RECON_DELTA.md Section 1)]`
- **Target Card**: Card 6 (Element Zapper)
- **Procedure**:
  1. *(Pending implementation of 3-dot "Brave Tools" menu entry)* Open 3-dot menu -> "Brave Tools" -> "Element Zapper".
  2. Tap `#annoying-sticky-banner` at top of page -> Tap "Zap / Block Element".
  3. Tap `#login-nag-overlay` -> Tap "Zap / Block Element".
  4. Refresh the page (`F5` or swipe down).
- **Pass/Fail Criteria**:
  - [ ] **PASS**: Both elements vanish immediately; upon page refresh, elements remain permanently hidden via saved cosmetic filter rules.
  - [ ] **FAIL**: Elements do not disappear or reappear after page reload.

---

### Patch 11b: Userscripts & Offline DevTools Inspection `[STATUS: BLUEPRINTED (RECON_DELTA.md Section 8)]`
- **Target Card**: Card 8 (Userscripts & Offline DevTools)
- **Procedure**:
  1. On Card 8, tap "Toggle Eruda DevTools".
  2. Tap "Verify Storage Keys".
- **Pass/Fail Criteria**:
  - [ ] **PASS**: Eruda console is summoned when injected or status prompt indicates requirement to enable Eruda in Brave Tools; `localStorage` (`brave_qa_key`) and `sessionStorage` (`brave_qa_session`) keys are inspected and verified without network dependency.
  - [ ] **FAIL**: Browser makes external network requests to external CDNs or crashes.

---

## 3. Privacy, Performance & Theming Patches (Patches 12 – 15)

### Patch 12: Share & Copy Tracking Stripper `[STATUS: BLUEPRINTED (RECON_DELTA.md Section 5)]`
- **Target Card**: Card 7 (Share & Copy Stripper)
- **Target Class / Hook**: `Ld14;->setText(Ljava/lang/String;)V` and `Ljn2;->d(...)V`
- **Procedure**:
  1. On Card 7, tap "Copy Link" for Test Target 1 (URL with `utm_source`, `fbclid`, `gclid`, `si`, `igshid`, `#reviews`).
  2. Long-press on `test-anchor-link` and select "Copy link address" from context menu.
  3. Paste into an external notepad or search bar.
  4. Tap "Copy Memo" for Test Target 2 (Plain text memo containing `utm_source` in text).
  5. Paste memo into notepad.
- **Pass/Fail Criteria**:
  - [ ] **PASS**:
    - URL is stripped to `https://example.com/product#reviews` (all tracking tokens removed; path and fragment preserved) across both button copy and native context menu copy.
    - Memo text is 100% untouched: `"Notes: Discussed utm_source and fbclid parameters during team standup at 10:30am. Key: 12345."`.
  - [ ] **FAIL**: Tracking parameters remain in URL, or non-URL memo is corrupted/cleared.

---

### Patch 13: True AMOLED Black Theme `[STATUS: BLUEPRINTED (RECON_DELTA.md Section 2)]`
- **Target Class / Hook**: `Lg7b;->g(...)I` (`SemanticColorUtils`) and `res/values-night/colors.xml`
- **Procedure**:
  1. Enable Dark Theme in Brave Settings -> Appearance -> Dark.
  2. Inspect Omnibox, NTP background, Settings menu background, and 3-dot popup.
  3. Check pixel hex values using an on-screen color picker or screenshot inspect.
- **Pass/Fail Criteria**:
  - [ ] **PASS**:
    - URL bar background, NTP root, and Settings canvas are pure `#000000`.
    - Bottom sheets and modal cards render at stepped elevation `#0A0A0C` - `#161618` (zero gray-island regression).
  - [ ] **FAIL**: Surfaces remain dark gray (`#1F1F1F` or `#202124`).

---

### Patch 14: Clean New Tab Page (NTP) `[STATUS: BLUEPRINTED (RECON_DELTA.md Section 3)]`
- **Target Class / Hook**: `BraveNewTabPageLayout` & `MostVisitedTilesLayout`
- **Procedure**:
  1. Open a New Tab.
  2. Inspect layout and background.
- **Pass/Fail Criteria**:
  - [ ] **PASS**:
    - Top shortcuts / Most Visited tiles are fixed to exactly **4 columns**.
    - Zero sponsored background wallpaper ads or tracking pixels inflated (`bg_sponsored_rich_media_view` suppressed).
    - Brave News feed is completely absent and disabled by policy.
  - [ ] **FAIL**: Grid defaults to 5+ columns or uneven spacing; sponsored wallpaper appears; news feed loads below tiles.

---

### Patch 15: Incognito Screenshots (`FLAG_SECURE` Stripped) `[STATUS: BLUEPRINTED (RECON_DELTA.md Section 4)]`
- **Target Class / Hook**: `Lv65;->g()V`
- **Procedure**:
  1. Open an Incognito Tab.
  2. Capture a hardware screenshot (`Power + Volume Down`).
  3. Open Android Recents app switcher (swipe up and hold).
- **Pass/Fail Criteria**:
  - [ ] **PASS**: Screenshot captures page contents cleanly (no "Cannot capture screenshot due to security policy" toast); app card in Recents preview shows live tab content (API 33+).
  - [ ] **FAIL**: Screenshot is blocked by OS or Recents card shows a black rectangle.

---

### Patch 15b: Menu & Settings Debloat `[STATUS: IMPLEMENTED IN MAIN (Debloat Only)]`
- **Target Class / Hook**: `Lhq2;->f()Lb1b;` / `Lhq2;->U()Lb1b;` & `BraveMainPreferencesBase->V3(Landroid/os/Bundle;)V`
- **Procedure**:
  1. Tap Brave 3-dot app menu: check for complete absence of Brave Wallet, Brave Leo (AI), Brave News, Brave Rewards, and Brave VPN.
  2. Open Brave Settings (`chrome://settings`) and verify removal of Wallet/Leo/Rewards/VPN preferences sections.
  3. Verify custom media picker opens via the top toolbar download button (separate "Brave Tools" 3-dot menu utilities sheet is blueprinted in `RECON_DELTA.md` but not yet implemented in this branch).
- **Pass/Fail Criteria**:
  - [ ] **PASS**: 3-dot menu and Settings are clean and debloated; crypto/AI/ad clutter is completely gone without blank rows.
  - [ ] **FAIL**: Wallet, Leo, News, Rewards, or VPN entries remain visible or leave empty blank rows in menu/settings.

---

## 4. Performance, Optimization & Side-by-Side Cloning (Patches 16 – 17)

### Patch 16: Max Refresh Rate & Telemetry Neutralization `[STATUS: BLUEPRINTED (RECON_DELTA.md Section 7)]`
- **Target Class / Hook**: `WindowAndroid->r(F)V` & `p3a->a(...)V`
- **Procedure**:
  1. Enable "Show refresh rate" in Android Developer Options.
  2. Navigate through Brave Mod on a 90Hz/120Hz/144Hz device.
  3. Filter logcat for P3A metrics and UMA reporting:
     `adb logcat -d | findstr -i "p3a"`
- **Pass/Fail Criteria**:
  - [ ] **PASS**:
    - Display operates at maximum native refresh rate (e.g., 120Hz) without downscaling display resolution.
    - Zero P3A or Chromium UMA metrics packets sent over network.
  - [ ] **FAIL**: Refresh rate throttles to 60Hz during scrolling, or P3A messages serialize in logcat.

---

### Patch 17: Side-by-Side Cloned App & Custom Branding `[STATUS: INTEGRATION READY (feat/gestures-clone-tools & branding/)]`
- **Target**: `com.brave.browser.clone` / `"Brave Mod"`
- **Procedure**:
  1. Check device launcher alongside official Brave Browser.
  2. Launch official Brave and Brave Mod simultaneously in split screen.
  3. Verify separate accounts, cookies, and bookmarks.
- **Pass/Fail Criteria**:
  - [ ] **PASS**:
    - Installs cleanly with zero `INSTALL_FAILED_CONFLICTING_PROVIDER` (across all 9 ContentProviders) or duplicate permission errors.
    - App displays custom "Brave Mod" title and modern AMOLED shield/arrow adaptive icon (Material You monochrome outline).
    - Official Brave and Brave Mod coexist and operate with independent storage.
  - [ ] **FAIL**: Installation conflict with stock Brave, or generic Chromium icon displayed.

---

## Summary Sign-Off Sheet

- **Tester Name**: __________________________
- **Device Model**: __________________________
- **Android Version**: ________________________
- **Total Tests**: 17 Patches / 25 Verification Items
- **Overall Result**: [ ] PASS — READY FOR RELEASE / [ ] FAIL — BLOCKED
- **Notes / Observations**: _________________________________________________________________
