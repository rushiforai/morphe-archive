![HushPinterest. Keep the pins. Lose the ads.](assets/readme-hero.png)

<p>
  <img src="https://img.shields.io/badge/version-0.0.1-E60023" alt="Version 0.0.1">
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-GPL--3.0-blue" alt="License GPL-3.0"></a>
  <img src="https://img.shields.io/badge/platform-Android%209%2B-3DDC84" alt="Platform Android 9+">
  <img src="https://img.shields.io/badge/Pinterest-14.25.0-E60023" alt="Pinterest 14.25.0">
  <img src="https://img.shields.io/badge/for-Morphe%20Manager%201.32.0%2B-8A2BE2" alt="For Morphe Manager 1.32.0 or newer">
</p>

# <img src="assets/icon.png" width="36" alt=""> HushPinterest

HushPinterest is a Morphe patch bundle for Android that takes promoted pins out of Pinterest and can hide the pins Pinterest labels as AI. Every patch has its own switch, so you can turn one off without patching again.

It's early. There's no release yet, and the patches haven't been tried on a signed-in phone. For now you'd have to build the bundle yourself (see [Building from source](#building-from-source)). Once 0.0.1 is out, Morphe Manager will be able to add this repo as a patch source and keep it updated.

## Which Pinterest

HushPinterest targets Pinterest **14.25.0**, version code 14258020 (`com.pinterest`). Use the universal APK, the single file that holds every screen density and processor type. APKMirror lists it as the "nodpi" variant. A split bundle (`.apkm`, `.xapk`) works too if Morphe Manager can merge it.

Other versions may patch, but each patch looks for code by what it does in 14.25.0, and Pinterest renames almost everything in every build. If a patch can't find its spot it says so and stops, rather than patching the wrong place.

## Install

1. Install [Morphe Manager](https://github.com/MorpheApp/morphe-manager) 1.32.0 or newer.
2. Build the bundle (below) and add the `.mpp` to Morphe Manager as a local patch source.
3. Pick the Pinterest 14.25.0 APK, keep the default patch selection or change it, and patch.

A patched Pinterest can't install over the stock one, because Android only accepts an update signed with the same key. Uninstall the stock Pinterest first. Your boards and pins live on Pinterest's servers, so signing in again brings them back.

## Signing in

**Continue with Google doesn't work on a patched Pinterest.** Google's sign-in checks the app's signature, and a patched app carries your key instead of Pinterest's. Sign in with your email and password. If your account was made with Google, set a password first on pinterest.com (Settings, then Account management) and use that.

Facebook sign-in hasn't been tried yet.

## Keep your signing key

Morphe Manager signs the patched Pinterest with a key it makes on your phone. Android installs an update over your patched Pinterest only when the update carries that same key.

- **Back it up right after your first patch.** In Morphe Manager, open Settings, then System, then Import & export, then Signing key, and tap Export. Keep the `Morphe.keystore` file somewhere private, because anyone who has it can sign an APK your phone will accept as an update.
- **On a new phone, import it before you patch anything.** Without your exported copy, nothing you patched earlier can be updated in place.

## Patches

| Patch | Default | What it does |
|---|---|---|
| Hide ads | On | Removes promoted pins from the home feed, search, related pins and boards before Pinterest draws them, and folds away the four panels Pinterest only builds for an ad. |
| Hide AI-labeled pins | Off | Removes the pins Pinterest itself marks as made or changed with AI. An AI image that Pinterest hasn't labeled still shows, since there's nothing to go by. Off unless you pick it, because it changes what you see and not just what's sold to you. |
| HushPinterest settings | On | Adds a settings screen where every patch has its own switch, plus Pause, diagnostics and backup. Required by the others. |

Every switch takes effect without patching again. Pause turns them all off at once until Pinterest restarts, which helps tell whether a problem is HushPinterest's or Pinterest's own.

## Settings

Long-press the Pinterest icon and tap HushPinterest. You can also open Pinterest's App info page and tap Additional settings in the app, which Samsung phones call Configure in Pinterest.

## Opening Pinterest links

Android hands a pinterest.com or pin.it link to the official app only when that app proves it belongs to Pinterest's sites, and a re-signed app can't. To open those links in the patched app, go to its App info page, tap Open by default, then Add link, and select the Pinterest sites. HushPinterest's Links page has a button that goes straight there.

## Privacy

HushPinterest doesn't collect anything and has no server. The only time the patched app goes online on HushPinterest's behalf is the release check, which stays off until you turn it on. Once it's on, HushPinterest asks `api.github.com` for its latest release at most once a day, when Pinterest starts, and again whenever you tap Check now.

The About and Licenses screens link to `github.com`, `gitlab.com` and `www.gnu.org`. Those open in your browser, and only when you tap one.

## Reporting a problem

Open an [issue](https://github.com/SysAdminDoc/HushPinterest/issues) and say what you did and what you saw. It helps a lot to attach a diagnostic report. In HushPinterest's settings, tap Export diagnostic report, then Copy quick report or Save full report. The report carries Pinterest's version, your Android version and what each patch did. HushPinterest takes out the account, pin and board ids it recognizes, but give it a read before you share it. Nothing is sent anywhere unless you paste or attach it yourself.

## Where the patches come from

| Source | What came from it |
|---|---|
| [SysAdminDoc/HushTelegram](https://github.com/SysAdminDoc/HushTelegram) at `8c54a1d` | The Gradle build, the shared extension library with its settings screen, diagnostics, pause and backup, the bytecode helpers, and the checks that apply every patch to a real APK before a release. Most of that came to HushTelegram from [HushThreads](https://github.com/SysAdminDoc/HushThreads) and [Hushfacebook](https://github.com/SysAdminDoc/Hushfacebook). |
| [Morphe](https://github.com/MorpheApp) and [ReVanced](https://gitlab.com/ReVanced/revanced-patches) | The patcher and the patch template. Everything above grew from their code. |

The Pinterest patches were written for this project by reading Pinterest 14.25.0 itself. Every source file says where it came from in its header, and [provenance.json](provenance.json) maps each file to the project and commit it came from, with its license. The [source ledger](sources/pinterest-sources.json) lists the other Pinterest patch projects that were reviewed, what each one does and why nothing was copied from it.

## Building from source

You need JDK 21 and the Android SDK. The Morphe patcher comes from GitHub Packages, so you also need a GitHub token with `read:packages`.

```bash
export GITHUB_ACTOR=<your GitHub user>
export GITHUB_TOKEN=<a token with read:packages>
./gradlew :patches:generatePatchesList
./gradlew :patches:buildAndroid
```

The bundle lands in `patches/build/release/patches-<version>.mpp`, beside its SHA-256 and a CycloneDX SBOM of every library that goes into it. Run `generatePatchesList` before `buildAndroid`, or the bundle loses its Android payload.

Tests: `./gradlew :patches:test :extensions:pinterest:test`. Set `HUSHPINTEREST_FIXTURE_DIR` to the directory containing every APK named in `AppCompatibilities.kt` before pushing a patch change. The push check rejects missing fixtures.

Build dependencies have a separate advisory check. Run `./gradlew :patches:buildDependencyReport`, then `pwsh -NoProfile -File scripts/build-advisories.ps1`. High, critical or unrated findings and failed queries stop a push. Lower-severity findings are reported.

## License

[GPL-3.0](LICENSE), with the Morphe section 7 notices carried in [NOTICE](NOTICE). Pinterest is a trademark of Pinterest, Inc. HushPinterest isn't made by or connected with Pinterest.
