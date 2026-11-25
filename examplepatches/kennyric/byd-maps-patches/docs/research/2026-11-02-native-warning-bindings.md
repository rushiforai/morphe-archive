# Native warning binding evidence

Binding discovery for the [reviewed design](../superpowers/specs/2026-11-02-flitsmeister-native-warnings-design.md), work package 1. Static contracts and discovery tooling are implemented for FM, Maps and Vela. Application hooks, runtime spikes, event delivery and device/car acceptance remain pending.

## Artifact identity

| Input | SHA-256 | Authority |
| --- | --- | --- |
| Supplied FM 14.17/1287 APKM | `9fe7805e69e89b809d182a511a7b344b9e9a2c260bec0a240a6a217d62064f71` | Original user input |
| Its `base.apk` | `17f622c8072c9fd8bd121b872a3733a9a22aaff041d57560f6f3dd59a33ce1b7` | Original bytecode, manifest and resources |
| Supplied Maps 26.43.05.1002020710/1068844719 APK | `81506a2c54fc9a8faca34c18af7619d9c9d26cbfbe799b66884a59ac17791004` | Original bytecode, manifest and resources |
| Supplied Vela 0.5.2621 APK | `f168bc730568b98ee8132131658d9220ef5be3557af41fd373bdaf104c31b20f` | Original bytecode, manifest and resources |

The previous cached FM base `c1f923ce12054b1dde88b7a0cec50e60075ce6a5e578c3bdba0dcdc8bac5a7ac` is a different package. All seven DEX entries are byte-identical to the supplied original; its manifest and `resources.arsc` differ. Reuse its existing JADX output for code discovery only. Pin new contracts and runtime patch inputs to the supplied original. Its original minSdk is 29; the cached manifest reports 32. This comparison does not assert equality of all remaining ZIP entries or signatures.

REA package evidence: original FM `ev_2fa3b6229e8d6b99810957610cc935f88251787d3e6845fd54b708afff0802f1`; Maps `ev_ecad4c1fb97c9fdab3eb2446ba180be6e92910a009032a93b9f4e6e5ec645e21`. REA package inspection does not verify signatures. Exact method contracts below come from dexlib2, independently of decompiler display names.

## Flitsmeister and Vela

See the focused [FM report](2026-11-02-fm-warning-bindings.md) and [Vela report](2026-11-02-vela-warning-bindings.md). They distinguish native feature eligibility from sound preferences and identify bypasses, delayed work and actual playback boundaries. None is a runtime acceptance claim.

## Google Maps native guidance

The following are observations from the pinned original DEX and matching JADX code. Raw method descriptors, flags, registers, instruction counts, normalized operand/catch hashes and semantic references are frozen in [the Maps contract](../../tests/fixtures/navigation-warnings/maps-contract.json).

| Boundary | Exact native target | Observed behavior |
| --- | --- | --- |
| Specific native cancellation | `Lbmrc;->l(Lbmud;)V` | Posts selector 9 of `blvj` to the manager executor; matches pending `q` or active `p` by object identity |
| Cancel current and pending | `Lbmrc;->m()V` | Posts selector 8 of `bmpq`; clears pending through `o()` and cancels active through `n()` |
| Active cancellation | `Lbmrc;->n()V` → `Lbmtl;->d()V` → `Lbmtd;->b(Ljava/lang/Object;)V` | Resolves the current native alert asynchronously; invokes `bmuc.l()`; then marks the job's `s` cancellation flag |
| Media cancellation | `Lbmsk;->l()V` → `g()` | Stops/releases its MediaPlayer, then posts the native terminal callback |
| Native start notification | `Lbmth;->b(Lbmuc;)V` | Forwards duration/type to `bmug.b`, updates focus manager; **occurs before** `MediaPlayer.start()` on the media path |
| Native terminal notification | `Lbmth;->a(Lbmuc;)V` | Advances the native queue, then distinguishes cancelled/audio/non-audio/never-played results |
| Effective mute | `Lbmsp;->c()Lbmun;` | Combines temporary mute, persisted mute, car/output-mode-dependent settings; `b()` reads a related configured state |
| Mute filter | `Lbmsp;->l(Lbmuk;)Z` | Compares a prompt category's required mode with the effective mode |
| Busy state | `Lbmrc;->B()Z` | True only when both `p` and `q` are null; pending async native callbacks still need fencing |

`bmun` has raw enum fields `a/b/c` whose initializer names are UNMUTED/MINIMAL/MUTED. Do not fingerprint JADX aliases as DEX fields. `bmuf` and `bmuk` are similarly obfuscated; their initializer bodies are included in the contract. The `GUIDANCE` category is `bmuk.a`; its initializer uses UNMUTED, while categories such as TRAFFIC_REPORT use MINIMAL. Full mute caps external output at silent; the precise external tone behavior under MINIMAL needs product/native-routing validation.

The generic `acjx` TTS wrapper is separate from this native alert lifecycle. Hooking it alone does not establish navigation coordination. The guidance pipeline also uses synthesized audio files and MediaPlayer, rather than only direct TTS `speak()` calls.

### Instruction and register safety

Offsets below are DEX code units relative to each method, read from the original. They are proposed insertion boundaries, not applied hooks.

- `bmrc.l`: 4 registers; native executor call at CU `0x0009`, instruction 4. Its receiver is `p0=v2`; `p1=v3` is the native job. An entry observer can use `invoke-static/range {p0 .. p1}` without scratch registers. An injected operation must preserve the original executor serialization.
- `bmrc.m`: 3 registers; executor call at CU `0x0009`, instruction 4. It returns before cancellation completes. A successful invocation cannot be treated as proof that guidance is quiescent.
- `bmtd.b`: 2 registers; `bmuc.l()` at CU `0x0004`, instruction 2; cancellation-flag write occurs later at CU `0x000c`. A late native play callback can race asynchronous stop and requires a separate dispatch fence.
- `bmth.b`: 5 registers; native duration/type callback at CU `0x0014`, instruction 10. `bmth.a`: 4 registers; native terminal result forwarding at CU `0x0040`, instruction 33. Neither observer may replace/skip the existing callback.
- `bmsk.d`: 5 registers; native `bmua.b()` at CU `0x0037`, instruction 29; `MediaPlayer.start()` follows at CU `0x003a`, instruction 30. This method contains a monitor and catch-all unwind. Do not insert an early return inside the synchronized region. A post-start observation must account for thrown start failures and the chained-player branch, which uses `setNextMediaPlayer`.
- `bmsp.c`: 2 registers and monitor-protected returns. Observe the returned enum through return-value hooks that retain branch targets and monitor exit; never emulate user mute by writing `f/g/i`.

### Feasible direction and remaining proof

Inference: the native identity-based cancel operation provides a candidate for P0 preemption without stream-volume changes or persistent mute changes. A receiver-owned TTS adapter still needs a generation-scoped guidance hold, a quiescence acknowledgement, and a final native dispatch fence while warning audio is active. Cancelling once does not prevent a newly arriving native prompt. On release, let Maps produce a current instruction; do not replay a saved turn string.

The native start callback is a scheduling notification, not actual audio start. For warning TTS use its own unique utterance/attempt callbacks. For measuring native overlap, observe the real media start/completion and chained-player behavior as well as logical manager state. Native FINISHED_AUDIO alone cannot prove an audible signal.

Private spikes must exercise active cancellation, pending cancellation, new guidance during a hold, cancellation before MediaPlayer start, car routing, full/minimal mute, focus denial and restoration of a relevant current maneuver. These are unresolved release gates. No unrelated TTS stream is enabled as a fallback.

REA corroboration: `bmrc.z` `ev_3fffde50b5abbdde1a25c79f0a61280c5a5136899579180a7d8084ec797339cd` (clears pending state only); `bmth.b` `ev_f78eadf918624e1c6e3199d29984c32393e95f01447be9f559509e1540f1b471`; `bmsp.c` `ev_026af94f4f1ddb57a0b8af898fbcd1b3aa54ac7dd965c6c8e19435b36eed239c`. Incoming references to concrete `bmrc.l` were empty, while interface `bmuh.l` reports `bmkx.sB` (`ev_1175ffe0cab647d3970e25e4e8399e0db68edc33555525afe928278011a65b23`). An empty concrete-call search does not establish an unused operation or complete runtime coverage.

## Reproduction and completion gates

Use [the inspection command](../../scripts/navigation-alerts/README.md) against all three originals and frozen selection/contract files. `--coverage` checks that every actual FM enum member has an explicit disposition. `--require-complete` must fail while any entry remains unsupported. Its evidence-list checks validate inventory shape, not the truth of runtime proof.

The contracts freeze static bindings only. Work package 1 remains open until original-artifact runtime feasibility and instruction-safe hooks are proven. Work packages 2–6 remain required: shared transport/ownership, FM capture, shared scheduler/UI/settings, speech integration, complete rebuild/install/timing/device/car acceptance and reviewed delivery.
