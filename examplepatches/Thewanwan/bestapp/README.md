<h1 align="center">
    Bestweb Patches for Weibo<br>
</h1>

## 🕹️ Usage

### Morphe Manager

Tap the link to add Bestweb as a patch source in Morphe Manager:

[**➕ Add Bestweb to Morphe**](https://morphe.software/add-source?github=Thewanwan/bestapp)

Then patch Weibo:

1. Tap Weibo app icon in Morphe
2. Download original APKM file from ApkMirror. Do *not* unspilt or modify the file, Morphe patches APKM directly
3. Wait for patching to complete, install

### Morphe CLI

```sh
java -jar cli.jar patch --patches bestweb.mpp input.apkm
```

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->

<!-- Do not modify this section by hand. The patch list is generated when release.yml creates a new release.

     If you wish for the patches list to be collapsed, then remove the word 'EXPANDED' from the comment tag above.

     If you wish to manually keep this list updated then remove the PATCHES_START and PATCHES_END
     comment blocks entirely. -->

#### A list of your patches will automatically be shown here after your first patches release is created.

&nbsp;

<!-- PATCHES_END -->

## 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop) like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Bestweb Patches are licensed under the [GNU General Public License v3.0](LICENSE)
