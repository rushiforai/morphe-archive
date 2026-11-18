# Wuplay in-app Home catalog channel settings

Extend the existing Wuplay 0.9.4-beta / 49 publisher. Capture the physical TV's installed baseline separately from the phase-2 emulator candidate before continuing final builds.

- [x] Add **TV channels** as a native row in **Settings > Catalogs**, preserving existing rows/focus. Open the selector as an internal Wuplay activity; remove its separate TV launcher entry.
- [x] Offer only first/default-profile catalog definitions with native `showHome=true` and a supported content source, sorted by `homeOrder`. Enforce this at publication, not just in the checkbox UI. Publish only the intersection with saved user selections; start with no selections.
- [x] Preserve stable provider IDs and existing eligible selections. Remove previously published non-Home/deselected catalogs on successful refresh. Recheck Home eligibility after suspended fetches so changed visibility cannot publish stale results.
- [x] Keep refresh off the main thread and retain failure behavior/profile isolation. Preserve original native Settings behavior, Watch Next, and unrelated provider rows.
- [x] Explain publication versus launcher visibility. Add an explicit **Add to TV Home** action that requests Android's channel-browsable approval only for selected eligible published channels, skips already-browsable channels, and stops gracefully on denial/unsupported launchers. Do not request unrelated Android permissions.
- [x] Add production-loop/policy/native-UI boundary regressions, build/apply/audit the real APK, and exercise navigation/selection/permissions on an isolated Android TV test install. Capture updated screenshots.
- [x] Update bilingual guides and evidence; commit a reviewable candidate without manual version/generated metadata changes. Preserve the primary dirty checkout and physical TV app/data.

The original APK is unchanged (SHA-256 `3f6dc351f7aefeb634d55602c4921c1826555153390d7aee0f622ac7a02d0802`). Android TV browsing approval is not a prerequisite for publishing provider data or for Monet to consume it.
