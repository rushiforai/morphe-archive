# Shizuku guide selection and Android TV evidence

Reviewed 30 October 2026 for the bilingual Shizuku and Android TV guides. The
user requested actively maintained implementations with a practical edge,
rather than copying every entry from a directory. The user has used Next and
Shevery and specifically reports poor remote navigation in Shevery.

## Selection policy

Use the supplied [Awesome Shizuku list](https://github.com/timschneeb/awesome-shizuku#shizuku-implementations)
for discovery. Check each candidate's own repository, release notes and relevant
source before recommending it. Recent substantive fixes count as maintenance;
a translation-only push, a new theme or a claimed TV label alone does not prove
a practical advantage. Source features, published-APK behavior and complete
device validation are separate evidence levels.

## Selected implementations

| Implementation | Maintenance observed | Practical reason to include | Limits |
| --- | --- | --- | --- |
| [Shizuku-Next](https://github.com/rushiranpise/Shizuku-Next) | Stable `v14.0.31-next` published 28 October; recovery/USB startup changes and substantive fixes in the preceding 26 October release | Same Shizuku identity/API, pairing and recovery assistance, dedicated TV focus/input code | Default for the documented KingInstaller workflow. No blanket promise for Android 17 devices or unattended boot. |
| [Porter](https://github.com/d4rken-org/porter) | `v0.8.1-rc0` published 7 October; protocol/client fixes in release notes and wireless-start/compiler fixes on 28 October | Minimal bridge, managed compatibility replacement, TV code-reading pairing workflow | The release tag has an RC name even though GitHub's prerelease flag is false. Compatibility companion required for Shizuku-only clients. KingInstaller with Porter was not tested. |
| [ShizukuPlus](https://github.com/thejaustin/ShizukuPlus) | Recent preview releases on 29–30 October include API scopes, DPM fallback and service-start fixes | Exclusive Plus APIs and Device Owner/Dhizuku integration for clients that actually use them | Conditional advanced option. No generic KingInstaller advantage or TV remote recommendation established; no independent runtime validation in this task. |

Primary setup sources are [Next's capabilities](https://github.com/rushiranpise/Shizuku-Next#features),
[Porter's startup guide](https://porter.darken.eu/setup),
[Porter's compatibility guide](https://porter.darken.eu/compatibility), and
[Plus's client compatibility documentation](https://github.com/thejaustin/ShizukuPlus#-third-party-app-compatibility).
The basic Android debugging process is corroborated by the
[original setup manual](https://shizuku.rikka.app/guide/setup/), without promoting
its old manager APK as the new-install default.

## Candidates not added to the recommendation list

Shevery is actively maintained and has a broader toolbox, but its remote
usability problem is directly relevant to the user's TV requirement. It is not
the TV default. The original upstream app's latest release was v13.6.0 on
25 May 2025; the supplied directory reports Android 17 incompatibility. That
directory warning is attributed, not presented as our own Android 17 runtime
reproduction. The paused predecessor and cosmetic variants are not new-install
recommendations. Other active implementations were not linked as recommendations
without an additional advantage established for these guides. This is not a
claim that every unselected implementation is broken or unmaintained.

## Published APK identity for the TV check

Downloaded regular release APKs and matched the SHA-256 digests in GitHub's
release asset metadata:

| APK | SHA-256 |
| --- | --- |
| Next `v14.0.31-next` | `f75b8b74727d281f3d7fd242298f676bfb4ee81d2feb5298aa719b05284fa149` |
| Porter `v0.8.1-rc0` | `4894495ac6ee1b72517925bf5bd4c54d9cee17e987e10cfee5dcab564f14db27` |

Relevant source exists in the actual release tags, not only newer development
code: Next's `TelevisionFocus.kt` and Porter's `TvPairingOverlay.kt` were read
at their release refs. Both manifests declare a Leanback launcher entry and
do not require a touchscreen. These declarations alone do not prove good UI.

## Independent Android TV smoke check

Used a disposable Android TV 16 ARM64 emulator at 1920×1080 with D-pad key
events and Back. No fork was installed or replaced on the user's physical TV.

Next's published APK displayed its TV navigation rail. D-pad navigation reached
Apps and Settings; screenshots and UI hierarchies were inspected. This does not
establish that every settings control, dialog, pairing screen or permission
prompt is usable. Back from the top-level screen exited to the launcher. A
later launcher picker was excluded from the app-dialog evidence rather than
being misreported as a successful Next dialog test.

Porter's published APK completed its three onboarding pages with remote input
and reached the startup dashboard. Settings and the computer-start command
dialog were opened with the D-pad. The latter displayed the current installed
`libporter.so` path. An external help link had no browser handler on this bare
TV image; the guide includes a phone/computer alternative for reading help.
Its documented TV pairing procedure was
checked against the shipped-tag source and current setup documentation. Reading
the pairing code, completing wireless pairing, starting its service and
authorizing a Shizuku-only client were not established by this navigation check.

The task artifacts, downloaded-APK metadata, source excerpts, screenshots and
UI XML are retained under
`/tmp/flitsmeister-auto-evidence-20261030/shizuku-docs/`. This temporary location
is an investigation artifact, not a public documentation link.

The TV guide therefore asks users to check remote navigation, the real client,
sleep/wake, full reboot and their actual network independently. No successful
retail-TV reboot or Ethernet-only recovery is claimed here. The earlier
KingInstaller phone/emulator admission result belongs to the separate
[Android Auto investigation](2026-10-30-flitsmeister-android-auto-installer.md).
