# ytmusic-selfhost-scrobble

A single Morphe patch for **YouTube Music** that scrobbles what you play to your own
self-hosted scrobbler instead of listenbrainz.org.

Works with any server that implements the ListenBrainz API:

- [Koito](https://koito.io)
- [Maloja](https://github.com/krateng/maloja)
- listenbrainz.org itself (the URL setting just stays default)

> [!WARNING]
> **Personal use only.** This repository is my private patch, published only so I can
> add it as a patch source. It is not a general-purpose project, it is not affiliated
> with Morphe, and it is not supported.
>
> **AI was used to write this code.** The patch and extension code in this repository
> were generated with the help of an AI assistant, based on the scrobbling patch from
> [MorpheApp/morphe-patches](https://github.com/MorpheApp/morphe-patches) (GPLv3).
> Read the code before you run it.

## What it does

- Hooks the media session of YouTube Music (`setMetadata` and `setPlaybackState`).
- Sends `playing_now` and `single` listens to `<your-server>/apis/listenbrainz/1/...`.
- Cleans up metadata (`Official Video`, `Remaster`, `Live`, channel `- Topic`, …).
- Waits until 50% of the track (max 180s) before scrobbling, and skips tracks shorter
  than 30 seconds.
- Allows plain `http://` traffic, because self-hosted servers are usually reached over
  LAN without TLS.

There is no settings screen. Configuration lives in
[`Config.java`](extensions/extension/src/main/java/app/big1mosha/selfhostscrobble/extension/Config.java)
or in a small config file (see below).

## Configuration

The server URL and token can be set in two ways. The config file wins when it exists.

### Option 1: config file (no rebuild needed)

Create `scrobble.conf` in the app's external files directory:

```conf
server=http://192.168.1.5:4110/apis/listenbrainz
token=your-koito-api-key
```

Push it with adb:

```sh
adb shell mkdir -p /sdcard/Android/data/app.morphe.android.apps.youtube.music/files
adb push scrobble.conf /sdcard/Android/data/app.morphe.android.apps.youtube.music/files/scrobble.conf
```

Morphe renames the patched app to `app.morphe.android.apps.youtube.music`, so that is the
directory to use, not `com.google.android.apps.youtube.music`. The extension resolves it from
its own package automatically, so only the adb path above depends on the name.

For Maloja the URL is usually `http://<host>:42010/apis/listenbrainz`.
The token is the API key from your server's settings page (Koito: **Settings → API Keys**).

The URL may be given as `http://host:4110`, `http://host:4110/apis/listenbrainz`, or
`http://host:4110/apis/listenbrainz/1`; the patch normalizes it.

Restart YouTube Music after changing the file.

### Option 2: hardcoded constants

Edit `DEFAULT_SERVER_URL` and `DEFAULT_TOKEN` in `Config.java` and rebuild.

> Do not commit a real token to a public repository.

Other toggles in `Config.java`: now playing, minimum duration, delay percent/seconds,
metadata cleanup, custom regex, parse `Artist - Track` from the title.

## Build

Requirements: JDK 21, Android SDK, and a GitHub token with `read:packages` for the
Morphe Gradle plugin (`~/.gradle/gradle.properties`):

```properties
gpr.user=your-github-username
gpr.key=ghp_yourtoken
```

Then:

```sh
./gradlew buildAndroid
```

The patch bundle is written to `patches/build/libs/patches-*.mpp`.

## Install

1. Push this repository to GitHub. The release workflow builds and publishes the `.mpp` and
   fills `patches-bundle.json`, which is what Morphe Manager reads.
2. In Morphe Manager open **Sources → + → Remote** and add
   `github.com/<your-user>/ytmusic-selfhost-scrobble`.
3. Turn on **Expert mode** (Settings → Patching). Simple mode only allows one source per app.
4. Open YouTube Music, pick the APK version, then:
   - in the **Morphe Patches** tab tap **Enable recommended patches**,
   - in this source's tab enable **Self-hosted scrobbling**,
   - tap **Patch** and accept the multiple-sources warning.
5. Do **not** enable the official **Scrobbling** patch at the same time.
6. Install the patched app, configure the server as described above, and play a track.
7. Check `adb logcat -s SelfHostScrobble` if nothing shows up.

To build without GitHub Actions, see [Build](#build) and add the `.mpp` as a **Local** source
instead.

### Updates

Any patch update or YouTube Music update means patching again: tap the update mark on the app
card, **Patch**, then install over the existing app. The same Morphe keystore means Android
treats it as an update, so app data and `scrobble.conf` survive. They are lost only if Morphe's
keystore changes and the app has to be uninstalled first.

## Releasing

The repository is set up with the Morphe patches template. Semantic-release builds and
publishes a signed `.mpp` when a `feat:`/`fix:` commit lands on `main` or `dev`.

## License

GPLv3. See [LICENSE](LICENSE) and [NOTICE](NOTICE).
Scrobbling logic is derived from the Morphe scrobbling patch by the Morphe project.
