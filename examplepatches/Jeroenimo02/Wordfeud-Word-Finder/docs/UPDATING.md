# Supporting a new Wordfeud version

Wordfeud is a Flutter app. The patch relies on two kinds of things in the app:

1. **Java methods the patches inject code into.** If such a method is gone (renamed or different parameters),
   **patching fails** in Morphe.
2. **Contracts on the Dart side**: routes, platform messages, the API and the look of the game screen. If one of
   these changes, **patching still works** but a feature stops working. The error code and "Copy details" in the
   overlay usually point to the place.

## Step 1: check (2 minutes)

1. Download the new version as XAPK from APKPure (the same source users use).
2. Run the check script (only Python 3 needed):

   ```sh
   python3 tools/check-apk/check_apk.py Wordfeud_5.9.0_APKPure.xapk
   ```

   It prints the version and `OK` or `MISSING` for every dependency, with the part of the patch that uses it.

3. **All OK?** Go to step 2. **Something MISSING?** See step 3.

## Step 2: add the version and test

1. Add the version in `patches/src/main/kotlin/app/wordfeudwordfinder/patches/shared/Constants.kt`
   (`AppTarget(version = "5.9.0")`). Without it, users can only patch the version as "experimental".
2. Update the "Compatibility" table at the end of this guide.
3. Create a branch, open a pull request to `dev`, wait for green CI and install the dev release with Morphe Manager.
4. Test on a device (list below). If everything works: pull request `dev` → `main`.

**Device test list**

| Test | What you see when it fails | Where to look |
|---|---|---|
| The book button appears on the game screen, not in chat or move history | Button missing, or shown everywhere | Route (`hooks/PlatformMessages`), colours (`ui/ScreenShade`) |
| The button is cut off under the "⋮" menu, light and dark theme | Button floats over menus | `ui/ScreenShade` (scrim, page colours) |
| The overlay opens with moves and a preview board in the right colours | GS-DATA or GS-EVENT-… | `game/GameReplay`, `game/ResponseParser` |
| Playing with the Play button, the board refreshes afterwards | MV-… error, board does not refresh | `play/MoveRequest`, `play/Refresher` |
| A word the server rejects: message in the overlay, pull request "Word list …" on GitHub | No message | `play/MoveSubmitter`, report worker |
| A game in another language opens without an error | WL-… error | `words/WordListManager` |
| Remove ads: the app starts, no banner, no full-screen ad after a game, no consent popup on a fresh install | Crash at start, or ads or the popup appear | `ads/AdBlock` (`BLOCKED`), the AdApi lines of the check script |
| Remove ads: with the app closed, a push notification arrives when the opponent plays | No notification | `patches/.../ads/AdManifestPatch.kt` (it must never touch `NOTIFICATION_COMPONENTS`) |

## Step 3: when the check script reports MISSING

### A Java hook is missing (patching fails)

| Hook | Where it comes from | Where to change |
|---|---|---|
| `MainActivity.onCreate` | Wordfeud's own activity (listed in `AndroidManifest.xml`) | `patches/.../ui/OverlayPatch.kt` |
| `FlutterJNI.handlePlatformMessage` and `dispatchPlatformMessage` | The Flutter engine (changes only with a major Flutter update) | `patches/.../platform/PlatformTapPatch.kt`, `patches/.../ads/RemoveAdsPatch.kt`, `extension/.../play/JniDispatch.java` |
| `FlutterJNI.invokePlatformMessageResponseCallback` and `cleanupMessageData` | The Flutter engine | `extension/.../ads/AdBlock.java` (reflection; when missing, ads come back but nothing breaks) |
| `CronetEngine$Builder.setUserAgent`, `UrlResponseInfo.getUrl` | Chromium Cronet (stable public API) | `patches/.../platform/UserAgentPatch.kt`, `extension/.../hooks/NetworkTap.java` |
| `UrlRequestCallbackProxy.on…` | The `cronet_http` Flutter plugin (open source) | `patches/.../network/Fingerprints.kt` |

To find the new name:

1. Open the base APK (inside the XAPK: `com.hbwares.wordfeud.free.apk`) in [jadx](https://github.com/skylot/jadx)
   (free, graphical) and search for the old class or method name.
2. If the class was renamed or obfuscated, search for something that does not change: a string inside it, the
   parameters, or the place where the method is called. The `cronet_http` plugin and the Flutter engine are open
   source, so comparing with their source helps.
3. Update the `Fingerprint` in the Kotlin file, and the `HOOKS` list in `tools/check-apk/check_apk.py`.
4. If the parameter list changed, check the registers in the injected instruction (`p0` = `this`, `p1` = first
   parameter, …). The comment above each injection explains which registers it uses.

### A Dart string is missing (patching works, a feature does not)

Every line of the script names the extension class that uses the string. Look for its new form in the app:

```sh
unzip -p Wordfeud.xapk config.arm64_v8a.apk > /tmp/split.apk
unzip -p /tmp/split.apk lib/arm64-v8a/libapp.so | strings | grep -i "game/"
```

Then use "Copy details" in the overlay on a device: the `route=`, `store=` and `server=` lines show what the app
really sends, and the error code names the unknown field or event type.

## What the script cannot check

"Remove ads" also edits `AndroidManifest.xml` by component name (`ads/AdManifestPatch.kt`). Components a new version
no longer has are skipped; new ad SDK start-up components are not removed until they are added to its lists.

| Assumption | What happens when it changes | Fix |
|---|---|---|
| Game screen colours: page `#D0D5DB` / `#343B45`, cream rack tiles | The button disappears on the game screen, or shows on other pages | Measure the new colours on screenshots and update `ui/ScreenShade.java` and `ui/Theme.java` |
| Rack position: 10 dp below the button, tiles 40 dp below the button | Same | `ui/FabPlacement.java`, `ui/ScreenSampler.java` (`RACK_BELOW_DP`) |
| Fields of `game_log` events (strict check) | Error GS-DATA naming the unknown field | Add the field to the field sets in `game/GameReplay.java` |
| Event types (start, packed_move, swap, pass, resign, timeout) | GS-EVENT-&lt;type&gt; | Handle the new type in `game/GameReplay.java` |
| Theme from `statusBarIconBrightness` | Wrong colours in the overlay | `hooks/PlatformMessages.java` |
| Refresh after a move through `flutter/lifecycle` (`LifecycleBounce`) | The board refreshes only after about 20 s | `play/Refresher.java` (other strategies are ready, see `docs/DEV.md`) |
| Move format `[x,y,"L"]`, blank `"*L"`, digraph `"CH"` | MV-SERVER-protocol | `play/MoveRequest.java` |
| The blocked ad calls (`AdBlock.BLOCKED`) return nothing (void) | An error or a stuck screen right after an ad call | In jadx, search for the channel name (`dev.flutter.pigeon.wordfeud.AdApi.showInterstitial`, …): the handler of a void call replies with a list holding only `null`. Remove a call that returns a value from `BLOCKED` |

## Compatibility

| Wordfeud | Check script | Tested on a device | Notes |
|---|---|---|---|
| 5.7.1 | – | 2026-11-02 | First version |
| 5.8.0 | All OK (2026-11-06) | 2026-11-06 | No changes needed |
