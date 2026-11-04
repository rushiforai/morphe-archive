# AGENTS-patches.md — patch knowledge (verified against v6.7.2, versionCode 6723; 6.7.1 is dead — the app forces the update)

Entry: `AGENTS.md`. Login states: `AGENTS-login.md`. TV: `AGENTS-tv.md`.

- **Settings screens & runtime toggles (ModSettingsPatch, v1.6.0)**: the app ships its
  own native settings UI on both sides — phone: custom fragment `e66` (rows built in
  code via `K0(section title)` containers + `J0(container, title, subtitle, key,
  default, listener)` switch rows; `listener = null` → plain toggle, key saved via
  `c34.d0(String, Z)`); TV: guided-step fragment `j49` (actions built in `V0` via
  `ke3` builder — id in field `a`, checked bit in field `f`, pref read with
  `getBoolean(key, v1)` — click dispatch in `T0` by `cmp-long` on the id). Both store
  prefs in `c34.q` = `getSharedPreferences("settings", 0)` (init in ApplicationClass), writer `c34.d0(String,Z)`.
  `res/xml/preferences.xml` (0x7f190007) is DEAD — referenced nowhere. Runtime
  toggles exposed: `morphe_hide_nav_pro` (phone settings row + TV action, read in
  `NavDrawer.onCreate` — default false = links visible), `morphe_show_api_errors`
  (TV action, read in `jf2.c` — default false = popup suppressed, replaces the old
  unconditional `jf2.a` return-void; takes effect on the next popup, no restart),
  `morphe_remove_news_promo` (no UI row, read in
  `pi0.onPageFinished` — default true; applies on next news-page load).
  `morphe_hide_nav_pro` is the only one needing an app restart (read in
  `NavDrawer.onCreate`). HideNavProLinksPatch default is now TRUE
  (pref-controlled); TV guided action ids: ours is 0x40, app's are 1..7.
  Register tricks: NavDrawer gate reuses v0/v1/v8 (v8=false doubles as pref default);
  `pi0.onPageFinished` clobbers p2 (URL dead in the default branch after invoke-super)
  for the default=true register — `jf2.a` could NOT host the read (locals 2, both
  params live) which is why the gate lives in `jf2.c` (6.7.2: locals 2 — the read moved into an added static helper, see below).
- **Patcher API gotchas (cost 1 CI-less iteration, found locally)**:
  1. `addInstructionsWithLabels` with a branch to a label at the END of the smali
     block → ArrayIndexOutOfBoundsException (the patcher treats targets past the
     block as external labels). Fix: end the block with `:label\nnop`.
  2. Reusing the ORIGINAL method's label name (e.g. `:cond_0`) inside an injected
     block compiles to an unplaced dummy label → "Cannot get the location of a
     label that hasn't been placed yet" at dex write (Q0). Drop such guards or
     branch to a fresh block-local label.
  3. `findInstructionIndicesReversedOrThrow { lambda }` (patches-library 1.6.2)
     fails to resolve as an extension with a typed lambda — use a plain
     `instructions.indexOfFirst { }` scan instead.
  4. An injected early-return guard compiles/applies fine and still be INVERTED
     (`if-eqz` vs `if-nez`) — application success proves nothing about runtime
     semantics. Cost: shipped v1.7.0 with the jf2.c error-dialog gate backwards
     (default OFF = popup shown). Verify each branch direction on the emulator:
     trigger the guarded path with the pref OFF (popup must be gone) AND ON.

- **API surface**: `https://porn-app.com/api/` (Retrofit, `dj.smali`), endpoints
  `v9/device`, `v9/sites`, `v9/unixTime`, `v9/login`, `v9/videoheaders`… Requests carry
  `Authorization: Bearer<accessToken>` and `hash` = RSA(4096)-PKCS1-encrypted
  `HashInformation` JSON (`time`, `version`=6719, `id`=androidId, `packageName`,
  `signatures`=[cert SHA-256 b64], `loginStatus`). Embedded RSA public key in
  `nj3.a()` (RSA key; name unverified in 6.7.2). GSON serializes HashInformation fields directly (no @SerializedName →
  raw field names).

- **PRO check**: `LoginStatus.getPro()J` (NOT obfuscated) returns PRO-expiry unixtime seconds;
  every check in the app is `getPro() > getUnixtime()`. Patch = hook the getter to return
  `Long.MAX_VALUE`. GSON deserializes into the field directly, so server responses still parse;
  all reads go through the getter.
- **Hash-validation risk**: the API validates the RSA-encrypted device hash (`nj3.b(LoginStatus)` →
  `HashInformation`) that every request carries: the signing-certificate hash must be in
  the server's whitelist, and `loginStatus.pro` in the hash must be 0 or in the past (a
  future value → HTTP 500 "Application Error - please redownload"). Hence two patches:
  spoof the signature (`SpoofSignaturePatch`) and no-op `setPro` so the hash
  reports `pro=0` while local checks go through the getter. Verified server-side:
  `sig=orig, pro=0` → 200; `pro=MAX` or wrong sig → 500 redownload error.
  If the server ever tightens hash validation further, patch the `cmp-long` sites
  instead (classes eb0, g75, jp9, p81, v5a in the 6.7.1 decompile (unverified in 6.7.2)).
- **Spoof fingerprint gotcha (cost 3 CI iterations)**: the matched instruction for
  `methodCall(Base64, encodeToString)` in `nj3.b` is the `invoke-static` (35c), and the
  result register lives in the `move-result-object` at `index + 1` — read
  `getInstruction<OneRegisterInstruction>(index + 1).registerA`, then
  `removeInstructions(index, 2)` + `addInstruction(index, const-string ...)`.
  Verified end-to-end in emulator 2026-09-17 (patches v1.0.4, builder tag `4`):
  startup OK, PRO features unlock with a real account.
- **API etiquette**: probing their API is risky (ban/block). Emulate the real app
  exactly (okhttp UA, `hash` + `Authorization` headers), send single spaced requests,
  and stop once the hypothesis is confirmed.
- **Ads (RemoveAdsPatch.kt)**: IMA (Google Interactive Media Ads) sources wrap players
  with VMAP ad tags. Three variants, all at the app's own domain:
  `vmap.xml` (StandardVideoPlayer `T()V` + PopupVideoPlayer), `vmapc.xml` (`ql0.smali`,
  the Cast `VastAdsRequest$a;->a` field), `vmap_swipe.xml` (`os7.smali`).
  Patch = replace each URL const-string with a **non-empty dummy URL
  `http://127.0.0.1/x`** (base64 `DUMMY_AD_URL` constant). An EMPTY string ""
  makes the IMA SDK throw `IllegalArgumentException: Either ad tag url or ads response
  must non-null and non empty` at video start (`je.k`/`tl9.V`/`p9.<init>`) —
  found 2026-09-17 in the emulator: playback crashed on every ad-enabled site.
  Dummy URL → ad error event → playback continues. Fixed in v1.2.0; verified
  end-to-end on emulator (v1.3.0 build: playback, 0 crashes, favorites persist).
- **Nav drawer (v1.3.0, `HideNavProLinksPatch.kt`)**: hides 6 login/PRO-gated mobile nav
  items (Your Account, Get Free PRO, PRO Benefits, PornDB, Global Search, PornTabs) in
  `NavDrawer.onCreate`, anchored after the app's own debug-item `MenuItem.setVisible`
  block; re-fetch the Menu (the app clobbers the register) and `findItem(...).setVisible(false)`.
  **Disabled by default** (`default = false`) per user request — enable with `--enable`.
  Keep Player Playlist visible (still needs login/PRO server-side, but user wants it kept).
- **RemoveNewsPromotionPatch (v1.1.0)**: news page promo (server-HTML accordion item
  in porn-app.com/news) removed 3 ways in `Lpi0;`: (1) NEW `shouldInterceptRequest`
  override (assembled via full smali assembly — `addInstructionsWithLabels` cannot
  attach try/catch; assembler keeps handlers) fetches the page, cuts the
  `headingPromotion` accordion item from the HTML before the WebView parses it —
  zero flash, all WebView versions; JS paths are the fallback. (2) `onPageStarted`
  pref-gated MutationObserver + CSS net (`#headingPromotion`, `.divtopad`,
  `.brazzers_video`, `:has()` for Chromium 105+), strips on arm. (3) `onPageFinished`
  text-match strip. Shared `injectGatedJs` helper (p2 dead after invoke-super =
  default=true register). **Needs `--bytecode-mode STRIP_SAFE`** — STRIP_FAST drops
  the try/catch (dexdump `catches: (none)`) and an offline IOException would crash
  the app. Verified on emulator: banner gone, 0 crashes.
- **RemoveWebViewVersionNagPatch (v1.8.1)**: server-driven "WebView Component"
  version popup (required-vs-installed versionCode from server config) shown by the
  shared `Lea3;->c(Object)` (all 4 callers: NavDrawer1, helper/b, player, TV
  fragment) AND independently in the Start App button's listener `Lt7;->onClick`
  case 0xb (button silently dead without this — bit us twice). Both gates: single
  `if-lez` after a unique anchor replaced with `goto/16` to the same target.
  "Country Problem" (pref once) and "Android Version Problem" (< API 26, pref once)
  dialogs deliberately kept. Verified on emulator: popup gone everywhere, Start App
  proceeds, 0 crashes.
- **URL obfuscation convention**: the app's domain never appears in plain text in any
  repo — base64-encoded (raw base64 literals in RemoveAdsPatch.kt; `b64:` prefix in
  builder config.toml, decoded in build.sh). New strings: base64 first
  (`printf 'https://...' | base64 -w0`). Keep it that way in new code.
- **6.7.2 re-anchor (whole defpackage space renumbered — every obfuscated anchor moved)**:
  `ka1`→`c34` (`.q` prefs, `.d0` bool writer), `er5`→`e66` (`z0`/`O0`/`P0`), `ua8`→`j49`
  (`V0`/`Y0`), `c53`→`ke3`, `d53`→`le3`, `m72`→`jf2` (`c`), `ue4`→`ea3` (`c`), `g7`→`t7`
  (`onClick`, NavDrawer1 `y()`→`C()`), `wk2`→`ct2` (`b1`→`g1`), `ce0`→`pi0` (merged client,
  default branch is the LAST invoke-super), `dp0`→`ot0`, `fp4`/`r31`/`wj7`→`d35`/`mb`/
  `z81`/`s97` (isTV sites 2/2/3/1), `te4`→`js4`, `bn`→`pq` (diff cb `wp1`→`xw1`),
  `x93`→`nj3`. `SiteInfoRequest.<init>` gained a 5th param (String, StandardFilter, Z
  pornTabs, Z globalSearch, Z album) — still `.locals 0`, p3 still pornTabs. Nav resource
  ids shifted: nav_premium 0x7f0b0330, nav_tokens 0337, nav_buypro 0322, nav_porndb 032f,
  nav_search_pro 0332, nav_tabs 0335; the WebView-nag anchor `0x7f16017b` (style
  MobileDialog) is still the const right before the `if-lez`.
- **4-bit register trap**: an injected instruction that names a p-register can overflow
  4-bit register fields when the host method has many locals (`e66.z0` has `.locals 18`,
  so p0 = v18 → "Invalid register: v18" and the patcher reports the useless
  "Collection is empty"). Use range invokes (`invoke-virtual/range {v0 .. v1}`) or land the
  code in an added helper method.
- **`.locals` cannot be widened by an injected block** (`InlineSmaliCompiler` wraps the
  snippet in a method that declares `.registers <host count>`; a `.locals` line is a parse
  error). When a gate needs more registers than the host declares (`jf2.c` has 2), add a
  static helper with `util/assembleFirstMethod(smali, ...)` and inject a one-register call.
- **Verifier merge types**: injected code that leaves a register holding a different type
  than the app's path at the merge label gets the whole class rejected at runtime
  (`VerifyError: register v1 has type Conflict but expected Integer` in
  `NavDrawer.onCreate`) even though patching and dex writing succeed — and clobbering such
  a live register can also break navigation with a `ClassCastException`. Prefer a helper
  method that touches none of the host's locals.
- **No billing/ad SDKs** (no AdMob, no billingclient) — "ads" are only the in-player
  VMAP breaks.
