# Validation

## Version 0.3.1 — 2026-11-11

Corrected the Arabic legacy variant after the user's device screenshots showed
that v0.3.0 exposed a different layout with the same visible name. The intended
variant is `ARABIC_3_WESTERN`, not `ARABIC_WESTERN`.

- Layout-only and all-five-patch APKs rebuilt and signed with strict fingerprints.
- Each output passed 380 layout behavior assertions and 144 structural/resource
  checks. New checks decode the binary key maps and assert the letter arrangement
  in standard, compact and PC modes: middle row ends in ط, the third bottom-row
  letter is و, and there is no dedicated ؤ key. Long-press ؤ is preserved.
- A negative fixture confirms the modern variant has a dedicated ؤ key.
- The new verifier rejects the actual incorrect v0.3.0 APK output.
- The combined output also passed 394 clipboard behavior assertions and the
  upstream toolbar/telemetry verifier.
- Previous tests checked chooser behavior and unchanged resources but did not
  establish which of the two identically labeled layouts the user intended.
  The new key-level checks address that gap.

Physical-device confirmation of the corrected arrangement is still pending.
Users updating from v0.3.0 must reselect Arabic 123 - Legacy in Languages.

## Version 0.3.0 — 2026-11-11

Added **Restore Arabic 123 legacy layout** as a fifth selectable patch, using the
same original SwiftKey 9.13.19.3 ARM64 APK and pinned tools listed below.

- Arabic patch alone: strict fingerprint validation, APK rebuild and signing passed.
- All five patches together: strict validation, rebuild and signing passed.
- Actual emitted layout DEX: 295 behavior assertions and 111 structural/resource
  checks passed on each output. Covers all four Arabic model configurations,
  existing legacy entries, default selection, other languages, repeated reads,
  immutable results and unchanged stored pack data.
- Combined output: all 394 clipboard behavior assertions and the upstream
  toolbar/telemetry DEX verifier passed again.
- Repatching the restored-layout APK is rejected without producing an APK.
- Original Arabic legacy key-map resource files are unchanged; native layout enum,
  selection and persistence code are preserved.

See [Arabic layout evidence and reproduction](docs/ARABIC_LAYOUT.md). The tests
execute a limited model of the emitted DEX, not Android ART. No attached Android
device was available. Actual chooser/preview, typing, long-press characters,
symbols, compact/PC variants and selection after restart still need device tests.

## Version 0.2.0 — 2026-11-10

## Verified input and tools

- Upstream: murilosimao/swiftkey-patch v0.1.1,
  commit `2d6d054b387d5b39a8d35d35d335a478a542306b`.
- APK: Microsoft's public `SwiftKey-9.13.19.3.zip`, ARM64 member
  `SwiftKey-9.13.19.3-1236467760-market-release-arm64-v8a.apk`.
- Original APK SHA-256:
  `8963433d9a3a06b794c51e06fc26505ffd13f1e1b07dff210cbcb1821f96f542`.
- Official download: https://assets.swiftkey.com/files/SwiftKey-9.13.19.3.zip
- Version listing: https://support.microsoft.com/en-us/swiftkey-keyboard/for-microsoft-swiftkey-commercial-partners
- Morphe Desktop 2.1.1 / Patcher 2.3.0; R8 9.5.29; Gradle 9.7.1;
  Kotlin 2.4.21; JDK 21; Android SDK 36.
- Build/analysis host: Linux ARM64. No attached Android device.

## Implementation evidence

`Lu90/v;->b(J)Z` is the local clipboard age predicate. It converts one hour to
milliseconds and tests the entry's timestamp, pinned flag, and auto-added flag.
The patch prepends a false return. It does not change timestamps or set entries
to pinned.

The save-time predicate in `Lnh0/c;->invoke` combines explicit deletion with age
expiry. It and the surrounding `Lu90/l;->b` / `Lu90/o;->j` cleanup/save path are
unchanged, preserving deletion while removing the age condition's effect.
Local storage uses an ArrayList and `sk_clipboard.json`; the inspected add,
load, save, and clipboard adapter paths do not impose a fixed local count cap.

`Lu90/v;->compareTo(Object)I` originally narrowed the timestamp subtraction to
32 bits. This can reverse chronological order for entries about 25 days apart.
Two instructions are replaced by `cmp-long` and `nop`; pinned-first branches
stay intact.

## Completed checks

| Check | Result |
|---|---|
| Build Android MPP and generated catalog | Passed |
| Apply clipboard patch alone to original APK, strict fingerprint validation | Passed |
| Rebuild and sign clipboard-only APK | Passed |
| Apply all four selectable patches to original APK, strict validation | Passed |
| Rebuild and sign combined APK | Passed |
| Inspect/exercise emitted DEX using VerifyClipboardPatch.java | 394 behavior assertions passed on each output |
| Exact expiry and ordering edits | Passed |
| Deletion, pin/unpin, save and load methods unchanged | Passed |
| Original 30-day sorting overflow reproduced; patched result corrected | Passed |
| Upstream emitted-Dex toolbar/telemetry verifier on combined output | Passed |
| Reapplying clipboard patch to already modified APK | Correctly rejected; no output APK |
| Upstream ToolbarSelectionTest | 6 tests passed |
| Upstream ToolbarSettingsActivityTest | 8 tests could not run: Robolectric native runtime unsupported on Linux ARM64 |

The 394 behavior assertions execute the actual output instructions using a small
limited DEX interpreter. They cover pinned/unpinned entries, auto-added/manual
entries, one-hour/day/month/year timestamps, long integer extremes, ordering,
and reproduction of the stock comparator bug. This is an execution-model check,
**not execution on Android ART**. Unsupported instructions cause failure.

Full upstream test invocation attempted 14 tests: 6 passed and the other 8 failed
during test-environment setup with:
`The Robolectric native runtime is not supported on Linux (aarch64)`.
The six pure-JVM tests were also rerun successfully on their own.
The unrelated toolbar UI tests remain a validation limitation.

## Reproduce

After building and obtaining the same original APK:

```sh
./scripts/patch.sh /path/to/original.apk
```

For all four patches, omit `--exclusive --enable` when invoking Desktop manually,
then run both `scripts/VerifyClipboardPatch.java original.apk combined.apk`
and the upstream `scripts/VerifyPatchedApk.java combined.apk` with the Desktop JAR
on the Java classpath. Use `--validate --bytecode-mode FULL`.

## Device acceptance checks still required

1. Import the MPP in Morphe Manager on Android and apply only the clipboard patch
   to an original 9.13.19.3 APK.
2. Enable Remember copied items; copy several distinct text clips without pinning.
3. After more than 60 minutes, copy another clip, close/reopen the keyboard and
   app, then restart the phone. Confirm older clips remain and can be pasted.
4. Copy more than 100 distinct clips. Confirm old clips remain after restart.
5. Delete an old clip; reopen/restart and confirm it stays deleted.
6. Pin/unpin clips, verify pinned-first behavior, and exercise search/edit.
7. Test month-old entries and a realistically large history for latency.
8. If using cloud sync or images, test those separately; neither is an unlimited
   archive promised by this patch.

Real-device retention, Android Manager loading, performance at very large counts,
and other CPU APK variants have not been validated. Original APKs, decompiled
app code, test APKs, and signing keys are excluded from the source distribution.
