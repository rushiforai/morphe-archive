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

## Settings design

Venus settings should feel like part of Discord: simple, modern and calm, never a wall of switches. Every screen
starts from these rules. Use them for every new feature and every change to an existing one.

### These rules are a starting point, not a cage

The layouts, page order and styling below are what the user likes, so start from them. They are purely suggestions,
not fixed requirements. What the user wants most is the best-looking, easiest-to-use UI, and what they like won't
always be what looks or works best. Use your own judgement: if you believe something would look better or be easier
to use another way, do it that way, and say what you changed and why in the pull request. This covers the whole Venus
UI inside Discord, not only the settings pages: chat additions, buttons, sheets, toasts, previews and the Features list.

Change something only when it's genuinely better, though. Don't invent changes to look busy, and leave things alone when
the current design already works. Wherever a rule here touches something other than looks (a name staying the same in
Venus and Morphe, translations, tests, the module map), keep following it.

### Fewer, better settings

- **One main switch per feature.** It sits on the Features list. Only add options that most users would actually
  change. Don't add an option because something *could* be configurable.
- **Remove options that are useless, near useless or confusing.** If an option only matters in a rare case, does
  something the main switch could do by itself, or needs a paragraph to explain, pick the better behaviour and
  drop the option.
- When you remove an option, take its key out of `settings` and `featureFor`. An older settings file that still
  has it is then ignored, and nothing else needs migrating. Say so under 🔧 Improvements in the changelog.
- Every feature starts off. Options inside a feature keep sensible defaults, so turning the feature on does what
  its title says straight away.

### The Features list

- Rows are grouped by where you notice them: **Messages, Sending, People, Servers, Appearance, Quests**. Put a
  new feature in the group that fits. Add a group only when none does.
- Every row has its own Discord icon from `FEATURE_ICONS`: a design-system icon module that exports exactly that
  name (check it with `scripts/hbc`). Never reuse another feature's icon.
- A feature with options is a `withOptions` row: the switch and a button to its page. A feature without options
  is a plain `toggle`.

### Titles and descriptions

- **Titles say what it does, in plain words**, at most 40 characters: "Keep deleted messages", "Send long
  messages", "Hide the gift button". Use sentence case and no full stop. Never use a plugin or code name
  (FreeNitro, NoDelete, Pastelize).
- **Descriptions are one short line**: aim for about 65 characters in English (at most 130), so they fit in one or
  two lines of the Features list in every language. Say what the user will see, then only what really matters (a
  limit, what leaves the phone, what it needs). For example: "Sends Nitro emojis and stickers as links that show as
  the image." Details belong on the feature's own page, and a restart is explained by the Reopen Discord dialog.
- Rows with their own page show a switch and a small arrow (`SubpageTrailing`). Keep the trailing side that narrow:
  anything wider takes width from the title and description, which then wrap.
- Write for someone who has never heard of the feature. Use "you", say "your phone" (not "the device"), and
  don't use words like "spoof", "hook", "prelude" or "endpoint".
- Credits ("Based on … by …") go in the Morphe description and README, not in the Venus row.

### Option pages

Every option page shares one look (User activity notifications and Message highlights are good references):
calm, roomy and visual, built from Discord's own components so it feels like part of the app. Follow it for every
new page and every change to an existing one. Check each page yourself, on and off, against the rules below.

**Page order, top to bottom**

1. **Status card** (`statusCard(key, text, {title, IconComponent, leading})`): shown at the top of a page only when the
   feature is off (`offCard(key, Icon, feature)` — "Turned off" / "Turn it on here to start.", with Discord's own switch on the
   card so you never have to go back to Features), when a sub-option state
   needs calling out (e.g. every device indicator location turned off, or both emojis and stickers turned off), or when the
   feature has genuine live runtime state to report (who you're watching in User activity notifications, which account is
   signed in, Quest progress, ReviewDB account, active custom theme, translation engine status, or a non-zero count of kept
   deleted/edited messages). Never show a redundant "Turned on" or "Nothing kept yet" filler card at the top of a page when
   its preview or options below already speak for themselves.
2. **A preview, only when words aren't enough.** Most features don't need one: their title, description and options
   already say what they do. Add a preview only when someone could misunderstand the feature without seeing it: how
   something looks in chat changes with the options below (bar width and colors, kept edits, pastel names, device
   icons, translation notes), or a gesture or flow is easy to get wrong (triple-tap deletes, holding a server's icon).
   A preview that only restates the description is clutter: Bring back Tenor GIFs has none, because "Tenor GIFs show
   in Discord's own GIF picker again" says it all. When unsure, leave it out.
   - Draw it as the part of Discord it changes: `previewScreen` with `previewHeader`, `previewMessage`, `previewInput`
     and `previewBar`, or that screen's own layout (member list, profile, channel list, message menu, dialog), with
     `useChatPreviewStyles()` / `usePreviewChrome()` tokens. Use plain sample people and text, or art bundled in
     Discord (the Wumpus drawables), never anything from the user's servers.
   - **Static by default**: one picture of the result that updates live as the options below change.
   - **Watch only when a still picture could mislead**: a sequence of steps where the order or the gesture matters.
     Watch is `useStory(active, () => [[waitMs, step, caption?], …], deps)` with `storyStrip(k, s, story)` under the
     preview; it plays while the feature is on. Each caption says in plain words what happens and stays up at least
     `readMs` (2.4–5 s).
   - **No Try it, no Watch/Try it toggle, no step-by-step tips.** Watch already shows the flow; making people re-enact
     it adds nothing. A preview may be directly interactive only when the interaction *is* the option (Show device
     indicators' DM / Members / Profile switcher mirrors the switches below it).
3. **Choices**, each group with a short title:
   - a choice of 2–4 short values (widths, who to watch): `venusSegmented` under a `groupTitle`;
   - a choice of one with explanations: `radioGroup`, every choice with a `rowIcon` (4th item);
   - on/off options: `switchRow(Switch, key, label, subLabel, rowIcon(id, "NameIcon"))`;
   - colors: a row of round swatches plus an "Any color" swatch that opens Discord's color picker
     (`showCustomColorPickerActionSheet`), with a hex box only as a fallback;
   - people: rows with `avatarBubble` (status dot when known) and a trailing ✕ (`XSmallIcon`) to remove; never a
     list of IDs or "Tap to remove" text;
   - a text box with an action: `inputWithButton` (Discord's `Button` beside the field), never a separate
     "Add"/"Use" row under it.
4. **Manage**: `actionRow`s for one-time actions (clear, reset). Destructive ones use the danger style, are
   disabled (or hidden) when there's nothing to act on, and always ask first with `confirmAction`. A page that has
   options that can drift from the defaults gets "Reset to defaults".
5. **Footnote**: one or two muted sentences, only for what isn't obvious from the page.

**Rules**

- **Every switch and radio row has its own Discord icon** (`rowIcon`, a design-system icon module that exports
  exactly that name; check it with `scripts/hbc` and add it to `BOOTSTRAP_MODULES` in `port_check.py`). Pick an icon
  that shows what the row does, not the feature's icon again. The Language list is the only exception.
- **Colors come from Discord's theme tokens through `useThemed(name, c => styles, darkFallback)`** (createStyles),
  never `ui.colors.X` straight in a style: those are token objects, not colors, and silently fall back. Each style
  set gets a unique name, and the fallback is Discord's dark theme. Status colors use `STATUS_HEX`.
- **Text uses Discord's `Text` variants**: titles `text-md/semibold` + `text-strong`, details
  `text-sm/medium` + `text-muted`. Cards are 16 radius, 16 horizontal padding, with `CARD_BACKGROUND_DEFAULT`.
- **Show, don't list**: summarize long lists (an avatar pile with "12 friends" rather than 12 checkboxes) and only
  expand them when the user chose to pick one by one. Never use "✓ " in front of a label to show a choice; use a
  radio, a segmented control, a check icon in `trailing`, or a ring around a swatch.
- **Nothing on the page is useless**: hide rows that can't do anything right now (Manage with nothing to reset),
  and keep switches greyed out while the main switch is off.
- Helpers called from a page render (`VenusStatusCard`, `venusSegmented`, `highlightPreview`…) are plain
  functions called directly, not components, so the page stays one render tree; components with their own hooks
  (`HighlightPreview`-style previews that use `useSettings`) are created with `el`.
- The Features list is Discord's own `SettingsList` with `FeatureSearchBar` as its `ListHeaderComponent` (#68). Every
  `toggle`/`withOptions` row is added to `featureSearch.rows` automatically; when a new feature page has options people would
  search for by name, add their labels to `FEATURE_KEYWORDS`.
- **Start with the essentials** (`STARTER_FEATURES`, `starterCard`) sits above the Features search on a fresh install, until any
  feature has been on, Not now is tapped (`setupDone` in the settings file), or you search. Only add a feature there if it works
  on its own: no sign-in, no outside service (ReviewDB, Google Translate), no restart, nothing that acts for you (Quests,
  Skip delete confirmation) or changes what others see (Hide typing indicator).
- **Backup and restore** saves `settings` (plus watched people and installed themes). A new setting needs nothing extra as long
  as `acceptedSetting` can validate it: add a check there for any setting with a fixed list of values, so a hand-edited backup
  can't put a page in a state it can't show. Never add sign-ins, tokens, saved accounts or kept messages to `backupText`.
- Pages whose options are also native setting nodes (Nitro links, Pastel names, Device indicators) keep those
  nodes for Discord's settings search and pass `{page, sections}` to `withOptions`, so the designed page is shown.
- Every new text goes through `tr()`/`pl()` and gets added to every language file (`i18n/index.txt` lists them).
  When a text is no longer used, remove it from every language file too.
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

- The page leads with a gallery (`themeTile` + `themeMiniChat`), not a status card: Discord's colors first, then each installed
  theme drawn in its own colors (`themePalette`), then a Browse tile. The tile in use has the brand ring and a check.
- Tiles are radios (`accessibilityRole:"radio"`): tapping one uses it (`customThemesUse`), holding one asks to remove it.
  Discord's colors is the way back, so tapping the theme in use does nothing.
- Install problems show under the link field, never at the top of the page.
- Colors are compiled into Discord's RawColors, SemanticColors and SemanticColorExperiments tables, plus the theme
  slot keys from Themes (ASH=`dark`, LIGHT=`light`, DARK=`darker`, ONYX=`midnight`). An experiment override wins over
  SemanticColors while the experiment is on, so every themed token's overrides follow it. Changes reach the screen
  through ThemeStore, the ThemeContext key and the memoized RootThemeContextProvider (module IDs in `port_check.py`).
- Parts of the chat list are drawn by Discord's native Android code with built-in theme colors (`ThemeModule`
  accepts only a theme name), so a JS theme can't recolor everything there.
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
  no errors, `notRestored`, `chainLeaks` or `falseSlotsChanged`, and install and switch times must not get worse. `WHO=KEY` lists the themes where KEY didn't land; `--each` shows
  every theme.

**Motion**

- `settingsBody` wraps each group in `VenusReveal`: groups rise in one after another when a page opens. Don't add a
  second entrance animation of your own.
- Something that's picked (a swatch's check, the theme or account in use, a status badge) goes through
  `popIn(key, child)`. Key it on what was picked, so it pops again only when the choice changes.
- `switchRow` and `venusSegmented` call `animateLayout()` before changing a setting, so rows that appear or move
  ease into place. Call it yourself before any other setting change that adds or removes rows.
- `venusSegmented` slides its pill (`SegmentedSlider`); `VenusProgress` is the bar for anything with progress.
- Opacity, position and scale animate on the native driver only. Width (`VenusProgress`) is the one exception.
- Every animation checks `motion()` and `reduceMotion`. Without `Animated`, or with Android's Remove animations on,
  everything shows at once. Never make anything depend on an animation finishing.
- **Haptics** go through `haptic(kind)`, Discord's own `triggerHapticFeedback`. Switches already buzz by
  themselves (Discord's `FormSwitch`), so never add a second one there. `venusSegmented` ticks `IMPACT_MEDIUM` like Discord's
  segmented control, and radio choices and color swatches (which Discord leaves silent) tick `SELECTION`. Only buzz when
  something actually changed, never for re-picking the current choice, for toasts, or on a timer.
- Motion confirms what you did. Never loop it on its own, except a preview's Watch story (`useStory`), whose timers
  stop when the feature is turned off or you leave the page.

The page title is short ("Deleted messages", "Tap gestures").

### Keeping everything in step

- The feature's name is **the same in Venus and in Morphe**: the Venus row title, the Morphe patch `name` in
  `DiscordPatches.kt` and the README features table. Morphe patches sit in the **Features** category. The
  Morphe description is the Venus description, plus any credit.
- Update `README.md` (features table) whenever a title, group or option changes. Keep titles at most 40 characters,
  descriptions at most 130, and every feature icon unique.
- **Every Metro module `bootstrap.js` uses is in `BOOTSTRAP_MODULES`** (`scripts/hbc/port_check.py`). After adding,
  changing or removing one, run `python3 scripts/hbc/port_check.py` (it fails on any module ID it doesn't check) and
  `python3 scripts/hbc/port_check.py --map` (regenerates `module-map.md`).

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
  prelude injects cleanly) and `tests/native/VerifyApk.kt` (the patched APK is consistent; run it with
  `sh scripts/verify_apk.sh`, which patches with the newest Morphe CLI first).
- **General performance tools:** the five files in `tests/bench/` and `tests/hermes-startup.js`.
- **Developer tools with a future use:** `tests/theme_compat.cjs` and `tests/themes_fetch.py`, and the porting tools
  in `scripts/hbc/`.
- **Build gates** in `scripts/build.py`: changelog format, HBC98 compilation of the runtime, language files (valid,
  placeholders kept, everything translated) and the bench rule above.

One-off scripts (a remap for one port, a batch of translations for one release) are deleted once they've run. If
you're unsure whether something has a future use, it doesn't: keep it local.

## Workflow

- **For every bug:** find the root cause, fix it, and immediately commit and push the fix to the pull request before
  moving on. Check the issue against the previous release's code first, so the changelog only lists real fixes.
- **For every optimization:** implement it, measure it as above, and immediately commit and push it.
- Never batch unrelated fixes or optimizations into one end-of-session commit.
- `.github/workflows/build.yml` builds and tests the `.mpp` on every push to `main`, every pull request and every tag,
  uploads it as the `venus-patches-mpp` artifact, and publishes the release on a `v*` tag. Prefer that CI-built
  `.mpp` when testing a pull request or publishing.
