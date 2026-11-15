# Development notes

Working notes behind the patches in this repository. They are written for whoever has to
re-derive the patches against a future app version — they are not user documentation.

| file | what it is |
|---|---|
| [FINGERPRINTS.md](FINGERPRINTS.md) | Which matchers anchor on facts R8 cannot rename and which are bound to the current obfuscation map, with the re-anchoring strategy per fingerprint — read this first when a new app version lands. |
| [VERSIONING.md](VERSIONING.md) | What the version list means, why an unlisted version is *skipped* rather than failed, how to try one anyway, what to report, and the maintainer checklist for adding support for a new version. |
| [INTERNALS.md](INTERNALS.md) | The verified hook map for the supported version (class/member → anchor → which patch uses it), the patch cookbook (where the next patches would go), the verification recipe and the traps that cost real time. Start here to author a new patch. |
| [GETTING-THE-APK.md](GETTING-THE-APK.md) | Where the Quest APK actually comes from (it is not on the mirror sites — those carry the Daydream build), the version rule, and why this repository never ships the APK. |
| [APP-NAME-CARD.md](APP-NAME-CARD.md) | Why a cloned build shows `App name unavailable` in the dock, with the decompiled data path and the guard on every API that could name it — **settled: no in-APK fix exists**, and the `com.oculus.app_id` variant was implemented and measured. Read this before trying anything about the app's name or the store's "restore" prompt. |
| [SPONSORBLOCK-NOTES.md](SPONSORBLOCK-NOTES.md) | SponsorBlock in the VR app (auto-skip only): the public API contract, the phone patch's design as reference, the seven player hooks this app gives us **with measured uniqueness counts**, the licence and terms-of-service position, and the build log (addenda 1–19) including the four bugs the device found. The pre-implementation plan and its one blocking unknown — the playback-position accessor — were resolved while building and removed on 2026-10-14; `git log` has the removed text. |
| [MOD-SETTINGS-STRATEGY.md](MOD-SETTINGS-STRATEGY.md) | How to build native in-app settings (the "Patch settings" hub and sub-screens) reusing the app's own dead preference XMLs, fragments, navigation, and back stack. |

Everything here is unofficial and unaffiliated with Google, YouTube or Meta; the app internals
described are Google's code, and this repository contains only patches and notes about it. No
account data, credentials or device identifiers are recorded here. Licensed like the rest of the
repository — GPL-3.0, see [../LICENSE](../LICENSE).
