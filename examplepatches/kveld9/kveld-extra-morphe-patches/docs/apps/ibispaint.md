# IbisPaint X Patches Guide

Technical documentation and patch catalog for IbisPaint X on Android.

---

## 1. Target & Compatibility

| Property | Value |
| :--- | :--- |
| **Target App** | IbisPaint X |
| **Package Name** | `jp.ne.ibis.ibispaintx.app` |
| **Target Version** | `Single pinned version (see README Patch Catalog)` |
| **Target Package Format** | XAPK bundle |
| **Primary Architecture** | `arm64-v8a` |
| **Authoritative Source** | APKPure (XAPK bundle) |

> [!NOTE] Upstream Source Divergence
> Automated update tracking (`scripts/check_app_updates.py`) queries APKMirror for release metadata because APKPure provides no stable or unauthenticated endpoints for programmatic checks. In contrast, candidate binaries for patching must be obtained as XAPK bundles from APKPure, as APKMirror binary downloads are subject to HTTP 451 legal restrictions in several jurisdictions.

---

## 2. Applied Patches Catalog

The authoritative patch catalog with descriptions and options is generated in README.md from the built .mpp; see also patches-list.json.

---

## 3. Deep Technical Breakdown

### A. Native Feature Unlocking Layer (`rawResourcePatch`)

1. **Enable Prime membership**:
   - **Objective**: Unlocks features locked behind the Prime subscription paywall locally.
   - **How**: Performs in-situ binary patching of `libibispaint.so` in `lib/arm64-v8a/`:
     - Patches `_ZN9ibispaint13SystemChecker9isFailureEv` at file offset `0x18B6C80` with `mov w0, wzr; ret` (`0xE0, 0x03, 0x1F, 0x2A, 0xC0, 0x03, 0x5F, 0xD6`) to force false.
     - Patches `_ZN9ibispaint19AccountRightManager24isPromotionalPrimeMemberEv` at file offset `0x1B96B5C` with `mov w0, #1; ret` (`0x20, 0x00, 0x80, 0x52, 0xC0, 0x03, 0x5F, 0xD6`) to force true.
   - **Fingerprint Assertions**: Verifies original bytes before modifying:
     - `_ZN9ibispaint13SystemChecker9isFailureEv`: `48 d0 00 d0 08 bd 45 f9`
     - `_ZN9ibispaint19AccountRightManager24isPromotionalPrimeMemberEv`: `e8 0f 1e fc fd fb 00 a9`

---

## 4. Known Limitations

- **Architecture Constraint**: The patch strictly targets `arm64-v8a` native binaries. Other ABIs (`armeabi-v7a`, `x86`, `x86_64`) are not supported.
- **Container Format**: The application is distributed as an XAPK split bundle containing architecture splits.

---

## 5. Follow-up Modules (Out of Scope for This Release)

None evidenced by patch sources.

---

## 6. Canonical Universal Patches

The generic maintenance patches (screen densities, languages) are covered by the universal patches in the canonical collection [kveld-morphe-patches](https://github.com/kveld9/kveld-morphe-patches): `Remove Unused Screen Sizes` and `Remove Extra Languages`. For further generic maintenance (packaging leftovers, background sync, native trackers, telemetry) that collection also provides `Clean App Packaging`, `Stop Background Sync`, `Remove Tracking Libraries` and `Block Trackers`. Add that source in Morphe Manager alongside this one to use them; universal patches apply to any APK, including IbisPaint X.
