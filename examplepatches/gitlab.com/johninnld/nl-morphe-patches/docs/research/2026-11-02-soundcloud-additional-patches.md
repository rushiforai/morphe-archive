# SoundCloud additional patch port

Target: publisher APKM `com.soundcloud.android` **2026.10.28-release / 379050**, minimum SDK 32.
The existing Home in Android Auto patch and original-input boundary are retained.

## Sources and artifact identity

The three requested controls come from the local `soundcloud` checkout of
`kondratjev/morphe-patches`, commit `f07ca75539b77d760b0507ee90abea44f6069348`:
`soundcloud/analytics`, `soundcloud/consent`, and `soundcloud/premium` under
`patches/src/main/kotlin/app/morphe/patches/`. Its target was 2026.09.09-release.
The upstream GPL notice and branding restriction are retained in `NOTICE`.

- APKM SHA-256: `5c53dd6d3489b4e00ef26091b74d763635c27235e6a79b331cc50f481114f258`.
- Embedded base APK SHA-256: `d93de52b6478805718a9d0f785a3c71eef6cce5bec867bfc872c57a3f2f55fb9`.
- The previously extracted base APK matches the member of the supplied APKM byte for byte.
- REA package inspection `ev_f998fd05ccb5b327d488e98818621eeba5533010a457094747e9b4a80b806320`
  observes the package/version/build and minimum SDK. This is static evidence; it
  does not verify signatures or runtime behavior. The existing original-input
  guard checks the publisher certificate, package, build, version and SDK before mutation.

## Port decisions

| Control | Hook and adaptation |
| --- | --- |
| Disable analytics | Filter `TrackingHandler.a(Message)`, reached from `handleMessage`, to return for analytics events but preserve shutdown message `-559038737` and the original worker cleanup. Unlike the upstream optional match, this required hook fails if absent. This stops the publisher handler, not every analytics SDK. |
| Disable consent popup | Return the app's `NoopPrivacyConsentController` from the Dagger module provider. Resolve its static singleton field by type instead of assuming its R8 name. This does not grant consent or disable tracking. |
| Enable SoundCloud Go | Preserve the upstream string-constructor overrides (`high_tier`, `go-plus`, `SoundCloud Go`), return `Tier.HIGH` and `ConsumerPlan.GO_PLUS` from local feature reads, override the pending downgrade tier, return `UpsellType.None`, and disable ad-request/monetizable-geo checks. |

The old lifecycle hook `b(RootActivity)` is gone. Its replacement `a()` also
registers events and schedules configuration refreshes. Returning from it would
remove that work. Instead, return from consumer transition navigation methods
`c(Fan, Offboarding, long, long, String)` and
`d(Fan, Onboarding, long, long, String)`. Keep observer startup, disposal and
creator-plan transitions intact.

`AdPlacementConfiguration(boolean, GamConfiguration, AditudeConfiguration)`
still exists, but Kotlin serialization also writes the enabled field directly
through `(int, boolean, GamConfiguration, AditudeConfiguration)`. Force the
enabled parameter false in both. Required hooks use complete signatures and
unique matches, so missing or ambiguous targets fail patching.

All three controls use the existing exact publisher APKM compatibility and
original-input dependency. Each is independently selectable and enabled by
default, matching the source controls.

## Verification

`scripts/validate_soundcloud.py INPUT_APKM BUNDLE_MPP DESKTOP_CLI_JAR --output OUTPUT_DIR`
rebuilds all four original native ABIs in five scenarios: each port separately,
the three ports together, and the three with Home in Android Auto. All passed
with fingerprint validation enabled. Reports check the actual applied patch
set; a baseline run failed because the old bundle applied zero requested patches
despite reporting a successful rebuild.

`tests/SoundcloudDexRegression.java` checks each emitted APK for the enabled
hooks and the absence of unrelated controls in the independent scenarios. It
checks parameter registers, constants, return paths, both display constructors,
and preservation of lifecycle startup/disposal. All five scenarios passed.

Runtime command, using the combined output and a disposable API 36 emulator:

```sh
ANDROID_HOME=ANDROID_SDK python3 scripts/soundcloud/validate_runtime.py OUTPUT_DIR/with-home.apk --serial emulator-SERIAL --output RUNTIME_DIR
```

The runner refuses to replace an existing SoundCloud installation, signs the
app and instrumentation with the Android debug key, and removes its installations
after the test. It retains the signed APKs, instrumentation result, launch result
and app log. Sixteen in-process checks passed:

- Local tier/plan/downgrade reads, and parsing a Free plan into the overridden local Go+ values.
- Both ad-request flags false; both direct and deserialized display placements disabled.
- A real no-op consent controller and no-upsell singleton returned without their normal dependencies.
- Analytics events and both consumer transition methods returned without dependencies.
- The analytics shutdown message terminated a real HandlerThread Looper. The same test failed before preserving this message, reproducing the upstream patch's retained worker thread.

The combined app launched successfully without fatal exceptions or verifier
errors in its process log. This exercises the actual patched methods on Android;
it does not replay account activity or capture server traffic.

The release workflow's Gradle build/unit-test checks, plus SoundCloud's Home
mapper tests, passed. Python regression checks passed: 424 tests, 45 skipped.

## Validation limits

No signed-in account was used. Paid streams, downloads, selected audio quality,
advertisement traffic during playback, and signed-in Home browsing/playback on
an Android Auto host are unverified. Local Go+ state does not establish a server
subscription or access to encrypted media. The original Home behavior and its
fallback are covered by existing mapper tests and the combined rebuild, not by
a new signed-in car session.
