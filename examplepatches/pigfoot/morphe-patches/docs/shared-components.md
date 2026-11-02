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
  exact Java license-entry compatibility, not a generic PairIP VM/global signature
  hook. Do not widen it while reusing certificate utilities.

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
