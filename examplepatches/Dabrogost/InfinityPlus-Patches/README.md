# Infinity+ Patches

A lightweight [Morphe](https://morphe.software/) patch bundle for **Infinity for Reddit+**, based on [Patcheddit](https://github.com/wchill/patcheddit) v1.4.0 and incorporating the Infinity+ 8.3.x compatibility change proposed in [PR #108](https://github.com/wchill/patcheddit/pull/108).

This project maintains only the Infinity+ patches, removing implementations for unrelated Reddit clients.

**Supported package:** `ml.docilealligator.infinityforreddit.plus` (Infinity+ only; not Patreon)  
**Suggested APK:** Infinity+ 8.3.4<br>
**GitHub repository:** [InfinityPlus-Patches](https://github.com/Dabrogost/InfinityPlus-Patches)  
**Gitea mirror:** [InfinityPlus-Patches](https://gitea.com/Dabrogost/InfinityPlus-Patches)

## Features

### Spoof client

Modifies the Reddit OAuth configuration used by Infinity+:

- **OAuth client ID:** Choose the RedReader preset or supply a custom 22-character client ID.
- **Redirect URI:** Defaults to `redreader://rr_oauth_redir`.
- **User agent:** Defaults to `org.quantumbadger.redreader/1.25.2`.
- **Infinity+ compatibility:** Includes subscription and OAuth login fixes for Infinity+ 8.3.4.
- **Attribution:** Adds Patcheddit's required attribution to the main Infinity+ Settings screen, with a link to the original project's subreddit.

### Modify login WebView

Retains Patcheddit's existing WebView compatibility hook.

Both patches retain the shared and Infinity+-specific extensions they require.

## Installation

### Add to Morphe Manager

[**Add Infinity+ Patches to Morphe Manager (GitHub one-click install)**](https://morphe.software/add-source?github=Dabrogost/InfinityPlus-Patches)

For manual installation, open **Morphe Manager → Sources → + → Remote**, then add either source URL:

**GitHub repository:**

```text
https://github.com/Dabrogost/InfinityPlus-Patches
```

**Gitea source:**

```text
https://gitea.com/api/v1/repos/Dabrogost/InfinityPlus-Patches/raw/patches-bundle.json
```

Tap **Add** and allow the patch bundle metadata to load.

The `patches-bundle.json` metadata points to a **GitHub-hosted `.mpp` release asset**. The GitHub **Publish Infinity+ source** workflow builds and publishes new bundles on GitHub, then updates this metadata to point to the GitHub release asset. Keep the Gitea mirror's metadata synchronized if using that source.

### Patch Infinity+

1. Obtain an unmodified **Infinity+** APK.
2. Select it in Morphe Manager.
3. Enable **Spoof client** and **Modify login WebView**.
4. Configure the **Spoof client** OAuth options.
5. Patch and sign the APK, then install it.
6. Authorize your Reddit account in Infinity+.

If Android rejects installation because the existing app has a different signing certificate, you may need to uninstall the previous installation first. Back up its data before doing so.

**This repository distributes patches, not a pre-patched Infinity+ APK.**

### Troubleshooting source updates

Gitea's HTTP caching can delay the appearance of newly published patch metadata in Morphe Manager.

If an older patch version remains visible after publication:

1. Open Android **Settings → Apps → Morphe Manager → Storage**.
2. Choose **Clear cache** (not **Clear data**).
3. Reopen Morphe Manager and refresh the source.

A cache refresh may help, but it cannot override caching performed by Gitea or other upstream servers.

## Reddit OAuth configuration

### RedReader preset

Select **RedReader (shared client ID)** in the OAuth client ID dropdown.

The preset is based on [Continuum's public implementation](https://github.com/cygnusx-1-org/continuum). You do not need RedReader installed to choose this preset. Reddit may display **RedReader** on its authorization page because that is the OAuth application identity, not because the RedReader app is installed.

**Important:** Public access to an OAuth client ID is not proof of permission from Reddit or RedReader to reuse it. Shared credentials may be restricted or revoked.

### Custom client ID

Enter your own valid 22-character Reddit OAuth client ID. The redirect URI must match your registered OAuth application's configuration, and the user agent must be appropriate for that client.

### Login limitations

- Reddit account authorization is still required.
- Successful APK patching does **not** guarantee successful Reddit OAuth login.
- Login behavior depends on Reddit's authorization service as well as the configured client ID, redirect URI, user agent, and WebView behavior.

## Compatibility and testing

Verified on **Infinity+ 8.3.3**, **Morphe Manager 1.35.0**, **patcher 1.15.1**, and **Android 16**:

- The patching and signing process completed successfully.
- The Patcheddit attribution appeared at the bottom of Infinity+'s main Settings screen.
- Selecting that attribution opened the Patcheddit subreddit within Infinity+.

**Limitations:**

- End-to-end Reddit login success is not established by these patching tests.
- The subscription fingerprints may change with future Infinity+ updates.
- Patreon and other Infinity variants are not supported by this patch bundle.

Report issues through [GitHub Issues](https://github.com/Dabrogost/InfinityPlus-Patches/issues).

## Building from source

### Requirements

- Linux or WSL2
- JDK 17
- Git
- Android SDK platforms 33, 34, 35 and 36
- Android SDK build-tools 36.0.0
- `ANDROID_HOME` configured

Clone the repository and build:

```bash
git clone https://github.com/Dabrogost/InfinityPlus-Patches.git
cd InfinityPlus-Patches
bash ci/build.sh
```

The resulting patch bundle is written to:

```text
patches/build/libs/patches-<version>.mpp
```

The build script compiles pinned public Morphe dependencies, installs them in an isolated Maven directory under `~/.cache/infinity-plus-deps`, and then builds the patch bundle. It does **not** require GitHub Packages credentials or `GH_PACKAGES_*` secrets. Public downloads from GitHub, Maven Central, Google, and JitPack are still needed.

See [ci/README.md](ci/README.md) for dependency versions, cache details, and maintenance instructions.

### Actions and publishing

The GitHub **Build Infinity+ patches** workflow runs on pushes to `main` and supports manual execution. It uses the `github-infinity` self-hosted runner and uploads the `.mpp` file as a workflow artifact.

To publish a new version, manually run the GitHub [**Publish Infinity+ source** workflow](.github/workflows/publish-infinity-source.yml) on `main`. It uses the `github-infinity` self-hosted runner to build the `.mpp` bundle, publishes a GitHub Release, and commits an updated `patches-bundle.json` pointing to the GitHub release asset. The separate **Build Infinity+ patches** workflow only uploads a workflow artifact and does not publish a new Morphe source version.

The patch source metadata is stored in [`patches-bundle.json`](patches-bundle.json), and the current version is controlled by the project build configuration.

## Project background

Patcheddit v1.4.0 supports multiple Reddit clients. Infinity+ 8.3.x changed its subscription activity implementation, which could cause the original **Spoof client** patch to fail during fingerprint matching.

This project incorporates the compatibility change proposed upstream while reducing the source to Infinity+ and preserving its necessary shared code.

Changes introduced beginning **October 11, 2026** include:

- Removed patches for other Reddit applications.
- Retained Infinity+-specific and shared extensions.
- Incorporated old and new Infinity+ subscription activity fingerprints.
- Added an optional RedReader OAuth client ID preset.
- Added Patcheddit attribution directly to Infinity+'s Settings screen.
- Established independent build and Gitea publishing tooling.

## Attribution and license

This project is derived from [Patcheddit](https://github.com/wchill/patcheddit), originally developed by **wchill** and contributors, and includes code associated with [Morphe](https://github.com/MorpheApp).

This app uses code from Patcheddit. To learn more, visit https://reddit.com/r/patcheddit

This app uses code from Morphe. To learn more, visit http://morphe.software

Licensed under the **GNU General Public License v3.0**, subject to applicable additional conditions under Section 7.

- [LICENSE](LICENSE) — GNU GPLv3
- [NOTICE](NOTICE) — additional licensing conditions
- [COPYRIGHT](COPYRIGHT) — original copyright notices
- [Morphe license notice](patches/src/main/resources/branding-license/LICENSE_MORPHE.TXT) — applicable Morphe licensing terms

Infinity+ Patches is independently maintained and is not affiliated with or endorsed by Reddit, RedReader, Infinity for Reddit, Patcheddit, or Morphe.
