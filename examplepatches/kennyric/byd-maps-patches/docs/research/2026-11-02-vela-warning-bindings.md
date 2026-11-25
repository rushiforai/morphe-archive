# Vela 0.5.2621 native warning voice bindings

Date: 2026-11-02. Scope: work package 1 for sections 10.3, 13 and 14 of the [native warning design](../superpowers/specs/2026-11-02-flitsmeister-native-warnings-design.md). This is static binding discovery, not a playback implementation or runtime acceptance result.

## Result

The supplied original Vela APK has usable system-TTS listener and neural-worker/player insertion points. A per-attempt adapter can preserve Vela's selected engines and existing callbacks by adding guarded bytecode instrumentation and an extension-owned identity registry. The existing `j(text,false,false)` reflection call cannot provide the required contract by itself.

Three native behaviors require explicit handling before rollout:

1. Stop/mute does not remove the delayed 350 ms speech closures. A closure can submit new system or neural speech after native stop. Generation and eligibility must be checked when the closure executes, not only when `j()` is called.
2. Focus acquisition failure does not prevent playback. Native `b()` reports whether a request was needed, not whether focus was granted. An external warning must gate on the actual request result and revalidate immediately before playback.
3. Neural `onDone` is also called for missing model, cancellation and errors. The player ignores write results and the worker treats drain timeout as normal termination. A callback-only wrapper cannot distinguish STARTED, COMPLETED, CANCELLED and FAILED.

Static feasibility is therefore **conditional**. Exact pinned targets are available; source/off fencing, outcome discrimination, native-guidance preemption/resumption and phone/car audio still need an implemented spike and runtime proof. No APK was installed or launched, no device was mutated, and no product source was edited for this report.

## Artifact and source authority

| Item | Authority |
| --- | --- |
| Original | `~/Downloads/vela-maps-v0.5.2621.apk` |
| SHA-256 | `f168bc730568b98ee8132131658d9220ef5be3557af41fd373bdaf104c31b20f` |
| Manifest | `app.vela`, version `0.5.2621`, code `46210`, min SDK 26, target SDK 35 |
| REA package evidence | `ev_430a3b9a796de1d94b1dd66e311e00ab698a1fbc1ba7c20fd54152cbf58be3f4` |
| REA engine | `jadx-headless-mcp` 0.7.1, revision `5844800a486d2248fa949b74c9896285f5b54de2`; one worker |
| Source reference | `../Vela`, tag `v0.5.2621`, commit `94a83b86de37c9c8cd704167b927888da155b6d9` |
| Source paths read at tag | `core/src/main/java/app/vela/core/voice/VoiceGuide.kt`, `NeuralSynth.kt`, `app/src/main/java/app/vela/voice/PiperSynth.kt` |

The source checkout's HEAD is newer; only `git show v0.5.2621:<path>` was used to interpret original-artifact behavior. Source is explanatory evidence, not an assertion of exact source/build correspondence. For example, the tagged `VoiceGuide` writes a `working` status in error paths, but original `wy4`/`vy4` do not retain equivalent status updates. Implement against DEX, not the source text.

`/tmp/vela-review-wy4.java` and the prior `.analysis/vela-telemetry/jadx/sources` tree were discovery aids. All critical findings below were checked against the original with REA and independent dexlib2 decoding. REA displays default-package classes as `defpackage.wy4`; the exact DEX class is **`Lwy4;`**, not `Ldefpackage/wy4;`.

The [37-method contract](../../tests/fixtures/navigation-warnings/vela-contract.json) records descriptors, flags, registers, instruction counts, code units, normalized body hashes and semantic references. The [selection](../../tests/fixtures/navigation-warnings/vela-selection.json) reproduces the scope. Hashes use the research collector's normalized operands/catch representation; they are not interchangeable with the existing `VelaTelemetryPatch.kt` contract hash algorithm. [REA evidence metadata](../../tests/fixtures/navigation-warnings/vela-rea-evidence.json) retains full evidence IDs, original digest and limitations; local path prefixes are redacted. REA source signatures do not supply exact descriptors or instruction offsets; those are independently verified DEX facts here.

## Native state and queue semantics

| DEX field | Observed meaning |
| --- | --- |
| `Lwy4;->b:Landroid/speech/tts/TextToSpeech;` | Selected system engine, or lazy default-system fallback for neural language mismatch |
| `e:Z` | Dispatch initialized; set true immediately for a selected `vela.*` engine, before its model is necessarily ready |
| `g:Ljj;` | Pending deque of `Ly03;` pairs `(text, interrupt)`; no event identity/deadline |
| `h:Z`, `i:Z`, `j:Ljava/lang/String;` | System initialized, system init failed, last system language respectively |
| `l:Ly43;`, `m:Z`, `f:Ljava/lang/String;` | Neural backend, neural selection, selected engine identifier |
| `n:Z`, `o:Z` | Native muted and alerts-only mode; `o` is meaningful with `n=true` |
| `p`, `q`, `r`, `s:I`, `t:Z` | AudioManager, focus request, lock, active-acquisition count, native held flag |
| `u:Landroid/os/Handler;`, `v:La9;` | Main-thread scheduling and the delayed focus-release Runnable |
| `B:I` | Deferred navigation-opener token; not a general speech generation |
| `y:Loh0;`, `z:Lv4;` | Existing trip-recorder/prompt-alert callbacks; invoked before queue/engine playback |
| `Ly43;->g:I`, `l:I` | Neural playback cancellation generation and prepare invalidation counter; distinct fields |
| `Ly43;->d`, `e`, `f:Z` | Loaded neural model, current track, load-failed flag |

`Lwy4;->j(Ljava/lang/String;ZZ)V` takes **text, interrupt, ignoreMute**. It checks `!n || ignoreMute`, calls `y` and `z`, then either dispatches through `l(String,Z)` or appends a pair to `g`. These callbacks mean text was requested after the initial mute check; neither proves synthesis, focus or playback.

`d(String)` selects an engine. `vela.*` sets `m/e=true` and warms the neural backend. Other values construct the selected `TextToSpeech` and attach a fresh native `vy4` listener. Both this method and `onInit(I)` drain only the newest pending pair, clearing the rest. `onInit` success sets `h=true,i=false`, sets `e=true` for a system primary, and calls `l` directly for the retained pair. Init failure sets `h=false,i=true` and clears the deque. There is no per-discard callback. Direct `l` dispatch bypasses `j`'s mute gate.

`l` selects neural only if `m`, a non-null backend, and compatible/unknown backend language or a successful installed-language switch. Otherwise it lazily uses system TTS. The language comes from `Lwy4;->o()Ljava/lang/String;` / current navigation strings, not from the warning payload. A successful `setLanguage` is checked in the system path; an unavailable language calls existing `k` when present. Preserve this callback. If Flitsmeister text is Dutch while Vela generates another language, blindly submitting `j` uses Vela's language. Correct mapped text or a scoped, verified per-attempt language binding remains necessary; changing the app-wide language is not a safe substitute.

**Readiness recommendation:** keep warnings in the bounded external scheduler until the selected path is usable. Do not equate `e` with speaker readiness, start an unrelated default engine, or count pending insertion as ACCEPTED/STARTED. System readiness requires the actual instance/init state and language selection; neural readiness requires a loaded usable selected model (`Ly43.d != null` plus the applicable voice/language state), with runtime failure still possible. A readiness race must produce a tracked failure/retry rather than an untracked host pending pair. If external warnings are permitted in `g`, tag the actual pair object and propagate that tag through latest-only drains; terminalize discarded external pairs. Matching text or text hashes is insufficient.

## System TTS: exact targets and insertion points

Offsets below are hexadecimal **DEX code-unit offsets relative to method start**, not byte offsets or patcher instruction indices. All listed targets are in `classes.dex`. Validate the complete method contract before locating semantic references; inserting instructions invalidates original offsets.

| Target | Flags / registers / instructions | Verified boundary |
| --- | --- | --- |
| `Lwy4;->j(Ljava/lang/String;ZZ)V` | 17 / 6 / 28 | `0x001a` trip text callback; `0x0021` prompt callback; `0x0037` direct dispatch |
| `Lwy4;->l(Ljava/lang/String;Z)V` | 17 / 16 / 203 | Neural acquire `0x0022`; neural delayed post `0x004c`; system acquire `0x014e`; system delayed post `0x0164` |
| `Lpn1;->invoke()Ljava/lang/Object;` | 17 / 10 / 68 | Native TTS branch is selector 1/default, before `0x0062` unrelated selector-0 UI branch |
| `Lvy4;->onStart(Ljava/lang/String;)V` | 17 / 2 / 1 | Empty native method; add observer without replacing the listener |
| `Lvy4;->onDone(Ljava/lang/String;)V` | 17 / 4 / 11 | Non-lead path invokes native `wy4.f()` at `0x000f` |
| `Lvy4;->onError(Ljava/lang/String;)V` | 17 / 4 / 11 | Same native release behavior as done |
| `Lvy4;->onStop(Ljava/lang/String;Z)V` | 17 / 4 / 11 | Same release behavior, native interrupted flag available |

`pn1` captures guide in `h`, TTS instance in `i`, text in `j`, interrupt in `g`, language in `k`; these are original fields, not extension fields. At its native branch:

- `0x0038`: `TextToSpeech.playSilentUtterance(JILjava/lang/String;)I`, 300 ms lead, queue mode `interrupt ? 0 : 1`; its return is ignored.
- `0x0055`: `TextToSpeech.speak(Ljava/lang/CharSequence;ILandroid/os/Bundle;Ljava/lang/String;)I`, always queue-add mode 1; `0x0058` reads the result. On `-1`, `0x005c` calls native `wy4.f()`.
- Native IDs are `vela-lead-` and `vela-` plus the **original input String.hashCode**, before romanization/expansion. Equal strings and hash collisions reuse IDs.

Register an attempt on the specific closure at construction under a synchronous extension dispatch scope, then revalidate that closure's attempt immediately before lead/audio submission. Generate unique warning IDs scoped by process/voice-instance/attempt; retain the `vela-lead-` prefix for silent lead IDs so the native listener continues to skip their focus decrements. Modify only tagged warning IDs; retain native route IDs. Record submission failure at the actual speak-result branch; preserve its existing `f()` exactly once. Lead rejection also needs a recorded outcome/cleanup decision because native ignores that result.

Add extension observers inside the existing `vy4` methods. Do not call `setOnUtteranceProgressListener` from the extension or overwrite guide `y/z/k`. Use `(native guide/engine generation, unique utterance ID)` to resolve only tagged external attempts. Forward native behavior on every callback, including obsolete/unknown IDs; late callbacks must not complete the new attempt. Filter silent lead callbacks from semantic STARTED/COMPLETED. Native only overrides one-argument `onError`; verify real engines' error dispatch and add a guarded two-argument override if required, preserving native release behavior without double decrement.

## Neural path: queue, player, completion and errors

| Target | Flags / registers / instructions | Verified boundary |
| --- | --- | --- |
| `Ldn2;->invoke()Ljava/lang/Object;` | 17 / 11 / 114 | Neural selector 3/default: callback construction `0x001a`; generation capture `0x0035..0x003f`; worker construction `0x0048`; executor submission `0x004b` |
| `Lx43;->run()V` | 17 / 28 / 434 | Model load `0x000e`; model-null/generation rejection `0x0012..0x001a`; common normal callback `0x0239`; failure logging `0x034b..0x0362`; exceptional finally callback `0x0369`; early-abandon callback `0x036d` |
| `Ly43;->f(Lzy4;Lsh3;FLth3;Ljava/util/concurrent/LinkedBlockingQueue;Lvh3;Lth3;Luh3;JLy43;Lu43;[FI)V` | 25 / 30 / 238 | PCM feed, track construction, native player creation/submission; identity must cross this worker/player seam |
| `Lv43;->call()Ljava/lang/Object;` | 17 / 14 / 64 | `AudioTrack.play()` at `0x000d`; silent lead write `0x0021`; starvation-silence write `0x004d`; PCM chunk write `0x0074` |
| `Lu43;->invoke()Ljava/lang/Object;` | 17 / 4 / 22 | Selector 0 compares captured playback generation to `Ly43.g`; other selector checks prepare counter `l` |
| `Lv4;->invoke()Ljava/lang/Object;` | 17 / 35 / 953 | Selector 22 only: `0x002c` casts guide; `0x002e` calls `wy4.f()`; `0x0031` returns |
| `Ly43;->h()V` | 17 / 4 / 9 | Increments playback generation and queues a stop/flush worker |

R8 inlines the neural speak body into `dn2`; no callable `Ly43;->speak(...)` method exists. `dn2` creates `Lv4(guide,22)` as its sole terminal callback. Interrupt increments `Ly43.g` before capturing it. The worker checks generation after model loading, then synthesizes/feeds on `Ly43.c`; player work uses the separate `Ly43.m` executor. Stop increments generation, so queued work normally rejects and active playback checks abort between writes.

There is **no neural start callback or result enum**. The native callback runs after normal termination, absent model, generation rejection, thrown failure, and the `track==null` exit. Wrapping it can observe termination but cannot classify success. Preserve selector-22 native focus release; store the external result separately before native callback execution. Never change other cases in these merged lambda classes.

The native player starts with 300 ms of silence; `AudioTrack.play()` alone must not mark semantic speech STARTED. Its three `write([FIII)I` return values are ignored and its written-frame counters advance by requested counts. The worker's `Future.get` exception is converted to zero frames; playback-head exceptions substitute the expected target; the drain loop ends on either head advancement or a 2-second deadline and then pauses after a 350 ms gap. Native normal callback therefore does not prove all samples played.

For per-attempt evidence, register the specific `x43` worker and its `u43` abort object; propagate identity into `v43` during feed/player construction. Thread-local context alone cannot span the executors. Gate eligibility/generation before `AudioTrack.play`, after the silent lead and before each content write; combine extension cancellation with native abort only for tagged attempts. Track actual write results, model-null rejection, exceptions, generation cancellation, player future errors and drain timeout distinctly. STARTED needs first content submission plus appropriate playback-head/output evidence; COMPLETED needs verified drain, not the shared callback alone. An unmeasured drain is UNCERTAIN. Chunk writes can include generated silent gaps, so a first write does not by itself establish recognizable content.

REA limitation: `inspect_android_method` returned `body_status=not_available` for `x43.run` and `v43.call`, describing absent decompiled bodies. These methods are **not native or abstract**: original DEX contains the bodies/counts above. Their retained evidence IDs record the provider limitation; independent DEX decoding supplies the actual bindings. Do not repeat that provider placeholder as an APK fact.

## Focus, stop, tone and native navigation coordination

`Lwy4;->g()V` requests focus with gain 3, usage 12, speech content type 1, existing listener and main Handler. It sets `t = requestAudioFocus(q) != 0`. `b()` increments `s`, then returns true whenever it had to request focus, even on failure. `l()` interprets this return solely as “apply 350 ms lead” and schedules playback. Capture the raw result; require explicit grant for a warning, rather than interpreting every nonzero result as grant. A missing AudioManager is unavailable, not success. Preserve native request ownership, its lock and its release count; do not issue an independent competing focus request.

`Lwy4;->f()V` decrements its native count and schedules the focus-release Runnable after 1500 ms when zero. `a()` abandons the request and clears `t/q`. `Lty4;->onAudioFocusChange(I)V` handles -1/-2 by stopping both engines, removing only the release Runnable, zeroing `s` and abandoning focus. It does not invalidate delayed speech closures. Capture focus loss in the attempt state, then fence tagged closures and active player writes; keep the native listener.

`Lwy4;->i(Z)V` sets `n` and invokes `n()` when muting. `n()` increments only opener token `B`, stops TTS, calls neural stop, clears pending `g`, removes only `v`, and resets/releases focus. The 350 ms `o9(pn1/dn2)` callbacks are not removed and do not check `B` or mute. A previously delayed neural closure can even capture the **new** neural generation after stop and submit valid-looking work. Source/off/ownership generation must travel with the closure before the delay. Calling native stop once is insufficient evidence of fencing.

Native stop and `interrupt=true` affect **all** guidance: TTS FLUSH removes native route utterances, and neural generation increments invalidate route work. There is no discovered per-utterance native cancellation operation. For an external attempt still in the extension queue or a delayed closure, discard only that attempt. For an already queued/playing system warning, stopping the shared engine requires accounting for affected native route prompts and a verified regeneration path. Do not unconditionally call `n()` on every warning CLEAR/source change, because that also stops unrelated route guidance. A verified route-current resume/regeneration operation and a reliable imminent-guidance gap are still unresolved; native `s` alone is not enough because pending/deferred work can exist outside it.

Tone mode has an additional boundary: the current extension constructs `La9(voice,notes,26)` and starts an untracked thread. The native default/26 branch generates PCM, creates an AudioTrack, writes/plays it, sleeps 500 ms and releases it; it swallows errors. There is no focus acquisition, attempt callback, retained track handle or late mute check in that branch. The verified tone audio calls are `La9.run` at `0x010f` write, `0x0112` play, `0x011a` release. Preserve native note rendering/attributes but add scoped identity, focus, pre-play mode/epoch validation and track cancellation/outcome observation for tagged external tones. A successful `Thread.start()` cannot report STARTED/COMPLETED.

Apply the design's native mode cap before every asynchronous output boundary: voice-on can speak or tone; alerts-only (`n && o`) can tone; fully muted (`n && !o`) stays silent. Never pass speech `ignoreMute=true`. A user selecting external Voice does not grant permission to change native mode. Existing `TelemetryRuntime.voiceAvailable()` merely reads flags and current `speakWarning()` exposes no lifecycle; neither provides the new acceptance contract.

## Minimal integration shape and proof still required

Keep external events in the shared bounded scheduler. Bind the existing application-scoped `wy4` through its current constructor hook; maintain a weak/native-instance-aware registry of attempts, engine generation, delayed closures, worker/player objects, unique TTS IDs and track ownership. Use a short synchronous dispatch scope to associate native objects constructed by one `j` call, then explicit object mappings across delays/executors. Every hook is inert for untagged native guidance except passive busy-state observation.

At dispatch and again at the final output boundary, validate source/owner epoch, deadline, cancellation, native mute, selected engine/language and focus grant. Reject stale work before side effects; balance only the acquisition actually made for that attempt and preserve every native terminal callback. Serialize extension scheduling decisions on its chosen handler and account for TTS callbacks and neural callbacks arriving on other threads. Do not hold registry locks while invoking host callbacks or Binder outcomes. A token rejected by a late callback stays rejected; it cannot complete/retry a replacement attempt.

| Required proof | Current result |
| --- | --- |
| Exact original descriptors/flags/registers/bodies/references | Recorded for 37 methods; collector re-check available |
| System enqueue/start/done/stop/error observation | Concrete insertion points found; unique-ID and native listener-preservation spike pending |
| Neural start/error/stop/completion distinction | Concrete worker/player branches found; native callback alone insufficient; instrumentation pending |
| Delayed warning after mute/stop/source-off/owner change | Static stale-closure path established; fence/cancel race tests pending |
| Denied/delayed focus | Static missing gate established; explicit-grant/rollback tests pending |
| Tone mode cancellation/outcomes | Native tone branch identified; scoped tracked/focus-aware integration pending |
| Preserve simultaneous native route guidance | Shared engine confirmed; safe gap/preemption/current-route regeneration proof pending |
| Equal/hash-colliding text and obsolete attempt callbacks | Native ambiguous IDs established; per-attempt IDs and fencing tests pending |
| Init failure/latest-only queue drain/engine or language switch | Static paths established; per-attempt outcomes and readiness race tests pending |
| Phone Activity absent/car-only/background and real audio routing | Application-scoped bind exists; no device/audio/head-unit proof collected |

Run a private patched-artifact spike before broad feature work. Exercise real system and installed neural engines, denied focus, focus loss during the lead, source/off and owner change inside 350 ms, stop during model load and active PCM, TTS enqueue rejection, model failure, player failure and drain timeout, native turn interruption, identical text and late callbacks. Verify native callbacks/counts and output evidence together. A build, a `j` return, native log message or terminal callback alone does not satisfy section 13's playback acceptance gate.

Reproduce the static contract without running Vela:

```bash
python3 scripts/navigation-alerts/inspect_bindings.py --artifact ~/Downloads/vela-maps-v0.5.2621.apk --selection tests/fixtures/navigation-warnings/vela-selection.json --expect tests/fixtures/navigation-warnings/vela-contract.json
```

This checks pinned static identity/ABI/bodies. It deliberately reports `runtime_acceptance: not_tested`.

## Implementation follow-up

The [production adapter follow-up](2026-11-02-vela-warning-adapter.md) records the guarded system/neural/tone implementation, fresh native route regeneration mechanism and remaining patched-artifact acceptance gates. The static findings above describe the original artifact.
