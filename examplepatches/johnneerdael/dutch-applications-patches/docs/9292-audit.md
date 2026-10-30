# 9292 2.48.1 implementation audit

**Stable since [v1.17.0](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.17.0).** The user approved the corrected normal APK after USB testing.
[Domains, data and retained services](privacy/9292/README.md).

## USB startup and consent follow-up

**Resolved development failures:** an old popup flag survived earlier candidates.
Clearing it in the preference constructor was insufficient: native `uu2.g` could
recreate it after SDK reconciliation. Leanrea traced SDK consent timestamps
rounded to seconds and a merge that retains stored history when its timestamp is
equal or newer. Deny-all followed by functional enable could lose the second
write. Native execution reproduced that failure before the correction.

Same-UID Frida through Shizuku/rish observed a failed local installer check,
Play response 2 (`NOT_LICENSED`), LicenseActivity and scheduled shutdown.
Skipping only `LicenseClient.checkLicense(Context)` survived the shutdown window;
the public **Fix PairIP startup** applies that narrow early return. Application
initialization and all five native libraries remain. No blanket VM bypass or
fabricated licensed response is used.

**Skip consent screens** submits one complete `ydd.f` decision set from the
ready-success arm of `hb3.invoke`: functional service true, other optional
services false, essential handling retained. The functional ID comes from
`uu2.i`. Only `UPDATE_SERVICES + EXPLICIT` uses a cloned native merge that gives
the new local choice precedence; implicit decisions and imported history keep
the original merge. The actual returned list must contain allowed functional
consent, denied optional services and allowed essentials before native
reconciliation/completion runs. A mismatch uses the original `Result.Error` arm.
The constructor clears the old popup flag and enables local storage. The home
consumer retains priority for a pending, explicitly confirmed deletion retry.

All four controls default on. Ads includes startup compatibility; tracking
includes ads; consent includes tracking. Actual SDK input/selector guards pass
40 assertions. APK-bound checks pin 182 original method graphs, verify the cloned
merge against its original and execute native mapping, decision update,
reconciliation, preference construction and the home consumer. Coverage includes
equal/newer stored history, implicit routing, missing functional consent,
optional opt-in, storage no-ops/error causes and explicit deletion retries. FULL
rebuild/signature/decoded verification and Python regressions pass.

The user authorized reinstalling 9292 because the phone signing key was not
exported. Desktop-built normal and temporary diagnostic APKs had identical DEX
and native libraries. Same-UID Frida observed a seeded popup=true/functional=false
state become popup absent/functional=true, preserving the saved test marker and
the separate false deletion flag. Actual SDK results allowed functional and
essential services while both optional tracking services were denied. The final
normal APK is not debuggable; without Frida it kept the same process through a
45.9-second cold start. The user confirmed it works and approved stable release.
This does not establish live Maps, payment/rental acceptance or a decrypted
traffic audit. The published stable bundle matches the tested payloads; all 225
previous stable class payloads and all 86 prior control records remain unchanged.

## Earlier advertising/tracking implementation

## Original input

- Package `nl.negentwee`, version 2.48.1, code 32189, minimum API 32.
- Complete original Play APKS SHA-256: `8bbf5add535fe4519dd7580d429d57ec5105491205760ec083f923f38af10622`.
- Base APK SHA-256: `444d3c52123146492b55bd769e6352c09f44956b4afa02104dc4cf5ce964dc71`.
- Publisher certificate SHA-256: `7ad4a3503739803a8eec7f2f8d9a4e678d6f33f9b77d5be81e2c089371352af6`.
  The independent Google source stamp is not treated as the publisher certificate.

Every mutator directly depends on the original-input guard. Unique method
selection checks descriptors, access flags, register counts and ordinary
instruction counts before editing. All five original native libraries remain.

## Controls and boundaries

The original advertising/tracking pair defaults on; Disable tracking includes Hide ads.

**Hide ads** overrides only the native remote-config keys
`disable_ads_android=true`, `disable_station_ads=true`, `sovendus_android=false`.
It disables Google's ad initializer and removes only the OpenWrap location
publication call. Other keys retain native fetched/default behaviour, including
after cache refresh. Native ad init/render/station consumers and both voucher
state mappers retain their original paths. Precise location, permission errors,
coroutine completion, payment status and purchased-ticket details remain.

**Disable tracking** suppresses app event/property sinks and returns from the
identity constructor only after validation, Object construction, stored fields
and native functional UUID creation. Analytics is permanently deactivated using
the shipped product metadata. Diagnostic collection and its setter cannot be
re-enabled by restored preferences or a later consent grant. The independent
diagnostic settings HTTP path returns its existing unavailable/null result after
worker/token validation. The native Sessions subscriber gate prevents settings
refresh when collection is disabled. Shared Firebase initialization, Remote
Config, Installations and FCM remain.

The CCT uploader filters four exact transport names after optional metrics are
appended: `FIREBASE_CRASHLYTICS_REPORT`, `FIREBASE_APPQUALITY_SESSION`,
`FCM_CLIENT_EVENT_LOGGING`, `GDT_CLIENT_METRICS`. The common incoming branch anchor
is replaced so neither metrics path can bypass filtering. Retained objects and
order continue through original transport outcomes. Entirely filtered batches use
native FATAL_ERROR/-1 handling and delete the original persisted rows. This is a
privacy discard, not a fabricated send acknowledgement. Mixed batches still obey
native HTTP retry/deletion outcomes for their retained events.

The independent Usercentrics session pixel and its timestamp write stop. Consent
configuration, decisions, completion, reset/user-data deletion and widget refresh
retain their original graphs. Adyen's optional event flush returns native Unit
to its real consumer. Its setup telemetry and genuine `checkoutAttemptId`, all
payment/3DS APIs and operational Donkey/Linka rental/lock events remain. No payment,
ticket, purchase or setup outcome is fabricated. The follow-up above replaces
startup consent handling. Notification settings and first-party home banners
without a paid-ad discriminator remain.

## Verification

- Actual production SDK preflight: 31 assertions pass with real publisher
  certificates. Original accepted; wrong package/version/code/minSdk and
  missing/untrusted/mixed certificates rejected without manifest mutation.
  Missing/ambiguous methods and wrong flags/register/count are rejected.
- Native original baseline: 172 pinned method graphs, including unchanged API
  headers, consent/reset, startup/licensing, notifications and payment setup.
- Behaviour fixtures execute retained instructions with typed DEX/platform call
  checks and explicit SDK/storage boundaries. Coverage includes native config
  and refresh, precise current/last location and errors, voucher-state identity,
  app UUID reuse/creation, restored/manual diagnostic collection, the Sessions
  subscriber loop, diagnostic settings validation/null consumer, regional session
  pixels, Adyen's real Unit consumer, CCT metrics on/off and native SQL deletion
  and retry. CCT transport serialization/Android UI and real checkout are not
  simulated as full end-to-end application execution.
- FULL original, separate controls and combined selection pass patch reports,
  rebuild/signature checks and decoded native effects. Python129, Node6 and
  strict bilingual documentation/local-link checks pass. All77 prior catalogue
  entries/defaults and194 individual code payloads remain unchanged; only the
  aggregate DEX and six new app classes differ. All5 original native libraries
  are unchanged in the combined APK. Delivery verification is recorded separately.

The earlier static implementation did not include device installation. The USB
follow-up above adds bounded runtime evidence. No purchase, rental, account
change or user-data deletion was performed. Source checks and startup acceptance
do not establish Maps, API, payment or lock acceptance, or complete traffic blocking.

[Original static research](research/2026-10-28/9292.md).
