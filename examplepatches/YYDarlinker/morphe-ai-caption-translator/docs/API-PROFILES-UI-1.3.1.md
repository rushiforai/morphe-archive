# API profile settings — 1.3.1

> Historical UI: see [1.3.2 interaction refinements](SETTINGS-INTERACTION-1.3.2.md) for the current profile actions and keyboard handling.

## Design

The main settings page retains the inline-field structure of 1.2.6, with one additional
ordinary preference row showing the active API profile. The former always-visible Spinner,
name editor, buttons and explanatory paragraph have been removed.

Tap API profiles to select a saved configuration or add a named one. Manage current profile
contains rename, delete and clear-key actions. Address, key, model and translation requirements
remain directly editable on the main page. The selected profile uses a neutral checkmark,
not a solid blue selected-row background. Long names ellipsize on the main page and wrap in
management lists. Dialog content scrolls within a bounded height; actions have 48dp minimum
touch height and start-aligned text for RTL layouts.

When available, the addon uses the public Morphe 1.43.0 CustomDialog factory for window chrome,
title, rounded background and adaptive footer. It does not copy the official implementation.
It falls back to the platform AlertDialog when that optional extension API is unavailable.
The generated DEX audit verifies the exact public 11-argument factory and foreground-color API.

## Scope of actions

Deleting a profile requires a named confirmation. It removes that profile's address, model,
translation requirements, encrypted key and origin binding; other profiles and global subtitle
settings stay intact. Deleting the active profile selects the first remaining profile. At least
one profile is kept; its key can be cleared instead. The original configuration can also be
deleted when another exists: only its API-related values are removed from the shared legacy
store, and a persisted marker prevents it reappearing.

Clear key is in profile management rather than Cache and diagnostics. It affects only the
named profile's local key, not its address/model/prompt, other profiles, or the shared Keystore
alias. It does not revoke a key at its provider. Confirmations capture the profile ID so a
later selection cannot retarget them. Pending valid edits are saved before switching; invalid
edits block switching. Confirmed profile deletion discards unfinished edits for that profile.

## Reproduced defect and repair

A failing regression test captured the old A-to-B-to-A bug: create the prompt row for A, leave
it offscreen, switch to B and back without rebuilding that row, then reuse the old view. The
old implementation had cleared the editor/binding but accepted the view's original tag, yielding
empty text and rejected writes. The same test now passes.

Reuse now requires the exact view instance, active profile and generation. Generations also
protect detached rows which missed change notifications. The prompt rebinds when its localized
default changes. Pending edits are flushed before scroll-driven recreation. Editor registration
is deduplicated and removed on detach; finishing/destroyed activities no longer block current
configuration changes. The translation-requirements row also joins the scoped exception to
Morphe's long-press breadcrumb copying, preserving inline paste/edit actions.

Default requirements are resolved from the current settings-language resources for all fourteen
supported locales. Both previous Chinese default strings are recognized. Defaults are not frozen
into new profiles; custom requirements are preserved verbatim per profile. Clearing the prompt
restores defaults without a model call. Switching the interface language does not automatically
translate or overwrite custom instructions.

## Keyboard and page structure

Inline editors adjust their actual root window, including nested PreferenceScreen dialogs,
using a shared lease which restores the old adjustment when the last editor detaches. Focus,
caret and viewport changes reveal the current line with a small margin. Edge-to-edge ListViews
receive only the missing occluded scroll range, not a second full keyboard-height padding on
already-resized pages. Padding restores on blur/detach, and host system-bar inset listeners
are not replaced. Landscape editors request inline rather than fullscreen IME extraction;
key fields retain the no-personalized-learning flag.

The final page separates global engine/menu toggles, profile connection settings, per-profile
translation requirements, global subtitle styling, and cache/diagnostics. The API test flushes
pending valid edits before taking its configuration snapshot. Rare destructive management is
one level behind normal profile selection, with explicit action scope and confirmation.

No changes to provider deadlines, token/retry limits, caption ownership or translation algorithms
are included. Earlier caption handoff, remembered selection and menu visibility fixes remain.

## Verification boundaries

Framework regression tests cover profile dialog controls, add/rename/select/delete/cancel,
original-store preservation, stale confirmations/editors, defaults and custom prompts across
fourteen languages, nested-dialog keyboard adjustment, caret reveal, noncumulative occlusion
padding and restoration. The full existing regression suite remains enabled.

The original YouTube 21.07.247 is rebuilt with official Morphe 1.43.0 compatible defaults and
all three addon roots. Generated settings XML and DEX are audited. Release outputs record the
exact test counts, hashes and GitHub workflow result.

This is JVM/Robolectric plus rebuilt-APK verification, not physical-device visual/playback
acceptance. No real provider billing, real keyboard animation or new Android Keystore round-trip
is claimed. Isolated UI tests exercise the platform dialog fallback; official Morphe dialog
integration is additionally checked for API availability in the actual combined DEX. Device
checks should include light/dark, landscape, large fonts, different keyboards and repeated
profile switches.

Diagnostic revision: source-phrase-131. Publish only via the repository's existing semantic-release
workflow with a conventional fix commit; do not edit generated release versions or tags manually.

## Primary references

- https://github.com/MorpheApp/morphe-patches/blob/v1.43.0/extensions/shared/library/src/main/java/app/morphe/extension/shared/ui/CustomDialog.java
- https://github.com/MorpheApp/morphe-patches/blob/main/extensions/shared-youtube/library/src/main/java/app/morphe/extension/shared/settings/preference/ExternalDownloaderPreference.java
- https://github.com/MorpheApp/morphe-patches/blob/main/extensions/shared-youtube/library/src/main/java/app/morphe/extension/shared/settings/preference/ToolbarPreferenceFragment.java
- https://developer.android.com/develop/ui/views/touch-and-input/keyboard-input/visibility
