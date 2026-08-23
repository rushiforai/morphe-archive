# Morphe Spotify Patches

Morphe patches for the Spotify Android app.

| Patch | What it does |
| --- | --- |
| **Morphe settings** | Adds a **Morphe** row to Spotify's settings. It is where the settings of every other patch in this bundle live. |
| **Local files from a server** | Lets Spotify take its local files from a Nextcloud (or plain WebDAV) folder. The tracks appear under **Local Files** and are streamed from the server as they play. |

## Add it to Morphe

**[Add this source to Morphe](https://morphe.software/add-source?github=ImNoammm/morphe-spotify-patches&name=Spotify)**

Open that link on the device running Morphe Manager, or paste either of these into Morphe as a
source by hand:

- `https://github.com/ImNoammm/morphe-spotify-patches`
- `https://raw.githubusercontent.com/ImNoammm/morphe-spotify-patches/main/patches-bundle.json`
  (the bundle metadata directly, if the repository URL is not accepted)

Morphe then picks up each release automatically.

## Local files from a server

Spotify's local-file scanner already knows how to read a track whose location is a `content://`
URI — that is how files imported from other apps work. This patch reuses that: a content provider
inside the patched app serves the remote folder's tracks, so the tracks show up as ordinary local
files without a copy of the library on the phone.

- **Streaming by default.** Bytes are fetched with HTTP range requests as the track plays, through
  `StorageManager.openProxyFileDescriptor`. Turn streaming off to have each track downloaded to the
  cache the first time it is played instead.
- **No storage permission.** The provider is private to the app and runs under its own uid, so
  nothing is written to shared storage and no permission is requested.
- **Tags are read once.** A scan reads only each file's header to get title, artist, album and
  duration, then caches them in an index; it does not download the library.

### Setting it up

1. Open Spotify → **Settings** → **Morphe**.
2. Turn on **Use a server folder** and fill in:
   - **Server address** — `https://cloud.example.com`. A bare Nextcloud address is expanded to that
     user's WebDAV root automatically; a full WebDAV URL is used as given.
   - **Username** and **App password** — on Nextcloud, generate an app password under
     *Settings → Security*, rather than using your account password.
   - **Folder** — for example `/Music`.
3. Tap **Save and scan folder**. The tracks then appear under **Your Library → Local Files**.

Playing local files on mobile requires a Spotify Premium account; that is Spotify's own restriction
and is not something a patch changes.

## Building

```bash
./gradlew build buildAndroid
```

The bundle is written to `patches/build/libs/patches-<version>.mpp`. `buildAndroid` is what compiles
the patches to DEX and merges them into that file; without it the bundle only works in Morphe
Desktop, and Morphe Manager on Android reports the source as having no patches. Building resolves the Morphe
Gradle plugin from GitHub Packages, which requires authentication even for public packages, so set
`GITHUB_ACTOR` and `GITHUB_TOKEN` (or `gpr.user`/`gpr.key` in `~/.gradle/gradle.properties`).

## Applying

```bash
java -jar morphe-desktop.jar patch -p patches-<version>.mpp Spotify.apk
```

or add this repository as a source in Morphe Manager / Morphe Desktop.

## Notes on how the patches survive Spotify updates

Spotify obfuscates its settings classes and the names change with every release, so nothing is
matched by name. The settings patch anchors on the row ids (`appIcon`, `appLanguage`), which are
plain strings that have been stable for a long time, and then works out the row class and the
accessor classes from the shape of the code around them. The Morphe row itself is built at runtime
by copying a row that is already on screen, so it renders exactly like its neighbours. If any of
that fails, the row is skipped and Spotify's own settings are left untouched.

The local files patch hooks `com.spotify.localfiles.mediastore.MediaStoreReader`, which is annotated
`@Keep` because Spotify's native library calls it, so its name is not obfuscated at all.

## Anti-tamper

These patches change no premium, advertising or DRM code. Spotify does ship Google's Play Integrity
API, which reports any resigned APK — patched or not, and regardless of what was patched. There is
no local signature check to defeat, and nothing here trips a "modified client" heuristic beyond the
resigning that patching inherently requires.

## Licence

GPL-3.0. Morphe Patcher and the Morphe patches template are by the Morphe project.
