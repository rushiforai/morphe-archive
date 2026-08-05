# Morphe Patches

A shared Morphe patch repository maintained by **Alastor Kaneki**. New Morphe
patches are added to this project and built together into one `.mpp` bundle.

## Included patches

### Opera GX — Download GX mods as files

Targets the Android Opera GX package (`com.opera.gx`). It adds a visible floating
**Download Mod** button inside the patched browser and keeps **Download GX Mod**
as an Android share-sheet fallback. Both save the GX Store's official raw `.crx`
package to the public **Downloads** folder.

The patch does not install, activate, or modify the downloaded mod.

#### Usage

1. Patch a full Opera GX Android APK using the generated `.mpp` bundle.
2. Enable **Download GX mods as files** in Morphe Manager.
3. Install the patched Opera GX APK.
4. Open a mod page on `store.gx.me`.
5. Tap the floating **Download Mod ↓** button.

The button attempts to detect the current GX Store URL from Opera's current tab,
address bar, navigation objects, intent, or clipboard. If Opera does not expose
the complete URL, it opens a small paste dialog rather than failing silently.

The floating button follows Opera GX's active theme at runtime. It reads the
app's surface, primary/accent, and foreground colors and automatically chooses
readable text, border, and ripple colors.

The injected downloader reads the public GX Store page, resolves either a direct
`mod.crx` URL or a version-matched `/contents/` asset URL, and queues the package
through Android Download Manager.

Only HTTPS package URLs on these official GX hosts are accepted:

- `mods.store.gx.me`
- `play.gxc.gg`
- `play.gx.games`

The filename is `<mod-slug>-<timestamp>.crx`.

#### Version resilience

Opera GX Mobile is heavily obfuscated and its internal menu code changes between
versions. The patch starts its overlay through an injected Android
`ContentProvider` rather than hooking a version-specific Opera menu method. The
share-sheet target remains available as a fallback.

## Repository structure

- `patches/` — Morphe patch definitions.
- `extensions/extension/` — Android code injected by patches.
- `tools/` — local tests and validation helpers.
- `.github/workflows/build.yml` — builds the shared `.mpp` bundle.

Future patches should receive their own package under
`patches/src/main/kotlin/dev/alastorkaneki/morphe/patches/` and, when needed,
their injected code under
`extensions/extension/src/main/java/dev/alastorkaneki/morphe/extension/`.

## Build

Requirements:

- JDK 21
- Gradle 9.6.1
- GitHub credentials with read access to Morphe's GitHub Packages registry

Set either Gradle properties `gpr.user` / `gpr.key`, or environment variables
`GITHUB_ACTOR` / `GITHUB_TOKEN`, then run:

```bash
bash tools/test-parser.sh
gradle buildAndroid --stacktrace
```

The bundle is generated under `patches/build/libs/` as an `.mpp`. Every push to
`main` also runs the included GitHub Actions workflow and uploads the bundle as a
workflow artifact.

## Opera GX patch security behavior

- Accepts only a GX Store mod page or an already-direct official GX CDN
  `mod.crx` URL.
- Refuses arbitrary download hosts.
- Caps fetched page HTML at 12 MB.
- Does not read cookies, credentials, browser history, or installed mods.
- Does not install the downloaded package.

## License

GPL-3.0. See [`LICENSE`](LICENSE).
