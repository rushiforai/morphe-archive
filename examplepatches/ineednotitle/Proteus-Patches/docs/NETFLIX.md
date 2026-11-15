# Netflix (Android TV)

Ad-removal and clone patches for Netflix's living-room app, ported to Proteus
from [ajstrick81/morphe-androidtv-patches](https://github.com/ajstrick81/morphe-androidtv-patches)
(GPL-3.0).

The same APK and the same patches apply in **India** — Netflix India is served
from the global `com.netflix.ninja` Android TV package, so there is no separate
India build and no India-specific patch option. Your region only changes
catalogue and ad fill, not the app or the ad pipeline.

## Supported app

| | |
| :--- | :--- |
| App | Netflix (Android TV), package `com.netflix.ninja` |
| Recommended version | `13.0.1 build 25028` (versionCode 25028, `armeabi-v7a`) |
| Experimental targets | `13.2.1 build 27207`, `13.2.2 build 27250` |
| Input file | `.apkm` (base + `armeabi-v7a` split) |

Download the Android TV bundle from APKMirror:
<https://www.apkmirror.com/apk/netflix-inc/netflix-android-tv/netflix-android-tv-13-0-1-build-25028-release/>

> Use the **Android TV** build, not the phone/Fire TV build. Don't pick a newer
> `13.1.x`/`13.3.x` release unless it is listed above — the fingerprints target
> the versions shown in Morphe Manager.

## Patches

| Patch | Default | What it does |
| :--- | :---: | :--- |
| **Clone Netflix** | On | Installs the patched app as `com.netflix.ninja.clone` beside stock Netflix. Required on TVs/Fire TV, where Netflix is a preinstalled system app that cannot be replaced. |
| **Disable Netflix CertCheck** | On | Neutralises DexGuard's signing-certificate anti-tamper so the re-signed build does not crash on launch. Required by every other Netflix patch. |
| **Remove Netflix ads (bundle engine)** | On | Bundles the in-process ad-kill engine (`killads.js`) and its loader into the app. This is the actual ad remover. |
| **Remove Netflix ads (loader)** | On | Loads the bundled engine at startup, before playback schedules any break. |
| **Minimize Network Fingerprint** | Off | Blanks the local IP/MAC/SSID and advertising ID the app reports. Privacy only — it does **not** change the server-side household check. |
| **Suppress Household Prompt** | Off | Stops the client from activating the "you're traveling" misdetection prompt. Server-side detection is unchanged; a VPN is the real fix. |

## Install

1. Download the `.apkm` above.
2. In Morphe Manager, turn **Optimize for device architecture OFF**. It is an
   Expert-mode option; when on, it can throw away the `armeabi-v7a` split that
   this TV app (and this patch) needs.
3. Select the `.apkm` and apply the patches. Leave the four defaults on.
4. Install the result **without uninstalling stock Netflix**.
5. Open the new **Netflix clone** icon (`com.netflix.ninja.clone`) and sign in.

> **Keep stock Netflix installed and enabled.** The clone reads the stock app's
> genuine signature to pass Netflix's native tamper check. Stock may auto-update;
> the clone keys off the signature, not the version. Just launch the clone.

## How it works

Netflix's player and all ad-break logic are **downloaded JavaScript**, not code
in the APK. Ads are same-host SSAI served from Open Connect, so there is no ad
domain to block and no ad-free tier to unlock — DNS filtering does nothing here.

The patch bundles a Frida gadget into the clone in **script mode**. At launch the
gadget runs `killads.js` inside Netflix's own process and, before playback,
rewrites the runtime ad-break builder so it returns the same empty-break shape
Netflix's servers already return when they have no ad to fill. The client then
runs its own no-ad path (`emptyAdBreakComplete`), with no structural lie and no
playback error. A separate hook blanks the pause-screen ad opportunity.

Nothing is modified at rest: the signed appboot bundle and the MSL-encrypted
manifest are untouched. The edit happens only in the live JS heap, downstream of
the signature check and the decryption.

## Honest limits

- **Not a subscription or DRM bypass.** You need a valid paid Netflix account and
  you sign in normally. This removes ads inside an app you are entitled to use.
- **Ad logic can drift.** Netflix re-minifies its downloaded JavaScript
  server-side without an app update, so an ad can reappear until the script's
  anchors are updated. The script carries rename-tolerant fallbacks and covers
  both dynamic server-side insertion and the legacy manifest model.
- **`armeabi-v7a` only.** These patches target the 32-bit TV bundle. A 64-bit /
  all-ABI input is not covered yet.
- **Live/household controls are client-side only.** The household check is
  public-IP driven; the opt-in patch hides the prompt but cannot change what the
  server sees.
- **On-device verification is community-driven** for the port. Upstream verified
  the ad strip on a retail Onn 4K (Google TV); please report what your box does.

## Credits and licence

- Patch set, `killads.js`, clone/certcheck logic and the system-design write-up:
  [ajstrick81/morphe-androidtv-patches](https://github.com/ajstrick81/morphe-androidtv-patches),
  GPL-3.0. Ported here with attribution; see that repository's `NOTICE` and
  `docs/NETFLIX_ATV_SYSTEM_DESIGN.md`.
- `libgadget.so` is [Frida](https://frida.re/) gadget, distributed under the
  wxWindows Library Licence.
- Household-prompt seam originally identified with reference to
  [Nikflix](https://github.com/YidirK/Nikflix) (GPL-3.0). The implementation here
  shares no code with it.
- Proteus changes: package/namespace adaptation, Proteus compatibility metadata,
  native-library guard and documentation. Licensed GPL-3.0-only, like the rest of
  this repository.
