# letterboxd-stremio-morphe-patch
Morphe patches for the Letterboxd Android app. Made using Claude.

- **Add Stremio button** — adds a purple Stremio button to film pages that opens the film in the Stremio app or web player.
- **Hide Video Store** — hides the "Rent from Letterboxd Video Store" banner on film pages and the carousel row on the home feed.
- **Hide Where to Watch** — hides the "Where to watch" streaming-service icon row on film pages.

All three are on by default and can be toggled independently.

## Installation

1. Open Morphe Manager.
2. Go to Patch Sources.
3. Add a new source using this repo's URL: `github.com/ethanm6/letterboxd-stremio-morphe-patch`
4. Refresh the source if it was already added before.
5. Patch the Letterboxd APK, selecting whichever of the three patches above you want enabled.

## Compatibility

Tested and confirmed working alongside De-Vanced's Letterboxd patches — both patch sources can be added to Morphe Manager and used together.

## Support

If you find this project useful, you can support development:

[![Support me on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/ethanm6)

## Disclaimer

This is an unofficial project, not affiliated with or endorsed by Letterboxd, Stremio, or Morphe. Modifying the app may violate Letterboxd's Terms of Service — use at your own risk.

## License

The original code in this project is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. See [LICENSE](LICENSE) for the full text.

Exception: `patches/src/main/kotlin/util/PatchListGenerator.kt` is taken verbatim from the official [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template) and remains under its upstream GPL-3.0 license.
