# Atharv Patches

Patch bundle and release metadata for supported Android applications.

## Patch catalog

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/madhu-gowda6/atharv-patches/releases/tag/v1.0.0)** &middot; `main` &middot; 2 patches total

<details open>
<summary>Ola Electric &middot; 2 patches</summary>

**Supported versions:**

| 5.4.0 |
| :---: |

| Patch | Description | Options |
| --- | --- | --- |
| [Force enable Megaphone, Tamper Detection, Krutrim and Kruti](#force-enable-megaphone-tamper-detection-krutrim-and-kruti) | Forces the Megaphone, Tamper & Fall Detection, Krutrim Assistant, and Kruti features to always report as available, regardless of the server-driven onboarding feature flags returned by the app's backend. |  |
| [High quality document upload](#high-quality-document-upload) | Raises the JPEG re-encode quality used by the camera capture-with-compression flow from 0 to 100, and raises the 6MB per-file size limit enforced on document uploads to 100MB, so scanned documents and high-resolution photos are no longer degraded or rejected before upload. |  |

</details>
<!-- PATCHES_END -->

## Download

- [Patch list](patches-list.json) contains compatibility, version, and option metadata.
- [Patch bundle metadata](patches-bundle.json) points clients to the latest MPP release.
- Published MPP files are attached to [GitHub Releases](https://github.com/madhu-gowda6/atharv-patches/releases).

## Local build

```bash
./gradlew :patches:buildAndroid :patches:generatePatchesList
python3 scripts/generate_patches_readme.py madhu-gowda6/atharv-patches main patches-list.json README.md
```

The release workflow builds with Java 17 and Android SDK 36. Gradle Package Registry credentials are read from the `GPR_USER` and `GPR_KEY` GitHub Actions secrets, with the workflow token used as a fallback.
