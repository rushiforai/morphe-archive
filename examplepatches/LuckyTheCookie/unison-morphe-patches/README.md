# Unison Morphe patches

Patches for [Morphe](https://morphe.software) that let the [Unison](https://github.com/LuckyTheCookie/unison) Android app talk to **Deezer**.
Independent project, not affiliated with Morphe or Deezer. Nothing from Deezer is included in this repository.

## Unison bridge

Adds a small content provider to Deezer. Unison uses it to **add the playing track to one of your Deezer playlists**
(from a button in the player, or automatically for every track you listen to), with the session you are already signed in with.

| | |
|---|---|
| App | Deezer (`deezer.android.app`) |
| Tested version | **9.0.26.3** |
| Needs | Unison 1.2.0 or later |

### How it works
- The patch hooks the place where Deezer builds the `Authorization: Bearer …` header of its own API (`pipe.deezer.com`) and keeps the latest token **in memory, inside Deezer's process**. The token is never written to disk or sent anywhere else.
- A content provider (`content://deezer.android.app.unison.bridge`) exposes three calls: `info`, `playlists` and `addToPlaylist`.
- The provider **only answers the Unison app**: the caller's package name and signing certificate (SHA-256 `82913e13…cb1b`) are checked on every call. Any other app gets `forbidden`.
- Deezer must have made at least one API call since it started (open the app once) for a token to be available.

### Install
1. In Morphe Manager, add this source: [`morphe.software/add-source?github=LuckyTheCookie/unison-morphe-patches`](https://morphe.software/add-source?github=LuckyTheCookie/unison-morphe-patches) (or paste `https://github.com/LuckyTheCookie/unison-morphe-patches`).
2. Patch Deezer 9.0.26.3 with **Unison bridge**.
3. **Uninstall the official Deezer first**: the patched app has another signature, so Android will not install it over the original. Offline downloads are lost and you must sign in again.
4. Open Deezer once, then open Unison → Settings → Deezer.

### Things to know
- Modifying an app may go against Deezer's terms of use. Use it at your own risk, for personal use only.
- Updates from the Play Store are no longer possible. A new Deezer version needs a new patch run, and the patch may need adjusting (class names are obfuscated; the hook is found through string constants, which helps).
- The patch does not touch subscriptions, DRM or ads.

## Build
Needs JDK 21 and a GitHub token with `read:packages` (Morphe publishes its patcher on GitHub Packages):

```
GITHUB_ACTOR=<you> GITHUB_TOKEN=<token> ./gradlew :patches:buildAndroid
```

The bundle is written to `patches/build/libs/patches-<version>.mpp`. Use `buildAndroid`: Morphe Manager rejects a bundle without a compiled `classes.dex`.

## License
[GPLv3](LICENSE). See [NOTICE](NOTICE).
