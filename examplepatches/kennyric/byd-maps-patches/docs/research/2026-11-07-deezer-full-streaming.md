# Deezer 9.0.26.3: full streaming, ads and tracking

Investigation date: 2026-11-07. Input: `deezer.android.app_9.0.26.3-9002603_2arch_2dpi_16lang_e80e8e9a8a433602320ddee540c2d157_apkmirror.com.apkm`.
Package `deezer.android.app`, build `9002603`, signer
`51a891a6c5d17b4e36a6f46bab675c1cae786a5af06f51d0105dab7ec6a94516`.

## Streaming path

The native app and the Milkbeat Deezer plugin use the same account-backed media
round trip:

| Step | Native 9.0.26.3 | Milkbeat plugin |
| --- | --- | --- |
| Session | `com.deezer.core.auth` gateway session | `deezer.ping` with `arl` |
| Licence | gateway `LICENCE` / `deezer.getUserData` | `deezer.getUserData` |
| Track | gateway `song.getData` (`TRACK_TOKEN`, `FALLBACK`) | `song.getData` |
| Media | `https://media.deezer.com/v1/get_url`, `BF_CBC_STRIPE` | same |
| Key | native media decryptor | MD5(track id) XOR web-player secret |

The native media service is `defpackage.IIlllIlIIllIIIl`; it already builds the
`FULL` request and posts to `media.deezer.com/v1/get_url`. The blocking decisions
are client-side:

- `com.deezer.core.data.model.policy.lIllllIIIIII.IIIIlIIIIIIIIlll(IlIIIlIIlIlllIII)`
  turns a licence feature bit into a playback verdict. `PREVIEW` (0x20) and
  `DEVICE_LIMITATION` (0x40) are the two gates.
- `lIllllIIIIII.llIIIllIlIllIII(IIIIIIllIllIIIl)` reports audio/display ads.
- `lIllllIIIIII.IllIIIlIIII()` is the streaming time limit.
- `defpackage.IIIlllIIIllIIIl.IIIlIIlIIlllIl(Track, Licence, now)` checks the
  per-track rights dates for the old and new catalogue paths.

`Enable full streaming` keeps those structures and the transport, and removes only
the preview/device-limit/time-limit verdicts plus the per-track rights rejection.
The track token and licence token still come from Deezer, so the quality returned
by `get_url` remains whatever the account and licence allow.

## Advertising

Deezer decides placements from `AdsConfigDataModel`. The patch returns an empty
`config`/`sections` map, which makes the existing placement checks take their
no-ad paths:

- `lIIlIlllIllIlI.IllIIIlIIII()` — banner section eligibility.
- `lllIlllIllIIl.IllIIllIllIIII(Runnable, boolean, boolean)` — audio/preroll gate;
  the patch runs the continuation directly.
- `lllIIlllIIlIlIl.lIllllIIIIII(Intent)` — audio-ad deep link; the ad extra is no
  longer written.
- `IIIIlllIllllIlI.IllIIIlIIII()` — in-player audio ad controller; pending ad is
  cleared.
- `VideoAdsActivity` / `VastVideoAdsActivity` — finish after `super.onCreate`.

## Tracking

Removed advertising/attribution permissions: `AD_ID` (two entries),
`AD_SERVICES_CONFIG`, the four `ACCESS_ADSERVICES_*` permissions,
`BIND_GET_INSTALL_REFERRER_SERVICE` and `com.adjust.preinstall.READ_PERMISSION`.
The Facebook and Adjust manifest providers are disabled; Facebook auto-init and
advertising-ID collection are off; Firebase Analytics, Crashlytics, Performance
and Sessions collection defaults are off.

Bytecode entry points disabled:

- Adjust: `IIlIIIIIIIllIIII.lllIlllIlllIl(Context)` and
  `IlllIlIlIIIIIIlI.lIllllIIIIII(String, String, boolean, boolean, boolean)`.
- Segment: `lllIIIllIll.IIllIIIlIIIllII(...)` and
  `lllIIIllIll.lIllIIIlIlIlll(...)`; the Braze destination
  `IIlIlIlllIlllIl.lllIlIIIlllIIII(Settings, int)`.
- Facebook automatic events and advertising IDs are controlled by the manifest
  flags and the removed permissions.

## Subscription surfaces

`ArtistPaywallActivity`, `TrialStartActivity`, `NativePremiumActivity`,
`NativePremiumTabActivity`, `PremiumTabActivity` and `UserOffersDialogActivity`
call `finish()` immediately after their normal `super.onCreate`.

## Verification

- `./gradlew :patches:build` passed, including `:patches:test`.
- `./gradlew :patches:generatePatchesList` regenerated the catalogue.
- Morphe desktop 1.19.1 applied all five patches to the exact original APKM:
  `success: true`, no `failedPatches`.
- The patched manifest has no advertising/attribution permissions, the Facebook
  and Adjust providers are `enabled="false"`, and the Firebase/Facebook flags are
  false.
- The rebuilt DEX contains the injected `const/4 v0, 0x1`/`return` bodies at the
  licence, rights, AdsConfig, audio/preroll and paywall hooks.

Not verified: signed-in playback, actual ad delivery and login from a country
blocked by Deezer's server. The input has no account and no runtime device was
used. A country refusal returned by Deezer's auth service cannot be repaired by a
client-side hook; the patches preserve the account and sign-in flow and only
remove the client-side playback, advertising, tracking and subscription surfaces.

## Runtime launch check (2026-11-07)

Owned AVD `drivedeck_parked_apps_api36` (Android 16, `sdk_gphone64_arm64`) was
started with `-no-window -no-audio -no-snapshot-save`. The patched APK
`deezer-9.0.26.3-patched.apk` (SHA-256
`410932693ac6dd1f37f4f463032d91d3b0399361bdb7a15ed1f49009ebd8f39b`) installed
with `Success` and launched through `LauncherActivity`.

Observed result:

- `AuthUIInitActivity` then `com.deezer.featureskit.authui.ui.AuthUIActivity`
  became the resumed activity; the app rendered the normal “WELCOME TO DEEZER”
  / “Continue with email or phone” screen.
- No fata exception or crash appeared in logcat.
- `Adjust not initialized, can't perform onPause/onResume` confirms the tracking
  initializer is disabled.
- A `deezer://www.deezer.com/home?arl=<fake-192-hex-ARL>` deep link was accepted
  and opened `AuthUIInitActivity`, which displayed `Login unsuccessful.` with a
  `Retry` button. This confirms the app's existing ARL deep-link route; the fake
  ARL was rejected by the server.

Evidence: `.tools/artifacts/deezer-runtime-20261107/` contains `startup.log`,
`login.png`, `email-form.png`, `arl-deep-link-fake.png`, `arl-deep-link-ui.xml`
and `arl-deep-link.log`.

A supplied account was then signed in through the app's existing
`deezer://...?arl=` deep link. The same account also exercised the plugin's
gateway/media path directly: `deezer.getUserData` returned a licence token while
reporting `streaming=false`, `song.getData` returned a track token, and
`get_url` returned a full MP3_128 `BF_CBC_STRIPE` stream (FLAC and MP3_320 were
403). The first decrypted block began `ff fb 90 00`, a valid MP3 frame sync.
The native app meanwhile played `D.A.N.C.E.` / Justice with the UI clock advancing
from 0:31 to 0:46, an `AudioTrack` running at 44.1 kHz, and TLS SNI for
`media.deezer.com` plus `cdnt-stream.dzcdn.net`.

## Paywall and tracker re-check

The first paywall patch finished `PremiumTabActivity`; because that activity is a
task root, finishing it dropped to the launcher. The final patch instead consumes
bottom-navigation menu id 5 before it builds the premium intent. A second paywall
opened `WebViewDialogActivity` for
`https://www.deezer.com/premiumtab?origin=paywall_pressure...`; the final patch
blocks that WebView payload as well. Re-check on the rebuilt APK:

- tapping Premium left `DynamicPageRootActivity` resumed after 1 s and 4 s;
- zero `PremiumTabActivity`, launcher, audio-ad, video-ad or `WebViewDialogActivity`
  starts appeared in the session log;
- zero `FirebaseSessions` log lines appeared after the session-collector hooks;
- playback remained `PLAYING` with the UI clock advancing.

Evidence: `.tools/artifacts/deezer-runtime-20261107/` now also contains
`media-and-cdn-fixed.pcap`, `native-playing-fixed.png`,
`native-playing-fixed-2.png`, `paywall-tracker-check.txt` and `playback-fixed.txt`.


## Six-track playback and tracker capture

The accepted build was started with packet capture active, then a track was opened
and advanced five times with media-next. Every step reported `state=PLAYING`,
with session active ids 1 through 5 after the first track. In the same window:

- no `AudioActivity`, `AudioAdsActivity`, `VideoAdsActivity`, `PremiumTabActivity`,
  `ArtistPaywallActivity`, `TrialStartActivity` or `WebViewDialogActivity` was
  started;
- the TLS SNI set was `media.deezer.com`, `cdnt-stream.dzcdn.net`,
  `f-cdnt-stream.dzcdn.net`, `cdn-images.dzcdn.net` plus Google Play services
  (`android.googleapis.com`, `geomobileservices-pa.googleapis.com`, `www.google.com`);
- no ad host (`doubleclick.net`, `googlesyndication.com`, `smartadserver.com`,
  Triton, Criteo, Amazon Ads, AppNexus, …) appeared in SNI or DNS;
- no `firebase`, `app-measurement` or `crashlytics` host appeared in SNI or DNS,
  and `FirebaseSessions` produced zero log lines.

The earlier acceptance run had already established that no ad pause appears between
tracks: the UI clock kept advancing while the media session stayed in `PLAYING`.
Six instead of two tracks were used here to cross Deezer's usual free-tier ad
interval.

## Native login in the blocked country

After `pm clear`, the in-app native form was used with the same free account:
`Continue with email or phone`, email, `Continue`, password, `Continue`. The app
reached `DynamicPageRootActivity` (Home) with the account's own mixes, stored
`arl`/`user_id` in its preferences, survived a cold restart as Home, and played a
track (`PLAYING`, UI `0:08 / 5:25`). On this clean run the login produced zero
`WebViewDialogActivity` starts. An earlier attempt on the same build produced one
transient `WebViewDialogActivity` start, which the premiumtab guard finished
immediately; Home stayed resumed and the launcher was never shown.

Native login rotates the account's ARL: an ARL captured before the password login
is rejected afterwards. The ARL deep link remains a working alternate route, but a
fresh ARL must come from a signed-in session.

Evidence added here: `media-tracks-adcheck-filtered.pcap`, `playback-track6.png`,
`ad-tracker-acceptance.txt`, `native-login-check.txt`,
`native-login-playing-final.png`, `native-email-login-home.png`.

## Why the plugin mechanism is native, not re-added

The request asked for the Milkbeat Deezer chain (gateway session, `song.getData`,
`media.deezer.com/v1/get_url`, `BF_CBC_STRIPE`). That chain is not missing from
Deezer 9.0.26.3; the official client already implements it, and the patch keeps it
intact:

| Plugin (`milkbeat-plugins/deezer/src`) | Deezer 9.0.26.3 (decompiled) |
| --- | --- |
| `audio.ts` request body `{license_token, media, track_tokens}` | `com.deezer.kmp.mediaprovider.mediaservice.serialization.RequestDto` with exactly `license_token`, `media`, `track_tokens` |
| `audio.ts` `https://media.deezer.com/v1/get_url` | `smali_classes3/IIlllIlIIllIIIl.smali`: `https://media.deezer.com` + `/v1/get_url` |
| `audio.ts` formats `FLAC`, `MP3_320`, `MP3_128` and cipher `BF_CBC_STRIPE` | quality enum with `MP3_128`, `MP3_320`, `FLAC`, `FLAC_24`, `BF_CBC_STRIPE`, `NONE` |
| `gateway.ts` `deezer.ping` / `deezer.getUserData` / `license_token` | the app's authenticated `GatewayLicense` / `GatewayLicense$Options` (the app keeps a native session instead of the web ping) |
| `audio.ts` `song.getData` / `TRACK_TOKEN` | the track model carries `SNG_ID` and `TRACK_TOKEN`; the media DTO sends them as `track_tokens` |
| `secret.ts` `md5(trackId)` split into halves | custom MD5 (`0x67452301`) and a 32-char hash split at 16/32 |
| `secret.ts` `trackKey` XOR of hash halves and master secret | `IIIlIIIlIlIIlIll.lllIlIIIlllIIII(String[])`: `key[i] = s0[i] ^ s1[i] ^ s2[i]` |
| `secret.ts` Blowfish BF_CBC_STRIPE decryption | `llIIIllIlIIIIlI`: Blowfish P-array `0x243f6a88`, 18-word P-array, four S-boxes, CBC block method; `IIIlllllIIIIIII` reads 0x1800-byte stripes |

Because this already exists, adding a second `get_url` client would not improve
playback: the app would still have to feed that stream through its own
MediaService/ExoPlayer, cache, media session and policy layer, or the UI would not
reflect playback. The patch therefore changes the policy answers that convert the
same full stream into a preview, a device-limit refusal or a subscription prompt:
licence feature bits, the audio/display ad flags and the paywall surfaces. The
native stream is the same one the plugin uses; nothing was reimplemented.

The full class-by-class evidence, including string inventories for both the
original and patched APKs, is in
`.tools/artifacts/deezer-runtime-20261107/native-media-pipeline-check.txt`.

## Tracker silence beyond logs

The patched APK itself was inspected, not just its runtime logs:

- manifest flags: Firebase Analytics/Sessions/Performance/Crashlytics disabled,
  all Google Analytics storage/ad flags false, Facebook automatic events and
  advertising-ID collection false;
- all nine advertising/attribution permissions removed;
- `FacebookInitProvider` and `SystemLifecycleContentProvider` disabled;
- bytecode stubs: Adjust initializer, Segment delivery, Braze destination and the
  Firebase Sessions foreground/background and begin/end methods begin with
  `return-void` / return false.

Combined with the six-track capture (zero `firebase`, `app-measurement`,
`crashlytics` or ad hosts in TLS SNI/DNS, and zero `FirebaseSessions` log lines),
this covers the tracker requirement at both the artifact and runtime level.
