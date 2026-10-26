# Clock #14: configurable upcoming-alarm notice

**Morphe patch included in [v1.0.0-dev.7](https://github.com/pengusto/penguin-patches/releases/tag/v1.0.0-dev.7); emulator-tested on 2026-10-24.**
Targets the original official Fossify Clock **1.6.0** APK only. The patch is
listed in Morphe as **Choose upcoming alarm notification time**.

## Choosing the advance notice

Set `leadMinutes` in Morphe before patching: any whole number from **1 to 1440**,
default **120 minutes**. Presets are 10, 30, 60, 120, 360, 720 and 1440 minutes.
This is a **patch-time option**, not a new setting in Clock. To change it,
patch the original APK again and use the same signing key for a data-preserving
update. Invalid numeric values fail during patch execution instead of silently
using the default. Do not patch an already patched APK or force compatibility.

For an alarm created inside the chosen notice window, the notice is scheduled
500 milliseconds from now, as in Clock's original short-window behavior. Clock's
native ringing time is retained. Notification permission and the Android
notification channel still govern whether a notice is visible.

## Correct association with each alarm

Original Clock uses one upcoming-notification PendingIntent for every alarm.
Android ignores extras when comparing PendingIntents, so scheduling/cancelling
one alarm can replace/cancel another alarm's advance notice. The original
receiver also chooses the nearest alarm for its displayed time independently
of the ID in the action intent. The original main ringing and skip-action
PendingIntents already have separate identities; the baseline test confirms
that distinction.

The patch gives each alarm its own upcoming PendingIntent, tagged notification
and occurrence timestamp. Notification text and skip action use that same
alarm and timestamp, including the label and Clock's 12/24-hour preference.
Actions from an old occurrence are ignored. Disabling, deleting, ringing or
snoozing one alarm clears its own notice while retaining other alarms' notices.
The native alarm editor, main ringing PendingIntent, AlarmManager alarm-clock
API and ringing/snooze service remain in use.

Skipping a recurring alarm schedules its next selected local weekday without
changing its stored time, selected weekdays or enabled state. A small separate
preferences file records the skipped local date and definition, preventing
native rescheduling from rearming that occurrence after process restart.
Editing the time/days changes the definition; explicitly cancelling/disabling
clears that state. Skipping a non-recurring alarm uses Clock's native
disable/delete behavior, including one-shot deletion.

Legacy upcoming scheduling is retired separately. Legacy notification cleanup
checks its channel before cancelling ID 10003, so an unrelated timer using that
numeric ID is not swept away. Runtime scheduling state lives in
`penguin_clock_upcoming`; existing alarm definitions are not migrated or
rewritten by patch installation.

## Original APK and prototype provenance

| Item | Verified value |
| --- | --- |
| Official APK | [clock-10-foss-release.apk](https://github.com/FossifyOrg/Clock/releases/download/1.6.0/clock-10-foss-release.apk) |
| Package / version | `org.fossify.clock`, `1.6.0`, code `10` |
| APK SHA-256 | `43cf9f0ec45f1f1ff2df47286622e5b8f3acedaeb07b7f7641b5243dbedca079` |
| Official certificate SHA-256 | `affdb124d3f4720c2f98dbca9eacba0514fba4306e20a2786c861c3c0d6ff292` |
| Source | [Fossify Clock 1.6.0](https://github.com/FossifyOrg/Clock/tree/1.6.0), commit `4ecb9e33c51c0b2096af2379e7ac9dc17c3e07e6` |
| Local MPP | `patches/build/libs/patches-1.0.0-dev.5-clock-local.mpp` |
| MPP SHA-256 | `c737c14ccbd0c64e21cbae4100159ae389ab838b70c2585faa745747d59b1793` |
| Tested default patched APK SHA-256 | `12e5e5e879f39355f795d7ad3fe9adc6cbc2272136758601fa677e7961d36e0a` |

Only a disposable emulator certificate was used for the test APKs. It differs
from the official certificate, so these test builds cannot update an official
installation in place. Same-key update acceptance starts with the unchanged
official APK payload re-signed using that disposable key. It does not establish
an official-to-differently-signed update path. APKs, keys and raw device data
remain in ignored `.scratch/clock/` directories.

The release contains **12 patches for nine apps**. Source and MPP are available in [v1.0.0-dev.7](https://github.com/pengusto/penguin-patches/releases/tag/v1.0.0-dev.7); test APKs and keys remain private. On 2026-10-24 the
user explicitly authorized a [technical issue comment](https://github.com/FossifyOrg/Clock/issues/14#issuecomment-6376790938)
asking whether a native PR is welcome and whether lead-time configuration and
per-alarm handling should be separate changes. It mentions the unpublished
prototype and emulator test limits. The user subsequently authorized matched
before/after screenshots and a factual repository link in that same comment.
Only five raw screenshots, a provenance README and a curated verification JSON
were published on `pr-assets` in commit
[`7c84712`](https://github.com/pengusto/penguin-patches/commit/7c84712b4821ed7b991a12da6dc46dbe556dc108).
The image URLs in the comment are pinned to that commit. Maintainer approval
remains pending; no native PR implementation is claimed.

## Verification

The original-APK identity test fails for the reproduced shared PendingIntent;
the same assertion passes on the Morphe-patched official APK.

The final default build passed **134 assertions**, plus separate process
restart/rescheduling phases (8 + 8 assertions) and notification-permission
denial (10). Coverage includes actual timed AlarmManager delivery at the
chosen boundary, unchanged native ringing time, overlapping alarms in both
scheduling orders, equal alarm times, ID/time/label/action consistency, skipping
only the selected alarm, stale actions, one-shot deletion, native deletion,
native ringing and five-minute snooze. Calendar cases cover daily/weekly
selection, midnight/year boundaries and local-date calculations in UTC,
Europe/Berlin and America/New_York around DST transitions. They do not establish
device behavior for ambiguous/nonexistent DST clock times.

Additional on-device timing runs pass with **1, 30, 720 and 1440 minutes**.
Every install retains package/version and the disposable certificate; SQLite
rows and existing preferences are compared before/after the same-key update.
The baseline-to-patched update includes custom enabled, disabled, recurring and
one-shot fixture rows with a Unicode sound title and vibration setting.

Real UI acceptance edits and saves a label, compares every other field and
unrelated row, disables B while A's notice remains, deletes A through the
native selection menu, and checks persistence after app restart. Test-only
fixtures are then removed. Screenshots show the Morphe-patched official APK,
not a replacement source build. Logs contain no fatal/linkage errors.

The separate [matched notification comparison](https://github.com/pengusto/penguin-patches/tree/7c84712b4821ed7b991a12da6dc46dbe556dc108/clock-14/2026-10-24/)
uses the same two enabled daily alarm definitions and fixed ringing timestamps,
approximately 45 and 60 minutes ahead. The original has no upcoming notice
outside its ten-minute window; the patched 120-minute build receives both
through natural AlarmManager delivery. A's actual notification action removes
only A's current occurrence notice, leaving B's notice and both recurring
definitions intact. Same-key update and unrelated-row preservation pass.
The runner expands Clock's group through a fresh native UI control; PNGs are
unedited. Raw logs, databases and test APKs remain ignored.

Negative tests reject already patched bytecode and numeric lead times 0, -1
and 1441. Original Clock 1.5.0 and Kvaesitso are skipped by compatibility
filtering with zero applied patches and unchanged DEX payloads. Eight original
class digests guard concrete R8 bindings; changed supported-version bytecode
fails clearly. The runtime ABI check resolves 48 app method/field references.
Clock's MPE contains only four Clock extension classes, without app stubs or
additional runtime libraries. The shared Fossify and Kvaesitso MPEs are
byte-identical to the preceding local bundle.

Java 21 / official Morphe Gradle plugin 1.3.4 builds successfully. Android lint
reports zero errors (the standalone Clock MPE has three warnings: two exact
alarm permission checks supplied by the verified host manifest and one dynamic
resource lookup). Desktop 1.18.1 uses Patcher 1.15.1. See the
[repeatable build and acceptance commands](../tests/clock/README.md).

Limits: rooted AOSP Android 15/API 35 ARM64 emulator only. Physical/OEM
devices, real audio output, deep Doze/battery policies and a full device reboot
remain unverified. The restart test explicitly invokes Clock's native
rescheduling receiver after process death; it is not a full boot test.

Source implementation: [patch](../patches/src/main/kotlin/io/github/pengusto/patches/clock/UpcomingAlarmsPatch.kt),
[runtime](../extensions/extension/src/main/java/io/github/pengusto/patches/extension/clock/UpcomingAlarms.java).
This addresses [Clock #14](https://github.com/FossifyOrg/Clock/issues/14), not
the separate silent-timer issue #253.
