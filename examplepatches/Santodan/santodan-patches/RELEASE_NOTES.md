## Pending changes since v0.9.0

- Add **Show merged progress provider**, disabled by default, under **Layout > Santodan-Patches** on beta.4/beta.5. Continue Watching cards display the winning provider's local Trakt, Simkl, MDBList, or Nuvio icon at the bottom-right while merging is enabled.
- Defer merged refreshes, badge retries, and incremental badge updates during playback on beta.4/beta.5; resume deferred work after leaving playback.
- Reread Next Up seeds after provider history and alias loading, avoiding publication of pre-refresh seed lists. This addresses a possible stale-data path; it does not yet establish the cause of the reported missing Rage of Bahamut / Virgin Soul card. Restarting did not restore the card in the user's test, but toggling merge off and on did.
- Add provider snapshot counts and focused show-selection diagnostics under `SantodanMergedProgress`.
- Local provider identity tests, watched-history checks, original beta.2/beta.4/beta.5 DEX checks, and the patch bundle build passed. The user confirmed provider icons work on device.

# Changes since v0.8.0

## NuvioTV features

- Add **Upcoming movie dates in library and collections** for beta.4 and beta.5.
  Two independent, disabled-by-default switches under **UI** show blue `dd-MMM-yy`
  badges on unreleased movie posters. Exact poster metadata takes precedence;
  missing dates use a bounded background catalog lookup with a six-hour cache.
  Released movies and unknown dates have no badge. A past release year skips
  unnecessary lookups; current/future years still require an exact date.
- Add **Preload streams in Continue Watching** for playable movie/episode cards.
- Add **Preload streams on detail page** for the current Play or Resume target,
  following changes to the next episode. Both **Streams** switches are independent
  and disabled by default. They reuse Nuvio's native source search, installed
  addons/plugins, cache expiration, profile checks, and playback pause controls.
  Background work is bounded, and playback starts only when Play is pressed.
- Group the Santodan-Patches menu under **Continue Watching**, **UI**, and **Streams**
  using native, non-focusable labels. Groups with no installed patches are omitted.

## Compatibility and improvements

- Support NuvioTV **1.1.0-beta.5** across all existing patches. Movie dates, finale
  dates, airing series, and stream preloading support beta.4/beta.5. Merged progress,
  remaining episodes, and side-by-side installation also support beta.2.
- Reduce remaining-episode badge work by counting recently displayed cards in the
  background, limiting catalog fallback work, and stopping new work when disabled.
- Isolate badge Compose groups to preserve the host's remembered state. Movie and
  series date badges can be selected independently or together.
- Add stream diagnostics for preload starts, elapsed time, source counts, and
  timeout/cancellation outcomes. Repeated composition hits stay silent; stream
  URLs are omitted and custom video IDs are redacted.
- Movie-date toggle diagnostics identify **library** or **collections**. Routine
  settings-render logs are suppressed.

## Diagnostics and validation

- Add `"SantodanStreams:V"` and `"SantodanMovieRelease:V"` to logcat filters.
- Movie dates use native release-time rules: date-only releases use UTC midnight,
  zoned timestamps use their exact instant, and timestamp badges show the local date.
  Release metadata does not guarantee an available streaming source.
- Local checks cover date parsing, release boundaries, timezone handling,
  independent settings, nested/restart card scopes, and all 128 menu selections.
  Original beta.4/beta.5 DEX checks verify coexistence with the existing patches.
  Real beta.5 APK application and final DEX verification cover the movie patch on
  its own and with all Nuvio patches. Device logs confirm working date lookups and
  successful stream preloads without badge-rendering errors.
