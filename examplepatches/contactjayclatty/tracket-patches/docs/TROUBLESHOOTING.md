# Compatibility & troubleshooting

[← Back to the project overview](../README.md) · [Technical reference](TECHNICAL.md) · [Release maintenance](MAINTAINING.md)

This page documents the **known constraints of the v1.0.1 patch bundle**. It is not a guarantee of installation or premium access.

## Compatibility matrix

| Component | Supported / documented |
| :-- | :-- |
| Android app | Tracket (`com.tracket.app`) |
| App version | **0.9.38**, `versionCode 237` |
| Published patch | **Unlock lifetime** |
| Bundle | `patches-1.0.1.mpp` |
| Patch framework | Morphe Manager or desktop CLI |
| Desktop CLI version in project documentation | **1.18.1** |
| Desktop bytecode mode used for verification | `FULL` |
| Other Tracket versions | **Not supported by this release** |

## Before reporting a problem

Check the following details first:

- Does the APK identify itself as the **stock Tracket 0.9.38**, versionCode **237**?
- Are you using the bundle from the repository's [v1.0.1 release](https://github.com/contactjayclatty/tracket-patches/releases/tag/v1.0.1) or the matching local `dist` file?
- Are you using Morphe Manager or the documented desktop CLI version?
- Did Morphe report a patcher failure, or did a modified application fail only **after** patching? Those are different failure classes.
- Do you have a backup of any app data that matters to you?

> [!CAUTION]
> APK modifications and re-signing can interfere with updates, data access, or startup behavior. Do not disable Android security protections to make a modified APK install. For reliable purchases and support, use the official Tracket release.

## Symptom guide

<details>
<summary><strong>The patch is missing from Morphe Manager</strong></summary>

Ensure the GitHub source points to `github.com/contactjayclatty/tracket-patches` and that `patches-bundle.json` is reachable on the source's main branch. Remote-source metadata and a local `.mpp` import are different workflows; a local import does not automatically follow future repository releases.

</details>

<details>
<summary><strong>My Tracket version is rejected</strong></summary>

This release is pinned to **0.9.38**. Rejection of other versions is an intentional compatibility guard, not a claim that the same patch works elsewhere. Do not assume obfuscated classes or bytecode signatures are interchangeable across versions.

</details>

<details>
<summary><strong>Morphe says the grant or license method was not found</strong></summary>

The implementation deliberately fails when a required 0.9.38 fingerprint or class is absent. Check the app version and whether the APK is an unmodified stock build. See the [technical notes](TECHNICAL.md#obfuscation-and-compatibility) for why method and helper names are version-sensitive.

</details>

<details>
<summary><strong>Morphe reports success but the app will not launch</strong></summary>

A patcher success message only confirms that the patch step completed. It does not establish device compatibility or successful runtime execution. Keep the full non-sensitive error log and note the OS version, device model, app version, and CLI/Manager version when reporting an issue. Use the official app if a modified build fails.

</details>

<details>
<summary><strong>The app still refuses premium features</strong></summary>

The published patch affects on-device logic only. It cannot create a verified Google Play purchase token and cannot override account decisions enforced by Tracket's servers. A legitimate subscription or purchase through the official app is the supported way to obtain paid access.

</details>

<details>
<summary><strong>The local bundle works differently from the remote source</strong></summary>

A **local** import stays pinned to the imported file. A **remote** GitHub source uses `patches-bundle.json` to identify the advertised release and asset. Check that you're comparing the same bundle version.

</details>

<details>
<summary><strong>The PowerShell build cannot find Java or Morphe</strong></summary>

The project's `build.ps1` expects a JDK **17+** containing `javac` and `jar`, along with Morphe desktop CLI **1.18.1**. Set `MORPHE_JAR` to the existing `morphe-desktop-1.18.1-all.jar` file and check `JAVA_HOME` if Java is not on the path. Run the script with PowerShell (`pwsh`).

</details>

## Reporting an issue

Open a [GitHub issue](https://github.com/contactjayclatty/tracket-patches/issues/new) with:

```text
Summary:
Expected behavior:
Observed behavior:

Tracket version / versionCode:
Morphe Manager or CLI version:
Bundle version:
Android version (if applicable):
Patch log excerpt (remove private data):
Reproduction steps:
```

**Do not post** passwords, access tokens, purchase receipts, device identifiers, email addresses, private log contents, or other sensitive data.

## What this project cannot promise

- No support for builds other than Tracket 0.9.38.
- No guarantee that Tracket servers accept a local entitlement.
- No guarantee that a re-signed APK works on every Android device.
- No guarantee that future Morphe releases behave like the documented 1.18.1 release.

For billing and official product support, go to the [Tracket Google Play listing](https://play.google.com/store/apps/details?id=com.tracket.app).

---

[Project overview](../README.md) · [Technical reference](TECHNICAL.md)
## Manager cannot load bundle 1.0.0

Version 1.0.0 contains Java classes but no Android DEX and lacks bundle name/version metadata. Use 1.0.1 or newer. Refresh the remote source; if it remains on the old artifact, remove and re-add it. For local sources, import the new `.mpp` manually. The 1.0.1 DEX was loaded successfully by Manager 2.3.0's patcher on Android 35; patched-app runtime behavior is a separate test.

## Remote source remains Unnamed

Use Sources → + → Remote with this exact metadata URL:

```text
https://raw.githubusercontent.com/contactjayclatty/tracket-patches/main/patches-bundle.json
```

A user confirmed both local 1.0.1 import and remote import using this URL work. The repository shortcut/deep link failed in that user's earlier setup; its exact cause is not independently established. Current Manager source normalizes the bare repository URL to the same metadata endpoint, so do not claim a confirmed repository-routing bug. The README and website now recommend the explicit URL and their setup buttons open a page with a Copy URL button. Automatic updates remain supported. Delete only an older failed source before re-adding; do not reset Manager data.

Verify the resulting card shows Tracket Patches, 1.0.1, and 1 patch. If it fails, record Manager version, exact source URL, and the source error log. See [setup instructions](https://contactjayclatty.github.io/tracket-patches/docs/#add-source).
