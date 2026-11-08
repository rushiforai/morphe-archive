# Reddit — save-flow crash analysis & v2.2.9 stability hardening

Field report: "Sometimes Reddit crashes with no reason after saving a post."

## What the bundle changes on Reddit (app-scoped)

| Patch | Default | What it does |
|---|---|---|
| Remove ads | ON | 5 layers: listing-Children filter (promo flag reflection), SubmittedListing skip, **Layer 3 comment-banner loader**, Comment ad placeholder force-true, Layer 5 AdPostSection composable render no-op |
| Unlock Premium | ON | Account JSON adapter surgery — flips `is_gold` at the Moshi construction sites (Long-typed premium fields deliberately untouched) |
| Disable Click Tracking | ON | Same choke point — `outbound_clicktracking` → false |
| Reddit: Diagnostic crash log | off | **NEW in v2.2.9** — chaining uncaught-exception handler → `Downloads/reddit-crash-*.txt` |
| Unlock Account Entitlements / Employee Debug Flags | off | Account surgery family — not suspects, unchanged |
| Block AutoMod / Content filters / Show deleted comments | off | Share the memoized listing path — **not** implicated in the report (disabled by default) |
| Proteus listing memo | (extension) | Identity+size guarded 16-entry LRU; synchronized. Same-size in-place mutation window exists but returns identical object refs — not a crash vector |

## Why "crash after saving a post" specifically

A save is optimistic: the item's state mutates in place, then the Compose
lists re-diff and re-bind. That is the hot re-render path our listing
injections and composable no-ops sit on. Two paths were implicated, best first:

1. **Layer 3 (comment-banner ad loader entry-kill)** — the injected smali
   did `move-result v0` after `hideCommentAds()`, overwriting register v0,
   which is the receiver `this` of `P(ZLcbc;I)V`. Unobservable only because
   `hideCommentAds()` is a constant-`true` helper that always took the
   `return-void` branch. The same *shape* of injection is what killed the
   Mereframe preview camera. **Fixed in v2.2.9**: injected code is now a
   single constant `return-void` — touches zero registers, no label, no
   branch, behavior identical (the loader never ran; it still never runs).
2. **Layer 5 (AdPostSection Compose-render no-op)** — `return-void` injected
   as the first instruction of the sponsored-unit render composables.
   This is the most fragile layer on the save path (Compose slot-table
   assumptions, across builds). **User decision (2026-11-07): KEEP IT ON.**
   With no stack trace, removing it would be guess-driven. It fails LOUDLY
   at patch time (thrown `PatchException` → patch fails, app untouched), never
   silently. If a device log ever points here, Layer 5 moves to its own
   off-by-default patch. Compensated with a printed skip-diagnostic and this doc.

The **Account JSON surgery family** (Unlock Premium / Click Tracking) had no
crash vector in review: register math verified, reverse-order apply, boolean
params only, loud patch-time failure otherwise. Unchanged.

## What v2.2.9 ships

- Layer 3 rewritten (constant `return-void` with no registers).
- `RedditFeedHelper.hideCommentAds()` retained for API compatibility but
  unreferenced (comment documents it).
- New patch **Reddit: Diagnostic crash log** (off by default, v2.2.9):
  injects a zero-argument `installWithAppContext()` call into the Moshi
  `AccountJsonAdapter` constructor — fires on the first account sync after
  launch. The Context is resolved reflectively via `ActivityThread` — the
  injection carries no register material and relies on NO unverified
  Application class name. After install, any uncaught exception on any
  thread is written to `Downloads/reddit-crash-*.txt` (MediaStore, no
  permission) with device/app version header, then forwarded to the
  previous handler (crash semantics preserved).
  - Limitation: crashes before the first account sync after launch are NOT
    captured. In practice the /me fetch fires on app start while logged in.
  - If a future build drops the adapter class the failure is at patch time,
    never at runtime.

## How to get a usable log next crash

1. In the patcher, enable **Reddit: Diagnostic crash log** (enable Remove
   ads / Unlock Premium / others at your own discretion) and reinstall.
2. Reproduce the crash (save a post). The app still crashes normally — but
   Files → Downloads now holds `reddit-crash-*.txt` with the full stack.
3. Attach the newest `reddit-crash-*.txt` to this repo's issues — that's the
   one artifact that turns the next report from "sometimes after saving"
   into a surgical fix.

## Honest status

All hand-reviewed; nothing device-verified. The Account surgery was verified
against 2026.42.0; Layer 3's rewrite is behavior-identical by construction;
Layer 5 is retained (see keep-decision) and remains the open risk on the
save path. The diagnostic is the guarantee that the next report comes with
evidence.
