# Wuplay catalog channels implementation plan

**Goal:** Publish user-selected catalogs from Wuplay's default (first stored) profile as Android TV preview channels. Target the original signed 0.9.4-beta / 49 APK only.

**Architecture:** Reuse the app's profile/definition flows and catalog fetch method through a checked native bridge. Run reads, network waits and provider writes on one worker. Store selection separately from Wuplay settings. Use `santodan-launcher/wuplay/` IDs containing profile and definition IDs. Do not depend on Monet or change Watch Next.

The user approved building the publisher first and accepted a separate **Wuplay TV channels** launcher entry for selection.

## Constraints and acceptance

- Treat the first stored profile as default: this build has no default-profile flag. Never switch the user's active profile. Fetch only while that profile is active; explain this in the selector.
- Offer actual content catalogs, excluding navigation-only hubs/collection groups. Default to no selected catalogs.
- Retain channel/program IDs across refresh and catalog renaming. Keep a last successful channel on network/provider failure. Successful empty results clear programs. Unchecking/removing a catalog deletes only this patch's own channel.
- Preserve content order, cap at 100 usable movie/series tiles per catalog, use HTTP(S) artwork and existing Wuplay deep links.
- Gate publishing on Android TV API 26+. Opening the selector remains safe on unsupported devices.
- Preserve unrelated dirty work in the main checkout. Do not bump versions or promote to main without user confirmation.

## Execution (native, sequential)

- [x] Write and run failing JVM tests for production channel/program identities, profile isolation, selection and deletion policy.
- [x] Implement Java extension: native coroutine bridge, catalog selection, bounded provider reconciliation, foreground refresh and error status.
- [x] Add exact original-input and DEX contract guards plus resource entry point in a Wuplay-specific patch.
- [x] Build Android bundle and run Python regressions and extension tests. Apply the actual bundle to the supplied original APK, audit hooks/manifest/runtime dependencies and sign a reviewable local APK.
- [x] Validate on an isolated emulator/test install first. Preserve the rooted TV's installed APK and data; no replacement installation performed.
- [x] Document setup, refresh limits, static contracts, local verification and observed runtime results.

See `docs/wuplay-validation.md` for verification and limitations. No release or promotion to main is included.

## Review focus

Renaming/reordering must not recreate a channel; identical catalog names must stay distinct. A changed active profile must not mix another profile's content. Failures must not erase prior programs. Malformed tiles and duplicate IDs must not consume the full cap. Removing a selection must never delete native Watch Next or channels from another publisher.
