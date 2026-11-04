# Readable Calendar descriptions

The patch supports the original official Fossify Calendar APKs below. It is
independent of [Pengusto Calendar's source fix](https://github.com/pengusto/Calendar/pull/1).

| Version | Official APK | SHA-256 |
| --- | --- | --- |
| 1.12.0, code 23 | [calendar-23-foss-release.apk](https://github.com/FossifyOrg/Calendar/releases/tag/1.12.0) | `d43b2df05d5702bea760a7ab03402977ba72e446e5932038efbdab248a5de987` |
| 1.12.1, code 24 | [calendar-24-foss-release.apk](https://github.com/FossifyOrg/Calendar/releases/tag/1.12.1) | `dae815ce83285facf9fd8648b8c4f039700d95126325db124521eba479b270ba` |

Both official APKs have signer SHA-256
`affdb124d3f4720c2f98dbca9eacba0514fba4306e20a2786c861c3c0d6ff292`.

HTML descriptions appear as a native preview in the event editor, with an
explicit source-editing toggle. Day/agenda lists, the event-list widget and
event-reminder notifications display readable summaries. Plain descriptions
and the alternative location display retain native behavior. HTML source,
including surrounding whitespace, is preserved on initial save, title-only
save and explicit source edits. No WebView, scripts or remote images are used.
The patch does not change the storage format.

## Verification and limits

On Android 15 ARM64, the local bundle was applied with Morphe Desktop 1.18.1
and 1.19.1 to both original APKs. For each version the repeatable test in
[`tests/calendar/description_acceptance.py`](../tests/calendar/description_acceptance.py)
reproduced raw HTML on the original and passed **34 checks** on the patched APK:
real widget RemoteViews rendering, actual posted collapsed/expanded reminder
notifications, HTML, Google-style line breaks/entities, plain text, the
location alternative, source toggle, native saves and exact source preservation.
The original passed 29 baseline assertions, including reproduction of native
whitespace trimming. These are synthetic offline fixtures.

Morphe Manager 2.2.0 also applied the local candidate on the emulator: its
exported APKs passed the HTML checks on both versions and the combined all-day
suite passed 131 checks on 1.12.0. A same-key update to the Manager export
retained the database and preferences. Morphe Desktop rejects reapplication.
The separate all-day reminders patch **still supports 1.12.0 only**.

[Matched synthetic screenshots and test evidence](https://github.com/pengusto/penguin-patches/tree/6cef3805d5f9e9109e81211483b03029d38c78c3/calendar-html-surfaces/2026-11-04)
show rendered widget RemoteViews and the actual notification shade. The local
Manager candidate was built with the documented Desktop-API dependency
substitution; the release pipeline separately validates its rebuilt bundle.
A real Outlook/CalDAV round trip, physical-device tests, full theme/font-scale/
rotation coverage and an installed launcher-widget capture remain open. The
source-fork tests are separate evidence.

## Widget and notification comparisons

**Original versus patched 1.12.1.** The widget comparison renders the actual
widget RemoteViews in a test container; the notification comparison captures
the actual notification shade. Both use the same synthetic description.

| Original widget | Patched widget |
| :---: | :---: |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/6cef3805d5f9e9109e81211483b03029d38c78c3/calendar-html-surfaces/2026-11-04/before-widget.png" width="300" alt="Original widget shows HTML source"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/6cef3805d5f9e9109e81211483b03029d38c78c3/calendar-html-surfaces/2026-11-04/after-widget.png" width="300" alt="Patched widget shows readable description"> |

| Original notification | Patched notification |
| :---: | :---: |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/6cef3805d5f9e9109e81211483b03029d38c78c3/calendar-html-surfaces/2026-11-04/before-notification.png" width="300" alt="Original notification shows HTML source"> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/6cef3805d5f9e9109e81211483b03029d38c78c3/calendar-html-surfaces/2026-11-04/after-notification.png" width="300" alt="Patched notification shows readable description"> |

[Capture provenance & checks](https://github.com/pengusto/penguin-patches/tree/6cef3805d5f9e9109e81211483b03029d38c78c3/calendar-html-surfaces/2026-11-04)

## Installation and updates

Use an original official APK, not the Pengusto Calendar fork APK. The patch
keeps `org.fossify.calendar`. A Morphe-signed build cannot install over official
Fossify because the signing certificate differs. Before uninstalling the
official app, back up local-only events to ICS and verify synchronized calendars;
uninstalling removes app-local data and settings. Pengusto Calendar
(`org.fossify.calendar.pengusto`) can remain installed alongside it.

Keep and back up the same Morphe signing key for repatched updates. Do not
install emulator test APKs. Do not force compatibility with other versions.
