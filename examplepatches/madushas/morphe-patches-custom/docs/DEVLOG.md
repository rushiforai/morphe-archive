# Pdb patch — working log

Persistent notes for whoever (human or agent) picks this up next. Keep entries short,
factual, and append-only. `SESSION-LOG.md` is a symlink to this file.

**Latest: 0.3.6 (2026-10-20)** — signed-in evaluation complete; see
`docs/EVAL-0.3.6.md`. Settings row and extras header show v0.3.6; the extras
activity is no longer exported. Login survived the upgrade.

## Environment (verified 2026-10-20)

- Repo: `/home/madusha/dev/sandbox/pdb_patch`
- Emulator: `emulator-5554`, x86_64, Android 14, **ARM translation available**
- Pdb base: `pdb_original.apk` (2.134.6, versionCode 2694, ARM64-only assets)
- Patch build output: `pdb_patched.apk`
- Emulator install APK: `work/device/install.apk` (adds `lib/arm64-v8a/libmmkv.so`
  so `primaryCpuAbi=arm64-v8a`, then signs with `~/.morphe-data/pdb-test.keystore`)
- Build + install:
  - `./tools/pdbbuild` — Gradle build + Morphe patch (does **not** add the ARM stub)
  - `./tools/pdbdevice` — adds ARM stub, signs, uninstalls, installs, launches
  - `./tools/pdbbuild --install` is **wrong for this emulator**: it installs the raw
    ARM-asset-only APK and crashes with `UnsatisfiedLinkError` for `libmmkv_64.so`.
- Version shown in the app: **Settings → Pdb Extras** header and status line
  (`Patch v0.3.1`).

## Data facts (important; saves hours)

- App database: `/data/data/pdb.app/databases/pdb_app_go.db`
  - Tables seen: `profile_view_record` (and Room metadata).
  - **No `users` table**, **no `messages` table**.
- There is a second database, Firebase's `google_app_measurement_local.db`, which
  *does* have a `messages` table. It is analytics, not Pdb chat data. The 0.3.0
  tools accidentally queried it; 0.3.1 excludes any DB whose name starts with
  `google_app_measurement`.
- MMKV: `files/mmkv/pdb`, ID `pdb.app`'s default. Preferences live in
  `shared_prefs/pdb.app_preferences.xml`.
- Client-side premium flag works: the app's own Tweaks screen shows
  **Mock you as pro user = ON** after startup, and the premium-gated
  "Who?" visitor reveal opens the visitor profile.
- Ads are off: startup log shows `adOff=true`; ad SDK providers are disabled.

## 0.3.0 on-device evaluation (before 0.3.1)

Working:
- Settings → Pdb Extras opens; version header shows `v0.3.0`.
- Profile visitors hidden screen opens; "Who?" reveals the visitor (premium gate).
- User center hidden screen opens.
- Settings shortcut/app icon paths: app opens correctly after install.
- Extras long-press popups open and run actions.
- Hidden screen launcher items that need only an Activity open and work
  (Coins engage, Balance, Community info, Verify, Story editor, Profile settings,
  PDB page manager, Instant chat history, Community explore, Boards explore).

Broken / noisy (fixed or hidden in 0.3.1):
- Long-press power menu had a transparent/see-through background; rows floated on
  the app. Fixed by using `PdbUi.card()` (opaque `content_bg_r8`) for the popup
  shell.
- Scrolling the Extras screen put rows under the status bar/clock. Fixed by
  padding the **root FrameLayout** with system-bar insets, not the scrolling
  content.
- "User inspector", "Follows", "Personality", "Subconscious", and "User database"
  either immediately finish (need a user/route context) or are dead on this build.
  They were removed from the hidden-screen list; the list now has 12 items.
- SQLite tools were querying the Firebase measurement DB's `messages` table and
  then joining a non-existent `users` table. 0.3.1 returns a clear
  "no local SQLite message table" message instead, and visitor queries no longer
  join `users`.
- Visitor log/digest now resolve usernames defensively (null-safe), so they do not
  fail when there is no `users` table.
- Added a "Dump database schema (CREATE TABLE SQL)" row and a multi-store
  "Dump MMKV store" (lists every file under `files/mmkv` and its keys).
- Summary/status line shortened so it fits one line on a 1080-wide screen.

Still open:
- `Open profile of entered id` with the **own** numeric id opens
  `ProfileDetailActivity` but shows "Oops! Something went wrong". Opening another
  user's profile from the visitor page works, so this may be an app limitation for
  self-profile (own profile uses `UserCenterActivity`), not a patch bug.
- Direct chat / instant chat was not exercised end-to-end (would create a real
  conversation with a stranger).
- Remaining toggles (force English, text overrides, fake logout, device-id changes)
  were not exhaustively re-tested after 0.3.1.
- Profile/direct-chat numeric fallback is implemented but not tested with a second
  real numeric id.

## 0.3.1 changes (source)

- `PdbExtrasActivity`: root `FrameLayout` + insets padding; shorter status; 12
  hidden screens; schema row; multi-store MMKV dump; clearer labels.
- `PdbMenu`: opaque card background, still scrollable and capped at 65% height.
- `PdbDatabase`: exclude Firebase DB; `schema()`; null-safe message/visitor
  queries; clear messages when `users`/`messages` are absent.
- `PdbMmkv`: `dumpAll(Context)` + reusable `open(id)`; `resolve()` uses `open()`.
- `PdbTools`: `mmkvDump(Context)`.
- `gradle.properties` and `patches-bundle.json`: 0.3.1.

## Install/update signature note (learned the hard way)

Stock Pdb and patched builds have different signing keys. `adb install -r` cannot
cross that boundary (`INSTALL_FAILED_UPDATE_INCOMPATIBLE`). Updating from stock to
patched requires uninstalling, which **wipes app data/login**. `pdbdevice` also
uninstalls by design. If you need to preserve a logged-in session:

1. Install the patched build first, log in, and keep using patched builds signed by
   `~/.morphe-data/pdb-test.keystore`.
2. Do not temporarily restore the stock APK on the same emulator unless you are
   prepared to log in again.
3. If you must compare with stock, use a second emulator/AVD or a cloned user.

## Current blocker (2026-10-20)

After rebuilding 0.3.1, the emulator showed the login/onboarding screen because the
stock↔patched uninstall wiped the session. The 0.3.1 APK is installed and starts
(`primaryCpuAbi=arm64-v8a`, no crash). Waiting for the account owner to sign in
before continuing on-device checks of 0.3.1.

Commands after login:

```bash
export PATH="$HOME/tools/android-sdk/platform-tools:$PATH"
adb shell dumpsys activity activities | grep -m1 topResumedActivity
adb exec-out screencap -p > work/eval/after-login.png
```

Then open **Settings → Pdb Extras** and verify:
- header/status shows `Patch v0.3.1`
- popup background is opaque
- rows no longer slide under the status bar
- Database schema dump shows `pdb_app_go.db` / `profile_view_record`
- MMKV dump lists `files/mmkv/pdb` and keys (not "0 keys" only)
- Recent chats / Chat stats return the clear "not in SQLite" message, not a
  Firebase error
- Visitor digest / Profile view log return rows or a clean empty message

## Update 2026-10-20 — 0.3.2 … 0.3.5

### What changed

- **0.3.2** — defaults on the switches now mirror `PdbStartup` (read receipts,
  "see more", stay-signed-in default ON). MMKV dump switched from `getAll()`
  (unsupported) to key enumeration; per-account `pdb_<uid>` stores are scanned.
  DB tools now use the real `pdb_app_go.db` schema:
  `channel_info` (cid, streak_id, back_prompt_time, request_reply_tracked,
  request_reply_any_tracked, draft_text), `profile_feed`, `metric`,
  `profile_view_record`. Added a generic **Browse table** inspector and
  **Profile feed (local cache)**; `Recent chats` / `Search chats` fall back to
  `channel_info`; `Chat statistics` reports channel/draft/streak counts;
  `Streak radar` and `Unsent drafts` read `channel_info`.
- **0.3.3** — `PdbExtrasActivity` is temporarily `android:exported="true"` so
  `adb shell am start -n pdb.app/app.template.extension.pdb.PdbExtrasActivity`
  opens the screen while signed out. **Set back to false before a release.**
- **0.3.4/0.3.5** — MMKV's public `allKeys()` is stripped by R8 in this build.
  Enumerate keys by invoking the surviving private JNI entry point
  `allKeys(long, boolean)` with the `nativeHandle` field (0.3.5). Verified:
  `Dump MMKV store` lists 6 keys in `pdb`, including `XDeviceId` after
  `Randomize device id`.

### Tooling fix

- `tools/pdbdevice` used to **uninstall the package on every install**, wiping the
  signed-in account each build. It now installs with `-r` (upgrade in place) and
  only falls back to uninstall on a real signature mismatch.

### Verified on the emulator (0.3.5, signed out)

- Header/status: `Pdb Extras v0.3.5`, `Patch v0.3.5 · Pro + ads unlocked · Paused OFF`.
- Insets: after scrolling, rows stop below the status bar (first row y=170 on a
  144px status bar).
- Hidden-screens popup: opaque background, 12 entries, all live.
- Toggles: `Force English` ON persisted (`english=true`) across a force-stop,
  OFF persisted (`english=false`); defaults-true switches now show checked.
- Text override: `US` in feed country persisted as `country='US'`; cleared back
  to `country=-`.
- `Dump MMKV store`: directory + 6 keys, including `XDeviceId`, `auth_session_v1`,
  `enableNativeAd`, `global_time_offset`, `lastCMSTime`, `FirebaseFCMToken`.
- `Browse table` / `Recent chats` / `Chat statistics` / `Streak radar` /
  `Unsent drafts`: clean empty-state messages when the app DB does not exist yet.
- DB schema dump (0.3.1, signed in) showed the real tables above.

### Login blocker (important)

The rebuild after the last login had to uninstall (old `pdbdevice`), so the app is
signed out. **Google sign-in now fails** with:

```
This android application is not registered to use OAuth2.0 ... package name and
SHA-1 certificate fingerprint match ...
```

Reason: the patched APK is re-signed with `~/.morphe-data/pdb-test.keystore`, whose
SHA-1 is not registered in the Pdb Google Cloud OAuth client. Earlier login used
the **email verification** path (`More` → `Continue with email verification`), not
Google. To restore a session either:

1. Sign in with **Continue with email verification** (needs the account inbox), or
2. Add the pdb-test keystore SHA-1 to the OAuth client in Google Cloud.

### Next

- Log in via email verification.
- Re-test `channel_info` tools with real rows (Browse table → `channel_info`).
- Re-check premium/ads and in-app hooks after login.
- Before release: set the extras activity back to `exported="false"`, bump to
  0.3.6, rebuild, and keep `pdbdevice` upgrade-in-place.

## 0.3.6 — release build (2026-10-20)

- `PdbMmkv.value()`: treat MMKV's `""` answer for non-string keys as "not a
  string" and keep probing, so booleans/ints report their real value.
- `FeatureMenuPatch`: extras activity is `android:exported="false"` again. It is
  opened only from the app's Settings row; `adb shell am start` is denied.
- `gradle.properties` / `patches-bundle.json`: **0.3.6**.
- Built, installed with the fixed upgrade-in-place `pdbdevice`; **login
  survived** (`HomeActivity`, id `6398658`).
- Verified: Settings row and extras header both show v0.3.6; DB stats show
  `pdb_app_go.db` with `profile_feed: 46`, `profile_view_record: 2`,
  `channel_info: 0`; Browse table + Profile feed render real rows; MMKV dump
  shows 41 keys including `XDeviceId` / `access_token`; Tweaks still has
  `Mock you as pro user` ON and `debug AD` OFF; home ad container is empty.
- Full matrix: `docs/EVAL-0.3.6.md`.

## Soul page premium configs — server-side pro check (2026-10-21)

Problem the user reports: Soul tab → top-right filter button → "Preferences"
sheet → **Personality** / **Region** rows are marked Premium. Stock Pdb opens
a paywall; the patch's mock-pro lets the list open, **but choosing a value
fails**:

```
Oops! Something went wrong
need to be pro user to acces...
```

Confirmed twice on 0.3.6 (Emulator Pixel 9 Pro, patched build, logged in as id
6398658):

- Personality → "INTJ, ENTJ" → toast "need to be pro user to access".
- Region → Thailand (premium country) → same toast.

Findings:
- The generic title comes from `common_error_state` (res/values/strings.xml);
  the detail string is **server supplied** — it does not exist anywhere in the
  apk (grep over res + jadx sources).
- So: the mock-pro flag is client-local only. The Preferences *sheet* and the
  option lists open (local gate passed), but the update request is validated
  by the backend against the account's real subscription. Region/Personality
  changes are effectively "mostly backend features" as the user suspected.
- UI layout (stock, 1344x2992): Preferences sheet has Gender (free), Personality
  (premium → full 16 MBTI combos), Region (premium → US+Worldwide free option
  plus US/TH/UK/CN/MY/NL/CA/JP/AU/IL... list), toggle "Open to make new friends".
- Soul feed card layout: `Name ♀ age`, `🇺🇸 State, Country · MBTI`,
  `# Our MBTI compatibility: NN%`, About Me, action bar. **No profile/user id
  is rendered on the card** — relevant to the "show id next to user" idea.
- No HTTP/API logging in the release build; logcat shows only GC/SurfaceFlinger.

Next: find the API call that persists soul preferences and check whether the
request body carries any client-trusted pro field (isPro/vip/entitlement) that
a patch could set. If the server reads subscription from its own DB, this
cannot be fixed by a client patch.

## Root cause of the "need to be pro user" toast (2026-10-21)

Static analysis of the patched dex (`work/apktool`, `work/jadx`):

- The Soul/IRL preferences sheet is fed by `GET /api/v2/irl/feeds/filters`
  (`j07.f(tab)`, model `x17{results:[u17], showGenderPopup, showLGBTQPopup}`).
- Saving a filter is `PUT /api/v2/irl/feeds/filters?tab=…` (`j07.j`/`j07.t`),
  called from `x76.smali:1828` with a **single-entry** `singletonMap(key, value)`:
  `key = u17.id` (the filter id, e.g. gender/personality/region),
  `value = x7a.c()` (the chosen option). No pro/entitlement field is sent.
- The filter schema (`u17`) carries a per-filter `premium` boolean, so the *list*
  renders premium rows; the **write is validated by the server** against the
  account's subscription. The error detail text ("need to be pro user to
  access…") is not in the apk → server-supplied.
- The local unlock (`zdf.V()` → true, `mockIsProUser`) only makes the sheet and
  the option lists open. It cannot make the server accept a premium filter write.
  Conclusion: **premium Soul filters are not reachable by a client patch.**

## Plan proposed to the user (waiting for approval)

1. Confirm + log the root cause (this entry). Keep DEVLOG updated every step.
2. Prove it end-to-end with the real API: read the app's `access_token` from the
   app's own MMKV store (extras tool / uiautomator text), then call
   `GET/PUT /api/v2/irl/feeds/filters` from the host with curl. Capture the exact
   server error body and check whether any client-trusted field exists.
3. Deliver, in `0.3.7` (version bumped everywhere it is displayed):
   - a **friendly failure** instead of the raw "Oops / need to be pro user" toast
     for server-rejected premium writes (keep the previous value),
   - a client-side **Soul filter emulation** (locally hide feed cards whose MBTI /
     country does not match user-chosen preferences saved by the extras screen),
     so the *effect* of the premium filters is available without the server,
   - if feasible after recon: show the **profile id on Soul/explore cards**.
4. Rebuild, install (upgrade in place), verify each item on the emulator, and
   write `docs/EVAL-0.3.7.md` + DEVLOG entries.
5. Stop and ask the user for anything that blocks: a real Google Play
   subscription/trial (only real way to unlock these server features), a second
   account for chat/visitor tests, or OAuth SHA-1 registration.

## 2026-10-21 → 10-22 · v0.3.7 shipped · IDs everywhere + API recon

### Shipped in 0.3.7
- New patch **Show profile IDs on names** (`IdsEverywherePatch.kt`), default ON.
  - Profile contract = obfuscated **interface `jef`** (abstract `name()` + `getId()`).
    Implementors found by scanning all classes (`classDefForEach`): `v9f` (full
    model), `pdb/app/repo/user/BasicUser` (KEPT class — what the Soul feed
    renders!), `wr3`, `ei0`, `spc`, `v`, `zdf` (mock-pro class), `k5d`. `gy6` has
    no `getId()` → skipped.
  - Technique: for each implementor with concrete `name()`+`getId()`, rename
    original → `name$morphe`, add a fresh `name()` wrapper that calls it plus
    `getId()` and routes both through `PdbUi.decorateName(String,String)`.
  - Switch `morphe_ids_everywhere` drives a volatile static `PdbUi.IDS_EVERYWHERE`
    read by decorateName → bytecode ships always-on but inert until enabled.
  - Verified live: Soul card `୧ ׅ ann ⊹ ۫ . ♡ ۪ ੭ #3489345`; chats list rows
    `Anna_51 #6399656`, `EQMaster #3626783`, `Lims #2916473`, `わたし_290 #4538111`…
- `PdbMmkv.dumpAll` truncation raised 160→2000 chars (JWTs are ~300+ chars).
- v9f gotchas (for future patches): `name()`=field f, `getId()`=field b,
  `j0()`→`pdb/app/repo/Personality`, `l()`→first personality name,
  `D()`=field h (source?), `s()`=field g, `l1()`=field c (username-ish).
  `getDateJoined` does not exist; the no-arg long is `c0()`.

### API recon (premium Soul filters)
- Full `access_token` extracted via MMKV dump (JWT, user_id 6398658/chad_451).
- Endpoints (Retrofit interface `j07`): `GET /api/v2/irl/feeds/filters?tab=…`,
  `PUT /api/v2/irl/feeds/filters` (`@Body` map filterId→value),
  `…/lgbtq_confirm`, `…/gender_confirm`. Auth header `Authorization: Bearer …`
  (interceptor `e0d`), plus `X-PDB-Auth-Origin: client`.
- **api.personality-database.com is behind Cloudflare** — host-side curl gets 403
  (TLS fingerprint). API proof must run through the app's own client (idea for
  later: an in-app "API console" tool in Extras that runs requests with the
  app's Retrofit/OkHttp).
- User confirmed plan; asked to go further: in-screen power buttons, client-side
  limit extensions, a dedicated limits/settings page, and a **full redesign of
  the Pdb Extras page** (too advanced/unfriendly) → 0.3.8 work.

## 2026-10-22 · v0.3.8 → v0.3.9 · in-screen UI, Extras redesign, first real limit patch

### 0.3.8 — floating power button + Extras redesign + 0.3.9 follow-ups
- **Patch `HomeBubblePatch.kt` / extension `PdbBubble.java`** — draggable ⚡ bubble
  attached to the decor view from `pdb.app.HomeActivity.onCreate(Bundle)` (KEPT
  class, so the fingerprint is the declared type). Tap → PopupMenu with hot
  toggles. Pos saved in prefs. Switch `morphe_bubble` (default ON).
  Menu today: Show profile IDs · Disable read receipts · Pause Morphe ·
  Copy my profile ID · **Copy last viewed: <name>** · Open Pdb Extras.
- **`PdbUi.LAST_PROFILE_ID` / `LAST_PROFILE_NAME`** — recorded inside
  `decorateName()` on every profile render, which is how the bubble can offer
  "copy the profile you were just looking at" with no extra hooks. If the
  always-on `IdsEverywherePatch` is ever disabled this feature goes with it.
- **`PdbExtrasActivity` redesigned**: header + 5 tab chips
  (**Quick · Limits · Power · Data · Advanced**), shared result card under the
  tab bar (GONE until a tool runs), hot toggles write their volatile flag
  immediately (IDS_EVERYWHERE, NO_VISITOR_LIMIT).
- **Vision-check pass (Gemini)**: the old screen FAILED twice on leaked jargon —
  subtitle `pdb.app_preferences • MMKV ok` and EditText hints made of raw pref
  keys (`mockFeedCountryCode`, `whiteListHost`, `debugInstantChatUserId`).
  Fixed: subtitle is now `Pro unlocked · Ads off · Morphe active`, hints are plain
  ("Feed country — two-letter code, e.g. US, TH"), section labels renamed
  ("Device identity & chat connection", "Backend & identity overrides — leave
  blank to disable", "Diagnostics — every switch value"). Both tabs now PASS.

### 0.3.9 — first genuine client-side limit patch
- **Patch `limits/VisitorLimitPatch.kt` + `PdbLimits.java`.**
  - The limit: Pdb's visitor screen (`Lnjf`, fragment) keeps `visitsViewCount`
    and `visitsCardClickCount` in a **rolling 1-hour window**
    (`0x36EE80` ms, keys `visitsViewWindowStart` / `visitsCardClickWindowStart`)
    and shows the "take a break" sheet once **either reaches 3**, max twice a day
    (`visitPopupCount` < 2, `s0`). Enforced by the UI-state lambda `Ljjf->invoke()`.
  - The patch finds that lambda with a **Fingerprint on the string literals**
    `visitPopupDate` + `visitPopupCount` (class name is R8-obfuscated and
    `invoke()` alone is ambiguous), then replaces the two comparisons
    (`if-ge v0,v4,:cond_4` / `if-lt v6,v4,:cond_5`) with
    `PdbLimits.visitorLimitReached(viewCount, clickCount)` + `if-nez … :cond_5`.
  - `const/4 v4, 0x3` is **kept** — `:cond_3` is the target of an earlier branch,
    removing it breaks that jump. Register numbers are read off the matched
    instructions so a register reshuffle doesn't silently break it.
  - Extension returns the stock `>= 3` rule when the switch is off, so bytecode
    ships always-on and the toggle (`morphe_no_visitor_limit`) is hot.
  - Verified: `UserVisitStatusListActivity` opens with no VerifyError/crash.
- **Daily-counter reset** (`PdbLimits.resetDailyCounters`): deletes the app's
  day-scoped counters instead of writing 0 — MMKV is typed per key, so a
  type-flipping write would make the app's own read throw. 18 keys matched by
  prefix today (irl*, visits*, visitPopup*, enterChatTimes*, likeProgressGoingDone*).
  Verified: reported 18 keys dropped, no crash.
- **Honest limit taxonomy** (in the Limits tab and here):
  - *Client-side, extendable*: visitor-view rule, local daily counters.
  - *Server-side, NOT patchable*: premium Soul filters (personality/region) →
    `PUT /api/v2/irl/feeds/filters` answers "need to be pro user to access";
    coins/boosts/ad budgets.
  - *Not a limit at all*: "Wonder Chat waiting" is `common_waiting_for_connect`
    — a server-side match with a stranger. There is no client timer to skip, and
    `wonderChatOff` is just the on/off flag. Nothing to patch here.

### Tooling notes
- Two adb targets are attached: `emulator-5554` (the test device) and an
  unauthorised `192.168.10.212:5555`. **Always pass `-s emulator-5554`** or set
  `ANDROID_SERIAL`, otherwise every adb call fails with "more than one
  device/emulator". `tools/pdbdevice` needs `ANDROID_SERIAL=emulator-5554`.
- `agent-device` MCP tools returned an internal module error
  (`./back-mode.js does not provide an export named 'Et'`); uiautomator dumps +
  `input tap` via adb are the reliable path here.
- Vision check: `/home/madusha/dev/personal/vision-check/.venv/bin/visual-check
  check --image <png> --json --prompt-file <txt>`; treat UNCLEAR as not-verified.
- `mutableMethodBy` does NOT exist in morphe-patcher 1.8.0 — use
  `mutableClassDefBy(classDef)` then pick the method; `Fingerprint(strings=[...])`
  is the clean way to anchor on literals. `BuilderInstruction11n` exposes
  `narrowLiteral` (the `literal` field is protected); the label class is
  `builder.Label` (not `BuilderLabel`), branch target is `22t.target`.

## 2026-10-22 · v0.4.0 · power button on every screen

- `HomeBubblePatch.kt` now hooks **two** kept activities: `pdb.app.HomeActivity.onCreate`
  (as before) and `pdb.app.base.ui.BaseActivity.onCreate` — the shared base, so the
  bubble is reachable from every Pdb screen. Both fire on Home; the bubble tags
  itself (`PdbBubble.BUBBLE_TAG` checked with `findViewWithTag`) so exactly one is
  attached.
- Denylist in `PdbBubble.isExcluded` (class-name substring): Splash, Login, Story,
  InstantChatWaiting, PdbExtrasActivity — screens where a floating button is in the
  way (full-screen media/onboarding, and Extras' own UI).
- Verified on 0.4.0: HomeActivity = 1 bubble, `pdb.app.chat.ChatActivity` = 1 bubble,
  menu opens on the chat screen and `Copy last viewed:` follows the screen (it read
  `mel_708` from the chat header, having read `わたし_290` from a profile page).
- `PdbBubble` entry points: `onHomeCreated(Activity)` and `onActivityCreated(Activity)`
  both funnel into `schedule(activity)` → `attach(activity)` after a 600 ms delay.

## 2026-10-22 · release metadata audit (why Morphe Manager still shows 0.2.0)

Reported by the user after pushing: Morphe Manager shows **0.2.0** as the latest even
after re-adding the repo. Cause and findings:

- **The repo has no release past v0.2.0.** GitHub tags are only `v0.1.0` and
  `v0.2.0`; the v0.2.0 release carries a single asset `patches-0.2.0.mpp`.
  Morphe Manager resolves a source from the repo's **latest release**
  (`https://morphe.software/add-source?github=OWNER/REPO`), so 0.3.x/0.4.0 are
  invisible no matter what the working tree says. Pushing code is not releasing.
- **`patches-bundle.json` had a dead download_url** — it pointed at
  `…/releases/download/v0.3.5/patches-0.3.5.mpp`, and that URL **404s** (v0.3.5 was
  never published). The file advertised version 0.4.0 next to a broken link.
- **`patches-list.json` was frozen at 0.2.0** and listed only 15 patches, missing
  *Show profile IDs on names*, *Floating power button* and *No profile-visitor limit*.
  Its own NOTE says semantic-release regenerates it — but there is **no release.yml
  in this repo** (only `.github/build.yml.example`), so nothing ever did.

Fixes applied:
- `patches-bundle.json`: `download_url` → `…/download/v0.4.0/patches-0.4.0.mpp`,
  refreshed `description` + `created_at`.
- `patches-list.json`: regenerated with `./gradlew :patches:generatePatchesList` →
  version **0.4.0**, **18 patches** (the 3 missing ones now present).
- `patches/src/main/kotlin/util/PatchListGenerator.kt` (template code, now diverged
  deliberately): it took `File("build/libs").listFiles { … }.first()` — with several
  versions of the bundle in `build/libs` (which is normal locally) it generated the
  list from an **arbitrary, stale** bundle. That is exactly what happened here: it
  read `patches-0.2.0.mpp` and reported 0.2.0/15 patches. Now sorts by parsed
  version and takes the newest. CI is unaffected (one artifact there), but local
  `publish` runs would have shipped a wrong list.
- README: added the **add-source link** and the note that only a published release
  makes a version visible, plus table rows for the three newest patches.

Release facts worth remembering:
- Manager source URL: `https://morphe.software/add-source?github=madushas/pdb_patch`.
- Release asset name must be `patches-<version>.mpp` (matches the template's
  `downloadUrlTemplate` and the local `patches/build/libs/patches-<version>.mpp`).
- The bundle's own version comes from `META-INF/MANIFEST.MF` inside the `.mpp`,
  written from `gradle.properties` `version` — verified `0.4.0` in
  `patches-0.4.0.mpp`.

### `tools/pdbrelease` (added with the audit)
Keeps the four version-bearing things in agreement and makes the release explicit:
`--check` (verify only), `--prepare` (build + regenerate `patches-list.json` +
sync `patches-bundle.json` + commit), `--publish` (also `git push` + `gh release
create`). `--check` currently passes at 0.4.0 / 18 patches / v0.4.0 asset.
`gh` is installed and authed as `madushas` (scopes: repo, read:packages, project).

## 2026-10-22 — Why Morphe Manager showed 0.2.0 / "metadata unavailable"

**The push was fine.** `main` was already at `f1065f8`; commits `dfce18c` + `f1065f8` were on GitHub. The problem was that **no release existed past `v0.2.0`**.

How the Manager actually resolves `github=OWNER/REPO` (verified in `MorpheApp/morphe-manager`
source, `PatchBundleRepository.normalizeRemoteBundleUrl` + `MorpheAPI.rawPatchesBundleRequest`):

1. `github.com/OWNER/REPO` → `https://raw.githubusercontent.com/OWNER/REPO/main/patches-bundle.json`
   (branch defaults to `main`; no releases API involved).
2. That JSON supplies `version` + `download_url` (DTO `PatchesReleaseInfo`, all 5 fields required).
3. The Manager downloads `download_url` into `patches.jar`.
4. If that download fails, the source stays in `PatchBundleSource.State.Missing`, and the UI shows
   `sources_management_metadata_unavailable_hint` — the "metadata unavailable" notice. The version
   on screen is whatever was last installed successfully (0.2.0).

So with `download_url` pointing at a `v0.4.0` asset that did not exist, step 3 404'd → Missing.

**Fix applied:** created release `v0.4.0` on `madushas/pdb_patch` with asset `patches-0.4.0.mpp`
(922725 bytes, sha256 `0fa03ff3…a62093`), target `main`. Verified: latest release = v0.4.0, raw main
JSON = 0.4.0 → same URL, asset returns HTTP 200.

Note: `gh release create --target <sha>` fails with 422 (`target_commitish is invalid`); use
`--target main`.

**Remaining manual step:** in Morphe Manager, refresh the source (or remove + re-add
`https://morphe.software/add-source?github=madushas/pdb_patch`).

## 2026-10-22 · Manager showed "0 patches" — dex-less bundle (v0.4.1)

**Symptom:** After releasing v0.4.0, Manager updated the source to 0.4.0, listed Pdb as an app,
but showed 0 patches.

**Root cause:** Morphe Manager loads patches from DEX, not .class:
`PatchBundle.Loader.validateDexEntries()` throws "missing dex entries" for a jar without
classes.dex (source: MorpheApp/morphe-manager .../patcher/patch/PatchBundle.kt). Our .mpp was
built with plain `:patches:build`. The gradle plugin (morphe-patches-gradle-plugin,
PatchesPlugin.configurePublishing) has a separate **`buildAndroid`** task that runs D8
(minApi 26) and merges classes.dex into the .mpp; only `publish` depends on buildAndroid,
so CI releases are dexed but local `build` output is not. The app list still appeared because
the Manager reads patches-list.json from the repo, not the bundle.
Also: settings plugin needs GITHUB_ACTOR/GITHUB_TOKEN (or gpr.user/gpr.key in
gradle.properties) or plugin application fails with bare IllegalArgumentException
(SettingsPlugin.configureDependencies).

**Fix (v0.4.1):**
- tools/pdbrelease now runs `:patches:buildAndroid` and greps the .mpp for .dex before shipping.
- Rebuilt, regenerated patches-list.json (0.4.1 / 18 patches), synced patches-bundle.json,
  pushed 72ce3d6, released v0.4.1.
- Verified: dex contains 49 patch classes incl. the 3 new patch names; chain
  raw-main bundle (0.4.1) -> download_url 200 -> patches-list 0.4.1/18 -> latest release v0.4.1.
- v0.4.0 release left on GitHub as the broken artifact (history); Manager will offer 0.4.1.

**Cache note:** Manager skips re-download when version AND createdAt are unchanged; the
fresh created_at in patches-bundle.json forces the refresh.

## 2026-10-22 · v0.4.1/v0.4.2 assets were STILL dex-less — the generatePatchesList overwrite trap (v0.4.3)

**Symptom after the v0.4.1 "fix":** Manager on the phone still showed 0 patches / 1 app.
Reproduced on the emulator by installing Morphe Manager 1.35.0 (same version as the phone)
and adding the source. logcat gave the exact error:

    E Morphe Manager: Failed to load bundle Pdb Patches
    E Morphe Manager: java.lang.IllegalStateException: Patch bundle is missing dex entries
        at app.morphe.manager.patcher.patch.PatchBundle$Loader.validateDexEntries(SourceFile:121)

**But the GitHub v0.4.1 asset had no dex** (922,726 B, no classes.dex), while the local
post-buildAndroid file had it. Root cause was in tools/pdbrelease itself:

    ./gradlew :patches:buildAndroid      # dex merged in
    unzip -l ... | grep .dex             # verify PASSED
    ./gradlew :patches:generatePatchesList   # <-- dependsOn(`build`) re-ran `jar`,
                                             #     OVERWROTE the .mpp with a dex-less jar

The dex verify ran BEFORE the list regeneration, and the regeneration silently undid the
dexing. Both the v0.4.1 and (from a leftover duplicate call after my first edit) the v0.4.2
uploads shipped the dex-less jar. Lesson: after ANY gradle task, the dex check must re-run;
the asset must be verified byte-for-byte ON GITHUB, not just locally.

**Intended release flow (pdbrelease --prepare now encodes this order, hard-fails otherwise):**

1. `./gradlew :patches:generatePatchesList` FIRST (runs `build` → dex-less jar is fine here;
   patches-list.json is regenerated from the newest .mpp in build/libs)
2. `./gradlew :patches:buildAndroid` LAST — D8 (minApi 26) merges classes.dex into the .mpp
3. Verify `.dex` in the .mpp AFTER the last gradle task (fails the release otherwise)
4. Sync patches-bundle.json (version + download_url), verify all three files agree, commit
5. `--publish`: `git push origin HEAD` + `gh release create v<version> <asset>`
   (needs GITHUB_TOKEN in env; fails fast if missing)
6. Download the released asset from GitHub and verify it has classes.dex — the upload is
   the artifact that matters, not the local file

**Verification on the emulator (Manager 1.35.0, same as the phone):** deleted the source,
re-added github.com/madushas/pdb_patch, tapped Update → sheet now shows
"Pdb Patches 0.4.3 · Patches 18 · Apps 1" (screenshot: work/eval/morphe-manager-source-043.png,
vision-check PASS). Logcat shows no load error.

**gh_token.txt:** removed from tools/pdbrelease — GITHUB_TOKEN now comes from the
environment only (fail-fast in --publish). The file stays local + gitignored.

**Broken releases left on GitHub:** v0.4.0, v0.4.1, v0.4.2 assets are dex-less; Manager
never reads them once patches-bundle.json on main points at v0.4.3. Kept for history.

## 2026-10-24 · v0.5.0 — Morphe v2 format, multi-app bundle, repo renamed

**Morphe v2 upgrade.** Morphe released v2 on 2026-10-22 (patcher 2.0.0, plugin
`app.morphe.patches` 2.0.0, Gradle 9.8.1, Manager 2.1.0). Migration for this repo:
- `settings.gradle.kts`: plugin 2.0.0; `libs.versions.toml`: morhe-patcher 2.0.0
  AND **smali = 4220ae75f7** (the old pin `d92701d947` breaks buildAndroid with
  R8 "Classpath type already present: com.android.tools.smali.dexlib2.iface.ClassDef").
- Gradle wrapper 9.8.1 — copy the wrapper properties from the v2 template; the old
  `distributionSha256Sum` pins the OLD distribution and fails verification.
- `PatchListGenerator` package `app.morphe.util` → `util` (mainClass updated).
- Fingerprint old-style constructor (definingClass/name/returnType/parameters)
  still valid in 2.0.0; raw `strings` lists now match EXACTLY (we don't use them).
  Resources decode on request (only the manifest up front — our resource patches
  only touch the manifest, fine).
- `returnEarly`/`returnLate` now live in the patcher
  (`app.morphe.patcher.util.BytecodeUtils`); our shared fork still compiles, so
  not switched yet. `clearBody`/`ensureRegisters` remain template-side helpers.
- Morphe Desktop CLI needed for v2 bundles: **v1.19.0** (v1.18.1 cannot load
  `Patcher-Version: 2.0.0` bundles — PatchLoader throws). Now at ~/tools/opt/.

**Multi-app merge.** MyDialog patch tree moved into this repo
(`patches/.../patches/mydialog/{MyDialogFingerprints,security/{DisableSecurityChecks,DisableSslPinning,MockSim},trackers/{DisableTrackers,DisableAppsFlyer,DisableCleverTap,DisableFirebasePerf}}.kt`);
`Constants` now carries `PDB_COMPATIBILITY` + `MYDIALOG_COMPATIBILITY`. Bundle
renamed "Pdb & MyDialog Patches" — 25 patches (11 pdb-tagged + 7 mydialog-tagged
+ 7 universal), verified in patches-list.json.

**Rename collision.** `morphe-patches` was taken (user's own template fork,
madushas/morphe-patches, fork of MorpheApp/morphe-patches-template with
semantic-release history). First `gh repo edit --rename` silently failed; pushing
then hit the FORK's main (behind 710). Renamed to **madushas/morphe-patches-custom**
(via `gh repo rename --yes`; `gh repo edit --rename` is not a valid flag in this gh
version). If the cleaner name is wanted: delete the template fork, then
`gh repo rename morphe-patches` + URL sweep + re-release.

**Release v0.5.0** (morphe-patches-custom): dexed asset verified on GitHub
(1,085,517 B, classes.dex present), raw main patches-bundle.json → 0.5.0 →
correct download_url, patches-list.json 0.5.0/25. Manager E2E on the emulator:
added source `github.com/madushas/morphe-patches-custom` → sheet shows
0.5.0 · Patches 25 · Apps 2 (screenshot work/eval/morphe-manager-multisource-050.png).
Manager app picker now lists BOTH MyDialog v18.6.5 and Pdb v2.134.6.

**MyDialog v2 smoke test**: patched with the merged bundle (7 patches incl. mock SIM),
installed on emulator-5554, first-launch flow identical to v1 (notification prompt →
language screen → server-side NO IMSI gate). A false "regression" (activity closing
instantly) turned out to be timing: dumps taken before the permission dialog opened;
`pm clear` + patient dumps show the same working flow. The app survives launch with
all security checks neutered.

**tools/mydbuild** now lives here: consumes the newest .mpp (built by pdbbuild),
patches ../mydialog_patch/mydialog-18-6-5.apk (MYD_APK_DIR overrides), supports
MYD_MOCK_SIM=1, --install to $MYD_SERIAL (default emulator-5554).

**Shady/invasive scan of MyDialog 18.6.5** (full detail in chat + RECON doc):
device fingerprint posted to getDeviceStatusOnboarding (persistent composite id),
AppsFlyer (incl. logLocation capability, OneLink attribution), CleverTap full
profiling (ct_* UI event tracking, profile push, device-network-info reporting),
Facebook AppEvents (auto-log), Firebase Analytics/AdID ON, NIC passed as URL param,
ad-tech names (ironsource/applovin_max/appodeal) present in the bundle with no ad
unit IDs (dormant), GMA SDK bundled with AD_MANAGER_APP=true. NOT found: no security
stack exfiltration (checks are local-only), no contact/SMS upload paths, no clipboard
snooping, no accessibility/device-admin abuse. sqlcipher bundled (encrypted store).
