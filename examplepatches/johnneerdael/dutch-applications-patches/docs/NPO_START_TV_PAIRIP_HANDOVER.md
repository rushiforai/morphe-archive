# NPO Start Android TV PairIP startup handover

## Current continuation status

The original handover below records the diagnostic stage. Production integration now restores both receiver variants and real AppAuth discovery. The user signed in with a **free account** and confirmed playback with the optional IMA ads-loader gate. The combined `privacy-v4/all.apk` later hit the protected token-request method. Frida confirmed that caller inside the app UID. `npo/token-restored/all.apk` now restores the genuine request and is installed on `.12`; three cold starts and advancing playback with both controls passed. Account data is preserved. See [the current research and audit](research/2026-10-29-atv.md#free-account-playback-and-privacy-audit) and the continuation notes at the end. **Never automatically restore the publisher original.**

## Original handover state

Target: **NPO Start Android TV 1.48.2-2405 / 245497937**, package `nl.uitzendinggemist`, Android 14, 32-bit ARM TV at `192.168.50.12:46833`.

**Startup is now working far enough to render NPO's real onboarding UI without a Java or native crash.** This was observed on the TV, with `MainActivity` top-resumed and the registration/login screen visible.

This is **not yet a complete functional fix**:

- `nl.npo.player.library.l6.v.onReceive` is still a temporary no-op. It handles network-type changes and `AUDIO_BECOMING_NOISY`; this behavior must be restored.
- Login and playback have not been validated by the agent. The user may be testing login interactively.
- **The patched diagnostic APK is currently installed. Do not reinstall the original automatically.** The user explicitly requested that original restoration stop.
- No release artifact should be produced from the current diagnostic patch chain.

## Worktree and source

Worktree:

`/Volumes/MorpheResearch/worktrees/dutch-applications-atv`

Relevant files:

- `patches/src/main/kotlin/patches/npostarttv/StartupCompatibility.kt`
- `patches/src/main/kotlin/patches/npostarttv/StartupRestoreData.kt`
- `patches/src/main/kotlin/patches/npostarttv/FridaDiagnostic.kt`
- `docs/PAIRIP_FLITSMEISTER_NPO_HANDOVER.md` for the earlier Flitsmeister sequence and initial NPO failures.

Research/artifacts:

`/Volumes/MorpheResearch/tmp/atv-validation-20261029/npo/frida/`

Most useful current artifact:

`startup-appauth-discovery.apk`

Most useful current runtime evidence:

- `startup-appauth-discovery-ui.png`: NPO onboarding rendered by the patched build.
- `startup-appauth-discovery-ui.log`: no PairIP, VM, native, or Java crash in the successful capture.
- `startup-appauth-discovery-ui-activities.txt`: NPO `MainActivity` top-resumed.
- `startup-appauth-discovery-ui.xml`: onboarding accessibility tree.

## What was already present before this continuation

`StartupCompatibility.kt` restores data captured from the correctly signed original:

- **1,437 String values in 32 holders**.
- **Nine reflection Method registrations**.
- One original embedded lifecycle DEX from `assets/jAAULfkL9PCc9aKk`.
- Java `SignatureCheck.verifyIntegrity` and `StartupLauncher.launch` bypasses.
- Original `VMRunner` and all functional VM callers initially remained enabled.

Pinned startup data:

- Asset size: 383,850 bytes.
- Asset SHA-256: `80155c3fa0db0bd08326d397961c725cf9c1145e87f4855c8450f2c6ca74ebc6`.
- Embedded DEX offset: 356,690; size: 12,064 bytes.
- Embedded DEX SHA-256: `bdd57282142aaba6972e50c36246e53a33b5656f532405b0ca36027e96260184`.

The original startup-only approach was insufficient because later functional VM programs crashed.

## Failure sequence and how it was isolated

### 1. Original bootstrap / signature-only control

`signature-only-full.log` shows a Play license redirect followed by `libpairipcore.so +0x43378`.

The faulting ARM instruction is `ldr r1, [r0]`; the tombstone has `r0 = 0x5bba835b`.

`StartupLauncher.launch` invokes startup asset `jAAULfkL9PCc9aKk`. No VM asset was logged because the original `VMRunner.loggingEnabled` is `"false"`.

### 2. First callback after captured startup restoration

A diagnostic patch changed `VMRunner.isDebuggingEnabled` to return true, enabling the app's existing logs. This avoided further Frida Java-bridge work.

`startup-vm-trace-full.log` then proved:

```text
I VMRunner: Executing RhLj4nQzA8FodOQ7
I VMRunner: Finished loading RhLj4nQzA8FodOQ7 (151 kB) after 2 ms.
F DEBUG: #00 pc 0003cb28 ... libpairipcore.so
```

Caller:

`Lnl/npo/player/library/l6/v;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V`

The `+0x3cb28` loop sign-extends raw count `0xbafb` to `-17669` and reads into a guard page. Static analysis found that count in the unchanged asset at the exact handler operand offset. Runtime buffer corruption is therefore unsupported. Whether this is deliberate tamper rejection or missing native state remains unknown.

### 3. Temporary receiver-only suppression

`Trace NPO without player receiver` made only `l6.v.onReceive` return immediately. This moved execution to another VM caller:

```text
I VMRunner: Executing YpiduvI2VbDrp1Gn
F DEBUG: #00 pc 0005e28c ... libpairipcore.so
```

Caller:

`Lnl/npo/player/library/zt/j;->doInBackground([Ljava/lang/Object;)Ljava/lang/Object;`

That proved there were multiple independent functional VM paths. Deleting each one would not be a valid fix.

## The actual startup fix added in this continuation

### Identify the second caller as AppAuth

The classes around `zt.j` match AppAuth Android:

- `zt.k` = `AuthorizationServiceConfiguration`.
- `zt.m` = `AuthorizationServiceDiscovery`.
- `zt.j` = `ConfigurationRetrievalAsyncTask`.
- `zt.e` = `AuthorizationException`.
- `bu.a` = default HTTPS connection builder.
- `x80.j` = stream read/close utilities.

Exact upstream reference:

[AppAuth Android 0.11.1 `AuthorizationServiceConfiguration.java`](https://raw.githubusercontent.com/openid/AppAuth-Android/0.11.1/library/java/net/openid/appauth/AuthorizationServiceConfiguration.java)

The required method is upstream `ConfigurationRetrievalAsyncTask.doInBackground`.

### Restore real behavior instead of returning null

`FridaDiagnostic.kt`, patch `Trace NPO AppAuth discovery`, restores the method's behavior using the app's existing obfuscated helpers:

1. Open the discovery URI through `nl.npo.player.library.bu.a.a(Uri)`.
2. Set request method `GET`.
3. Set `doInput(true)` and connect.
4. Read the response using `nl.npo.player.library.x80.j.e(InputStream)`.
5. Parse `JSONObject` -> `zt.m` discovery document -> `zt.k` service configuration.
6. Preserve upstream error mapping:
   - `IOException` -> `zt.c.d` network error.
   - `JSONException` -> `zt.c.f` JSON deserialization error.
   - `zt.l` missing discovery argument -> `zt.c.a` invalid discovery document.
   - Errors are wrapped with `zt.e.e(template, exception)` and stored in `zt.j.d`.
7. Always close the stream using `x80.j.b(InputStream)`, including exceptional exits.
8. Return the actual configuration or null after a mapped error, allowing existing `onPostExecute` continuation logic to run.

The diagnostic uses an instruction prefix with all original instructions unreachable after the new returns. The build succeeded in FULL bytecode mode. The original method contract measured by Morphe is **7 registers / 11 non-payload instructions**.

### Result

The candidate no longer executes `YpiduvI2VbDrp1Gn` and does not crash at `+0x5e28c`. NPO renders its onboarding screen. The first receiver remains the only intentional no-op in this candidate; no global `VMRunner.invoke` bypass was added.

## Build and install

Copy the exFAT input to local APFS first. Extracting beside the exFAT bundle produced AppleDouble files that Morphe misidentified as APKs.

```sh
D="$TMPDIR/re/npo-14.48-build"
mkdir -p "$D"
cp /Volumes/MorpheResearch/tmp/atv-validation-20261029/npo/input.apks "$D/input.apks"
```

Build patches:

```sh
env JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home \
  JAVA_TOOL_OPTIONS=-Xmx1g \
  ANDROID_HOME=/Users/jneerdaekl/Library/Android/sdk \
  GITHUB_ACTOR=offline-cache GITHUB_TOKEN=offline-cache-only \
  ./gradlew buildAndroid --offline --no-daemon --max-workers=1 \
  -Dorg.gradle.jvmargs=-Xmx1g \
  -Pkotlin.compiler.execution.strategy=in-process
```

Build the current candidate:

```sh
env JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home \
  JAVA_TOOL_OPTIONS=-Xmx1g \
  java -jar .tools/morphe-desktop-1.19.1-all.jar patch \
  --patches patches/build/libs/patches-1.11.0.mpp \
  --exclusive --enable 'Trace NPO AppAuth discovery' \
  --validate --bytecode-mode FULL \
  --out /Volumes/MorpheResearch/tmp/atv-validation-20261029/npo/frida/startup-appauth-discovery.apk \
  --result-file /Volumes/MorpheResearch/tmp/atv-validation-20261029/npo/frida/startup-appauth-discovery.json \
  "$D/input.apks"
```

The currently installed package is this patched candidate. Replacing it with another patched build signed by the same key should use `adb install -r` where possible. Do not add a cleanup trap that reinstalls the original.

## Remaining receiver work

`l6.v` has two variants selected by field `a`:

### Variant 0: network type

Owner in `b`: `nl.npo.player.library.l6.w`.

The original surrounding code already contains the required implementation:

- `io.sentry.i7`, discriminator **12**, accepts the receiver and `Context`.
- It reads `ConnectivityManager.getActiveNetworkInfo()`, handles missing permission/network state, maps network and cellular subtypes, and calls `l6.w.c(networkType)`.
- `l6.w.c` owns an executor in field `c`.

Likely restoration shape: schedule `new io.sentry.i7(12, this, context)` on that executor. This matches the existing helper `l6.v.execute$009`. Verify against the original callback before treating it as proven.

### Variant 1: audio becoming noisy

Owner in `b`: `nl.npo.player.library.su.b`.

Seen:

- Intent filter action is `android.media.AUDIO_BECOMING_NOISY`.
- `su.b.b` is a `CopyOnWriteArraySet` of registered event callbacks.
- Registration occurs in `gw.w` when `shouldPauseWhenBecomingNoisy` is enabled.
- The existing receiver helpers include `getAction`, `iterator`, `hasNext`, and `next`, consistent with checking the action and notifying each listener.

The exact event object and callback invocation still need to be established. Do not ship the current no-op.

## Acceptance checks for the next agent

1. Restore both receiver variants with real behavior; remove `Trace NPO without player receiver` from the dependency chain.
2. Move proven replacements out of diagnostic-only patches into a clean production patch, preserving exact register/instruction guards.
3. Confirm no `RhLj4nQzA8FodOQ7` or `YpiduvI2VbDrp1Gn` VM execution remains in the launch/login path.
4. Validate cold start, login, home content, playback, network changes, and audio-unplug pause behavior on the TV.
5. Exercise repeated background/foreground transitions and check for later VM callbacks; onboarding success alone does not prove complete PairIP removal.
6. Update `docs/PAIRIP_FLITSMEISTER_NPO_HANDOVER.md` and this document with the final behavior and test evidence.

The key progress is: **captured startup data + genuine AppAuth discovery restoration now starts NPO; only the receiver restoration and full functional validation remain.**

## Receiver integration after handover

The user subsequently confirmed live TV playback with `startup-appauth-discovery.apk`. Its installed APK SHA256 matched `285e76c142d3dc2caf806538b590627d3a9312fff63f24739c8c0f782fa136a2`; a private copy is preserved as `npo/accepted-startup-playback.apk`. Only the diagnostic startup chain was selected, without the ad/tracking controls.

`RuntimeCallbacks.kt` now owns the real AppAuth discovery implementation and both receiver variants. Network events execute the shipped discriminator-12 runnable through the owner's executor. Noisy events iterate the copy-on-write listener snapshot and publish `ov.i.a` through `gw.r.h -> gw.b0.a -> jt.v0.c`. The diagnostic source is archived privately as `frida/handover-FridaDiagnostic.kt`; its no-op dependency chain is no longer compiled.

A decoded-output check found that Morphe's `addInstructions` discards inline `.catch` metadata. The integration explicitly registers all five discovery exception entries, including cleanup around error-mapping failures. The initial emitted APK failed the ART network-error case; the corrected decoded methods pass all 12 behavior cases. These tests use synthetic dependencies on `.89`, install no APK, and include a guard against reaching retained VM tails. The 129 host tests also pass. All four FULL-mode selections preserve the checked 107,858 original method contracts, startup data and helper bodies; signers match the user-accepted build.

Artifacts: `npo/runtime-production-v2/{startup,ads,tracking,all}.apk`. The user authorized restarting `.12` after checks passed. `startup.apk` was installed with `adb install -r`, preserving the app UID and account/profile data. MainActivity cold-started and the home screen rendered. No publisher-original restoration was performed. This selection excludes ad/tracking controls while stability is being established.

Full device playback/lifecycle/audio/network acceptance remains in progress. Inventory also identified `zt.i.doInBackground` as the remaining protected AppAuth token-request path: fresh code exchange and refresh-token grants require attention before calling cached-session playback a complete authentication test. The user subsequently replaced the Plus session with a free account; the updates below preserve that session.

## Free-account and privacy continuation

The free account exposed a playback-entry native crash at `+0x687d4`, after startup-only acceptance. `Hide ads` now suppresses the optional IMA ads-loader factory in addition to five nullable preroll getters. This uses Media3's existing no-ads-loader content branch and avoids IMA measurement registration without replacing functional audio routing. The user confirmed playback from `free-adloader.apk`; installed SHA256 `72ad0dd4b8559fbe67fc9cd2d029801d9821d912ea12ee41e650b324129a5090` was verified. Do not confuse that ad-only acceptance with the subsequent tracking update.

The combined candidate is `npo/privacy-v4/all.apk`, SHA256 `86bc785cba95ac15e2af54f95cba84f8f26f1764bf3c194989e8e6961434a65e`. `TrackingEgress.kt` adds seven exact boundaries for STER configuration, Cast/TV-ad diagnostics, DataTransport ingress, queued CCT HTTP, the telemetry alarm and advertising-ID diagnostics. `TrackingResources.kt` removes only Sentry's performance provider in addition to the advertising permissions and metadata. The CCT response uses the real `(int, URL, long)` constructor; local 403 causes the existing uploader to delete the batch and complete normally. No global network or VM bypass is used.

Build, 134 host tests, 107,858 method contracts, startup/helpers, manifest contracts, 12 emitted-callback ART cases and six actual-APK privacy ART cases pass. Independent review has no critical/important findings. The combined candidate was updated with the same signer and `install -r --no-incremental`; app UID 10251/account data were preserved, installed hash matched, and MainActivity cold-started. Playback recheck with both controls remains pending. `privacy-v4/install.json` records installation, including a corrected initial activity-name typo. Private evidence and APKs stay outside Git.

For a regression, use the accepted **patched** `free-adloader.apk` with the same-signer update, preserving data. Do not uninstall or restore stock. Continue acceptance for actual network/audio route events, lifecycle, fresh authentication/token refresh, free VOD/live transitions and bounded telemetry observation. No universal ad/tracking-removal claim is established by the static or synthetic tests.

Current build selection (run from the worktree with the previously documented JDK/SDK):

```sh
java -Xmx1g -jar .tools/morphe-desktop-1.19.1-all.jar patch \
  -p patches/build/libs/patches-1.11.0.mpp --exclusive --validate --bytecode-mode FULL \
  -e 'Hide ads' -e 'Disable tracking' \
  -o /Volumes/MorpheResearch/tmp/atv-validation-20261029/npo/privacy-v4/all.apk \
  -r /Volumes/MorpheResearch/tmp/atv-validation-20261029/npo/privacy-v4/all.json \
  /Volumes/MorpheResearch/tmp/atv-validation-20261029/npo/input.apks
```

## Confirmed token-request regression

The later failure is a separate native site: `libpairipcore.so +0x66924` on `AsyncTask #1`. Shizuku/rish launches through `com.hamondev.shevery`; the `moe.shizuku.privileged.api` package is a forwarding stub. Rish itself is shell UID 2000. Frida Gadget runs inside NPO UID 10251 and captured the native exception. A diagnostic-only VM entry log gives the exact caller `zt.i.doInBackground` and asset `UeibxlO3N5eP2BBY` (176,414 bytes). Logs contain method/asset names and registers, not token values or account payloads. The first startup checks missed this request path.

`TokenRequest.kt` restores AppAuth 0.11.1's genuine token POST. Reuse the shipped `zt/x.a()` parameters, `zt/i.a(HttpURLConnection)` Accept helper, `bm/f.z(HashMap)` encoder, HTTPS builder, typed errors and close helper. Preserve `zt/i.onPostExecute` verbatim for OAuth error handling, token parsing, ID-token validation and callback delivery. The patch adds 71 instructions with four explicit catch entries before the retained unreachable VM tail. The exception helper now accepts an expected catch count; discovery keeps its original five entries.

Source and emitted token methods pass 17 ART cases, including all grant parameters, client ID, Unicode encoding, status boundaries, typed I/O/JSON failures and exceptional cleanup. The old emitted method fails by reaching its VM tail. All 145 host tests and 107,858 original-method/startup/helper/manifest contracts pass, and independent review has no critical/important findings.

The current artifact is `npo/token-restored/all.apk`, SHA256 `197cf02c945f42f20b53d3f5cc7ecb3b043a8a8ddb95e0e5180dff24f20d25f4`. It has both ad/tracking controls and no Gadget or VM logging prefix. The same-signer update preserved UID 10251 and the free-account session. Three cold starts passed; Media3 playback progressed beyond 81 seconds with no error. Leave it playing. The old ad-only APK is useful for comparison but still has the protected token task and can fail once renewal is needed.

Reproduction adds `python3 tests/run_npo_token.py --serial 192.168.50.89:5555 --decoded PRIVATE_DECODED_APK`. Evidence lives in `regression-115533` and `token-restored` below the private NPO validation directory. Continue long-duration, actual route/network, fresh sign-in and traffic checks without automatically restoring stock.
