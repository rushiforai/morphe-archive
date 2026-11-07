# CarBridge Patches

Patches that put an app's full interface on the Android Auto car screen while parked.
A patch bundle for use with [Morphe](https://github.com/MorpheApp) Manager, made by the
[CarBridge](https://github.com/jmwerk/CarBridge) project. Not affiliated with or endorsed by Morphe.

Unlike the CarBridge app, these patches keep the app's package name, so they work together with
the other patches you apply (for example, branding and icon changes keep working).

## How to use these patches

1. In Morphe Manager, add this patch source: tap the button below, or add the URL
   `https://github.com/jmwerk/carbridge-patches` under **Patch sources**.

   <a href="https://morphe.software/add-source?github=jmwerk/carbridge-patches">
     <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe Manager" height="48">
   </a>

2. Patch an app as usual and enable **Show in Android Auto** (it is off by default).
3. Install the patched app. Android Auto lists sideloaded apps only with developer mode on:
   Android Auto settings → tap *Version* 10× → ⋮ → Developer settings → enable **Unknown sources**.

## Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/jmwerk/carbridge-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Show in Android Auto](#show-in-android-auto) | Lists the app in the Android Auto launcher and shows its full interface on the car screen while parked. | • Keep media services |

</details>

<!-- PATCHES_END -->

## Building locally

The Gradle plugin comes from GitHub Packages, so Gradle needs a GitHub token with the
`read:packages` scope, as `gpr.user`/`gpr.key` in `~/.gradle/gradle.properties` or as
`GITHUB_ACTOR`/`GITHUB_TOKEN`:

```bash
GITHUB_ACTOR=<user> GITHUB_TOKEN=<token> ./gradlew buildAndroid
```

The bundle is written to `patches/build/libs/patches-*.mpp`. Apply it with
[Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) or add it as a local source in
Morphe Manager.

## Releasing

Releases are made by `.github/workflows/release.yml` (semantic-release) from conventional commits:
`feat:` and `fix:` on `dev` make pre-releases, merging `dev` into `main` makes a stable release.
Do not create releases or edit `patches-list.json`, `patches-bundle.json` or `CHANGELOG.md` by hand.

## License

CarBridge Patches are licensed under the [GNU General Public License v3.0](LICENSE).
"Morphe" is used only to describe compatibility; see [NOTICE](NOTICE).
