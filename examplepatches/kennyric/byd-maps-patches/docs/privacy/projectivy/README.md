# Projectivy Launcher 4.73 (98)

Port of the GPL-3.0-only hxreborn Projectivy tracking patch from source checkout
`b2f5b285c6ebcfae0703ebcb217d6a9aa90f0744`. Original notices are preserved in the
ported files. The source supported 4.72; this bundle advertises only the inspected
4.73 build 98, minSdk 23, package `com.spocky.projengmenu`.

Original APK SHA-256: `74e33af1e5e13831a69a0669d2b68b02150bf9df1ae1df437dc67e3f8d52c790`.
Publisher certificate SHA-256: `f6697bf4082ee97511e4de07863193884a015b7ab5860430321bda1042b0aadd`.

All five original fingerprints still identify one intended method in this build.
The app analytics class constraint prevents matching a Firebase constants initializer.
Void return and parameter constraints additionally pin the three early-return targets.

| Seen target in 4.73 | Patch effect |
| --- | --- |
| `PTUtils.e(String,String,String)V`, `item_category` | Return before event construction and Firebase Analytics dispatch |
| `yg1.a(Z)V`, `Firebase Performance is Enabled` | Return before the supported performance configuration |
| `t7.c()V`, advertising-ID service START action | Return before connecting to the advertising-ID service |
| `ng1.a(String)URL`, `https://firebaseinstallations.googleapis.com/v1/` | Replace the endpoint literal with `localhost`, preserving the original patch behavior (URL creation fails through the existing error path) |
| `pt3.a()URL`, `firebase-settings.crashlytics.com` | Replace the settings URL authority with `localhost` |

The second Crashlytics literal in its registrar returns Object, so the URL-return
fingerprint correctly excludes it. This is an inferred suppression of these named
paths from static code, not evidence of complete network silence or launcher runtime
behavior. Other Firebase paths, functional network services and cached diagnostics
are outside the original patch scope. Emulator and device testing were explicitly
skipped. The tracking control does not change paid features or purchase state.

Reproduce: build `:patches:buildAndroid`, apply `Disable tracking` and `Unlock Premium` with Morphe
Desktop in FULL mode to the original APK, decode the output with apktool, then run
`python3 tests/verify_projectivy.py ORIGINAL_DECODED OUTPUT_DECODED`.


## Unlock Premium

Adapted from `saieshshirodkar/saiesh-morphe-patches` commit
`bc8d7d9fb066f6eb5e1095c148b44df9899d381d`, which targets 4.71 (95).
The patch is separate from Disable tracking; either can be selected alone.

Seen in 4.73: the old native-check wrapper is now `PTApplication.f()Z`, calling
`vs(Z)Z`. Returning true preserves the upstream bypass. This alone does not
cover 4.73's premium feature gates: these read the read-only StateFlow `y`,
backed by `x`, where true means locked. Theme import, backgrounds, parental
controls and display profiles read that flow. The constructor initializes it
true, and `d(Z)V` updates it from the billing paths (including the age check).

The port initializes the existing flow false and supplies false to its existing
setter, preserving the flow objects and downstream observers. Billing services,
license servers, receipts and persistent purchase records are not modified.
The native wrapper is also bypassed as in the upstream patch. Static/emitted-code
validation covers both individual controls and the combined selection, cold-start
state and repeated paid/unpaid/expired updates. No emulator or device execution
is claimed.
