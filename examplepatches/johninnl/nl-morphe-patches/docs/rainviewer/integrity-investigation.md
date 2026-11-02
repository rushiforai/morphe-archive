# RainViewer integrity investigation

Target: original RainViewer 8.4.1/44084 APKM. Runtime target: emulator-5554, AVD rainviewer_privacy_validation, rooted through su. The compiled no-attestation fallback plus targeted anonymous-session renewal restored publisher data in this setup. This is bounded application compatibility evidence; no signed Google verdict is forged.

## Confirmed flows

- Original certificate SHA256: 1ee1224e4ec7aa2214ae60f92f7e53fa2de148b12f7e9fa3e9c97b87844f4bcc; original SHA1: 19b6f8aed1fc525366f2fd956276128d9a3942df.
- Existing re-signed emulator certificate SHA1: 4a026796d95c7ade60d3d8e368b6f035d39ea3fc. Firebase Installations returned HTTP403 / API_KEY_ANDROID_APP_BLOCKED with this digest in X-Android-Cert.
- The original-certificate metadata patch changes Lc63;->A(Context,String)[B only for RainViewer. Six Firebase/Google callers read this SHA1 helper. Runtime Remote Config returned HTTP200 with original certificate header after this patch. It does not rewrite the installed APK signer or genuine Play tokens.
- App-owned Ljz5; prepares StandardIntegrityManager (cloud project 1040504993056), requests an opaque token, and Ldi0;->r creates RaindropRequest(token). Llpb;->p posts it using signed JSON to /mobile/verify/android/raindrop/.
- Publisher responses with code81 cause Lsl;->e to throw ez5; o21 maps it to pq4.d; ml0.i renders App Blocked. Runtime confirms /mobile/maps, /mobile/batch, /mobile/places/synchronize/ and other functional requests return code81 with empty data. Merely hiding the screen cannot supply the missing data.
- The rooted AVD currently has com.android.vending from /product/app/LicenseChecker/LicenseChecker.apk, version1.8/code1801. A same-context genuine SDK probe fails with StandardIntegrityException -9 CANNOT_BIND_TO_SERVICE, before a token is produced.

## Reference technique comparison

| Technique | Original RainViewer match | Experiment/status |
| --- | --- | --- |
| Telegram certificate and Firebase compatibility | Six concrete SHA1 metadata consumers | Implemented and verified original self-digest, real fallback for other packages, and an HTTP200 Google response. |
| Telegram local SafetyNet booleans | No basicIntegrity/ctsProfileMatch app branch identified | Not replaced with unrelated booleans. |
| Hotstar self-reported security blob | Zero matching 34-String constructors or eight named security fields | RainViewer body identified as one opaque Google token instead. |
| sqzass client integrity-verdict getter rewrite | Zero exact getter definitions/invocations under its predicate | No matching local getter to patch. A synthetic-response script was prepared but was not used as acceptance evidence. |
| Universal unavailable Play Integrity | Concrete Standard SDK service/binder boundary | App-owned `jz5.b` is made to return null, reaching the shipped no-token path without changing the service implementation. Fresh-session and compiled-APK data responses verified. |
| Universal local RootOfTrust/Attestation getters | No exact target classes/calls or key-attestation parser found | Not applicable to the identified Raindrop path. |

## Fresh-session controls

The old credential is already blocked at the publisher. Targeted session-key resets therefore accompany the comparison experiments. Only key_key/sec_key are removed from two backed-up preferences; all other settings and app data are retained. The private preference backup remains local with mode0600 and is not included in public deliverables. Fresh unmodified-attestation control returned a new purchase response code0, followed by maps code210 Not allowed and settings/weather code81. The client actually invokes and retries the Standard Integrity path in this control.

The no-attestation variant returned maps code0 with actual radar/satellite/model collections, plus successful place synchronization and notification settings. The compiled patch also migrated restored old blocked credential fields once before DI startup. Its marker persisted; later updates retained the renewed credential. Tests execute the emitted migration for successful commits, failure of each of the three commits, and a second launch with persisted state.

An initial broad local Pro override subsequently produced weather errors/code81. That run also changed the map request from `nwp_interval=86400` to `259200` and added `radar_accumulation=1`. The experiment did not isolate those fields individually, so it does not prove which field or timing caused rejection. A fresh Free control restored data. The final local Pro patch constrains outgoing request models while preserving Pro capability computation. On the same working anonymous credential, it then received fresh code0 responses for maps, forecast batches, purchase state, places, notifications and radar metadata. See [local Pro research](local-pro-research.md) for the UI and product-data observations.

The patch does not modify `sl` status parsing, request signing, purchase acquisition, billing validation, Standard SDK provider/token methods, or Raindrop serialization. The no-token entry prevents that optional token request from being dispatched. Rejection is still visible if the publisher returns it.

## Exact original locations

- readable/defpackage/c63.java:51–71 and decoded/smali/c63.smali:130: certificate SHA1 helper.
- readable/defpackage/jz5.java:154–209: provider preparation and token request.
- readable/defpackage/di0.java:1273–1346: Raindrop orchestration.
- readable/defpackage/lpb.java:776–826: signed Raindrop upload.
- readable/defpackage/sl.java:65–122: code/statusCode error classification.
- readable/defpackage/o21.java:60–68 and readable/defpackage/ml0.java:602–638: blocked state and UI.

The paths above refer to the retained ignored primary-checkout analysis .analysis/rainviewer-8.4.1. Runtime events and variant scripts are under its integrity subdirectory; tokens and credentials are excluded from the event schema.

## Sources

- https://github.com/durgesh0505/chiggi_morphe_patches/tree/e023809226f71496afa883f69dc7b39caec9155e
- https://github.com/sqzass/patches/tree/5e2c0f3ec72d43aa3877e2a8fc30df0704d0d7fc
- https://github.com/rushiranpise/Ri-Vanced-Universal-Morphe-Patches/tree/b7c4702877edefdd7249414edbde1deffcaba95d
- [Google Standard Integrity flow](https://developer.android.com/google/play/integrity/standard)
- [Google integrity verdict fields](https://developer.android.com/google/play/integrity/verdicts)

REA static corroboration: ev_eaa865d525bc54dfc732a8780e8a6971942ad638bd609678e4538d8d1577b91f (package), ev_88a2f8d964f76bba383792bef7a0272a149414df08aec45b73fc0ba8c9fcfcd7 (provider preparation), ev_23cde6d7d3bc60112d88365ab8a7b0f62b329294d60dbbe18c74066f3e51207f (code81 parser).
