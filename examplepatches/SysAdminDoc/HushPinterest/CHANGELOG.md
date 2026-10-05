# Changelog

Every HushPinterest release, newest first.

## 0.0.4 (2026-10-03)

Unreleased source changes. The published release remains 0.0.3.

* **Pinterest:** Choose up to 32 visible pins from a grid menu. Each selection uses Pinterest's supplied media, reports its queue or save result and appears in Download history. Android 9 opens one save picker at a time. Stopping leaves downloads already started alone.

* **Tooling:** Invalid object and wide-register copies stay unknown during disabled-path checks. Initialized values retain their type when loops merge, so valid copies keep their identity without inventing equality between unrelated values.

* **Tooling:** Disabled-path checks now follow copied object references and long/double register pairs, including overlapping moves, null aliases and NaN comparisons.

* **Tooling:** First installs now handle Android's empty package-path response safely by confirming that the package is absent. Existing signer and downgrade checks still apply.

* **Pinterest:** Profile header and About website buttons can now open the Android browser chooser. Pinterest, account and sign-in links keep their native path, as do all links while the switch is off or HushPinterest is paused.

* **Pinterest:** Pin-menu reports count recognized optional rows and their visibility decisions without collecting row text or recording unknown entries.

* **Pinterest:** Reports now show local push readiness, including notification permission, delegation and messaging component state. They keep live delivery unverified and omit private component names and unknown delegate packages.

* **Tooling:** The script contract tests run to the end under Windows PowerShell 5.1 as well as PowerShell 7.

## 0.0.3 (2026-10-03)

The first release, with 17 patches for Pinterest 14.38.0. Pinterest 14.25.0 patches the same way for phones on Android 9. Hide ads, Disable analytics and Strip link tracking are selected by default along with the settings, and everything else starts off until you pick it.

* **Pinterest:** Hide ads removes promoted pins from the home feed, search, related pins and boards before Pinterest draws them, so they don't leave a gap. The four panels Pinterest only builds for an ad stay folded away too.
* **Pinterest:** Hide AI-labeled pins is an optional Feed switch. It takes out the pins Pinterest itself labels as made or changed with AI, using the same label Pinterest shows on the pin.
* **Pinterest:** Hide shopping and product pins is an optional Feed switch for shoppable pins, shopping stories and featured board placements. It reads both of the ways Pinterest marks them.
* **Pinterest:** Disable analytics stops Pinterest's usage-event and performance uploads and AppsFlyer tracking while sign-in, the feed and pins keep loading. Its switch and Pause bring those uploads back, and Firebase Analytics is turned off when you patch.
* **Pinterest:** Strip link tracking takes known tracking parameters off links you copy or share. The destination, signed parameters and pin.it short links stay as they are.
* **Pinterest:** Download pins adds Download pin to the pin menu for original images and the highest-resolution MP4 Pinterest supplies. Android 10 and newer save in Downloads, and Android 9 asks where to save.
* **Pinterest:** Download history shows each download's current status, even after Pinterest restarts, with Retry or a way back to the pin. Removing an entry keeps the file.
* **Pinterest:** On Android 9, Pending saves explains what to check if a save was interrupted. Saves there have a five-minute and 256 MiB limit, and a file that might have finished is kept.
* **Pinterest:** Pin actions show a pin's media size and type when Pinterest supplies them, and explain why a pin has nothing to download.
* **Pinterest:** Open links in your browser sends a pin's Visit link to your browser, and System share sheet uses Android's share sheet, including from the Share button at the top of a pin. Both start off.
* **Pinterest:** Interface has new optional switches for the screenshot share menu, recent searches, comments, the Create and Updates buttons, header icon buttons and the collage, visual search and Promote pin menu entries. They all start off.
* **Pinterest:** Quiet email reminders and Disable update nag give the confirm-your-email reminder and the in-app Play Store update prompt their own switches. The update prompt switch is for 14.38.0.
* **Pinterest:** HushPinterest settings opens from a long-press on Pinterest's icon or from Pinterest's App info page, with a switch for every patch, Pause, diagnostics and a settings backup. It's in German, Spanish, Indonesian, Brazilian Portuguese and Turkish as well as English.
* **Pinterest:** Settings search finds controls by their common names in every supported language, and each Interface summary says what it changes and when.
* **Pinterest:** Import settings shows each switch's old and new value before applying a file, and Undo puts your previous switches back once. If an import can't finish, your switches stay as they were. Exports and imports keep all 19 feature choices.
* **Pinterest:** About has an optional setup guide covering patch choices, settings backup and your signing key, with links to Pinterest's password and data-export help. It walks you through setting a Pinterest password if you joined through Google.
* **Pinterest:** The Supported links button opens Android's link settings, so pinterest.com and pin.it links can open in the patched app.
* **Pinterest:** If a settings page can't load, Retry tries again and Back returns to Pinterest.
* **Pinterest:** Diagnostic reports say where they were saved, and Copy quick report is there when storage isn't. Links, IDs and sign-in secrets are taken out.
* **Pinterest:** Updates checks every Pinterest version a release supports, including the Android 9 build, and links to the release notes and install steps. It never downloads anything by itself.
* **Pinterest:** Pinterest 14.38.0 is the target, and 14.25.0 stays supported for Android 9. Every patch was checked against both builds.
* **Tooling:** The bundle is built with Morphe patcher 1.15.0, so it needs Morphe Manager 1.33.0 or newer.
* **Tooling:** The project starts from HushTelegram's build, shared extension library and release checks. Every file carried over names HushTelegram in its header and in provenance.json.
* **Tooling:** Release checksums are signed with the HushPinterest release key, FCE5ECE3182A647B3AF2C5ED2DC35E8D5C00E8A6, and scripts/verify-release-checksums.ps1 checks a download offline.
* **Tooling:** Before a patched APK is delivered, the checks hold its manifest to the selected patches and require every feature hook, fallback path and inserted call to resolve.
* **Tooling:** Device helpers take an exclusive device lease, verify the device and both signing keys, and update in place without removing apps or clearing data. Concurrent builds keep separate outputs.
* **Tooling:** Commons Lang, HttpClient and Guava resolve to reviewed versions, checksums are strict and the advisory gate refuses vulnerable resolutions.
* **Tooling:** Gradle runs at low priority with two workers and a bounded heap so the desktop stays responsive.
* **Tooling:** The source ledger records every other Pinterest patch project reviewed, at pinned commits. None of their Pinterest code was adopted.
* **Tooling:** A crimson Hush emblem with a push pin and a matching dark README hero bring Pinterest into the Hush family.
