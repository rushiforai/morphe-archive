# Host stale pose-cycle guard: bounded experimental proposal

Date: 2026-09-15. Status: static evidence and pseudocode only. No DLL patch, live hook, settings change, restart, or ADB command performed for this proposal.

## Decision

A narrow host guard is justified for an **opt-in experiment against reset amplification**. The current handler can reset for a backward pose-cycle ID, store that older ID, and reset again when current packets arrive. It is not yet established why those IDs arrive late, whether their poses are stale, or whether preventing these resets improves the visible hitches.

**Equal reset counters are necessary for the proposed guard, but are not a sufficient safety proof.** The reviewed model narrows the initial bound to differences -32 through -6, positive IDs, and an unchanged reset counter. This leaves the existing paths for explicit counter changes, forward gaps, initialization ID 0, and large backward jumps/rollover. It cannot guarantee every real recovery, every reconnect, or monotonic saved IDs globally. It still allows the stock -4/-5 regression and large backward reanchoring.

Do not describe this as a confirmed fix or enable it by default. A predicate/replay model is the next useful implementation; a live DLL change requires a separately reviewed implementation and controlled test.

## Exact binaries and address convention

Host examined from the current loaded module's path:

- `C:\Program Files (x86)\Steam\steamapps\common\SteamVR\drivers\vrlink\bin\win64\driver_vrlink.dll`
- Size: 13,908,632 bytes; SHA-256: `a4bc1ac8a0739c6dc53ea56a300b6332ec74c9fb850e260a483bab5ef1a7da85`.
- SteamVR 2.17.9; captured running `vrserver.exe` PID 8448.
- Host addresses below are PE **RVAs**, not file offsets or live virtual addresses. Preferred image base is `0x180000000`. In this `.text` section, raw offset is RVA minus `0xc00`; runtime ASLR still applies.

Client evidence: exact 2.0.23/5002363 `libvrlink_scene.so`, 2,292,008 bytes. Stock SHA-256 `628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0`; captured installed SHA-256 `377547082a561b7c1f9eb3cfe9314f94b2e57602f3dea917fa8a27526d626f5b`. The five pose scheduling/sending functions compared in `client-cadence-evidence.json` are byte-identical. This audit also verified byte equality for the constructor, `HandleUnrecoverableError`, and `Init`; hashes are in `host-proposal-client-validation.json`. Client addresses are ELF virtual addresses.

Evidence directory: `build/live-hitch-20260915/reset-analysis/`. This proposal does not authorize applying these addresses to any other SteamVR build or Android base.

## What the host actually does

`reset-handler.asm`, function RVA `0x9fc430`:

| RVA | Observed operation |
| --- | --- |
| `0x9fc44d`–`0x9fc455` | Read packet ID at `+0x1c`; subtract saved ID at state `+0x08` using 32-bit arithmetic. |
| `0x9fc458`–`0x9fc45e` | Immediately return for differences -3, -2, -1. Reset counter is not examined. |
| `0x9fc464`–`0x9fc46f` | For equal ID, return if packet phase `+9` is at most saved phase `+0x0e`. Reset counter is not examined. |
| `0x9fc4a5`–`0x9fc4c8` | Timing report, clock estimator update using packet `+0x10`, and saved timing field update occur before the reset decision. |
| `0x9fc4ce`–`0x9fc4e2` | Reset if difference is outside [-5,+12], or if packet reset word `+0x20` differs from state word `+0x0c`. |
| `0x9fc51b`–`0x9fc559` | Save incoming reset word; request encoder reset severity 1; call `ResetVideoStream`. |
| `0x9fc55e`–`0x9fc6d9` | Decode/copy and submit HMD/controller poses and timing. |
| `0x9fc6fb`–`0x9fc6fe` | Equal ID returns after pose updates, skipping later new-cycle work. |
| `0x9fc7ac`–`0x9fc7b7` | Store incoming ID and phase, including after a backward mismatch. |
| `0x9fc811` onward | Update ping/time-confidence/last-WGP reporting; update activity timestamp; issue a host virtual notification; enqueue event type 2. |

The -1/-2/-3 early return proves the handler already tolerates some older cycles by ignoring the inner pose path. Its original design intent is not documented in the binary. Phase overlap/reordering is a plausible explanation, not a proven explanation of the unusual -4/-5 acceptance.

Suppressing only the reset branch is inadequate: it would still regress poses/timing/saved ID. Broadening the mismatch acceptance range is also inadequate for the same reason.

## Preserve the outer packet handler

`reset-caller.asm`, RVA `0x9fc9e0`, validates the packet and calls the inner handler at `0x9fcad6`. After the inner handler returns, it still:

- Calls `0x9e8040` (`0x9fcaec`) for HMD boolean input/property updates. Exact disassembly resolves `IVRDriverInput_004`; this function should not be described as a transport acknowledgement handler.
- Processes controller identity/state/input using the same packet and stored pose slots.
- Processes the trailing ValueTransport payload when present.

Returning from **only the inner handler** preserves these outer actions. Dropping the packet at the dispatcher or returning from the outer handler would drop them. Controller inputs may then be paired with the previously accepted pose, as already happens for the stock short-negative filter; this is still a test obligation.

An inner return does skip clock/ping updates, activity timestamp refresh (`0xa4af40`), a host virtual notification (`0x9fc99c`), and queued event type 2 (`0x9fc9c5`). The latter is an actual queue insertion/wakeup via `0xa4c110`, not merely a log line. Continued current packets should resume this work; an extended run of suppressed packets has not been proven harmless. Full transport-ack independence has not been traced end to end.

## Reset counter and connection lifecycle

Client `QSVLClient::HandleUnrecoverableError(int)` at `0xf4c40` increments the 32-bit field `this+0x7dd4`. `SendPoses` copies its low 16 bits to packet `+0x20` (`0xf4eb4`–`0xf4ebc` or `0xf5188`–`0xf5190`). Host comparison is 16-bit equality. This supports preserving an incoming changed counter as a recovery request, not treating it as a video-frame ID or connection identifier.

The client constructor at `0xf4b4c` clears `[this+0x7dc8, this+0x7dc8+0x3025)` with `memset` at `0xf4c2c`. This zeros both the pose-cycle ID and reset counter. `Init()` sends ID 0 twice at `0xf63d0`/`0xf63e0`. Client reconstruction can therefore reuse earlier counter values. The host's saved-ID/reset-word invalidation across all reconnect paths has **not** been established by this bounded audit. Merely checking that both IDs are positive does not supply that proof, and startup ID-0 packets might not reach this inner handler.

Because only 16 bits are transmitted, 65,536 counter increments can also produce equality again. Conversely, a delayed packet carrying an older reset counter differs and must fall through under this proposal, even though stock behavior may regress the saved counter. Fixing counter ordering would require separate protocol/lifecycle analysis.

The stock -1/-2/-3 and duplicate-phase returns already precede the reset-counter check. Keeping them unchanged preserves their existing behavior; it does not solve their possible suppression of a changed counter.

## Timestamp is not an additional proof of a stale cycle

`SendPoses` receives the ID latched into an earlier scheduled event. It obtains `GetCurrentTimeUS` at function start and writes its low 32 bits into packet `+0x14` (`0xf4e28`/`0xf4e30`). It obtains the time again immediately before sending and writes packet `+0x10` (`0xf5208`/`0xf521c`). Poses, controller transitions and the reset counter are gathered while building that packet.

Thus an older queued cycle ID can carry a **newer send timestamp and current pose/input data**. Timestamp order can distinguish some transport-reordered packets, but cannot prove or exclude delayed event dispatch. `+0x10` is consumed by host `0xa4c810`, which updates clock offset/confidence and timing estimates; no retained raw last-send timestamp suitable for an independent order guard has been established here. Its 32-bit microsecond value also requires wrap-aware comparison, not a plain unsigned or signed ordering test.

Client `SendPoses` separately calls `SVLDataLink::SendLastRXID()` at `0xf5228`, before `SubmitMessage`. Do not move a rejection to the client send path without separately preserving this and the controller/ValueTransport work.

## Candidate pseudocode

This represents only the added decision, preserving stock behavior otherwise. `signed32` means reinterpret the result of unsigned 32-bit subtraction; do not introduce C/C++ signed-overflow undefined behavior.

```text
diff = signed32(uint32(packet.id) - uint32(state.last_id))

if -3 <= diff <= -1:
    return_from_inner_handler                 # existing behavior

if experimental_guard_enabled_for_exact_host_hash
   and -32 <= diff <= -6
   and signed32(packet.id) > 0
   and signed32(state.last_id) > 0
   and uint16(packet.reset) == uint16(state.reset):
    count_candidate_and_return_from_inner_handler

continue_original_duplicate_phase_and_remaining_handler
```

The natural logical insertion point is RVA `0x9fc464`, before original `test edi,edi`, before inner state side effects and before the later RSI/XMM saves. The existing early epilogue is `0x9fc9ca`. These addresses are **not an instruction to overwrite bytes**: any later implementation must establish instruction boundaries, register/flags/stack preservation, relocation/unwind behavior, and exact original bytes first. A return inserted after the additional saves cannot blindly use the same epilogue.

The -32 bound is an experimental ceiling covering the observed backward mismatches of 6–29 cycles. It is not a protocol constant. Existing logs contain selected mismatch/reset messages, not every received packet, so replay of those lines alone cannot establish behavior of the resulting counterfactual state machine. `stale_feedback_guard_model.py` verifies this narrower predicate and explicitly retains a reconnect counterexample.

## Counterexamples and required model cases

| Case | Candidate result and remaining limitation |
| --- | --- |
| Saved 1000, incoming 980, same reset | Suppress inner work; prevent this reset and saved-ID regression. Next current 1001 remains close to 1000. This is the intended amplification case. |
| Saved 1000, incoming 980, changed reset | Fall through to stock recovery, including saved ID/counter updates. |
| Saved 1000, incoming 1013, same reset | Fall through to original forward-gap reset. |
| Saved 1000, incoming 996 or 995 | Stock accepts and can regress saved ID/poses. Candidate is not a global monotonic-ID fix. |
| Saved 1000, incoming 935 | Fall through to stock backward reset/reanchoring. |
| Saved 20, rebuilt client begins at 1, reset word equal, initialization packets not processed | Suppress valid new-session cycles 1–14; cycle 15 enters stock -5 behavior. A brief recovery delay remains possible. Equal counter and positive IDs do not identify the connection epoch. |
| Saved 1000, incoming 980 but packet timestamp is newer | Could be delayed event dispatch with fresh pose/input data; candidate discards those inner pose updates despite the fresh timestamp. This is a concrete behavioral tradeoff. |
| Changed reset on difference -1/-2/-3, or repeated ID/older phase | Existing early returns can still suppress it. Proposed additional guard deliberately does not alter these paths. |
| Reset counter wraps or a new connection reuses it | Equality may be misleading; the predicate alone cannot guarantee preservation of all recovery. |
| Repeated guarded packets without current accepted packets | Inner activity/timing/event updates stop; prove liveness/recovery with bounded-run tests before deployment. |

ID wrap deserves a dedicated case. `OnTopOfFrame` packs a 32-bit `(counter << 4) | phase`, sign-extends it to 64 bits, and `HandleEvent` shifts right by 4 before passing the low 32 bits to `SendPoses`. The resulting wire ID is effectively a sign-extended 28-bit counter. Counter `0x07ffffff` yields ID `0x07ffffff`; counter `0x08000000` yields `0xf8000000`. The host delta is -268,435,455, a real rollover/reanchoring case. The bounded positive-ID guard falls through. A blanket negative-difference rejection would not. Counter `0x0fffffff` to `0x10000000` yields ID -1 to 0 and delta +1.

## Evidence artifacts added by this audit

- `host-feedback-sideeffects.asm`: exact `0x9e8040`, `0xa4c810`, `0xa4c3e0`, clock conversion and activity timestamp routines. Some leaf-function excerpts include following alignment/functions; use address boundaries, not the excerpt heading as a symbol claim.
- `host-extra-a4c110.asm`: scheduled event insertion/wakeup.
- `host-extra-9fa000.asm`: HMD activation path; no saved-ID reset proven there.
- `client-constructor.asm`: ID/reset-counter zero initialization.
- `client-unrecoverable-and-init.asm`: unrecoverable-error counter increment and initialization ID-0 sends.
- `host-proposal-client-validation.json`: the three additional stock/installed function comparisons and an offline arithmetic check of both ID rollover cases.

Recommended experiment success criteria: fewer decoder flushes/output gaps and visible hitches under matched conditions, while deliberate loss/reconnect still recovers and controller input remains correct. Fewer mismatch log lines alone are insufficient. Obtain ID/phase/send-time/receive-time/reset-counter telemetry before attributing the initial fault to Wi-Fi, the client scheduler, the host scheduler, or this reset policy.
