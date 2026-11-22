# Experimental mobile Morphe settings

The regular **v1.3.0** source release includes these experimental settings for
the mobile package `com.sbs.ondemand.android`. Refresh the source normally in
Morphe Manager; the new QoL patches appear in the **Experimental** category.
The new experiments target mobile **6.4.0 (16659)** and still require phone
validation. The Android TV repository and TV package are not changed by this work.

## Open the menu

Tap the account icon at the top right. A purple **Morphe settings** row appears
above **App Settings** and **Language**. The existing menu items and their
actions remain available. The settings screen is a separate, non-exported
activity and stores preferences locally in this app's private data.

Only the patches installed in the APK contribute options to this screen. A
previously stored preference does not create a control for an uninstalled patch.
Reset restores the defaults without changing the installed-patch list.

## Patch selection versus runtime settings

The experimental patches are separately selectable in Morphe Manager's
**Experimental** category. They are selected by default so an APK can include
all implementations once. The extra runtime options start **off**; ad removal
and the intro/recap correction start **on**. The switches below control playback
behavior independently of patch selection.

For mobile **6.4.0 (16659)**:

| Runtime option | Initial state | Notes |
| --- | --- | --- |
| Remove on-demand ads | On | Direct stream when available; original path otherwise. |
| Remove live ads | On | Removes extra inserted ads; broadcast ads remain. |
| Correct intro/recap seeking | On | Provider-aware content/DAI time mapping and marker checks. |
| Automatically skip intros / recaps | Off | Separate switches; valid markers required; once per media/segment. |
| Preferred video quality | Off | Remember a semantic bitrate ceiling or prefer highest supported quality. |
| Custom rewind / forward intervals | Off | Default is the existing 15-second behavior. |
| Subtitle appearance | Off | Size, margin and optional high-contrast styling. |
| VOD speed | Off | Saved speed for direct VOD; live/DAI remain normal. |
| Controls timeout | Off | Existing three-second behavior by default. |
| Clean paused picture | Off | Hide controls while paused using the app's synchronized visibility path. |
| Keep watching | Off | Disable the inactivity prompt/exit, not long-pause stream refresh. |
| Next-episode countdown | Off | Existing autoplay/cancel/watch-credits actions remain. |
| Playback diagnostics | Off | Local provider/format/buffer information, without URLs or account fields. |
| Bounded buffering recovery | Off | Limited direct-VOD recovery, not endless retry or an access workaround. |
| External player | Off | Optional direct-VOD handoff; explicit DRM configuration stays in SBS. |
| Reduce telemetry | Off | Gates selected SBS analytics dispatchers; other SDK reporting can continue. |
| Binge-watching preset | Not applied | Confirmation enables the installed skipping/keep-watching/countdown options. |

Settings are saved immediately. Restart the current video after changing
player-creation options such as seek intervals or quality policy. Every
experiment can be disabled independently. The binge preset changes the same
individual settings, rather than adding a hidden second policy layer.

For **6.3.0 (16435)** the verified account-menu integration and the existing ad
patches are retained. New QoL patches are restricted to 6.4.0; unsupported
controls do not appear on 6.3.0.

## Deliberate limits

- TV-specific channel-zapping, remote input filtering and TV drawer/start-page
  changes are not included in this mobile patch set.
- No patch supplies missing intro metadata, higher server renditions, regional
  access or offline licenses.
- External players may not support a session's media format or authentication.
  If none is installed, normal playback continues. Cancelling the chooser leaves
  the normal SBS media prepared; use Play to resume it.
- Subtitle view styling cannot change burnt-in text.
- Reduced telemetry is not a promise of zero network tracking. Authentication,
  watch-progress services and SDK object initialization are preserved.

## Verification and test on a phone

The build is CLI-only. Runtime JVM fixtures exercise the actual production
policy helpers with synthetic app objects and Android API stubs; they are not
Android UI or device playback tests. They cover time mapping, stale managers, marker
validation, once-per-media skipping, seek/speed policy, quality persistence,
preference types/defaults, installed-feature registration, reset and presets.

The original 6.4.0 APKM is patched with all selected experiments, rebuilt, and
its emitted menu/manifest/playback hooks independently inspected. The 6.3.0
legacy ad/menu build is checked separately. No APKs or decompiled app sources
are committed.

The new settings screen and experimental playback options have not been tested
in a device GUI. Phone validation is still required:

1. Open the purple account row, change a setting, leave/reopen, and restart the
   app to verify persistence. Reset should restore the defaults.
2. With defaults, play VOD and live content and compare the existing ad removal.
3. Enable one experiment at a time. For skip/auto-skip test titles with and
   without markers, a deliberate rewind, seeking and the next episode.
4. Test quality, captions, speed, pause/resume, PiP, rotation and player changes.
5. Test an external-player cancellation and return to normal SBS playback.
6. Keep telemetry/recovery experiments off until their respective behavior has
   been checked. No option is claimed device-stable from a JVM/static check alone.

Reproduction:

```sh
morphe-exec bash -lc 'cd /workspace/patches && for test in tests/runtime/*/run.sh; do bash "$test"; done'
morphe-exec bash -lc 'cd /workspace/patches && ./gradlew --offline --no-daemon :patches:clean :patches:generatePatchesList'
```

The complete source investigation is in [QoL research](qol-research-6.4.0.md).
