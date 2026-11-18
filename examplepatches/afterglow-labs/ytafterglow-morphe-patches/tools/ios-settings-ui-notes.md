# iOS Settings UI: notes beside `ios-settings-ui.json`

These notes cover what the JSON spec can't express well. Line numbers refer to the iOS working tree at
`.worktrees/yt-21.43-hook-repair` (commit 3c52a65 plus uncommitted changes in Settings.x,
YTAGPreferenceDescriptor.m, YTAGUserDefaults.m, YTAfterglow.x and en Localizable.strings). That is the
same tree `ios-registry.json` was generated from.

## How the JSON was produced and checked
- I transcribed the pages by hand from Settings.x, then enriched them from `ios-registry.json` and the
  en strings. After that, three automated checks ran:
  - 457 assertions confirm that each cited line contains the expected call (for example
    `switchWithTitle:@"RemoveAds"`).
  - A sweep of Settings.x:2305-3324 confirms that every row-producing call has a matching row. The calls
    checked include `switchWithTitle:`, `pageItemWithTitle:`, `itemWithTitle:`, headers, links, color and
    number rows, reset blocks and `space`.
  - Every switch's title argument matches its registry `titleKey`, and every row key is either in the
    registry or in its internal-key list.
- Search resolution (`search.entries[].resolution`) comes from simulating `ytag_openSettingsSearchEntry`
  against the transcribed tree. It was simulated with advanced mode both off and on, under default
  conditions.

## Rendering model (YouTube-native, not specified by Settings.x)
- Every Afterglow screen except two is a YouTube `YTSettingsPickerViewController`: one flat list in a single
  section, with no real section headers. The two exceptions are Search and the Tab editor, which are plain
  inset-grouped UITableViewControllers.
- Visual sections are made from rows:
  - Blank **spacer** rows (`itemWithTitle:nil`).
  - **Header** rows: disabled (dimmed, non-tappable) cells with a title and a description. These come from
    `themeSectionHeaderWithTitle:`.
- `sections` in the JSON are derived from these rows; `rows` is the source of truth.
- Real section titles exist in only three places:
  - the root category ("Afterglow");
  - Credits, whose nav title is "About" and whose section title is "Credits";
  - the tab editor (Shown tabs / Hidden tabs, with footers).
- Row heights, fonts and colors come from YouTube's settings cells. Android should mimic YouTube's own
  settings styling.
- Afterglow adds the following on top of YouTube's styling:
  - bold row titles;
  - pink touch feedback;
  - pink switch on-tint `(0.95, 0.41, 0.50)`;
  - a pink-tinted SF "sparkles" icon;
  - the orange "glow" wordmark on the YouTube settings entry.
- Option rows inside pickers keep stock styling (they have no accessibility identifier).
- Picker screens push a checkmark list. Afterglow code doesn't pop the list after a selection, except for
  Scrubber Size. Whether YouTube's picker auto-pops is native behavior; I couldn't confirm it from source.
- Detail text: page rows show their summary on the right; pickers show the current label. Switches have
  no detail text.

## Snapshot semantics (Android should match these, or knowingly improve on them)
- The root section is rebuilt whenever YouTube requests category 789. The build captures two things:
  - `isAdvanced` (2308) and the search index (2309);
  - which sub-page rows will exist when each sub-page is opened later.
- Toggling **Advanced mode** on the About page therefore doesn't change the About page that is already
  open. It takes effect the next time the root section is rebuilt.
- Sub-page rows are built when the parent row is tapped. Reloads only re-evaluate detail and summary
  blocks; they don't add or remove rows. These rows are decided at page build time:
  - "Use Default <color>" (2074);
  - "Remove Custom Image" (2588);
  - the standard-player-control rows on Overlay (2952-2966).
- Two selected indexes are captured at page build and go stale while that page stays open:
  - the Glow strength picker (2677);
  - the Scrubber Size picker (2628).
- Switches show the *effective* value. When Lite Mode forces a key, the switch still toggles visually and
  writes the raw value, but it snaps back to the forced value the next time the page is built.

## iOS quirks recorded as-is (decide per item whether Android copies or fixes)
1. `LOC` returns the key itself when a string is missing:
   - The quality picker's nav title is literally **"SelectQuality"** (1715). The key is missing from every
     .lproj.
   - "About", "Playback", "Controls", "None", "Off" and "Glow Color" also echo their keys. That happens to
     read fine in English.
2. Search: 31 of 225 entries fail with "That setting could not be opened right now." under default
   conditions.
   - Lite Mode fails because its path is `[Main]` and no root row is titled "Main".
   - 29 entries fail because their path `[Themes, Theme Studio]` hits the disabled "Theme Studio" header row
     before the real row. These are the 19 presets, the 8 theme colors, Gradient Top and Gradient Bottom.
   - "Comments header" fails because no option row on the Comments picker has that title.
3. Entries 5, 6 and 9 (Theme Presets, Custom Colors, Gradient Background) "succeed" by flashing the
   disabled header row instead of the Theme Studio row.
4. Overlay search entries for the five standard-player-control rows fail when the runtime probe hides
   those rows.
5. The Themes page has two consecutive rows titled "Theme Studio": the header, then the tappable row.
6. The Seek Bar summary shows **"3 custom"** on a fresh install. `objectForKey:` returns the registered
   defaults of `seekBarScrubberSize`, `persistentProgressBar` and `hideHeatwaves`.
7. `disableFloatingTabBar` shows two restart sentences: "Restart YouTube to switch layouts." from the
   string, then "Restart YouTube to apply." from the flag.
8. The registry's `advanced` flag gates nothing. Only the explicit `isAdvanced` branches gate rows.
   - `oldYTUI` is always shown, but its search entry is advanced-only.
   - `advancedMode`, the `debugLog*` switches and the glow number rows are flagged advanced but always
     shown.
9. Description-only dependencies are never enforced. "Requires Bonus tab row" (centered anchors) and
   "Requires Legacy/iPad-style UI" (floating keyboard) don't disable or hide anything, and the anchor
   pickers are always shown.
10. The Default playback rate and both quality rows index their label arrays without clamping. An
    out-of-range stored value would crash on iOS; Android should clamp.
11. Hold to speed has no subtitle, and its 18 fixed options don't match the registry description, which
    mentions Standard/Extended ranges with 0.05x steps.
12. Mismatched titles and descriptions:
    - The "Layout & Buttons" row opens a page titled "Shorts Layout".
    - The Comments row opens a picker titled "Comments header".
    - The "Afterglow Vault" root row description ("Vault download behavior, …") differs from its search
      description ("Download behavior, …"). That row is the download-settings page, not the Vault library
      (`destination.vault`).
13. The Lite Mode restart alert uses literal "Restart Now" and "Later". The color-saved alert uses the
    localized `RestartNow` and `Later`.
14. en.strings defines "Gradient" twice: "Gradient" at line 264 and "Gradient Background" at 490. The
    old-style strings parser keeps the last value, so the search entry is titled "Gradient Background".
    This affects search only.
15. Destructive behaviors:
    - Reset to Defaults has no confirmation.
    - Reset All Colors exits the app (`exit(0)`) after removing 14 keys.
    - Restore default settings suspends the app, sleeps 1 s, then exits.
    - Clear cache deletes the whole app Caches folder (YouTube's too) and shows "Done" before deletion
      finishes.
16. Tapping "Use Default <color>" also pops its page, returning to Themes.
17. The Interface summary's key list includes the string keys `anchorLeftTab` and `anchorRightTab`. This
    is an assumption: CFPreferences boolean coercion reads "YTAGControlCenter" and "FElibrary" as NO, so
    they never count.
18. Integer keys count as "on" in summaries whenever they're non-zero. Defaults affected: `speedIndex`=1,
    `autoSpeedIndex`=3, `downloadAudioTrackMode`=1, `downloadPickerFontFaceMode`=1. That gives default
    summaries of "3 on" for Playback and "6 on" for Afterglow Vault.

## Data formats that don't port byte-for-byte
- Theme colors (`theme_*` color keys, `theme_glowColor`) are stored as `NSKeyedArchiver` data of a
  `UIColor`. Detail text formats them as `#RRGGBB`, truncating `(int)(c*255)`.
- The scrubber image is PNG data, downscaled so the longer side is at most 60 points at device scale.
- Preferences export is an XML plist: `{format:"YTAfterglowPreferences", version:1, exportedAt, preferences}`.
  It contains those archived blobs, so cross-platform import needs a decoder for them or must skip them.
- Import accepts a bare dictionary when there is no `format` key, and replaces the whole defaults domain.
- The debug log export is a UTF-8 `.txt` file.
- Settings relies on two NSUserDefaults behaviors:
  - `objectForKey:` also returns registered defaults;
  - `boolForKey:` coerces numbers and strings.

## Entry points outside Settings.x
- YouTube Settings root: category 789 is first in the list, except that `orderedCategories` is left alone
  when YouGroupSettings' `+tweaks` exists.
- Tab-bar long press (YTAfterglow.x:4397 and :4533) and the player overlay "settings" action
  (YTAGPlayerActionRouter.m:126) open the same root page as a full-screen modal with a Close button
  (`YTAGOpenAfterglowSettingsFromView`, Settings.x:684-756).
- External destinations are only linked, not specified:
  - AI Home Studio and Theme Studio are pushed onto the settings navigation stack.
  - AB Lab is presented as its own full-screen modal with a Close button.
  - Their internals live in `UI/`.

## Not shown by Settings.x
Registry keys with no row:
- `redProgressBar`
- `nativeDownloadRouting`
- `action.resetOverlayMode`
- `destination.controlCenter`
- `destination.vault`
- `destination.glowLab`

Two keys are written only through the Glow strength picker: `theme_glowStrengthMode` and
`theme_glowStrengthCustom`. `registryCoverage.rowsNotBackedByARegistryEntry` lists the rows that have no
registry entry: navigation rows, color and image rows, reset rows, Share debug log and the credits links.
