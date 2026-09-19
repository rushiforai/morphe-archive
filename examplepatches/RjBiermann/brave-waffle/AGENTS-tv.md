# AGENTS-tv.md — TV notes (Television_1080p AVD, emulator-5556, leanback UI)

Entry: `AGENTS.md`. Login/server walls: `AGENTS-login.md`.

- **The real TV sites fragment is `wk2`** (leanback browse fragment, confirmed via
  `dumpsys activity top` Added Fragments). Patching `v48.q0` (earlier attempt) does
  NOT fix this path — v48 is a different (non-active) sites fragment.
- **TV gate chain, fully mapped and PATCHED (patches v1.2.1, verified 2026-09-17
  on emulator)**:
  1. Site tiles are only built when `SiteInfo.packagename == "standardsite"`
     (`uk2` list build — other groups become empty and are dropped).
  2. Tile clicks (`k23.h`) are gated on `wk2.u4` (logged-in flag, only set by the
     login success callback `eb0.c` → `sa4.e(true)`), and route by pkg switch:
     paid pkgs → PaysiteLoginActivity, unknown pkg → silent no-op.
  3. `wk2.b1(ZZ)V` shows the "User Account needed" dialog (`fk.D`) when pref
     `username` is empty; non-empty → `fk.q` → `fk.s` anonymous login (safe:
     fk ctor inits its username/password fields to "", no NPE).
  Fix (BypassAccountNeededPatch): `getPackagename()` → "standardsite" (tiles for
  all sites + click path) and `wk2.b1`'s `String.isEmpty` result forced to false
  (always the `fk.q` login route → callback sets `u4=true` → clicks work).
  fk.s's empty-creds pref clearing is a no-op on an anonymous device.
  **Real login kept (v1.8.0, verified 2026-09-18 on emulator: tile → dialog →
  LOGIN form → server login → favorites fetch works)**: `b1(ZZ)`'s second param
  is `true` ONLY at the "Login with PRO Account" tile call site (`k23` pswitch_19,
  `b1(v10,v10)`; startup `wk2.u0` → `b1(p1,0)`, tile click `k23:2229` → `b1(1,0)`).
  The isEmpty force is now conditional on `p2=false`; with `p2=true` the stock
  branch survives → the tile opens `fk.D` (LOGIN → "Set your Login Details"
  username/password dialog, SIGN UP inside). Cosmetic: the login-success PRO
  Check dialog still shows the spoofed-MAX overflow date "1969-12-31 -
  579004505 days remaining".
- **Server wall — SOLVED (patches v1.3.0, TvDataIsTvPatch, verified 2026-09-18 on
  emulator: browse + video playback work anonymously, TV and phone)**: the
  "It seems you are not a PRO User!..." HTTP 403 is NOT account state — it is
  keyed on request CONTENT. The server PRO-gates:
  1. `isTV=true` query param on `v9/sites/{tag}/data|related|tags|stream|extra`
     → force `isTV=false` in the 3 request lambdas (fp4/r31/wj7, hook the
     `move-result` after every `dp0.a` call: fp4 2 sites, r31 2, wj7 1).
  2. `pornTabs=true` in the `SiteInfoRequest` body (only the TV site screen
     `ze4.f` sends it) on `v9/sites/{tag}/info|link|categories` → force
     `const/4 p3, 0x0` at ctor start (mobile already sends false).
  The TV also passes `filter=null` (phone always passes one) — a filter-less
  body gets "You are not logged in!" on /link even with pornTabs fixed →
  default a `StandardFilter()` at ctor start when p2 is null. With pornTabs
  false the responses omit some VideoInformation lists (e.g. pornstars) →
  null-safe `getPornstars()` (returns EMPTY_LIST) and null-safe
  `SiteInfoRequest.toString()` (append(Object) instead of
  StandardFilter.toString()) — both NPE'd/killed threads on TV.
  Verified phone regression: pornTabs=false forced globally is harmless on
  mobile (browse + playback pass). Paysite PROMO tiles (BRAZZERS/EVIL EROTIC/
  MAMACITAZ etc. in every listing) still 403 "not logged in" on the player's
  `POST v9/sites/{tag}/link` + `POST v9/video/{id}/info` (dj.I) — real Pornhub
  videos play; promo tiles are studio ads, not a patch bug.
  Instrumentation technique (SIR ctor): ctor has `.locals 0`; insert logging
  just before the final `return-void` where all param registers are dead.
- Builder release APKs can't install on x86 TV emulator (`INSTALL_FAILED_NO_MATCHING_ABIS`
  — builder's utils.sh strips lib/x86* even for arch=all; fine for real arm TVs).
  For TV emulator testing, patch locally with the morphe CLI (keeps all ABIs) —
  see `../AGENTS.md` "How to build".
- TV D-pad: keyevent 19/20/66; AVD is 1920x1080 direct coords for taps.
- **TV player "Error occured" popup — SOLVED (RemoveTvPlayerErrorDialogPatch,
  verified 2026-09-18: HQPorner video plays fullscreen on TV, no popup, 0 FATAL)**:
  the TV player chain (fresh `GET v9/video/{id}/info` → `s()` → site chain) makes
  calls the server app-level 403s for anonymous accounts (`POST /porndb`,
  `POST /sites/{tag}/related?isTV=false` — HTTP 200 + error body, NOT real 403s;
  all responses succeed at HTTP level, `zk6.Z=true`). These failures are
  NON-FATAL for playback — video plays fine. But every caught APIException
  routes through `m72.a(Context, Throwable)` (xj2.b log → dialog with the server
  message; callers: rp8.onError case 0x10, its refetch runnable zg2 (4 sites),
  ah2/eb0/ee1/f76/ff4/ig2/k80/ky2/lk2) → the "Error occured — You are not logged
  in!" popup. Fix: keep the xj2.b log, `return-void` right after it in m72.a —
  silences this popup class app-wide (no functional regressions observed).
  Debugging recipe: extend DebugLogPatch with (a) request logger at h72.a index 0
  (`iget-object p0, p1, Lue6;->e:Lwi6;`), (b) response-failure logger after
  `ue6.b` move-result (`zk6.Z` false → log url), (c) response-body dump in
  fl6.string via `source().peek().request(MAX)` + `U(UTF_8)` — body parse for the
  app-level error happens INSIDE h72.a (throws APIException at line 104),
  not in a converter. The popup text comes from the server's error body
  (Gson→ErrorResponse→message). Compare failing-vs-working devices by dumping
  the SAME request on phone and TV — bodies are byte-identical; the
  differentiator is only the encrypted hash/token, so don't chase request-body
  diffs.
- Anonymous-account note: wiping app data on the phone creates a fresh anonymous
  account which can still `/link` + play — the gate is in the TV-only request
  paths, not account age.
