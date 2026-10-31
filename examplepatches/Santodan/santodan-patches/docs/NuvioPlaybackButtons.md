# NuvioTV playback buttons

Current target: **NuvioTV 1.1.0-beta.9 (1072)**. See [beta.9 contracts and verification](NuvioBeta9.md). Version-specific DEX notes, commands and artifacts for earlier versions below are historical; use the beta.9 contract and `verifyNuvioLatest` for the current release.


**NuvioTV - Customize playback buttons** targets `com.nuvio.tv` `1.1.0-beta.9`
(1072). It is independently selectable and uses the shared, unnamed settings-menu
dependency. No other optional Nuvio patch is required.

Open **Settings → Layout → Santodan-Patches → Playback**. Enable customization,
then choose **Edit playback buttons**. The whole button list scrolls continuously,
with leading icons and numbered positions, grouped into Main row and More actions.
Hold **OK** on a button to pick it up, use **Up/Down** to move it within its group,
then press **OK** to save. **Back** cancels the move and restores the saved order.
The moving row stays focused and the native list scrolls to follow it. Changes
remain a draft until confirmed. A short OK press opens show/hide and group options.
Hidden buttons retain their position. The list has no pages or position submenu.
Changes are saved automatically for this installation. **Reset playback buttons**
restores the native configuration and disables customization.

Supported controls: Play/pause, next episode, subtitles, audio tracks, sources,
player engine, episodes, watch party, playback speed, aspect ratio, external player,
stream information, and playback-issue reporting. Availability and actions remain
native: customization does not create audio tracks, enable unavailable next episodes,
or expose disabled watch-party/report features. The More toggle appears when there
are available controls assigned to More, and remains available to close an expanded
group. Moving everything to the main row removes the need for More.

When **Submit segments to IntroDB** is also selected, **Submit segment to IntroDB**
appears in the editor with its filmstrip icon. It can be hidden, reordered or moved
to More actions. The original IntroDB availability, capture stages and submission
dialog remain authoritative. Its default placement stays at the end of the main
row. Without the IntroDB patch, its editor entry is absent. Existing saved layouts
are retained and acquire the new optional control at the default position.

At least one standard main-row control remains available for native focus navigation.
If a saved layout would leave no such available control for the current video, Play
is temporarily shown in the main row. Its saved placement is retained. Report alone
cannot supply the native progress-bar focus anchor. Native down-focus and More-focus
requesters follow the actual visible controls; callbacks and up/down actions are
otherwise unchanged. Putting many controls in the main row can exceed a TV's width;
move less-used controls into More.

## Original-input evidence and mutation

Input: `../OriginalApps/NuvioTV-1.1.0-beta7.apk`, SHA-256
`a35eb5033615018f50f5205dc51f52e526b3b606f7e563943201dfbd7366d1f2`.
Manifest metadata confirms package/version/code. Original DEX and focused baksmali
output are in `../.inspect-nuvio-beta7/` and `playback-smali/`.

- `Lva/bd;->invoke(Object,Object)Object` is an instance Function2, 49 registers.
  It contains nine unique `Lva/yd;->b` range calls: eight main controls and the More
  toggle. Each uses 14 register words for 13 parameters (including a wide tint).
- `Lpa/a;->invoke(Object,Object,Object)Object` is an instance Function3, 78 registers.
  Its playback branch has four `yd.b` calls and one `yd.G` report-control call.
  Its two unrelated switch branches are retained. Native conditional branches,
  string resources, icon/painter creation, callbacks, default masks and availability
  are retained rather than reconstructed from source.
- The main lambda constructs exactly one playback `pa.a`, using its 12-parameter
  constructor and a 13-word register range. The instance is registered immediately
  after construction. Exactly one `Lv/b0;->d(Z,Modifier,Enter,Exit,String,Content,Composer,I)V`
  invocation provides expanded/collapsed state.
- `Lv/c0;` is the original empty AnimatedVisibilityScope interface. With customization
  enabled, the original More content is evaluated synchronously under a distinct
  composer group, even when collapsed, collecting native control arguments for
  movement into the main row. Its native empty Row emits no controls. The original
  animation call is used unchanged when customization is disabled.
- Native controls render in configured order at the original final More-toggle call,
  inside the existing main Row. Buttons use separate composer keys. Collection is
  thread-local, reset at the start of each main-row composition, cleared before
  rendering, and cleared when evaluating More fails. No background observer is added.
- Exact instruction fingerprints validate both original lambda bodies, including
  register operands, literals, references and branch/switch offsets. Missing,
  ambiguous, modified and already-patched layouts are rejected before either owner
  is mutated. Native control, picker, action, state and composer contracts are also
  validated. The source contains the complete authoritative descriptors.

## Verification and device checks

Both patch orders place the IntroDB `renderControl(Object,Object)` hook immediately
before the customization `finish` bridge. The IntroDB extension optionally calls
`collectIntroDb(Object[])`; a missing customization class or disabled customization
uses the standalone native rendering path. A collected button retains the original
icon, action, availability and capture-state label. Review dialogs are composed
even when the control is assigned to collapsed More actions or hidden.

The icon list uses native `ab.uh.a` leading vectors (argument 10, default mask 15328,
with an explicit key/focus modifier) inside `ha.m2.z`. The dialog uses explicit 16dp
padding and 8dp content spacing. Its native `eb.p.i` LazyColumn uses `g0.j0.b`
remembered state, a 360dp maximum height, native spacing/padding, and `g0.i.q` items
keyed by button ID rather than position. `h1.j.f`, the existing `ab.i1` branch 4
and `h1.f0.d` restore focus just as the native picker does. `h1.j.f` is only the
initializer which writes the last-read slot: `h1.l0.R()` and the `h1.n.a` empty-slot
check must precede it, and an existing requester must be reused. Focus, list state
and focus effects each have a balanced, separate composition group. While moving, `g0.f0.k`
requests the focused item's new scroll position on the next measure. No native
list state, focus requester or composer is retained in static fields.

The native preview-key modifier `p2.d.e` supplies `p2.b.a:KeyEvent`. Normal arrows
remain native; held OK starts a draft after the platform long-press timeout,
Up/Down changes the draft, OK confirms, and Back cancels. The release that ends
the initial hold cannot accidentally confirm. Cancelled keys, repeated arrows and
remotes reporting only a held key release are covered by runtime checks.
The 2026-10-22 Mi Box crash (`g0.g0 cannot be cast to u1.b` in `g0.j0.b`)
identified the missing focus remember guard. The runtime fixture now models slot
reads/writes, typed list initializer/saveable slots and composition groups. It
checks repeated recomposition, stable requester identity and balanced groups after
list-state failure, alongside long-press movement. The previous fixture returned
fresh objects and could not expose this corruption.
Native icon factories and vector/path constructors
are validated against the original DEX. Caption/list/aspect glyphs reuse initialized
native vectors, with matching-symbol vectors when Settings precedes playback;
no player painter, callback or composer is cached. IntroDB supplies its own stage-0
filmstrip vector independently of whether submissions are enabled.

The Mi Box gen1/gen2 logs from 2026-10-21 showed `NoSuchMethodError` for
`java.util.Optional.orElseThrow()` in `ButtonsUi.picker`, preventing the editor
from opening. The constructor lookup now uses an explicit loop, retaining missing
and ambiguous constructor rejection without that platform API dependency. Host
runtime checks alone did not catch this because they run on Java 21. The rebuilt
APK verifier now rejects that unsupported invocation in playback extension DEX,
including generated helper classes. Retest opening and using the editor on both
Mi Boxes after rebuilding with the fixed bundle.

Run through `build-local.ps1` with Java 21 and Android SDK platform 36:

```powershell
.\build-local.ps1 :patches:buildAndroid :patches:generatePatchesList
.\build-local.ps1 :patches:verifyNuvioPlaybackButtons :patches:verifyNuvioPlaybackButtonsRuntime
.\build-local.ps1 :patches:verifyNuvioBeta7SettingsMenuRuntime :patches:verifyNuvioBeta7Bundle
.\build-local.ps1 :patches:verifyNuvioPlaybackApk
```

The native verifier uses the original APK, rejects invalid inputs, and writes/reloads
modified DEX. Runtime checks compile the production extension against native-signature
fixtures and exercise real settings callbacks, saved preferences/reload/reset,
disabled behavior, movement between groups, visibility, conditional availability,
focus destinations, balanced composer groups and failure cleanup. Shared-menu checks
cover standalone and combined selections. Bundle verification applies playback buttons
alone and with all other runtime patches, checks merged signatures, and compares
cross-DEX hierarchy findings with the original baseline.

Host verification does not establish device behavior. Check on Android TV: settings
focus and Back, each native playback action, subtitles/audio/next-episode availability,
progress-bar down-focus after hiding Play, More focus when Stream info is hidden,
moving every control to either group, reopen/restart persistence, live playback
updates, layout width, and combined-patch navigation. Installation/device testing
requires a separate user request.

## Local verification results — 2026-10-21

All build, metadata, original-DEX, host-runtime, 20 shared-menu selections and
standalone/combined packaged-bundle checks passed. Cross-DEX checks retained the
original 36 optional-library findings with no additions. The new patch was also
applied alone through Morphe Desktop CLI and the APK rebuilt successfully.

- Bundle: `patches/build/libs/patches-0.11.2.mpp`.
- Unsigned APK: `../Apps/NuvioTV/NuvioTV-1.1.0-beta.7-playback-buttons-unsigned.apk`.
- APK manifest: `com.nuvio.tv`, version `1.1.0-beta.7`, code `1070`.
- APK alignment passed `zipalign -c -P 16 4`; all 112 native libraries match the
  original byte-for-byte, and stale JAR signature entries are absent.
- The APK is unsigned. Signing, installation and Android TV testing were not performed.

On this host the build script ran with the process-local prefix
`powershell -NoProfile -ExecutionPolicy Bypass -File .\build-local.ps1`, followed
by the task arguments shown above. No system execution policy was changed.

The rebuild command was:

```powershell
java -Xmx3g -jar ../morphe-desktop-1.18.1-all.jar patch ../OriginalApps/NuvioTV-1.1.0-beta7.apk -p=patches/build/libs/patches-0.11.2.mpp "--enable=NuvioTV - Customize playback buttons" --exclusive --unsigned --out=../Apps/NuvioTV/NuvioTV-1.1.0-beta.7-playback-buttons-unsigned.apk --temporary-files-path=../.inspect-nuvio-beta7/rebuild-playback-buttons --result-file=../.inspect-nuvio-beta7/rebuild-playback-buttons-result.json
```

## IntroDB, sorting and icon verification — 2026-10-22

The `0.12.0` bundle builds successfully. Original-input, runtime, both patch orders,
shared-menu selections, standalone/combined bundle application and final rebuilt-APK
checks passed. The runtime checks cover continuous stable-key icon lists, long-press
pickup, draft movement, scrolling, confirm/cancel and repeat/key-release handling,
optional IntroDB presence, native fallback when customization is disabled, hiding
and regrouping IntroDB, preserved callbacks/focus and saved-layout reload.

Commands run through `powershell -NoProfile -ExecutionPolicy Bypass -File ./build-local.ps1`:

```powershell
:patches:buildAndroid :patches:verifyNuvioPlaybackButtons :patches:verifyNuvioPlaybackButtonsRuntime :patches:verifyNuvioIntroDb :patches:verifyNuvioIntroDbRuntime
:patches:verifyNuvioBeta7SettingsMenuRuntime :patches:verifyNuvioBeta7Bundle
:patches:verifyNuvioPlaybackApk '-PnuvioPlaybackApk=E:/Morphe/Apps/NuvioTV/NuvioTV-1.1.0-beta.7-playback-introdb-unsigned.apk'
```

The final bundle/runtime checks were rerun for the continuous scrolling editor.
After the Mi Box slot-corruption report, `:patches:buildAndroid`,
`:patches:verifyNuvioPlaybackButtons`, `:patches:verifyNuvioPlaybackButtonsRuntime`,
`:patches:verifyNuvioBeta7Bundle` and the combined-APK check below were rerun for
the guarded focus initializer. Host checks now preserve typed remembered slots
across repeated rendering and long-press moves instead of allocating fresh state
on every fixture invocation. The user subsequently reported that the corrected
editor works as intended on a device (2026-10-22); the report does not identify
which Mi Box generation was retested.
The final CLI rebuild enabled only **Customize playback buttons** and **Submit
segments to IntroDB**, using the original beta.7 APK and `patches-0.12.0.mpp`.

- Bundle: `patches/build/libs/patches-0.12.0.mpp`.
- Unsigned APK: `../Apps/NuvioTV/NuvioTV-1.1.0-beta.7-playback-introdb-unsigned.apk`.
- Manifest remains `com.nuvio.tv`, `1.1.0-beta.7`, code `1070`.
- All 16 customization hooks resolve; IntroDB precedes the final row flush.
- Cross-DEX results match the 36 original optional-library findings.
- `zipalign -c -P 16 4` passed; all 112 native libraries are unchanged and stale
  JAR signing entries are absent.

The agent did not sign, install or run the APK on a device. The user confirmed
successful behavior after the focus-slot fix. This is not a claim that every
control, both Mi Box generations or the IntroDB submission flow were retested.
Remaining device checks include both generations, restart persistence, every native
action, and IntroDB capture/review after moving its control into More.
