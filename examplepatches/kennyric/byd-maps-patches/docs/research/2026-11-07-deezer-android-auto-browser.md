# Deezer Android Auto browser: Home, Library and Up next

## What the app advertises

Deezer 9.0.26.3 has one exported `DeezerMediaBrowserService` with the standard
`android.media.browse.MediaBrowserService` action and
`automotive_app_desc.xml` declaring `media`. The built-in car tree is
`menu_auto` (decompiled from `lIlIIIlIllIlII`, case 8):

| Node | Contents |
| --- | --- |
| `home_parent` | `/channels/automotive/auto-home` dynamic Home |
| `recently_played_parent` | recently played |
| `explore_parent` | `/channels/automotive/auto-explore` |
| `favorites_parent` | **Library**: tracks, playlists, albums, artists, podcasts |

So Home and Library are part of the browser tree; they are not missing.

## Why a custom host still got no root

The tree is selected by client package. The original app only recognises:

- `com.waze` -> `__WAZE_ROOT__`
- `com.google.android.autosimulator` -> `__SIMULATOR_AUTO_ROOT__`
- `com.example.android.mediacontroller` -> `__MEDIA_CONTROLLER_ROOT__`
- `com.google.android.projection.gearhead` -> `__AUTO_ROOT__`

The previous patch bypassed the final signature verdict but left the package
lookup intact. A host such as DriveDeck therefore failed earlier:

```
MediaBrowserService: No root for client app.johninnl.drivedeck.dev
MediaBrowser: onConnectFailed for ComponentInfo{deezer.android.app/...DeezerMediaBrowserService}
```

## Fix: use the built-in Android Auto tree for every host

`CarHostPatch.kt` now:

1. finds the adventure root-build block after `if-eqz v7, :cond_1e`;
2. sets the request package to `com.google.android.projection.gearhead`, the
   `__AUTO_ROOT__` entry, before the request is built;
3. initialises the root-build loop registers and clears `p0` (the compiler's
   null root value);
4. branches directly to the root build, skipping the package/UID/signature
   validation.

The source patch keeps the original-signer preflight. The verification APK was
built from the already-merged 2-arch patched APK because the original 2-arch
APKM is no longer on disk; that build omits only the signer preflight.

## Runtime result (DriveDeck, non-allowlisted host)

The car preview rendered Deezer with:

- tabs **Home**, **Recents**, **Library**, **Explore**;
- Home content `Flow`, `Happy`, `View all`, `Discover`, `MELODIC TECHNO`,
  `DEEP ELECTRO`;
- the player showing **Harder, Better, Faster, Stronger / Daft Punk / Discovery**
  with a live progress bar;
- an **Up next** tab.

The session in the same run reported `queueTitle=null, size=31`, and skipping
advanced `active item id` from 0 to 1 with the metadata changing. The next-up
queue is therefore populated, not empty.

Evidence (`.tools/artifacts/deezer-aa-20261107/`):

- `aa-home-library.png` — Home, Recents, Library, Explore
- `aa-now-playing.png` — current track and Up next tab
- `aa-upnext-tab.png` — player view with the Up next tab
- `aa-browser-check.txt` — tree, host packages, queue output

## APK

`/Users/jneerdael/Downloads/deezer-9.0.26.3-patched-aa-final.apk`
SHA-256 `a9ace09446f72164c7df988cdcecb5dc501a99b3ee89553b5138572a6031d3bd`.

`/Users/jneerdael/Downloads/deezer-9.0.26.3-patched-aa-report.json` records the
verification-build provenance and the missing original APKM.
