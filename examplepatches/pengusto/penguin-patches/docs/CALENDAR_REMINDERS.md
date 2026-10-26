# Calendar #381: separate all-day reminder defaults

Morphe patch included in [v1.0.0-dev.7](https://github.com/pengusto/penguin-patches/releases/tag/v1.0.0-dev.7): **Separate all-day reminder defaults**.
Only the original official **Fossify Calendar 1.12.0**, package
`org.fossify.calendar`, version code **23**, is supported.

## Current upstream state

Checked on 2026-10-24: [issue #381](https://github.com/FossifyOrg/Calendar/issues/381)
is open, with **12 thumbs-up reactions**, labels `feature request` and
`needs triage`. It had no comments at the initial check. Targeted issue/PR searches found no matching
implementation. The latest official release is
[1.12.0](https://github.com/FossifyOrg/Calendar/releases/tag/1.12.0).
The shared-default behavior also remains in
[main at 3d4f247](https://github.com/FossifyOrg/Calendar/blob/3d4f24725e71e891050de8ee7824abc1736d1951/app/src/main/kotlin/org/fossify/calendar/activities/EventActivity.kt).
Reaction counts and search results are dated observations, not a promise about
future maintainer plans. Under subsequent explicit user authorization, one
[comment with matched screenshots and repository link](https://github.com/FossifyOrg/Calendar/issues/381#issuecomment-6377666858)
was posted, asking for native PR greenlight. No native PR was opened.

## Behavior

In **Settings → New events**, turn off **Use the last event's reminders as
the default for new events** to use fixed defaults. The native three defaults
continue to apply to timed events. Three additional **All-day reminder** rows
apply only to fresh all-day event drafts. The first all-day default is
**12 hours before**; the other two start disabled.

Each row offers no reminder, at-start, 6 hours, 12 hours, 1 day, 2 days and
custom **0–525600 whole minutes**. Invalid custom input leaves the dialog open
and does not save. Values are minutes before the all-day event's **local
midnight**, using Calendar's existing elapsed-minute scheduling semantics.
For example, 6 hours means the previous evening at 18:00 when there is no
offset change in that interval. Native scheduling retains its existing
one-second offset. These values are not a new time-of-day notification policy.

When native reuse-last-reminders is enabled, its behavior takes precedence and
the new settings are hidden. Existing events and duplicates retain their
reminders. Imported/stored records are not migrated. Switching a fresh draft
between timed and all-day modes retains manually selected minutes and reminder
types for each mode, including after activity recreation and process death.
Changing defaults affects subsequent drafts, not existing events/open drafts.

The new labels/dialog text support English and German, with English fallback;
reminder values use Calendar's native formatter/localization. The additional
preferences use the separate `penguin_calendar_all_day` file. They are not
added to Calendar's native settings export format.

## Implementation and provenance

Official APK:
[calendar-23-foss-release.apk](https://github.com/FossifyOrg/Calendar/releases/download/1.12.0/calendar-23-foss-release.apk)

- SHA-256: `d43b2df05d5702bea760a7ab03402977ba72e446e5932038efbdab248a5de987`
- Official signer SHA-256: `affdb124d3f4720c2f98dbca9eacba0514fba4306e20a2786c861c3c0d6ff292`
- Source tag 1.12.0: `1a85738b3ec989334eb284724caafec6c5a50214`, Fossify/contributors, GPL-3.0.

The patch validates the actual shipped R8 classes (`Lcp0;`, EventActivity and
SettingsActivity). It hooks the fresh-event branch after native defaults load,
the native all-day switch, settings visibility and saved-instance lifecycle.
Existing event/duplicate branches never acquire new-draft state. The Java-only
`calendarreminders.mpe` adds no runtime library or app stubs. The common,
Kvaesitso and Clock MPEs remain byte-identical to the previous Clock-local MPP.

Calendar's asynchronous `gotEvent` can finish after native instance restoration,
replacing current reminder fields and resetting the all-day switch. The runtime
captures namespaced draft state, waits for native load completion and restores
the current values and switch without rewriting the event database. Tests cover
both activity recreation and actual background process death through Recents.

Compatibility guards retain instructions/registers, handlers, signatures,
flags, fields and annotations, normalizing only debug items that Morphe drops
during mutable-class conversion. EventActivity.onResume is excluded so the
independent HTML patch can attach its preview there. Both patches are selectable
together; the existing HTML source/editor and native save path remain in use.

Build: official Morphe Gradle plugin **1.3.4** source
`a230c33f7eca1e18b07bf1114ca850421520f98d`, Desktop **1.18.1**, Patcher **1.15.1**,
Java 21, Android API 35 / Build Tools 36.0.0. The existing local fallback uses
the verified Desktop API when GitHub Packages credentials are unavailable.
REA's Android package inspection was unavailable because its optional JADX
provider was not configured; DEX inspection and Android tests used the existing
Morphe/smali tools instead. No tool installation/configuration was added.

Release bundle: `patches-1.0.0-dev.7.mpp`, from [v1.0.0-dev.7](https://github.com/pengusto/penguin-patches/releases/tag/v1.0.0-dev.7), with **12 patches for nine apps**. The Calendar reminder runtime's prototype SHA-256 is `99bc81ee7803e6f7d50f18fe0a16ab439cdcd3752a9554e69e96d8c6d60ff183`.

[Matched screenshot evidence](https://github.com/pengusto/penguin-patches/tree/5848155eeefc1a9d612a0b3f0ae106e1eb5bc993/calendar-381/2026-10-24/) contains four raw screenshots and curated provenance/checksums from the tested prototype. APKs, keys, databases and full logs remain private. A native PR remains conditional on maintainer greenlight.

## Verification and limits

See [repeatable test commands](../tests/calendar/README.md). Tests use the named
disposable rooted Android 15/API 35 AOSP emulator, synthetic offline calendar
events and the existing disposable test signing key. Original and patched APKs
use the same test certificate for data-preserving test updates. No uninstall or
app-data clearing is used. Baseline payload is checked against the official APK;
installation/patch input identity, native database rows and preferences are
verified explicitly.

The actual APK tests cover fixed/reused defaults, three reminders, off/at-start,
manual values/types per mode, existing/duplicate events, title-only save and
exact HTML source retention, activity/process restoration, settings visibility,
preset/custom dialogs and Android reminder scheduling. Negative inputs cover
wrong package/version, reapplying this patch and a valid DEX fixture with a
modified native toggle. Shipped-APK linkage and existing MPE payload checks pass.
Build and extension lint pass with no lint issues. The matched screenshot run
also passes: original and patched new all-day drafts share title/dates, timed
defaults remain unchanged, and every database row/preference survives the
same-key updates and unsaved draft/settings navigation unchanged.

Final run on 2026-10-24: **7 baseline checks**, **131 integration checks for
the standalone patch**, **131 with both Calendar patches**, **92 visible UI /
process-death / restored-save checks**, and **4 negative-input cases** pass.
Both APK variants preserve all pre-update database rows/preferences. Native
AlarmManager scheduling matches the expected trigger, and the combined APK
resolves all 63 extension API references against the shipped app.

Physical/OEM behavior, battery-restricted delivery, real CalDAV/Outlook/contact
sync, imported cloud events, task defaults, native settings export of the new
preferences and other APK versions are **not verified**. The patch does not
replace native alarm delivery or change its permission requirements. No claim
is made that the native source app has been fixed upstream or officially released.
