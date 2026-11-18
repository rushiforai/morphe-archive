# Afterglow build110 preview

[Published release](https://github.com/afterglow-labs/ytafterglow-morphe-patches/releases/tag/v0.1.0-build.110) · [Add source](https://morphe.software/add-source?github=afterglow-labs/ytafterglow-morphe-patches&name=Afterglow)

The public feed and anonymous artifact download are hash-verified. Updating the
existing GitHub source in Morphe Manager 2.6 changes its name from YTAfterglow to
Afterglow and its patch count from 29 to 35. The temporary local import was removed;
the published GitHub source remains enabled.

The bundle targets unpatched **YouTube 21.43.523** and contains **35 selectable
patches**, including GmsCore support and Spoof video streams. Both compatibility
patches are enabled by default. The non-root setup still requires the separate
GmsCore companion app. Use this bundle's compatibility selections together with
Afterglow; selecting duplicate versions from another source overlaps hooks.

New settings, all default OFF, cover mini-player playback for made-for-kids
videos, the old playlist bar, timestamped links from Pause, Android's share sheet
and alternate image hosts. Old playlist minibar is an advanced Player → Playback
setting and needs a restart. Descriptions and the bundle name use Afterglow.
Title/description copying is pending and hidden, and its experimental native
hooks are excluded. The full iOS port remains 131 done / 4 n/a / 64 todo.

## Build and source evidence

- Morphe Desktop 1.20.0 / patcher 2.1.0 strictly applies all 35 patches and rebuilds
  the APK from this bundle alone. An independent six-patch selection of the new
  feature groups and compatibility also completes both steps.
- All 324 frozen production/provenance inputs match source. Archive integrity,
  the 35 named entries, 15 pinned compatibility assets, root/namespaced notices,
  compiled host classes and generated extension DEX are checked.
- 518 settings checks pass. Feature regressions cover 36 mini-player checks,
  122 playlist checks in 18 fresh processes, 104 share/image checks and 126
  timestamp/experimental text-policy checks. Compatibility resource merge has 30
  checks and relocated theme observer has 101. Experimental text tests do not
  establish a working shipped feature.
- MPP size: **12,662,949 bytes**. SHA-256:
  `6eb829e758476c7c1c38d089ff8feea330fe30c81422034a1dfed4eb4810eaf9`.
- Morphe Manager 2.6.0 imports the exact local bundle as **Afterglow**, with 35
  patches and one supported app. It also applies all 35 patches to the stock APK,
  rebuilds and signs it successfully on Android 16 (patcher 2.4.0). Feed version
  changes are independent of the internal displayed version 0.1.0.

The delivery manifest records the final source commit and artifact hashes.
Pinned upstream commits, full source-archive links, modification notes and the
asset lock are in [morphe-compatibility.md](morphe-compatibility.md). The bundle
and patched APK contain attribution and GPL text; settings expose these under
About → Credits.

## Runtime evidence and limits

Build110's full installed APK repeats decoded playback (9→15 seconds), actual
Pause timestamp copying at 18 seconds, Tools page reset, hidden text-copy controls,
visible bundled notices, playlist reset with Restart Now, and a full settings
reset followed by fresh decoded playback (8→15 seconds). The installed APK hash
matches the signed full candidate; its captured crash buffer is empty.

Build109's Android 16 emulator run establishes the unchanged feature behavior:

- Decoded watch playback advances 9→16 seconds. Actual native Pause at 9 seconds
  copies `https://www.youtube.com/watch?v=rfscVS0vtbw&t=9s`.
- Native share OFF→ON→OFF shows YouTube's panel, Android's chooser with the exact
  watch URL, then the native panel again. Dismissal and reopening pass.
- With Background playback OFF, made-for-kids mini-player OFF stays paused at 18
  seconds. ON advances 13→20, manual Pause remains at 22, and resume advances 23→30.
  Saved screenshots show decoded motion and the native OFF restriction message.
- Playlist ON displays a restart prompt; the restarted playlist has a usable
  full bar and advances 14→21 seconds. OFF already rendered the original resource layout on this
  fixture, so no floating-to-full visual transition is claimed.
- With the album-host switch ON, channel/profile images and recommendation
  thumbnails render. A region-blocked network/cache fixture is untested.

The title-copy experiment opened native Description and left the clipboard
unchanged. Native description selection handles and toolbar appeared, but the
promised Afterglow action was not established. Build110 removes that dependency
and hides the row, including when an older/imported preference is true. The source
experiment remains available for continued development.

The final six-patch APK also installs and exposes only its selected settings,
with the text-copy row hidden. Its native 15-second preroll runs after explicit
Play but remains at its end; content transition was not established in that
reduced selection. Use the full default selection for the tested playback
configuration. Strict independent assembly and UI ownership checks pass; reduced
selection content playback is not claimed.

Only emulator-5600 was used. Physical devices, account login, casting, alternate
watch architectures, non-video share entities and broad video/account coverage
remain unverified at runtime. Native default choices can depend on server flags.

Build106's smali escaping error, build107's resource-filename failure and
build108's eager settings-Activity initialization crash are retained in the
session ledger with fixes and checks. Build109 QA corrections for auto-hiding
controls, Android 16's resolver package and case-sensitive accessibility labels
are also retained. They are not represented as completed initial runs.
