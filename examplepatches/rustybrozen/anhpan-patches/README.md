# Anhpan's Morphe Patches

Personal Morphe Patches for Zalo.

## About

I mainly built these patches for personal use, but feel free to add the source and use them if they fit your vibe. Right now, they mostly tweak the client-side UI: half because I have ADHD and want everything as minimal and clutter-free as possible, and half because I genuinely despise Zalo's app but am forced to use it for work.

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/rustybrozen/anhpan-patches

<a href="https://morphe.software/add-source?github=rustybrozen/anhpan-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## Patches list

<!-- PATCHES_START -->
> **[v1.3.0](https://github.com/rustybrozen/anhpan-patches/releases/tag/v1.3.0)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**6 patches** across **1 app**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**Zalo**](PATCHES.md#zalo-comzingzalo) | 6 | `26.11.01` | [`com.zing.zalo`](https://play.google.com/store/apps/details?id=com.zing.zalo) |
<!-- PATCHES_END -->

### Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## License

Anhpan's Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE)
