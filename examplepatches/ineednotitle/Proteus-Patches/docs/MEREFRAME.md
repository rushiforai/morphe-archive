# Mereframe — patch status and crash triage

Mereframe (`app.unnamed.rawrecording`, pinned target **0.8.4 / vc 118**) contains a
self-defense layer that rejects re-signed builds, plus a native integrity check
inside the camera native pipeline (`libunnamed_raw.so`). This document is the
current status page and the triage runbook for field crashes.

## Patches in the bundle

| Patch | Default | Role |
|---|---|---|
| Allow re-signed/sideloaded installs | **on** | Neutralizes the startup install-legality verdict → app starts at all |
| Bypass native integrity checks | **on** | NEW (v2.2.9 re-cut): routes the camera session JNI call through a real JVM try/catch in the extension and substitutes {0L,1L} on failure |
| Diagnostic crash log | off | Writes the full stack to `Downloads/mereframe-crash-*.txt`, then chains to the normal crash path |
| Unlock Pro features | off | Makes the entitlement accessor (`Qu.k`) return the full registered feature set, so every Pro gate (`Qu.e/o/p`) resolves unlocked. **WARNING:** on realme/Android 16 enabling it crashed capture on the one device tested — keep off unless deliberately testing |
| Fix Firebase after re-signing (universal) | off | Needed if Firebase services break after re-signing |

## 2026-11-10 — issue #5: Pro paywall still appears (FIXED, patch-application verified)

The previous fix nop'ed the ownership `contains` guard inside `Lnv;->e(...)`.
That method only runs while processing a real Play purchase callback, so with
no purchase the entitlement map stays empty and `LQu;->k(...)` still returns
an empty set — every feature remains locked and the paywall opens.

Root cause verified against the official **0.8.4 (vc 118)** APK: `Qu.k` is the
single source of truth consumed by `Qu.e` (one feature), `Qu.o` (all Pro
features) and `Qu.p` (Pro product). The patch now replaces `Qu.k` with a direct
return of `Llr.p` (the vendor's own full registered-feature set, the same set
granted by its "installed before Pro arrived" path). No billing, account or
network path is involved.

Verification: the patch bundle was applied to the official 0.8.4 (vc 118)
XAPK with Morphe Desktop 2.1.1 (`--validate`), and the rebuilt DEX was checked
with `dexdump`. The patched `Qu.k` now contains exactly:

```
sget-object v0, Llr;->p:LAc;
invoke-static {v0}, LN7;->G1(Ljava/util/Collection;)Ljava/util/Set;
move-result-object v0
return-object v0
```

`Qu.o` also contains `Qu.c(...).containsAll(Llr.p)`, so the all-Pro gate sees
the full set. Runtime UI behaviour still needs an on-device check.

0.8.7 (vc 127) moved the same code to `Llx`/`Px`; it is not a supported target
yet, so the manager will not offer these patches for it. Do not report a
Mereframe patch failure without confirming the app is 0.8.4 / vc 118.

## 2026-11-07 (later same day) — issue: v2.2.9 re-cut #2 fails at PATCH time (FIXED in v2.2.9 re-cut #3)

On-device Manager 2.5.0 / Patcher 2.3.0 report:
`app.morphe.patcher.patch.PatchException: Collection is empty`, caused by
`NoSuchElementException` at `InlineSmaliCompiler.compile` via
`addInstructions` in `BypassNativeIntegrityPatch.kt`. Root cause: the injected
`invoke-static {p0, p1, p2, p3, p4, p5}` exceeds the five-register limit of
the regular invoke-static opcode form; the inline compiler's dummy method
failed to build, `methods` came back empty, `.first()` threw. Fix: the call
now uses `invoke-static/range {p0 .. p5}` (six consecutive registers), the
same escape hatch the original wrapper used. No other patch in the bundle
injects more than five source registers.

## 2026-11-07 — issue #5: the bypass never caught anything (FIXED in v2.2.9 re-cut #2)

Field report ("debug-cli"): patch reports success but the
`SecurityException("app integrity check failed")` still kills the app at
`B1e6ad8077f6880e309d8da4b.d(ZZZZFZ)[J`.

Root cause: the inline smali tried to express a try/catch across the JNI
invoke with `:try_start_0 / :try_end_0 / .catch Ljava/lang/SecurityException;`.
Morphe's inline-smali compiler compiles such snippets against a dummy method
and splices back only the instruction list — the `.catch` lives in the code
item's exception table, not in the instruction list, so it was silently
dropped. No handler → the native throw escaped → crash at `d(SourceFile:8)`.

Fix (this build): the whole call site now lives inside
`MereframeIntegrityHook.openSessionWithFallback(ZZZZFZ)[J` in the extension —
a real JVM try/catch. The injected smali is `invoke-static` →
`move-result-object` → `return-object` with no extra registers. The hook
resolves the bridge class/singleton/native method reflectively (one place to
change per build shape), validates the native verdict's domain `(0,4)` exactly
like the previous iot fallback, degrades to `long[]{0L,1L}` on ANY
mismatch/throw, and logs once per process.

Two related defects from the same report were fixed as well:

- **Spoof install source, Layer 2 never found the app.** The fingerprint
  required a DIRECT subclass of `android.app.Application`; modern apps extend
  an androidx parent (e.g. `androidx.lifecycle.LifecycleProcess`) → silent
  skip. The patch now walks each candidate class' superclass chain inside the
  merged DEX (bounded, null-safe). Loud log only when truly absent.
- **Spoof app signature reported success while hooking nothing.** The failure
  mode is now impossible to ship silently: the bundle verifier
  (`.github/scripts/verify_android_bundle.py`) asserts all 13 extension
  classes survive in every DEX payload of `patches-2.2.9.mpp` —
  `SignatureHookApp` included — and fails the build otherwise.

24-hour validity of the fix: compile-time only (no device log yet for the
new code path). If the crash reappears at this exact frame, check the patching
log for the new "session wrapper routed through MereframeIntegrityHook" line:
if missing, that build lacks this patch.

## Reading the 2026-11-07 crash report (realme RMX5110, Android 16)

```
java.lang.SecurityException: app integrity check failed
  at app.unnamed.rawrecording.b.B1e6ad8077f6880e309d8da4b.nd2cccb916f63efbcf8b5b19b(Native Method)
  at app.unnamed.rawrecording.b.B1e6ad8077f6880e309d8da4b.d(SourceFile:8)
  at Jm.m(SourceFile:27) …
```

This is **precisely the frame "Bypass native integrity checks" wraps**
(`Lapp/unnamed/rawrecording/b/B1e6ad8077f6880e309d8da4b;->d(ZZZZFZ)[J`). With the
bypass compiled in, the `SecurityException` is caught *inside* `d` and the
substitution result (`long[]{0L, 1L}`) is returned — the JVM never unwinds, the
log file never gets written. **The existence of any such log file therefore
proves the bypass was not effective in the crashing build.**

So the field outcome says one of these happened:

1. The installed Mereframe APK is **not 0.8.4 (vc 118)** → the manager treats
   all Mereframe patches as incompatible and excludes them (the app still
   starts because "Allow re-signed installs" would also be excluded → check
   whether the app even reached the camera, or crashed at first frame — if
   the refusal screen shows, the gate ran anyway).
   → Send the exact `versionName`/`versionCode` from Settings → Apps →
   Mereframe. The crash log now (after the 2026-11-07 re-cut) prints it as
   `app:` in the header line.
2. The bundle in the manager is **stale** (an older .mpp that predates the
   bypass). → Remove the bundle, re-add it, confirm it reports **v2.2.8**.
3. The bypass **silently did not apply** and the manager shows the failure.
   → The patching log now prints: `Bypass native integrity: session-wrapper
   catch planted…` when it applied. If that line is absent from the patching
   output, the fingerprint did not match the build — capture that output and
   the APK version we need (or the APK itself) to re-pin.
4. The user manually unchecked "Bypass native integrity checks".

## Required device checklist before reporting a crash again

1. Manager shows the bundle as **v2.2.8**.
2. Mereframe target shows **0.8.4 (vc 118)** as supported. If not, STOP —
   no Mereframe patch will apply; send the version.
3. Patches checked: **Allow re-signed/sideloaded installs** + **Bypass
   native integrity checks** + (only if this is a diagnostic run) **Diagnostic
   crash log**. **Unlock Pro features stays OFF.**
4. Check the patching log contains: `Bypass native integrity: session-wrapper
   catch planted…`.
5. If it still crashes: attach the newest `Downloads/mereframe-crash-*.txt`
   (it now contains `app: versionName=… versionCode=…`) — that header tells
   us which build actually ran and which patches were in it.

## AMOLED resource fix (Amazon — same session)

The Amazon report (`Unknown attribute name: <item name="colorSurface">#ff000000</item>`)
was the AMOLED theme pass writing **Material library attribute names** into
`<item>` elements — the reandroid resource encoder cannot re-resolve those and
aborts the whole build. Theme-item writes are now restricted to `android:`
framework attributes (a hard guard also drops any later non-framework additions);
the Material surfaces go black via the `<color>`-token pass and the WebView CSS
instead. Amazon builds after the 2026-11-07 re-cut should now produce a valid
package. AMOLED on Amazon remains unverified on device.
