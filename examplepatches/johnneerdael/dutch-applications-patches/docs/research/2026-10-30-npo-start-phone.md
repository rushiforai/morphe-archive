# NPO Start phone/tablet support

Target: `nl.uitzendinggemist` **1.48.2-2405 / 240497937**, minSdk **32**,
form factor **MOBILE**. The TV build remains **245497937**, with inspected
API 24 and API 32 manifests. Both share a package and version name; build-code
routing selects their separate exact bytecode and startup data.

## Original input and startup

The supplied APKMirror phone APKM contains 35 unchanged publisher APKs:
base, four ABIs, six densities and 24 languages. Publisher certificate SHA-256:
`7bfd84443c8e1fefc1b9cd8b5d0fcf18c922a2d4b778e2d109427d2cc418b1f2`.
Base APK SHA-256:
`f9ccd19a758c6ce20939b50f6d3f8cdef1d680cf1538a37e557eadef5740bcb7`.

The [public original split set](https://buzzheavier.com/ys1rjymo12zp),
`npo-start.apks`, has SHA-256
`6b234f913db2214e977e795ea42c742be6bbaf818cdb72195a90003f64fcc04a`.
Only the outer archive was assembled; APK bytes and publisher signatures remain
unchanged. No patched application, diagnostic binary, account storage or raw
capture is included in this download.

Unmodified phone startup on a clean API 34 ARM64 emulator initialized **1,494
strings in 32 holders** and **10 lifecycle Method registrations**. Late Frida
attachment captured those values. One unrelated normal static field,
`b5.g.a`, remained null and was excluded. Early spawn instrumentation crashed
inside PairIP; it was not used as a source of accepted startup values.

The startup asset `koMIKlhio0icA0mv` is 393,436 bytes, SHA-256
`8474b33b68a7c9493c0f9089dff7af382d013066e1a6d65ff892c2e28d9bc50c`.
Its original lifecycle DEX is at offset 244,836, size 17,472, SHA-256
`5a219dd911eb6bfc7123943b9f575d8f5a576f8a3e87243965c4f6ef82a5c44c`.
These hashes, field inventories and method shapes are checked before mutation.

## Controls and functional callbacks

The existing three public controls describe both compatibility entries. This
also avoids selecting duplicate same-name patches in Desktop, whose inspected
compatibility filter uses package/version names rather than build codes.
The read-only resource guard enforces the selected build, SDK and signer.
Other applications retain their existing default preflight behavior.

`PhoneControls.kt` implements 21 inspected ad/privacy boundaries: the optional
IMA loader and five preroll getters; Tag providers and ingress; Topspin, DAM,
session and STER inputs; Sentry and Bitmovin analytics; optional STER config;
Cast diagnostics; DataTransport ingress and queued CCT HTTP; its telemetry
alarm; and advertising-ID diagnostics. CCT receives the real phone response
type with local fatal HTTP 403, zero wait and no redirect. Manifest edits retain
functional components, remove four advertising permissions and the Sentry
performance provider, and disable the inspected automatic collection flags.

The phone's receiver `j9.e2` merges three real behaviors: Media3 media buttons
(0), becoming-noisy audio (1), and network updates (2). The restored network
branch queues the shipped `io.sentry.g7` runnable with discriminator 23, the
original receiver and context. Audio sends the shipped `fw.i` singleton to
the original flows. Media buttons reach the genuine Android MediaController.

AppAuth discovery (`ru.k`) uses the shipped HTTPS builder, parser, configuration,
typed errors and close helper. The phone's token request (`ru.i`) already has
its genuine Java implementation outside the VM and remains unchanged, including
token parsing, ID-token validation and continuation callbacks.

## PairIP regression and artwork restorations

The initial combined APK passed startup, original-method checks and 34 actual
APK cases. On the physical OnePlus CPH2747 with Android 16, the user then
reported a PairIP failure. The installed APK matched the candidate hash. Its
tombstone showed `AsyncTask #1`, UID 10789, and `libpairipcore.so +0x7b5c4`.
This demonstrated that startup and the initial probe did not cover every
protected background callback.

Shizuku/rish was verified as shell UID 2000. A matching Frida 17.24.3 server
could enumerate processes but direct attachment to NPO was denied. A temporary
same-signer Gadget diagnostic was installed without clearing data, but the
user requested continued debugging on the emulator before an in-app physical
capture completed. No physical in-UID Frida capture is claimed.

On the emulator, direct Frida attachment inside NPO UID 10193 identified two
additional failing paths through controlled requests:

| Callback | VM asset | Observed result before restoration |
| --- | --- | --- |
| `ll.c.doInBackground` — Cast FetchBitmapTask | `bjqAkM8rSnPv5MSZ` | Entered PairIP and faulted at `+0x8882c` before sending its bitmap Binder request. |
| `m9.a.doInBackground` — MediaRouteButton RemoteIndicatorLoader | `sKsDJq6f5gNFaMZ8` | Entered PairIP and faulted at `+0x37230`, with frames at `+0x7b014`. |

The physical tombstone alone does not distinguish these Java callers. The
emulator traces establish the two concrete failed paths and their assets.

`PhoneBitmapFetch.kt` restores the actual IFetchBitmapTask transaction through
the shipped Binder proxy and Parcelable helpers. It preserves the URI, real
bitmap, remote-failure fallback and original onPostExecute listener/cleanup.
The request Parcel transfers to the original proxy's ownership; reply and
untransferred request cleanup are explicit. No bitmap is synthesized by the
production patch.

`PhoneRouteIndicator.kt` follows the shipped **MediaRouter 1.8.1**
[source implementation](https://dl.google.com/dl/android/maven2/androidx/mediarouter/mediarouter/1.8.1/mediarouter-1.8.1-sources.jar).
It uses the app's AppCompat drawable loader only on a cache miss. A cache hit
returns null so the unchanged main-thread callback clones the cached
ConstantState. AppCompat is version 1.8.0 in the shipped module inventory.

After bitmap restoration, Frida in the NPO process observed the real Binder
request and a returned 2×2 fixture bitmap without entering the protected
bitmap asset. The final production APK includes both artwork restorations
and excludes Gadget, bootstrap and VM logging diagnostics.

## Acceptance

Final local installer SHA-256:
`795c8ddaeae2f25fa6ce516aae634d5534d90e9ab76341cef059a453fd8afadd`.

| Check | Evidence |
| --- | --- |
| Input preflight | Actual publisher phone fixture accepted; phone SDK 24/31/33 and missing signer rejected; TV API 24/32 regression retained. |
| Method and startup verification | All **110,188 original methods**, retained callback tails, captured constants/registrations, embedded helpers and manifest contracts pass. Unexpected added classes/methods are rejected. |
| Actual APK on Android 14/API 34 | **51 cases pass**. |
| Actual APK on Android 16/API 36 | The same **51 cases pass**. |
| Functional tests | Real MediaSession button delivery, original noisy-event flows, queued network work, genuine discovery/error cleanup, pixel-preserving bitmap Binder/AsyncTask delivery, original bitmap callbacks and Cast icon cache behavior. |
| Packaging | Four DEX 037 files; all 20 publisher native libraries retained across four ABIs; APK signing verifies. |
| Physical corrected build | Same-signer update preserved UID 10789/app data, MainActivity cold-started, and the user retried the previously failing action and confirmed **“Works now.”** |

The disposable probe installs only `nl.neerdael.tests.npophone` on local
emulators. It reads target APK code/resources, uses synthetic HTTPS responses
and its own media session/Binder fixtures, and never opens NPO account storage.
The baseline APK fails the added artwork regressions; the corrected APK passes.

Physical user acceptance is bounded to the action retried on the OnePlus.
Complete traffic silence, every physical network/audio route, long-duration
playback and execution on all four ABIs remain separate checks. Original
content, OAuth, DRM and account entitlement checks remain; no Plus rights,
token or licence is manufactured.

## Reproduction

```sh
python3 tests/run_npo_phone_probe.py --serial emulator-5586 --apk PATCHED_PHONE.apk
python3 tests/verify_npo_atv.py ORIGINAL_DECODED PATCHED_DECODED --phone --ads --tracking --startup-data PHONE_STARTUP.json --embedded-original PHONE_EMBEDDED_DECODED
```

Raw publisher trees, APKs, keys and diagnostic captures stay outside Git.
Private evidence is under `build/phone/`, including `emulator-debug/`, the
before/after native traces and the two complete API-level probe logs.
