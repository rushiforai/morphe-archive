# Selectable map themes

For Waze 5.24.5.0. Open **Settings → Map display → Themes**, immediately below **Dark mode**.

Choose a **Light theme** and **Dark theme** independently, then tap **Apply & restart**:

- Waze original
- Google Maps (the sampled colours previously named v2)
- OLED black (black terrain/background with visible roads, labels, parks, water and navigation)

Both slots initially use Google Maps. A saved selection of the retired Google Maps v1 theme falls back to Google Maps. Dark mode still determines when each slot is used, including Waze's existing automatic and Android Auto behaviour. These are map palettes; they do not recolour every app panel. OLED is available in either slot and always has a black map background.

**Icon pack** is directly below Themes. Choose **Waze original** or **Google Maps**, then **Apply & restart**. The choice is independent of both theme slots; Google Maps icons also work with OLED and editor mode. It defaults to Google Maps when no pack has been selected; saved choices are retained.

The Google pack contains 175 asset variants for fixed/mobile speed cameras, police, crashes, traffic, construction, closures, blocked lanes, stalled vehicles, road objects, flooding, fog, snow, general warnings, parking, home and work. Waze-specific reports without a matching source icon retain their original artwork; this is not a replacement for every app toolbar/control. The glyphs come from the phone's Maps 26.39.04.984891338 APK. Incident glyphs are composed with Maps' bundled incident colours. Police uses its white officer glyph on blue (`#1B6EF3`); warnings use black on amber (`#FFBB29`), and road closures use the blocked-lane barrier artwork in white on red (`#DC362E`), as requested. The warning triangle has a 10% viewport inset on each side. Fixed speed cameras preserve the complete original orange/white callout vector (`#E37400`). Waze still controls marker placement, size and 3D geometry.

The full extracted catalogue contains 3,489 resource variants, including 676 raw SVGs. It is available in `dist/google-maps-extracted-icons.zip`; compiled Android XML is preserved in its original binary format. Per-file source hashes and the explicit Waze mappings are recorded in `references/google-maps-icons/pack-manifest.json`.

Traffic reports, blocked lanes and stopped vehicles are white on red (`#DC362E`). With **Detailed report icons at normal sizes** enabled, the modern native renderer uses 153 additional subtype assets in the original tiny/small image dimensions, retaining detailed hazard artwork when zooming out. Both original zoom selectors are unchanged; Waze still controls marker size and visibility. The additional assets support both icon packs. Native changes are currently supported on ARM64 only and are guarded by the exact original `libwaze.so` SHA-256.

## Installation

- Import the latest `.mpp` bundle from GitHub Releases into Morphe. It exposes seven independent options: **Selectable map themes**, **Selectable report icon packs**, **Detailed report icons at normal sizes**, **Rank badge selector**, **Unlock driver moods**, **Android Auto setup**, and **Android Auto police alert distance**. All seven default to enabled; deselect any you do not want. No unchecked public patch is selected as a dependency. Disable older bundles containing the same patches to avoid duplicate entries.
- `dist/waze-5.24.5.0-themes-moods-badges-arm64.apk`: combined build with selectable themes and icon packs, unlocked moods and the local badge selector. Uses the existing Desktop signing key and version code 1030748. It cannot update a Morphe-signed installation; use Morphe and its existing key for that installation.

The separate **Android Auto setup** patch embeds **Waze AA Installer 1.0.0**. Themes and icons do not include the installer or startup offer. Morphe still installs one APK. Open patched Waze: its first-launch offer leads to Android's confirmation for the bundled companion. Allow Waze to install apps when Android requests it. After installation, the companion opens; start/authorise Shizuku, tap **Repair Android Auto visibility**, and confirm the Waze update. No desktop or separate APK download is needed. Shizuku must already be installed and started through wireless debugging.

If the companion is already current, setup opens it without reinstalling it. The offer appears at most once per Waze installation and can be postponed; **Settings → Map display → Android Auto setup**, below Icon pack, remains available. When the companion and Waze's required install-source metadata are already present, no automatic offer is shown. Future Morphe patches can be sent directly to **Waze AA Installer** using Morphe's installer chooser. The companion only accepts Waze APKs.

The companion installation is a visible first-launch flow, not a simultaneous or silent second installation inside Morphe. The patch adds REQUEST_INSTALL_PACKAGES, one package-visibility query, a private setup activity and a private URI-grant provider. The embedded APK is checked against a pinned SHA-256 before packaging, patching and serving; installed companion certificates are checked before opening or updating. It never uninstalls either app. The report-sizing-only patch does not add the companion.

Version 1.6.0 packages themes/icon packs and report icon sizing as two selectable patches in one MPP. It replaces the separate report-sizing MPP; do not also load that old bundle. With sizing disabled, the native renderer remains completely original. Shared assets and the resource-refresh version are applied once regardless of which patches are selected.

## How it works

All original APK assets remain byte-for-byte intact. Additional Lua palettes live in `assets/morphe/themes/`. After Waze prepares its resources at startup, the extension selects the saved day/night pair and populates the renderer's active working files. Choosing Waze original restores those working files from the unchanged stock assets. Normal and experimental skins are both covered. OLED also covers both editor palettes, preserving their road-class fill colours while making the background black. Other selections restore the original editor palettes.

Changes are queued on Waze's native thread, read and staged before replacement, then saved in `morphe_map_themes` preferences. File replacements use atomic moves, with rollback if a replacement fails. Waze caches parsed colours for the life of its process. Apply & restart therefore uses WazeApplication's own restart pattern: schedule FreeMapAppActivity as a new task root and exit the current process. The next launch rebuilds its native colour tables. The existing Dark mode preference is not changed.

The settings hook wraps only the view tagged `map_mode`, preserving the original Dark mode row and its click handler. Themes uses Waze's own settings-row component. Cancelling either dialog leaves saved preferences unchanged; the pair is committed only with Apply & restart.

Additional PNGs live in `assets/morphe/iconpacks/google_maps/`. At startup and when applying a choice, the icon extension stages and validates the whole pack before copying the native renderer's working textures. The Java skin-asset loader also checks the selected pack so report panels use the same artwork. Missing equivalents fall through to the original loader. Selecting Waze original restores every mapped working file from untouched APK assets. Native texture UV regions outside each circular face are preserved.

The native resource-table patch changes 98 string-constructor call sites across 25 hazard tables. Their small/tiny slots reference subtype-specific images with the original canvas dimensions and footprint, plus textures that preserve the original mesh UV regions. Resource-name stubs and strings occupy 2,764 bytes of existing zero padding after `.plt`; the RX segment extent is extended without moving sections, relocations or writable segments. The source hash and every edited byte range are checked before applying. `scripts/build_report_zoom_patch.py` regenerates the native rules and sized assets; `references/icon-zoom/patch.json` records the exact edits.

Version 1.6.1 removes the hard-coded input version-code requirement. Resource refresh now uses the higher of 1030747 and the input version code plus one. Native renderer compatibility remains pinned to the original 5.24.5.0 ARM64 library; older releases and already patched renderers are not made compatible by this change.

Version 1.6.2 fixes the Lua colour-group regex for Android ICU by escaping its literal closing brace. All three production lookup patterns were compiled and matched against the original day skin using Android 16 app_process on the physical phone. Desktop-only Java testing did not catch this syntax difference.

Version 1.7.0 adds bundled Android Auto setup and raises the shared resource-refresh version floor to 1030748. The manifest edit was executed through Android 16 app_process with the installed Morphe Manager's classes and matched the desktop result byte for byte. Every existing manifest entry is preserved except the resource-refresh version. The complete first-launch companion installation flow has not yet been tested after a Morphe-signed update on the phone.

Version 1.7.1 includes the existing badge selector and mood unlocker as two separate public patches in this same bundle. Badge extension DEX is packaged separately and merged only when **Rank badge selector** is selected. **Unlock driver moods** has no extension or dependency on badges. The theme extension contains neither feature. The badge selector changes local appearance only, not server account rank or badges other people receive. All 16 selection combinations were checked through both desktop and Android Morphe patch loaders: no unchecked public patch is pulled in as a dependency.

Version 1.7.2 fixes the startup offer: Waze's transient FreeMapAppActivity transfers to MainActivity, so setup now attaches to MainActivity and offers setup when that screen resumes. The old launcher could finish before the delayed offer ran. The same four independent options remain available.

Version 1.7.3 makes mood unlocking idempotent: it accepts the original Boolean result or an existing constant-true replacement and does not duplicate return gates or catalogue arguments. Other unexpected instructions still fail before changes are made. `ValidateMoodPatchRuntime.java` executes badge plus mood patches against original Waze classes, repeats the mood patch with byte-identical output, and verifies rejection of an unexpected constant without partial changes. These checks pass on both the desktop and the physical phone using Morphe Manager 1.33.0's actual runtime. The input to the user's failed 1.7.2 run was selected from Downloads; its exact filename was not confirmed. The clean file on the phone is `waze-5.24.5.0-original-arm64.apkm`, whose SHA-256 was rechecked.

Version 1.7.4 fixes the startup VerifyError introduced in 1.7.2: MainActivity.onCreate reuses parameter register p0 as a String before returning. The setup hook now runs at method entry, where p0 is guaranteed to hold the Activity; earlier copies of that hook are replaced with nop when present. `ValidateAndroidStartup.java` initializes entry-point classes through app_process on the physical phone. It reproduces the exact v5 String-versus-Activity VerifyError against the installed broken APK, and passes against the corrected APK for MainActivity, CompanionInstaller, CompanionSetupActivity, CompanionApkProvider, MoodsActivity and BadgeSelector. This confirms class verification, not a completed user-facing companion installation flow. Repatch the original APK bundle and install as an update with the existing Morphe signing key; do not uninstall or clear Waze data.

Version 1.7.5 waits for login before automatically offering Android Auto setup. It requires native startup, a logged-in native session and a non-guest account; these read-only checks run on Waze's native task queue. MainActivity must remain resumed and focused, and meet the login conditions for at least 2.4 seconds of checks. Pausing or destroying the screen cancels polling and invalidates in-flight callbacks. Login, overlays and backgrounding do not consume the once-per-install offer. Manual Android Auto setup in Map display remains available. Controlled Android-runtime tests cover all eight startup/login/guest combinations, unfocused screens, cancellation, stale callbacks and transition settling; they do not log the user out or alter account state. The user confirmed 1.7.4 starts and shows setup, but reported that it overlapped forced login; this update addresses that timing.

## Validation

- All 24 theme/mode/variant/editor combinations run through Waze's Lua parser successfully.
- Every original asset is unchanged in the APK. Google Maps produces the same renderer values as the earlier v2 build. The retired v1 assets are no longer packaged.
- OLED background is `#000000`; traffic semantics and non-colour map structure remain unchanged.
- Canonical DEX comparison against the previous combined build checks all existing classes. Allowed changes are resource preparation, settings rendering, the skin asset loader and MainActivity's setup hook; added classes must exactly match the compiled theme extension.
- APK signature verified with the existing Morphe certificate; Android SDK 16 KiB ZIP alignment verified.
- `scripts/validate_report_zoom.py` executes all 98 shipped resource-name call stubs, checking their destination, return address, preserved registers/flags and packaged assets. Both complete modern and legacy zoom-selector functions must match the original native library byte for byte. Icon validation checks every additional canvas size and footprint against its original tiny/small template.
- The user confirmed the v1.0 theme choices apply after killing/reopening Waze. Version 1.2 adds an explicit Apply & restart action and editor OLED palettes.
- The user confirmed the previous editor OLED/restart update works well. Version 1.3 only removes Google Maps v1 and renames v2 to Google Maps.
- Version 1.4 adds icon packs. Subsequent updates correct the police colours, add warning-triangle padding and make road closures red with the blocked-lane barrier artwork. Version 1.5.1 fixes the oversized zoomed-out markers introduced in 1.5.0: it restores the original zoom selectors and supplies subtype artwork at the original small/tiny dimensions. Asset hashes, dimensions, original restoration sources, camera/police colours, triangle clearance and mesh UV preservation are checked by `scripts/validate_icon_pack.py`. In-car Android Auto behaviour has not been re-tested.


## Build

Run `BuildThemes.ps1` to build the independent MPP. Run `BuildThemesApk.ps1` to rebuild and sign the combined ARM64 APK using the existing local signing key. Signing keys and phone captures are excluded from the source archive.

Run `python scripts/validate_theme_selector.py` for palette and original-asset verification. `tools/ValidateThemes.java` compares DEX against `dist/waze-5.24.5.0-colours-moods-badges-arm64.apk`.

To regenerate icons, run `python scripts/extract_google_icons.py` with the phone's Maps APKs in `downloads/google-maps-phone`, then `python scripts/build_icon_pack.py` followed by `python scripts/build_report_zoom_patch.py`. The renderer requires Pillow and Playwright Chromium. Existing generated PNGs are bundled in the source archive, so ordinary patch builds do not need Maps installed or extraction tools.

Version 1.9 separates themes, report icon packs and Android Auto setup into independent public patches and extension DEX files. Each works alone. Selecting only themes adds no icon pack, installer, install permission, companion components or startup prompt. Settings rows compose in either patch order. Google Maps icons are the default when no pack has been selected, and traffic-report icons are red with white artwork.

Version 1.10 adds an independent adjustable Android Auto police/enforcement heads-up distance patch. The saved value applies to normal, freeway and fallback distances; the three native values are read back before reporting success. Configuration refreshes reapply the saved setting. Original values can be restored. Automated JVM fixtures cover bounds, startup readiness, native-thread use, saved choices, restore, unrelated configs and rollback on setter, read-back or preference failures. These are not in-car runtime tests.
