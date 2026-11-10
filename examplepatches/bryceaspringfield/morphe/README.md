# Morphe patches by bryceaspringfield

One patch bundle for [Morphe](https://morphe.software), with patches for two apps. It adds to the official Morphe
Patches: select it together with Morphe Patches when patching.

[Add this source to Morphe](https://morphe.software/add-source?github=bryceaspringfield/morphe), or add it by URL in
Morphe's Sources:

```text
https://github.com/bryceaspringfield/morphe
```

| App | Patches | Supported versions | Details |
|---|---|---|---|
| Reddit | Hide keyword content, Navigation and sidebar, Media options, Morphe branding, Say subreddits, and Fix search media taps (Reddit Keyword Filter) | 2026.10.0, 2026.24.0, and 2026.40.0, with 2026.43.0, 2026.44.0, and 2026.45.0 experimental | [reddit/](reddit/) |
| YouTube | YouTube Extras | 20.26.46, 20.51.39, 21.23.492, 21.28.208, 21.30.216, 21.43.523, 21.44.528, and 21.45.82, the versions Morphe Patches supports (21.45.82 needs its pre-release, v2.2.0-dev.3 or later) | [youtube/](youtube/) |

`patches-bundle.json` names the newest release, tagged `v<version>` on this repository's Releases page. The earlier
addresses `https://github.com/bryceaspringfield/morphe/reddit` and `https://github.com/bryceaspringfield/morphe/youtube` name the same bundle; replace both with the one address above, since
two sources naming one bundle list every patch twice.

## Build

`./gradlew :patches:buildAndroid` writes the bundle to `patches/build/libs/`. The patches are in `patches/`, and each
app's extension (the code the patches add to the app) in `extensions/reddit/` and `extensions/youtube/`.
