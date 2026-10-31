# Current stream indicator

Current target: **NuvioTV 1.1.0-beta.9 (1072)**. See [beta.9 contracts and verification](NuvioBeta9.md). Version-specific DEX notes, commands and artifacts for earlier versions below are historical; use the beta.9 contract and `verifyNuvioLatest` for the current release.


Select **NuvioTV - Indicate current stream** for `com.nuvio.tv`
`1.1.0-beta.9` (version code `1072`). When opening Sources during playback,
the current stream's title starts with **[Playing]**. The existing native
border, focus, source filters and selection callbacks remain in use.
Select the patch in Morphe, then control it under **Settings > Layout >
Santodan-Patches > Streams > Indicate current stream**. This toggle is enabled
by default and remembers changes for this installation. Turning it off removes
the title label. The patch itself remains independently selectable in Morphe.

The indicator follows Nuvio's current-session source identity. The native picker
compares torrent info hash/file index and addon, then addon/URL, then URL.
It does not identify a stream by its display name or by keyboard focus.
If the native picker cannot match the current source in the displayed list,
no row receives the label. Selecting another source updates the indicator
through native player state; the extension retains only the display preference,
never a stream identity or playback session.

## Original input and hook evidence

Input: `../OriginalApps/NuvioTV-1.1.0-beta7.apk`, SHA-256
`a35eb5033615018f50f5205dc51f52e526b3b606f7e563943201dfbd7366d1f2`.
The manifest confirms package, version name and version code. Extracted original
DEX inspection is under `../.inspect-nuvio-beta7/` (`current-source-picker.txt`,
`current-source-item.txt`, `current-stream-card.txt`, `current-episode-item.txt`).

- Static `Lva/lh;->a(Lva/re;Lc2/a0;Function0;Function0;Function1;Function1;Function0;Lx1/q;Lh1/o;I)V`
  owns the source overlay. State `k` is the info hash, `l` the file index,
  `m` the addon, `j` the stream URL. Its matched index reaches `Lva/kh;->l:I`.
- Instance `Lva/kh;->invoke(Object,Object,Object,Object)Object` compares the
  displayed row index with `l` at original instruction 65. It sends the result
  as the fourth argument of static `Lva/z;->q(Stream,Lc2/a0;,Z,Z,Z,Z,Ll9/y;,Function0,Function1,Function0,Lh1/o;,I,I)V`.
- `q` has 39 registers, effective current-source flag `v8`, and remembered
  title `v7`. Original instruction 141 is `check-cast v7, String`. At index 142,
  the patch inserts a static call to
  `NuvioCurrentStream.label(String,boolean):String` with `v7/v8`, followed by
  `move-result-object v7`. The helper labels only the current source while the
  stored setting is enabled (default true).
  No parameter/register counts change; invoke and move-result stay adjacent.
  No try region covers this hook.
- Decoration runs after title memoization, so changing the current flag updates
  the label even when the same Stream object is retained. The existing border
  uses the same flag at original instruction 322. Native `Lva/zg;` receives
  the resulting title in its constructor and renders it with native Text.
- All DEX files contain only three callers of `q`: the source row `Lva/kh;`,
  its recomposition wrapper `Lna/k;`, and episode-source row `Lva/w0;`.
  The episode-source row supplies false/default for the current-source flag.
  The complete original `q` fingerprint includes registers, references,
  literals, branch offsets and switch data. Missing, ambiguous, changed and
  already-patched methods are rejected before mutation.
- The `nuvio-current-stream` extension depends on the shared settings-menu patch.
  It renders the validated native `Lab/uh;->m` 13-argument switch and uses
  the existing `Lh1/h;->s(Object)Lh1/t1;` state factory. Its bridge is discovered
  under Streams only when this patch is included. Preference reads retry after
  application startup failures, and callbacks save changes and invalidate the
  menu's native Compose state. Focus callbacks do not toggle the setting.

## Verification

For logcat, add `"SantodanCurrentStream:V"` to the existing filter list.
The extension logs preference-read errors under this tag. Successful toggles
and source labels do not emit messages. Shared menu failures use `SantodanSettings`.

```powershell
.\build-local.ps1 :patches:buildAndroid :patches:generatePatchesList
.\build-local.ps1 :patches:verifyNuvioCurrentStream :patches:verifyNuvioBeta7Bundle
.\build-local.ps1 :patches:verifyNuvioCurrentStreamRuntime :patches:verifyNuvioBeta7SettingsMenuRuntime
```

The focused verifier uses every original DEX, exercises invalid/duplicate hook
rejection, writes and reloads the changed class, checks the conditional title
mutation and restores the inserted block to verify the exact original method.
The bundle verifier applies this patch alone and together with all other Nuvio
behavior patches, checks the assembled label call and compares cross-DEX
hierarchy findings with the original APK.
The runtime verifier executes production callbacks against native-signature host
fixtures, checking the enabled default, both toggle directions, persistence,
disabled output, source changes, focus callbacks and startup failure recovery.
Shared-menu checks include standalone and combined current-stream selections.

Device checks: open Sources during movie and episode playback, move focus to
another row, switch streams and reopen, change addon filters, and start a new
playback session. Confirm exactly the current matching row is labelled and
that the episode-source picker for another episode has no label. Host checks
do not establish Android TV rendering or device playback behavior. Also check
the default-on switch, turn it off/on, and restart the app to confirm persistence.

Bundle: `patches/build/libs/patches-0.11.2.mpp`.
Validation on 2026-10-21 passed all six tasks above: build, metadata generation,
original-DEX roundtrip/rejection checks, production runtime settings/persistence,
shared-menu selections, and standalone/combined packaged bundles. All twelve
Nuvio behavior patches coexist. Cross-DEX verification reports the same 36
optional-library findings as the original APK, with no new findings.
No complete APK was rebuilt, signed, installed or tested on a device.
