# Automatic renderer profiles

Current releases discover native icon-sizing profiles during the nightly build.
Morphe receives exact-hash profiles for tested renderers, with full output verification.
See [Build and release notes](BUILDING.md) for the current workflow.
The notes below describe the original 5.24.5.0 investigation.

# Report icon sizing

Import **`dist/waze-theme-selector-1.7.5.mpp`** into Morphe. The bundle now contains four independent selectable patches, including these two map options:

- **Selectable map themes**: light/dark palettes and original/Google Maps icon packs.
- **Detailed report icons at normal sizes**: detailed hazard artwork when zooming out, at Waze's original tiny/small sizes.

Both are enabled by default. Keep both selected for the current setup, or select either independently. The sizing patch works with original Waze artwork when themes are not selected. It targets original Waze 5.24.5.0 ARM64 and uses the same verified native changes and 153 sized assets as the working 1.5.1 build.

The old separate `waze-report-icon-sizing-1.0.0.mpp` is superseded. Do not load it alongside the new bundle. The installed app already has the working sizing behavior; this release changes patch packaging and selection.

Shared assets and the resource-refresh version code (1030748) are applied once. With only themes selected, the native library is unchanged. With only sizing selected, DEX and all original assets remain unchanged, and no companion installer is added. Both original zoom selectors remain intact in every configuration.

Build with `BuildThemes.ps1`; build the combined APK with `BuildThemesApk.ps1`. Native source hashes and every edited byte range are checked before patching. Validate native edits with `scripts/validate_report_zoom.py <apk>` and the sizing-only configuration with `scripts/validate_report_icon_sizing.py`.
