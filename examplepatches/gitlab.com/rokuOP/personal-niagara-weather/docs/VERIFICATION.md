# Verification

Verified locally on October 22, 2026:

- Android MPP builds with embedded patch DEX and weather extension DEX.
- Morphe Patcher 1.15.1 loads the actual built bundle, applies both patches to the checksum-verified original Niagara APK, and rebuilds successfully.
- APK signature (v2/v3) and 16 KiB alignment checks pass.
- Installs over the existing side-by-side test copy on Samsung SM-S931W / Android 17, preserving its encrypted saved key.
- Original Niagara remains installed and the default HOME app.
- Native date row and forecast popup display weather.
- Redesigned settings opens through Niagara widget settings → Weather.
- Save & test weather with the existing saved key updates the home temperature (11° to 10°).
- All 24 adapter checks pass using synthetic fixtures.
- Android native serializer/preflight/model/display tests pass against this Morphe-generated APK using synthetic fixtures.
- UI layout inspected on-device using a separate dummy-data preview, including scrolled content and fixed Save button. The actual private key screen was not captured.

Morphe Manager's local import UI was not exercised. Both patch definitions and their bundled extension were exercised through its underlying Patcher API. Only Niagara 1.16.28 build 1634 is supported; future versions require new anchors and testing. The core-only package option was not installed over the original app; the on-device test used both patches.

## Version 1.0.1 — screenshots

Removed FLAG_SECURE from WeatherSettingsActivity at the user's request, allowing normal screenshots and screen recording on the weather key/settings page. Key masking, encrypted storage, and disabled autofill remain in place.

Version 1.0.1 checks: actual MPP loaded and applied successfully; APK signatures and 16 KiB alignment passed; installed in place over the test copy. Weather settings opened through Niagara's widget menu. Its running window flags were 0x81810100, with FLAG_SECURE (0x2000) absent. No screenshot of the key screen was taken for verification.

## GitLab source version 1.0.2

The publishing copy updates the bundle's source URL and author, and extends the existing patch-list generator to produce GitLab source metadata and copy the built MPP into bundles/. The four weather implementation/extension entries were compared with the tested 1.0.1 MPP and match byte-for-byte. The bundle builds and its actual patch definitions load during metadata generation. A fresh APK application test was not rerun because the original input APK is no longer present in Downloads. No phone settings or API keys were read during publication setup.

## Remote-source metadata compatibility fix

MorpheAsset.createdAt is kotlinx.datetime.LocalDateTime. The original timestamp ended in Z, which that type rejects. The generator now emits UTC without an offset suffix and with whole seconds. The verifySourceMetadata task reproduces rejection of the old timestamp and accepts the actual regenerated manifest using kotlinx-datetime 0.8.0. The weather implementation is unchanged.
