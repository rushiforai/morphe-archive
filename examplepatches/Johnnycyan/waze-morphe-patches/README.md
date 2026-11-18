# ElevenLabs Voice for Waze and Google Maps

Morphe patches that have Waze and Google Maps speak navigation instructions with an
[ElevenLabs](https://elevenlabs.io) voice.

They always target the Waze and Google Maps versions that
[nl-morphe-patches](https://gitlab.com/johninnld/nl-morphe-patches) targets, so you can add both patch
sources to Morphe Manager and patch each app with patches from both in one go.

## Use it

1. In Morphe Manager, add this repository as a patch source (`github.com/Johnnycyan/waze-morphe-patches`).
   Manager reads `patches-bundle.json` from `main`.
2. Patch Waze or Google Maps with **ElevenLabs voice for navigation** enabled. Don't also enable
   nl-morphe-patches' **Use the system voice for navigation** for the same app, because both replace
   the same speech.
3. Open the settings entry and configure it (the dialog is the same in both apps):
   - **Waze**: **Settings → ElevenLabs voice**. It is also on the **Voice & sound** page.
   - **Google Maps**: **Settings → Navigation settings**, then **ElevenLabs voice** at the end of the
     **Sound & voice** section.

   In the dialog:
   - Turn on **Use ElevenLabs for navigation voice**.
   - Enter your ElevenLabs **API key**.
   - Pick a voice with **Choose from my voices**, or paste any **Voice ID**.
   - The **model** defaults to `eleven_v4_turbo`. **Choose model** lists
     the others.
   - **Stability**, **Similarity** and **Speed** are ElevenLabs' voice settings.
   - Tap **Test voice** to hear a sample, then tap **Save**.
4. Waze only: in **Voice & sound → Waze voice**, select a voice marked **Including street names**.
   Only those voices give Waze the instruction text that ElevenLabs reads out.

Synthesized phrases are cached on the phone (up to 64 MB), so repeated instructions like "Turn left"
cost no API credits and play instantly. If ElevenLabs is off, unconfigured or unreachable, the app's
own voice plays instead (in Waze also when ElevenLabs is slower than 9 seconds). The API key is
stored in the app's private storage.

## How it works

### Waze

The patch hooks Waze's sound player at three points and finds each one by what survives Waze's
per-build renaming: Kotlin parameter null-check strings (`"onPlayCompleted"`, `"cacheKey"`), log
strings and framework calls. Obfuscated names are never hard-coded.

- **Online navigation chunks**: Waze builds each chunk from its text, URL and cache key. The patch
  remembers the text and speaks it when Waze plays the URL.
- **Prompt files**: the file name is looked up in Waze's own phrase table
  (`res/key_value_tts_strings.txt`). Chimes and other sounds are left alone.
- **Native TTS cache**: the text comes from Waze's download request.

The MP3 from ElevenLabs is played through Waze's own file player, so audio focus, volume, mute and
completion callbacks behave as before.

Code: [`patches/.../ElevenLabsVoicePatch.kt`](patches/src/main/kotlin/app/waze/elevenlabs/ElevenLabsVoicePatch.kt),
[`Fingerprints.kt`](patches/src/main/kotlin/app/waze/elevenlabs/Fingerprints.kt), and
[`ElevenLabsBridge.java`](extensions/elevenlabs/src/main/java/app/waze/elevenlabs/extension/ElevenLabsBridge.java).

### Google Maps

Maps is fully obfuscated, so the patch finds its targets by log strings, preference keys and
framework types.

- **Speech queue**: Maps prepares each instruction ahead of time. Its speech queue (found by the log
  string `"Interrupted while waiting for an element in the queue."`) asks a synthesizer, either
  Google's server voice or the TTS engine, to write the instruction text to a file. The patch
  sends that call to the extension, which writes the ElevenLabs MP3 to that file instead. Maps
  then plays it with its own player. If ElevenLabs fails, Maps' synthesizer runs as before.
- **Speech cache**: Maps caches prepared instructions in `tts-cache` by instruction, not by voice.
  When the voice changes, the cache is cleared at the next start, and until then cached
  instructions are synthesized again.
- **Settings**: the entry is added to the `sound_voice_settings` category of navigation settings.
  androidx.preference keeps its class names but not its method names. The patch finds `setTitle`,
  `setSummary` and `addPreference` by their code. The entry opens the settings dialog in a small
  extension activity.

Code: [`maps/MapsElevenLabsPatch.kt`](patches/src/main/kotlin/app/waze/elevenlabs/maps/MapsElevenLabsPatch.kt),
[`maps/Fingerprints.kt`](patches/src/main/kotlin/app/waze/elevenlabs/maps/Fingerprints.kt), and
[`MapsBridge.java`](extensions/elevenlabs/src/main/java/app/waze/elevenlabs/extension/MapsBridge.java).

## Release automation

```
nl-morphe-patches release ──► pipeline.yml ──► "candidate" prerelease ──► worker page asks for Waze X, Maps Y
                                                                                │ you upload both APKMs
                              release v… ◄── pipeline.yml ◄── verified/<key>.json ◄── worker test-patches both
```

1. **Sync** (`.github/workflows/pipeline.yml`, every 4 hours): `scripts/sync.sh` reads
   `WazeConstants.kt` and the Google Maps `shared/Constants.kt` at nl-morphe-patches' newest tag. If
   the newest Waze version or the Maps target differs from `upstream.lock`, the lock is updated. NL
   releases for the same app versions change nothing.
2. **Build**: `scripts/build.sh` builds the bundle for those versions and publishes it as the
   `candidate` prerelease, together with `candidate.json`.
3. **Verify** (`worker/`): the worker page shows both app versions with APKMirror links. Upload each
   APKM there. The worker checks the package name, version and the app's signing certificate. Once
   both are stored, it applies the patch to each with Morphe. If both pass, it commits
   `verified/<key>.json`. If one fails, it opens an issue. For Waze, it also offers the decompiled
   `com/waze/sound` and `com/waze/settings` sources for download.
4. **Release**: the push of `verified/<key>.json` re-runs the pipeline. It publishes
   `v<VERSION>-waze.<WAZE_VERSION>.maps.<MAPS_VERSION_CODE>` and updates `patches-bundle.json` and
   `patches-list.json`. Maps is named by its version code because its version name has zero-padded
   parts (`26.44.06`), which semver rejects.

`<key>` is a hash of `upstream.lock`, `VERSION`, the patch and extension sources and the build files,
so a verification only covers the exact inputs it ran against. Pushing a code change builds and
verifies a new candidate. If the worker already has both APKs, nothing needs uploading. Bump
`VERSION` for notable changes. Otherwise rebuilds get a `.N` suffix.

## Setup

### 1. Repository

Make sure Actions can write to the repository (Settings → Actions → General → Workflow
permissions → Read and write).

### 2. Worker token

Create a fine-grained personal access token for **this repository only** with:

- Contents: read and write (commits `verified/*.json`, reads the candidate release)
- Issues: read and write (reports failed verifications)

The worker uses a personal token on purpose. Commits made with the Actions token don't trigger
workflows, but the worker's commit must start the release run.

### 3. Run the worker

The image is built by `.github/workflows/worker-image.yml` and published to
`ghcr.io/johnnycyan/waze-morphe-patches-worker`.

```bash
cd worker
printf 'GITHUB_TOKEN=github_pat_...\nUI_PASSWORD=choose-one\n' > .env
docker compose up -d
```

Open `http://<host>:8080` and sign in with `UI_PASSWORD`. Uploads are sent in chunks (20 MB by
default), so they work behind a Cloudflare Tunnel, which caps each request at 100 MB.

| Variable | Default | Purpose |
| --- | --- | --- |
| `GITHUB_REPO` | required | `owner/name` of this repository |
| `GITHUB_TOKEN` | required | token from step 2 |
| `UI_PASSWORD` | empty | password for the sign-in page; empty disables sign-in |
| `COOKIE_SECURE` | empty | `1` sends the session cookie only over HTTPS. Set it if you only use the tunnel's HTTPS address, and leave it empty if you also open the page over plain HTTP on your LAN |
| `UPLOAD_CHUNK_MB` | `20` | upload chunk size; keep it well under your proxy's request limit |
| `SECRET_KEY` | generated | signs session cookies; generated into `/data/secret_key` when unset |
| `POLL_SECONDS` | `600` | how often to check for a new candidate |
| `NOTIFY_TOKEN` | empty | lets the pipeline announce a new candidate at once (see below); empty disables `/api/notify` |
| `PATCH_NAME` | `ElevenLabs voice for navigation` | patch the worker applies to verify |
| `WAZE_CERT_SHA256` | Waze's cert | expected signing certificates of Waze uploads, comma-separated |
| `MAPS_CERT_SHA256` | Google's cert and its rotated key | expected signing certificates of Google Maps uploads, comma-separated |

### 4. Instant verification (optional)

By default the worker finds a new candidate at its next poll. To have the pipeline tell it right
away, pick a long random token and set it in both places:

- worker: `NOTIFY_TOKEN=<token>`
- repository secrets (Settings → Secrets and variables → Actions): `WORKER_NOTIFY_TOKEN=<token>`
  and `WORKER_URL=https://<your worker's public address>`

After publishing a candidate, the pipeline sends `POST <WORKER_URL>/api/notify` with
`Authorization: Bearer <token>`. If the worker is unreachable, the run only logs a warning and the
next poll picks the candidate up. A Cloudflare Access policy in front of the worker blocks this
call unless `/api/notify` is exempted from it.

Uploaded APKs are kept in the worker's `/data/apks`. They are never committed or published.

## Local build

Needs JDK 21 and the Android SDK (`ANDROID_HOME`).

```bash
bash scripts/build.sh 0.0.0-dev
```

The bundle lands in `out/patches.mpp`.

## Credits

The structural sound-player hooks and `PromptTextCatalog` are adapted from
[morphe-waze-system-tts](https://github.com/CasketPizza/morphe-waze-system-tts) by CasketPizza
(GPLv3). The Waze and Google Maps versions come from nl-morphe-patches by johninnl, whose Maps
system-voice patch showed where Maps synthesizes navigation speech.
