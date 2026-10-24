# Pdb Extras — evaluation 0.3.9 / 0.4.0

Device: `emulator-5554` (x86_64, app on ARM translation, `primaryCpuAbi=arm64-v8a`).
Build: `0.3.9` then `0.4.0`, upgrade-in-place install (session preserved), signed in as `chad_451` / `6398658`.

## New in this build

| # | Change | Where |
|---|---|---|
| 1 | Floating ⚡ power button | patch `HomeBubblePatch.kt` + `PdbBubble.java` (0.3.8) |
| 2 | Extras screen redesigned: 5 tabs, shared result card, hot toggles | `PdbExtrasActivity.java` |
| 3 | Plain-language labels (jargon removed) | `PdbTools.summary`, `TEXT_ROWS`, section labels |
| 4 | "Copy last viewed profile" quick action | `PdbUi.LAST_PROFILE_ID` + `PdbBubble` |
| 5 | Limits tab: visitor-limit switch, counters view, counter reset | `PdbLimits.java` + `VisitorLimitPatch.kt` |

## Results

### Floating power button (0.3.8)
- PASS — ⚡ bubble renders on Home and drags; position persists.
- PASS — menu: `✓ Show profile IDs`, `✓ Disable read receipts`, `Pause Morphe`,
  `Copy my profile ID`, `Copy last viewed: わたし_290`, `Open Pdb Extras`.
- PASS — hot toggle: turning "Show profile IDs" off from the bubble removed the
  chip from the chats list (`mel_708 #6344859` → `mel`) without a relaunch;
  Extras' Quick switch then read `checked=false`, i.e. both write the same pref.
- PASS — `Copy last viewed` picked up the profile the ID hook last saw.

### Extras redesign
- PASS — header `Pdb Extras v0.3.9`, subtitle `Pro unlocked · Ads off · Morphe active`.
- PASS — tabs `Quick · Limits · Power · Data · Advanced`, chips highlight on select.
- PASS — result card appears only once a tool runs.
- PASS — all four older tabs still render their tools unchanged.

### Limits tab — the visitor limit (the substantive change)
- The app's rule, from smali: `visitsViewCount >= 3 || visitsCardClickCount >= 3`
  inside a rolling 1-hour window → "take a break" sheet, max twice a day.
- PASS — patch applied on build (`No profile-visitor limit` in `patch-result.json`,
  11/11 patches applied).
- PASS — **no VerifyError / crash**: `UserVisitStatusListActivity` opens and
  renders (`5 Visits`, region breakdown, `Who?` premium reveal) with the patched
  method live.
- PASS — switch toggles on (checked=true) and persists; toast
  "visitor limit lifted". With it off the extension reproduces the stock rule.
- NOT REPRODUCED — the sheet itself was never hit during this session (it needs
  3 visitor views inside an hour); the gate is verified by code path + smoke test,
  not by triggering the original sheet and watching it disappear.

### Counters
- PASS — `Show the app's counters` lists 18 day-scoped keys with values.
- PASS — `Reset daily counters now` dropped all 18 keys, reported each, no crash.

### UI review (vision-check, Gemini)
- Before: FAIL ×2 — subtitle `pdb.app_preferences • MMKV ok`, and hints built from
  raw pref keys (`mockFeedCountryCode`, `whiteListHost`, `debugInstantChatUserId`).
- After: **PASS ×2** (Limits tab 9/9 expectations; Advanced tab 6/6) — no package
  names, no "MMKV", no SQL, labels legible, spacing consistent.

## Limits: what can and cannot be changed

- **Extendable (client-side)** — visitor-view rule ✅ patched; local daily counters
  ✅ resettable.
- **Not patchable (server-side)** — premium Soul filters (personality/region):
  `PUT /api/v2/irl/feeds/filters` answers "need to be pro user to access". The
  sheet opens in this build (client pro flag faked), the write is still refused.
  Coins/boosts/ad budgets likewise.
- **Not a limit** — "Wonder Chat waiting" is a server-side match with a stranger
  (`common_waiting_for_connect`); there is no client timer to skip.

## 0.4.0 — power button on every screen

- PASS — `HomeBubblePatch` now also hooks `pdb.app.base.ui.BaseActivity.onCreate`.
- PASS — exactly one bubble on Home (both hooks fire there; the view tag dedups).
- PASS — bubble present on `pdb.app.chat.ChatActivity`, menu opens there, and
  `Copy last viewed:` tracked the chat peer (`mel_708`) after read on a profile page
  (`わたし_290`).
- PASS — excluded screens (Splash / Login / Story / InstantChatWaiting / Extras)
  get no bubble.

## Open items

- The visitor sheet was never observed firing (see above) — a targeted manual pass
  (open 3 visitor profiles within an hour, switch off) would close this.
- API proof for the premium filters still needs the in-app request tool (host curl
  is blocked by Cloudflare), or the user's own account with a real subscription.
- Social features (read receipts, see-more, `channel_info` row formatting) still
  need a second account.
