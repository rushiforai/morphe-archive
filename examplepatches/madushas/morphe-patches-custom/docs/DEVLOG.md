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

## 2026-10-26 — v0.5.4: PDB 2.135.1 retarget + simplification + Chat directly; MyDialog FAB/footer
PDB (2.134.6 → 2.135.1, APKPure Pdb_2.135.1_APKPure.xapk, verified Play-signed:
signer 1343aefb… + Google SourceStamp; base.apk extracted from the xapk):
- BaseActivity → obfuscated ez0 (31 pdb.app activities extend it) — HomeBubblePatch
  re-anchored; all other fingerprints are string-based and survived the R8 shift.
- ALL 11 PDB patches apply on 2.135.1 (verify: pdbbuild output).
- Soul rewind/history: gate = faf.W() (reads mockIsProUser pref first) — our Unlock
  Pro patch + pref write cover it; the "missing undo" was just the stale 2.134.6
  bundle not matching 2.135.1. No new patch needed. VERIFY on device.
- Extras page REWRITTEN (PdbExtrasActivity 980→~200 lines): single page, six everyday
  switches only; always-on list documented on-page; dev-screen row removed from
  settings injection (FeatureMenuPatch DEV_ID dropped) and from SettingsEntryHook.
- Bubble menu: "Pause Morphe" → "Chat directly" (PdbBubble.chatDirectly):
  PdbDatabase.channelForUser() resolves user→channel via the app's IM room DB
  (channel_members ⋈ channels; schema captured from e30/g30 CREATE TABLE strings),
  opens pdb://chat/{type}_{id}; no channel yet → pdb://u/{id} profile fallback.
  (Channel creation needs POST /api/v2/chats/create — deliberately not faked.)
- Profile-ID toggle now shows PdbTools.restartDialog() ("takes effect after
  restarting the app" + Restart now/Later) instead of a toast — bubble + Extras.
  restartApp() = launcher intent CLEAR_TASK + killProcess.
- decorateName(name, id, profile): badges via reflection on the profile object —
  ✓ verified (manual/auto/faceVerified), ★ pro (proStatus.isPro), ◆ isMod;
  wrapper now passes the implementor (IdsEverywherePatch 3-reg → same frame, extra arg).
  Reflection degrades silently to id-only on obfuscation drift.
- NOTE: 2.135.1 APKPure base.apk is arm64-only; x86_64 emulators crash in
  MMKV dlopen (EM_AARCH64 vs EM_X86_64) — device testing only.
MyDialog (0.5.4, verified live on the emulator):
- NEW RemoveAiFabPatch (raw resource patch, Hermes same-length byte edits + SHA-1
  trailer fix): fabItems→fabItem0 kills the server-driven AI FAB (pure JS, zero
  native consumers); fabImage→fabImag0; footer "Device ID"→"ID ⚡5.4" (bump the
  label text each release). App-version row untouched (values feed API bodies).
- Verified on emulator: 0 fab nodes in dump; menu footer shows patch id next to
  the device id (value redacted).
Release: v0.5.4 published + GitHub asset verified (dexed, contains both new patches).

## 2026-10-26 — v0.5.5: Soul history (local), honest "Mock Pro", like-hook register lesson
- User confirmed: most pro features are SERVER gates; renamed "Unlock Pro" →
  "Mock Pro (client-side)" everywhere (patch name/description, README, docs/pdb.md,
  patches-bundle.json) with explicit "server-validated entitlements still refuse".
- Soul rewind/history: gate faf.W() (mockIsProUser pref first) is ALREADY covered
  by the pro patch — missing rewind on device = stale 2.134.6 bundle; on 2.135.1
  verify the Rewind button on the Soul header.
- The "20 soul limit" (likes beyond ~20 don't list) = the server's short feed
  window; answers it with a LOCAL feature instead of fighting the server:
  NEW "Soul history" patch: fingerprint = ordered string filters
  [string("irlTotalLiked"), string("vote")] → the soul-feed like method
  (lm6.m(Lu4b;Lejd;)V in 2.135.1); injects
  invoke-static/range {p1 .. p1} → PdbUi.recordSoulLike(card).
  PdbUi now keeps a capped-200 MMKV history ("morphe_soul_history") of every
  decorated profile (decorateName → recordSoul("seen")) + like marks
  (recordSoulLike reflects getId/name off the card's user field);
  PdbUi.showSoulHistory(Activity) = dialog (tap → pdb://u/{id}, long-press → copy).
  Bubble menu: Chat directly / Soul history / Copy my ID / Copy last viewed / Extras.
  Extras page gained a "Power" section with the same entry.
- REGISTER LESSON (cost 4 builds): the inline smali compiler SILENTLY DROPS the
  dummy method (→ "Collection is empty") when a plain invoke-static references
  pN mapped to a register > v15 (this method: .registers 31). Use
  invoke-static/range {pN .. pN} whenever the target method's register count
  exceeds ~18. Also: single-literal "vote" fingerprints are ambiguous —
  w76.i (Compose lambda) also contains it; ordered two-literal filters fix it.
- Verified: all 12 patches apply on 2.135.1; smali of the patched APK shows the
  injected invoke-static/range at lm6.m entry; released v0.5.5 + GitHub asset
  dex-verified.

## 2026-10-26 (later) — 0.5.5 fix: native Soul history screen with per-entry Chat
- User feedback: bubble "Chat directly" on the CURRENT profile is pointless (the
  app already shows Chat there) — the value is chatting with PAST souls.
- NEW SoulHistoryActivity (native screen, registered non-exported in the merged
  manifest by FeatureMenuPatch alongside PdbExtrasActivity): rows = 🧡-mark +
  name + #id + relative time; tap row → pdb://u/{id}; Chat button →
  PdbTools.openChat(id) (channel_members ⋈ channels → pdb://chat/{type}_{id},
  else profile fallback); long-press → copy id. Bubble "Chat directly" removed;
  bubble + Extras "Soul history" now open the native screen.
- Same-version redeploy per user: v0.5.5 release deleted + recreated with the
  fixed asset (dex-verified on GitHub: SoulHistoryActivity + openChat present).
- Commit ab73dfa pushed.

## 2026-10-27 — 0.5.5 fix #2: Chat links, timestamps, native styling (device feedback)
- Chat buttons dead: the app's router (u8c.R, decoded via --single-class jadx)
  parses the chat deep link as pdb://chat/{channelType}:{channelId} — it splits
  pathSegments[1] on ":" (the ==1-split branch opens /chat/massaging with an
  EMPTY channelType → invisible no-op). Underscore was wrong. → colon format.
- "0 mins ago" everywhere: decorateName fires on EVERY list bind (explore rows,
  chat headers, recomposition) → same-second bursts of "seen" records. Now an
  upsert per id: re-see within 30 min only refreshes position, not time; likes
  always update and never decay back to seen. lastSeen window widened 4s→30s.
- Bad UI: rebuilt the screen from the app's own resources — content_bg_r8 cards
  (PdbUi.card), gray_01/03 + main palette text, white bold text on a main-colored
  20dp pill for Chat, per-row tap/long-press unchanged. Empty state is a card.
- Same-version redeploy (user's policy): v0.5.5 deleted+recreated; GitHub asset
  dex-verified (SoulHistoryActivity present). Commit e164fc9.

## 2026-10-27 (post) — release-asset trap recurred and is now understood fully
- Manual `gh release create` after `tools/pdbbuild` shipped a DEX-LESS asset again:
  pdbbuild runs generatePatchesList (→ `build` → re-jar) AFTER any buildAndroid,
  silently stripping classes.dex. The 0.4.1 lesson generalizes: **the ONLY valid
  final build step before publishing is `:patches:buildAndroid`, and the asset on
  GitHub must be byte-verified (dex present + extension.mpe contains new classes)
  before claiming the release.** pdbrelease --publish enforces this; manual
  `gh release create` does not. Fixed by running buildAndroid last + verifying the
  downloaded asset (classes.dex present; extension.mpe is a raw DEX — "dex\n035" —
  not a zip; verify with `strings`, not unzip).
- v0.5.5 deleted + recreated with the correct 1,108,448-byte asset; verified:
  classes.dex present, extension.mpe contains SoulHistoryActivity (6 hits).

## 2026-10-27 — 0.5.5 fix #3 (device-verified): deep links need a HOST
- User: Chat buttons still dead after fix #2. Live device debug (screencap + am
  start with fake ids): pdb://chat/… and pdb://u/… → router's BLANK fallback
  screen. Root cause: u8c.R routes on PATH SEGMENTS (segments[0]=="chat"/"u"),
  so a host-less URI puts the route in the URI AUTHORITY and never matches.
  The app's own links carry a host (pdb://pdb.app/chat_notify/...).
- Correct forms (verified live: pdb://pdb.app/u/{id} opens a real profile):
  chat → pdb://pdb.app/chat/{channelType}:{channelId}
  profile → pdb://pdb.app/u/{id}
- Fixed PdbTools.openChat, PdbUi.showSoulHistory rows, SoulHistoryActivity rows.
  (Direct channel-create via API still deliberately avoided; fallback = profile.)
- Same-version redeploy v0.5.5 (deleted+recreated); GitHub asset verified:
  classes.dex present, extension.mpe contains the host-form links. Commit 0330d7a.
- Device-debug notes for future: uiautomator dump fails on this app ("could not
  get idle state" — RN/Compose animation loop); use screencap + read instead.
  Non-exported extension activities can't be am-start'ed from shell (SecurityException).

## 2026-10-28 — v0.5.6: dark-mode injected screens, soul-only history, profile Chat menu
- User device feedback round 2: (1) history screen light in dark mode, (2) thought-
  bubble users polluting history, (3) profile has no chat CTA, (4) more patch ideas.
- Dark mode: the app's appearance pref is MMKV "dark_mode" (-1 system/1 light/2
  dark, ij6 appearance picker → AppCompatDelegate, which plain activities ignore).
  PdbUi.isNight() reads the pref via new PdbMmkv.getNumberAnyStore (int-or-long
  search across stores), falls back to system uiMode; palette helpers
  pageBg/cardBg/mainText/subText + themedCard; SoulHistoryActivity + PdbExtras
  rebuilt on them. PdbUi.color(null-name) hardened (NPE guard).
- Soul-only history: decorateName now records "seen" ONLY for the soul-card user
  class, learned from the like hook (PdbUi.soulClass persisted in MMKV
  "morphe_soul_class"); likes always recorded. Before the first like, no seen
  rows (bootstraps on first swipe-like).
- Profile Chat entry (ProfileChatEntryPatch): stock scf (profile detail) has NO
  chat CTA — chats exist only via server-created channels (matches/bubbles/
  wonder). Added honestly: "Chat" item in the profile ⋯ overflow menu
  (scf.onClick, cra(id 0x4d0f0001, icon ic_menu_group_chat, flags 0x1fe0)) +
  branch in m9f.onClick case-3 → PdbTools.openChat(ctx, faf.getId()) — channel
  exists → real chat; else profile fallback (no fake channel creation).
  openChat(Activity→Context). Verified in smali: both injections clean (the
  patcher folded our label into the existing :cond_c chain).
- Inline-smali lambdas note: morphe's indexOfFirstInstruction filter is a
  RECEIVER lambda (use `this`, not an explicit param) — cost 2 compile rounds.
- pdbbuild re-stripped the dex again (generatePatchesList after buildAndroid) —
  caught by pdbrelease --check before publish this time; buildAndroid re-run last.
- Released v0.5.6 (32 patches): GitHub asset verified (dex + extension contains
  morphe_soul_class/dark_mode). Commit bc44929.

## 2026-10-28 (later) — standard release notes (Manager changelog), pdbrelease upgrade
- User: our releases "look dumb" vs hushgram/morphe-patches in the Manager. Verified:
  the official bundles put a SEMANTIC-RELEASE-STYLE MARKDOWN CHANGELOG into
  patches-bundle.json "description" ("## [1.48.0](compare-url) (date)" +
  "### 🐛 Bug Fixes" / "### ✨ New Features" with commit links) — the Manager renders
  that description as the source's release notes. Ours was a one-line description.
- tools/pdbrelease now: gen_notes() builds the same shape from git history since the
  previous v* tag (feat→✨ / fix→🐛 / perf→⚡ / other→🧹, release:/chore commits
  skipped, sha links), writes notes-<ver>.md, --prepare injects it into the bundle
  description + created_at, --publish uses --notes-file for the GitHub release,
  --check warns when the description lacks the version header.
- v0.5.6 re-released with hand-written notes (the feature work had been squashed into
  the release commit — future discipline: feat:/fix: commits BEFORE --prepare, so the
  generated changelog is real). GitHub asset dex-verified; raw bundle.json now
  carries the version changelog. Commit 7215831.

## 2026-10-28 (final) — morphe-patching skill created (system-wide)
- ~/.agents/skills/morphe-patching/ : SKILL.md (workflow + trap table) +
  references/{recon,patching-cookbook,build-release,device-testing,traffic-inspection}.md
- Captures the full pipeline from this repo's history: recon → fingerprints/injection
  (register rules, escaping, rename+wrapper, hermes, extension lib) → build ordering →
  device testing (PII redaction, uiautomator idle failures) → release (Manager
  resolution chain, dex verification, semantic-release changelog) → MITM recipe →
  honesty rules (client vs server gates).
- Registered and live in the agent's available skills (verified by the harness).
- Release-notes standardization (same day): pdbrelease generates semantic-release
  changelogs into patches-bundle.json description + --notes-file for GitHub;
  v0.5.6 re-released with proper notes (asset dex-verified).

## 2026-10-28 (late) — missing CHANGELOG.md suppressed the Manager update badge
- User: after 0.5.5→0.5.6 the Pdb app entry in Manager shows no "update available".
- Manager 2.1.0 source traced (morphe-manager): the badge compares the bundle version
  stored AT PATCH TIME (AppliedPatch.bundleVersion / SelectionPayload) vs the source's
  current version, then REFINES via the repo's CHANGELOG.md:
  RemotePatchBundle.fetchChangelogEntries() fetches
  raw.../<owner>/<repo>/<branch>/CHANGELOG.md (derived from the bundle endpoint);
  parseChangelog() maps a 404 to EMPTY LIST (not an error!); empty entries pass the
  null-check and hasChangesFor(empty)=false → badge suppressed. The intended
  "no changelog → show badge" fallback never fires on 404.
- Changelog subject matching (ChangelogParser.SubjectMatcher): scoped bullets
  `**Scope:**` match the app's displayName ("Pdb") or its sub-scope before " - "
  ("Pdb - Soul history"), or distinctive package segments; unscoped bullets match
  whole-word app names or `patch name` in backticks. otherAppNames guard (Pdb vs
  MyDialog in one bundle).
- Fix: CHANGELOG.md added at repo root (full 0.5.1→0.5.6 history, official format);
  pdbrelease --prepare now prepends/replaces the version section automatically.
  Verified with a Python port of the parser: Pdb badge=True for 0.5.5→0.5.6,
  MyDialog=False (correct — 0.5.6 has no MyDialog changes). Commit 16ffa6c; fetched
  from the branch, so no re-release needed. User must refresh the source in Manager.
- Skill updated: build-release.md now documents the CHANGELOG.md requirement.

## 2026-10-29/30 — bisection saga: chat→profile blank ANR (what went wrong and what we learned)
Bug: on the ZTE and the x86 emulator (both, 2.135.1 full patch set), chat-header →
UserProfileActivity renders BLANK, then "no focused window" ANR. Also reproduced via
a plain `pdb://pdb.app/u/{id}` VIEW intent — so openChat's link was not the cause.

What was tried and what it taught:

1. **Bisect builds were silently invalid (biggest waste).** Manual morphe-desktop CLI
   runs without `MORPHE_DATA_DIR=$HOME/.morphe-data` picked up the JAR-adjacent
   keystore (d31ad05f… cert) instead of the project keystore (eb443131…, CN=Morphe).
   Every `adb install -r` then failed with INSTALL_FAILED_UPDATE_INCOMPATIBLE while
   the script's `| tail -1` hid the error — so the "minimal" builds I tested were
   actually the OLD install. LESSON: always export MORPHE_DATA_DIR before manual CLI
   runs; after install, verify `dumpsys package | lastUpdateTime` CHANGED, or verify
   the cert SHA-1 matches. (Now pinned in memory #25.)

2. **Emulator boot prerequisites for Pdb 2.135.1.** A truly-minimal patch set cannot
   boot on the x86 emulator:
   - without "Disable trackers": Crashlytics dlopens arm64 `libcrashlytics.so`
     through the native bridge → not found → process dies at launch.
   - without "Bypass PairIP license check": the app itself calls `System.exit(0)`
     after LicenseActivity (logcat: "System.exit called, status: 0").
   Minimal WORKING bisect base = standalone-install + relocate-MMKV + trackers +
   PairIP (4 patches). With exactly that, chat→profile RENDERS FINE on the emulator.
   → The blank-profile bug lives in one of the other 10 patches. Prime suspects:
   Show profile IDs on names (wraps name getters), Floating power button,
   Pdb Extras, Soul history. NOT yet bisected further — test env degraded first.

3. **Cross-app screenshot contamination (fake evidence).** vision-check kept
   reporting "blank black screen" — some of those screenshots were of OTHER apps
   (Strava was foreground at one point; its login page read as "blank"). My taps at
   Pdb tab coordinates landed in whatever app was foreground. LESSON: before any
   screencap-based verdict, check `dumpsys activity activities | topResumedActivity`
   and only trust screenshots taken while pdb.app is top. uiautomator dumps and
   screencaps can also disagree with each other (stale cache) — cross-check.

4. **Emulator data state degraded mid-debug.** After repeated reinstalls, list
   screens (Soul feed, Chats) render EMPTY with the app otherwise functional —
   looks like "no internet" but sockets to styx/personality-database are ESTABLISHED
   and the host can reach the API (403s are for host-side probes without app
   headers, not proof of a problem). Hypotheses: test-account session expired or
   server stopped serving this heavily-reinstalled test account; OR a bisect build
   (missing feature patches) hit a server-side config path we haven't mapped.
   NOT attributed to a patch. Next clean step: fresh login on the emulator with the
   full patch set, then re-test chat→profile; only then continue patch-level
   bisection on a stable, logged-in environment.

5. **Fixes that ARE solid regardless of the bisect outcome** (already built):
   - openChat is now async (worker thread, 800 ms timeout) — the original blocking
     DB read on the UI thread could ANR by itself; and it never deep-links to a
     user the app hasn't IM-cached (userExists() guard) because that provably
     opens the blank ANR screen. No-channel users get a toast instead.
   - "Relocate runtime MMKV copy" (default=false, expert) immunizes against the
     stale-arm64-.so boot crash on emulators.
   Both ship in the next release; the release will be cut from the STABLE set once
   the profile-blank culprit patch is found or the suspects are fixed.

### Correction (2026-10-30) — the "cross-app screenshot contamination"
Not an app-switch bug of ours: the user runs MULTIPLE agents on the same emulator
(another one was patching Strava at the same time). The lesson stands, sharper:
emulator-5554 is a SHARED device — verify topResumedActivity + install state before
trusting any UI evidence, and expect unexplained state changes (they may be the
other agent). The "empty data" state may also be co-agent interference — retest on
a quiet emulator before blaming patches or the account.

## 2026-10-31 — blank-profile repro matrix + new AVD facts (non-linear notes)
- [FACT] After server restart, emulator-5554 = DIFFERENT AVD (Pixel_9_Pro, API 36,
  ndk_translation present; abilist x86_64,arm64-v8a; app procs run NATIVE x86_64).
  The pre-restart AVD (sdk_gphone64_x86_64) refused arm64 .so (EM_AARCH64 crash);
  the NEW AVD runs the same installed build FINE — MMKV arm64 asset loads.
  => All "cannot boot" conclusions were AVD-specific. Re-verify on this AVD.
- [FACT] OLD full build (lastUpdateTime 10-30 04:13, pre-async-openChat, 14 patches)
  boots, session kept, chat list renders. chat→profile → UserProfileActivity
  resumes + main thread S (idle) + NO ANR + screen BLACK forever (VRI never
  visible for UserProfile; Home/Chat VRIs log normally). Same symptom as before,
  now on a quiet, logged-in emulator => REAL bug, not environment.
- [KEY] Window never becomes focusable/drawable for UserProfileActivity only;
  process healthy (FirebaseRemoteConfig heartbeats every 60s). Not PairIP
  (would kill), not MMKV (boot fine), not ANR (main idle). => something in the
  profile UI's first frame path — our injected hooks that run during profile
  content layout: IdsEverywhere decorateName (bind-time, every name TextView!),
  ProfileChatEntry menu build, bubble (all screens OK though), SoulLike (feed only).
  PRIME SUSPECT: decorateName loop/reflection blowup per-name → but would busy-loop
  main, not idle... OR first-frame never scheduled (surface attach fails) =
  Compose/View flag issue? NEXT: bisect = disable IDs patch only (full build minus
  IDs) → test. Then minus ChatEntry. Two builds decide.
- [NOISE] WhatsApp on this emulator crash-loops on its own SendReadReceiptJob NPE
  (12 crash entries) — stock app bug/co-agent, unrelated to pdb.app. Ignore.
- [ENV] Emulator reboots lose `su` (Pixel_9_Pro AVD has no root; RootEmu AVD did).
  files/ not readable without root; rely on app-side logs instead.
- [HYPOTHESIS-SHOT] ChatActivity → profile transition: profile opens INSIDE same
  task with a shared-element/animation; if our ID decoration changes the title
  TextView mid-transition, Compose may abort first frame. Test with IDs off.

## 2026-11-01 — bisect round: IDs-off build → SAME blank+ANR
- x86 input v2: rebuilt libmmkv x86_64 FROM SOURCE (MMKV v1.3.14 tag, cmake+NDK r27,
  short-JNI names match the stock arm64 lib 1:1; the 2.1.0 AAR lib was rejected:
  "Bad JNI version -4" — 2.x natives ≠ 1.3.14 Java). pdb_x86_rebuilt2a.apk.
- Build A (12 patches, NO "Show profile IDs on names", openChat-async ext included):
  boots, session kept, chat→profile → **STILL blank + ANR (no focused window)**.
  => IDs patch ELIMINATED as the culprit.
- Remaining suspects: Floating power button / Chat button on profiles / Soul
  history+like / Extras+resources / Mock Pro / visitor limit / Remove ads /
  Fix icon / PairIP / trackers. Next: -d "Chat button on profiles" (build B);
  if still blank → -d "Floating power button" (build C).
- Also noted: ANR dump on THIS avd lacks dropbox access (no root); use am_anr
  events + topResumedActivity + VRI logs only. WhatsApp on this AVD crash-loops
  (stock bug) and occasionally steals foreground — ignore.

## 2026-11-01 — CULPRIT FOUND: "Chat button on profiles"
- Build B (11 patches: IDs AND Chat-entry both disabled): chat→profile RENDERS
  (vision PASS, photo/tabs/content). Build A (IDs off, chat-entry ON): blank+ANR.
  => **ProfileChatEntryPatch's m9f.onClick / scf.onClick injection is the bug.**
- Root cause candidates in that patch: (a) injects into scf.onClick BEFORE the
  existing switch, assuming v13 (ArrayList) + b0() registers live at that index;
  (b) m9f dispatch: reads pswitch via z0 sget + assumes v15 = faf profile object.
  On 2.135.1 those register assumptions are stale → VerifyError/dead window at
  profile-menu init (scf constructed during profile content inflation).
- FIX: rebuild chat-entry against 2.135.1 bytecode (fresh register analysis), or
  drop it from the stable release (Soul-history rows already offer Chat).
- [NOTE] WhatsApp on this AVD steals foreground constantly (crash-loop relaunch);
  force-stop it before UI tests.

## 2026-11-01 — Root cause nailed (ProfileChatEntryPatch)
- The patch anchors on `new-instance Ldra;` in scf.onClick. In 2.135.1 that
  instruction exists but is a DIFFERENT menu (a divider/drag item, ctor
  (Context) only, built at :1934 AFTER the real cra menu list) — NOT the
  2.134.6 menu-item builder. The injected 12-instruction cra-builder block was
  inserted at that wrong site with garbage register state (v13 not an ArrayList
  there, v14/v22 not live) → VerifyError when scf.onClick first class-loads →
  profile window never draws → blank + "no focused window" ANR. In 2.134.6 the
  same anchor happened to be correct; the string class names never survive R8.
- LESSON (add to skill): never anchor instruction INJECTION on a bare class-type
  literal alone — pair it with the constructor signature (or a string literal
  inside the ctor args) and assert the surrounding register context (what holds
  the ArrayList, what holds `this`). Class letters reshuffle every build.
- Fix for stable release: drop "Chat button on profiles" from the default set
  (Soul-history rows already carry Chat); rebuild it later against cra-ctor
  (II 7-arg) + v13/v14 context.

## 2026-11-01 — FIXED & VERIFIED on emulator (v0.5.7 stable set)
- Full stable build (12 patches, chat-entry demoted to expert/default-off):
  chat→profile RENDERS (vision PASS). The multi-day blank+ANR is CLOSED.
- v0.5.7 bundle: 41 patches listed (Strava agent's 4 included in the catalog
  via stash-restore later — release must NOT ship their WIP: keep bundle at
  the committed state before strava stash; verify patches-list on release).
- Remaining: rebuild chat-entry properly (anchor cra-ctor + context asserts),
  then re-enable. Release 0.5.7 after user's OK.

## 2026-11-01 — Device feedback on 0.5.7: Soul history honesty pass (TODO list)
User report (real device): no crash ✓, but
1. ORDER WRONG: oldest on top, newest at bottom (expected newest first).
   [SUSPECT] recordSoul upsert: re-seeing a user MOVES the row to the end
   (next.put(row) appends) — that's correct for "most recent interaction",
   but showSoulHistory renders rows in ARRAY order = newest-LAST? Verify
   soulHistory() ordering vs the render loop; likely the JSON build puts the
   new row at the END and soulHistory() reads forward without reversing.
2. CHAT BUTTON always toasts "conversation not found" — the channel lookup
   (channel_members JOIN channels) fails even for users the user HAS chatted
   with. Workaround: tap name → profile → app's own Chat works. [SUSPECT]
   wrong DB (0.5.7 moved IM DB? schema renamed channel_members? or the
   join's userId vs targetUser column), or openChat runs before IM DB opened.
   Either way: honest UX = if no channel found, toast should say exactly that
   AND the fallback must OPEN THE PROFILE (it apparently doesn't today).
3. Make it honest: title should say "seen on device" semantics; if chat isn't
   possible, don't show a Chat pill that dead-ends — show "Open profile".
Plan: fix order (reverse render), fix channel query (log actual DB+schema on
device), chat pill → openChat with graceful "open profile" fallback, honest
toasts. Rebuild ext + release.

## 2026-11-02 — Soul history fixes verified on emulator (0.5.8 pre-release)
- Order FIXED: reversed render (soulHistory() now newest-first) — verified on
  the sdk_gphone64_x86_64 AVD (5556): latest profiles on top.
- Chat button: Helena_419's pill → **opened her profile** (graceful fallback,
  not a dead toast). "Conversation not found" toast seen earlier was the OLD
  build; the fallback path (userExists → pdb://u/{id}) works. NOTE: it falls
  back for users without a local channel even if you HAVE chatted — the
  channel_members JOIN may miss rows whose member rows live in a different
  DB file; needs the real device to confirm (user reported chatted users
  still toast). Honest UI plan: label the pill "Chat" only when a channel
  exists, else "Profile" — requires a channelExists(id) pre-check per row.
- Build recipe for local x86 tests: input = repo base + MMKV 1.3.14 x86_64
  (source-built) + PDB_ENABLE_PATCHES="Relocate runtime MMKV copy" (stale
  files/mmkv_1_3_14_64.so from older installs otherwise wins).
- AVD map: sdk_gphone64_x86_64 = 5556 (non-root), Pixel_9_Pro = 5554 (root,
  boots arm64 MMKV natively). WhatsApp on 5556 crash-loops; force-stop it.

## 2026-11-02 — Honest Chat/Profile pill VERIFIED (0.5.8 ext)
- SoulHistory rows now resolve channelForUser off-UI-thread: pill reads "Chat"
  only when a local channel exists, else "Profile" (opens the profile).
- Verified on RootEmu (5556): all rows on the test account correctly show
  "Profile" (no channels), ordering newest-first ✓ (0/1/2/3h timestamps).
- No Chat-pill case found on emulator (no real channels on test accounts) —
  needs the user's real device to verify the "Chat" label + direct open.
-adb direct-start of SoulHistoryActivity is DENIED (non-exported, by design);
  open it via power bubble → Soul history (works).
