# AGENTS-patches.md — patch knowledge (verified against v6.7.1, versionCode 6719)

Entry: `AGENTS.md`. Login states: `AGENTS-login.md`. TV: `AGENTS-tv.md`.

- **Settings screens & runtime toggles (ModSettingsPatch, v1.6.0)**: the app ships its
  own native settings UI on both sides — phone: custom fragment `er5` (rows built in
  code via `K0(section title)` containers + `J0(container, title, subtitle, key,
  default, listener)` switch rows; `listener = null` → plain toggle, key saved via
  `ka1.f0(String, Z)`); TV: guided-step fragment `ua8` (actions built in `Q0` via
  `c53` builder — id in field `a`, checked bit in field `f`, pref read with
  `getBoolean(key, v1)` — click dispatch in `T0` by `cmp-long` on the id). Both store
  prefs in `ka1.j` = `getSharedPreferences("settings", 0)` (init in ApplicationClass).
  `res/xml/preferences.xml` (0x7f190007) is DEAD — referenced nowhere. Runtime
  toggles exposed: `morphe_hide_nav_pro` (phone settings row + TV action, read in
  `NavDrawer.onCreate` — default false = links visible), `morphe_show_api_errors`
  (TV action, read in `m72.c` — default false = popup suppressed, replaces the old
  unconditional `m72.a` return-void; takes effect on the next popup, no restart),
  `morphe_remove_news_promo` (no UI row, read in
  `ce0.onPageFinished` — default true; applies on next news-page load).
  `morphe_hide_nav_pro` is the only one needing an app restart (read in
  `NavDrawer.onCreate`). HideNavProLinksPatch default is now TRUE
  (pref-controlled); TV guided action ids: ours is 0x40, app's are 1..7.
  Register tricks: NavDrawer gate reuses v0/v1/v8 (v8=false doubles as pref default);
  `ce0.onPageFinished` clobbers p2 (URL dead in the default branch after invoke-super)
  for the default=true register — `m72.a` could NOT host the read (locals 2, both
  params live) which is why the gate lives in `m72.c` (locals 3).
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
     semantics. Cost: shipped v1.7.0 with the m72.c error-dialog gate backwards
     (default OFF = popup shown). Verify each branch direction on the emulator:
     trigger the guarded path with the pref OFF (popup must be gone) AND ON.

- **API surface**: `https://porn-app.com/api/` (Retrofit, `dj.smali`), endpoints
  `v9/device`, `v9/sites`, `v9/unixTime`, `v9/login`, `v9/videoheaders`… Requests carry
  `Authorization: Bearer<accessToken>` and `hash` = RSA(4096)-PKCS1-encrypted
  `HashInformation` JSON (`time`, `version`=6719, `id`=androidId, `packageName`,
  `signatures`=[cert SHA-256 b64], `loginStatus`). Embedded RSA public key in
  `x93.a()`. GSON serializes HashInformation fields directly (no @SerializedName →
  raw field names).

- **PRO check**: `LoginStatus.getPro()J` (NOT obfuscated) returns PRO-expiry unixtime seconds;
  every check in the app is `getPro() > getUnixtime()`. Patch = hook the getter to return
  `Long.MAX_VALUE`. GSON deserializes into the field directly, so server responses still parse;
  all reads go through the getter.
- **Hash-validation risk**: the API validates the RSA-encrypted device hash (`x93.b()` →
  `HashInformation`) that every request carries: the signing-certificate hash must be in
  the server's whitelist, and `loginStatus.pro` in the hash must be 0 or in the past (a
  future value → HTTP 500 "Application Error - please redownload"). Hence two patches:
  spoof the signature (`SpoofSignaturePatch`) and no-op `setPro` so the hash
  reports `pro=0` while local checks go through the getter. Verified server-side:
  `sig=orig, pro=0` → 200; `pro=MAX` or wrong sig → 500 redownload error.
  If the server ever tightens hash validation further, patch the `cmp-long` sites
  instead (classes eb0, g75, jp9, p81, v5a in the decompile).
- **Spoof fingerprint gotcha (cost 3 CI iterations)**: the matched instruction for
  `methodCall(Base64, encodeToString)` in `x93.b` is the `invoke-static` (35c), and the
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
- **RemoveNewsPromotionPatch (v1.1.0)**: news page promo stripped via JS injected in
  shared WebViewClient `Lce0;->onPageFinished` default branch (after first
  invoke-super): removes the `.accordion-item` matching /Porn Site Promotion/ and
  injects CSS `.paysiteAd{display:none!important}`. Verified on emulator.
- **URL obfuscation convention**: the app's domain never appears in plain text in any
  repo — base64-encoded (raw base64 literals in RemoveAdsPatch.kt; `b64:` prefix in
  builder config.toml, decoded in build.sh). New strings: base64 first
  (`printf 'https://...' | base64 -w0`). Keep it that way in new code.
- **No billing/ad SDKs** (no AdMob, no billingclient) — "ads" are only the in-player
  VMAP breaks.
