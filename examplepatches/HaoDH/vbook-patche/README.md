# HaoDH vBook Patches

Custom Morphe patches for the authorized local vBook 1.2.5, 1.2.6, 1.2.7 and 1.2.9 test builds (`com.vbook.android`, original version codes 27, 28, 29 and 31).

**Android device behavior has not yet been verified end to end through Morphe. Use only published release artifacts whose build completed successfully.**

## Included patches

- **Local Premium state**: sets device-side Premium state for guest and signed-in flows.
- **Local installer test**: disables scheduling the startup Play installer gate in the local test build; retains null-context and isolated-process handling.

These patches do not grant server-side entitlements or forge Play Integrity tokens. Only vBook 1.2.5, 1.2.6, 1.2.7 and 1.2.9 are declared compatible. Obfuscated class names are version-specific; structural checks fail if the expected instructions are absent or ambiguous.

## Build

Use Java 21 and the official Gradle wrapper:

```sh
./gradlew :patches:buildAndroid
```

The official Morphe dependencies are hosted on GitHub Packages. Local builds need package-read credentials configured as described in the upstream template documentation. Do not commit tokens or send tokens in chat.

Output: `patches/build/libs/patches-*.mpp`.

The release workflow and generated metadata are inherited from the official Morphe template. Work on `dev`; release from `main` with semantic commit messages. Keep both branches available for the upstream backmerge workflow.

## Apply after a verified release exists

1. Add `https://github.com/HaoDH/vbook-patche` as a patch source in Morphe Manager.
2. Select the original, unmodified vBook 1.2.5, 1.2.6, 1.2.7 or 1.2.9 XAPK; do not use the prepatched test XAPK.
3. Select the required patches, build and install.

Morphe may sign with a different key from the previously supplied test XAPK. Import the existing signing key through supported Morphe settings if available, or back up your data before uninstalling the prior app. Never publish the app signing key, its password, or the original APK/XAPK in this repository.

## Scope and attribution

No APKs, user data, account tokens or signing keys are included. This is an independent project, not an official Morphe release. Based on the [official Morphe patches template](https://github.com/MorpheApp/morphe-patches-template); see `LICENSE` and `NOTICE`.

## Available patches

<!-- PATCHES_START -->
> **[v1.3.0](https://github.com/HaoDH/vbook-patche/releases/tag/v1.3.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 vBook&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `com.vbook.android`

**🎯 Supported versions:**

| 1.2.9 | 1.2.7 | 1.2.6 | 1.2.5 |
| :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Local Premium state](#local-premium-state) | Enable device-side Premium state for the authorized vBook 1.2.5, 1.2.6, 1.2.7 and 1.2.9 test builds. Server entitlements are unchanged. |  |
| [Local installer test](#local-installer-test) | Skip the Play installer gate in an authorized local test build. Does not change server integrity checks. |  |

</details>

<!-- PATCHES_END -->
