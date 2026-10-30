# Tests

Lurk has three kinds of checks:

- **Host checks** run anywhere, without an APK, the Android SDK, a device or the network:
  `bin/test-host`. Pull request builds and the release workflow require them to pass.
- **Output checks** (`tests/<app>/verify_*.py` and the `test_*.py` scripts that take a file) inspect
  a patched APK, its apktool output or a Hermes bundle.
- **Probes** (`tests/<app>/*Probe.java`, `*Probe.kt`) run real methods of a patched APK on Android's
  runtime, through the `bin/test-<app>*` scripts and an emulator or device.

[docs/development.md](../docs/development.md#testing) describes the workflow around them, and each
app's page under [docs/](../docs/README.md) says which checks pin which patch and what couldn't be
verified (signed-in flows, for example).

## Host checks

```sh
python3 -m pip install -r tests/requirements-host.txt
bin/test-host
```

They need Python 3, Git, a JDK (21 recommended), Chrome or Chromium, Node.js and the two pinned
Hermes compilers (`mise install`). `JAVA_HOME` selects the JDK, `CHROME` the browser and
`MORPHE_WORK` where fixtures and generated files go (default `~/build/lurk-morphe-patches`); fixtures
are removed afterwards on Linux and kept on macOS for a look. `bin/test-host` runs every registered
check even after one fails, then exits nonzero if any did. A missing dependency fails the checks that
need it rather than skipping them.

| Check | What it covers |
|---|---|
| `tests/twitch/verify_interface.py` | Twitch's interface extension: startup destinations, Home and profile tabs, Clips routing, the chat header's Bits and subscription offers, settings switched off. |
| `tests/twitch/verify_playback_links.py` | Twitch's playback and share-link helpers. |
| `tests/twitch/verify_fill_screen.py` | Twitch's *Fill screen* on a view-tree double of the landscape theatre with a display cutout: the container's cutout padding, the scaled video, the views kept clear of the cutout, and everything given back next to the chat, in portrait, in picture-in-picture, for vertical videos and when the player leaves; Android 10's window cutout mode and the React Native player's resize mode. |
| `tests/twitch/test_async.py` | The backup stream behind *Avoid stitched ads* against a slow local HTTP server: deadlines, cancellation, ad fallback, oversized and trickling responses, stale results. |
| `tests/twitch/test_vod_requests.py` | *VOD chapters* requests: shared loads, retries, bounded queues and waiters, player and owner changes, switching off. |
| `tests/twitch/test_privacy_consent.py` | Twitch's privacy and consent helper. |
| `tests/twitch/test_providers.py` | Third-party emote, badge and pronoun providers: scheduling, ownership, both response orders. |
| `tests/twitch/test_rn_chat.py` | The compiled React Native chat helpers, the chat overlay's context and the landscape chat column's opacity. |
| `tests/shared/test_settings.py` | The real `Settings`, `Registry` and settings screen helpers against each app's registered settings (`tests/shared/registry/`): JSON round trip, parent ordering, defaults, restart flags, stored and wrongly typed values, the unreadable-registry fallback. |
| `tests/shared/test_sleep_timer.py` | *Sleep timer* in Kick and Twitch on a virtual clock: expiry, resuming, stop and release, races at dispatch. |
| `tests/rumble/test_state_transitions.py` | Rumble's chat keywords across sign-in changes, and *Remember playback speed* switched on, off and on. |
| `tests/kick/verify_player.py` | Kick's player decisions: mobile-data quality ceiling, normal latency, background audio. |
| `tests/kick/verify_privacy.py` | Kick's privacy helper. |
| `tests/kick/test_chat_page.py` | Lurk's Kick chat page script in headless Chrome, with every request answered by the test. |
| `tests/kick/test_compiled_bundle.py` | Kick's runtime code compiled with both pinned Hermes compilers, and the chat composer and page lifecycle scripts. |
| `tests/test_release.py` | The release script on local Git fixtures, without GitHub or a build: recovering unpublished releases (also when the other branch's release commit is newer), the stable backmerge, generated files, release notes and the host gate itself. |
| `tests/test_patch.py` | `bin/patch` staging and cleanup with a stand-in for Morphe, `bin/bump`'s sorting of failures and the version-literal scanner. |
| `tests/verify_version_literals.py` | No app version in a string literal under `patches/src` outside `shared/Constants.kt`. |
| `tests/verify_fingerprint_strings.py` | Every literal in a fingerprint's `strings = listOf(...)` is a whole dex string of the stored APK of each target version, since Morphe Patcher 2.0 compares them exactly. Skips an app whose target APK isn't in `apks/` (so it checks nothing in CI). |

The JVM checks compile the production extension classes unchanged and replace only the Android
boundary (context, preferences, HTTP, UI) with small doubles, so they test the code that ships.

**Adding a host check.** A host check is a standalone Python script that exits nonzero when it fails
and needs no APK, Android SDK, device or network. Compile the extension code it tests rather than
copying it, write generated files under `$MORPHE_WORK`, bound every wait, and add the script to the
`checks` list in `bin/test-host`. `tests/test_release.py` verifies that every registered check can
fail the gate.

Before building a release, `release.py` runs the `bin/test-host` of the exact commit it releases,
including an older commit it rebuilds to recover a release that didn't publish. A missing or failing
gate stops the publication.

## Output checks and tools

These need a patched APK, decoded output or a Hermes bundle. Each script's docstring gives its usage;
they honor `MORPHE_WORK` and `JAVA_HOME`. Decode a patched APK for them with
`java -jar tools/apktool_*.jar d -f -p "$MORPHE_WORK/apktool-framework" -o <dir> <patched.apk>`.

- `bin/verify-hooks <app> <patched.apk>` checks that app code calls every extension method listed in
  `tests/<app>/expected-hooks.txt`, through `tests/verify_extension_calls.py`. Run it after adding a
  hook or patching a new app version: Morphe can drop an injected call without an error.
- `bin/bump <app> <version>` patches a new app version with every patch and sorts what fails by cause,
  including class names the probes here use that the new version no longer has.

## Probes

`bin/test-<app>` and the other `bin/test-<app>-*` scripts compile a probe from `tests/<app>/` with the
Android SDK, push it with the patched APK and run it with `app_process`, so it calls the patched app's
real methods on ART. They use `emulator-5580` unless `ANDROID_SERIAL` names another device, so a
connected phone is never used by accident; several accept `--compile-only`.

A probe that needs an obfuscated class or method should look it up in `assets/lurk/locators.json` in
the patched APK, where the patches record what they matched, instead of pinning R8's names. Probes that
still pin names are the ones `bin/bump` reports when an app version renames them.

## Kick

Kick patch integration regressions use the actual emitted APK and its Hermes manifest:

```sh
bin/test-kick-hermes patched/kick.apk [stock/index.android.bundle]
ANDROID_SERIAL=emulator-5580 bin/test-kick patched/kick.apk
ANDROID_SERIAL=emulator-5580 bin/test-kick-chat patched/kick.apk
ANDROID_SERIAL=emulator-5580 bin/test-rumble patched/rumble.apk RefreshProbe
python tests/rumble/verify_refresh.py patched/rumble-apktool
```

`bin/test-kick-hermes` needs no device. It runs, against a patched APK and the stock bundle (by default the
one `bin/decompile kick` wrote): `verify_sources.py` (every JavaScript-editing patch says it turns off Kick's
updates; no version literal outside `Constants.kt`), `test_hermes.py`, `verify_literals.py`, `verify_hosting.py`
and `verify_quality.py` with hermes-dec (the latter two only when the APK has Stay on channel and Default video
quality), `HermesProbe.kt` on the JVM, `verify_player.py`, `verify_privacy.py`, and on an apktool decode of the
APK `verify_sleep_queue.py` and `verify_analytics_jobs.py`. It skips, and says so, the checks of patches the APK
doesn't have. The stock bundle's hash and the Kick version are read from the patch sources (`tests/kick/pins.py`).
`bin/test-kick` first checks that Kick's code calls every hook in `tests/kick/expected-hooks.txt`, then runs the
bundle loader, its reuse of the prepared bundle, and the analytics promise stubs on ART.
`python3 -I tests/kick/refresh_chat_page_contract.py --check` compares Kick's live chat page with
`tests/kick/chat-page-contract.json`; it needs the network and is not part of any gate.

`verify_hosting.py` first verifies the stock hash, embedded bundle and manifest, then applies the
actual `stay_on_host` edit. It executes the host content, JSX callbacks, countdown hook and timer
callbacks, with React state/effect boundaries and persistent compiler caches. It executes the parent's
actual event-to-child output branch to unmount between hosts. Random duration alone is seeded at its
memo slot. Stock/off and three bytecode mutations check waiting, memo invalidation and manual routing.
It rejects unsupported executed instructions. Pusher delivery, React Native rendering and real routing
remain device integration work.

`test-kick-chat` needs SDK 36, a JDK, adb, an ART device and the host browser prerequisites above.
It runs production KickHttp/KickChat from the APK with real OkHttp responses and Android JSON/URI,
captures the WebView JavaScript boundary, then executes those exact scripts in offline Chrome.
Full/info responses, numeric/string IDs, malformed JSON/config, unknown channels, previews, independent
switches and unchanged response bodies are covered. It writes capture logs under `$MORPHE_WORK/tests/kick-chat`.
The APK-free page scenarios remain registered in `bin/test-host`; native captures require this separate command.

## Rumble

`bin/test-rumble <patched.apk>` compiles every `tests/rumble/*Probe.java`, pushes them with the APK and runs
them with `app_process`, so each probe calls the app's real, patched methods on ART. Name probes to run a
subset. The probes read the obfuscated names they need from the APK's `assets/lurk/locators.json`:

- `AdsProbe`: Block ads, with the real ad repository, the server video lists (Boosted cards dropped) and
  the Home section parser (`ad_block` sections hidden).
- `PrivacyProbe`: Disable analytics with and without Keep watch progress (only watch-progress events
  pass), Block cookie notice (the start loop starts only Airship, with essential services) and Don't save
  searches.
- `HideProbe`: Hide Shorts, Hide Premium upsells, Hide tipping and Rants, Hide comments and related videos
  and Hide premium-only videos: the DTO getters, parsers and emptied composables, with the switches off as
  controls.
- `PlaybackProbe`: Fill screen on Media3's real `AspectRatioFrameLayout`, Seek interval, Sleep timer's direct
  player pause, Default playback speed and Background audio by default.
- `ChatProbe`, `KeywordsProbe`, `CountProbe`, `InterfaceProbe`, `PlayerProbe`, `PremiumProbe`, `QualityProbe`,
  `SearchProbe`, `UpdateProbe`: the chat hooks, keyword filter, exact counts, home sections and bottom bar,
  player settings, Unlock Premium's getter, Default video quality, search history and Block update prompts.
- `RefreshProbe`: the *Refresh stream* hooks: video-load registration, the error panel's tap handler, the
  reload bridge and the stock player's reload, with ExoPlayer, Compose and the player state supplied.
  Reloads keep the source and position without saving a quality; null sources, the switch off, a missing
  player and stock quality changes are controls, and the callback is restored after exceptions.

After the probes, `bin/test-rumble` runs `tests/rumble/verify_compose.py` (every Compose trace label the
patches match must exist in the APK, and App Info must have exactly three rows, which the hidden settings
patch relies on), `tests/rumble/verify_switch_reads.py` (code must read every registered setting key) and
the hook check against `tests/rumble/expected-hooks.txt`. `tests/rumble/verify_refresh.py <apktool-dir>`
checks the emitted fatal-state branch, and `tests/rumble/verify_settings.py` the registered defaults.
Playback while signed in is untested.

## Twitch: React Native and providers

```sh
bin/test-twitch-chat-hermes stock/index.android.bundle
ANDROID_SERIAL=emulator-5580 bin/test-twitch-rn patched/twitch.apk
ANDROID_SERIAL=emulator-5580 bin/test-twitch-providers patched/twitch.apk
ANDROID_SERIAL=emulator-5580 bin/test-twitch-ui patched/twitch.apk
```

- `bin/test-twitch-chat-hermes` runs the production Hermes scanner and transplant on the pinned stock
  bundle, checks branch, exception, register and header bounds and rejects donor leftovers, then
  rebuilds the stock bytes independently for the switch-off case.
- `bin/test-twitch-rn` runs the native side of the React Native chat bridge on ART with isolated
  preferences and no vibration service: which messages qualify and who owns a notification, without
  vibrating the device.
- `bin/test-twitch-providers` repeats the provider checks of `test_providers.py` on ART with Android's
  own `JsonReader`, `Canvas` and PNG decoding, controlled HTTP responses and isolated preferences: no
  traffic to the providers and no app data. That covers reused React Native rows across channel, room
  and user changes, retired effects, and pronoun completion in both response orders.
- `bin/test-twitch-ui` drives real `MotionEvent`s, view trees and `Handler` queues: the chat overlay's
  feed and recreation, stale owners and the switch off, blocked text, Unicode truncation, queue bounds,
  gestures, edge exclusions and the brightness clamp and restore. It doesn't use a visible activity,
  the physical volume keys, an account or real server events.

`test_async.py` and `test_vod_requests.py` replace JSON, HTTPS and UI with doubles; the on-device
`AdBackupProbe` (`bin/test-twitch-ad-backup`) and a look at a real VOD are still needed for the
platform side. The guest checks of the React Native chat consumers, defaults and reloads, and real
store moderation, need a prepared installed app and putting it back as it was afterwards. Provider
images, local deletion and the landscape chat column's opacity were also checked on a phone on
2026-10-18.
