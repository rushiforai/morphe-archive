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

Each release has two bundles: one for [ReVanced](https://revanced.app) and one for [Morphe](https://morphe.software).

## Supported apps

| App | Package | ReVanced | Morphe |
| --- | --- | --- | --- |
| rif is fun | `com.andrewshu.android.reddit` | [12 patches](docs/revanced/rifisfun.md) | [12 patches](docs/morphe/rifisfun.md) |
| Sync for Reddit | `com.laurencedawson.reddit_sync` | [15 patches](docs/revanced/syncforreddit.md) | [15 patches](docs/morphe/syncforreddit.md) |

Each link opens that bundle's page for the app: its patches, options, known issues and tested version. The two bundles
are built from separate code, so their patches can differ.

**Patch the tested version.** ReVanced Manager and both CLIs skip these patches on other versions unless you force
them, and Morphe Manager asks you to confirm. Other versions are untested.

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

## Verify a download

Both bundles are signed with the [public key](keys/release-signing.asc), fingerprint
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

Use the [Patch request](https://github.com/edbfi/apk-patches/issues/new?template=3-patch-request.yml) form, for a new
app or one already supported, and say which bundle you want it in: ReVanced, Morphe or both.

## Contribute

Build commands, patch rules and commit conventions are in [AGENTS.md](AGENTS.md).

## License

Original code and artwork by edbfi are licensed under the [GNU Affero General Public License](LICENSE),
version 3 or (at your option) any later version (`AGPL-3.0-or-later`).

The vendored [REA skill](.agents/skills/reverse-engineer-anything.LICENSE) remains MIT-licensed. The Gradle
wrapper remains Apache-2.0-licensed, and dependencies retain their respective licenses.
