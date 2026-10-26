# 🐧 Penguin Patches

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/penguin-patches-banner-tailor-dark.png">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/penguin-patches-banner-tailor.png">
  <img src="docs/assets/penguin-patches-banner-tailor.png" alt="Penguin Patches — a penguin stitching a repair patch onto a fabric app tile in an embroidery hoop">
</picture>

**Small fixes for the Android apps you already use.**

Read a calendar invitation without wading through HTML. Keep a nested favorite pointing to the folder you renamed. See the cover embedded in the track that's actually playing.

Penguin Patches is a personal collection of focused Android patches, compatible with Morphe Manager. It is for Android users comfortable patching an original APK and managing backups and signing keys. The current catalogue targets Fossify apps, Kvaesitso, Tasks.org, Feeder and Infinity+ for Reddit. Independent project; not affiliated with Morphe, Fossify, Reddit or Infinity.

**Early-stage software:** The [generated catalogue](#generated-patch-catalogue) lists the current release and every exact tested app version. Verification is documented on isolated Android 15 ARM64 emulators; physical devices and on-device Morphe Manager execution remain unverified. Stable releases come from `main`; `dev` carries pre-releases of upcoming changes.

[Add to Morphe](https://morphe.software/add-source?github=pengusto/penguin-patches) · [Patch details](#the-fixes) · [Build from source](#development) · [Verification evidence](docs/VERIFICATION.md)

## The fixes

Use only the exact original APK version listed here. Each linked guide records the input APK checksum, behavior, evidence and limitations.

| Original app | What changes | Guide |
| --- | --- | --- |
| Fossify Calendar **1.12.0** | Readable HTML descriptions in the editor and day/agenda lists, with explicit source editing | [Calendar](docs/CALENDAR.md) |
| Fossify Messages **1.10.1** | Three selectable fixes for read notifications and foreground/background conversation handling | [Messages](docs/MESSAGES.md) |
| Fossify File Manager **1.6.2** | Keep nested favorite paths consistent with folder renames and selected deletion cleanup | [File Manager](docs/FILE_MANAGER.md) |
| Fossify Contacts **1.6.0** | Show emails and notes from merged contacts without rewriting source records | [Contacts](docs/CONTACTS.md) |
| Fossify Music Player **1.8.4** | Prefer each track's embedded cover, retaining the original artwork fallback | [Music Player](docs/MUSIC.md) |
| Kvaesitso **1.41.0** | Restore widget editing from the search menu when the Edit button is hidden | [Kvaesitso](docs/KVAESITSO.md) |
| Fossify Clock **1.6.0** | Choose 1–1440 minutes of advance notice, with independent notifications and skip actions for each alarm | [Clock](docs/CLOCK.md) |
| Fossify Calendar **1.12.0** | Separate all-day reminder defaults and retain manual draft values per event mode | [All-day reminders](docs/CALENDAR_REMINDERS.md) |
| Tasks.org **15.13**, project GitHub F-Droid APK | Open the immediate parent task, with Save / Discard / Cancel for edited drafts | [Tasks.org](docs/TASKS.md) |
| Feeder **2.25.0**, project GitHub F-Droid APK | Open article images in a separate viewer with pinch, pan and double-tap; choose image or link for linked images | [Feeder](docs/FEEDER.md) |
| Infinity+ **8.3.4** | Sign in with your own Reddit OAuth client, without the subscription gate | [Infinity+](docs/INFINITY.md) |

### Readable Calendar descriptions

Native preview hides HTML metadata and exposes the original text through **Edit HTML source**. Day/agenda summaries render readable text too. Title-only edits preserve the original description exactly in the documented fixtures. Widgets, notification summaries and real Outlook server round-trips are outside the verified scope. The [Calendar source fix](https://github.com/pengusto/Calendar/pull/1) is a separate implementation; its tests and screenshots are not proof of this patch bundle.

### Dismiss notifications when marking conversations read

After **Mark as Read** in the conversation list, remove the selected conversation's notification while retaining unrelated notifications.

### Keep background conversations unread

Keep an incoming message unread when its conversation Activity is in the background, preserving the original foreground read behavior.

### Avoid notifications for visible conversations

Check the visible conversation before posting a notification. Other conversations and paused Activities retain the original notification path. The three Messages patches can be selected separately; see the [Messages guide](docs/MESSAGES.md) for lifecycle and provider-write limits.

### Keep favorites consistent after folder rename or removal

Update nested favorites after successful single or multiple renames. Selected deletion cleanup also removes nested favorites; this runs at the original app's pre-deletion stage, so a later filesystem failure can leave those favorites removed. Ordinary **Remove favorite** remains exact-path only. External storage/SAF and physical devices remain unverified.

### Show emails and notes from merged contacts

When **Merge duplicate contacts** is enabled, include duplicate contacts' emails and distinct notes in the detail view. Stored contact records, organization fields and export behavior are outside this patch.

<!-- Keep this explicit anchor: the catalogue generator replaces apostrophes with hyphens, unlike GitHub heading slugs. -->
<a id="prefer-each-track-s-embedded-cover"></a>

### Prefer each track's embedded cover

Read the current file's embedded artwork before shared album art. MP3 and Opus fixtures are covered; malformed or unsupported artwork uses the existing fallback. Audio tags and album grouping are unchanged. Other formats and document-only URIs remain unverified.

### Restore widget editing from the search menu

When Kvaesitso's Edit button is hidden, choose **Edit widgets** from the search-bar menu to open its existing editor. The current widget page takes priority. Visible Edit buttons retain the original menu, and absent widget destinations do not gain an unusable action. See the [Kvaesitso guide](docs/KVAESITSO.md).

### Choose upcoming alarm notification time

Set **Upcoming alarm notice (minutes)** in Morphe before patching: **1–1440**, default **120**. Each Clock alarm keeps its own notice, timestamp and skip action; skipping one occurrence retains other alarms. Native ringing and snooze remain in use. The option is configured at patch time; see [Clock behavior and limits](docs/CLOCK.md).

### Separate all-day reminder defaults

In Calendar's **Settings → New events**, disable **Use the last event's reminders as the default for new events** to expose three separate all-day defaults. Fresh all-day drafts initially use **12 hours before**; timed defaults retain their values. Manual reminders survive switching draft modes and restoration. Existing events retain their reminders. Both Calendar patches can be selected together; see [all-day reminder settings](docs/CALENDAR_REMINDERS.md).

### Navigate to the parent task

Tasks.org's editor gains an up-arrow for an existing task with a valid parent. Changed drafts offer **Save / Discard / Cancel** before navigation, using the native save path. The current list/filter and native Back behavior are retained. See the [Tasks.org guide](docs/TASKS.md).

### Zoom article images

Tap a Feeder article-body image or large reader header image to open a separate viewer. Pinch, drag and double-tap to inspect details, or use the zoom/reset buttons. Linked images offer **View image / Open link**. The patch reuses Feeder's image loader, cache and network policy. Only the project's GitHub F-Droid-flavor **2.25.0** APK is tested; Play and independently built F-Droid.org APKs are excluded. See [Feeder provenance, screenshots and test limits](docs/FEEDER.md).

### Configure custom OAuth for Infinity+

Opt-in and standalone: apply it alone to the original Infinity+ 8.3.4 APK. Supply your Reddit client ID, its registered redirect URI and an API user-agent; login and token exchange then use them consistently and the subscription gate stays closed. Signing stays with your Morphe key, so keep that key for updates. Emulator login is verified; Morphe Manager on a phone and long-term token renewal are not yet. See the [Infinity+ guide](docs/INFINITY.md).

## Patch an app

1. Read the app's guide above and verify its **original official APK version and SHA-256**. Use the official upstream release asset specified in the guide, not a Pengusto source-fork build. Do not force an unknown version.
2. **Verify backups before migration.** These patches retain the official package IDs. A patched APK signed with a different certificate cannot update an official installation in place. Each guide explains its data and migration risks; do not uninstall an existing app merely to bypass a signature conflict.
3. [Add Penguin Patches to Morphe](https://morphe.software/add-source?github=pengusto/penguin-patches), or scan the source QR code below. Morphe Manager then follows stable releases; enable pre-releases for this source only to try changes from `dev` early.
4. Select the matching original APK and the desired patches, then patch and sign with Morphe Manager. Back up the Morphe signing key and retain it for future updates. Do not install emulator test APKs.
5. Check the patched behavior with disposable data before relying on it. Emulator evidence does not establish phone, account-sync or carrier acceptance.

<a href="https://morphe.software/add-source?github=pengusto/penguin-patches"><img src="docs/assets/add-to-morphe-qr.png" alt="QR code: add Penguin Patches as a Morphe source" width="240" height="240"></a>

The local QR image encodes only the linked source URL; it is an installation shortcut, not an app screenshot or test result. App-specific comparison images linked from the guides are documented emulator captures with synthetic content, not AI illustrations.

## Development

Prerequisites: **Java 21**, an **Android SDK**, and authenticated read access to Morphe's GitHub Packages registry (`read:packages`). Supply `GITHUB_ACTOR` and `GITHUB_TOKEN` through your environment; never put credentials in tracked files. See the [official patcher setup](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_1_setup.md).

```sh
git clone --branch dev https://github.com/pengusto/penguin-patches.git
cd penguin-patches
./gradlew :patches:buildAndroid
```

Patch declarations live in `patches/`; Android runtime helpers live in `extensions/extension/`; app-specific build modules keep their packaged runtimes isolated. Follow [AGENTS.md](AGENTS.md), work from `dev`, and submit changes for review. Native regression instructions are in [tests/README.md](tests/README.md); they require an isolated emulator and disposable signing certificate. A successful build alone does not establish app compatibility.

The template's release workflow is **manual only**. Patch metadata, the catalogue below and changelogs are generated by the release pipeline; do not edit them manually.

## Evidence, feedback and limits

The app guides distinguish patched official APK checks from separately tested source-fork implementations. Recorded checks include patch application, native assertions and synthetic UI/data-retention fixtures. They are prior evidence, not a claim that every check runs automatically on each commit.

Physical-device acceptance, mobile Morphe Manager execution and app-specific sync, storage or carrier scenarios remain open as described in each guide. Only the declared APK versions are supported.

For a reproducible problem, [open an issue](https://github.com/pengusto/penguin-patches/issues/new/choose) with the original app version, selected patches, Android/Morphe versions and minimal steps. Remove personal contacts, messages, calendar data, Reddit account names, OAuth codes or tokens and signing material from reports.

## License and provenance

Banner: AI-generated with OpenAI’s built-in Imagegen on 2026-10-23, using the maintainer-provided purple profile banner as a reference for the penguin’s identity only. The textile-mending scene, colors and composition were developed independently. The approved light illustration is retained unchanged; its dark companion was created by editing that same image with Imagegen. The picture element selects the matching theme, with the light image as fallback. It is an original conceptual illustration with generic app tiles, not a screenshot; no Android, Fossify or Morphe logos/assets were supplied. Existing upstream credits, trademark caveats and code-license scope below remain applicable. The illustration does not establish rights to third-party branding or app assets.

Repository code is distributed under [GPL-3.0](LICENSE), with the additional project-name terms retained in [NOTICE](NOTICE). The project began from [Morphe's official patches template](https://github.com/MorpheApp/morphe-patches-template), initial template commit `d4fa104`. Morphe is referenced for compatibility; Penguin Patches uses its own project name.

[NOTICE](NOTICE) and the app guides credit upstream app source behavior, issue authors and reference implementations. Preserve those credits when redistributing derived work. The repository license does not transfer ownership of upstream app or Morphe branding, third-party app assets or APKs; original APKs come from their respective upstream releases. The source QR represents a URL, while linked UI captures document the upstream app and patched behavior with synthetic fixtures.

## Generated patch catalogue

<!-- PATCHES_START EXPANDED -->
> **[v1.0.1](https://github.com/pengusto/penguin-patches/releases/tag/v1.0.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;13 patches total
<details open>
<summary>📦 Fossify Messages&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 1.10.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Avoid notifications for visible conversations](#avoid-notifications-for-visible-conversations) | Check visible conversation on the main thread before posting an incoming-message notification. |  |
| [Dismiss notifications when marking conversations read](#dismiss-notifications-when-marking-conversations-read) | Remove the selected conversation's notification after Mark as read in the conversation list. |  |
| [Keep background conversations unread](#keep-background-conversations-unread) | Do not mark incoming messages read when their conversation is left in the background. |  |

</details>

<details open>
<summary>📦 Fossify Clock&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.6.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Choose upcoming alarm notification time](#choose-upcoming-alarm-notification-time) | Choose the advance notice in Morphe, with separate notifications and skip actions for each alarm occurrence. Keeps native ringing times and alarm definitions. | • Upcoming alarm notice (minutes) |

</details>

<details open>
<summary>📦 Infinity+&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 8.3.4 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Configure custom OAuth for Infinity+](#configure-custom-oauth-for-infinity) | Use a configured Reddit OAuth client consistently through login and token exchange in Infinity+ 8.3.4, without the app subscription gate. | • OAuth client ID<br>• Registered redirect URI<br>• API user agent |

</details>

<details open>
<summary>📦 Fossify File Manager&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.6.2 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Keep favorites consistent after folder rename or removal](#keep-favorites-consistent-after-folder-rename-or-removal) | Update nested favorite paths after successful single or multiple renames and remove nested favorites with their deleted parent. |  |

</details>

<details open>
<summary>📦 Tasks.org&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 15.13 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Navigate to the parent task](#navigate-to-the-parent-task) | Add a parent-task arrow to the existing editor. Keeps Back behavior and the current filter; asks whether to save, discard or cancel when the draft has changes. Official project F-Droid APK 15.13 only. |  |

</details>

<details open>
<summary>📦 Fossify Music Player&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.8.4 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Prefer each track's embedded cover](#prefer-each-track-s-embedded-cover) | Use file-specific cover artwork before shared album art, retaining the original fallback and worker callback. |  |

</details>

<details open>
<summary>📦 Fossify Calendar&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 1.12.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Readable Calendar descriptions](#readable-calendar-descriptions) | Readable day/agenda summaries and native Outlook/Exchange HTML preview with explicit source editing; preserves the original editor text. |  |
| [Separate all-day reminder defaults](#separate-all-day-reminder-defaults) | Choose three separate default reminders for new all-day events in Calendar settings. Keeps timed-event defaults, existing events and the use-last-reminders setting. |  |

</details>

<details open>
<summary>📦 Kvaesitso&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.41.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Restore widget editing from the search menu](#restore-widget-editing-from-the-search-menu) | Open the existing widget editor from the search bar menu when the Edit button is hidden, without changing the preference or stored widgets. |  |

</details>

<details open>
<summary>📦 Fossify Contacts&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.6.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Show emails and notes from merged contacts](#show-emails-and-notes-from-merged-contacts) | Include duplicate contact emails and notes in the detail view without changing stored contact records. |  |

</details>

<details open>
<summary>📦 Feeder&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 2.25.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Zoom article images](#zoom-article-images) | Open article images in a separate viewer with pinch, pan, double-tap and accessible zoom controls. Linked images offer View image or Open link. Uses Feeder's existing image loader and network policy. Official project F-Droid APK 2.25.0 only. |  |

</details>

<!-- PATCHES_END -->
