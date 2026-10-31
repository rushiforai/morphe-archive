## Pending changes since v0.15.0

- Support Pillo **0.6.27** across hybrid notifications, weight import, summaries, local backup and Weight in Progress, retaining existing older app support. Use the ARM64 splits from the Play Store APKS on compatible devices.
- Keep the native Weight graph, summaries and dated record list in Progress on 0.6.27; the original feature was already committed separately for 0.6.20.
- Add **Pillo - Premium and ad-free** for 0.6.27 as a replacement for the external **Unlock Premium** patch's obsolete fingerprint.
- Fix 0.6.27 local restore of original 0.6.20 backups using native, staged Room migrations, integrity/schema validation, WAL checkpointing and rollback. Accept valid aliased app-storage parents while rejecting unsafe database-file links. The user reports everything appears to work after the fix; host, original-input/bundle and isolated Android migration checks passed.

- Fix Car Scanner **2.2.21** settings resetting after exit/restart by preserving the native settings decoder's normal seed. Emulator restart tests and host/bundle verification passed; the user subsequently confirmed everything appears to work correctly. Existing 2.1.50 support is unchanged.

## Pending changes since v0.11.1

- Support Car Scanner **2.2.21** premium status with native profile-decoder, ECU certificate-check and delayed-exit fixes. Existing 2.1.50 behavior is preserved. Host/bundle verification passed; the user reported successful emulator navigation and subsequent real-device ECU operation.

## Pending changes since v0.10.1

- Add **Car Scanner - Premium status** for Car Scanner ELM OBD2 **2.1.50**. The optional patch makes the central premium-status getter return true. Original-input and packaged-bundle checks passed; the user reported that the patched app appears to work on device.
- Fix beta.5 delayed preloading using the presentation content type instead of the native controller request type; normalize series/TV requests to the native series search key and log readiness diagnostics.
- Fix next-episode stream reuse on NuvioTV beta.5 by guarding refresh at the native picker entry, including branches that could bypass the earlier call-site guard.
- Suppress the separate native threshold preload while the next-episode patch setting is enabled. Keep explicit source refresh and the disabled native behavior available.

## v0.10.1

- Speed up Reddit startup with home flairs enabled by batching post-detail requests, removing per-card waits, and briefly retaining completed lookups. Emulator feed-availability median improved from approximately 10.8 to 7.0 seconds in three runs per build.
- Preserve the tested feed behavior; this release does not add hiding and later revealing posts while their flairs load.
- Verify batched fallback responses, posts without flairs, HTTP failures, and malformed JSON. Existing Reddit DEX verification and the patch bundle build pass.

### Previously pending changes since v0.10.0

- Add **NuvioTV - Preload streams for next episode** for beta.4/beta.5, with an independent, disabled-by-default switch under **Layout > Santodan-Patches > Streams**.
- Fetch the next episode's source list after 30 seconds of actual playback, excluding pauses and buffering. Reset the timer on episode/profile changes and cancel preload consumers when playback is left or the switch is disabled.
- Reuse Nuvio's native source cache in the manual next-episode picker instead of forcing a new search. Explicit refresh controls retain their existing behavior. Re-observe cached searches during longer episodes so expired results can refresh.
- Permit local scrapers only for the exact next episode and active profile during its preload, preserving the repository's pause signal for unrelated searches.
- Timing, cancellation, cache reuse, all 256 settings-menu selections, original beta.2/beta.4/beta.5 DEX checks, and standalone/combined beta.5 bundle application passed. TV playback testing remains pending.

## Changes since v0.9.0

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
