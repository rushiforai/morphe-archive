# NLZIET 5.15.3 inspection and verification

Inspected on 6 October 2026. Original input is the supplied APKMirror APKM, not a substitute download.

## Input identity

- Package: `nl.nlziet`; version name `5.15.3`; version code `740503`.
- APKM variant: arm64-v8a, 480–640 dpi, Android 10+; base manifest min SDK 29, target SDK 36.
- Original APKM SHA-256: `bb4f8cb45c307a5ace9473eb81003ced3c3fe64f767013dda6926474829450fc`.
- Extracted base APK SHA-256: `8f72449d36012af813fc8c0af73a24a807fb4589da95ac5ed95aa8e4a4b2fe04`.
- Player: Bitmovin Android SDK **3.160.0**, from `com.bitmovin.player.BuildConfig.VERSION_NAME` and `EnvironmentUtil.sdkVersion`. The SDK includes its own media playback/DRM implementation; this patch neither replaces it nor patches license acquisition.

## Inspected targets

The launcher/playback host is `nl.nlziet.mobile.app.di.mobile.InjectActivity`, a `singleTask` activity. Its exact superclass chain is `InjectActivity → fi5 → un → androidx.fragment.app.t → u61 → t61 → android.app.Activity`. `u61` is the inspected AndroidX ComponentActivity implementation with inherited user-leave/PiP listener dispatch. Calls to `invoke-super` retain that dispatch.

`fi5.getCurrentFragment()Landroidx/fragment/app/o;` returns the current nested destination. Playback is `nl.nlziet.mobile.presentation.ui.player.PlayerFragment`. Its binding `lr3.J` is `PlayerUiView`; `PlayerUiView.getPlayerSurface()` retrieves `yg7.j`, the Bitmovin `PlayerView`. Resources inspected include `fragment_player.xml`, `view_player_ui.xml` and orientation variants. Video is held in `player_view_container`; the UI includes close, options, casting, timeline, details and tooltips.

Relevant actual methods:

```text
InjectActivity.onResume()V
PlayerFragment.onPause()V
PlayerFragment.onStop()V
PlayerFragment.onDestroyView()V
PlayerFragment.onConfigurationChanged(Configuration)V
PlayerView.getPlayer()Lcom/bitmovin/player/api/Player;
PlayerView.onPause()V
PlayerView.onPictureInPictureModeChanged(Z, Configuration)V
PlayerView.setPictureInPictureHandler(PictureInPictureHandler)V
DefaultPictureInPictureHandler.<init>(Activity, Player)V
Player.isPlaying()Z
Player.isDestroyed()Z
Player.getSource()Lcom/bitmovin/player/api/source/Source;
RemoteControlApi.isCasting()Z
```

These names and signatures come from actual decoded DEX. No guessed fingerprints are used. The patch resolves exact class descriptors/signatures, demands a unique pause-forwarding call with the inspected register, checks superclass/framework overrides and verifies SDK APIs before modification. Package/version/code are enforced in resource and bytecode execution, not merely advertised in compatibility metadata. The inspected architecture is the only compatibility target; no support for other versions/architectures is claimed.

## Existing PiP and lifecycle

The app manifest does not declare `supportsPictureInPicture`. SDK PiP classes/methods exist, but no NLZIET code creates `DefaultPictureInPictureHandler`; `PlayerView`'s PiP-handler field is initially unset. NLZIET also has no activity-specific user-leave/PiP callback.

`PlayerFragment.onPause` cancels existing jobs/timers, retrieves `PlayerUiView.getPlayerSurface`, calls `PlayerView.onPause` once via **v0**, and calls the fragment superclass. `PlayerView.onPause` forwards to fullscreen, player and web-UI lifecycle handlers. The patch changes only that one invocation to a helper: it skips the SDK pause only for the tracked surface while its activity is actually in platform PiP and is not finishing/destroyed. Entry attempts or denied requests never count as PiP.

`PlayerFragment.onStop` calls `PlayerView.onStop`, then conditionally `Player.unload` depending on `PlayerUiView.D()` (SDK casting) and `C()` (wrapper flag), and performs its existing bookkeeping. Stop/unload/destroy, the explicit user pause paths, source loading, authentication and DRM bytecode are not patched. PiP stays visible in the paused activity; an actual stop still runs original cleanup, including dismissing/closing PiP. No resume/play is forced to compensate for paused content.

## Patch behavior

The manifest adds PiP support and `screenLayout|smallestScreenSize` to existing `orientation|screenSize`. No permissions, auth providers, DRM configuration, package name or launch mode are changed.

The runtime requires the current player destination, exactly one attached/shown Bitmovin surface, a non-destroyed/non-casting actively playing player, a loaded source, visible surface bounds and platform PiP support. It installs the existing SDK's default handler, then calls platform `enterPictureInPictureMode` with 16:9 and source bounds. It deliberately does not enable unattended Android 12 auto-entry. Back keeps original navigation rather than entering PiP.

The activity forwards actual mode callbacks to the SDK. The extension hides sibling chrome on the existing video ancestry, preserving direct SDK subtitles, and temporarily expands ancestor dimensions. It keeps the original surface hierarchy/player/source; no reparenting or DRM session construction. Saved visibility/dimensions are restored on exit/resume. State holds weak activity/view references. A layout listener re-hides chrome after layout updates and is removed on exit. New remote controls are not added; Android supplies close/fullscreen controls.

## Observed checks

- Standard template `./gradlew buildAndroid --no-daemon`: **failed**, unable to resolve `app.morphe.patches:1.3.4`; no GitHub Packages credentials configured. Not represented as successful.
- Verified fallback `scripts/build-public.sh`: **passed**, compiling the same Kotlin/Java sources to JVM+DEX `.mpp`; official Desktop 1.18.1 loads its one named patch. Patcher version bundled in Desktop verified as **1.15.1**.
- Official Desktop APKM merge + apply, FULL bytecode mode: **passed**. Result lists successful patching, rebuilding and signing, no failed patches. All supplied configuration splits included.
- Original-APK structural regression: **5 expected failures / 6 tests**, including `None != 'true'` for missing PiP manifest support; cleanup check already passed.
- Patched-APK structural regression: **6 / 6 passed**.
- Runtime Robolectric suite: **12 / 12 passed**, Android 14 framework shadows with **test-only** Bitmovin API doubles. Covers active entry, paused/source-less/destroyed/casting/non-player/unavailable/ambiguous gating, denied request fallback, finishing-activity pause, visibility/dimension restoration and missing-exit-callback restoration. The casting/missing-exit regressions were observed failing before their runtime fixes.
- Rejection checks: **2 / 2 passed**, including `--force` on version `5.15.4` and already patched input; expected clear errors and no output APK.
- Preservation comparison: **21,617 original classes retained**, only `InjectActivity` and `PlayerFragment` differ after ignoring debug line/source positions and equivalent omitted null/false/zero static defaults. Within the fragment, only the single pause invocation differs; all other fragment methods, including stop/unload/destroy, are unchanged. Four extension classes added.
- **2 / 2 native libraries byte-identical** to supplied split APKs.
- `apksigner verify --verbose --print-certs`: **passed**, v2 signature, one 4096-bit RSA signer. Output certificate SHA-256 `364062323a8579236fc3909754643cdb629be44ff25934fc001a0a890ac3e391`.
- `zipalign -c -P 16 4`: **passed**.
- `aapt2 dump badging`: package/version/code remain `nl.nlziet / 5.15.3 / 740503`; min SDK 29 and target SDK 36 retained.
- `adb devices -l`: **no devices attached**. No APK installation, user-data changes, screenshot or on-device playback test performed.

## Remaining limitations

A compiled/verified APK is **not** verified NLZIET streaming. Authenticated live/VOD playback, video/audio continuity, DRM renewal, service signature/attestation checks, audio focus, lockscreen, vendor PiP transitions, captions, both themes and layout restoration require a real device. Robolectric API doubles cannot establish those. No authentic screen preview can be supplied without a device; no mock screenshot is presented as evidence.

The result keeps NLZIET's package name but is re-signed, so it cannot update an installed official app. Preserve its data; use a separate device/profile with no existing NLZIET installation or a matching existing patched signing key. The delivered signing key is a local Morphe-generated build key, not NLZIET's certificate; its private key is not shared or committed.

The aspect ratio is fixed at the inspected 16:9 layout. PiP permission denial retains the normal lifecycle. Entry errors are logged under `NLZIET-PiP`; reflection failures do not attempt alternate private APIs or bypass DRM/auth. Other NLZIET versions need fresh inspection and a new patch target. The artifacts are ready for human review, not independently reviewed or merged.

## Primary references read

- [Official Morphe template](https://github.com/MorpheApp/morphe-patches-template), README, Gradle/build configuration, example patches and release workflow.
- [Morphe development setup](https://github.com/MorpheApp/morphe-documentation/blob/main/docs/morphe-development/1_setup.md).
- [Patcher introduction](https://github.com/MorpheApp/morphe-patcher/blob/v1.15.1/docs/1_patcher_intro.md), patch anatomy, API docs and the v1.15.1 source (`Document`, contexts, compatibility, mutable methods and instruction extensions).
- [Android native PiP documentation](https://developer.android.com/develop/ui/views/picture-in-picture).
- Public-source template plugin v1.3.4 inspected to reproduce its MPP layout. No replacement release workflow was introduced.

## Subsequent user report

On 6 October 2026, after delivery, the requester reported that the patched app
“works beautifully.” This is a positive user report, not a developer-observed
ADB test. Device model, Android version, screenshots/logs and individual
acceptance scenarios were not supplied; the detailed limitations above and
experimental compatibility flag still apply.
