# Urro's Morphe patches
A curated third-party patch source compatible with [Morphe](https://morphe.software/).
<br>This repository is independent of the official Morphe project.

<p align="center">
  <a href="https://morphe.software/add-source?github=urroxyz/morphe-patches">
    <img src="open_in_morphe.svg" height="50" alt="Open in Morphe">
  </a>
</p>

Please open a pull request whenever. I'll accept it.

## ToC
<table>
<tr>
<td width="176" align="center" valign="top">
<a href="#amazon-incl-india"><img src="https://cdn-1.webcatalog.io/catalog/amazon-fr/amazon-fr-icon.png" width="52" height="52" alt="Amazon icon"></a>
<br>
<strong>
  <a href="#amazon-incl-india">Amazon</a>
  <br><a href="#amazon-incl-india">Shopping</a> / <a href="#amazon-incl-india">India</a></strong>
<br>
<sub>
<a href="#dark-mode-simple--safe">Dark mode</a>
</sub>
</td>
<td width="176" align="center" valign="top">
<a href="#transit-pvta"><img src="https://img.netzwelt.de/picture/original/2023/11/transit-icon-388754.png" width="52" height="52" alt="Transit icon"></a>
<br>
<strong>
  PVTA <a href="#transit-pvta">Transit</a>
</strong>
<br>
<sub>
<a href="#personal-maps-api-key">Maps API key</a>
<br><a href="#bike-mode">Bike mode</a>
<br><a href="#physical-activity-spoof-transmitter">Activity spoof</a>
</sub>
</td>
<td width="176" align="center" valign="top">
<a href="#niagara-launcher"><img src="https://d33v4339jhl8k0.cloudfront.net/docs/assets/5e884e2004286364bc97d1f8/images/63d37f7a0c84eb3266332a8a/file-TmFAHMbAEK.png" width="52" height="52" alt="Niagara Launcher icon"></a>
<br>
<strong><a href="#niagara-launcher">Niagara Launcher</a></strong>
<br>
<sub>
<a href="#custom-weather-sources">Weather sources</a>
</sub>
</td>
<td width="176" align="center" valign="top">
<a href="#gboard"><img src="https://www.apkmirror.com/wp-content/themes/APKMirror/ap_resize/ap_resize.php?src=https%3A%2F%2Fdownloadr2.apkmirror.com%2Fwp-content%2Fuploads%2F2018%2F07%2F5b563e71c5fa9.png" width="52" height="52" alt="Universal globe icon"></a>
<br>
<strong><a href="#gboard">Gboard</a></strong>
<br>
<sub>
<a href="#clipcascade-sync">ClipCascade sync</a>
<br><a href="#better-translate-ux">Better translate UX</a>
</sub>
</td>
<td width="176" align="center" valign="top">
<a href="#universal"><img src="https://cdn-icons-png.flaticon.com/512/17486/17486444.png" width="52" height="52" alt="Universal globe icon"></a>
<br>
<strong><a href="#universal">UNIVERSAL</a></strong>
<br>
<sub>
<a href="#physical-activity-spoof-receiver">Activity spoof</a>
</sub>
</td>
</tr>
</table>

## My patches

### Amazon (incl. India)
#### Dark mode (simple & safe)

<details>
<summary>info</summary>

Support:
- Amazon Shopping 32.13.2.100
- Amazon India 32.15.0.300

Options:
- Off
- Auto / System
- Dark

</details>

### Transit (PVTA)
#### Personal Maps API key

<details>
<summary>info</summary>

This is a Morphe-compatibility patch.

It only exists because when you modify the PVTA Transit app, it breaks the map rendering. However, the Google Maps API is free if you're using it in the Android SDK. So if you create your own key on Google Cloud and use this patch, it'll route the map rendering through it, and fix that issue.

You don't have to use MY patches specifically to enjoy this fix. If you've patched Transit for any other reason, this'll fix the map rendering.

Tested support:
- ARM64 6.3.5 (5127740)

</details>

#### Bike mode

<details>
<summary>info</summary>

I always forget to take my damn bike with me when I get off the bus, especially in the early morning or late at night when I just wanna get home.

When `Bike mode` is enabled, it just changes the wording in the app and notifications to include reminders to take your bike with you when getting off at your stop.

Tested support:
- ARM64 6.3.5 (5127740)

</details>

#### Physical Activity spoof \[TRANSMITTER\]
*TL;DR - tell other apps you're on the bus.
<br>good use case: enabling motion sickness prevention apps*

<details>
<summary>info</summary>

This patch will not really do anything unless you have `Physical Activity spoof [RECEIVER]` installed in another app.

The idea is that when the Transit app detects you are on a bus, such as when using their "GO" mode, it can send a synthetic `IN_VEHICLE` status to another app that reads Android's Physical Activity service.

**Why might this be useful?** Well, there are a few reasons why.
<br>But the main reason I use it is to force-enable motion sickness prevention apps.

Apps like KineStop (which is the one I use) read from Android's Physical Activity service to know when you are in a moving vehicle. Unfortunately, it's not always super accurate and it can sometimes take a while to even make its guess.

So, if you have the **TRANSMITTER** patch for Transit, and the **RECEIVER** patch for an app like KineStop, it will automatically tell that receiving app you are in a moving vehicle when the Transit app thinks you are. In this case, KineStop will take that chance to enable its motion sickness prevention 'cues', which are little dots on the screen that move with the environment in an attempt to curb *kinetosis* (motion sickness).

You can use this patch to transmit to any app that reads from Android's Physical Activity service, so long as the receiving app is patched as a **RECEIVER**. That RECEIVER patch is Universal. It can be used on any app.

Tested support:
- ARM64 6.3.5 (5127740)

</details>

### Niagara launcher
#### Custom weather sources

<details>
<summary>info</summary>

This is another Morphe-compatibility patch.

Modified versions of Niagara (and even sometimes the official builds) fail to fetch weather data from the API. So this allows you to receive from custom sources. Two are preinstalled so there is no setup if you're just using it to fix the weather and nothing else.

Configurable weather providers, priority, aggregation/averaging, and custom JSON mappings.

Tested support:
- ARM64 1.16.31 build (2147483647)

</details>

### Gboard

[ClipCascade sync](#clipcascade-sync) · [Better translate UX](#better-translate-ux)

#### ClipCascade sync
*TL;DR - keep your other devices' clipboard contents in Gboard.*

<details>
<summary>info</summary>

This adds ClipCascade to Gboard's own clipboard panel. Local clips go under `This device`, and incoming clips go under `Other devices`. `Other devices` comes immediately after `This device`; every other section keeps its normal relative order. You can rename both sections in Gboard Settings → Clipboard → ClipCascade.

Stock ClipCascade clients don't reliably say which device sent something, so remote clips are pooled together. This doesn't require changes to your other clients. Both server-relayed (P2S) and peer-to-peer (P2P) transports are included.

Text and supported images can appear in the clipboard history. Unsupported image formats fall back to Downloads. What another device does with an image still depends on its ClipCascade client; this patch can't change that client's keyboard.

Long-press a clip and choose `Send` to broadcast it to your connected clients. The confirmation is on by default, and you can turn it off in Clipboard settings. There's no recipient picker, and copying something locally doesn't automatically broadcast it.

When patching, fill in the server URL, username and password in Morphe Manager. Encryption, salt and key-derivation settings need to match your other clients. Credentials are embedded in your patched APK, so don't share that APK. The public patch bundle doesn't contain your credentials.

On Android 17 and newer, use `Allow local network access` in the ClipCascade section to grant the native permission for nearby P2P connections. Internet access alone isn't enough for that.

You can hide the remote section without disconnecting, or turn the connection off altogether. Section names and the other in-app options survive normal restarts and same-package, same-signer updates.

Tested support:
- ARM64 18.0.3.954559732-release-arm64-v8a
- ARM64 18.5.4.993608717-release-arm64-v8a
- Source patching alongside community Clipboard Enhancements, Clipboard Custom Character Limit, Settings Homepage Override and Package Rename
- Pixel clipboard panel and settings controls
- Encrypted P2P text and PNG receipt on the Pixel through a remote ClipCascade server

Protocol and encryption checks cover text, images, P2S and P2P. A complete stock desktop-client interoperability test hasn't been established yet; treat this integration as experimental.

</details>

#### Better translate UX
*TL;DR - change translation languages by typing their codes.*

<details>
<summary>info</summary>

In Gboard's Translate input, type a language code followed by a space. `es ` changes the target to Spanish; `en-es ` sets English → Spanish. The shortcut disappears so you can start typing what you want translated.

ISO aliases and regional codes work too, including `eng-spa`, `enUS-ptBR` and `en-US-pt-BR`, when the corresponding languages are available in Gboard. Whitespace isn't restricted to an ordinary ASCII space. Parsing is restricted to the beginning of the input.

Gboard Settings → Translate → Translation shortcuts has one toggle: `Simplify input field`. It replaces the language buttons with a small code field beside the translation input. The current pair is prefilled and selected. Auto → English is shown as `en`, rather than `auto-en`.

The two inputs share a style, with rounded outer corners and square inner corners. The code field accepts letters, numbers and hyphens. Space confirms the code and moves input to the translation field. Only the active field should show the cursor and focus outline. Simplified mode also removes the extra back-arrow row.

This is optional. Leave the toggle off to keep Gboard's usual language controls and use the shortcuts in its ordinary translation input.

Tested support:
- ARM64 18.0.3.954559732-release-arm64-v8a
- ARM64 18.5.4.993608717-release-arm64-v8a
- Pixel field switching, selected-code Backspace, language confirmation and repeated reopening

</details>

The hooks resolve Gboard's obfuscated classes and key methods from its own diagnostic markers and API shapes, rather than assuming one release's short class names or resource IDs. I've tested the versions listed above. A native UI redesign can still need a patch update; ambiguous matches stop patching with an error instead of guessing.

### UNIVERSAL

#### Physical Activity spoof \[RECEIVER\]

*TL;DR - let this app receive the activity you're transmitting.*
<br>good use case: enabling motion sickness prevention apps

<details>
<summary>info</summary>

This is the other half of Physical Activity spoof [TRANSMITTER]. Patch Transit with the TRANSMITTER, and patch whichever apps you want to receive with this one. Multiple receiving apps can listen at the same time.

Both apps need to be signed with the same key. Patching both through the same Morphe Manager installation takes care of that. The receiving app still needs its normal Physical Activity permission and its activity-detection feature enabled.

When Transit confirms you're aboard a vehicle, receiving apps get IN_VEHICLE. When Transit withdraws it, they get the matching exit and return to genuine activity readings. This doesn't change Android's activity classifier globally.

Universal means no app-specific hooks. Supports Google's sampling and transition APIs, including legacy sampling. Apps using their own sensor classifiers, native detection, or SDK boundaries removed by optimization aren't covered. The patch stops with an explanation if it can't find a supported subscription/result boundary.

Tested support:
- Two independent demo apps, including a minified build with the supported SDK boundaries retained
- Transit onboard transmission and withdrawal on the Pixel
- KineStop 5.6: vehicle ENTER starts cues; alighting clears them on the Pixel

A receiver decides how to react to activity events. This patch doesn't control or track ownership of an app's manually started features.

</details>

## Add to Morphe Manager

Add GitHub source **`urroxyz/morphe-patches`** in Morphe manager, or click
[this link](https://morphe.software/add-source?github=urroxyz/morphe-patches).

## Build and test

Use JDK 21+, Android SDK and the standard Morphe patches Gradle plugin. Supply GitHub Packages credentials through `GITHUB_ACTOR` / `GITHUB_TOKEN` or local Gradle credentials; never commit them.

```sh
python3 tests/niagara-weather/run_tests.py
sh tests/transit-core/test.sh
./gradlew clean :patches:generatePatchesList :patches:buildAndroid
python3 tools/release_metadata.py
```

The catalog generator reads the exact versioned bundle. `buildAndroid` must run last so the published bundle includes Android DEX. Optional fixture validators `:patches:validateComfortFix` and `:patches:validateTransit` accept private local APK paths; their outputs must never be committed or published. Run `buildAndroid` again afterward before releasing.

Source follows the standard `patches/` and `extensions/extension/` Morphe template layout. Tests live in `tests/`. See [NOTICE](NOTICE) and [LICENSE](LICENSE) for upstream attribution and license restrictions.
