# Trakt Patches

Morphe patches for [Trakt.tv](https://trakt.tv) (tv.trakt.trakt).

## Patches

| Name | Description |
|------|-------------|
| Hide VIP banner | Removes the Upgrade to VIP upsell banner from the home screen. |

## Usage

### Morphe CLI

```
java -jar cli.jar patch --patches trakt-patches.mpp input.apk
```

### Morphe Manager

[Add patches to Morphe](https://morphe.software/add-source?github=PixelPusher247/morphe-patches)

The patches should work with any 3.x version of the app, latest tested and confirmed is 3.7.0.

Or manually select the .mpp file from the [Releases](../../releases/latest) page.

## Building

```
./gradlew :patches:buildAndroid
```

The compiled patch file will be at patches/build/libs/.

## License

[GNU General Public License v3.0](LICENSE)
