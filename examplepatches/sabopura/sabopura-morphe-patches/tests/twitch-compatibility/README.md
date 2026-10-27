# Twitch APK integration verification

Keep official inputs, patched APKs and logs outside the repository. Run with JDK 21
and Morphe Desktop's all-in-one JAR (the local validation used 1.14.0 / patcher 1.15.1).

```powershell
& $java -Xmx3g -cp $morpheCli tests/twitch-compatibility/VerifyTwitchDex.java $patchedApk normal $officialBaseApk
& $java -Xmx3g -cp $morpheCli tests/twitch-compatibility/VerifyTwitchDex.java $loginPatchedApk login $officialBaseApk
```

Both APKs must be built from the official input and the same final Android MPP.
Use `--exclusive --bytecode-mode=FULL` and explicitly select the seven Twitch
patches; additionally select `Fix login` for the second build. Do not use
`--force` or `--continue-on-error` for release validation. Check the CLI result
JSON has zero failed patches and all steps succeeded; process exit code alone
does not establish patch success.

Run this pair for every declared target (currently 30.7.2 / 3007026,
31.6.0 / 3106006 and 31.7.0 / 3107006) and for the 31.5.2 / 3105026 fixture. 31.5.2 is no
longer a declared target, so it is patched with `--force`; it stays because the device probes
below use its obfuscated names. This verifier checks actual DEX wiring, field accessibility,
native claim submission, original chat-return coverage, intact chat arguments,
nullable author ID conversion, channel ID conversion, width argument ordering,
optional login selection, and the exact native eligibility body retained in the
points helper. Its branch comparison uses instruction indices, so a string
changing between ordinary and jumbo encoding does not invalidate offsets.
Unknown payload instructions are rejected rather than silently ignored.

Then verify signatures with Android SDK apksigner, install on the dedicated
API 36 test emulator (Google APIs image), run `cmd package compile -m verify -f tv.twitch.android.app`,
and check launch and process-scoped AndroidRuntime errors. Keep user data.
The bytecode checks and an unauthenticated launch do not test signed-in claims,
push delivery, live/VOD playback, or successful authentication; record these
separately when a test account is available.

## Execute the native chat path on ART

`LayoutProbe.java` is an Android instrumentation test fixture for the official
31.5.2 / 3105026 input. Its obfuscated names are deliberately fixture-specific;
production patches still resolve targets structurally. Compile it against the
Android SDK, run D8, and package it as `io.github.sabopura.playbackprobe`, with instrumentation
`io.github.sabopura.playbackprobe.LayoutProbe` targeting `tv.twitch.android.app`. Sign the
test APK with the same local signer used for the patched target. Keep APKs,
keystores and device output outside Git. Install only on a dedicated test emulator.

```powershell
adb -s emulator-5554 shell am instrument -w io.github.sabopura.playbackprobe/io.github.sabopura.playbackprobe.LayoutProbe
```

Require `RESULT failed=0`, all eight `PASS` lines, and no `FAIL`. Run for both
login selections. The fixture inflates all three modified native layouts, invokes
the native channel constructor, and creates a real native chat holder/model with
synthetic text. It invokes the patched binder and draws the row in all three
native styles, selected and unselected, with both a Tuid author and a null author.
It also invokes the deleted-message formatter twice and draws the rebuilt span.
It does not use real chat/account data or perform authenticated playback.

The original 31.5.2 patch failed all three native chat styles with a lazy
`VerifyError` in `RowAccess.userId`: the null branch merged Tuid and String into
Object at a shared return. Reflection-based class loading, package compilation,
and application startup had passed. These are therefore insufficient regression
checks. `VerifyTwitchDex.java` now also checks the null branch targets an explicit
zero and that the converted String has a separate return path.

## Device probe

`device-probe/` is an instrumentation APK (`io.github.sabopura.deviceprobe`) that runs inside the
patched Twitch process. Compile its sources against the Android SDK, run D8, link the manifest
with aapt2, and sign it with `SignProbe.java` and the same local signer as the patched target.
Each probe prints `PASS`/`FAIL` lines and ends with `RESULT failed=0` when everything holds.

```powershell
adb -s emulator-5554 shell am instrument -w io.github.sabopura.deviceprobe/io.github.sabopura.deviceprobe.<Probe>
```

| Probe | Versions | What it exercises |
| --- | --- | --- |
| `AdsProbe` | 31.6.0 / 31.7.0 | Block ads layers, a real stitched pre-roll replaced through the wrapped IVS HTTP client |
| `GestureProbe` | all | Twitch's real theatre views (drag container, theatre layout, patched player root, controls) over a Twitch activity; injected swipes and taps for brightness, volume, chat scrolling inside the theatre, a scrolling list underneath the theatre (it must not take the swipe), the mini player and brightness restore |
| `SpeedProbe` | all | Twitch's IVS player on a real live stream and VOD: the audible player is chosen over a newer muted preview, VOD speed, live catch-up back to 1x, the reset on another VOD |
| `NavProbe` | all | Twitch's home frame (`viewer_landing`) with Twitch's insets; navigation bar default, top and hidden |
| `LandscapeProbe` | all | The live theatre's landscape layout with Twitch's ConstraintSet: chat width and background. Pass `-e set el9 -e percent r` on 30.7.2, `-e set w9a -e percent s` on 31.6.0 and `-e set gaa -e percent s` on 31.7.0 (defaults are the 31.5.2 names `s9a`/`s`) |
| `ChatProbe` | 31.5.2 | Real native chat rows bound with each chat setting (fixture names as in `LayoutProbe`) |
| `DanmakuProbe` | 31.5.2 | Twitch's parsed live chat message objects fed to the danmaku layer in the real player layout |
| `DeclutterProbe` | all (unfollow part 31.5.2 / 30.7.2, highlight part 31.5.2) | Each "Hide" option against the layouts where Twitch shows the view (the home feed's stories shelf and button included); bottom bar tabs leave no gap; the unfollow heart leaves the button list under the player, and Twitch's own chat header builder still puts Follow only on channels not followed; hype trains and pinned messages dropped in Twitch's own highlight filter, while polls, removals and everything with the options off go on (each call must come back within 3 s), and no event is turned into text |

Live playback needs network access from the emulator; they use only public, anonymous playback
tokens. The probes restore the settings they change.

## A real live stream

The probes build parts of Twitch's screens; `live-smoke.sh` opens the real theatre instead. It
starts Twitch without an account on the root-capable test emulator (Twitch's own logged-out
home, enabled through its `logged_out_experiment_variant` experiment), opens one of the most
watched live streams (one without content classification labels: those open behind an "intended
for certain audiences" screen instead of playing), and checks for 40 s that there is no ANR or
crash, that the main thread is not spinning or stuck in patch code, and that the chat keeps moving.

```sh
ANDROID_SERIAL=emulator-5554 tests/twitch-compatibility/live-smoke.sh full 40 out/live
```

Run `on`, `off` and `full` (Hide options, plus swipes and danmaku) for both targets. In the
`full` run, swipe the edges of the player as well (`adb shell input swipe 1000 650 1000 300 700`
on a 1080-wide portrait screen) and check that `cmd media_session volume --stream 3 --get` and
the window's `sbrt=` in `dumpsys window windows` change. A frozen theatre or a swipe taken by
the screen underneath was only found this way; the probes alone passed.

## Player menu and settings screen

`MenuProbe.java` is version-independent and runs on every supported Twitch version. Package
it in the same instrumentation APK as `LayoutProbe` and run:

```powershell
adb -s emulator-5554 shell am instrument -w -e expect all io.github.sabopura.playbackprobe/io.github.sabopura.playbackprobe.MenuProbe
```

It requires that the feature flags of the applied patches are on, that `player_control_overlay`
contains exactly one `sabopura_player_menu` button and none of the older buttons, and that the
player menu, the settings screen, the danmaku category and the settings search open over a
real Twitch activity. Screenshots are written to the app's external files directory
(`menu-probe/`). Use `-e expect danmaku` or `-e expect chat` for builds with fewer patches.
