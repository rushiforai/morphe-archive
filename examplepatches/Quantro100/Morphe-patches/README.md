# AliExpress Patches

Morphe patches for [AliExpress](https://play.google.com/store/apps/details?id=com.alibaba.aliexpresshd).

## Usage

### Morphe Manager

Use the deep link to add this as a patch source in Morphe Manager:

```
https://morphe.software/add-source?github=Quantro100/Morphe-patches
```

Then patch AliExpress:

1. Tap AliExpress app icon in Morphe
2. Download original APKM file from ApkMirror
3. Wait for patching to complete, install

### Morphe CLI

```sh
java -jar cli.jar patch --patches aliexpress.mpp input.apkm
```

## Patches

| Patch | Description | Default |
|-------|-------------|---------|
| Remove ads | Removes sponsored products and ads from feed and search | Yes |
| Disable analytics | Blocks tracking and analytics | Yes |
| Disable forced updates | Removes forced update popup | Yes |
| Disable promotions notifications | Blocks promotional push notifications | Yes |
| Disable splash screen | Skips splash screen on launch | No |
| Remove sponsored items from search | Filters promoted products from search results | Yes |
| Remove coupons popup | Removes coupon/promotion dialogs | Yes |
| Remove affiliate tracking | Strips tracking params from shared links | Yes |
| Enable image saving | Allows saving product images to gallery | No |
| Bypass signature check | Bypasses SecurityGuard integrity checks to fix login on patched APKs | Yes |

## Building

To build the patches, follow the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation).

## License

GNU General Public License v3.0
