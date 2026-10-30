# PairIP: Flitsmeister result and NPO Start TV research handover

> Historical handover: the NPO status below predates successful AppAuth discovery recovery. See [the current NPO handover](NPO_START_TV_PAIRIP_HANDOVER.md) and [runtime integration evidence](research/2026-10-29-atv.md). The user subsequently confirmed live TV playback.

## Scope and current status

This note covers two separate applications and two worktrees. It preserves the earlier research sequence. For the current NPO state and the successful AppAuth restoration, use `docs/NPO_START_TV_PAIRIP_HANDOVER.md`.

- **Flitsmeister 14.17 / 1287 (`nl.flitsmeister`)**: the user reports the complete patched app is working. The startup PairIP repair was independently observed on USB: login state survived installation, the main map rendered, and no new Play license activity or native crash occurred. The startup-only test artifact did **not** include Unlock Pro or Hide Pro notices because it was built with `--exclusive --enable 'Fix PairIP startup'`.
- **NPO Start Android TV 1.48.2-2405 / 245497937 (`nl.uitzendinggemist`)**: a patched diagnostic candidate now reaches onboarding after genuine AppAuth discovery restoration. It remains installed at the user's request and is not release-ready because the network/audio receiver is still temporarily disabled. The crash history below is retained as evidence, not as the current state.

Claims below are marked **seen** when directly observed in source, disassembly, APK output, or device logs, and **inferred** when they are interpretations. Unestablished facts remain **unknown**.

## Worktrees and important files

### Flitsmeister

Worktree: `/Users/jneerdaekl/Scripts/morphe/trouw-stable-release`

- `patches/src/main/kotlin/patches/flitsmeister/StartupCompatibility.kt`: startup restoration and PairIP/license changes.
- `patches/src/main/kotlin/patches/flitsmeister/StartupRestoreData.kt`: captured String and reflection Method restoration data.
- `patches/src/main/resources/libmaplibre-arm64-v8a.so`: stock MapLibre native replacement.
- `.superpowers/sdd/2026-10-28-flitsmeister-pairip/`: build scripts, artifacts, decoded APKs, captures, and research notes.
- `.superpowers/sdd/2026-10-28-flitsmeister-pairip/next-approach.md`: static recovery analysis and warnings against global callback deletion.

The worktree's `.tools` symlink was broken during testing. The working desktop JAR was:

`/Users/jneerdaekl/Scripts/morphe/buienalarm-patches/.tools/morphe-desktop-1.19.1-all.jar`

### NPO Start Android TV

Worktree: `/Volumes/MorpheResearch/worktrees/dutch-applications-atv`

- `patches/src/main/kotlin/patches/npostarttv/StartupCompatibility.kt`: experimental captured-startup restoration; retains functional VM callbacks.
- `patches/src/main/kotlin/patches/npostarttv/StartupRestoreData.kt`: 32 String holders / 1,437 values and nine reflection Method registrations.
- `patches/src/main/kotlin/patches/npostarttv/FridaDiagnostic.kt`: diagnostic-only VM logging and receiver-suppression experiments. Despite the filename, the latest successful asset capture uses logcat, not a Frida Java hook.
- `/Volumes/MorpheResearch/tmp/atv-validation-20261029/npo/input.apks`: original TV split bundle.
- `/Volumes/MorpheResearch/tmp/atv-validation-20261029/npo/frida/`: diagnostic patches, decoded APKs, native disassembly, traces, and device logs.
- `/Volumes/MorpheResearch/tmp/atv-validation-20261029/npo/frida/scanner-analysis.md`: analysis of the ARM `+0x3cb28` runaway read.
- `/Volumes/MorpheResearch/tmp/atv-validation-20261029/npo/frida/rhlj-program-analysis.json`: exact `RhLj4nQzA8FodOQ7` asset record analysis.

The TV is `192.168.50.12:46833`, Android 14, 32-bit ARM. Shizuku is installed, but `/data/local/tmp/rish` was not present in the latest check. Do not assume a rish command works without re-establishing it.

## What solved Flitsmeister startup

UniPatches and the other referenced PairIP patches supplied useful fingerprints and controlled-experiment ideas. They did not provide a complete Flitsmeister solution.

### Controlled failure sequence

**Seen:**

1. Bypassing only `SignatureCheck.verifyIntegrity` still produced a native `libpairipcore.so` crash, initially at `+0x398a8`.
2. Bypassing only `StartupLauncher.launch` exposed `SignatureTamperedException`.
3. Skipping startup without restoring its effects left required fields null; Firebase was the first observed consumer to fail.
4. Capturing initialization from the correctly signed original recovered **1,442 String values in 32 holders** and **17 reflection Method registrations in four holders**.
5. The startup asset `assets/bsnPCDnBLcHWJvVO` contains an ordinary DEX at offset 253,917. That DEX supplies 17 original lifecycle helper implementations. It does not supply the 20 external VM callback bodies.

Pinned startup data:

- Asset SHA-256: `2a5f48741f795034142e3691996c62b2f1378f7d4812ee0359533168226ecf09`
- Embedded DEX SHA-256: `3a085520d50a954afefeb4db02ec02bcf8523d4babb6f8e4817398aced2ae7cc`
- Embedded DEX size: 41,244 bytes

### Runtime implementation

**Seen in `StartupCompatibility.kt`:**

- Adds captured String and Method initializers.
- Merges the pinned embedded lifecycle DEX.
- Replaces `verifyIntegrity` and `StartupLauncher.launch`.
- Replaces stock MapLibre 13.6.0 Vulkan native code; stock and shipped libraries shared BuildID `8c5d7d39949ff8e98ecf9dbb25fd85e17f377928`.
- The final startup-only experiment also disabled PairIP license initialization/paywall paths and suppressed `VMRunner` to avoid later native VM crashes.

The remaining Play redirect was traced to `LicenseActivity.onStart`: it reads a `PendingIntent` extra and sends it, opening `http://play.google.com/store/license/paywall?id=nl.flitsmeister`. Earlier no-op `LicenseClient` methods did not stop an already-built/stale test artifact. A fresh build removed `LicenseActivity` and `com.android.vending.CHECK_LICENSE` from the manifest and changed `LicenseActivity.onStart` to call `finish()` and return.

**Seen on USB:** the freshly decoded APK contained those transformations; installation with `adb install -r` preserved app data; `MainActivity` became top-resumed; the account menu and live map rendered; no new PairIP crash or Play redirect occurred. An older Play task remained in the activity history and must not be mistaken for a new redirect.

**Caution:** globally returning null from `VMRunner.invoke` is not a generally correct repair. Twenty external callbacks remained conceptually unresolved: 19 library receivers/workers and one app-specific receiver. The user's complete working build may include subsequent work not represented by the startup-only artifact described here.

## NPO experiments and exact evidence

### Existing restoration candidate

**Seen:** `StartupCompatibility.kt` restores 1,437 Strings in 32 holders and nine reflection Methods from the original app, merges a pinned startup DEX, bypasses the Java signature and startup dispatcher, and deliberately retains `VMRunner.<clinit>`, `VMRunner.invoke`, and all functional callers.

Startup asset data:

- Asset: `assets/jAAULfkL9PCc9aKk`
- Asset size: 383,850 bytes
- Asset SHA-256: `80155c3fa0db0bd08326d397961c725cf9c1145e87f4855c8450f2c6ca74ebc6`
- Embedded DEX offset: 356,690; size: 12,064 bytes
- DEX SHA-256: `bdd57282142aaba6972e50c36246e53a33b5656f532405b0ca36027e96260184`

### Signature-only / original-bootstrap control

**Seen in `signature-only-full.log`:**

- The re-signed build opens Play's license page and crashes at `libpairipcore.so +0x43378`.
- No `VMRunner` asset log exists because the original field is `loggingEnabled = "false"`.
- The faulting ARM instruction is `ldr r1, [r0]` at `+0x43378`; the tombstone has `r0 = 0x5bba835b`.
- The only Java caller of the startup asset is `StartupLauncher.launch`, which invokes `jAAULfkL9PCc9aKk`.

**Inferred:** this is the early startup VM failure, distinct from the later functional callback failures. It is not evidence that native library loading alone is the fault.

### First restored-startup callback failure

**Seen in `startup-vm-trace-full.log`:**

```text
I VMRunner: Executing RhLj4nQzA8FodOQ7
I VMRunner: Finished loading RhLj4nQzA8FodOQ7 (151 kB) after 2 ms.
F libc: Fatal signal 11 ...
F DEBUG: #00 pc 0003cb28 ... libpairipcore.so
```

The Java caller is:

`Lnl/npo/player/library/l6/v;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V`

This receiver dispatches network-type and audio-becoming-noisy events. It is functional behavior, not merely a license check.

At `+0x3cb28`, ARM executes `ldrsb r5, [r7]`. The loop sign-extends a raw 16-bit count of `0xbafb` to `-17669`, then scans until it reaches an unreadable guard page. Static asset analysis found that raw count at the exact handler operand offset in the unchanged asset. **Seen:** the value is not a runtime buffer-corruption artifact. **Unknown:** whether the path is deliberate tamper rejection, missing native/bootstrap state, or another interpreter state error.

### Receiver-only suppression experiment

Diagnostic patch: `Trace NPO without player receiver`

- Keeps captured startup restoration.
- Enables existing VM debug logging.
- Returns immediately only from `nl.npo.player.library.l6.v.onReceive`.
- Preserves `VMRunner` and every other callback.

**Seen in `startup-without-player-receiver-full.log`:** the `RhLj...` crash is avoided, but a background task immediately executes `YpiduvI2VbDrp1Gn` and crashes at `libpairipcore.so +0x5e28c`.

The second caller is:

`Lnl/npo/player/library/zt/j;->doInBackground([Ljava/lang/Object;)Ljava/lang/Object;`

Its visible bytecode is an `AsyncTask` wrapper with URL connection helpers and `onPostExecute` continuation logic. This is network/data behavior. Returning null or deleting it is not a valid functional fix.

**Conclusion:** NPO has multiple required VM-backed paths. The current restoration-only approach is insufficient, and repeatedly no-op'ing callers would conceal breakage rather than repair it.

## Instrumentation lessons

- Frida Gadget native exception capture worked and established the `executeVM` backtrace.
- Gadget did not expose a Java bridge by default. Bundling `frida-java-bridge` then failed during Gadget script connection setup, so this route did not produce Java events.
- NPO already contains conditional `VMRunner` asset logs. Enabling `isDebuggingEnabled` in a diagnostic bytecode patch was simpler and produced the decisive asset evidence through logcat.
- `original-bootstrap-base.apk` contains an early `System.loadLibrary("gadget")` but no Gadget native library. Running it without the Gadget-injected artifact causes `UnsatisfiedLinkError`; do not confuse that diagnostic packaging error with PairIP.
- Static analysis did not observe execution. Device logs and tombstones are the runtime evidence cited above.

## Reproduction commands

Copy bundles from exFAT to a local APFS temporary directory before invoking Morphe. Extracting directly beside the exFAT bundle created AppleDouble files that the merger incorrectly treated as APKs.

```sh
D="$TMPDIR/re/npo-14.48-build"
mkdir -p "$D"
cp /Volumes/MorpheResearch/tmp/atv-validation-20261029/npo/input.apks "$D/input.apks"
```

Build from the NPO worktree:

```sh
env JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home \
  JAVA_TOOL_OPTIONS=-Xmx1g \
  ANDROID_HOME=/Users/jneerdaekl/Library/Android/sdk \
  GITHUB_ACTOR=offline-cache GITHUB_TOKEN=offline-cache-only \
  ./gradlew buildAndroid --offline --no-daemon --max-workers=1 \
  -Dorg.gradle.jvmargs=-Xmx1g \
  -Pkotlin.compiler.execution.strategy=in-process
```

Build the current receiver diagnostic:

```sh
env JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home \
  JAVA_TOOL_OPTIONS=-Xmx1g \
  java -jar .tools/morphe-desktop-1.19.1-all.jar patch \
  --patches patches/build/libs/patches-1.11.0.mpp \
  --exclusive --enable 'Trace NPO without player receiver' \
  --validate --bytecode-mode FULL \
  --out /Volumes/MorpheResearch/tmp/atv-validation-20261029/npo/frida/startup-without-player-receiver.apk \
  --result-file /Volumes/MorpheResearch/tmp/atv-validation-20261029/npo/frida/startup-without-player-receiver.json \
  "$D/input.apks"
```

The original signed package was pulled before diagnostics and restored with `adb install-multiple` afterward. Do not leave a diagnostic or Gadget build installed by mistake. Do not read or use account credential files; no credentials are needed for the current native analysis.

## Next engineering steps

1. **Recover genuine callback behavior.** Prioritize `nl.npo.player.library.zt.j.doInBackground` and `nl.npo.player.library.l6.v.onReceive`. Use exact original implementations, a verified matching library artifact/source, or a behaviorally validated reconstruction. Do not ship null/no-op substitutions.
2. **Inventory every NPO VM caller.** Record asset, Java descriptor, return contract, and whether an original/upstream implementation is available. The current logs prove at least two independent failing programs after startup.
3. **Compare original signed execution.** Capture the same callback inputs/outputs on the unmodified signed app if a non-signature-changing observation route becomes available. This can distinguish expected behavior from missing initialization.
4. **Test one genuine replacement at a time.** Keep all unrelated VM callers intact, verify decoded bytecode, and capture the next launch on the TV.
5. **Only then consider disabling the VM.** A candidate is acceptable only after all required callbacks have real replacements and startup/license flows no longer invoke native PairIP code.
6. **Validate function, not just process survival.** NPO home content, playback, network changes, headphone/audio-route events, background continuation results, login state, and repeated cold starts remain untested because no candidate has reached a usable UI.

The immediate blocker is therefore **functional VM recovery**, not another generic signature fingerprint or another no-op bypass.
