# First patch: Fossify Calendar

Target for initial development: official Fossify Calendar 1.12.0 (`org.fossify.calendar`), APK `calendar-23-foss-release.apk`.

Official release: https://github.com/FossifyOrg/Calendar/releases/tag/1.12.0

Published original APK SHA-256: `d43b2df05d5702bea760a7ab03402977ba72e446e5932038efbdab248a5de987`.

Reference source fix: https://github.com/pengusto/Calendar/pull/1, commit `d4f1825`.

Acceptance criteria:
- Exchange HTML descriptions display readable native paragraphs/links; plain text stays unchanged.
- Original source remains exact on title-only save, including whitespace.
- Explicit source editing works; no scripts/WebView/remote image loads.
- Themes, accessibility font scale and rotation remain usable.
- Patched APK installs and updates with consistent package/signing identity; installation and local-calendar migration are documented.
- Test patch application against the official APK, install/UI/save on Android, then real Outlook round-trip on a test event. Do not claim that round-trip before evidence.

## Implemented scope and verification

The patch covers the event editor plus day and agenda list summaries, not widget/notification summaries. Resources wrap the existing editor; an onResume hook attaches the native preview. Two narrowly validated hooks render only description getter results inside the release APK’s merged list-row binder. Model getters, locations and the source editor remain unchanged. Unsupported bytecode fails patch application.

On the official 1.12.0 APK in isolated Android 15 ARM64 emulator:
- MPP build and application/rebuilding passed.
- Native paragraphs/link text displayed without Exchange metadata/style text.
- Explicit source toggle exposed the exact synthetic HTML.
- Title-only edit, save and process restart preserved exact original HTML.
- Explicit source edit saved and rendered after restart.
- Update installation with the same temporary test certificate succeeded; no AndroidRuntime crash output.

Real Outlook server round-trip, themes/font scale/rotation and Morphe Manager on-device execution remain unverified for this patch. Earlier tests for the source fork are separate evidence and must not be attributed to this bundle.

## Installation and updates

Input is the original official APK, not the Pengusto Calendar fork APK. This initial patch keeps `org.fossify.calendar`. A Morphe-signed build cannot install over official Fossify because the signing certificate differs. Export local-only events to ICS before uninstalling official Fossify; uninstalling removes app-local data/settings. Synced server calendars are separate, but verify sync and backups before migration. Pengusto Calendar (`org.fossify.calendar.pengusto`) can remain installed beside this patch.

Keep the same Morphe signing key for repatched updates and export its backup. Do not install the local emulator test APK; users should patch/sign using Morphe Manager. Only version 1.12.0 is declared supported; do not force unknown versions.
