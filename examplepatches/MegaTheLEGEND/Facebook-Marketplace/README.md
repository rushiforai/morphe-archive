# Marketplace (Morphe patch for Facebook)

Turns the Facebook Android app into a **Marketplace-only app**. It's a [Morphe](https://github.com/MorpheApp) patch: nothing is decompiled by hand, Morphe patches the APK for you.

Not affiliated with Meta. Personal use only; don't redistribute Facebook's APK.

## What you get

- Opens straight on Marketplace, no bottom tab bar, no swiping to other tabs or the side menu
- Back button leaves the app; coming back after a while stays on Marketplace
- Links open in your normal browser
- Reels and fullscreen video blocked
- Facebook-wide search and "Meta AI" search removed (including the Search row in a profile's "..." menu)
- Group suggestions removed
- Always dark mode
- An "About" entry in the account menu
- Installs as its own app named **Marketplace** (`io.focalpoint.prism`) with a storefront icon, next to the normal Facebook app

Run the "Build .mpp" workflow (Actions tab) with a version number to get a new GitHub release with the `.mpp` attached.

Built for Facebook `com.facebook.katana` **582.0.0.50.54** (arm64). Other versions won't patch correctly.

## Get the patch file (.mpp)

You need Java 21+ (Eclipse Temurin), git, internet, and a GitHub *classic* token with only `read:packages`.

Windows:
```
set GITHUB_ACTOR=your-username
set GITHUB_TOKEN=ghp_...
powershell -ExecutionPolicy Bypass -File .\build.ps1 -ExportMpp
```
Linux/macOS: `./build.sh --export-mpp`

Result: `dist/marketplace-patches.mpp`. Import it in Morphe (Manager or Desktop), select Facebook 582.0.0.50.54, and patch.

## Build a patched APK directly

```
powershell -ExecutionPolicy Bypass -File .\build.ps1 -Apk "C:\path\to\facebook.apk"
```
Output: `work/facebook-patched.apk`. Add `-Keep...` flags (e.g. `-KeepTabBar`, `-KeepReels`, `-KeepOriginalPackage`) to turn features off. See the docs for the full list.

## Project layout

- `patches/` Kotlin patches
- `extensions/` Java code injected into the app
- `tests/` JVM unit tests
- `tools/`, `agent-tools/` helpers for inspecting the APK
- `docs/` technical notes ([TECHNICAL.md](docs/TECHNICAL.md)), to-do list ([TODO.md](docs/TODO.md)), tool notes ([AGENT-TOOLS.md](docs/AGENT-TOOLS.md))

If something breaks, `adb logcat -s MarketplaceOnly` shows what the patch is doing.
