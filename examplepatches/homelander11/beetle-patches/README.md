# Beetle Patches

Custom Morphe patches for multiple Android apps.

## Add to Morphe Manager

[Add Beetle Patches to Morphe Manager](https://morphe.software/add-source?github=homelander11/beetle-patches)

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.3](https://github.com/homelander11/beetle-patches/releases/tag/v1.0.3)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 Slowly&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 9.5.6 | 9.5.8 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Slowly Pairip license check bypass](#slowly-pairip-license-check-bypass) | Disables Pairip's client-side installer and license enforcement. |  |
| [Slowly avatar builder items](#slowly-avatar-builder-items) | Enables Avatar Builder items marked as subscription-only without changing coin-priced item checks. |  |
| [Slowly extended Explore filters](#slowly-extended-explore-filters) | Enables verified client-side Explore filters, including Last online within 48 hours and New Members Only, and raises excluded-country and excluded-topic selection limits. |  |

</details>

<!-- PATCHES_END -->

## Development

Build the patch bundle with:

```shell
./gradlew buildAndroid
```

The generated MPP is written to `patches/build/libs/`.

Development happens on `dev`; verified changes are merged to `main` for stable releases.

## License

Beetle Patches is licensed under the [GNU General Public License v3.0](LICENSE).
