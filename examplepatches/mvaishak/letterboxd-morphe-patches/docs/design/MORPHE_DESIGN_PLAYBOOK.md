# Morphe UI design playbook

Use this playbook when adding or changing Letterboxd UI. The resource names and
measurements below come from the stock Letterboxd 3.6.7 (515) base APK. Check
them on every supported target before relying on them in a patch.

## Start with the host screen

Find the equivalent screen in Letterboxd. Prefer inserting a view into its
existing container, using its layout or style, and letting the host handle
scrolling, navigation, and state. Keep custom UI for features that need a new
interaction, such as local artwork management or arranging navigation items.
Use an activity or dialog context with the appropriate theme. Resolve host
resources by package and name at runtime. Keep numerical resource IDs and
obfuscated implementation details out of the extension.

| Use | Stock 3.6.7 reference | In patched code |
| --- | --- | --- |
| Body and labels | `TextAppearance.Letterboxd.BodyMedium`, `LabelMedium`, and `TitleMedium` in `res/values/styles.xml` | Use the host appearance for prose, captions, and headings. Preserve font size in sp and respect the active app typeface. |
| Film metadata | `Theme.Letterboxd.Text.MetadataBody` and `MetadataBodySpaced` use `text_label` (12 sp), secondary text, and 1.3 and 1.4 line spacing multipliers | See `TriviaSection.text`. When constructing a TextView in Java, apply line spacing separately. Match `FilmRelease.SecondaryDescription` for metadata labels. |
| Film detail tabs | `fragment_film_extra_details`, `extra_details_tabs`, `Widget.Letterboxd.TabLayout` | Add tabs to the existing scrollable Material TabLayout. Keep the host selected indicator, scroll position, restored selection, and Back behavior. See `ImdbTriviaPatch`. |
| Rows and dividers | `item_release_date_row` uses `activity_horizontal_margin` (16 dp) and an 8 dp bottom margin. `fragment_film_extra_details` uses MaterialDivider | Use the host dimension and a themed MaterialDivider in film content. Keep controls at least 48 dp tall and allow labels to wrap. |
| Buttons and fields | `Widget.Letterboxd.Button`, `Widget.Letterboxd.OutlinedButton`, `Theme.Letterboxd.TextButton`, `Widget.Letterboxd.TextInputLayout` | Apply the stock style in a host context. Avoid assuming a Mods activity with the platform theme has the Material attributes a widget needs. |
| Dialogs and sheets | `ThemeOverlay.Letterboxd.MaterialAlertDialog` supplies title, body, and action styles. The host bundles Material bottom sheet layouts | Prefer MaterialAlertDialogBuilder with the host theme overlay for new host-context confirmations. Use BottomSheetDialog with a Material context for short action lists. Preserve existing ModDialog flows until their sizing, Back, and focus behavior can be checked together. |
| Loading | `item_loading_indicator` inflates `com.letterboxd.letterboxd.ui.views.LetterboxdSpinner` with `app:indeterminate="true"` | Use `ui.LoadingIndicator`. The default row keeps the 30 dp spinner and 16 dp vertical padding. Compact loading uses the same view at 20 dp with adjacent status text. |
| Empty or failed | `view_empty` with `empty_title_view` and `empty_quote_view` | Use the stock empty layout for known empty data. Use an inline explanation and Retry for recoverable failures. Keep existing results on partial failure. |
| Icons | `drawable/ic_arrow_back` and `drawable/close`, plus icons referenced by the owning layout or menu | Resolve and reuse the host drawable. Use a content description for icon-only actions and keep a 48 dp target around the glyph. Tint through the active theme when the icon is not branded. Artwork dialogs use the stock close vector in a 24 dp image area inside a 48 dp button. |
| Feedback | `Widget.Letterboxd.Snackbar` and `snackbar_background_neutral`, `snackbar_background_success`, `snackbar_background_error` | Anchor Material Snackbar to the host view for transient feedback. Use the existing Toast fallback in isolated Mods screens. Keep actionable errors on the screen. |

## Artwork picker and related controls

The approved local artwork flow opens in a rounded dialog over the current
Letterboxd screen. Keep the gallery and its previews in this presentation.
Use the active elevated surface, Letterboxd typography and icon resources,
and the active accent for selection and the primary action.

- Put the title and relevant film name in the header. Use Letterboxd’s close
  icon at about 24 dp inside a 48 dp target. Give the overflow button a
  separate 48 dp target. Use underline tabs to switch artwork types.
- Give the gallery the space. Keep language filtering in a compact control
  above the grid, with a chevron and the active filter visible. Move URL
  entry, viewing saved artwork, and restoring originals into overflow.
  Show the saved choice in the grid when it is present. Keep copy that
  explains an empty state, an error, or a required next step. Keep TMDB
  attribution in Mods artwork settings.
- Open small sets of choices in a menu anchored to the control. Give a
  selector a visible label, current value, and trailing chevron. Make its
  whole field tappable and mark the selected option. Use a themed elevated
  surface, host text styles, and rows of at least 48 dp.
- Carry the same surface, type, icon sizing, and action hierarchy into every
  child dialog. Make the artwork the focus of a preview and give it one
  primary action, **Use poster** or **Use backdrop**. Use Close and system
  Back to return to browsing. Keep the URL form to a labeled input and a
  **Preview** action, with validation beside the field when needed.

## Themes and state

Use `SurfaceColors.background` / `SurfaceColors.elevated` in Mods-owned chrome and
the host theme's attributes in native content. Stock uses `windowBackground`
(#181C20), `textColorPrimary` (#FFFFFF), and `textColorSecondary` (#99AABB).
Resolve the current resources and `AccentPresets` when creating a screen.
Rebuild views through the existing settings restart flow where a resource
overlay changes. Avoid storing resolved colors across a restart. OLED and
bottom navigation matching are disabled when Material You owns those surfaces.
Test Material You as a separate patch selection.

Use accent color for selection and emphasis. Check label contrast against the
actual fill or surface. `AccentPresets.readableText` preserves a preferred
text color when it reaches 4.5:1 and chooses black or white otherwise.
Keep the spinner's native colors: its canvas reads `colorPrimary`, `logoGreen`,
`logoBlue`, and `logoRed`. An overlay may change the neutral `colorPrimary`
segment. Leave the three logo colors to Letterboxd.

## Async work and motion

Keep the status message next to the indicator and mark the text as a polite
accessibility live region. Treat the spinner as decorative so it does not
repeat the announcement. A completed cache hit goes straight to content.
Show partial content as soon as it is available. In Trivia, keep Load more
active while local rows are ready and show the compact indicator beside the
waiting action only when it needs more data. Empty, error, and cancelled
states end the animation.

Call `setLoading(false)` on completion, failure, cancellation, or view stop.
Letterboxd's spinner runs a repeating 800 ms ValueAnimator and stops on detach.
The wrapper detaches its child when loading ends and uses status text alone
when Android animators are disabled. If the host layout cannot inflate, it
uses the themed Android indeterminate ProgressBar. Never copy a logo
animation into a patch when the host layout is available.

Keep tab and sheet transitions owned by the host when possible. For custom
reveals and motion, preserve the same state change when animation is disabled.
Do not expose spoiler text in the accessibility tree until it is revealed.

## Current audit

| Area | Observed difference and follow-up |
| --- | --- |
| Trivia | Stock tab, metadata, dividers, and empty layout already fit the film screen. Replaced the platform spinner and text-only pagination wait with the native animation. Filter chips still need a large-font and contrast pass across themes. |
| Artwork | The approved gallery and previews use rounded dialogs, underline tabs, compact language filtering, and overflow for secondary actions. Native loading feedback remains in place. See Artwork picker and related controls. |
| Mods and onboarding | ModSettingsView, PillToggle, ModDialog, and ModWelcome use custom rows, switches, fonts, and dialog layout. Switch taps now use the same click path as row, keyboard, and accessibility activation. Switches expose checked state. Choice values wrap up to two lines and leave room for the setting name. The Mods chrome still needs a typography pass against the host, including an isolated activity theme check. |
| Rating and spoilers | Existing reveal covers and transitions have custom controls. Check disabled animation, hidden text announcements, and large text before altering them. |
| Navigation | Existing patches reuse native destinations and recolor their chrome. Preserve stock hit targets and selection semantics. Check the selected destination after an overlay restart and check icon contrast for the custom accent. |

## Before shipping a UI change

- Identify the stock reference layout, style, or behavior. Record new reusable
  patterns here and keep a safe fallback for missing host resources.
- Compare screenshots on stock surfaces, OLED, custom accent, bottom nav
  matching, and a separate Material You build. Apply a theme change from
  within the running app and check the resulting screen after the supported
  restart. Exercise supported system appearance modes. The stock app theme
  is dark; record if a device setting does not change it.
- Check narrow width, larger font scale, long labels, touch targets, TalkBack,
  and animator scale zero. Restore device settings after the test.
- Review the full flow, including previews, selectors, overflow menus, forms,
  and confirmation dialogs opened from the changed screen.
- Exercise Back, repeated opening, selected states, cancellation, offline
  error and Retry, empty data, partial data, and cached content where relevant.
- For backup and reset, verify confirmation text, Cancel, and preserved saved
  preferences. Run destructive cases only against disposable test data.
- Save evidence with the APK version, patch selection, device, and theme.
  Report what was exercised and any gaps before release.
