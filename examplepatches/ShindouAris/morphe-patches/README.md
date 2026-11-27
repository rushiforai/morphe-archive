# ShindouAris Patches

Patches for Google Maps, for use with [Morphe Manager](https://morphe.software).

## About

Privacy, de-Googling and UI patches for Google Maps. The Maps patches are based on the
[Ungoogled Maps patches by bearinmindcat](https://github.com/bearinmindcat/morphe-patches)
(see [Credits](#credits)), with some removed and some added.

Pinned to Google Maps **26.44.06.1006895251** (APKM from APKMirror). The classes these patches
target are obfuscated and renamed on every build, so other versions are not expected to work.

### How to use these patches

Add this repo URL to Morphe Manager: https://github.com/ShindouAris/morphe-patches

<a href="https://morphe.software/add-source?github=ShindouAris/morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## Patches list

<!-- PATCHES_START -->
> **[v1.3.0](https://github.com/ShindouAris/morphe-patches/releases/tag/v1.3.0)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**31 patches** across **1 app**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**Google Maps**](PATCHES.md#google-maps-comgoogleandroidappsmaps) | 31 | `26.44.06.1006895251` | [`com.google.android.apps.maps`](https://play.google.com/store/apps/details?id=com.google.android.apps.maps) |
<!-- PATCHES_END -->

&nbsp;

## Credits

The Maps patches and the extension code under `patches/src/main/kotlin/org/ungoogled/patches/maps/`
and `extensions/extension/` come from **[bearinmindcat/morphe-patches](https://github.com/bearinmindcat/morphe-patches)**
by **bearinmindcat**, licensed under GPLv3. The original code keeps its original package name
(`org.ungoogled`). Changes made in this repository are listed in the git history.

bearinmindcat's patches in turn follow earlier work, which stays credited where it is used:

- the microG support patches follow the GmsCore support patches of ReVanced / Morphe and
  [fangkampanat/gmaps-patches](https://github.com/fangkampanat/gmaps-patches) (GPLv3).

Built on the [Morphe](https://morphe.software) patcher and [patches template](https://github.com/MorpheApp/morphe-patches-template).
This project is not made by or affiliated with Morphe.

## License

[GNU General Public License v3.0](LICENSE). See [NOTICE](NOTICE) for the Morphe name restriction.
