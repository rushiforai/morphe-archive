# Google Calendar schedule widget

`Stabilize schedule widget` is stable and selected by default. It supports
Google Calendar `2026.37.0-984865732-release` (version code `2018314914`, APKM),
package `com.google.android.calendar`. Widget runtime changes apply on Android 16+.

## Re-signed installation

The original manifest requests `com.google.android.calendar.uid.shared`. Android
requires matching signing certificates for members of that shared UID, so a
Morphe-signed fresh install can fail with `INSTALL_FAILED_SHARED_USER_INCOMPATIBLE`.
The patch removes `android:sharedUserId`, its label and its maximum-SDK metadata
from the output manifest. The package name, components, provider authorities,
permissions and Calendar Provider access remain unchanged.

This prepares an independent fresh installation; it does not migrate an already
installed Google-signed package or private data to a different signer or UID.
A remaining Google-signed app with the same package cannot be updated by a
Morphe-signed APK. Removing only system-app updates or disabling the app does not
remove that package. Installation on devices retaining the system package may
therefore need a separate package-name solution; this patch does not provide one.
Do not uninstall apps or clear provider data merely to test the patch. Preserve
unsynchronised data before any installation change.

Reference: [Android manifest shared-user ID and signing rules](https://developer.android.com/guide/topics/manifest/manifest-element#uid).

## Existing Google account visibility

After re-signing, Android may hide existing Google accounts from the Calendar UID.
Native Calendar enumerates `AccountManager.getAccountsByType("com.google")` and
its no-account onboarding calls `addAccount`; adding an account already on the
device does not resolve visibility.

The existing AllInOneActivity launcher alias now targets a small entry Activity.
When a Google account is already visible, it forwards immediately to the original
LaunchInfoActivity. Otherwise it opens the framework `AccountManager` chooser,
which can reveal an existing account to the calling package with user consent.
After the result, it rechecks actual account visibility before opening Calendar.
Cancellation closes the entry, rotation does not duplicate the chooser, and an
unavailable chooser falls back to the native entry. The latest original intent,
including click data/extras/flags, is forwarded; other native entry points,
providers, permissions and intent filters are preserved. No account names,
credentials or tokens are stored by the helper.

This requests account visibility; it does not manufacture Google authentication
or prove successful cloud sync. Framework chooser behavior, Google token access
and real-device synchronization still require device verification. Install the
newly patched APK as an update signed with the existing Morphe key to preserve
the application's private data.

References: [Android AccountManager](https://developer.android.com/reference/android/accounts/AccountManager#newChooseAccountIntent(android.accounts.Account,java.util.List,java.lang.String[],java.lang.String,java.lang.String,java.lang.String[],android.os.Bundle)) and [Google AccountPicker](https://developers.google.com/android/reference/com/google/android/gms/common/AccountPicker).

## Complete row replacement

The schedule RemoteViews factory builds a complete row with native content and
fill-in click intents. Each finished row is wrapped in a FrameLayout whose
RemoteViews removes its old child and adds the complete row in one transaction.
This avoids reusing stale child visibility, dimensions and drawable instances.
The adapter and native actions are retained; no empty intermediate widget update,
polling, scheduled reset or `addStableView` is introduced.

The patch identifies the factory structurally and verifies its relationship to
ScheduleViewWidgetService. All seven return paths are wrapped, including shared
returns. Initialization uses the factory Context before registers are reused.
Changed bytecode shapes and already-patched inputs are rejected. The helper does
not retain a Context or row and falls back to native rows if its resource is absent.

## Stable tile geometry

The supported build uses `widgetschedule_chip_background.xml`: an ImageView with
ID `agenda_item_color`, source `widget_chip_fill`, and `fitXY` scaling. Native
binding chooses `widget_chip_fill` or `widget_chip_outline` and applies event
color with `setColorFilter`. Both resources are rectangles with 12dp corners;
the outline has a 1dp stroke and the fill includes a ripple.

Android 16+ drawable overrides retain those resource names and replace their
mutable shape geometry with white/alpha nine-patch images. The PNGs are
aapt2-compiled with Android npTc stretch chunks and stored under a single `.png`
extension: Morphe copies binary resources without compiling raw nine-patch borders,
and its resource-ID scanner removes only the last extension. The xxxhdpi pixels
preserve 12dp corners and a 1dp outline. An 8px centre band stretches, with 4px
of safe space on either side. The native theme tint, color-filter call, ripple
structure and mask are retained. Original pre-36 XML, icon/date circles, month
widget resources, layout dimensions and other backgrounds remain unchanged.

Input checks require the expected ImageView, rectangular resource structures,
12dp radius and no alternative qualified drawables. Equivalent decoder spellings
(`dp`/`dip`, numeric formatting, inline values and dimension references) are
resolved before comparison; different radii, unsupported units and alias cycles
are rejected with the offending value in the diagnostic. Changed or already-patched
resources are rejected before adding new files.

This is a workaround for missing backgrounds and tile deformation.
Resource inspection and build checks do not establish the runtime cause or prove
that every launcher rendering error is eliminated. Extra row inflation is the
performance tradeoff; scroll retention under every update is not guaranteed.

Framework references:

- [Android 16 RemoteViews source](https://android.googlesource.com/platform/frameworks/base/+/refs/heads/android16-release/core/java/android/widget/RemoteViews.java)
- [RemoteViews API](https://developer.android.com/reference/android/widget/RemoteViews)
- [Nine-patch resources](https://developer.android.com/guide/topics/resources/drawable-resource#NinePatch)
- [Resizable bitmaps](https://developer.android.com/studio/write/draw9patch)

## Validation

- `python3 scripts/test_calendar_account_access.py`: runs the production entry
  Activity against framework fakes, checking real-visibility confirmation, native
  intent preservation, cancellation, chooser failure and Activity recreation.
- `python3 scripts/test_calendar_account_manifest.py`: validates the added entry
  and existing launcher routing under both DOM modes; compares all remaining
  manifest content and checks rejection without partial output.

- `python3 scripts/test_calendar_install_manifest.py`: runs the production Kotlin
  transform and verifies removal of the shared UID metadata, unchanged package,
  permissions/providers/components, namespace handling and rejected inputs.

- `python3 scripts/test_calendar_widget_rows.py`: production Java helper action
  contracts, native payload preservation, repeated replacement, concurrent
  initialization, null/missing-resource fallback and Android-version gating.
- `python3 scripts/test_calendar_widget_tile_shapes.py`: compiles and runs the
  production Kotlin transformer; checks fixed corners at four widths/heights,
  theme/ripple preservation, original resources and rejection without partial
  writes for changed layout/radius, variants and patched inputs. Requires a JDK,
  `kotlinc` (or `KOTLINC` path) and Pillow.
- The Kotlin transformer compiled, resource contracts and row contracts passed,
  and aapt2 rebuilt the supported APK resources with Apktool 2.12.1. That resource
  rebuild alone does not prove Morphe compatibility. The hotfix was additionally
  applied to the clean supported APK using Morphe Desktop 1.18.0: patch execution,
  incremental resource encoding, DEX compilation and APK alignment completed.
  The output retains both compiled npTc PNGs and their generated drawable IDs.
  This is not a real-device test.
- Calendar CI builds the extensions, patch bundle and metadata.
- `scripts/VerifyCalendarWidgetDex.java` verifies entry Context initialization,
  all seven hooks, branch/register safety and wrapper resource in a patched APK.
- Real-device rendering and long-duration behavior remain unverified.

## Installation and device checks (PL)

1. Uzyj czystego APKM podanej wersji i zaznacz `Stabilize schedule widget`.
   Patch jest domyslnie zaznaczony; nie ma przelacznika w aplikacji.
2. Zbuduj i zainstaluj aplikacje. Zmieniony APK ma podpis Morphe, a nie Google.
   Android nie pozwala nim nadpisac aplikacji podpisanej przez Google. Zachowaj
   niesynchronizowane dane przed zmiana instalacji. Moze byc konieczne jednorazowe
   dodanie widgetu; sam patch nie wymaga jego regularnego resetowania.
3. Sprawdz wydarzenia calodniowe, wielodniowe i z godzinami, zadania, kolory,
   obramowania oraz klikniecia wydarzenia, zadania, daty, `+`, Meet/Chat.
4. Sprawdz przewijanie, resize, dwa widgety o roznych rozmiarach, motyw jasny/ciemny,
   synchronizacje, zmiane daty, blokowanie ekranu i restart launchera/telefonu.
5. Korzystaj przez co najmniej 7 dni, aby sprawdzic stabilnosc dlugotrwalego uzycia.
   Ocen wyglad po instalacji i w dniach 1, 3 i 7. Jednorazowy poprawny wyglad ani
   brak crasha nie potwierdzaja skutecznosci.

Do not commit APKs, screenshots, device logs or account/calendar data.


## Optional MicroG-RE authentication (2026-10-03)

After account visibility is granted, a re-signed Calendar can still fail to obtain
Google tokens. `Google Calendar authentication via MicroG-RE` is an optional,
stable patch for the exact 2026.37.0 / 2018314914 input. Select it together
with `Stabilize schedule widget`. It requires Google Play services on the device
and **the same Google account in Android and MicroG-RE 7.1.1 or later**.

Only the owning package of Calendar's existing `GetToken` component is changed
to `app.revanced.android.gms`. The service's Java class name and Binder descriptor
remain Google names, as in the inspected MicroG-RE 7.1.1 release APK. The shared
component serves both token acquisition and invalidation. Android account types,
both sync-adapter XMLs, provider authorities, native OAuth scopes, expiration,
network-error handling and user-recovery Intents are preserved. It does not create
an account, fabricate tokens or mark failed synchronization as successful.

The clean input contains a signing-key rotation: the v2/v3 signer is SHA-1
`38918a453d07199354f8b19af05ec6562ced5788`, while Android 13+ selects the
v3.1 signer `bd32424203e0fb25f36b57e5aa356f9bdd1da998`. OAuth metadata uses
the pre-rotation identity. This identity is declared using
MicroG-RE's supported signature metadata. Source at tag `7.1.1`, commit
`c9386dd`, implements the same `IAuthManagerService.getTokenWithAccount` transaction,
`tokenDetails/TokenData`, consent `userRecoveryIntent`, and token invalidation.
It finds its own account by name, allowing Android's existing `com.google`
calendar records to keep their account identity. These are compatibility checks,
not proof of successful server authentication on a real phone.

Update MicroG-RE if necessary, confirm the matching account is present, patch a
clean Calendar APK with both patches, and install over the previous patched app
using the same Morphe signing key. Grant Calendar permission and accept the
MicroG calendar-access consent when offered by the native sign-in recovery flow.
Check that existing events load and that a disposable test event syncs in both
directions. Do not uninstall Calendar or clear Calendar Storage to test this.
Runtime OAuth and bidirectional synchronization require device verification;
if they still fail, capture the actual auth exception before changing another path.

Primary sources checked:
- https://github.com/MorpheApp/MicroG-RE/blob/7.1.1/play-services-core/src/main/java/org/microg/gms/auth/AuthManagerServiceImpl.java
- https://github.com/MorpheApp/MicroG-RE/blob/7.1.1/play-services-core/src/main/java/org/microg/gms/auth/AuthManager.java
- https://github.com/MorpheApp/MicroG-RE/blob/7.1.1/play-services-base/core/src/main/kotlin/org/microg/gms/common/PackageSpoofUtils.kt

## MicroG consent and native sign-in correction (2026-10-04)

Device feedback after 1.33.6 confirmed that seeing an Android account does not
prove successful authentication. The native OneGoogle sign-in/add-account
listener `cal.agpm.onClick` still invoked Android `addAccount("com.google", ...)`
in one branch and `AddAccountActivity` in the other. The optional MicroG patch
now replaces that listener with the explicit MicroG consent Activity. The same
Activity runs after the launcher grants Google account visibility, only when
MicroG metadata is present. Widget-only installations retain native routing.

The helper selects an `app.revanced` account that matches a visible Android
`com.google` account and requests a real OAuth Calendar token using
`AccountManager.getAuthToken(..., Activity, callback, ...)`. Android launches the
MicroG authenticator's consent/recovery UI. Empty tokens and exceptions never
count as success. After a nonempty token, request manual sync for the original
Google account on both native authorities, preserving sync settings and local
data. A diagnostic toast confirms only token acquisition, not completed sync.
Only exception categories are shown; no tokens, account names or provider error
messages are logged or persisted. Failures leave native/offline use available.

The pending authenticator future is retained across Activity rotation. Framework
picker results are rechecked for visibility and an actual matching Android
account; a success-looking result alone is insufficient. Consent refusal, empty
tokens, missing MicroG, deferred success/failure, rotation, original Intent payload
and actual sync requests are covered with production-source lifecycle tests.
These tests use Android fakes and do not prove real Google authorization.

Device follow-up: confirm that launch or the sign-in button opens MicroG consent,
report the diagnostic category if token acquisition fails, then check existing
calendar retrieval and a disposable event syncing in both directions. If token
acquisition succeeds but synchronization fails, diagnose the actual native sync
exception before changing any more account/provider code.


## OAuth signing-key rotation correction (2026-10-04)

Device logs from 1.33.7 show `UNREGISTERED_ON_API_CONSOLE` in both
`GmsAuthenticator` and `GmsAuthManagerSvc`. `SpoofUtils` confirms the old patch
metadata was read correctly and sent `bd324...`. This is an OAuth client identity
failure, subsequently wrapped as `IOException` / `NetworkError`, not evidence of
a connectivity failure. No private account details or raw device logs are stored
in this repository.

The earlier check selected the APK's latest platform signer instead of its
pre-rotation signer. The same clean base APK (SHA-256
`d7f155c7ecad7ecc5c57f2c6af15edd6a0a6444ce93b9d08c69623c18e4b1cf3`)
contains `38918a...` in v2/v3 and `bd324...` in v3.1. The patch now declares
`38918a453d07199354f8b19af05ec6562ced5788` to MicroG for OAuth, retaining the
package, native scopes, both token acquisition paths, and all local calendar data.
The manifest test pins that identity; `VerifyCalendarOAuthIdentity.java` checks
the actual clean APK cryptographically at API 32 and API 36 so a latest-signer
check cannot silently select the rejected identity again.

After updating the patched Calendar with the same Morphe signing key, force-stop
MicroG-RE once to discard its in-memory package/signature cache, then reopen
Calendar and accept real Calendar access consent. Do not clear MicroG data,
remove either account, or clear Calendar Storage. The user subsequently confirmed that 1.33.8 works on the device; see below.


## Stable release after device confirmation (2026-10-04)

The user confirmed that the Calendar correction in 1.33.8 works and requested
official publication without the experimental label. Mark both Calendar targets
as stable and remove the experimental wording from their displayed descriptions.
The confirmation follows the realme RMX5061 / Android 16 authentication failure
and the pre-rotation OAuth signer correction described above.

This release changes classification and documentation only. Keep the verified
authentication implementation, OAuth identity, supported Calendar version and
patch selection defaults. The widget patch remains selected by default and the
MicroG patch remains optional, requiring the same Google account in Android and
MicroG-RE. The user's confirmation is not a seven-day widget stress test or a
claim that every launcher or device has been tested.
