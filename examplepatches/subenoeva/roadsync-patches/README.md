# 🧩 subenoeva Morphe patches

Morphe patches for **Honda RoadSync** (`com.honda.ms.dm.sab`).

Not affiliated with, or endorsed by, Honda or the Morphe project. These patches are for use with
Morphe.

## How to use these patches

Add this source to Morphe Manager: https://morphe.software/add-source?github=subenoeva/roadsync-patches

## 🩹 Patches

### Add music sources

RoadSync bundles the Drivemode music SDK, which resolves music apps three ways:

- **supported** — a hardcoded set of `Resolvable` implementations (Spotify, YouTube Music, Apple
  Music, Amazon Music, Deezer, SoundCloud, VLC, TuneIn, Poweramp, Samsung Music, ...).
- **generic** — any installed app that declares an `android.intent.action.MEDIA_BUTTON` receiver and
  is not blacklisted, wrapped in a `GenericMusicApp`.
- **media browser whitelist** — nine hardcoded package names. Only apps on this list get their
  `android.media.browse.MediaBrowserService` bound, which is what turns a music app from
  "play/pause/skip" into a browsable library.

The patch appends packages to that third list. It does not touch the blacklist or the supported set.

Default packages:

| Package | App | Media browser service |
|---|---|---|
| `com.aspiro.tidal` | TIDAL | `com.aspiro.wamp.player.MusicService` |
| `app.morphe.android.apps.youtube.music` | YouTube Music patched with Morphe | `com.google.android.apps.youtube.music.mediabrowser.MusicBrowserService` |

Both are already discovered by RoadSync as generic music apps, so transport control works without
the patch; whitelisting is what adds library browsing.

#### Option: `extraMusicPackages`

Replaces the default list. An app only benefits from being listed if it declares a
`android.media.browse.MediaBrowserService` — check with:

```bash
aapt2 dump xmltree --file AndroidManifest.xml app.apk | grep -B40 'android.media.browse.MediaBrowserService'
```

Apps without one already work as plain transport targets and gain nothing from being listed.

> [!WARNING]
> Whitelisting an app whose media browser service refuses connections from unknown clients can make
> it *worse* than not patching: once a package is whitelisted, RoadSync binds the browser service
> instead of falling back to plain media session control. Spotify is the known case — its browser
> service only accepts allowlisted, signed clients, which is why it is not a default here.

### Bypass Google login

Patching re-signs the APK with a new certificate. Google Sign-In validates the app's package name
plus signing SHA-1 against the OAuth client Honda registered in their Firebase project, so a patched
build can never obtain a token (`ApiException 10, DEVELOPER_ERROR`) and gets stuck on the login
screen.

The motorcycle controls do not need that account. The BLE link to the instrument cluster and the
on-device `call` / `music` / `navigation` / `message` / `volume` pages run without checking auth, so
this patch removes the two gates that force login:

- `OnboardingLoginBlockerScreen.shouldBeDisplayed()` returns `false`, so onboarding skips the
  Terms / Privacy / consent / Google sign-in flow.
- The "token is empty" handlers on the ride and disconnected screens become no-ops, so the app stops
  re-arming `needsLogin` and stops re-launching Google Sign-In whenever it sees no session.

**On by default**, because re-signing breaks Google Sign-In for every patched build. Disable it only
if you have a build whose signature Honda's project still accepts and you want the real account
features.

What stays unavailable: anything that reaches Honda's server — account, trip history, analytics,
weather — because those gRPC calls now send an empty `Authorization` header.

> [!WARNING]
> **Pairing a brand-new motorcycle may still need the server.** The "select model" step downloads
> the vehicle catalog and setup pages over the same authenticated gRPC API. Whether it works with no
> account depends on whether Honda's backend answers an unauthenticated request:
> - If it does, pairing completes, the vehicle is saved locally, and the controls work.
> - If it requires a valid token, the model list comes back empty. Reaching the controls then needs a
>   motorcycle that is **already paired** in this build — which, on a fresh install, means
>   transplanting the app database from a signed-in stock install (needs root; `allowBackup` is off).
>
> A motorcycle already paired in this build connects straight away and needs none of the above.

<!-- PATCHES_START EXPANDED -->
> **[v1.2.2](https://github.com/subenoeva/roadsync-patches/releases/tag/v1.2.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 RoadSync&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 26.4.10 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Add music sources](#add-music-sources) | Adds music apps to the list of sources RoadSync can browse and control from the handlebar. Apps must expose a media browser service to be browsable. | • Music app packages |
| [Bypass Google login](#bypass-google-login) | Lets RoadSync reach the motorcycle controls without a Google account. Server features (account, trip history, weather) stay unavailable, and pairing a new motorcycle still depends on Honda's server accepting an unauthenticated request. |  |
| [Offline pairing](#offline-pairing) | Lets RoadSync pair a new motorcycle and reach the handlebar controls with no Google account and no network, by serving the vehicle catalog locally instead of from Honda's server. Complements "Bypass Google login". Control pages fall back to defaults for the placeholder model. |  |

</details>

<!-- PATCHES_END -->

&nbsp;

## 🧑‍💻 Development

This section lives below `PATCHES_END` on purpose: everything between `PATCHES_START` and
`PATCHES_END` is regenerated by `release.yml` on every release.

- Make all changes on the `dev` branch.
- `./gradlew buildAndroid` produces `patches/build/libs/patches-*.mpp`.
- Requires a GitHub token with the `read:packages` scope for
  `maven.pkg.github.com/MorpheApp/registry`, exported as `GITHUB_ACTOR` / `GITHUB_TOKEN` or set as
  `gpr.user` / `gpr.key` in `~/.gradle/gradle.properties`.
- Semantic commits only: `feat:`, `fix:`, `chore:`. `feat`/`fix` cut a release; `chore` does not.
- Never hand-edit generated files: `patches-list.json`, `patches-bundle.json`, `CHANGELOG.md`, or
  the generated block in this README.
- Releases go through `release.yml`. Do not create them by hand, and never force push a semantic
  release commit.
- `gradlew` must stay executable in the git index (`git update-index --chmod=+x gradlew`); the
  release workflow spawns it directly.

Apply a local build to an APK:

```bash
java -jar morphe-desktop-1.14.0-all.jar patch \
  -p patches/build/libs/patches-1.0.0.mpp \
  --exclusive -e "Add music sources" \
  -O 'extraMusicPackages=["com.aspiro.tidal","app.morphe.android.apps.youtube.music"]' \
  -o patched.apk original.apk
```
