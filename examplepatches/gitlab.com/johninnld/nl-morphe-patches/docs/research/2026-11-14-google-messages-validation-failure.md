# Google Messages validation failure: it is the re-signing

Date: 2026-11-14. Revised 2026-11-14 after the owner confirmed the phone has no Play Protect
problem (an earlier screenshot in the same conversation was sent in error).

Question: can the failure be solved with microG RE, or does Messages need a PairIP patch?

Answer: neither. The failure is exactly what the owner suspected — the app is re-signed. There is
no licence check to bypass and no device certification issue to work around.

## Cause

Play services verifies the calling package's signing certificate before serving several of its
APIs. Every patched build is signed with the Morphe key instead of Google's, so the connection
request is answered with:

```
SecurityException: PackageVerificationRslt: not allowed
```

Messages bundles its own copy of the Play services client
(`com.google.android.gms.common.internal.BaseGmsClient`). That code catches `SecurityException`
around `IGmsServiceBroker.getService` and re-throws it on its own worker thread, which made the
patched copy close at start-up. The refusing party is Play services; the fatal re-throw is in
Messages' bundled client.

Corroborating bytes in the supported input (SHA-256 `8d2b553efe6d2222f8f4ae625577c45cf1b55a09454e43703801a648e449a1ca`):

| Check | Result |
| --- | --- |
| `isFineGrainedPackageVerificationAvailable` (the GMS verification API behind the refusal) | 3 hits, app DEX |
| `Lcom/google/android/gms/common/internal/BaseGmsClient` | 6 hits, app DEX |
| `Lcom/google/android/play/core/integrity` (Play Integrity client in the app) | 0 |
| `pairip` (whole archive, all 33 native libs, all 12 DEX files) | 0 |

## The check is not in Messages

Messages only *calls* the check; Play services implements it. Scanning the two packages side by
side (Messages input above, and Play services 25.26.35 from the Android 16 emulator,
`/product/priv-app/PrebuiltGmsCore/PrebuiltGmsCore.apk`):

| String | Messages (12 DEX) | Play services (16 DEX) |
| --- | --- | --- |
| `PackageVerificationRslt: ` (the refusal text) | 0 | 1 |
| `com.google.android.vending.verifier.IPackageVerificationApiService` | 0 | 1 |
| `isFineGrainedPackageVerificationAvailable` | 3 (client call + AIDL transaction) | 1 (implementation) |
| `com/google/android/gms/common/PackageVerificationResult` | 0 | present |
| `pairip` | 0 | 0 |

`GoogleSignatureVerifier` / `isGoogleSigned` do appear in Messages' DEX, but they are the client
library verifying that the service it binds to is Google-signed (anti-spoofing), not a self-check.
There is no local gate in Messages that decides whether the copy is Google-signed, so there is
nothing in the app to delete.

Removing the check would therefore mean patching Play services: a 177 MB obfuscated `priv-app`,
updated by the Play Store, requiring system-level or rooted modification for every GMS version, and
it would break Play certification/integrity for the whole device. It is outside this bundle, not
distributable through Morphe, and it still would not make Google's verifier allowlist accept the
copy. The in-app equivalent — not treating the refusal as fatal — is what v1.87.3 does.

## Re-signing cannot be avoided

- Any DEX or resource change invalidates Google's signature; the file must be signed again with a
  key the patcher owns.
- With **Change package name** on — required to install beside the stock app — the copy is also a
  different package, so Google-account-bound services cannot be addressed at all.
- Keeping Google's key is not an option, and using a different package without re-signing is not
  either. Re-signing is the operation, not a mistake in it.

## What that means for features

- **Handled:** the refusal is fatal only because the client re-threw it. Since v1.87.3 it continues
  into the existing failed-connection path. The app starts, and SMS/MMS work.
- **Not fixable in the app:** RCS chat, Google account sign-in and backups. Google's answer depends
  on the signing identity (and, with a renamed package, the package name), so no client-side change
  can restore them.
- **microG RE does not change that:** it reimplements Play services client APIs for apps that need
  local services (YouTube account access). It cannot present a Google-signed identity and does not
  implement RCS/Jibe at all. Refusals would become silent local failures instead of the explicit
  `PackageVerificationRslt` that identified the crash.
- **PairIP is irrelevant:** there is no PairIP component in Messages to patch, and PairIP guards an
  app's own integrity, not the signer check Play services performs.

## Shipped state

- Fix commit `f75f0503` — the `SecurityException` handler in the connection request continues into
  the same path that already handles every other failed request.
- Release commit `70b4b16a`, tag `v1.87.3`, source `f75f0503`, on `main` and on the GitLab remote.
- `./gradlew :patches:test --tests 'patches.messages.MessagesPatchesTest'` → `BUILD SUCCESSFUL`,
  7 tests, 0 failures, including `everyPatchSurvivesPlayServicesRefusingTheCopy`.
- Emulator run recorded in `f75f0503`: v1.87.2 output crashed with the same refusal; the fixed
  output started, became the default SMS app, received an SMS and sent a reply while Play services
  refused 11 connections, each reported as a failed connection. MMS and RCS cannot be checked on
  an emulator.

## Verification of the released artifact

The published bundle was re-applied to the exact input, not just tested at source level:

- Downloaded `patches-1.87.3.mpp` (SHA-256 `7d95ed5d4e0bb69a985d46e57622cb708d8c712cce87c6d31d32912193729855`) from the
  v1.87.3 release and patched the APKM with all four Messages patches (Morphe CLI 2.0.0 on Java 27).
- Output `classes13.dex`, `BaseGmsClient.p(IAccountAccessor,Set)`: the `SecurityException` handler at
  `0x00da` is `move-exception v0` followed by `goto/16 0x00c6` — the RemoteException path that logs
  `IGmsServiceBroker.getService failed` and reports a failed connection. The `throw v0` is gone.
- Installed that signed output on the Android 16 emulator (Play services 25.26.35): it launched,
  the process stayed alive on `ConversationListActivity`, the crash buffer stayed empty, and logcat
  showed the refusal being handled:
  `W GmsClient: IGmsServiceBroker.getService failed`
  `java.lang.SecurityException: PackageVerificationRslt: not allowed: pkg=app.morphe.android.apps.messaging, sha256=[…], atk=true`.
- Test artifact kept at `~/Downloads/Messages-1.87.3-morphe.apk`
  (SHA-256 `9e8d25576eef01e02d31a3da0142711db20d0b47fe94401eaad88fcf0f21e782`, signer
  `b16b4097649da960b9788350f1b7ef394cf23b37795659782a4b29913918f212`).

## Phone-side cause: Play services' uncertified-device notice

With the phone connected (OnePlus CPH2747, Android 17, Play services `26.45.31`), the released
v1.87.3 artifact was installed and launched. It does not crash: logcat shows the re-signing refusal
being handled by the patched handler (`BaseGmsClient.p(PG:179)`), and the crash buffer stays empty.
What blocks the app is Play services' device-compliance code, bundled in the APK:

```
mCurrentFocus=Window{… app.morphe.android.apps.messaging/
    com.google.android.gms.gmscompliance.ui.UncertifiedDeviceActivity}
```

Decompiled, that activity only displays the notice; its Close button calls `finish()` and it
provides no function of its own. The emulator never shows it because its Play services version
(`25.26.35`) does not run the compliance check, which is why the emulator run passed while the
phone did not.

The device itself is reported as uncertified by Play services, which is the device-level status
shown in the owner's screenshots (`08:51`, `08:57`, and again on the live capture at `14:07`).

`uncertifiedDeviceNoticePatch` (new, internal) finishes the notice in `onCreate`, before
`super.onCreate`, so it never reaches the screen. It is inert on a certified device, where the
notice is never started, and it changes nothing else about the activity. All four public Messages
patches depend on it, as they do on the refusal fix.

What this does not change: the Google features the notice warns about (RCS, Google sign-in,
backups) are refused by Play services for a re-signed copy, and on an uncertified device for the
stock app too. SMS and MMS keep working. Registering the device's Google Services Framework ID at
`google.com/android/uncertified` remains the only route that clears the device status itself.

## Device certification

The notice is device-level: Play services reports the build as not certified, independently of the
patch. It does not block SMS/MMS once the notice is skipped, but it is why Google-side features stay
unavailable. It is separate from the re-signing refusal and cannot be changed from inside the app.


## Decision

- No PairIP patch: Messages contains no PairIP.
- No microG RE route: it cannot provide a Google-signed identity or RCS.
- The v1.87.3 client-side fix stays in the released history; it converts the re-signing refusal
  from a crash into a handled failed connection.
- `uncertifiedDeviceNoticePatch` was written and wired into all four patches, but has not shipped:
  it only removed the notice on top of the app.
- Google Messages support was then removed from the bundle by the owner (2026-11-14). The Android
  Auto car screen it was built for cannot be reached on a re-signed copy whose device Play services
  reports as uncertified, and the remaining Google features cannot be restored from the app side.
  Keep the stock app.
