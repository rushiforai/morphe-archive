# Reapplying after upstream updates

The v1.0.0 checkpoint includes native Home/Work chips and Back cleanup. Since 1.4.0 that is again the whole extension: bearinmind's Offline saved places draws saved places and labels on the map. The marker and label notes below describe tags v1.1.0 to v1.3.1.

## Marker implementation

The label extension adds three editor hooks alongside the lifecycle hooks described below. It does not change the renderer or saved-store implementation.

The marker layer sits on the activity decor view. Do not add children to MapViewContainer: Maps asserts its renderer child count when opening place sheets. Marker targets avoid the category row and clickable native controls. Blank areas pass through; a drag/pinch beginning on a marker replays the touch sequence to the native root with overlay forwarding disabled.

For this Maps version, find the live `MapViewContainer`, read its public `e` renderer (`bjip`), obtain its camera via `g()` (`bjja`), and acquire each snapshot via `d()` (`bjje`). Convert latitude/longitude with `bjbd.F(DD)`, project through `bjje.h(bjbd)`, and read the resulting `bjbz.b/c` floats. `bjje.j()` gives comparable camera state so stationary frames can avoid projecting/repositioning every saved point. The emulator uses `bktd -> bkth`; the interface also supports the other renderer implementation. For a legacy `d` renderer (`bizr`), get the current `bjof` via `d()` and construct a fresh `bkth`; do not cache a copied camera snapshot across frames.

The marker feature uses the three existing lifecycle callbacks; label entry points are additionally patched as documented below. No renderer bytecode, native library, resources, manifest, or saved-store implementation is changed. The controller runs only while MapsActivity is resumed. Visible marker positions use View.postOnAnimation, allowing sampling and translation before Android view drawing at the display cadence. Hidden states retain 250 ms polling, projection failures 1 second, and pause/destroy removes pending callbacks. Saved places refresh once per second. Control exclusions refresh every 200 ms. Unchanged camera/geometry skips projection and view updates. The separate map surface may still differ from the overlay composition timing; do not describe this as a native renderer layer. Viewport culling uses marker-rectangle intersection, retaining partially visible targets for normal decor clipping. Existing exclusion rules around native controls and top/bottom chrome remain. Invalid coordinates are excluded; coincident identities are deduplicated and nearby visible points are grouped while retaining every member for selection. Native drawable IDs and list colors are documented in LocalMarkers.MarkerButton. The 24 dp visible circles use fixed colors tuned for night-mode map POIs (not automatic theme selection), with 44 dp touch targets and unchanged grouping/edge bounds. The implementation adds no network client and does not write saved data.

Marker checks additionally cover cluster selection, individual-place opening, removing a saved place, map controls, gestures starting on markers, rotated/tilted cameras, orientation changes, and no marker overlay on routes/place sheets. UI verification must accompany geometry tests: the 10,000-point test checks grouping, not rendering performance with 10,000 saved places.

## Same Maps version, newer publisher patches

For label support also inspect the following bindings. SavedStore.labels maps aliases to Place snapshots and its existing save/export methods remain authoritative. LocalLabels writes through the existing setLabel/removeLabel/setHome/setWork methods. Identity remains the feature ID or six-decimal coordinate key; do not merge unrelated businesses merely because they are nearby.

Three label entry points are redirected: atqq.a(bcio) delegates via atqs.a (Activity) and atqs.l (awvj selected place); the label branch of areb.onClick delegates via atlg.a (Activity) and areb.c (awvj); YouActivity.labelDialog delegates to the shared editor. Unrecognized native models fall through to the original action. Unwrap awvj.a() to oku, then use oku.bz()/p()/q() for name/feature ID/coordinates and SavedPlaces.place for conversion. Resolve an existing saved/label record by identity before editing to retain its original display name. Native chip titles are not rewritten.

The search controller follows search_omnibox_edit_text and typed_suggest_container, or, with an empty box, the `recycler_view` directly below search_omnibox_container (main search and directions editor). It places up to four (six when empty) ranked local rows above native suggestions by temporarily translating/clipping/padding the native list. Original layout is restored on empty/no match, view replacement, selection and pause. Polling at 150 ms handles native subtree replacements; text changes also schedule an immediate refresh. Native autocomplete continues to receive the query. Search and captions use fixed dark-map colors.

Caption layout follows the existing frame callback and projection. It reserves space around local markers, native controls and earlier captions; it cannot inspect Google's internal text collision layout. Clustered labels appear in the chooser, with individual captions after zooming in. Marker contents refresh once per second.

1. Keep the working APK, original signing key, password, and an export of Local saved outside Git.
2. Produce a fresh upstream-patched APK signed with the same key used on the phone.
3. Inspect changes to `SavedStore`, `SavedPlaces`, their lifecycle callbacks, and Maps UI customizations. Confirm there is no upstream Home/Work feature that would duplicate this extension.
4. Run `build.py` against the fresh APK with new build/output paths. ABI checks are structural checks, not a complete compatibility audit.
5. Test the UI cases below on an emulator, then install with `adb install -r` using the same signing key. Do not uninstall the existing phone app.

## New Maps version

Since 1.6.0 (Maps 26.44.06) the two helpers look up Maps resources by name (`HomeWorkShortcuts.resource`), so numeric IDs no longer need porting; check the names still exist with `aapt2 dump resources`. R8 also strips most public Material `Chip` setters, so `HomeWorkShortcuts.ChipNames` holds the obfuscated Chip/ChipDrawable names. For a new Maps APK run:

    python tools/chip-names.py <stock-maps.apk> --dexdump <sdk>/build-tools/36.0.0/dexdump.exe

and update `ChipNames` together with `ChipNames.MAPS_VERSION_CODE`. Until then the chips use the name-free fallback (`plainChip`), which measures Maps' category chip as drawn. To see the fallback on the pinned build: `adb shell setprop log.tag.UA-ChipFallback DEBUG`, restart Maps; clear it with `setprop log.tag.UA-ChipFallback ''`.

Test data: `tests/fixtures/local-saved-calgary.json` is a Local saved backup with Home, Work, labels, lists, notes and categories (public places, fictional assignments). Import it on a test device through Local saved > Import.

New bearinmind release: `.github/workflows/bearinmind-watch.yml` runs `tools/check-upstream.py` daily (bindings listed in `config/upstream-bindings.json`; keep them in sync with `TuttoEnhancements.kt`). To move to a release: download its `patches-X.mpp` and source archive into vendor/artifacts, rebuild the Tutto MPP, then `python tools/refresh-locks.py --tutto <v> --upstream <X> --upstream-commit <sha>` and run build-all.

and paste its output into `ChipNames`. It follows the setters that survive into ChipDrawable and fails loudly when a name is ambiguous. On 26.36.04 it reproduces the names the 1.5.1 code used. Then update the version in `morphe/TuttoEnhancements.kt`, `config/build-lock.json` and the stock input in `build-all.py`, rebuild, and run a full `build-all` patch.

The table below describes the 26.36.04 bindings of the legacy `build.py`.

Port these bindings before changing the version gate in `build.py`:

| Binding | Current value / behavior |
| --- | --- |
| Main activity | `com.google.android.maps.MapsActivity` |
| Category container | `below_search_omnibox_container`, `0x7f0b0166` |
| Navigation container | `nav_container`, `0x7f0b06b9` |
| Route preview tabs | `directions_mode_tabs`, `0x7f0b0317` |
| Query view | `search_omnibox_text_box`, `0x7f0b0a5f` |
| Native clear action | `search_omnibox_text_clear`, `0x7f0b0a60` |
| Home/Work icons | `0x7f080587` / `0x7f08063a` |
| Chip text appearance | `0x7f150f99` |
| Chip class | `com.google.android.material.chip.Chip` |
| Chip drawable / minimum touch target | Chip fields `h` / `o` |
| Shape type / getter | `bviu`, drawable's inherited `ad()` |

The drawable's copied fields are surface `b`, background `c`, stroke `e`, stroke width `N`, minimum height `d`, chip padding `m/r`, icon padding `Y/Z`, text padding `n/o`, ripple `f`, icon size `R`, and icon tint `Q`. These are obfuscated implementation details; resolve each from the new APK. The current drawable class is `bvay` extending `bvin`, though the helper obtains its actual class from the live Chip.

Search the RecyclerView superclass chain: the actual carousel is a `GmmRecyclerView`. The helper reuses a bound native category chip as the style sample. Wait until it exists instead of inventing fallback cosmetics. Keep the overlay parent's elevation at zero; raising it changes Material elevation-overlay colors.

Confirm the local-saved ABI used by the stubs:

- `SavedStore.load(Context)`, static `SavedStore.home` and `work`.
- `SavedStore.Place.lat/lng` as doubles.
- `SavedPlaces.directions(Context, Place)`.
- `SavedPlaces$Front.onActivityResumed/Paused/Destroyed(Activity)` callbacks.

If a new version separates these classes into different DEX files or changes their signatures, adapt the validation/build code. The current builder supports the lifecycle class moving to a different DEX, but expects the related local-saved classes beside it.

## Behavior that must be preserved

The overlay is attached to the activity decor view because Maps may recreate its own managed UI subtrees. It reserves padding at the beginning of the category carousel, respects RTL layout, and restores the old padding/clip setting on removal. The controller runs every 250 ms only while the activity is resumed.

Back cleanup does not intercept Android Back. A task-scoped, in-memory session records the clicked destination. After route UI has appeared and then disappeared, the helper invokes native clear only if the query still matches the exact destination and is not being edited. Matching allows six-decimal display rounding. Pending launches expire after 30 seconds before directions open. Android process death discards ownership, so cleanup cannot be guaranteed after process recreation.

Do not clear arbitrary coordinate searches, repeatedly click clear, or clear while route preview/navigation is visible.

## Regression checks

- Existing labels appear without migration; exact/prefix/substring and case/accent matches rank correctly.
- No-match/clear restores native suggestion layout; native result selection and keyboard/Back still work.
- Direct and overflow label editors support rename/cancel/remove and reject label conflicts across places.
- Label removal preserves list memberships; label-only markers disappear when their label is removed.
- Labels survive restart; portrait/landscape and pause/resume do not duplicate local results.

- No Home/Work configured: original category row unchanged.
- Home only, Work only, and both: correct chips/destinations; updates after saved labels change.
- Native colors, fonts, touch feedback and padding; category scrolling in portrait/landscape.
- Chips disappear on incompatible screens and return to the main map.
- Shortcut -> directions -> edge Back: clear query and return to main map.
- Manually search the same coordinates -> directions -> Back: preserve the ordinary selection.
- Active navigation remains active; Back returns normally through route preview.
- Editing a different query is never cleared; keyboard and map gestures still work.
- Background/resume and activity recreation do not duplicate overlays or leave carousel padding behind.
- Signing certificate matches the installed app; in-place update preserves Local saved.

After porting, record the new supported versions, fresh APK/source hashes, precise runtime checks, and remaining limitations. Keep the previous working tag available.
