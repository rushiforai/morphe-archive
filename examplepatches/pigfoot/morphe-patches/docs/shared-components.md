# Shared component index

Read this index **before adding or changing a patch**. Follow the linked source
and tests, not just the capability name. Reuse an implemented component when its
contract fits; otherwise record why it does not fit before adding new machinery.
Update this index in the same change as a shared API or consumer change.

## Architecture and selection

These are internal Kotlin helpers compiled into the existing MPP, not a separate
library or public common-patch bundle. Selecting **PiTT Google account sign-in**
automatically uses its required code; users do not select a certificate/Firebase
patch or enter certificate options. Deselecting Google sign-in does not execute
its identity validation or Auth correction. The local-sponsored policy remains
independent. Public names, defaults, compatibility and dependency selection stay
unchanged.

Use a function/value for stateless computation or instruction transformation.
Use an internal dependency patch only when a real resource/bytecode lifecycle or
execution-order requirement exists. Expose a public common patch only for a
deliberate, independently usable cross-app policy. A `shared/` directory alone
does not make a patch universal or prove compatibility with another app.

## Implemented: original-input certificate identity

- Source: [OriginalCertificate.kt](../patches/src/main/kotlin/app/pigfoot/patches/shared/certificate/OriginalCertificate.kt).
- Tests: [OriginalCertificateTest.kt](../patches/src/test/kotlin/app/pigfoot/patches/OriginalCertificateTest.kt).
- Consumer: [PiTT input/resource/bytecode adapter](../patches/src/main/kotlin/app/pigfoot/patches/pitt/PittPatches.kt).
- Consumer: [Windy original-input guard](../patches/src/main/kotlin/app/pigfoot/patches/windy/WindyPatches.kt),
  using an independently qualified app-owned signer pin. This is input validation,
  not signature spoofing; no Firebase/GmsCore policy is applied to Windy.

Pass `packageMetadata.signingCertificates.values.flatten()` and the **app-owned,
independently qualified SHA-1 pin** to `requireOriginalCertificate`. The function
returns immutable lowercase SHA-1/SHA-256 values for this call only. Identical DER
certificates repeated across signing schemes are one identity; missing, distinct
multiple certificates, malformed pins and mismatches reject. No global cache,
installed-app lookup, manual override, fallback certificate, or new APK parser is
used. Different apps/patch sessions cannot inherit the previous input's identity.

```kotlin
val identity = requireOriginalCertificate(
    packageMetadata.signingCertificates.values.flatten(), APP_ORIGINAL_SHA1
)
// Use identity.sha1 only after app-specific package/version/class guards pass.
```

This consumes the metadata already extracted by Morphe from the original base
APK (including split-bundle inputs). It does **not** cryptographically verify APK
signatures, replace class/content pins, accept arbitrary certificates, or broaden
supported versions. An untouched merged input may retain the original certificate
without a valid signature over the merged ZIP. Inputs without usable signing-block
metadata, v1-only inputs and certificate chains/rotation with distinct certificates
are not newly supported; qualify an explicit adapter before adding support.

PiTT validates the certificate in its existing Google input dependency before
any Google manifest edit, then resolves the value independently at each consumer.
Its original pin remains in the PiTT source. Local-sponsored-only applications
do not acquire this extra requirement.

## Implemented: scoped Firebase certificate header insertion

- Source: [FirebaseCertificateHeader.kt](../patches/src/main/kotlin/app/pigfoot/patches/shared/firebase/FirebaseCertificateHeader.kt).
- Tests: [FirebaseCertificateHeaderTest.kt](../patches/src/test/kotlin/app/pigfoot/patches/FirebaseCertificateHeaderTest.kt).
- Qualified adapter: [PittGmsPolicy.kt](../patches/src/main/kotlin/app/pigfoot/patches/pitt/PittGmsPolicy.kt).
- App regression tests: [PittGmsPolicyTest.kt](../patches/src/test/kotlin/app/pigfoot/patches/PittGmsPolicyTest.kt).
- Contract/evidence: [PiTT Firebase client identity](pitt-firebase-client-identity.md).

The adapter supplies an exact method ID, identity class/getters, register count,
receiver/connection/key/value registers and next-header lifetime contract. The
helper checks unique `X-Android-Package` / `X-Android-Cert` sites, getter/result and
`URLConnection.setRequestProperty` calls, ordering, original register layout,
next overwrite and prior insertion **before any mutation**. It inserts one
uppercase SHA-1 constant immediately before the certificate-header call; no new
register, method or injected runtime helper is required by this transformation.

The generic tests use synthetic methods and different registers to verify the
mechanism; they are **not** qualification of a second Firebase SDK or app. Actual
class fingerprints and eligibility remain app-owned. PiTT's adapter covers only
its pinned Auth transport/producer; Installations, Remote Config and other SDK
shapes need their own traced contract and independent qualification. Do not scan
globally for matching header strings or remove guards to force a match.

## Existing app-specific mechanisms (not interchangeable shared APIs)

- [PiTT GmsCore routing and on-click guidance](pitt-gmscore-study.md): keep the
  legacy-client redirect, manifest rules, original Google audience and explicit
  login-only provider guidance app-scoped. No general GmsCore helper is promised.
- [CamScanner signing compatibility and telemetry](camscanner-implementation.md):
  native request-signing edits/cache policy and telemetry suppression are not the
  Firebase Auth certificate-header fix. Preserve their separate guards.
- [RailsGo sideload policy](../patches/src/main/kotlin/app/pigfoot/patches/railsgo/RailsGoPatches.kt):
  app adapter for the shared, pinned Java license-entry helper below, not a generic
  PairIP VM/global signature hook. App-specific qualification remains required.

Deferred: independent library distribution, generalized GmsCore, generic Firebase
product adapters, and public common-patch options. Add only after concrete consumers
and app-specific qualification justify them.

## Change validation

Keep the catalog/defaults/dependencies stable for internal refactors. Run the
[CI preflight and exact-head gate](ci-preflight.md), certificate missing/mismatch/
ambiguity/cross-input tests, Firebase malformed/duplicate/register/lifetime/reapply
guards, and the existing app tests. Bind APK comparison to the tested MPP: compare
fresh clean-input selected/default/split outputs with both the original and the
previously qualified result. Document any newly rejected input separately. Static
equivalence is not a new phone/login test. Commit only public synthetic test
certificates, never private keys, app APKs or private device evidence.

## App-owned enum reward callbacks (PikieWalker)

PikieWalker 2.0.4 passes an `AdResult` enum to its existing callback; it does not
consume SDK reward metadata. Its app-scoped entry transformation therefore does
not reuse the RailsGo loaded-reward helper or introduce a shared extension.
Package/build/signer/class pins and eligibility remain app-owned. See
[PikieWalker evidence and validation](pikiewalker-implementation.md).

## Required compatibility patch presentation

Repository practice: a required app compatibility policy is **visible** as an
app-scoped patch in Morphe, with `REQUIRED` availability for qualified installers.
Each feature needing it also declares `dependsOn`. Default selection alone is
not requiredness, and a hidden inline edit is not a substitute for this UI.
The implementation can remain an internal helper/dependency in shared/common;
do not expose a second universal toggle simply to share code. App-owned
package/version/signer/class pins are not moved into global mutable state.

## Implemented: Pairip Java license startup entry

- Source: [PairipLicense.kt](../patches/src/main/kotlin/app/pigfoot/patches/shared/pairip/PairipLicense.kt).
- Consumers: RailsGo startup compatibility and PikieWalker startup compatibility.
- Tests: [PairipLicenseTest.kt](../patches/src/test/kotlin/app/pigfoot/patches/PairipLicenseTest.kt).

`preparePairipLicenseSkip(originalClass, appPin, dexWriterVersion)` validates the
exact original class and static `checkLicense(Context): void` shape, then returns
a copy with an early return. It does not mutate the supplied class on success or
failure. Each adapter owns its content pin and writer version; RailsGo retains
its existing DEX37 pin and PikieWalker qualifies its own DEX39 original.

This addresses the traced Java entry called by the application's startup/provider.
It is not installer-name spoofing, a purchase grant, Play Integrity server
attestation bypass, or Pairip native virtualization support. Other Pairip versions
need independent qualification; broad string scanning is not an adapter.

### Plain-language labels

Use `<App>: Skip Google Play install check` when the app display name is useful.
Do not put raw Android package IDs (such as `com.vendor.app`) in the title;
package identity belongs to compatibility metadata. This UI-copy rule does not
rename the actual APK package and does not require removing readable app names.
The delivered 1bfbaf5 labels already follow this distinction. Explain that it
lets the patched app open without requiring installation from Google Play and is
required/included automatically. A brief `Technical reference: Pairip client-side license check.` may follow
the benefit/requiredness sentence; detailed mechanism explanations belong in
developer references. RailsGo previously called this `RailsGo sideload startup compatibility`;
the variable/dependency object stays the same, but users may need to select the
newly named entry if a manager saved selection names from an older bundle.

## Feature-comparison identity map

Consult this map when comparing repositories/features; installer labels alone are
not technical capability identifiers. Keep UI wording understandable while
retaining the canonical technical name in the description and this record.

| Canonical capability | Public label / technical reference | Repo implementation and consumers | Comparison boundary |
| --- | --- | --- | --- |
| Pairip Java client-side license startup check | `<App>: Skip Google Play install check`; `Technical reference: Pairip client-side license check.` | `shared/pairip/PairipLicense.kt`; visible REQUIRED RailsGo/PikieWalker adapters, explicit feature dependencies, app-owned pins | This repo skips its qualified `checkLicense(Context)` entry. Do not count it as native Pairip VM support or server Play Integrity attestation. |
| Install-source spoofing | Other repos call it `Spoof install source` | **Not implemented by the Pairip helper.** A separate adapter and qualification would be needed. | Installer getter/Binder spoofing is not the same as Java license-entry compatibility. Do not mark either feature as covering the other. |

Verified comparison references:
- [Hoo-dles: Disable Pairip license check](https://github.com/hoo-dles/morphe-patches/blob/e9c942640130c809fcb908332bf7dc56d59cf86f/patches/src/main/kotlin/hoodles/morphe/patches/all/pairip/license/DisableLicenseCheckPatch.kt): processes/validates license responses; its implementation differs from this repo's pinned entry skip. Both are client-side licensing mechanisms, not proof of VM/attestation coverage.
- [Doom: Spoof install source](https://github.com/rushiranpise/morphe-patches/blob/92c0fca0ae103a419c7fc61f9c5b8b38b7d6b82a/patches/src/main/kotlin/app/template/patches/shared/installer/SpoofInstallSourcePatch.kt): installer getters plus an optional Binder proxy; a distinct capability.

On future additions/renames, update this mapping with the canonical mechanism,
user-facing label, implemented vs planned status, consumers, pinned references,
and explicit non-coverage. Never infer feature equivalence from similar names.

## GPS JoyStick local Premium adapter

GPS JoyStick reuses original-input certificate identity pinning. Its local cached-tier resolver and separate Splash ad-free
preference reader are qualified app-owned policies, not generic Billing hooks or Pairip/installer spoofing. The adapter selects separate class/field/manifest pins for Google Play and official Unlocked 5.3.4/3031 inputs. One default-selected public feature patch automatically dispatches to exactly one fully matching original class-pin set before mutation. Unknown, mixed or ambiguous builds are rejected; Manager metadata is not claimed to filter by file checksum. Version 5.3.3 support is removed.
One public
Premium policy includes ad-free; no injected extension is needed. Maps key stays original unless the user provides the optional map setting;
permission/setup and native payloads remain original. See
[GPS study and candidate contract](gps-joystick-study.md).


## Implemented: qualified Google Maps metadata replacement

`shared/maps/MapsApiKey.kt` is an equal-length raw AXML payload helper with
app-owned complete-manifest and original-value SHA256 pins, one supported key
occurrence and fixed-format guards. Manifest pins qualify the original metadata
structure; UTF8/UTF16LE edits preserve all string-pool lengths/offsets and every
other byte. The app adapter
owns the hash and option. Empty input is a no-op. It does not ship a key, change
signer identity, grant Google Cloud access, or add a native loader. GPS JoyStick
is the first consumer; other apps still need independent qualification.
