# CarBridge Patches

Patches that put an app's full interface on the Android Auto car screen while parked.
A patch bundle for use with [Morphe](https://github.com/MorpheApp) Manager, made by the
[CarBridge](https://github.com/jmwerk/CarBridge) project. Not affiliated with or endorsed by Morphe.

Unlike the CarBridge app, these patches keep the app's package name, so they work together with
the other patches you apply (for example, branding and icon changes keep working).

## CarBridge app or CarBridge Patches?

Both put an app's full interface on the Android Auto screen, using the same rules (CarBridge's
`core` module). They differ in what they do to the app:

| | [CarBridge app](https://github.com/jmwerk/CarBridge) | [CarBridge Patches](https://github.com/jmwerk/carbridge-patches) for Morphe |
|---|---|---|
| What you get | A separate copy, "*App* (Car)", next to the original | The patched app; no extra car copy |
| Original app | Untouched; keeps updating from its store | Replaced, unless Morphe gives the app its own package name (as it does for YouTube) |
| App data and sign-in | The copy starts empty; sign in again | Kept when the patched build replaces the original |
| Works with | Almost any installed app, including Play Store split APKs | Apps you patch in Morphe Manager, from an APK you provide |
| Combine with other patches | No | Yes, e.g. Morphe's YouTube patches |
| After the original updates | CarBridge notifies you; tap **Update** to rebuild the copy | Repatch the new version in Morphe Manager |
| Options | Per copy, from its ⋮ menu: fill the car screen, keep the audio player | Patch options: Fill the car screen, Keep media services |
| What you need | Only the phone | Morphe Manager |

**Use the CarBridge app** for apps you install from a store and don't otherwise modify, like
games, browsers and video apps. It's the quickest route and never touches the original.

**Use CarBridge Patches** for apps you already patch with Morphe (YouTube, YouTube Music and
others), or when you want one patched app instead of an original plus a car copy. CarBridge
points Morphe-patched apps here automatically.

Neither works with apps that check Play Integrity, their own signature or a license; both
re-sign the app.

## How to use these patches

1. In Morphe Manager, add this patch source: tap the button below, or open **Sources** in the
   bottom bar, tap **+** and add `https://github.com/jmwerk/carbridge-patches`.

   <a href="https://morphe.software/add-source?github=jmwerk/carbridge-patches">
     <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe Manager" height="48">
   </a>

2. Turn on **Settings → Expert mode**. The patch is off by default, and only Expert mode lets
   you pick patches.
3. Choose the app:
   - Apps in Morphe's list, like YouTube: tap the app on the **Apps** screen and pick a version.
   - Any other app: tap **Select other apps** at the top of the **Apps** screen, then pick an
     APK from storage or an installed app.
4. On the patch list, open the **CarBridge Patches** tab and turn on **Show in Android Auto**.
   Its settings icon has the [options](#recommended-options). Keep the app's usual patches on
   in their own tab.
5. Tap **Patch**. Morphe warns about mixing patch sources; you can continue.
6. Install the patched app. Android Auto lists sideloaded apps only with developer mode on:
   Android Auto settings → tap *Version* 10× → ⋮ → Developer settings → enable **Unknown sources**.
   Then reconnect to Android Auto.

## Recommended options

| App | Show in Android Auto options | What you get |
|---|---|---|
| Video apps, e.g. YouTube | Defaults | The full app on the car screen |
| Music and podcast apps, e.g. YouTube Music | **Keep media services** on | Android Auto's own audio player, which is safer while driving |
| Music apps, when you want the full app while parked | Defaults | The full app; its Android Auto audio player is gone |
| Games and portrait-only apps | Defaults (**Fill the car screen** on) | Screens fill the wide car display; turn it off if a screen breaks |

Combine it with the app's usual Morphe patches. Results for specific apps are in CarBridge's
[compatibility list](https://github.com/jmwerk/CarBridge/blob/master/COMPATIBILITY.md).

## Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.2.0](https://github.com/jmwerk/carbridge-patches/releases/tag/v1.2.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Show in Android Auto](#show-in-android-auto) | Lists the app in the Android Auto launcher and shows its full interface on the car screen while parked. | • Keep media services<br>• Fill the car screen |

</details>

<!-- PATCHES_END -->

## Building locally

The Android Auto rules come from CarBridge's `core` module, included as the `carbridge`
git submodule, so the app and this patch always make the same changes. Clone with
`git clone --recursive`, or run `git submodule update --init` in an existing clone. To pick up
new rules, update the submodule to a newer CarBridge commit.

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

## Inspiration

[AAAnything](https://github.com/kododake/AAAnything) showed that everyday apps can run on Android
Auto without root. These patches are a separate, from-scratch take that shares no code with it, and
they are free and open source for every app, with no tiers or sign-in.

## Support

These patches are free and will stay that way. If they're useful to you, you can
[buy me a coffee](https://buymeacoffee.com/jmwerk). It's entirely optional and doesn't unlock anything.

## License

CarBridge Patches are licensed under the [GNU General Public License v3.0](LICENSE).
"Morphe" is used only to describe compatibility; see [NOTICE](NOTICE).
