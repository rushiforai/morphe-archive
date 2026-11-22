# nullroute3 patches

A collection of patches for use with [Morphe](https://morphe.software).

Developer permission to adjust acquired app: the developer may modify any acquired behaviour at their discretion.

## Usage

### Morphe Manager

Add `https://github.com/nullroute3/morphe-patches` as a remote source in Morphe Manager, or open:

<a href="https://morphe.software/add-source?github=nullroute3/morphe-patches&name=nullroute3">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

Morphe Manager reads the source from the public repository URL above.

### Morphe Desktop

Download `patches-<version>.mpp` from the [releases](https://github.com/nullroute3/morphe-patches/releases) and run:

```sh
java -jar morphe-desktop-all.jar patch --patches patches-<version>.mpp input.apks
```

Morphe Desktop needs JDK 21. The `.apks` split bundle is merged automatically, so pass the
bundle rather than `base.apk`. The output is signed with the Morphe test key; uninstall the
original app first, because the signature differs.

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.1](https://github.com/nullroute3/morphe-patches/releases/tag/v1.0.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 A Better Route Planner&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `com.iternio.abrpapp`

**🎯 Supported versions:**

| 7.1.13 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable analytics collection](#disable-analytics-collection) | Sets the Firebase Analytics collection flags to false in the manifest |  |
| [Disable expo-updates](#disable-expo-updates) | Stops the app from downloading OTA JS bundles over the embedded one. Required for patches that change the JS bundle. |  |
| [Unlock Premium](#unlock-premium) | Forces isPremiumUserSelector and the isPremiumUser state reads to true, which unlocks the Premium features and removes the paywalls. |  |

</details>

<!-- PATCHES_END -->

## Building

JDK 17 or newer is required. The Morphe Gradle plugin is served from GitHub Packages, so add a
personal access token with `read:packages` to `~/.gradle/gradle.properties`:

```properties
gpr.user = <GitHub username>
gpr.key = <personal access token>
```

Without a token, publish the plugin, the patcher and the extensions library to `mavenLocal()` and
resolve them from there with the bundled init script:

```sh
./gradlew --init-script maven-local.init.gradle.kts -Pgpr.user=dummy -Pgpr.key=dummy buildAndroid
```

With a token, build directly:

```sh
./gradlew buildAndroid
```

`buildAndroid` compiles the patches to DEX and writes the bundle to
`patches/build/libs/patches-<version>.mpp`. `:patches:build` writes the same bundle without the
DEX pass.

## Development

- Work on the `dev` branch. Pushes to `dev` publish pre-releases, merging `dev` into `main` publishes a stable release.
- Use semantic commit messages: `feat:` and `fix:` trigger a release, `chore:` does not.
- Releases, `CHANGELOG.md`, `patches-list.json` and `patches-bundle.json` are produced by `release.yml`. Do not create releases or edit these files by hand.
- Each app lives in its own package under `patches/src/main/kotlin/app/nullroute3/patches/<app>/`, with its `Compatibility` in `<app>/shared/Constants.kt`.

### Signing releases

Releases are unsigned by default. To sign them, so Morphe Manager rejects a bundle that was
swapped after publication:

1. Run `./gradlew generateSigningKey`. It writes `morphe-signing.pub` and `morphe-signing.key`.
2. Commit `morphe-signing.pub`. Never commit `morphe-signing.key`; it is gitignored.
3. Add the content of `morphe-signing.key` as the `MORPHE_SIGNING_KEY` secret under
   Settings → Secrets and variables → Actions, then keep a backup and delete the file.

If the key is lost or leaks, generate a new one the same way; users then confirm the new key in
Morphe Manager before they receive the next release.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for patch development.

## License

Licensed under the [GNU General Public License v3.0](LICENSE). See [NOTICE](NOTICE) for the Morphe name restriction.
