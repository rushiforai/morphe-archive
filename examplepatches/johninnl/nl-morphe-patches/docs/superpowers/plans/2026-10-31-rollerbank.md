# Rollerbank privacy and startup implementation plan

> Execute with the executing-plans skill. Retain binary evidence outside Git.

**Goal:** Audit Rollerbank 4.5.3.1 and remove the advertising consent blocker, premium introduction, and settings upgrades requested in the four reference screenshots.

**Architecture:** Add version-restricted Morphe patches with the existing original-signer preflight. Keep advertising, optional telemetry, consent presentation, and promotions as distinct controls. Retain location permissions, notification preferences, functional APIs, authentication, Firebase messaging, and purchase state.

**Tech stack:** Kotlin Morphe patches, XML resources, Python emitted-DEX verification, REA/JADX, ADB.

**Spec:** User request and four reference screenshots; audit checklist and retained evidence accompany the original extracted APK set.

## Constraints and design decisions

- Target only `com.dennisk.rollerbank` 4.5.3.1 / 4531 / minSdk 32 and original signer `dff7cf9d4f59e4be49a5135425a00c6feb0fc561d5b3aa0d703456dab6d9b788`.
- Skip consent through the existing completion callback with advertising disabled. Do not store a granted consent decision or request UMP network content.
- Preserve Home content and location setup. Hide only the advertising consent explanation and button.
- Omit the premium page from the existing onboarding sequence; retain the native completion flag and navigation.
- Remove the Upgrades category from settings. Preserve purchase management outside the patched app.
- Disable app-owned advertising requests, ad placeholders, optional analytics, Crashlytics custom attributes, and explicit queued-crash upload requests when their controls are selected.
- Analyse local feature gates and the server data boundary for driving/static-camera notifications. Do not claim server access or notification delivery from a local entitlement change.
- Keep stable `main` untouched; no manual version bump or release.

## Review focus

1. Fresh install without consent, internet, or location permission must not be trapped on the Home setup page.
2. Nearby/area content must still enforce its location/radius requirements.
3. Repeated binding/resuming must not resurrect hidden consent UI or premium pages.
4. Disabling telemetry must preserve authentication, report submission and functional push registration.
5. All split resources must be merged for validation; the base APK alone lacks drawable resources.

## Tasks

- [x] Establish original APK identity, retain REA package/method evidence and four reference screenshots.
- [x] Verify clean baseline: 372 Python tests, 39 skipped.
- [x] Create an emitted-APK verifier and confirm it rejects the original for the requested patch behavior.
- [x] Add `patches/rollerbank/Compatibility.kt`, `AdsPatch.kt`, `TrackingPatch.kt`, `ConsentScreensPatch.kt`, and `PromotionsPatch.kt`, and `GoogleCompatibilityPatch.kt` with strict method/resource guards.
- [x] Build the complete Android patch bundle and apply independent and combined selections to the original four-split archive.
- [x] Verify output signatures, DEX guards, consent callback arguments, promotion removal and preserved functional boundaries.
- [x] Exercise fresh and repeated startup, denied permissions and settings on a dedicated Android 36 emulator; retain screenshots/logs.
- [x] Write aligned English/Dutch app guides and source-derived catalogue entries; run required documentation and regression checks.
- [x] Deliver the audit and reviewable source changes with explicit runtime and notification feasibility limits.

Ruling: Add Fix Google services and require it from all mutating controls. Emulator logcat proved Maps authorization and Firebase Installations registration fail under the new signing key. Reuse the existing package-scoped certificate compatibility extension, bound to Rollerbank. Runtime follow-up showed the community key is not authorized for this package; preserve the original Maps/Firebase/Places keys and restore only SDK certificate identity.

User steering: Enable actual static-camera loading and En Route alerting.

- [x] Add independent Enable En Route alerts control with local access, real server data, visible entry, notification prompt, and one-time static-warning enablement that preserves later user choices.
- [x] Remove TTS startup dependency from notifications/sound; enable speech only once TTS is ready.
- [x] Verify route controls, server-loaded camera list, threshold notification and background delivery with simulated locations.

Ruling: Camera and route server access is verified by real fresh-installation credentials in REA controlled replay. No backend entitlement or purchase data is changed. The code work now explicitly enables local route access, replacing the earlier feasibility-only scope at the user's request.

Final evidence: source build succeeds; 378 Python tests ran (339 passed,39 skipped); all six standalone controls and combined APKS selection pass; actual source-built APK renders Maps with the synchronized existing key; native control and static-camera background notifications were observed, including with the TTS engine disabled. Stable main is untouched; local delivery artifacts and isolated source branch are retained.
