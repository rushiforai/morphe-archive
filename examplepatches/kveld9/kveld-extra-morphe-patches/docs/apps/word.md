# Word Patches Guide

Technical documentation and patch catalog for Microsoft Word on Android.

---

## 1. Target & Compatibility

| Property | Value |
| :--- | :--- |
| **Target App** | Word |
| **Package Name** | `com.microsoft.office.word` |
| **Target Version** | `Single pinned version (see README Patch Catalog)` |
| **Target Package Format** | APKM |
| **Primary Architecture** | `arm64-v8a` |
| **Authoritative Source** | APKMirror |
| **Download Target** | [Word (arm64-v8a, 120-480dpi)](https://www.apkmirror.com/apk/microsoft-corporation/word/) |

---

## 2. Applied Patches Catalog

The authoritative patch catalog with descriptions and options is generated in README.md from the built .mpp; see also patches-list.json.

---

## 3. Deep Technical Breakdown

### A. Bytecode Feature Unlocking Layer (`bytecodePatch`)

1. **Unlock 365 Family**:
   - **Objective**: Unlock premium subscription features and editing capabilities locally.
   - **How**: Forces subscription status checks to return true and bypasses enterprise license validation.
2. **Bypass Code Transparency**:
   - **Objective**: Let the resigned app pass launch-time integrity verification.
   - **How**: Forces the verification entry flag so the check reports success without showing the untrusted-source wall.
3. **Disable Login Requirement**:
   - **Objective**: Use Word without a Microsoft account and skip first-run paywalls.
   - **How**: Completes first-run tasks immediately, marks FTUX as shown, and neutralizes sign-in/SSO gates.
4. **Block Telemetry & Trackers**:
   - **Objective**: Silence analytics, crash-reporting, and ad-measurement SDKs.
   - **How**: Stubs OneDS/Aria lifecycle and dispatch methods, blanks ad identifiers, disables tracking manifest components with declarative opt-out flags, and neutralizes Office early-telemetry dispatch (TelemetryHelper) so null strings from resigned installs never reach native code.

### B. Manifest Compatibility Layer (`resourcePatch`)

1. **Remove Shared User ID**:
   - **Objective**: Allow Word to install alongside other Microsoft Office apps.
   - **How**: Strips the `sharedUserId` and `sharedUserLabel` attributes so the package no longer collides on shared permissions.

---

## 4. Known Limitations

None evidenced by patch sources.

---

## 5. Follow-up Modules (Out of Scope for This Release)

No pending PowerPoint ports. UX declutter (paywall dialogs, onboarding polish)
and privacy hardening (certificate pinning opt-in, share-link cleaning) remain
possible future work.

---

## 6. Canonical Universal Patches

The generic maintenance patches (screen densities, languages) are covered by the universal patches in the canonical collection [kveld-morphe-patches](https://github.com/kveld9/kveld-morphe-patches): `Remove Unused Screen Sizes` and `Remove Extra Languages`. For further generic maintenance (packaging leftovers, background sync, native trackers, telemetry) that collection also provides `Clean App Packaging`, `Stop Background Sync`, `Remove Tracking Libraries` and `Block Trackers`. Add that source in Morphe Manager alongside this one to use them; universal patches apply to any APK, including Word.
