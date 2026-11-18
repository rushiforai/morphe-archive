# Notes for agents working on Venus Patches

Read this before changing code, writing a release, a changelog entry or a pull request.

**Facts live in the code, not here.** The supported Discord version is `AppTarget` in `DiscordPatches.kt` (also
`DISCORD_VERSION` in `bootstrap.js` and the top of `README.md`; keep the three the same). The pinned bundle hash,
global-function constants and string IDs are in `HbcPrelude.kt` and `HbcPrivacy.kt`; module IDs are in `bootstrap.js`
and `scripts/hbc/port_check.py`; target counts come from `PrivacyTest.kt`. Never copy version numbers, module IDs,
hashes or counts into this file: they go stale on the next port.

## Never reply on GitHub

**Never post a reply, comment or review on a pull request or an issue**, and never close, label or react to one, unless
the user asks you to in that conversation. Read comments and issues to learn what to fix, then fix it in commits.
Only the user answers people on GitHub. Writing or updating a pull request's own title and description is fine.

## Release notes

Morphe Manager shows "What's new" from `CHANGELOG.md` on `main` (it derives the URL from
`patches-bundle.json`). It splits each release into cards — **App support**, **New**, **Fixes**,
**Improvements**, **Performance** — with one row per bullet and the bold scope as the small label above
it, like Morphe Patches. That only works in the conventional-changelog format below. Anything else
shows as one grey "Changes" block.

Every release, old or new, uses exactly this shape:

```markdown
## [1.6.1](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.6.0...v1.6.1) (2026-10-11)

### 🚀 Updated App Support

* **Discord:** Add support for `348.10 - Stable`

### ✨ New Features

* **Discord:** Add `Patch name` patch
* **Discord - NoDelete:** Show what an edited message said before

### 🐛 Bug Fixes

* **Discord - Message tap gestures:** Fixed tapping your own message three times opening the editor instead of deleting it ([#12](https://github.com/VenusIsJaded/Venus-Patches/issues/12))

### 🔧 Improvements

* **Discord - Venus settings:** Tons of UI changes across every settings page, including a theme gallery and livelier previews
* **Discord - Disable analytics:** Also block session heartbeats, search tracking and impression events

### ⚡ Performance Improvements

* **Discord - Hidden Channels:** Do less work while turned off
```

Rules:

- **Heading:** `## [X.Y.Z](compare link) (YYYY-MM-DD)`, newest at the top. The date is in UTC. Nothing goes above
  the first heading. Morphe ignores a heading without the date.
- **Sections:** only the five above, in that order, each at most once. Leave out empty ones.
- **App support always comes first.** `### 🚀 Updated App Support` is the first section of any release that has it,
  so the Discord version a release works with is the first thing you read. `scripts/release_notes.py --check` fails
  on any other order.
- **Summarize UI changes in one bullet.** Looks, layout, previews, animations, page redesigns, wording and other
  settings polish go in **one** bullet under 🔧 Improvements, like `* **Discord - Venus settings:** Tons of UI changes
  across every settings page, including …`, naming at most three or four highlights. Never write a bullet per page,
  per preview or per row. Still give their own bullets to new things you can do (✨ New Features), options that were
  removed or changed behavior (🔧 Improvements), and UI bugs users actually hit (🐛 Bug Fixes).
- **Bullets:** `* **Discord:** …` for the whole app, or `* **Discord - <Morphe patch name>:** …` for one patch.
  Use the patch name as it shows in Morphe (`NoDelete`, `Pastelize`, `Message tap gestures`, `Venus settings`…).
  One line, sentence case, no full stop, concise and informative (around 5–22 words).
- **Bug fixes always start with `Fixed` and give clear detail:** every bullet under `### 🐛 Bug Fixes` must begin
  with `Fixed …` and clearly explain both what went wrong and what it prevented or caused (for example,
  `Fixed tapping your own message three times opening the editor instead of deleting it`), so readers never have
  to guess whether the behavior was a bug that was fixed or an intentional change.
- Link an issue only when one exists: ` ([#37](https://github.com/VenusIsJaded/Venus-Patches/issues/37))`.
- **Never include:** "Good to know", "Install" or "How to update" sections, SHA-256 sums, test or patch-check
  results, notes about versions that weren't published or numbers that changed, internal module IDs, or
  "your settings carry over". Explanations belong in `README.md`, not in release notes.
- **Include every meaningful change:** list every new feature, every bug fix (including privacy leaks, background
  disconnects, or settings that misbehaved), general improvements and **privacy additions** under 🔧 Improvements,
  and **startup, patching, memory, or runtime speedups** under ⚡ Performance Improvements. Don't omit privacy
  coverage additions or performance work as "internal": users care about what tracking is stopped and how fast
  Discord starts and runs. Only leave out repo-only chores (docs, test scripts, CI config).
- A new feature means a minor version (1.6.0 → 1.7.0). Fixes, privacy additions, and performance improvements
  mean a patch version.
- Compare with the **previous release**, not with earlier commits. A bug in a brand-new feature added in the same
  release was never seen by users, so don't list it as a separate bug fix; however, privacy additions, fixes to
  existing patches, and app/startup performance improvements shipped in the release should always be listed.
- **Never list bugs that only existed inside the pull request.** Before writing a `Fixed …` bullet, check the
  previous release's code (`git show vX.Y.Z:patches/src/main/resources/venus/bootstrap.js`) and confirm users really
  had the bug. Breakage caused by work in the same pull request (a new feature, a refactor, or a port to a new Discord
  version) that was fixed before release isn't a fix. Ports are the usual trap: the previous release supported the
  old Discord version, so anything that only broke on the new one (a moved module, a renamed color, a changed function
  signature) never reached users.
- **Write the notes from the exact difference between the last release and this one, never from the pull request.**
  Before writing an entry (and before a pull request description that lists fixes), run
  `git log --oneline vX.Y.Z..HEAD` and `git diff --stat vX.Y.Z HEAD` against the previous release tag, and for every
  candidate bullet confirm with `git show vX.Y.Z:<file>` that the previous release really had the behavior. Only what
  changed for someone updating from that release goes in. A fix for something a commit in the same range broke, and
  every fix to a feature that is new in this release, are left out; the new feature gets one ✨ bullet instead.

## The GitHub release

The release body is that version's changelog entry and nothing else. The tag workflow
(`.github/workflows/build.yml`) builds the `.mpp` and publishes it; by hand:

```bash
python3 scripts/release_notes.py X.Y.Z > /tmp/notes.md
gh release create vX.Y.Z patches/build/libs/patches-X.Y.Z.mpp --title "X.Y.Z" --notes-file /tmp/notes.md
```

- The title is just the version. Attach only `patches-X.Y.Z.mpp`.
- If you edit an entry in `CHANGELOG.md`, update that release's body with `gh release edit vX.Y.Z --notes-file`.
  When a rule changes, rewrite every past entry to follow it and update every published release body.

## Releasing a version

1. Bump `version`, `releaseTag` and `releaseAsset` in `gradle.properties`, and `const revision` in `bootstrap.js`
   (the build fails if they differ).
2. Add the `CHANGELOG.md` entry at the top, as above.
3. `python3 scripts/build.py`, then `python3 scripts/build.py --metadata-only` to write `patches-bundle.json`. Its
   `description` is this version's changelog sections, which Morphe shows while its cached `CHANGELOG.md` is older.
   Never replace it with a sentence.
4. Update `README.md` if a feature or setting changed.

## How the runtime gets into Discord

Discord runs React Native in Bridgeless mode. Loading a second bundle before `index.android.bundle` marks React ready
early and flushes native calls before Discord registers `AppRegistry`, so Venus never does that. Instead:

- **Build** (`scripts/build.py`): compacts `bootstrap.js` with Terser (no mangling, ASCII only), splits it into a small
  eager header and lazily evaluated parts, and compiles it with the pinned `hermesc` to prove it's valid HBC98.
- **Patch time, on the phone** (`HbcPrelude.kt`): the user's feature selection replaces `/*__FEATURES__*/`, and the
  script is rebuilt from strings already in Discord's string table and run by a few HBC98 instructions placed at the
  top of global function `#0`, in the one bundle Discord loads.
- **Privacy** (`HbcPrivacy.kt`, `PrivacyPatches.kt`): pinned analytics, telemetry and crash-reporting functions are
  overwritten in place with tiny register-safe stubs; native trackers are stubbed in DEX.

`PrivacyTest.kt` enforces every safety rule for those stubs (expanded headers, no exception handlers, register
bounds) against the real APK, and `HbcPreludeTest.kt` checks the injection. Read their comments before touching
either file.

## Porting to a new Discord version

Everything below is pinned to one APK, so a port touches all of it. Work through it in order; each tool says what to
change and exits non-zero until it's right.

```bash
sh scripts/hbc/setup.sh Discord-NEW.apkm           # work/new/base.apk and the bundle (must still be HBC98)
python3 scripts/hbc/port_check.py                  # constants, moved modules, privacy targets, unchecked IDs
python3 scripts/hbc/privacy_targets.py work/new/assets/index.android.bundle --locate   # new Target(...) lists
VENUS_ORIGINAL_APK=work/new/base.apk python3 scripts/build.py   # PrivacyTest: every HBC and DEX target is safe
sh scripts/verify_apk.sh Discord-NEW.apkm          # patch with every patch (newest Morphe CLI) + VerifyApk
REUSE=1 sh scripts/verify_apk.sh                   # re-run VerifyApk on the last patched APK after fixing a check
sh tests/bench/cold_boot.sh <old bootstrap.js>     # the real bundle boots with the runtime injected
```

1. **Constants:** paste `port_check.py` section 1 into `HbcPrelude.kt` and `HbcPrivacy.kt`. Global `#0` must keep a
   compact header (`flags == 0x12`) and a frame of at least 4.
2. **Metro modules:** for every `[MOVED/CHECK]`, confirm the candidate with `scripts/hbc/hbc.py`
   (`B.show(id)`, `B.exports(id)`), then update `bootstrap.js` and `BOOTSTRAP_MODULES`, and run
   `python3 scripts/hbc/port_check.py --map` to regenerate `module-map.md`.
3. **Privacy targets:** regenerate the lists with `--locate`. Unnamed targets are found by their bodies; the comments
   next to them in `HbcPrivacy.kt` say how. Update the stub ID sets in `HbcPrivacy.kt` and `PrivacyTest.kt`.
4. **Native hooks:** when a DEX class or signature moved, inspect it with `scripts/hbc/DexInspect.kt` (usage at its
   top) and update `DiscordPatches.kt` / `PrivacyPatches.kt`.
5. **Version string:** `AppTarget` in `DiscordPatches.kt`, `DISCORD_VERSION` in `bootstrap.js`, `README.md`.
6. Check every feature in the patched app. Functions Discord changed (a toast API, a store getter) only show up there.

## Seeing the UI

**Use it before and after every UI change**, whenever you're asked to improve, review or change how anything in Venus
looks, and any other time it helps (an edge case, a long translation, a fresh install, showing what a page looks like).
Code can look right and still draw badly; the screenshot is what a user actually sees.

`tests/ui` draws the real `bootstrap.js` (every feature patched in) in Chromium, at a phone's width, with Discord's own
icons, gg sans font and color tokens taken from the APK, and saves screenshots you can open with the image viewer.

```bash
sh tests/ui/setup.sh                                   # once per sandbox, about a minute (work/ui; safe to rerun after a reset)
node tests/ui/shot.cjs features 'page=VENUS_PLUGINS'   # -> work/ui/shots/features.png
node tests/ui/shot.cjs nd-off 'page=VENUS_NODELETE' nd-on 'page=VENUS_NODELETE&on=noDelete'
node tests/ui/shot.cjs --all before                    # every page, on and off, plus a fresh install
node tests/ui/shot.cjs --scenes before                 # every Discord scene (scenes.jsx), each with its feature on
STRICT=1 node tests/ui/shot.cjs --all x theme=light    # exits 1 on a page error, React error or stand-in warning
python3 tests/ui/sheet.py work/ui/shots/cmp.png a.png b.png --scale 0.6   # side by side, to compare
sh tests/ui/check.sh                                   # before committing: runtime parses, every text translated
python3 tests/ui/icon.py NewUserIcon                   # which module exports a Discord icon
python3 tests/ui/i18n.py drop "Old text"               # remove (or `add texts.json`) a text in every language at once
```

- **Query:** `page=` a route (`VENUS_PLUGINS`, `VENUS_GENERAL`, `VENUS_BACKUP`, `VENUS_LANGUAGE`, `VENUS_<FEATURE>`),
  `on=` features or switches turned on, `set=` any other saved settings as JSON (`set={"readAllMode":"dms"}`), `fresh=1`
  for a first launch, `theme=light|midnight|darker`, `lang=de`, `search=` typed into the Features search bar, `tap=` the label or text of something to tap first.
- **Inside Discord:** `scene=` draws a Discord screen with what Venus adds to it, instead of a settings page
  (`tests/ui/scenes.jsx`). Each scene turns on the features it draws (`SCENE_SETTINGS`, which is also the list
  `--scenes` reads, so add a new scene there); `on=`/`set=` still win: `serverMenu` (the server hold menu with Server info), `serverInfo` (the Server info sheet), `serverEditMenu` and `serverEdit` (Edit servers locally's
  menu row, the server list with local names and icons, and its sheet; `server=1|2` and `set={"serverEdits":…}` for saved edits),
  `readAll` and `readAllHold` (the Read all pill and its choices), `reviews` (a profile with the Reviews card), `hiddenChannel` (the locked-channel dialog), `settings` (Discord's Settings screen with the Venus section), `youBar` (the profile bar buttons), `translateBar` (the Translate pill in a chat), `bulkDelete` (the selection bar in a chat, after Select Messages), `messageMenu` (a message's hold menu with Translate), `serverSheet` (the server sheet with the Reviews row); parameters
  for edge cases are listed at the top of `scenes.jsx`. Check these too when a feature's settings change what
  it does in Discord, and add a scene for any other place Venus draws.
- `DPR=2` gives sharper shots for reading small text; `WIDTH=360` draws pages and scenes on a narrow phone. The script
  prints the page's errors, warnings, dialogs and toasts; an unknown `page=` or `scene=` is a warning, not a blank shot.
  `--all` reads the option pages from `bootstrap.js`'s `withOptions(...)` calls, so a new page needs nothing here.
- Look at a page you change on and off, in another theme and in a long language (`lang=de`, `lang=ru`).
- It's a close stand-in, not Discord: `tests/ui/discord.jsx` redraws Discord's components (rows, switches, buttons) from
  their sizes and tokens, and animations jump to their end. It shows layout, wording, spacing and states; things that depend on Discord's native code (exact ripples, the real chat list) still need a phone. When a
  page reads a Discord module the preview doesn't have, add a stand-in to `entry.jsx`.

## UI design

**The only requirement for anything Venus shows, in Discord or in its settings: modern, beautiful and clean.**

Nothing else about looks or layout is a rule: not the page order, the components, the wording, the length of a
description, which rows exist or whether a page has a preview. Decide all of it yourself, judged on how it looks and
feels to use (`tests/ui`, above, shows you). Say what you changed and why in the pull request.

## Engineering notes

These keep features working and the project consistent. They say nothing about how anything should look.

**Settings**

- When you remove an option, take its key out of `settings` and `featureFor`. An older settings file that still has it
  is then ignored, and nothing else needs migrating. Say so under 🔧 Improvements in the changelog.
- Every feature starts off, so Discord is unchanged until someone turns something on.
- **Backup and restore** saves `settings` (plus watched people and installed themes). A new setting needs nothing extra as
  long as `acceptedSetting` can validate it: add a check there for any setting with a fixed list of values, so a
  hand-edited backup can't put a page in a state it can't show. Never add sign-ins, tokens, saved accounts or kept messages
  to `backupText`.
- Pages whose options are also native setting nodes (Nitro links, Pastel names, Device indicators) keep those nodes for
  Discord's settings search and pass `{page, sections}` to `withOptions`.
- Features list search reads `featureSearch.rows` and `FEATURE_KEYWORDS`; add a page's option names there when people
  would search for them.

**React and theme colors**

- Discord's color tokens (`ui.colors.X`) are token objects, not colors: they only become colors through `createStyles`
  (`useThemed(name, c => styles, darkFallback)`, one unique name per style set). Used straight in a style they silently
  fall back.
- Helpers called straight from a page render (`VenusStatusCard`, `venusSegmented`…) must not change the number of hooks a
  page calls between renders; anything with its own hooks that can come and go is created with `el`.
- Every animation checks `motion()` and `reduceMotion`, so Android's Remove animations shows everything at once. Never make
  anything depend on an animation finishing. Opacity, position and scale run on the native driver.
- Haptics go through `haptic(kind)`. Discord's `FormSwitch` already buzzes by itself, so don't add a second one there.

**Translations**

- Every text Venus shows goes through `tr()`/`pl()` and is added to every language file (`i18n/index.txt` lists them).
  When a text is no longer used, remove it from every language file and `scripts/i18n_overrides/` too.
- **Hand-review every language to be as accurate and as natural as possible (no Google Translate, Acorn, or lazy partial reviews):**
  - **Translations must be both as accurate as possible and as natural as possible.** Never settle for literal, stiff,
    or machine-translated phrasing, and never sacrifice accuracy for fluency. Every string must read the way a native
    speaker of that language would naturally write and expect to see it inside Discord's mobile UI, while conveying the
    exact meaning of the English original.
  - Never use Google Translate or Acorn to draft or parse translations. Every single string in every language file under
    `patches/src/main/resources/venus/i18n/` and `scripts/i18n_overrides/` must be carefully hand-translated and
    hand-reviewed by you for 100% accuracy, natural and idiomatic phrasing, grammatical correctness, consistent tone
    (informal second-person where appropriate, matching Discord's own UI in that language), preserved `{placeholders}`
    and product names (`Venus`, `Discord`, `Nitro`, `ReviewDB`, `Revenge`, `Vendetta`, `Blurple`, `GitHub`,
    `@unknown-user`), and proper CLDR plural categories (`one` / `few` / `many` / `other`).
  - **No lazy or partial audits:** When auditing or updating a language, you must look really hard and think carefully
    about every single string in the entire file (`patches/src/main/resources/venus/i18n/<code>.json`
    and the full override set in `scripts/i18n_overrides/<code>.json`), never just touching a few lines. Every
    mistranslated word (for example, translating UI nouns like "Themes", "Revenge", "Play", "Watch", "Hold", "Keep", or
    "Clear" into the wrong sense or wrong grammatical form), awkward machine-translated syntax, unnatural word order,
    wrong formality level, or missing plural form must be fixed.
  - Whenever you add or change any English text in `bootstrap.js` (including Venus settings, option pages, previews,
    toasts, dialogs, and the About page), you **must** hand-review and update every other language for an accurate,
    natural, idiomatic translation.
  - When reviewing multiple languages, thoroughly audit one language completely at a time until you are confident it is
    perfectly translated (both as accurate and as natural as possible), commit and push that language to the open pull
    request, and only then move on to the next language.

**Account switcher** (#63, #69)

- MultiAccountStore is a PersistedStore. Its constructor adds a change listener that saves `getState()`
  on every change, even before `initializeIfNeeded()` has read the saved list, when `users` is still `[]`. So never
  call `emitChange()`, `initialize()`, `asyncPersist()` or `initializeIfNeeded()` on it until Discord has set
  `_isInitialized` and Storage `hasLoaded`. Doing so on a cold start wiped every saved account.
- Only save the active token under the signed-in id when no other saved account already uses it: mid-switch, the token
  belongs to the next account while UserStore still shows the last one.

**Custom themes**

- Colors are compiled into Discord's RawColors, SemanticColors and SemanticColorExperiments tables, plus the theme
  slot keys from Themes (ASH=`dark`, LIGHT=`light`, DARK=`darker`, ONYX=`midnight`). An experiment override wins over
  SemanticColors while the experiment is on, so every themed token's overrides follow it. Changes reach the screen
  through ThemeStore, the ThemeContext key and the memoized RootThemeContextProvider (module IDs in `port_check.py`).
- **Wallpapers** (`background`) follow Revenge: the image sits behind `ChatViewWrapper` (10368), and `alpha` is how much of
  it shows (1 or missing = all, above 1 = 1), so chat keeps `1 - alpha` of its color. Only `CHAT_WALLPAPER_TOKENS` go
  see-through (`CHANNEL_BACKGROUND_DEFAULT` is the message list's own background in ChatView 10364); never fade
  `BACKGROUND_BASE_LOWER` or `PANEL_BG`, which sheets and settings use too. `blur` is `blurRadius` in pixels. Discord
  attachment links are signed again through `/attachments/refresh-urls` (`themeWallpaperUri`), since bare ones answer 404.
- **Native views follow too.** The chat list, embeds and code blocks are drawn by Discord's Android code with built-in
  theme colors, so Custom themes uses Material You's native color swap (`nativeThemeColors` in `DiscordPatches.kt`, the
  `venus-monet-v1:map:` table). `customNativeTable` pairs each `NATIVE_THEME_TOKENS` token's Discord color in the
  appearance in use with the theme's, then every raw color the theme changed; pure white and black are never remapped.
  `NATIVE_ONLY_TOKENS` are keys only the Android side has (swipe to reply, `TEXT_CODE_*`), reached only this way. The table
  follows the appearance (`nativeThemeSlot`, rechecked in `rootThemeContextProvider`), is kept on a cold start until the
  saved themes are read, and the native side loads it while `materialYou` or `customThemes` is on.
- **Legacy keys mobile no longer reads** (`LEGACY_ALIAS_VARIANT`: `CHAT_BACKGROUND`, `*_MOBILE_*`, `BG_BASE_*`, `INFO_*_TEXT`,
  pressed/hover states) only fill in when the theme doesn't set the plain key that feeds the same token. Revenge colored
  by exact name, so those variants never showed there; letting them win painted Pyontheme's chat and panels near-black.
- **Legacy raw colors** (`PRIMARY_*`, `PLUM_*`, `BRAND_*`, `WHITE`, `BLACK`) reach the tokens Discord has since moved to
  NEUTRAL / OPACITY / BLURPLE through `LEGACY_TOKEN_RAWS`: each token's last legacy raw (and opacity) per slot, from
  Discord's own tables over time (nexpid/Themelings). A theme's `PRIMARY_600` then colors what `PRIMARY_600` used to
  color, so cards stay lighter than the page under them; mapping it to a NEUTRAL shade instead made rainForest's cards
  darker than their page. A dark slot without its own raw borrows the other dark slots' (`LEGACY_SLOT_ORDER`). A
  token the theme recolors by its current raw is left alone. Regenerate with `python3 scripts/hbc/legacy_colors.py`
  when porting; keep the table a plain literal (parsing it at boot cost ~1 ms per theme compile).
- Revenge rules Venus follows: arrays are `[dark, light, midnight, darker]`; a slot the array doesn't reach borrows
  index 0, but a slot written as `false` keeps Discord's own color, even if a legacy alias reached it first. When two
  legacy keys feed one token, the key that lists it earlier (then the shorter list) wins. Values tolerate
  `#transparent`, whitespace inside hex and stray spaces around keys.
- Compile journals every key it writes, and switching undoes only those (`restoreOriginalColorTables`). Every raw
  write in `compileThemeIntoTables` goes through `raw.set`, and every token write through `writeSemanticTarget` or
  `touchedSem.add`, or turning a theme off won't undo it. `parseThemeColor` is cached and returns frozen objects:
  copy before changing one.
- Test any theme change against Discord's real tables and the published themes:
  `python3 scripts/hbc/color_tables.py` (decodes the color tables to `work/discord_colors.json`), `python3
  tests/themes_fetch.py` (downloads every theme to `work/themes/`), then `node tests/theme_compat.cjs`. It must show
  no errors, `notRestored`, `chainLeaks` or `falseSlotsChanged`, every declared key placed (100%), and install and switch times must not get worse. `WHO=KEY` lists the themes where KEY didn't land; `--each` shows
  every theme.

**Material You colors** (#90)

- A separate feature from Custom themes on purpose: it's a system look you turn on once, not a theme you install. It builds
  a theme spec in memory (`myThemeSpec`) and hands it to the same compiler (`colorThemeEntry`), so it gets journaling,
  restore and the RootThemeContextProvider re-key for free. An installed custom theme in use wins; the page says so.
- Gray ramps (NEUTRAL, PRIMARY, PLUM, translucent OPACITY_n) are redrawn at the same HCT tone in the neutral palettes and
  BLURPLE/BRAND in the accent, so every Discord appearance keeps its own contrast. Status colors are never touched.
- Filled controls use accent tone 45/40, not Material's pastel 80: Discord draws plain white on brand fills in places no
  token reaches. Keep any new filled role dark enough for white (at least 4.5:1).
- The palettes come from `extensions/monet` through `FileModule.getFileHash` (`venus-monet-v1:colors`); Discord's JS
  never calls it. They're re-read whenever Discord comes to the front and remembered in the settings file
  (`materialYouSystem`), so a cold start colors Discord before the phone answers. In wallpaper mode nothing is applied
  until the first answer, so it never flashes the fallback color.
- **Native views follow too.** The chat list, voice overlay, reactions, notifications and the window background are drawn by
  Discord's Android code, and every theme color they use (672 per appearance) goes through
  `ColorUtilsKt.applySaturationFactor(I)I` via `getColorCompat`. A 5-instruction guard there calls
  `SystemColors.remap` while `SystemColors.enabled`; the four views that call `Context.getColor` directly
  (`MATERIAL_YOU_DIRECT_READS`: CTA and forum buttons, voice message progress) get the same swap after each read.
- The swap table is JS's own result: every RawColors value the spec changed, as `rrggbbRRGGBB` pairs sorted by Discord's
  color (`myNativeTable`, solid grays before translucent ones), sent as `venus-monet-v1:map:...` or `venus-monet-v1:off`
  whenever `customThemesApply` changes the palette. Android's color resources hold the same values as RawColors, so this
  needs no second color engine. Alpha is kept; status colors aren't in the table, so they stay Discord's.
- The native side saves the table (`venus-monet.txt`) and loads it right after `super.onCreate()` (only while the settings
  file still says `"materialYou":true`), so the chat is colored from the first frame. On a change it rebuilds the cached
  theme objects in `ThemeManager.themes` and copies their fresh lazy colors into the objects views already hold, reruns
  `updateActivityTheming`, and rebinds every RecyclerView, so the open chat recolors without a restart.
- `tests/ui` hands Discord's real color tables to the runtime (modules 589/590/591), so themed pages draw in the compiled
  colors. `monet=0` acts like a phone without wallpaper colors; `MONET=1 node tests/ui/shot.cjs ...` also saves the native
  tables the page sent next to the screenshot.

**Keeping everything in step**

- The feature's name is **the same in Venus and in Morphe**: the Venus row title, the Morphe patch `name` in
  `DiscordPatches.kt` and the README features table. Morphe patches sit in the **Features** category, and the Morphe
  description is the Venus description plus any credit.
- Update `README.md` (features table) whenever a title, group or option changes.
- **Every Metro module `bootstrap.js` uses is in `BOOTSTRAP_MODULES`** (`scripts/hbc/port_check.py`), icons included.
  After adding, changing or removing one, run `python3 scripts/hbc/port_check.py` (it fails on any module ID it doesn't
  check) and `python3 scripts/hbc/port_check.py --map` (regenerates `module-map.md`).

## Benchmarking optimizations (required)

Every optimization is measured on the real HBC98 Hermes VM **before** it is committed. Node/V8 numbers don't count:
V8 has a JIT and Hermes on Android doesn't, so a change that is faster on Node can be slower on Hermes. A change that
isn't measurably faster on Hermes is not an optimization; revert it unless it's also simpler.

1. **Set up once per sandbox:** `sh scripts/hbc/bench_setup.sh [Discord.apkm]` (pinned tools, compacted runtime, the
   checksum-pinned Hermes VM in `work/hermes/`, Discord's bundle). Bytecode always comes from the pinned `hermesc`.
2. **Measure with the tools in `tests/bench/`**, never ad-hoc timing:
   - **Startup** (top-level code in `bootstrap.js`, `decorateDefine`, anything that runs at launch):
     `node tests/bench/hermes_bench.cjs --startup work/bench/old.js`, with the old copy from
     `git show origin/main:patches/src/main/resources/venus/bootstrap.js > work/bench/old.js`. For a change to the
     compaction in `scripts/build.py`, compare two compacted runtimes with `node tests/bench/runtime_eval.cjs old new`,
     then `node tests/bench/hermes_bench.cjs work/bench/runtime_eval.js`.
   - **Cold boot of the real bundle** (required for every startup change): `sh tests/bench/cold_boot.sh <old compacted
     bootstrap.js> [new]`. It must print `HBC98_REAL_RN_ENVIRONMENT_PASS`. Run it at least twice; one run can land in
     noise.
   - **Finding startup work:** `node tests/bench/load_profile.cjs` (compile time and cost per top-level statement) and
     `node tests/bench/load_calls.cjs` (which functions actually run at startup).
   - **A hot function** (a hook, a store wrapper, a sort, a render helper): write `tests/bench/scratch/<name>.js` that
     copies the old and new code verbatim and calls `bench("old …", fn)` then `bench("new …", fn)` with realistic
     inputs (a 3000-message channel, 200 guilds…), and run `node tests/bench/hermes_bench.cjs
     tests/bench/scratch/<name>.js`. The first `bench` is the baseline.
3. **Read the result honestly.** The p10 is the headline (a busy host only slows CPU-bound code down). Anything within
   ±5% says `(within noise)`: that's not a win. If the median and p10 disagree, rerun with more `--samples`/`--rounds`.
4. **Put the numbers in the commit message and the pull request**, e.g. `Hermes HBC98: 15.5 → 13.3 ms per
   3000-message sort (1.17x)`. A ⚡ changelog bullet needs this measurement behind it.

### Per-optimization benches never reach main

A bench for one optimization is useful while that optimization is being reviewed and useless after it ships: the code
it copies goes stale and nobody runs it again. So:

- It lives in `tests/bench/scratch/` and may be committed to the pull request for review.
- **Delete `tests/bench/scratch/` before the pull request is merged.** `scripts/build.py` warns about it on pull
  requests and fails on `main` and on release tags. `tests/bench/` itself only holds the general tools
  (`hermes_bench.cjs`, `cold_boot.sh`, `load_profile.cjs`, `load_calls.cjs`, `runtime_eval.cjs`), and the build fails
  on anything else there.
- The measurement stays in the commit message, which is where anyone looking at that code later will find it.
- Don't point source comments at bench files; write the number in the comment instead.

## Tests: what may be committed

Only commit tests with a lasting, practical use. **Never commit tests whose only job is to show that one feature, page,
hook or fix works** (per-feature unit tests, render snapshots, harnesses that mock Discord's modules to exercise one
feature). Write and run them locally, then leave them out: they go stale with every port and redesign.

What belongs in the repository:

- **Checks against the real APK that protect every patch, reused on every port:** `tests/native/PrivacyTest.kt` (every
  pinned HBC98 and DEX target is safe to stub; runs in `scripts/build.py`), `tests/native/HbcPreludeTest.kt` (the
  prelude injects cleanly) and `tests/native/VerifyApk.kt` (the patched APK is consistent: startup hook, prelude and
  footer, every privacy stub in place, the language files, the manifest and renamed providers, 16 KB aligned native
  libraries, every extension's classes and their host linkage; run it with `sh scripts/verify_apk.sh`, which patches
  with the newest Morphe CLI first and fails if any patch in `patches-list.json` wasn't applied).
- **General performance tools:** the five files in `tests/bench/` and `tests/hermes-startup.js`.
- **Developer tools with a future use:** `tests/theme_compat.cjs` and `tests/themes_fetch.py`, the UI preview in `tests/ui/`
  (see "Seeing the UI"), the porting tools in `scripts/hbc/`, and `tests/test_all.sh`, which runs every check above in
  order (setup, build, port check, UI pages and scenes in STRICT mode, cold boot, patch + VerifyApk) and prints a table.
- **Build gates** in `scripts/build.py`: changelog format, HBC98 compilation of the runtime, language files (valid,
  placeholders kept, everything translated) and the bench rule above.

One-off scripts (a remap for one port, a batch of translations for one release) are deleted once they've run. If
you're unsure whether something has a future use, it doesn't: keep it local.

## Workflow

- **Testing everything:** `sh tests/test_all.sh` (about 10 minutes on a 1 GB sandbox; `SKIP=`/`ONLY=` to choose steps,
  `REUSE=1` to skip re-patching). Each step's log is in `work/test_all/`, and `work/test_all/summary` fills in as it goes,
  so a run cut short by a sandbox reset still shows how far it got.
- **For every bug:** find the root cause, fix it, and immediately commit and push the fix to the pull request before
  moving on. Check the issue against the previous release's code first, so the changelog only lists real fixes.
- **For every optimization:** implement it, measure it as above, and immediately commit and push it.
- Never batch unrelated fixes or optimizations into one end-of-session commit.
- `.github/workflows/build.yml` builds and tests the `.mpp` on every push to `main`, every pull request and every tag,
  uploads it as the `venus-patches-mpp` artifact, and publishes the release on a `v*` tag. Prefer that CI-built
  `.mpp` when testing a pull request or publishing.
