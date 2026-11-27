<p align="center">
  <img src="assets/apk-patches.svg" alt="apk-patches logo" width="160" height="160">
</p>
<h1 align="center">apk-patches</h1>
<p align="center"><strong>Signed patches for Android apps, for ReVanced and Morphe.</strong></p>
<p align="center">
  <a href="https://github.com/edbfi/apk-patches/blob/main/LICENSE">
    <img src="https://img.shields.io/badge/license-AGPL--3.0--or--later-blue?style=flat" alt="License: AGPL-3.0-or-later">
  </a>
  <a href="https://github.com/JetBrains/kotlin" title="Kotlin source">
    <img src="https://img.shields.io/badge/Kotlin-7F52FF?style=flat&amp;logo=kotlin&amp;logoColor=white" alt="Kotlin">
  </a>
  <a href="https://github.com/ReVanced/revanced-patcher" title="ReVanced Patcher framework source">
    <img src="https://img.shields.io/badge/ReVanced-0076FF?style=flat" alt="ReVanced">
  </a>
  <a href="https://github.com/MorpheApp/morphe-patcher" title="Morphe Patcher framework source">
    <img src="https://img.shields.io/badge/Morphe-1C1B1F?style=flat" alt="Morphe">
  </a>
  <a href="https://android.googlesource.com/platform/manifest" title="Android Open Source Project source manifest">
    <img src="https://img.shields.io/badge/Android-3DDC84?style=flat&amp;logo=android&amp;logoColor=black" alt="Android">
  </a>
  <a href="https://github.com/edbfi/apk-patches/actions/workflows/ci.yml?query=branch%3Amain"><img src="https://img.shields.io/github/actions/workflow/status/edbfi/apk-patches/ci.yml?branch=main&amp;event=push&amp;label=CI&amp;style=flat" alt="CI"></a>
</p>

Download the [ReVanced](https://revanced.app) and [Morphe](https://morphe.software) bundles from
[Releases](https://github.com/edbfi/apk-patches/releases). See [Reseam preview](#reseam-preview) for Manager
source and local build instructions.

## Supported apps

| App | Package | ReVanced | Morphe | Reseam preview |
| --- | --- | --- | --- | --- |
| rif is fun | `com.andrewshu.android.reddit` | [12 patches](docs/revanced/rifisfun.md) | [12 patches](docs/morphe/rifisfun.md) | [12 patches](docs/reseam/rifisfun.md) |
| Sync for Reddit | `com.laurencedawson.reddit_sync` | [15 patches](docs/revanced/syncforreddit.md) | [15 patches](docs/morphe/syncforreddit.md) | [15 patches](docs/reseam/syncforreddit.md) |

Each link opens the app page for an edition with its patches, options, known issues and app versions. Each edition has
its own code and patch list.

**Patch the version listed for your edition.** ReVanced Manager, ReVanced CLI and Morphe CLI skip patches on other
versions unless you force them, and Morphe Manager asks you to confirm.

## Install

Use a manager on your phone, or a CLI on a computer.

### ReVanced Manager

1. Open **Patches**, tap the pencil button, then **Add patches**. Choose **Enter URL**, tap **Next**, paste this URL and
   tap **Add**:

   ```text
   https://github.com/edbfi/apk-patches/releases/latest/download/patches-bundle.json
   ```

   Don't use the repository's own `patches-bundle.json`: it is Morphe's, and ReVanced Manager can't read it.
2. Open **Settings → Advanced** and turn on **Allow changing patch selection and options**.
3. Pick the app's APK. In **Select patches**, untick **ReVanced Patches**. Some of its patches change the same code as
   ours.
4. Patch and install.

### Morphe Manager

1. Open **Sources**, tap **+**, paste this URL and tap **Add**:

   ```text
   https://github.com/edbfi/apk-patches
   ```

2. If another tool patched the app on your phone, [give Morphe Manager that tool's key](#already-have-a-patched-version)
   first.
3. Pick the app's APK and patch. Morphe Manager's own **Morphe Patches** has no patches for these apps, so there is
   nothing to untick.

#### Already have a patched version?

Android installs an update only if it is signed with the same key as the app on your phone. Otherwise you must
uninstall the app first, which erases its data. Morphe Manager signs with its own key, so give it the key of the tool
that patched your app before you patch.

If ReVanced Manager patched it:

1. In ReVanced Manager, open **Settings → Import & export**. Under **Keystore**, note the alias and password, then tap
   **Export**.
2. In Morphe Manager, open **Settings → Signing key**, tap **Import**, pick the exported file and enter that alias and
   password.

If another tool patched it, import that tool's key in Morphe Manager the same way.

ReVanced Manager can't read the key Morphe Manager exports, so a key moves from ReVanced Manager to Morphe Manager but
not back.

### ReVanced CLI

Download `patches-X.Y.Z.rvp`, `.rvp.asc` and `.rvp.sigstore.json` from a
[release](https://github.com/edbfi/apk-patches/releases) and the [public key](keys/release-signing.asc), then:

```sh
java -jar revanced-cli.jar patch \
  -p patches-X.Y.Z.rvp -k release-signing.asc -s patches-X.Y.Z.rvp.asc \
  -a patches-X.Y.Z.rvp.sigstore.json -r edbfi/apk-patches \
  app.apk
```

The CLI checks the bundle's signature before it patches.

### Morphe CLI

Download `morphe-desktop-<version>-all.jar` from
[Morphe desktop's releases](https://github.com/MorpheApp/morphe-desktop/releases), then:

```sh
java -jar morphe-desktop-<version>-all.jar patch -p https://github.com/edbfi/apk-patches app.apk
```

- It downloads the latest bundle and checks its signature, as Morphe Manager does.
- It also takes a downloaded file, `-p patches-X.Y.Z.mpp`, but doesn't check a file's signature.
  [Verify it](#verify-a-download) first.
- It signs patched APKs with signature scheme v2 only, so they install on Android 7.0 or later.

### Reseam preview

Use Reseam Manager 1.0.1 and put the [Reseam 1.0.1 CLI](https://github.com/Reseam/reseam/releases/tag/v1.0.1)
on your `PATH` as `reseam`. The CLI needs Java 17 or newer. On arm64 Linux, use the x64 JVM and wrapper
described in [AGENTS.md](AGENTS.md#reseam-reseam).
In Manager, open **Settings → Patch sources → Add patch source**. For a local build, use the loopback URL below.
For the `patches.json` asset in the [latest release](https://github.com/edbfi/apk-patches/releases/latest), use
`https://github.com/edbfi/apk-patches/releases/latest/download/patches.json`.
Verify the displayed signer before adding the source. Use **Pick an APK** to open the version listed on the app page.

For a local preview, generate your own test signer and use its public key in Manager or the CLI.
`just reseam-check` verifies this flow with a temporary key. To keep a test bundle for manual use, run:

```sh
just reseam-build
mkdir -p tmp/reseam-preview
reseam bundle keygen --out tmp/reseam-preview/bundle.key
reseam bundle pubkey --key tmp/reseam-preview/bundle.key > tmp/reseam-preview/bundle.pub
reseam bundle sign --key tmp/reseam-preview/bundle.key \
  --out tmp/reseam-preview/edbfi-patches.reseam reseam/build/reseam/unsigned/edbfi-patches.reseam
```

For Manager, publish the test bundle to a local directory and serve it to an adb-connected device:

```sh
printf '%s\n' 'Local preview' > tmp/reseam-preview/notes.md
reseam release patches tmp/reseam-preview/edbfi-patches.reseam \
  --tag v0.0.0 --notes tmp/reseam-preview/notes.md \
  --to tmp/reseam-preview/site --public-url http://127.0.0.1:18765
adb reverse tcp:18765 tcp:18765
python3 -m http.server 18765 --bind 127.0.0.1 --directory tmp/reseam-preview/site
```

Add `http://127.0.0.1:18765/patches.json` in Manager and compare the displayed signer with
`tmp/reseam-preview/bundle.pub`. After testing, stop the server and run `adb reverse --remove tcp:18765`.
For an official bundle, compare the signer with `keys/reseam-signing.pub` in the matching release tag.

```sh
reseam patch app.apk --bundle tmp/reseam-preview/edbfi-patches.reseam \
  --trust "$(cat tmp/reseam-preview/bundle.pub)" --output patched.apk
```

Reseam Manager 1.0.1 requires Android 8.0 or later. The Sync and rif APKs produced by
Manager and CLI 1.0.1 use APK Signature Scheme v2 and require Android 7.0 or later.
To update an existing ECDSA P-256 installation, put its original key and certificate in a
password-protected PKCS#12 (`.p12`) file with a single private-key entry.
In Manager, use **Settings → Signing key → Import**. With the CLI, add
`--keystore signing.p12` to the command above and set `RESEAM_KEYSTORE_PASSWORD` to the
file's password.

For an existing RSA-signed installation, re-sign a copy of the output with its original
key and certificate.

For either signing key type, run the following command on the update and on a copy of the
installed APK. Verify that the signer certificate SHA-256 digests match before updating.

```sh
apksigner verify --min-sdk-version 24 --verbose --print-certs patched.apk
```

## Verify a download

The ReVanced and Morphe bundles are signed with the [public key](keys/release-signing.asc), fingerprint
`7B40 A51F C15C 376F 09D1  6979 893C 92F2 3E64 7FC8`.

- **ReVanced CLI** checks the `.rvp` with the command above.
- **Morphe Manager** and the **Morphe CLI** check the `.mpp` they download and remember its key. They won't install a
  later release signed by another key without asking you. In Morphe Manager, the source's **Signed by** reads
  `bb0f 2749 5a09 70ea`.
- **ReVanced Manager** doesn't check signatures.

To check a downloaded bundle yourself, download it and its `.asc` from a
[release](https://github.com/edbfi/apk-patches/releases), and the [public key](keys/release-signing.asc), then:

```sh
gpg --import release-signing.asc
gpg --verify patches-X.Y.Z.mpp.asc patches-X.Y.Z.mpp
gh attestation verify patches-X.Y.Z.mpp --repo edbfi/apk-patches
```

For the ReVanced bundle, use `.rvp` instead of `.mpp`. The last command needs the [GitHub CLI](https://cli.github.com).

## Report a problem

[Open an issue](https://github.com/edbfi/apk-patches/issues/new/choose) with the form that fits:

- **Patching fails**: patching stops, or the patched APK won't install.
- **Bug in a patched app**: the app misbehaves after patching.

Both forms ask which bundle you patched with and need a log; the form says where to find it.

Problems with ReVanced Manager, the ReVanced CLI or ReVanced's own patches go to
[ReVanced](https://github.com/ReVanced). Those with Morphe Manager, the Morphe CLI or Morphe's own patches go to
[Morphe](https://github.com/MorpheApp).

## Request a patch

Use the [Patch request](https://github.com/edbfi/apk-patches/issues/new?template=3-patch-request.yml) form for a new
app or one already supported. Select the editions you want the patch in.

## Contribute

Build commands, patch rules and commit conventions are in [AGENTS.md](AGENTS.md).

## License

Original code and artwork by edbfi are licensed under the [GNU Affero General Public License](LICENSE),
version 3 or (at your option) any later version (`AGPL-3.0-or-later`).

The vendored [REA skill](.agents/skills/reverse-engineer-anything.LICENSE) remains MIT-licensed. The Gradle
wrapper remains Apache-2.0-licensed, and dependencies retain their respective licenses.
