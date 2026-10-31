# Before & after

See what each patch changes. Choose a patch below or follow **Before / after** from the [README catalogue](../README.md#generated-patch-catalogue). Click any image for its original size.

All images reuse published, unedited evidence with synthetic data. Each pair names its actual baseline: Android APKs, source widgets, or a previous patch implementation. These examples illustrate the visible change; exact APK versions, installation instructions and verification limits stay in the linked guides.

| App | Patch / visible change |
| --- | --- |
| Mihon 0.21.3 · official GitHub ARM64 APK | [Preserve excluded Default-category downloads](#preserve-excluded-default-category-downloads) |
| Komikku 1.14.1 · official GitHub ARM64 APK | [Keep local manga in exclusion searches](#keep-local-manga-in-exclusion-searches) |
| Read You 0.16.2 | [Import nested OPML feeds](#import-nested-opml-feeds) |
| Finamp 1.0.1 | [Song artist order](#song-artist-order) |
| Finamp 1.0.1 | [Fix section title validation](#fix-section-title-validation) |
| Finamp 1.0.1 | [Load artist pages faster](#load-artist-pages-faster) |
| Finamp 1.0.1 | [Fix offline artist tracks](#fix-offline-artist-tracks) |
| Finamp 1.0.1 | [Fix track alphabet navigation](#fix-track-alphabet-navigation) |
| Finamp 1.0.1 | [Keep player output controls accessible](#keep-player-output-controls-accessible) |
| Finamp 1.0.1 | [Fix quick settings banner contrast](#fix-quick-settings-banner-contrast) |
| Feeder 2.25.0 · project GitHub F-Droid APK | [Zoom article images](#zoom-article-images) |
| Infinity+ 8.3.4 | [Configure custom OAuth for Infinity+](#configure-custom-oauth-for-infinity) |
| Fossify Calendar 1.12.0 | [Readable Calendar descriptions](#readable-calendar-descriptions) |
| Fossify Calendar 1.12.0 | [Separate all-day reminder defaults](#separate-all-day-reminder-defaults) |
| Fossify Messages 1.10.1 | [Dismiss notifications when marking conversations read](#dismiss-notifications-when-marking-conversations-read) |
| Fossify Messages 1.10.1 | [Keep background conversations unread](#keep-background-conversations-unread) |
| Fossify Messages 1.10.1 | [Avoid notifications for visible conversations](#avoid-notifications-for-visible-conversations) |
| Fossify File Manager 1.6.2 | [Keep favorites consistent after folder rename or removal](#keep-favorites-consistent-after-folder-rename-or-removal) |
| Fossify Contacts 1.6.0 | [Show emails and notes from merged contacts](#show-emails-and-notes-from-merged-contacts) |
| Fossify Music Player 1.8.4 | [Prefer each track's embedded cover](#prefer-each-track-s-embedded-cover) |
| Kvaesitso 1.41.0 | [Restore widget editing from the search menu](#restore-widget-editing-from-the-search-menu) |
| Fossify Clock 1.6.0 | [Choose upcoming alarm notification time](#choose-upcoming-alarm-notification-time) |
| Tasks.org 15.13 · project GitHub F-Droid APK | [Navigate to the parent task](#navigate-to-the-parent-task) |

<a id="preserve-excluded-default-category-downloads"></a>

## Preserve excluded Default-category downloads

**Mihon 0.21.3** · [Setup & patch details](MIHON.md)

Keep read chapter downloads when the built-in Default category is excluded from
deletion. Reuses Marc Went / Dunky13's correction in [Mihon PR #4182](https://github.com/mihonapp/mihon/pull/4182).

**Installed Android APK captures.** Same synthetic favorite, read chapter, Default
exclusion, Light theme, display size and **Downloaded only** filter. Before: the
download is deleted and the filtered library appears empty. After: the Manager
export retains the downloaded chapter. The favorite itself remains in both databases.

| Before | After |
| :---: | :---: |
| **Excluded read download lost** | **Excluded read download retained** |
| <img src="../tests/mihon/evidence/2026-10-30/before.png" width="300" alt="Before: excluded Default-category download lost; Downloaded only library is empty"> | <img src="../tests/mihon/evidence/2026-10-30/after.png" width="300" alt="After: excluded Default-category download retained; synthetic favorite remains downloaded"> |

[Raw PNG/XML and acceptance evidence](../tests/mihon/evidence/2026-10-30/README.md) · [Back to patch index](#before--after)

<a id="song-artist-order"></a>

## Song artist order

**Finamp 1.0.1** · [Setup & patch details](FINAMP_NATIVE.md)

Put the album artist first, then alphabetize the other song credits. Choose alternative modes in settings without rewriting music metadata.

**Android APK captures.** Same synthetic album and Dark theme. The before APK retains the official native code; the after APK has the native patch.

| Before | After |
| :---: | :---: |
| **A Guest, B Guest, Z Lead** | **Z Lead, A Guest, B Guest** |
| <img src="../tests/finamp/evidence/2026-10-28/credits-before.png" width="300" alt="Before: A Guest, B Guest, Z Lead"> | <img src="../tests/finamp/evidence/2026-10-28/credits-after.png" width="300" alt="After: Z Lead, A Guest, B Guest"> |

[Capture provenance & checks](../tests/finamp/evidence/2026-10-28/README.md) · [Back to patch index](#before--after)

<a id="fix-section-title-validation"></a>

## Fix section title validation

**Finamp 1.0.1** · [Setup & patch details](FINAMP_NATIVE.md)

Typing a valid custom home-section title updates validation and enables Save immediately.

**Upstream status · 2026-10-29:** [PR #1830](https://github.com/finamp-app/finamp/pull/1830) is merged into `redesign`. This Penguin backport remains selectable for the original Finamp 1.0.1 APK.

**Source-widget comparison, not Android APK screenshots.** These are actual Finamp widgets rendered by Flutter tests, upstream redesign versus the combined source fixes. The native APK fix is verified separately in the [APK record](../tests/finamp/evidence/2026-10-28/README.md); its original before-image is obscured by the keyboard.

| Before | After |
| :---: | :---: |
| **Playlists entered; error remains and Save is disabled** | **Playlists entered; error clears and Save is enabled** |
| <img src="https://raw.githubusercontent.com/pengusto/finamp/7e168434482e4e1e7b77a0c37337edb28291e2f8/contribution-evidence/2026-10-28/title-validation-before.png" width="300" alt="Before: Playlists entered; error remains and Save is disabled"> | <img src="https://raw.githubusercontent.com/pengusto/finamp/7e168434482e4e1e7b77a0c37337edb28291e2f8/contribution-evidence/2026-10-28/title-validation-after.png" width="300" alt="After: Playlists entered; error clears and Save is enabled"> |

[Capture provenance & checks](https://github.com/pengusto/finamp/tree/7e168434482e4e1e7b77a0c37337edb28291e2f8/contribution-evidence/2026-10-28) · [Back to patch index](#before--after)

<a id="load-artist-pages-faster"></a>

## Load artist pages faster

**Finamp 1.0.1** · [Setup & patch details](FINAMP_NATIVE.md)

Show the artist preview and track count without waiting for the full discography response.

**Installed Android APK captures.** The fixture deliberately holds unbounded artist-track requests. Both captures use the same Dark theme, synthetic library, eight downloaded tracks, sort, viewport and demo clock. The patched APK was exported and installed through Morphe Manager. This verifies query behavior on the synthetic fixture.

| Before | After |
| :---: | :---: |
| **Pending full-song queries: spinner and 0 Tracks** | **Bounded queries: preview and 8 Tracks appear** |
| <img src="../tests/finamp/evidence/2026-10-30-artist-review/artist-held-before.png" width="300" alt="Before: Pending full-song queries: spinner and 0 Tracks"> | <img src="../tests/finamp/evidence/2026-10-30-artist-review/artist-held-after.png" width="300" alt="After: Bounded queries: preview and 8 Tracks appear"> |

[Capture provenance & checks](../tests/finamp/evidence/2026-10-30-artist-review/README.md) · [Back to patch index](#before--after)

<a id="fix-offline-artist-tracks"></a>

## Fix offline artist tracks

**Finamp 1.0.1** · [Setup & patch details](FINAMP_NATIVE.md)

Keep only tracks credited to the selected performing artist when a downloaded
album contains several artists. Album-artist inclusion is preserved.

**Android APK captures.** Same downloaded synthetic album, B Guest performing-artist
filter, Name ordering, Dark theme and display size. Tracks 7–8 have other credits.
The after image is an actual Morphe Manager export installed with the same key.

| Before | After |
| :---: | :---: |
| **8 songs, including 2 unrelated tracks** | **6 matching songs** |
| <img src="../tests/finamp/evidence/2026-10-28-next/1689-before-tracks.png" width="300" alt="Before: B Guest includes Lead Solo and Album Credit Only"> | <img src="../tests/finamp/evidence/2026-10-28-next/1689-after-tracks.png" width="300" alt="After: B Guest contains only the six credited songs"> |

[Capture provenance & checks](../tests/finamp/evidence/2026-10-28-next/README.md) · [Back to patch index](#before--after)

<a id="fix-track-alphabet-navigation"></a>

## Fix track alphabet navigation

**Finamp 1.0.1** · [Setup & patch details](FINAMP_NATIVE.md)

Compare the selected sidebar letter and track titles with consistent case.
Existing missing-letter behavior and paging remain in place.

**Android APK captures.** Same synthetic library, Name ordering, no filters and
the same tap on M. The after image uses the independently selected alphabet fix
exported by Morphe Manager. This is a correctness comparison, not a performance benchmark.

| Before | After |
| :---: | :---: |
| **M stays in the numeric section** | **M reaches Midnight 01** |
| <img src="../tests/finamp/evidence/2026-10-28-next/1790-before-M.png" width="300" alt="Before: an M jump stays among numeric track titles"> | <img src="../tests/finamp/evidence/2026-10-28-next/1790-after-M.png" width="300" alt="After: the same M jump reaches Midnight 01"> |

[Capture provenance & checks](../tests/finamp/evidence/2026-10-28-next/README.md) · [Back to patch index](#before--after)

<a id="keep-player-output-controls-accessible"></a>

## Keep player output controls accessible

**Finamp 1.0.1** · [Setup & patch details](FINAMP_NATIVE.md)

When bottom actions are hidden, the track menu ends with **Output, Queue and
Lyrics**. Both menu-button and artwork-context access respect disabled gestures.
Visible bottom actions have no duplicates in the menu.

**Android APK captures.** Same synthetic track paused at 00:17, Dark theme, hidden
bottom actions, disabled gestures, 1080×1920 viewport and 09:41 clock. The before
APK retains the official native code; the after APK is the actual Player-only
Morphe Manager export, installed through Manager’s Install action with the same test key.

| Before | After |
| :---: | :---: |
| **Hidden bottom actions leave no menu routes** | **Output, Queue and Lyrics remain reachable** |
| <img src="../tests/finamp/evidence/2026-10-30-player/player-before.png" width="300" alt="Before: original player menu ends without Output, Queue or Lyrics"> | <img src="../tests/finamp/evidence/2026-10-30-player/player-after.png" width="300" alt="After: installed Manager export adds Output, Queue and Lyrics at the menu bottom"> |

[Capture provenance & checks](../tests/finamp/evidence/2026-10-30-player/README.md) · [Back to patch index](#before--after)

<a id="fix-quick-settings-banner-contrast"></a>

## Fix quick settings banner contrast

**Finamp 1.0.1** · [Setup & patch details](FINAMP_NATIVE.md)

Keep the quick-settings banner readable with a custom accent. Its text uses the matching `onPrimaryContainer` color, like its existing icons.

**Upstream status · 2026-10-29:** the fix already exists on [`hotfix-1.0.2`](https://github.com/finamp-app/finamp/tree/hotfix-1.0.2) ([`124edc8`](https://github.com/finamp-app/finamp/commit/124edc8b94ea8fcba637a1dba31e7bd266644aa8)). Duplicate [PR #1837](https://github.com/finamp-app/finamp/pull/1837) is closed; this Penguin backport remains selectable for the original Finamp 1.0.1 APK.

**Android APK captures.** Same Home screen, synthetic music, Light theme, accent **#152E85**, viewport and clock. The before retains the official native code; the after is the installed Manager export with only this patch selected.

| Before | After |
| :---: | :---: |
| **Dark text is hard to read on the blue banner** | **Matching foreground keeps the banner readable** |
| <img src="../tests/finamp/evidence/2026-10-29-ui/banner-before.png" width="300" alt="Before: Dark text is hard to read on the blue banner"> | <img src="../tests/finamp/evidence/2026-10-29-ui/banner-after.png" width="300" alt="After: Matching foreground keeps the banner readable"> |

[Raw captures, provenance & Manager checks](../tests/finamp/evidence/2026-10-29-ui/README.md) · [Closed duplicate PR #1837](https://github.com/finamp-app/finamp/pull/1837) · [Back to patch index](#before--after)

<a id="zoom-article-images"></a>

## Zoom article images

**Feeder 2.25.0 · project GitHub F-Droid APK** · [Setup & patch details](FEEDER.md)

Open an article image in its own viewer and pinch, pan or double-tap to inspect small details.

**Android APK captures.** Same synthetic offline article and image; the after capture shows actual zoom in the separate Morphe-patched viewer.

| Before | After |
| :---: | :---: |
| **Diagram stays at article width** | **Same diagram enlarged in the image viewer** |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/feeder-391/2026-10-24/before.png" width="300" alt="Before: Diagram stays at article width"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/feeder-391/2026-10-24/zoomed.png" width="300" alt="After: Same diagram enlarged in the image viewer"> |

[Capture provenance & checks](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/feeder-391/2026-10-24) · [Back to patch index](#before--after)

<a id="configure-custom-oauth-for-infinity"></a>

## Configure custom OAuth for Infinity+

**Infinity+ 8.3.4** · [Setup & patch details](INFINITY.md)

Use your own authorized Reddit OAuth client and reach the existing login flow without the app subscription prompt.

**Breal versus Penguin comparison.** Both are patched Infinity+ APKs; the Breal before capture uses the recorded billing state 4, not the unmodified official app. The after image shows login consent, with no account data. Reddit API approval/access is still required.

| Before | After |
| :---: | :---: |
| **Breal 1.4.123: Subscription prompt blocks login** | **Penguin: login reaches the User Agreement** |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/infinity-834/2026-10-25/before-breal-1.4.123.png" width="300" alt="Before: Breal 1.4.123: Subscription prompt blocks login"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/infinity-834/2026-10-25/after-penguin-login.png" width="300" alt="After: Penguin: login reaches the User Agreement"> |

[Capture provenance & checks](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/infinity-834/2026-10-25) · [Back to patch index](#before--after)

<a id="readable-calendar-descriptions"></a>

## Readable Calendar descriptions

**Fossify Calendar 1.12.0** · [Setup & patch details](CALENDAR.md)

Read an HTML event description as text while retaining an explicit Edit HTML source action.

**Previous versus revised Morphe patch.** This is the wrapperless-table regression on the official APK, not an original-versus-patched pair or a source-fork capture. It demonstrates readable cell text, not a full HTML table layout. Live Outlook sync is outside the evidence.

| Before | After |
| :---: | :---: |
| **Previous Morphe patch: raw table tags** | **Revised patch: Morning Workshop, with source editing** |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/calendar-table-review/before-editor.png" width="300" alt="Before: Previous Morphe patch: raw table tags"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/calendar-table-review/after-editor.png" width="300" alt="After: Revised patch: Morning Workshop, with source editing"> |

[Capture provenance & checks](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/calendar-table-review) · [Back to patch index](#before--after)

<a id="separate-all-day-reminder-defaults"></a>

## Separate all-day reminder defaults

**Fossify Calendar 1.12.0** · [Setup & patch details](CALENDAR_REMINDERS.md)

Give new all-day events their own reminder defaults while keeping timed-event defaults separate.

**Android APK captures.** Same unsaved draft, dates and timed defaults. The after prototype includes both Calendar patches; the pictured difference is the all-day reminder defaults. These are configured example values, not the first-run defaults.

| Before | After |
| :---: | :---: |
| **All-day draft inherits 30 minutes / 2 hours** | **Same draft uses 6 hours / 1 day / at start** |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/calendar-381/2026-10-24/before.png" width="300" alt="Before: All-day draft inherits 30 minutes / 2 hours"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/calendar-381/2026-10-24/after.png" width="300" alt="After: Same draft uses 6 hours / 1 day / at start"> |

[Capture provenance & checks](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/calendar-381/2026-10-24) · [Back to patch index](#before--after)

<a id="dismiss-notifications-when-marking-conversations-read"></a>

## Dismiss notifications when marking conversations read

**Fossify Messages 1.10.1** · [Setup & patch details](MESSAGES.md)

Remove a conversation notification after marking that conversation read from the app list.

**Android APK captures.** Synthetic SMS only. The final after run marks both fixture threads read; unrelated-thread retention is established by the separate tests, not this empty shade alone.

| Before | After |
| :---: | :---: |
| **Marked read in the list; notification remains** | **Marked read in the list; Messages notification removed** |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/messages/before.png" width="300" alt="Before: Marked read in the list; notification remains"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/messages/after.png" width="300" alt="After: Marked read in the list; Messages notification removed"> |

[Capture provenance & checks](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/README.md) · [Back to patch index](#before--after)

<a id="keep-background-conversations-unread"></a>

## Keep background conversations unread

**Fossify Messages 1.10.1** · [Setup & patch details](MESSAGES.md)

Keep an incoming message unread when its conversation is open in a background Activity.

**Android APK captures.** The fixture leaves the thread with Home, receives a synthetic SMS, then opens the conversation list. Provider records confirm read=1 before and read=0 after. Lifecycle patches are tested together and apply independently.

| Before | After |
| :---: | :---: |
| **Background message appears read; no unread count** | **Background message stays bold with unread count 1** |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/messages-lifecycle/927/before.png" width="300" alt="Before: Background message appears read; no unread count"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/messages-lifecycle/927/after.png" width="300" alt="After: Background message stays bold with unread count 1"> |

[Capture provenance & checks](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/messages-lifecycle) · [Back to patch index](#before--after)

<a id="avoid-notifications-for-visible-conversations"></a>

## Avoid notifications for visible conversations

**Fossify Messages 1.10.1** · [Setup & patch details](MESSAGES.md)

Avoid leaving a notification for a message already received in the currently visible conversation.

**Android APK captures.** Same visible-thread scenario with synthetic SMS, followed by Back and the notification shade. No manual notification dismissal occurs between receipt and capture.

| Before | After |
| :---: | :---: |
| **Read while visible; notification remains after Back** | **Read while visible; no Messages notification after Back** |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/messages-lifecycle/928/before.png" width="300" alt="Before: Read while visible; notification remains after Back"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/messages-lifecycle/928/after.png" width="300" alt="After: Read while visible; no Messages notification after Back"> |

[Capture provenance & checks](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/messages-lifecycle) · [Back to patch index](#before--after)

<a id="keep-favorites-consistent-after-folder-rename-or-removal"></a>

## Keep favorites consistent after folder rename or removal

**Fossify File Manager 1.6.2** · [Setup & patch details](FILE_MANAGER.md)

Keep nested favorites pointing to the right folder after a parent-folder rename.

**Android APK captures.** Both follow a real Docs → Docs2 UI rename with synthetic files. This pair illustrates rename handling; selected-deletion cleanup and its pre-deletion timing are documented in the guide.

| Before | After |
| :---: | :---: |
| **Docs renamed to Docs2; favorite still uses Docs/Projects** | **Favorite follows Docs2/Projects** |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/filemanager/before.png" width="300" alt="Before: Docs renamed to Docs2; favorite still uses Docs/Projects"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/filemanager/after.png" width="300" alt="After: Favorite follows Docs2/Projects"> |

[Capture provenance & checks](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/README.md) · [Back to patch index](#before--after)

<a id="show-emails-and-notes-from-merged-contacts"></a>

## Show emails and notes from merged contacts

**Fossify Contacts 1.6.0** · [Setup & patch details](CONTACTS.md)

See the email and note contributed by a duplicate contact in the merged detail view.

**Android APK captures.** The same synthetic contact pair is shown with Merge duplicate contacts enabled. Source contact records are retained; this is a display fix.

| Before | After |
| :---: | :---: |
| **Merged view hides the duplicate email and note** | **Email and Local note stays intact are visible** |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/contact-music/contacts/before.png" width="300" alt="Before: Merged view hides the duplicate email and note"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/contact-music/contacts/after.png" width="300" alt="After: Email and Local note stays intact are visible"> |

[Capture provenance & checks](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/contact-music) · [Back to patch index](#before--after)

<a id="prefer-each-track-s-embedded-cover"></a>

## Prefer each track's embedded cover

**Fossify Music Player 1.8.4** · [Setup & patch details](MUSIC.md)

Show the artwork embedded in the current track rather than reusing another track's album cover.

**Android APK captures.** Two synthetic audio files share an album ID and have different embedded covers. File hashes and the existing fallback path are checked separately.

| Before | After |
| :---: | :---: |
| **Penguin Blue and Penguin Red both show red artwork** | **Penguin Blue shows blue; Penguin Red stays red** |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/contact-music/music/before.png" width="300" alt="Before: Penguin Blue and Penguin Red both show red artwork"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/contact-music/music/after.png" width="300" alt="After: Penguin Blue shows blue; Penguin Red stays red"> |

[Capture provenance & checks](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/contact-music) · [Back to patch index](#before--after)

<a id="restore-widget-editing-from-the-search-menu"></a>

## Restore widget editing from the search menu

**Kvaesitso 1.41.0** · [Setup & patch details](KVAESITSO.md)

Reach the existing widget editor from the search-bar menu even when the on-screen Edit button is hidden.

**Android APK captures.** Same hidden-button preference and synthetic widget layout. The patched action opens the app's existing editor; it does not re-enable the hidden button.

| Before | After |
| :---: | :---: |
| **Search menu has no Edit widgets action** | **Edit widgets appears at the top of the same menu** |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/kvaesitso-1504/2026-10-24/before.png" width="300" alt="Before: Search menu has no Edit widgets action"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/kvaesitso-1504/2026-10-24/after.png" width="300" alt="After: Edit widgets appears at the top of the same menu"> |

[Capture provenance & checks](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/kvaesitso-1504/2026-10-24) · [Back to patch index](#before--after)

<a id="choose-upcoming-alarm-notification-time"></a>

## Choose upcoming alarm notification time

**Fossify Clock 1.6.0** · [Setup & patch details](CLOCK.md)

Choose when upcoming-alarm notices appear and keep a separate notice for each alarm.

**Android APK captures.** Same two alarms, approximately 45 and 60 minutes ahead. The notices arrive through natural AlarmManager delivery. Lead time is configured in Morphe when patching; this adds no in-app setting.

| Before | After |
| :---: | :---: |
| **No upcoming notices outside the original ten-minute window** | **Two alarm notices within the configured 120-minute window** |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/clock-14/2026-10-24/before.png" width="300" alt="Before: No upcoming notices outside the original ten-minute window"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/clock-14/2026-10-24/after.png" width="300" alt="After: Two alarm notices within the configured 120-minute window"> |

[Capture provenance & checks](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/clock-14/2026-10-24) · [Back to patch index](#before--after)

<a id="navigate-to-the-parent-task"></a>

## Navigate to the parent task

**Tasks.org 15.13 · project GitHub F-Droid APK** · [Setup & patch details](TASKS.md)

Open the immediate parent task from the child editor using an explicit up-arrow.

**Android APK captures.** Same synthetic child task, notes and date. The guide also records Save / Discard / Cancel for changed drafts. The red reminder warning is existing Android permission state, not a change made by this patch.

| Before | After |
| :---: | :---: |
| **Child editor has no parent-navigation action** | **Up-arrow appears next to the existing actions** |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/tasks-2838/2026-10-24/before.png" width="300" alt="Before: Child editor has no parent-navigation action"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/tasks-2838/2026-10-24/after.png" width="300" alt="After: Up-arrow appears next to the existing actions"> |

[Capture provenance & checks](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/tasks-2838/2026-10-24) · [Back to patch index](#before--after)

<a id="import-nested-opml-feeds"></a>

## Import nested OPML feeds

**Read You 0.16.2 · official GitHub APK** · [Setup & patch details](READYOU.md)

Keep feeds inside nested OPML folders when importing subscriptions. Preserve feed
order and per-feed settings within the app's existing flat outer group.

**Android APK captures.** Same three-feed synthetic OPML, All filter, collapsed
Default group, light theme, display size and density. Original official payload
resigned with the fixture key versus the actual Morphe Manager export installed
with that same key. Each import starts without the synthetic Manga news group.

| Before | After |
| :---: | :---: |
| **Only 1 of 3 feeds imported** | **All 3 feeds imported** |
| <img src="../tests/readyou/evidence/2026-10-29/before.png" width="300" alt="Before: only Reader releases appears in Manga news"> | <img src="../tests/readyou/evidence/2026-10-29/after.png" width="300" alt="After: Reader releases, Studio journal and Chapter notes appear in Manga news"> |

[Capture provenance & checks](../tests/readyou/evidence/2026-10-29/README.md) · [Back to patch index](#before--after)

<a id="keep-local-manga-in-exclusion-searches"></a>

## Keep local manga in exclusion searches

**Komikku 1.14.1 ARM64** · [Setup & patch details](KOMIKKU.md)

The library search `-meteor` keeps unrelated local **Orion** after patching.
Matching local **Meteor** remains excluded; remote **Lyra** is the control.

**Installed Android APK captures.** Same synthetic library, light theme,
1080 × 1920 display, density 420, sort/filter and query; keyboard dismissed.
The original official payload is signed with the fixture key. The after capture
uses the actual Morphe Manager 2.2.0 JVM export, installed through Android's
update dialog with that same key. The app renders both screenshots directly.

| Before | After |
| :---: | :---: |
| **Unrelated local Orion disappears** | **Orion remains; Meteor is still excluded** |
| <img src="../tests/komikku/evidence/2026-10-30/before.png" width="300" alt="Before: exclusion search for meteor shows only remote Lyra and loses local Orion"> | <img src="../tests/komikku/evidence/2026-10-30/after.png" width="300" alt="After: the same search shows local Orion and remote Lyra while local Meteor remains excluded"> |

[Capture provenance & checks](../tests/komikku/evidence/2026-10-30/README.md) · [Back to patch index](#before--after)

## About these comparisons

Some evidence was published while a patch was still a prototype. Its pinned provenance keeps that historical wording; the [current release catalogue](../README.md#generated-patch-catalogue) records what is published now. APK captures and source-widget captures establish different things. Screenshots alone do not establish physical-device, account-sync, carrier or real-library performance acceptance. See each guide for the tested scope.

Upstream apps and their UI retain their respective authorship and license terms. [License and visual provenance](PROVENANCE.md) · [Safe setup and signing](SETUP.md).
