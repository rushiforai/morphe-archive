# Fing patch contract

## Qualified input

- Original full `com.overlook.android.fing` APKM, **12.13.5 / 121305003** only.
- Preserve Android minimum SDK **28**, target SDK 36, the original ARM64 and ARMv7 ABIs,
  language splits, assets, native libraries, package and display identity.
- Exact version/build pairing and nine original class fingerprints are required.
  Modified targets, donor helper classes and reapplication are rejected.
- Standard/Shizuku are offered; mount is not qualified. App targets are not marked
  experimental merely to hide them from Manager's ordinary source picker.

## Independently selectable policies

### Fing local premium features

Change the qualified feature-authorization entry to true, the local tier getter to
its independently verified PREMIUM enum constant, and the local purchase-status
predicate to true. Replacing the whole feature entry covers empty feature lists
and missing tier matches that never invoke a collection predicate. Preserve the
original ServiceActivity readiness guard and its unmodified call graph; its local
premium fallback uses the patched purchase-status predicate. Whole-body
replacements preserve metadata/register counts and discard stale code/handlers.

The archived [Paresh Fing implementation](https://gitlab.com/Paresh-Maheshwari/paresh-patches/-/blob/84b5e5b507f5d289b092356675c1c5bb1e4a0387/patches/src/main/kotlin/app/paresh/patches/fing/premium/FingPremiumPatch.kt)
provides a three-layer comparison for 12.12.0. All current targets and enum identity
were independently located in the original 12.13.5, not copied by old class names.
Unlike an unconditional ServiceActivity return, this implementation retains the
service-readiness check. The old shared collection predicate is not patched.

This does not create a purchase, subscription, identity, login result, cloud
entitlement or server authorization. Some UI may become available while the
original backend still denies a paid operation. Original account and purchase
request/response code is not rewritten.

### Fing reduce telemetry

- Hard-deactivate qualified Google Analytics collection and automatic screen
  reporting; disable the qualified automatic Crashlytics collection arbiter and
  attempts to re-enable automatic collection.
- Apply the fixed analytics/Crashlytics/Performance/Sessions and ad-identifier
  metadata opt-outs, plus Facebook automatic app-event/advertiser-ID opt-outs.
- Remove only six declared ad-ID/install-referrer permissions and six reviewed
  Google Analytics/measurement service/receiver declarations.
- In Privacy settings, force the Crash reporting switch off and disable interaction
  while this policy is selected, even if an existing preference is true. Preserve
  the stored preference, original callback and all other screen behavior; without
  this patch the original UI is unchanged. This reflects SDK policy, not a claim
  that the UI switch itself proves every network event is suppressed.
- Preserve Firebase Authentication, the original Fing notification service and
  its configuration, Billing activities, WorkManager, shared data transport,
  network discovery and Android network/Wi-Fi/Bluetooth/location permissions.

This is scoped collection suppression, not proof of zero telemetry, no local
crash files, no manual SDK event calls or no third-party traffic. No offline mode
is provided for this network-discovery application.

Both policies are recommended defaults but can be deselected independently. Their
only common dependency is the hidden pristine-input guard. No runtime helper is
injected, no app is renamed, and neither policy depends on CamScanner or RailsGo.

## Donor changes deliberately not copied

The comparison donor has extensive junk/redundant instructions and source-tag
removal. Its added three-method helper is not an implementation requirement.
All original assets and native library contents match the donor, so there is no
evidence that replacing those files is required for the local feature changes.

Do not copy its lowered minimum SDK, replacement Maps API key, removed Billing
activities, deleted Fing push service, global Google Play services availability
bypass, removed dependency metadata or cosmetic resource repackaging. In
particular, preserve the original Maps key; never borrow a donor's service key.

## Validation and rollout boundary

Tests cover exact metadata/version/build/ABI contracts, independent defaults,
return bodies, preserved method metadata, cleared old handlers/debug items,
wrong-target rejection and manifest preservation/ambiguity guards.

Qualify the official CI bundle against pristine merged and full APKM inputs;
verify only the intended three/six methods change for each policy, all other method
graphs and metadata remain, no class/helper is added, and native/assets/identity/
minimum SDK remain unchanged. Exercise modified/donor/reapply/wrong-code rejection.
Keep fingerprint writer variants measured independently; do not relax a pin just
to make an input pass.

Build and static APK success are not device acceptance. Startup, existing login,
LAN discovery, local feature UI, push and map behavior still need phone checks.
Re-signing may affect certificate-restricted third-party APIs even when their
original keys are preserved. Do not uninstall or clear an existing installation
to investigate an unknown signing-key mismatch.

Cloud paid operations and account rights are outside the local predicate claim.
No automatic production merge/release is part of initial candidate qualification.
