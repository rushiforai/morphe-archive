# Penguin Patches

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/penguin-patches-banner-tailor-dark.png">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/penguin-patches-banner-tailor.png">
  <img src="docs/assets/penguin-patches-banner-tailor.png" alt="Penguin Patches — a penguin stitching a repair patch onto a fabric app tile in an embroidery hoop" width="1800">
</picture>

[English](README.md) · [Deutsch](docs/readme/README.de.md) · [简体中文](docs/readme/README.zh-CN.md) · [日本語](docs/readme/README.ja.md) · [Español](docs/readme/README.es.md) · [한국어](docs/readme/README.ko.md) · [Português (Brasil)](docs/readme/README.pt-BR.md) · [Français](docs/readme/README.fr.md)

[![Release](https://img.shields.io/github/v/release/pengusto/penguin-patches?label=release)](https://github.com/pengusto/penguin-patches/releases/latest) [![License: GPL-3.0](https://img.shields.io/badge/license-GPL--3.0-blue)](LICENSE) [![Android](https://img.shields.io/badge/platform-Android-3DDC84)](docs/SETUP.md) [![Morphe compatible](https://img.shields.io/badge/Morphe-compatible-6f42c1)](docs/SETUP.md)

**Your apps. A little better.**

Use Infinity+ with your own Reddit OAuth client, plus focused fixes for your other Android apps, ready for Morphe.

Penguin Patches is an independent collection of fixes for selected Android apps. Each app guide identifies the exact original APK and documents what was tested.

**[Set up Infinity+ →](docs/INFINITY.md)** · [Choose a Morphe source](docs/SETUP.md#add-the-source-and-patch)

### Choose your patches

In Morphe Manager, copy a source URL and add it as a **remote JSON source**:

- **Standard:** Infinity+, Fossify and the other supported apps except Finamp. [Standard source URL](https://raw.githubusercontent.com/pengusto/penguin-patches/main/bundles/standard/patches-bundle.json)
- **Finamp:** One small, default-selected patch applies all available fixes together, including the artist-order change. The [existing Finamp source URL](https://raw.githubusercontent.com/pengusto/penguin-patches/main/bundles/finamp/patches-bundle.json) switches to the compact bundle with the release containing this change.
- **Finamp individual:** Choose any subset of the individual patches; this optional source downloads the large native selection matrix. The [individual Finamp source URL](https://raw.githubusercontent.com/pengusto/penguin-patches/main/bundles/finamp-individual/patches-bundle.json) becomes available with that release.

The [original combined source](https://morphe.software/add-source?github=pengusto/penguin-patches) also switches to the compact Finamp patch. Existing installations and signing keys are unaffected. After the source update, Morphe can immediately start patching Finamp with all available fixes selected; enable Expert mode to review the selection first. Choose either Finamp Complete or individual patches for a patching run, not both. [Setup and migration details →](docs/SETUP.md#add-the-source-and-patch)

<!-- PATCHES_SUMMARY_START -->
**17 patches · 14 apps · [v1.9.3](https://github.com/pengusto/penguin-patches/releases/tag/v1.9.3)**
<!-- PATCHES_SUMMARY_END -->

[Before & after](#patch-previews) · [Supported apps](#generated-patch-catalogue) · [Setup & signing](#patch-an-app) · [Latest release](https://github.com/pengusto/penguin-patches/releases/latest)

<!-- PATCHES_APPS_START -->
**Featured**

<p><a href="docs/INFINITY.md"><img src="https://raw.githubusercontent.com/Docile-Alligator/Infinity-For-Reddit/cc2845af8c4bb9375ee56b93944c5a0fa3ad70e0/fastlane/metadata/android/en-US/images/icon.png" alt="Infinity+ app icon" width="32" height="32"><br>Infinity+</a></p>

**Fossify**

<table>
<tr><td align="center"><a href="docs/CALENDAR.md"><img src="https://raw.githubusercontent.com/FossifyOrg/Calendar/a0d428461b5caac11ad570f77a4134b912093205/fastlane/metadata/android/en-US/images/icon.png" alt="Fossify Calendar app icon" width="32" height="32"><br>Calendar</a></td><td align="center"><a href="docs/CLOCK.md"><img src="https://raw.githubusercontent.com/FossifyOrg/Clock/0511f508368ada82cdb587b0bf8df9d56cf9e6ad/fastlane/metadata/android/en-US/images/icon.png" alt="Fossify Clock app icon" width="32" height="32"><br>Clock</a></td></tr>
<tr><td align="center"><a href="docs/CONTACTS.md"><img src="https://raw.githubusercontent.com/FossifyOrg/Contacts/6938eccfd1a10f924a6ced13695c73bd0cd84328/fastlane/metadata/android/en-US/images/icon.png" alt="Fossify Contacts app icon" width="32" height="32"><br>Contacts</a></td><td align="center"><a href="docs/FILE_MANAGER.md"><img src="https://raw.githubusercontent.com/FossifyOrg/File-Manager/c95de62b90c9f42601b88eca4f795338da3b161c/fastlane/metadata/android/en-US/images/icon.png" alt="Fossify File Manager app icon" width="32" height="32"><br>File Manager</a></td></tr>
<tr><td align="center"><a href="docs/MESSAGES.md"><img src="https://raw.githubusercontent.com/FossifyOrg/Messages/02f511b292cc9790d0189a7e3d96ce3d71493890/fastlane/metadata/android/en-US/images/icon.png" alt="Fossify Messages app icon" width="32" height="32"><br>Messages</a></td><td align="center"><a href="docs/MUSIC.md"><img src="https://raw.githubusercontent.com/FossifyOrg/Music-Player/e76d0f222eaba2cfd4501ccc3b6a8d2e9f29b0c3/fastlane/metadata/android/en-US/images/icon.png" alt="Fossify Music Player app icon" width="32" height="32"><br>Music Player</a></td></tr>
</table>

**More apps**

<table>
<tr><td align="center"><a href="docs/FEEDER.md"><img src="https://raw.githubusercontent.com/spacecowboy/Feeder/846b19d39b932b1a9864b4317365034f36fc4856/fastlane/metadata/android/en-US/images/icon.png" alt="Feeder app icon" width="32" height="32"><br>Feeder</a></td><td align="center"><a href="docs/KOMIKKU.md"><img src="https://raw.githubusercontent.com/komikku-app/komikku/383ffaa81667f45fc6c2975edb1760a7606531d3/.github/readme-images/app-icon.png" alt="Komikku app icon" width="32" height="32"><br>Komikku</a></td></tr>
<tr><td align="center"><a href="docs/KVAESITSO.md"><img src="https://raw.githubusercontent.com/MM2-0/Kvaesitso/c4805f3f18d5bcf071c5287f81466efd79169b20/fastlane/metadata/android/en-US/images/icon.png" alt="Kvaesitso app icon" width="32" height="32"><br>Kvaesitso</a></td><td align="center"><a href="docs/MIHON.md"><img src="https://raw.githubusercontent.com/mihonapp/mihon/ede052af170e2ef2949dac2acd91adfb58043a96/fastlane/metadata/android/en-US/images/icon.png" alt="Mihon app icon" width="32" height="32"><br>Mihon</a></td></tr>
<tr><td align="center"><a href="docs/READYOU.md"><img src="https://raw.githubusercontent.com/ReadYouApp/ReadYou/d2b979ccad9a3e54b9499929a9dc2824578b0fd9/fastlane/metadata/android/en-US/images/icon.png" alt="Read You app icon" width="32" height="32"><br>Read You</a></td><td align="center"><a href="docs/TASKS.md"><img src="https://raw.githubusercontent.com/tasks/tasks/d7c0afdb94f913943fd54833d3e108871e78bc36/fastlane/metadata/android/en-US/images/icon.png" alt="Tasks.org app icon" width="32" height="32"><br>Tasks.org</a></td></tr>
</table>

**Optional Finamp**

<p><a href="docs/FINAMP_NATIVE.md"><img src="https://raw.githubusercontent.com/finamp-app/finamp/f001dcd396ab2c65d466ad60e4380c53c45d34d9/fastlane/metadata/android/en-US/images/icon.png" alt="Finamp app icon" width="32" height="32"><br>Finamp</a></p>
<!-- PATCHES_APPS_END -->

**Before installing:** use the exact original APK in your app's guide, verify your backup and keep your signing key. [Read the setup guide →](docs/SETUP.md)

## Infinity+: your Reddit client, your OAuth setup

Use your authorized Reddit OAuth client and reach the existing login flow without the app subscription prompt. Reddit API approval and access are still required.

In Morphe Manager 2.4.0, enable **Expert mode** before setting the three OAuth options. [Setup and current Manager limitation](docs/INFINITY.md#configure-and-patch).

**[Set up Infinity+ →](docs/INFINITY.md)** · [See the comparison and its baseline →](#preview-configure-custom-oauth-for-infinity)

## More fixes: Finamp, with the album artist first

Album artists first. Other credits alphabetical. More modes in settings.

| Before · original code | After · Song artist order |
| :---: | :---: |
| <img src="tests/finamp/evidence/2026-10-28/credits-before.png" alt="Finamp original: track credits read A Guest, B Guest, Z Lead" width="360"> | <img src="tests/finamp/evidence/2026-10-28/credits-after.png" alt="Finamp patched: album artist Z Lead appears first, followed by A Guest, B Guest" width="360"> |

Real Android APK captures with synthetic music data. [Evidence & limits](tests/finamp/evidence/2026-10-28/README.md).

<!-- FINAMP_COUNT_START -->
**[Explore the 1 Finamp patch →](docs/FINAMP_NATIVE.md)**
<!-- FINAMP_COUNT_END -->

Choose how song credits appear, keep Output reachable with hidden player buttons, improve banner contrast, and fix library browsing or settings errors. For the official **Finamp 1.0.1 universal APK → ARM64 output**.

**Upstream status · 2026-10-29:** the [title fix is merged](https://github.com/finamp-app/finamp/pull/1830), and the [banner fix already exists on `hotfix-1.0.2`](https://github.com/finamp-app/finamp/tree/hotfix-1.0.2). Both are included in Finamp Complete and remain individually selectable in the separate source for the original **Finamp 1.0.1 APK**. [Status & release details](docs/FINAMP.md#upstream-status-2026-10-29).

[Player output](#preview-keep-player-output-controls-accessible) · [Title validation](#preview-fix-section-title-validation) · [Artist-page loading](#preview-load-artist-pages-faster) · [Offline artists](#preview-fix-offline-artist-tracks) · [Alphabet jumps](#preview-fix-track-alphabet-navigation)

| Feeder | Infinity+ |
| :--- | :--- |
| **Get closer to article images.** Tap to open a separate viewer; pinch, pan and double-tap to inspect the details. | **Use your own Reddit OAuth client.** Open the existing sign-in flow without the app's subscription gate. Reddit API approval/access is still required. |
| [Explore the Feeder patch →](docs/FEEDER.md) · [Before / after](#preview-zoom-article-images) | [Set up Infinity+ →](docs/INFINITY.md) · [Before / after](#preview-configure-custom-oauth-for-infinity) |

<a id="patch-previews"></a>

## Every patch, before & after

Open any patch below to see its matching before/after pair, right here. Grouped by app, with the capture baseline and evidence beside every pair. [Open the separate gallery →](docs/PATCH_EXAMPLES.md)

<!-- PATCHES_PREVIEWS_START -->
<a id="previews-ml-docilealligator-infinityforreddit-plus"></a>

### <img src="https://raw.githubusercontent.com/Docile-Alligator/Infinity-For-Reddit/cc2845af8c4bb9375ee56b93944c5a0fa3ad70e0/fastlane/metadata/android/en-US/images/icon.png" alt="Infinity+ app icon" width="24" height="24"> Infinity+ · 1 patch

<a id="preview-configure-custom-oauth-for-infinity"></a>

<details>
<summary><strong>Configure custom OAuth for Infinity+</strong> · Before / after</summary>
<br>

**Infinity+ 8.3.4** · [Setup & patch details](docs/INFINITY.md)

Use your own authorized Reddit OAuth client and reach the existing login flow without the app subscription prompt.

**Breal versus Penguin comparison.** Both are patched Infinity+ APKs; the Breal before capture uses the recorded billing state 4, not the unmodified official app. The after image shows login consent, with no account data. Reddit API approval/access is still required.

| Before | After |
| :---: | :---: |
| **Breal 1.4.123: Subscription prompt blocks login** | **Penguin: login reaches the User Agreement** |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/infinity-834/2026-10-25/before-breal-1.4.123.png" width="300" alt="Before: Breal 1.4.123: Subscription prompt blocks login"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/infinity-834/2026-10-25/after-penguin-login.png" width="300" alt="After: Penguin: login reaches the User Agreement"> |

[Capture provenance & checks](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/infinity-834/2026-10-25) · [Back to patch index](#patch-previews)

</details>

<a id="previews-org-fossify-calendar"></a>

### <img src="https://raw.githubusercontent.com/FossifyOrg/Calendar/a0d428461b5caac11ad570f77a4134b912093205/fastlane/metadata/android/en-US/images/icon.png" alt="Fossify Calendar app icon" width="24" height="24"> Fossify Calendar · 2 patches

<a id="preview-readable-calendar-descriptions"></a>

<details>
<summary><strong>Readable Calendar descriptions</strong> · Before / after</summary>
<br>

**Fossify Calendar 1.12.0, 1.12.1 and 1.12.2** · [Setup & patch details](docs/CALENDAR.md)

Read HTML event descriptions in the editor, event lists, widget and reminders.
The editor also offers an explicit Edit HTML source action and preserves the
original source when unrelated event fields change.

**Editor**

**Previous versus revised Morphe patch.** This is the wrapperless-table regression on the official APK, not an original-versus-patched pair or a source-fork capture. It demonstrates readable cell text, not a full HTML table layout. Live Outlook sync is outside the evidence.

| Before | After |
| :---: | :---: |
| **Previous Morphe patch: raw table tags** | **Revised patch: Morning Workshop, with source editing** |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/calendar-table-review/before-editor.png" width="300" alt="Before: Previous Morphe patch: raw table tags"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/calendar-table-review/after-editor.png" width="300" alt="After: Revised patch: Morning Workshop, with source editing"> |

**Day list**

The same 1.12.0 synthetic event and previous-versus-revised patch comparison.

| Before | After |
| :---: | :---: |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/calendar-table-review/before-list.png" width="300" alt="Before: Previous patch shows table tags in the day list"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/calendar-table-review/after-list.png" width="300" alt="After: Revised patch shows readable text in the day list"> |

[Editor and day-list capture provenance](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/calendar-table-review)

**Widget**

Original versus Manager-patched 1.12.1, using the same synthetic event. The
app's actual widget RemoteViews are rendered in a test container, not a launcher.

| Before | After |
| :---: | :---: |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/6cef3805d5f9e9109e81211483b03029d38c78c3/calendar-html-surfaces/2026-11-04/before-widget.png" width="300" alt="Before: Original widget render shows HTML tags"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/6cef3805d5f9e9109e81211483b03029d38c78c3/calendar-html-surfaces/2026-11-04/after-widget.png" width="300" alt="After: Patched widget render shows readable text"> |

**Reminder**

Original versus Manager-patched 1.12.1: Calendar's posted notification in the
Android notification shade, using the same synthetic description as the widget.
This directly invokes the notification builder; it does not verify a scheduled
reminder for a synchronized event. A report of raw HTML in such a reminder is
still under investigation in [issue #56](https://github.com/pengusto/penguin-patches/issues/56).

| Before | After |
| :---: | :---: |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/6cef3805d5f9e9109e81211483b03029d38c78c3/calendar-html-surfaces/2026-11-04/before-notification.png" width="300" alt="Before: Original reminder shows HTML tags"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/6cef3805d5f9e9109e81211483b03029d38c78c3/calendar-html-surfaces/2026-11-04/after-notification.png" width="300" alt="After: Patched reminder shows readable text"> |

[Widget and reminder provenance](https://github.com/pengusto/penguin-patches/tree/6cef3805d5f9e9109e81211483b03029d38c78c3/calendar-html-surfaces/2026-11-04) · [Coverage and remaining checks](docs/CALENDAR.md#verification-and-limits) · [Back to patch index](#patch-previews)

</details>

<a id="preview-separate-all-day-reminder-defaults"></a>

<details>
<summary><strong>Separate all-day reminder defaults</strong> · Before / after</summary>
<br>

**Fossify Calendar 1.12.0** · [Setup & patch details](docs/CALENDAR_REMINDERS.md)

Give new all-day events their own reminder defaults while keeping timed-event defaults separate.

**Android APK captures.** Same unsaved draft, dates and timed defaults. The after prototype includes both Calendar patches; the pictured difference is the all-day reminder defaults. These are configured example values, not the first-run defaults.

| Before | After |
| :---: | :---: |
| **All-day draft inherits 30 minutes / 2 hours** | **Same draft uses 6 hours / 1 day / at start** |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/calendar-381/2026-10-24/before.png" width="300" alt="Before: All-day draft inherits 30 minutes / 2 hours"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/calendar-381/2026-10-24/after.png" width="300" alt="After: Same draft uses 6 hours / 1 day / at start"> |

[Capture provenance & checks](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/calendar-381/2026-10-24) · [Back to patch index](#patch-previews)

</details>

<a id="previews-org-fossify-clock"></a>

### <img src="https://raw.githubusercontent.com/FossifyOrg/Clock/0511f508368ada82cdb587b0bf8df9d56cf9e6ad/fastlane/metadata/android/en-US/images/icon.png" alt="Fossify Clock app icon" width="24" height="24"> Fossify Clock · 1 patch

<a id="preview-choose-upcoming-alarm-notification-time"></a>

<details>
<summary><strong>Choose upcoming alarm notification time</strong> · Before / after</summary>
<br>

**Fossify Clock 1.6.0** · [Setup & patch details](docs/CLOCK.md)

Choose when upcoming-alarm notices appear and keep a separate notice for each alarm.

**Android APK captures.** Same two alarms, approximately 45 and 60 minutes ahead. The notices arrive through natural AlarmManager delivery. Lead time is configured in Morphe when patching; this adds no in-app setting.

| Before | After |
| :---: | :---: |
| **No upcoming notices outside the original ten-minute window** | **Two alarm notices within the configured 120-minute window** |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/clock-14/2026-10-24/before.png" width="300" alt="Before: No upcoming notices outside the original ten-minute window"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/clock-14/2026-10-24/after.png" width="300" alt="After: Two alarm notices within the configured 120-minute window"> |

[Capture provenance & checks](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/clock-14/2026-10-24) · [Back to patch index](#patch-previews)

</details>

<a id="previews-org-fossify-contacts"></a>

### <img src="https://raw.githubusercontent.com/FossifyOrg/Contacts/6938eccfd1a10f924a6ced13695c73bd0cd84328/fastlane/metadata/android/en-US/images/icon.png" alt="Fossify Contacts app icon" width="24" height="24"> Fossify Contacts · 1 patch

<a id="preview-show-emails-and-notes-from-merged-contacts"></a>

<details>
<summary><strong>Show emails and notes from merged contacts</strong> · Before / after</summary>
<br>

**Fossify Contacts 1.6.0** · [Setup & patch details](docs/CONTACTS.md)

See the email and note contributed by a duplicate contact in the merged detail view.

**Android APK captures.** The same synthetic contact pair is shown with Merge duplicate contacts enabled. Source contact records are retained; this is a display fix.

| Before | After |
| :---: | :---: |
| **Merged view hides the duplicate email and note** | **Email and Local note stays intact are visible** |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/contact-music/contacts/before.png" width="300" alt="Before: Merged view hides the duplicate email and note"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/contact-music/contacts/after.png" width="300" alt="After: Email and Local note stays intact are visible"> |

[Capture provenance & checks](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/contact-music) · [Back to patch index](#patch-previews)

</details>

<a id="previews-org-fossify-filemanager"></a>

### <img src="https://raw.githubusercontent.com/FossifyOrg/File-Manager/c95de62b90c9f42601b88eca4f795338da3b161c/fastlane/metadata/android/en-US/images/icon.png" alt="Fossify File Manager app icon" width="24" height="24"> Fossify File Manager · 1 patch

<a id="preview-keep-favorites-consistent-after-folder-rename-or-removal"></a>

<details>
<summary><strong>Keep favorites consistent after folder rename or removal</strong> · Before / after</summary>
<br>

**Fossify File Manager 1.6.2** · [Setup & patch details](docs/FILE_MANAGER.md)

Keep nested favorites pointing to the right folder after a parent-folder rename.

**Android APK captures.** Both follow a real Docs → Docs2 UI rename with synthetic files. This pair illustrates rename handling; selected-deletion cleanup and its pre-deletion timing are documented in the guide.

| Before | After |
| :---: | :---: |
| **Docs renamed to Docs2; favorite still uses Docs/Projects** | **Favorite follows Docs2/Projects** |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/filemanager/before.png" width="300" alt="Before: Docs renamed to Docs2; favorite still uses Docs/Projects"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/filemanager/after.png" width="300" alt="After: Favorite follows Docs2/Projects"> |

[Capture provenance & checks](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/README.md) · [Back to patch index](#patch-previews)

</details>

<a id="previews-org-fossify-messages"></a>

### <img src="https://raw.githubusercontent.com/FossifyOrg/Messages/02f511b292cc9790d0189a7e3d96ce3d71493890/fastlane/metadata/android/en-US/images/icon.png" alt="Fossify Messages app icon" width="24" height="24"> Fossify Messages · 3 patches

<a id="preview-avoid-notifications-for-visible-conversations"></a>

<details>
<summary><strong>Avoid notifications for visible conversations</strong> · Before / after</summary>
<br>

**Fossify Messages 1.10.1** · [Setup & patch details](docs/MESSAGES.md)

Avoid leaving a notification for a message already received in the currently visible conversation.

**Android APK captures.** Same visible-thread scenario with synthetic SMS, followed by Back and the notification shade. No manual notification dismissal occurs between receipt and capture.

| Before | After |
| :---: | :---: |
| **Read while visible; notification remains after Back** | **Read while visible; no Messages notification after Back** |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/messages-lifecycle/928/before.png" width="300" alt="Before: Read while visible; notification remains after Back"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/messages-lifecycle/928/after.png" width="300" alt="After: Read while visible; no Messages notification after Back"> |

[Capture provenance & checks](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/messages-lifecycle) · [Back to patch index](#patch-previews)

</details>

<a id="preview-dismiss-notifications-when-marking-conversations-read"></a>

<details>
<summary><strong>Dismiss notifications when marking conversations read</strong> · Before / after</summary>
<br>

**Fossify Messages 1.10.1** · [Setup & patch details](docs/MESSAGES.md)

Remove a conversation notification after marking that conversation read from the app list.

**Android APK captures.** Synthetic SMS only. The final after run marks both fixture threads read; unrelated-thread retention is established by the separate tests, not this empty shade alone.

| Before | After |
| :---: | :---: |
| **Marked read in the list; notification remains** | **Marked read in the list; Messages notification removed** |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/messages/before.png" width="300" alt="Before: Marked read in the list; notification remains"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/messages/after.png" width="300" alt="After: Marked read in the list; Messages notification removed"> |

[Capture provenance & checks](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/README.md) · [Back to patch index](#patch-previews)

</details>

<a id="preview-keep-background-conversations-unread"></a>

<details>
<summary><strong>Keep background conversations unread</strong> · Before / after</summary>
<br>

**Fossify Messages 1.10.1** · [Setup & patch details](docs/MESSAGES.md)

Keep an incoming message unread when its conversation is open in a background Activity.

**Android APK captures.** The fixture leaves the thread with Home, receives a synthetic SMS, then opens the conversation list. Provider records confirm read=1 before and read=0 after. Lifecycle patches are tested together and apply independently.

| Before | After |
| :---: | :---: |
| **Background message appears read; no unread count** | **Background message stays bold with unread count 1** |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/messages-lifecycle/927/before.png" width="300" alt="Before: Background message appears read; no unread count"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/messages-lifecycle/927/after.png" width="300" alt="After: Background message stays bold with unread count 1"> |

[Capture provenance & checks](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/messages-lifecycle) · [Back to patch index](#patch-previews)

</details>

<a id="previews-org-fossify-musicplayer"></a>

### <img src="https://raw.githubusercontent.com/FossifyOrg/Music-Player/e76d0f222eaba2cfd4501ccc3b6a8d2e9f29b0c3/fastlane/metadata/android/en-US/images/icon.png" alt="Fossify Music Player app icon" width="24" height="24"> Fossify Music Player · 1 patch

<a id="preview-prefer-each-track-s-embedded-cover"></a>

<details>
<summary><strong>Prefer each track&#x27;s embedded cover</strong> · Before / after</summary>
<br>

**Fossify Music Player 1.8.4** · [Setup & patch details](docs/MUSIC.md)

Show the artwork embedded in the current track rather than reusing another track's album cover.

**Android APK captures.** Two synthetic audio files share an album ID and have different embedded covers. File hashes and the existing fallback path are checked separately.

| Before | After |
| :---: | :---: |
| **Penguin Blue and Penguin Red both show red artwork** | **Penguin Blue shows blue; Penguin Red stays red** |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/contact-music/music/before.png" width="300" alt="Before: Penguin Blue and Penguin Red both show red artwork"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/contact-music/music/after.png" width="300" alt="After: Penguin Blue shows blue; Penguin Red stays red"> |

[Capture provenance & checks](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/contact-music) · [Back to patch index](#patch-previews)

</details>

<a id="previews-com-nononsenseapps-feeder"></a>

### <img src="https://raw.githubusercontent.com/spacecowboy/Feeder/846b19d39b932b1a9864b4317365034f36fc4856/fastlane/metadata/android/en-US/images/icon.png" alt="Feeder app icon" width="24" height="24"> Feeder · 1 patch

<a id="preview-zoom-article-images"></a>

<details>
<summary><strong>Zoom article images</strong> · Before / after</summary>
<br>

**Feeder 2.25.0 · project GitHub F-Droid APK** · [Setup & patch details](docs/FEEDER.md)

Open an article image in its own viewer and pinch, pan or double-tap to inspect small details.

**Android APK captures.** Same synthetic offline article and image; the after capture shows actual zoom in the separate Morphe-patched viewer.

| Before | After |
| :---: | :---: |
| **Diagram stays at article width** | **Same diagram enlarged in the image viewer** |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/feeder-391/2026-10-24/before.png" width="300" alt="Before: Diagram stays at article width"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/feeder-391/2026-10-24/zoomed.png" width="300" alt="After: Same diagram enlarged in the image viewer"> |

[Capture provenance & checks](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/feeder-391/2026-10-24) · [Back to patch index](#patch-previews)

</details>

<a id="previews-app-komikku"></a>

### <img src="https://raw.githubusercontent.com/komikku-app/komikku/383ffaa81667f45fc6c2975edb1760a7606531d3/.github/readme-images/app-icon.png" alt="Komikku app icon" width="24" height="24"> Komikku · 1 patch

<a id="preview-keep-local-manga-in-exclusion-searches"></a>

<details>
<summary><strong>Keep local manga in exclusion searches</strong> · Before / after</summary>
<br>

**Komikku 1.14.1 ARM64** · [Setup & patch details](docs/KOMIKKU.md)

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
| <img src="tests/komikku/evidence/2026-10-30/before.png" width="300" alt="Before: exclusion search for meteor shows only remote Lyra and loses local Orion"> | <img src="tests/komikku/evidence/2026-10-30/after.png" width="300" alt="After: the same search shows local Orion and remote Lyra while local Meteor remains excluded"> |

[Capture provenance & checks](tests/komikku/evidence/2026-10-30/README.md) · [Back to patch index](#patch-previews)

</details>

<a id="previews-de-mm20-launcher2-release"></a>

### <img src="https://raw.githubusercontent.com/MM2-0/Kvaesitso/c4805f3f18d5bcf071c5287f81466efd79169b20/fastlane/metadata/android/en-US/images/icon.png" alt="Kvaesitso app icon" width="24" height="24"> Kvaesitso · 1 patch

<a id="preview-restore-widget-editing-from-the-search-menu"></a>

<details>
<summary><strong>Restore widget editing from the search menu</strong> · Before / after</summary>
<br>

**Kvaesitso 1.41.0** · [Setup & patch details](docs/KVAESITSO.md)

Reach the existing widget editor from the search-bar menu even when the on-screen Edit button is hidden.

**Android APK captures.** Same hidden-button preference and synthetic widget layout. The patched action opens the app's existing editor; it does not re-enable the hidden button.

| Before | After |
| :---: | :---: |
| **Search menu has no Edit widgets action** | **Edit widgets appears at the top of the same menu** |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/kvaesitso-1504/2026-10-24/before.png" width="300" alt="Before: Search menu has no Edit widgets action"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/kvaesitso-1504/2026-10-24/after.png" width="300" alt="After: Edit widgets appears at the top of the same menu"> |

[Capture provenance & checks](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/kvaesitso-1504/2026-10-24) · [Back to patch index](#patch-previews)

</details>

<a id="previews-app-mihon"></a>

### <img src="https://raw.githubusercontent.com/mihonapp/mihon/ede052af170e2ef2949dac2acd91adfb58043a96/fastlane/metadata/android/en-US/images/icon.png" alt="Mihon app icon" width="24" height="24"> Mihon · 1 patch

<a id="preview-preserve-excluded-default-category-downloads"></a>

<details>
<summary><strong>Preserve excluded Default-category downloads</strong> · Before / after</summary>
<br>

**Mihon 0.21.3** · [Setup & patch details](docs/MIHON.md)

Keep read chapter downloads when the built-in Default category is excluded from
deletion. Reuses Marc Went / Dunky13's correction in [Mihon PR #4182](https://github.com/mihonapp/mihon/pull/4182).

**Installed Android APK captures.** Same synthetic favorite, read chapter, Default
exclusion, Light theme, display size and **Downloaded only** filter. Before: the
download is deleted and the filtered library appears empty. After: the Manager
export retains the downloaded chapter. The favorite itself remains in both databases.

| Before | After |
| :---: | :---: |
| **Excluded read download lost** | **Excluded read download retained** |
| <img src="tests/mihon/evidence/2026-10-30/before.png" width="300" alt="Before: excluded Default-category download lost; Downloaded only library is empty"> | <img src="tests/mihon/evidence/2026-10-30/after.png" width="300" alt="After: excluded Default-category download retained; synthetic favorite remains downloaded"> |

[Raw PNG/XML and acceptance evidence](tests/mihon/evidence/2026-10-30/README.md) · [Back to patch index](#patch-previews)

</details>

<a id="previews-me-ash-reader"></a>

### <img src="https://raw.githubusercontent.com/ReadYouApp/ReadYou/d2b979ccad9a3e54b9499929a9dc2824578b0fd9/fastlane/metadata/android/en-US/images/icon.png" alt="Read You app icon" width="24" height="24"> Read You · 1 patch

<a id="preview-import-nested-opml-feeds"></a>

<details>
<summary><strong>Import nested OPML feeds</strong> · Before / after</summary>
<br>

**Read You 0.16.2 · official GitHub APK** · [Setup & patch details](docs/READYOU.md)

Keep feeds inside nested OPML folders when importing subscriptions. Preserve feed
order and per-feed settings within the app's existing flat outer group.

**Android APK captures.** Same three-feed synthetic OPML, All filter, collapsed
Default group, light theme, display size and density. Original official payload
resigned with the fixture key versus the actual Morphe Manager export installed
with that same key. Each import starts without the synthetic Manga news group.

| Before | After |
| :---: | :---: |
| **Only 1 of 3 feeds imported** | **All 3 feeds imported** |
| <img src="tests/readyou/evidence/2026-10-29/before.png" width="300" alt="Before: only Reader releases appears in Manga news"> | <img src="tests/readyou/evidence/2026-10-29/after.png" width="300" alt="After: Reader releases, Studio journal and Chapter notes appear in Manga news"> |

[Capture provenance & checks](tests/readyou/evidence/2026-10-29/README.md) · [Back to patch index](#patch-previews)

</details>

<a id="previews-org-tasks"></a>

### <img src="https://raw.githubusercontent.com/tasks/tasks/d7c0afdb94f913943fd54833d3e108871e78bc36/fastlane/metadata/android/en-US/images/icon.png" alt="Tasks.org app icon" width="24" height="24"> Tasks.org · 1 patch

<a id="preview-navigate-to-the-parent-task"></a>

<details>
<summary><strong>Navigate to the parent task</strong> · Before / after</summary>
<br>

**Tasks.org 15.13 · project GitHub F-Droid APK** · [Setup & patch details](docs/TASKS.md)

Open the immediate parent task from the child editor using an explicit up-arrow.

**Android APK captures.** Same synthetic child task, notes and date. The guide also records Save / Discard / Cancel for changed drafts. The red reminder warning is existing Android permission state, not a change made by this patch.

| Before | After |
| :---: | :---: |
| **Child editor has no parent-navigation action** | **Up-arrow appears next to the existing actions** |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/tasks-2838/2026-10-24/before.png" width="300" alt="Before: Child editor has no parent-navigation action"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/tasks-2838/2026-10-24/after.png" width="300" alt="After: Up-arrow appears next to the existing actions"> |

[Capture provenance & checks](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/tasks-2838/2026-10-24) · [Back to patch index](#patch-previews)

</details>

<a id="previews-com-unicornsonlsd-finamp"></a>

### <img src="https://raw.githubusercontent.com/finamp-app/finamp/f001dcd396ab2c65d466ad60e4380c53c45d34d9/fastlane/metadata/android/en-US/images/icon.png" alt="Finamp app icon" width="24" height="24"> Finamp · 1 patch

Finamp Complete combines the fixes shown below; individual selection is available separately.

<a id="preview-finamp-complete"></a>

<details>
<summary><strong>Finamp Complete</strong> · Before / after</summary>
<br>

**Finamp 1.0.1** · [Setup & patch details](docs/FINAMP_NATIVE.md)

The compact patch applies the individual fixes together. This pair
illustrates one included change: the track-information action. See the individual
comparisons for the other changes.

**Installed Android APK captures.** The before image is the original APK and
the after image is the separately selected track-information patch, using the
same synthetic track and display. The captures do not depict the compact bundle.

| Before | After |
| :---: | :---: |
| **No track information action** | **Information action with icon** |
| <img src="tests/finamp/evidence/2026-11-05-notes/track-before.png" width="300" alt="Before: track menu without an information action"> | <img src="tests/finamp/evidence/2026-11-05-notes/track-after.png" width="300" alt="After: track information with an icon below the common actions"> |

[Capture provenance and limits](tests/finamp/evidence/2026-11-05-notes/README.md) · [Back to patch index](#patch-previews)

</details>

<a id="preview-fix-section-title-validation"></a>

<details>
<summary><strong>Fix section title validation</strong> · Before / after</summary>
<br>

**Finamp 1.0.1** · [Setup & patch details](docs/FINAMP_NATIVE.md)

Typing a valid custom home-section title updates validation and enables Save immediately.

**Upstream status · 2026-10-29:** [PR #1830](https://github.com/finamp-app/finamp/pull/1830) is merged into `redesign`. This Penguin backport remains selectable for the original Finamp 1.0.1 APK.

**Source-widget comparison, not Android APK screenshots.** These are actual Finamp widgets rendered by Flutter tests, upstream redesign versus the combined source fixes. The native APK fix is verified separately in the [APK record](tests/finamp/evidence/2026-10-28/README.md); its original before-image is obscured by the keyboard.

| Before | After |
| :---: | :---: |
| **Playlists entered; error remains and Save is disabled** | **Playlists entered; error clears and Save is enabled** |
| <img src="https://raw.githubusercontent.com/pengusto/finamp/7e168434482e4e1e7b77a0c37337edb28291e2f8/contribution-evidence/2026-10-28/title-validation-before.png" width="300" alt="Before: Playlists entered; error remains and Save is disabled"> | <img src="https://raw.githubusercontent.com/pengusto/finamp/7e168434482e4e1e7b77a0c37337edb28291e2f8/contribution-evidence/2026-10-28/title-validation-after.png" width="300" alt="After: Playlists entered; error clears and Save is enabled"> |

[Capture provenance & checks](https://github.com/pengusto/finamp/tree/7e168434482e4e1e7b77a0c37337edb28291e2f8/contribution-evidence/2026-10-28) · [Back to patch index](#patch-previews)

</details>

<a id="preview-song-artist-order"></a>

<details>
<summary><strong>Song artist order</strong> · Before / after</summary>
<br>

**Finamp 1.0.1** · [Setup & patch details](docs/FINAMP_NATIVE.md)

Put the album artist first, then alphabetize the other song credits. Choose alternative modes in settings without rewriting music metadata.

**Android APK captures.** Same synthetic album and Dark theme. The before APK retains the official native code; the after APK has the native patch.

| Before | After |
| :---: | :---: |
| **A Guest, B Guest, Z Lead** | **Z Lead, A Guest, B Guest** |
| <img src="tests/finamp/evidence/2026-10-28/credits-before.png" width="300" alt="Before: A Guest, B Guest, Z Lead"> | <img src="tests/finamp/evidence/2026-10-28/credits-after.png" width="300" alt="After: Z Lead, A Guest, B Guest"> |

[Capture provenance & checks](tests/finamp/evidence/2026-10-28/README.md) · [Back to patch index](#patch-previews)

</details>

<a id="preview-load-artist-pages-faster"></a>

<details>
<summary><strong>Load artist pages faster</strong> · Before / after</summary>
<br>

**Finamp 1.0.1** · [Setup & patch details](docs/FINAMP_NATIVE.md)

Show the artist preview and track count without waiting for the full discography response.

**Installed Android APK captures.** The fixture deliberately holds unbounded artist-track requests. Both captures use the same Dark theme, synthetic library, eight downloaded tracks, sort, viewport and demo clock. The patched APK was exported and installed through Morphe Manager. This verifies query behavior on the synthetic fixture.

| Before | After |
| :---: | :---: |
| **Pending full-song queries: spinner and 0 Tracks** | **Bounded queries: preview and 8 Tracks appear** |
| <img src="tests/finamp/evidence/2026-10-30-artist-review/artist-held-before.png" width="300" alt="Before: Pending full-song queries: spinner and 0 Tracks"> | <img src="tests/finamp/evidence/2026-10-30-artist-review/artist-held-after.png" width="300" alt="After: Bounded queries: preview and 8 Tracks appear"> |

[Capture provenance & checks](tests/finamp/evidence/2026-10-30-artist-review/README.md) · [Back to patch index](#patch-previews)

</details>

<a id="preview-fix-offline-artist-tracks"></a>

<details>
<summary><strong>Fix offline artist tracks</strong> · Before / after</summary>
<br>

**Finamp 1.0.1** · [Setup & patch details](docs/FINAMP_NATIVE.md)

Keep only tracks credited to the selected performing artist when a downloaded
album contains several artists. Album-artist inclusion is preserved.

**Android APK captures.** Same downloaded synthetic album, B Guest performing-artist
filter, Name ordering, Dark theme and display size. Tracks 7–8 have other credits.
The after image is an actual Morphe Manager export installed with the same key.

| Before | After |
| :---: | :---: |
| **8 songs, including 2 unrelated tracks** | **6 matching songs** |
| <img src="tests/finamp/evidence/2026-10-28-next/1689-before-tracks.png" width="300" alt="Before: B Guest includes Lead Solo and Album Credit Only"> | <img src="tests/finamp/evidence/2026-10-28-next/1689-after-tracks.png" width="300" alt="After: B Guest contains only the six credited songs"> |

[Capture provenance & checks](tests/finamp/evidence/2026-10-28-next/README.md) · [Back to patch index](#patch-previews)

</details>

<a id="preview-fix-track-alphabet-navigation"></a>

<details>
<summary><strong>Fix track alphabet navigation</strong> · Before / after</summary>
<br>

**Finamp 1.0.1** · [Setup & patch details](docs/FINAMP_NATIVE.md)

Compare the selected sidebar letter and track titles with consistent case.
Existing missing-letter behavior and paging remain in place.

**Android APK captures.** Same synthetic library, Name ordering, no filters and
the same tap on M. The after image uses the independently selected alphabet fix
exported by Morphe Manager. This is a correctness comparison, not a performance benchmark.

| Before | After |
| :---: | :---: |
| **M stays in the numeric section** | **M reaches Midnight 01** |
| <img src="tests/finamp/evidence/2026-10-28-next/1790-before-M.png" width="300" alt="Before: an M jump stays among numeric track titles"> | <img src="tests/finamp/evidence/2026-10-28-next/1790-after-M.png" width="300" alt="After: the same M jump reaches Midnight 01"> |

[Capture provenance & checks](tests/finamp/evidence/2026-10-28-next/README.md) · [Back to patch index](#patch-previews)

</details>

<a id="preview-keep-player-output-controls-accessible"></a>

<details>
<summary><strong>Keep player output controls accessible</strong> · Before / after</summary>
<br>

**Finamp 1.0.1** · [Setup & patch details](docs/FINAMP_NATIVE.md)

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
| <img src="tests/finamp/evidence/2026-10-30-player/player-before.png" width="300" alt="Before: original player menu ends without Output, Queue or Lyrics"> | <img src="tests/finamp/evidence/2026-10-30-player/player-after.png" width="300" alt="After: installed Manager export adds Output, Queue and Lyrics at the menu bottom"> |

[Capture provenance & checks](tests/finamp/evidence/2026-10-30-player/README.md) · [Back to patch index](#patch-previews)

</details>

<a id="preview-show-album-and-track-information"></a>

<details>
<summary><strong>Show album and track information</strong> · Before / after</summary>
<br>

**Finamp 1.0.1** · [Setup & patch details](docs/FINAMP_NATIVE.md)

Read Jellyfin's available album and track descriptions, including descriptions
saved with downloads. The track action follows the common actions in its menu.

**Installed Android APK captures.** The same downloaded synthetic album, song,
Light theme and display; the after APK was exported by Morphe Manager using the
full locally built bundle. See the evidence for the scope of that test.

| Before | After |
| :---: | :---: |
| **No track information action** | **Information action with icon** |
| <img src="tests/finamp/evidence/2026-11-05-notes/track-before.png" width="300" alt="Before: track menu without an information action"> | <img src="tests/finamp/evidence/2026-11-05-notes/track-after.png" width="300" alt="After: track information with an icon below the common actions"> |

[Album before](tests/finamp/evidence/2026-11-05-notes/album-before.png) · [Album after](tests/finamp/evidence/2026-11-05-notes/album-after.png) · [Raw captures and provenance](tests/finamp/evidence/2026-11-05-notes/README.md) · [Back to patch index](#patch-previews)

</details>
<!-- PATCHES_PREVIEWS_END -->

<a id="the-fixes"></a>
<a id="generated-patch-catalogue"></a>

<!-- PATCHES_START -->
<details>
<summary><strong>All 14 apps and supported versions</strong></summary>

> **[v1.9.3](https://github.com/pengusto/penguin-patches/releases/tag/v1.9.3)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;17 patches total
<details>
<summary><img src="https://raw.githubusercontent.com/Docile-Alligator/Infinity-For-Reddit/cc2845af8c4bb9375ee56b93944c5a0fa3ad70e0/fastlane/metadata/android/en-US/images/icon.png" alt="Infinity+ app icon" width="24" height="24"> Infinity+&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 8.3.4 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| <a id="configure-custom-oauth-for-infinity"></a>[Configure custom OAuth for Infinity+](docs/INFINITY.md)<br>[Before / after](#preview-configure-custom-oauth-for-infinity) | Use a configured Reddit OAuth client consistently through login and token exchange in Infinity+ 8.3.4, without the app subscription gate. | • OAuth client ID<br>• Registered redirect URI<br>• API user agent |

</details>

<details>
<summary><img src="https://raw.githubusercontent.com/FossifyOrg/Calendar/a0d428461b5caac11ad570f77a4134b912093205/fastlane/metadata/android/en-US/images/icon.png" alt="Fossify Calendar app icon" width="24" height="24"> Fossify Calendar&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 1.12.0 | 1.12.1 | 1.12.2 |
| :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| <a id="readable-calendar-descriptions"></a>[Readable Calendar descriptions](docs/CALENDAR.md)<br>[Before / after](#preview-readable-calendar-descriptions) | Readable event descriptions in the editor, lists, widget and reminders; preserves the original editor text. |  |
| <a id="separate-all-day-reminder-defaults"></a>[Separate all-day reminder defaults](docs/CALENDAR_REMINDERS.md)<br>[Before / after](#preview-separate-all-day-reminder-defaults) | Choose three separate default reminders for new all-day events in Calendar settings. Keeps timed-event defaults, existing events and the use-last-reminders setting. |  |

</details>

<details>
<summary><img src="https://raw.githubusercontent.com/FossifyOrg/Clock/0511f508368ada82cdb587b0bf8df9d56cf9e6ad/fastlane/metadata/android/en-US/images/icon.png" alt="Fossify Clock app icon" width="24" height="24"> Fossify Clock&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.6.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| <a id="choose-upcoming-alarm-notification-time"></a>[Choose upcoming alarm notification time](docs/CLOCK.md)<br>[Before / after](#preview-choose-upcoming-alarm-notification-time) | Choose the advance notice in Morphe, with separate notifications and skip actions for each alarm occurrence. Keeps native ringing times and alarm definitions. | • Upcoming alarm notice (minutes) |

</details>

<details>
<summary><img src="https://raw.githubusercontent.com/FossifyOrg/Contacts/6938eccfd1a10f924a6ced13695c73bd0cd84328/fastlane/metadata/android/en-US/images/icon.png" alt="Fossify Contacts app icon" width="24" height="24"> Fossify Contacts&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.6.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| <a id="show-emails-and-notes-from-merged-contacts"></a>[Show emails and notes from merged contacts](docs/CONTACTS.md)<br>[Before / after](#preview-show-emails-and-notes-from-merged-contacts) | Include duplicate contact emails and notes in the detail view without changing stored contact records. |  |

</details>

<details>
<summary><img src="https://raw.githubusercontent.com/FossifyOrg/File-Manager/c95de62b90c9f42601b88eca4f795338da3b161c/fastlane/metadata/android/en-US/images/icon.png" alt="Fossify File Manager app icon" width="24" height="24"> Fossify File Manager&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.6.2 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| <a id="keep-favorites-consistent-after-folder-rename-or-removal"></a>[Keep favorites consistent after folder rename or removal](docs/FILE_MANAGER.md)<br>[Before / after](#preview-keep-favorites-consistent-after-folder-rename-or-removal) | Update nested favorite paths after successful single or multiple renames and remove nested favorites with their deleted parent. |  |

</details>

<details>
<summary><img src="https://raw.githubusercontent.com/FossifyOrg/Messages/02f511b292cc9790d0189a7e3d96ce3d71493890/fastlane/metadata/android/en-US/images/icon.png" alt="Fossify Messages app icon" width="24" height="24"> Fossify Messages&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 1.10.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| <a id="avoid-notifications-for-visible-conversations"></a>[Avoid notifications for visible conversations](docs/MESSAGES.md)<br>[Before / after](#preview-avoid-notifications-for-visible-conversations) | Check visible conversation on the main thread before posting an incoming-message notification. |  |
| <a id="dismiss-notifications-when-marking-conversations-read"></a>[Dismiss notifications when marking conversations read](docs/MESSAGES.md)<br>[Before / after](#preview-dismiss-notifications-when-marking-conversations-read) | Remove the selected conversation's notification after Mark as read in the conversation list. |  |
| <a id="keep-background-conversations-unread"></a>[Keep background conversations unread](docs/MESSAGES.md)<br>[Before / after](#preview-keep-background-conversations-unread) | Do not mark incoming messages read when their conversation is left in the background. |  |

</details>

<details>
<summary><img src="https://raw.githubusercontent.com/FossifyOrg/Music-Player/e76d0f222eaba2cfd4501ccc3b6a8d2e9f29b0c3/fastlane/metadata/android/en-US/images/icon.png" alt="Fossify Music Player app icon" width="24" height="24"> Fossify Music Player&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.8.4 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| <a id="prefer-each-track-s-embedded-cover"></a><a id="prefer-each-tracks-embedded-cover"></a>[Prefer each track's embedded cover](docs/MUSIC.md)<br>[Before / after](#preview-prefer-each-track-s-embedded-cover) | Use file-specific cover artwork before shared album art, retaining the original fallback and worker callback. |  |

</details>

<details>
<summary><img src="https://raw.githubusercontent.com/spacecowboy/Feeder/846b19d39b932b1a9864b4317365034f36fc4856/fastlane/metadata/android/en-US/images/icon.png" alt="Feeder app icon" width="24" height="24"> Feeder&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 2.25.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| <a id="zoom-article-images"></a>[Zoom article images](docs/FEEDER.md)<br>[Before / after](#preview-zoom-article-images) | Open article images in a separate viewer with pinch, pan, double-tap and accessible zoom controls. Linked images offer View image or Open link. Uses Feeder's existing image loader and network policy. Official project F-Droid APK 2.25.0 only. |  |

</details>

<details>
<summary><img src="https://raw.githubusercontent.com/komikku-app/komikku/383ffaa81667f45fc6c2975edb1760a7606531d3/.github/readme-images/app-icon.png" alt="Komikku app icon" width="24" height="24"> Komikku&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.14.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| <a id="keep-local-manga-in-exclusion-searches"></a>[Keep local manga in exclusion searches](docs/KOMIKKU.md)<br>[Before / after](#preview-keep-local-manga-in-exclusion-searches) | Keep local manga when an excluded search term does not match. Matching titles, tags and remote source IDs are still excluded. Official GitHub Komikku 1.14.1 ARM64 APK tested. |  |

</details>

<details>
<summary><img src="https://raw.githubusercontent.com/MM2-0/Kvaesitso/c4805f3f18d5bcf071c5287f81466efd79169b20/fastlane/metadata/android/en-US/images/icon.png" alt="Kvaesitso app icon" width="24" height="24"> Kvaesitso&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.41.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| <a id="restore-widget-editing-from-the-search-menu"></a>[Restore widget editing from the search menu](docs/KVAESITSO.md)<br>[Before / after](#preview-restore-widget-editing-from-the-search-menu) | Open the existing widget editor from the search bar menu when the Edit button is hidden, without changing the preference or stored widgets. |  |

</details>

<details>
<summary><img src="https://raw.githubusercontent.com/mihonapp/mihon/ede052af170e2ef2949dac2acd91adfb58043a96/fastlane/metadata/android/en-US/images/icon.png" alt="Mihon app icon" width="24" height="24"> Mihon&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 0.21.3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| <a id="preserve-excluded-default-category-downloads"></a>[Preserve excluded Default-category downloads](docs/MIHON.md)<br>[Before / after](#preview-preserve-excluded-default-category-downloads) | Keep read chapter downloads when Default is excluded from deletion. Corrects the Default category's numeric ID without changing other deletion preferences. Official GitHub Mihon 0.21.3 ARM64 APK tested. |  |

</details>

<details>
<summary><img src="https://raw.githubusercontent.com/ReadYouApp/ReadYou/d2b979ccad9a3e54b9499929a9dc2824578b0fd9/fastlane/metadata/android/en-US/images/icon.png" alt="Read You app icon" width="24" height="24"> Read You&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 0.16.2 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| <a id="import-nested-opml-feeds"></a>[Import nested OPML feeds](docs/READYOU.md)<br>[Before / after](#preview-import-nested-opml-feeds) | Import feeds inside nested OPML folders into their outer group, preserving document order and feed settings. Official GitHub Read You 0.16.2 APK only. |  |

</details>

<details>
<summary><img src="https://raw.githubusercontent.com/tasks/tasks/d7c0afdb94f913943fd54833d3e108871e78bc36/fastlane/metadata/android/en-US/images/icon.png" alt="Tasks.org app icon" width="24" height="24"> Tasks.org&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 15.13 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| <a id="navigate-to-the-parent-task"></a>[Navigate to the parent task](docs/TASKS.md)<br>[Before / after](#preview-navigate-to-the-parent-task) | Add a parent-task arrow to the existing editor. Keeps Back behavior and the current filter; asks whether to save, discard or cancel when the draft has changes. Official project F-Droid APK 15.13 only. |  |

</details>

<details>
<summary><img src="https://raw.githubusercontent.com/finamp-app/finamp/f001dcd396ab2c65d466ad60e4380c53c45d34d9/fastlane/metadata/android/en-US/images/icon.png" alt="Finamp app icon" width="24" height="24"> Finamp&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.0.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| <a id="finamp-complete"></a>[Finamp Complete](docs/FINAMP_NATIVE.md)<br>[Before / after](#preview-finamp-complete) | Apply all available Penguin Finamp fixes together. Requires the original official Finamp 1.0.1 APK; produces ARM64-only output. |  |

</details>

</details>
<!-- PATCHES_END -->

<a id="patch-an-app"></a>

<details>
<summary><strong>Setup, signing & verification</strong></summary>

1. [Choose and add your Morphe source](docs/SETUP.md#add-the-source-and-patch).
2. Pick the exact original APK from the app guide, select patches and set their options.
3. Patch, sign and install with your backed-up Morphe key.

**Check your backup before migration.** These patches keep the original package ID. A different signing certificate cannot update an official installation in place; read the [full setup guide](docs/SETUP.md) before uninstalling anything.

Finamp passes [Android Manager 2.2.0 acceptance on an API 35 ARM64 emulator](tests/finamp/evidence/2026-10-28-manager/README.md). Physical devices remain unverified; other apps retain their guide-specific limits. [Verification record](docs/VERIFICATION.md) · [Report a problem](docs/SETUP.md#report-a-problem).

Stable releases come from `main`; `dev` carries pre-releases. Enable pre-releases in Morphe only if you intend to try upcoming changes.

</details>

<a id="development"></a>
<a id="upstream-contributions-and-next-fixes"></a>
<a id="evidence-feedback-and-limits"></a>
<a id="support-development"></a>
<a id="license-and-provenance"></a>

Patch definitions use Kotlin and Android runtime helpers use Java; Gradle builds the bundle. The development guide lists the Java 21, Android SDK and package-registry prerequisites.

[Build & contribute](docs/DEVELOPMENT.md) · [Upstream work & roadmap](docs/ROADMAP.md) · [Support development](https://github.com/sponsors/pengusto) · [License & provenance](docs/PROVENANCE.md)

Independent project; not affiliated with Morphe or the original app projects. Code: [GPL-3.0](LICENSE), with project-name terms and upstream credits in [NOTICE](NOTICE). [Illustration & screenshot credits](docs/PROVENANCE.md).
