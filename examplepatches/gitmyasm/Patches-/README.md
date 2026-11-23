# Patches-

Morphe patch bundle. Built from [morphe-patches-template](https://github.com/MorpheApp/morphe-patches-template).

## Usage

Add this repository as a patch source in Morphe Manager:

```
https://github.com/gitmyasm/Patches-
```

Or tap this link to add it directly:

[https://morphe.software/add-source?github=gitmyasm/Patches-&name=Xmind%20Premium&app=net.xmind.doughnut](https://morphe.software/add-source?github=gitmyasm/Patches-&name=Xmind%20Premium&app=net.xmind.doughnut)

The published bundle is available from the [v1.0.3 release](https://github.com/gitmyasm/Patches-/releases/tag/v1.0.3).

## Development

```bash
./gradlew :patches:buildAndroid
```

Output: `patches/build/libs/patches-*.mpp`

Apply it to an APK with Morphe Desktop:

```bash
java -jar morphe-desktop-*-all.jar patch -p patches/build/libs/patches-*.mpp app.apk
```

CI builds every push to `main` and uploads the bundle as an artifact.

## Layout

```
patches/src/main/kotlin/app/template/patches/   # patch sources
extensions/extension/                           # extension code bundled into patches
patches/build.gradle.kts                        # bundle metadata
```

## License

GPL-3.0. See [LICENSE](LICENSE) and [NOTICE](NOTICE).
