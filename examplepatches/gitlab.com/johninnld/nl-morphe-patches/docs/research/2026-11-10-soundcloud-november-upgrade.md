# SoundCloud November upgrade: Go switches and microG-RE

Target: publisher APKM `com.soundcloud.android` **2026.11.02-release / 379060**, minimum SDK 28
(measured from the manifest; the previous 2026.10.28-release target required SDK 32).
All four existing controls — Disable analytics, Disable consent popup, Enable SoundCloud Go and
Home in Android Auto — were re-verified against this build before anything was added.

## Artifact identity

- APKM SHA-256: `4bcb97d4b5db2242bfd9a60d13f998067a866147e106c1cccf0f5f1729e73464`.
- Embedded base APK SHA-256: `9fbb4f4b3e8fa4597cbe5361c17e470c987d0a73e575c9c32f5b6860832c6078`.
- Publisher signer (Jon Schmidt) certificate SHA-256 unchanged:
  `aff930d671fa0a57b8c41d1678cc2a8ea717075a74e346942a140afa441339d2`, so the compatibility
  signature set needed no change.

The publisher ships 379060 in two APKM variants: the Android 10+ download the phone uses
(manifest minSdk 29, also what the v4n1x checkout declares for this release) and the
Android 9+ 2arch archive this Mac validated (minSdk 28) — with byte-identical base APKs,
so the manifests differ only in the minimum. The first phone review run failed the
original-input guard's minSdk check on the 28-only target. Following the owner's rule
that a manifest minimum-SDK difference must never fail patching, the guard now pins the
input by package, version, version code and signer only; the catalog target documents
the Android 10+ variant.

## Go feature switches

The additional control requested from the local `soundcloud-patches` checkout (v4n1x, release
v1.4.1, already targeting this build) forces three `/configuration` switches on by rewriting the
`Feature(String, boolean, List)` constructor: `offline_sync`, `no_audio_ads`, `hq_audio`. That
implementation clones the constructor with an extra scratch register because the constructor has
no locals, and the checkout's history shows a DEX VerifyError on that path (issue #2).

This port keeps the semantics and drops the fragility. The switch values are stored through the
constructor's `this(str, z2)` delegation and read back from the feature preferences everywhere,
including the `updateFeatures` write and its observable. The patch therefore routes the
constructor's `enabled` parameter through a static helper in the merged extension:

```
invoke-static {p1, p2}, Lnl/johninnl/soundcloud/GoPlus;->feature(Ljava/lang/String;Z)Z
move-result p2
```

The call takes only parameter registers (the constructor has exactly four registers: this plus
three parameters), so no register remapping is involved, and the three names live in one
testable Java helper (`GoPlusTest`). A register-count guard fails the patch if a future build
gives the constructor locals. DEX evidence: `SoundcloudDexRegression` checks the injected call,
its parameter registers and the move-result target in the Go scenarios and their absence in the
others.

What the switches cannot do is documented with them: SoundCloud's servers decide HQ delivery
(higher-bitrate AAC is listed and authorised for paying Go+ only), Go+-only tracks stay
previews, and encrypted offline copies need a real subscription. The existing ad-request
overrides keep covering the ad side more broadly than `no_audio_ads` alone.

## Add microG-RE support

SoundCloud signs in through its own web flow (`secure.soundcloud.com/web-auth`, PKCE, `sc://auth`
deep link), confirmed by tracing `AuthenticationViewModel`/`WebAuthenticationHandler`: there is
no native Google sign-in call in this build (the bundled GMS Sign-In SDK is dead library code;
the one `AccountPicker` lazy in `GooglePlayServicesWrapper` has no callers). The web login,
including its Google button, works on any phone.

The Google plumbing around the account does need Play services, and the patch routes it to
MicroG-RE (MicroG-RE or ReVanced GmsCore, both installed as `app.revanced.android.gms`):

- Firebase Cloud Messaging carries sign-in/listening notifications and registers through
  `com.google.android.gms` c2dm (`DefaultFcmManager.attach` gates on availability).
- The embedded `GoogleApiAvailability`/`GoogleApiAvailabilityLight` availability checks gate
  push, Cast, the ads identifier and in-app review.
- Manifest: `com.google.android.c2dm.permission.RECEIVE` and
  `com.google.android.gms.permission.AD_ID` are routed to microG's names (exactly the two
  Play-services permissions the manifest holds), a `app.revanced.android.gms` package query is
  added, and the spoofed-identity metadata names stock SoundCloud and its publisher certificate
  SHA-1 (computed from the input's actual signing certificate, not hardcoded).
- Code: the GmsCore name routing ported from the shared Morphe patch
  (MorpheApp/morphe-patches commit 31a66d95, same port the AliExpress patch carries) rewrites
  the Play-services package, account type, service actions, authorities and content URIs;
  all four availability overloads early-return success; a floor of 80 rewrites guards the
  measured surface (57 package and 18 account-type occurrences among ~200 total).

Patch default is off: on phones with real Play services the original routes are correct.

## Verification

`scripts/validate_soundcloud.py` (new expectations: 2026.11.02-release, five patches) rebuilt
all native ABIs in seven scenarios — each control alone, the four together, and the four with
Home in Android Auto. All passed with fingerprint validation enabled, manifest string-pool
checks (c2dm/AD-ID routing, microG metadata presence, SoundCloud permission retained) and the
extended `tests/SoundcloudDexRegression.java` (Go-switch injection registers, availability
early-returns, zero remaining `com.google`/`com.google.android.gms` const-strings exactly in
the microG scenarios). `:extensions:soundcloud:test` covers `GoPlusTest` (3 checks) beside the
existing mapper tests.

## Add microG-RE support — withdrawn before release

An Add microG-RE support control was built for this release: manifest permission
routing (c2dm, ads ID), package visibility, spoofed identity metadata naming stock
SoundCloud and its publisher certificate, availability-check success on all four
embedded overloads, and the shared GmsCore name routing (MorpheApp commit 31a66d95,
the same port the AliExpress patch carries). It validated in all scenarios.

Withdrawn before release at the owner's direction: SoundCloud's sign-in is its own
web flow in a browser tab and needs no Google services — confirmed on-device by
signing in with the control absent — and nothing else in the owner's use depends on
microG (push, Cast, ads identifier and in-app review remain Play-services features,
off by default). The control, its validation wiring and its documentation were
removed again before publishing; the analysis is retained here.

## Ignore device limit

Follow-up analysis the same day: SoundCloud caps sign-in at ten devices, and the whole
enforcement is client-side. `/configuration` carries `device_management:
{authorized, recoverable}`, read only through three `DeviceManagement` predicates:
`DefaultSignInOperations.b()` refuses to finish an unauthorized new sign-in (the OAuth
token is already issued; DEVICE_CONFLICT when recoverable, DEVICE_BLOCK otherwise), and
`ConfigurationManager.d()` logs an unauthorized signed-in device out on the next
configuration refresh and revokes its token. No playback or streaming code reads the
state. The patch early-returns false from the three predicates.

A first phone review (signed in as device eleven) still failed with the app's web-auth
error screen (`error_soundcloud_no_response` / `error_server_problems_message`), with an
OkHttp response-body leak in the process log: with the predicates neutralized, the
registration request itself is refused over HTTP before any flag exists. The patch now
also skips the registration handshake at sign-in (`DefaultSignInOperations.b()` returns
`Optional.empty()`), which covers both the flags and the refused request; the startup
configuration fetch, whose failures are only error-reported and never fatal, takes over.
The install stays unregistered in SoundCloud's device list. Server-side enforcement
beyond these handshakes would defeat any client patch.

## Validation limits

No account was used and no emulator session was run for the microG path: FCM delivery through
an installed MicroG-RE, Cast behavior and the ads identifier against microG are unverified, as
is push on a real degoogled device. HQ audio, offline downloads and ad behavior remain
server-bound and account-bound. The upgrade itself is covered by the seven rebuild scenarios
and DEX checks above.
