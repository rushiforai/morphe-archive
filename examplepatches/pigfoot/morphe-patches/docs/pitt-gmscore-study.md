# PiTT GmsCore sign-in adapter

## Qualified reference and selection

Target: PiTT 12.0.0 / 40892 ARM64 APKS. The independent, selected-by-default patch
**PiTT Google account sign-in** requires separately installed
[MicroG-RE 7.2.2](https://github.com/MorpheApp/MicroG-RE/releases/tag/7.2.2),
compiled package `app.revanced.android.gms`. Its legacy Google Sign-In activity
and service match PiTT's existing `GoogleSignInOptions` / `GoogleSignInAccount`
flow. No app/SDK stub, replacement Kotlin runtime or new extension is bundled.
The user reported successful login after the scoped Firebase Auth correction.
The [historical survey](pitt-google-signin-study.md) records alternatives and why
an existing browser fallback was not assumed.

## Implementation contract

Pin eight original classes, measured independently on pristine base and untouched
merged input, plus the shared PiTT clean-input guard. Retain original package,
Google client audience, Firebase project and account-result parsing.

1. On the explicit signed-out Google login click, call a local dependency helper.
   An enabled provider returns to the untouched original login body. Missing
   MicroG opens its official release page after a notice; disabled MicroG opens
   app settings. A missing activity handler, package-check exception or null
   context returns without crashing, installing, selecting accounts or signing in.
   The original sign-out branch bypasses this helper completely.
2. Select the legacy API mode in the qualified availability method; keep its
   original body/handlers rather than returning a synthetic account.
3. Redirect only the three qualified intent/service auth methods. Add two public
   synthetic instance overrides to the legacy sign-in client for service package
   and availability. The shared GmsClient superclass is unchanged.
4. Add one package-visibility query and two original-identity metadata entries for
   MicroG; reject existing/conflicting additions before changing the manifest.
5. Correct the separate pinned Firebase Auth HTTP certificate header with one
   constant in the existing value register, following the SDK's uppercase SHA-1
   representation. See [Firebase identity](pitt-firebase-client-identity.md).

In total, six existing methods change and three methods are added: two legacy
auth-client overrides and one static helper on the existing click-listener class.
The header correction adds no method/register. All original instructions outside the
qualified mode/string/header/click sites, branches and exception paths are retained.
The other local sponsored policy is not a dependency. Both policies have no
parameters, and Google sign-in defaults to selected but can be deselected.

## Boundaries

MicroG account selection alone does not establish Firebase or PiTT login. Keep
real Google ID-token issuance for the original audience, Firebase credential
exchange and original PiTT account-state handling. Do not fake success or disable
TLS, App Check, token/receipt validation. Billing, push, advertisements, Remote
Config, Installations and other GMS clients are not globally redirected.

MicroG identity metadata does not itself change the separate Firebase Auth SDK's
HTTP certificate header. Installing MicroG alone does not patch PiTT. Original
Play services and the separately packaged MicroG variant are not interchangeable
without this app-scoped adapter. Root/mount and other MicroG variants are not
qualified by this implementation.

## Updating and validating

Start from original v12 APKS, keep the same package and Morphe signing key, and
keep the adapter selected (or deselect it if not using Google login). Removing
temporary diagnostics does not remove this adapter or its Firebase compatibility
fix. Stock authentication failure messages/callbacks remain; the new dependency
guidance is described below. No diagnostic checkbox, formatter or error-code
instrumentation ships.

Follow the [implementation validation frame](pitt-implementation.md). Verify exact
class pins and inherited client method contracts; reject missing/modified classes,
collisions and reapplication. Invert the declared edits to recover original method
graphs and independently verify manifest/resource/native preservation. New device,
account, cancellation, network or expired-token behavior requires actual runtime
observation; prior user acceptance is not a universal compatibility claim.


## User-facing default and guidance

The policy is named **PiTT Google account sign-in**, not after its GmsCore
implementation detail. Standard/Shizuku default to selected but allow deselection;
mount remains unsupported. This signs into PiTT/Firebase using a Google identity,
not into PTT BBS with its own credentials. Local sponsored selection is independent.

A compatible `app.revanced.android.gms` already used by YouTube may be reused;
PiTT obtains its own audience-scoped authorization rather than reusing a YouTube
token. MicroG remains a separate APK. There is no startup dependency check, app
exit, automatic install/uninstall, broad GMS rewrite or background update service.
The official release page is only opened after an explicit missing-provider login
attempt. A disabled provider opens only its own app-details settings.

## Release and acceptance status

The Google-account sign-in/default/guidance follow-up has been accepted for
closeout. This is maintenance of the existing v0.4.0 adapter, classified as a
`fix(pitt):` patch release (expected v0.4.1 from v0.4.0), not a new login backend
or a minor-version feature. Missing/disabled-provider and account/network edge
cases retain their independent validation boundaries; acceptance does not mean
all such cases have been exercised on a phone. The generated stable catalog is
updated only by release automation, not by editing the research documents.
