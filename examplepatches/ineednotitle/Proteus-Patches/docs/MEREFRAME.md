# Mereframe — patch status and crash triage

Mereframe (`app.unnamed.rawrecording`, pinned target **0.8.4 / vc 118**) contains a
self-defense layer that rejects re-signed builds, plus a native integrity check
inside the camera native pipeline (`libunnamed_raw.so`). This document is the
current status page and the triage runbook for field crashes.

## Patches in the bundle

| Patch | Default | Role |
|---|---|---|
| Allow re-signed/sideloaded installs | **on** | Neutralizes the startup install-legality verdict → app starts at all |
| Bypass native integrity checks | **on** | Patches all 5 ARM64 integrity gates in `lib/arm64-v8a/libunnamed_raw.so` with BTI/PAC-safe `bti jc; mov w0, #1; ret` stubs, routes `B1e6ad...->d(ZZZZFZ)[J` through `MereframeIntegrityHook` JVM try/catch, **and** plants the same real try/catch in every other public wrapper on that bridge class that calls the native engine (see [2026-11-12](#2026-11-12--issue-5-part-2-the-integrity-throw-is-not-limited-to-d)) |
| Diagnostic crash log | off | Writes the full stack to `Downloads/mereframe-crash-*.txt`, then chains to the normal crash path |
| Unlock Pro features | off | Unlocks `Qu.k/m` (full `Llr.p` set), neutralizes `Bf1c089` Paywall/session/receipt gates (`e`, `g`, `b`, `c`, `i`, `h`, `d`), and patches native `0x242048`/`0x244680` in `libunnamed_raw.so` so Pro capture & `PhotoEditActivity` run without paywall popups or `SecurityException` crashes |
| Fix Firebase after re-signing (universal) | off | Needed if Firebase services break after re-signing |

## 2026-11-14 — issue #34: no crash, but photos "didn't develop" and video is 0:00 (FIXED in the v2.3.1 re-cut)

The crash is gone after the v2.3.1 wrapper guards, but the reporter still sees
`6 didn't develop — The RAW is safe` and a zero-length video. That is the
signature of a **swallowed** integrity throw: the native encode call fails, the
handler returns a fabricated value, and the encode path silently produces no
output while the RAW on disk is untouched.

The wrapper guard had a real defect for array-returning natives. Every wrapper
validates the native result by length, and the lengths differ per method:

| Wrapper | Native contract |
|---|---|
| `p(JJJIIIIZZ)[J` | exactly **3** longs |
| `a()[J` | exactly **3** longs |
| `V(IJIIZ)[J` | exactly **3** longs |
| `m(IJIJJIIJD)[J` | exactly **3** longs |
| `T(...)[D` | exactly **12** doubles |

The old handler always returned a two-element array. It bypassed the wrapper's
own check but handed the caller a short array, so callers that read element 2
(`V`), or compare the length again, failed somewhere else — the develop worker
turned that into "didn't develop".

Fix: the sweep now reads the expected length out of each wrapper's own
`array-length` + `const` + `if-ne` sequence while patching and calls a
length-preserving `failOpen<Kind>ArrayN(Throwable, int)` that returns an array
of exactly that size with element 1 (the status slot every wrapper reads) set
to `1`. The fixed-size overloads remain as the fallback for wrappers without an
explicit length check.

Triage if a build still reports "didn't develop":

1. The patch log line `guarded in Lapp/unnamed/rawrecording/...` lists every
   wrapper that got a handler; if `p` or `i(Lvp;I)V` is in the "left on the
   native verdict" list, the sweep could not guard it and the crash-free
   guarantee is gone for that wrapper.
2. `[Proteus][Integrity] wrapper integrity throw contained: ...` in logcat
   means a guard fired. That is the wrapper whose native call is still
   rejecting the re-signed build; the next step is to stub that native entry
   point rather than guess at its return value.
3. If no guard line appears and the operation still produces nothing, the
   failure is not the integrity gate — collect a logcat of the develop run
   before re-pinning fingerprints.

## Native integrity & Pro-unlock root causes (0.8.4 / vc 118 ELF + DEX analysis)

Two distinct layers caused failures even when `B1e6ad...d()` or `Qu.k()` were patched alone:

1. **Native integrity across `libunnamed_raw.so` (117 call sites across all `B*` bridge classes):**
   Every bridge (`B1e6ad`, `B0210f8cad`, `B116a57da`, `B15f35e58`, `B6f0920d4`, `Bd3aa6ded`,
   `Bf1c089`, `B33638d4c`, `JNI_OnLoad`) calls five C++ checkers (`0x23f3d8` package/signature,
   `0x2a5ecc` `assets/unnamed.protection`, `0x2bf304` `/proc/self/maps`, `0x2e5fb0` loaded `.so`
   maps, and `0x2e1b54` `dl_iterate_phdr`/`prctl`). Wrapping only `B1e6ad.d()` (or returning
   dummy arrays that violate `LC2.a()` length assertions) left the remaining native callers
   throwing `SecurityException("app integrity check failed")` once camera frames flowed.
   `BypassNativeIntegrityPatch` now replaces all five ARM64 gates directly using unique
   96-byte prologues and `bti jc; mov w0, #1; ret` stubs (respecting ELF `.note.gnu.property`
   `BTI | PAC = 0x3`), while retaining `MereframeIntegrityHook` on `B1e6ad.d()` as a JVM fallback.
2. **Pro paywall popup & capture/editor crash (`Bf1c089` + `0x242048`/`0x244680`):**
   Making `Qu.k` return `Llr.p` exposed callers (`PhotoEditActivity.k()`, `LIA.<init>()`,
   `LUD.j`, `LJm`, `LUl.X`, `LHb.h`, `Lkg.x`, `Ll6`) to `Bf1c089.g()` (`0x2766f0 -> 0x244680`),
   `Bf1c089.d()` (`0x25dae8` -> `Leq`), and `Bd3aa6ded.n5035ad` (`0x242048`), which still threw
   `SecurityException` without a cached Play receipt. `UnlockProPatch` now unlocks both the
   `Qu` / `Bf1c089` DEX surface and `0x242048`/`0x244680` in `libunnamed_raw.so`.

## 2026-11-12 — issue #5 (part 2): the integrity throw is not limited to `d()`

The 2026-11-07 fix contained the `SecurityException` at the session-opening
wrapper `B1e6ad…->d(ZZZZFZ)[J`. That is correct but not sufficient: the native
check in `libunnamed_raw.so` is a **per-call** verdict, so every other public
wrapper on the same bridge class can throw the identical exception the moment
real frames flow — which is exactly why the app still died "as soon as the
preview appears". Issue #5 counted **~20 of the 49 public wrappers** on
`B1e6ad8077f6880e309d8da4b` as validating native output and able to throw.

The patch now works in three layers.

**Stage 0 — native gates.** The five ARM64 integrity entry points in
`libunnamed_raw.so` are patched to `bti jc; mov w0, #1; ret` (BTI/PAC-safe), so
the native checkers return "OK" before any bridge call can throw. This is
skipped only when the shipped `.so` is not the pinned 0.8.4 / vc 118 build.

**Stage 1 — pinned session wrapper (unchanged).** `d(ZZZZFZ)[J` is still routed
through `MereframeIntegrityHook.openSessionWithFallback`, which calls the native
method reflectively, validates the verdict's domain (length 2, element 1 in
(0,4)) and degrades to `{0L, 1L}` on any throw or mismatch.

**Stage 2 — wrapper sweep (new).** Every other public wrapper that invokes one
of the bridge's native methods gets a **real try/catch in its own code item**:

```text
try { <original body, untouched> } catch (Throwable t) {
    return MereframeIntegrityHook.failOpen<Kind>(t);
}
```

The handler is appended as real instructions and registered with
`MutableMethodImplementation.addCatch(...)` — i.e. it lands in the code item's
exception table, which is precisely what the inline-smali `.catch` of the first
attempt could not do (`addInstructions` splices back only the instruction
list). The hooked handler then decides:

* integrity failure (`SecurityException`, or a message containing
  "integrity", anywhere in the first 5 cause links) → log once and return a
  well-formed fail-open value of the wrapper's own return type;
* anything else → **re-throw the original `Throwable` unchanged**, so an
  unrelated bug keeps its original stack and behaviour. The sweep must never
  turn a real failure into a silently wrong camera result.

**What is guarded**

| Condition | Result |
|---|---|
| Public, non-native, has a body, body invokes a native method declared by the same bridge class | **Guarded** |
| `d(ZZZZFZ)[J` on the pinned bridge class | **Already guarded** by stage 1 — skipped to avoid double-patching |
| Method already has its own try/catch | **Left alone** — an overlapping try range produces a VerifyError ("bad exception entry") |
| Body contains a switch/array payload pseudo-instruction | **Left alone** — a whole-body try range would cover payload data |
| Return type is an unknown reference/array-of-reference shape | **Guarded, returns null** (no way to invent a well-formed instance) |
| Return type is `J`/`D` and the method has fewer than 2 registers | **Left alone** — `move-result-wide` needs a register pair |
| Non-public, native, abstract or a constructor | **Left alone** (never a public wrapper entry point) |

Fail-open values: `V` → return; `Z`/`B`/`S`/`C`/`I`/`F`/`J`/`D` → `0`
(`Z` → `false`); `String` → `""`; arrays → a two-element array with
`element[1] == 1` (`long[]{0,1}` for `[J`), matching the shape the pinned
session path already uses; unknown reference types → `null`.

**Fail-closed on drift.** Stage 1 stays pinned to the 0.8.4 (vc 118) shape and
fails loudly if it moves. Stage 2 is drift-tolerant by design: every wrapper is
a separate best-effort injection, so a wrapper that cannot be guarded is logged
and left on the native verdict instead of half-patching or failing the build.

**The wrapper inventory is resolved at patch time and printed.** The wrapper
names and parameter descriptors are R8 output — build-shape specific, and not
something a Java helper can accept positionally without one overload per
signature. The patch therefore discovers them from the APK being patched and
logs the resolved inventory, one line per bridge class:

```text
Bypass native integrity: bridge Lapp/unnamed/rawrecording/b/B1e6ad8077f6880e309d8da4b;
  declares 49 native method(s) — 21 wrapper(s) guarded, 28 left on the native verdict.
Bypass native integrity: guarded in Lapp/unnamed/rawrecording/b/B1e6ad8077f6880e309d8da4b;:
  a(IZ)[J, b(F)V, …
Bypass native integrity: left in Lapp/unnamed/rawrecording/b/B1e6ad8077f6880e309d8da4b;:
  d(ZZZZFZ)[J (already guarded by stage 1), … (reason)
```

Paste those lines into this page to pin the inventory for a build (and to see
which wrappers still need a per-wrapper fallback value tuned).

**Fail-soft on drift.** Both stages abort the individual injection instead of
half-patching. Stage 1 additionally degrades instead of throwing: if
`d(ZZZZFZ)[J` is missing the patch logs `PINNED SESSION WRAPPER NOT FOUND` and
falls back to the generic sweep, which then guards whatever the session wrapper
is called in that build. That log line means the fingerprint needs re-pinning —
send `versionName`/`versionCode`.

**Known limits**

* Only `d()` gets shape-aware domain validation of the native verdict. The
  swept wrappers keep the app's own validation code and only get a generic
  fail-open value when the native call throws; a wrapper that *returns* a
  malformed value is not corrected yet.
* The generic fail-open values (two-element arrays, zero scalars, `null` for
  unknown reference shapes) are a best-effort guess derived from `d()`'s shape.
  A wrapper that validates a *different* length or range needs its own value —
  the sweep log tells you which wrappers exist, and the handler table in
  `BypassNativeIntegrityPatch.kt` is the one place to add them.
* **On-device behaviour is unverified.** Type-checking, the smali/Java
  cross-check and the JUnit tests for the hook's fail-open decisions are the
  only things checked so far; the preview/capture path still needs one run on a
  re-signed 0.8.4 (vc 118) install.

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

Field report: patch reports success but the
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

Since 2026-11-12 the same containment is planted in every other native-calling
public wrapper on that class, so a trace that names a *different* `B1e6ad…`
wrapper above `nd2ccc…(Native Method)` (instead of `…d(SourceFile:8)`) means the
sweep did not cover that wrapper — check the
`sweep complete — N wrapper(s) guarded` log line for that build and look for the
wrapper in the `left … on the native verdict` line.

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
4. Check the patching log contains `Bypass native integrity: session wrapper
   routed through MereframeIntegrityHook` **and** the new
   `Bypass native integrity: sweep complete — N wrapper(s) guarded across …`
   line. If the sweep line says `no native methods found under
   Lapp/unnamed/rawrecording/`, the sweep did not run — send the app version.
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
