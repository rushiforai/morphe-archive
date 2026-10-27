# Word Patches Guide

Technical documentation and patch catalog for Microsoft Word on Android.

---

## 1. Target & Compatibility

| Property | Value |
| :--- | :--- |
| **Target App** | Word |
| **Package Name** | `com.microsoft.office.word` |
| **Target Version** | `16.0.20527.20034` |
| **Target Package Format** | APKM |
| **Primary Architecture** | `arm64-v8a` |
| **Authoritative Source** | APKMirror |
| **Download Target** | [Word 16.0.20527.20034 (arm64-v8a, 120-480dpi, versionCode 2005437911, APKM)](https://www.apkmirror.com/apk/microsoft-corporation/word/microsoft-word-edit-documents-16-0-20527-20034-release/) |

---

## 2. Applied Patches Catalog

| Patch Name | Typology | Default State | Dependencies | Description |
| :--- | :--- | :--- | :--- | :--- |
| **Unlock 365 Family** | `bytecodePatch` | `true` (Enabled) | None | Unlocks Microsoft 365 Family subscription features locally. |
| **Bypass Code Transparency** | `bytecodePatch` | `true` (Enabled) | None | Bypasses the code transparency checks. |
| **Remove Shared User ID** | `resourcePatch` | `true` (Enabled) | None | Removes the sharedUserId attribute from the manifest to prevent installation conflicts. |
| **Disable Login Requirement** | `bytecodePatch` | `true` (Enabled) | None | Removes login requirement and FTUX paywall screens. |
| **Block Telemetry & Trackers** | `bytecodePatch` + `resourcePatch` | `true` (Enabled) | None | Neutralizes OneDS/Aria dispatchers and ad identifiers; purges tracking manifest components. |

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
   - **How**: Stubs OneDS/Aria lifecycle and dispatch methods, blanks ad identifiers, and disables tracking manifest components with declarative opt-out flags.

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
