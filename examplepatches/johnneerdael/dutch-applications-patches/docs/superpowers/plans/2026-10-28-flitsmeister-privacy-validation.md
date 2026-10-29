# Flitsmeister privacy and combined-patch validation

**User-directed scope:** Validate the current PairIP/startup restoration together with the dev Pro controls. Remove paid Parking, Toll and Carwash service entry points; remove their Settings entries as well. Disable general commercial ads and remove only the Ads Settings row. Add a separate control for automatic tracking, including app-owned location uploads and bundled analytics/marketing/crash telemetry. Preserve essential navigation, authentication, informative traffic messages and explicit user-submitted reports.

**Workspace:** Continue in the existing dirty `fix/flitsmeister-pairip` worktree. Preserve pre-existing edits. The user subsequently authorized commit, integration and push for a dev release. Keep APKs, decoded classes, private account data and testing artifacts outside Git.

## Tasks

- [x] Identify installed artifact: initial APK included startup-only changes, not either Pro control.
- [x] Build/validate the three-control combination and observe Pro badges disappear.
- [x] Reproduce Parking native crash and restore startup by returning genuine Kotlin Result failures before customer fetches. Preserve app data.
- [x] Separate paid-service menu entries from local suggestion/hint settings using their actual callbacks.
- [x] Guard native Parking shortcut initialization as well as its resource visibility; retain the binding node.
- [x] Add Ads readers/Settings-row controls and coordinate the `W` reader with Pro execution using the patcher's verified finalization lifecycle.
- [x] Close commercial ad catalog/prefetch bypasses; verify informative/monitoring traffic paths stay original.
- [x] Disable analytics/marketing/crash SDK collection and event sinks with correct return/callback contracts.
- [x] Disable automatic app-owned trajectory/session telemetry separately from explicit reports.
- [x] Build all selected controls in FULL mode, verify signing, and independently inspect actual emitted DEX/resources and original-input negatives.
- [x] Review all changes, regenerate the catalog, update the audit and list remaining acceptance gaps.
- [ ] When the USB phone returns, install as a same-signature update and test cold starts, Settings, map/routing, service entry removal, ad behavior and runtime network evidence.

## Device test state

The four-control Parking recovery artifact is currently installed and starts with the existing account. Later partner/Ads changes are built but not installed. The user is unplugging the phone and expects device testing to resume in about 45 minutes. Do not issue ADB operations until the user returns. Animator duration scale is still its original `0.0`; the approved temporary `1.0` Devices carousel test has not run and must restore `0.0` in a finally block. Its activity/composables/coroutine are unchanged in publisher, startup-only and combined APKs; a five-second animation is being used as a page timer.

## Verification decisions

Every new behavior gets a negative test against an actual earlier decoded artifact before fresh emission. SDK/body checks alone do not establish zero tracking or zero ad traffic; runtime collection/network acceptance remains necessary. Operational Firebase core/FCM/Installations may remain for required authentication/push functionality and must be documented rather than silently counted as disabled. Tracking changes must not replace encrypted customer data with plaintext or fabricate backend entitlement/account state.

## Offline validation result

All 20 Python unit tests pass. Publisher/no-selection, six-control combined, Ads-only, Tracking-only and partner-services-only independently decoded verifiers pass. Each patched APK passed FULL application and signature verification with the existing Morphe certificate. Independent read-only reviews checked SDK/telemetry guards, callback/return contracts, nullable advertisement handling and footer/Settings preservation. No merge, push or final phone installation was performed. Live CITS GPS sharing remains enabled while the user's explicit choice is pending; its decision function and local warning/location updates remain pinned to the publisher original.


## Release authorization update

On 2026-10-28 the user reconnected USB, then explicitly requested that Parking and Carwash Settings entries also be removed and that the functional current work be committed and pushed as a dev release immediately. Device testing must use the published dev build and must not delay publication. Stable main is outside this authorization.
