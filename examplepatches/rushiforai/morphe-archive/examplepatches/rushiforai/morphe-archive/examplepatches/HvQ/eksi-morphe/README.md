# Ekşi Morphe

Morphe patch source for Ekşi Sözlük.

## Patches

- **Hide ads**: removes Ekşi Sözlük ad placements and disables ad loading.

## Supported App

- Package: `com.eksiteknoloji.eksisozluk`
- Version: unpinned, tested on `2.4.9`
- APK type: regular APK

## Morphe Manager Source

[![Add this source to Morphe](assets/add-button.png)](https://morphe.software/add-source?github=HvQ%2Feksi-morphe&name=Ek%C5%9Fi%20Morphe)

[Add this source to Morphe](https://morphe.software/add-source?github=HvQ%2Feksi-morphe&name=Ek%C5%9Fi%20Morphe)

Open the link on your Android device and tap **Open in Morphe**.

Manual source URL:

```text
https://raw.githubusercontent.com/HvQ/eksi-morphe/main/patches-bundle.json
```

Then select the original Ekşi Sözlük APK and apply the `Hide ads` patch.

## Local Build

This repo uses Morphe's Gradle plugin and libraries as sibling composite builds.

```powershell
git clone https://github.com/HvQ/eksi-morphe.git
git clone https://github.com/MorpheApp/morphe-patches-gradle-plugin.git
git clone https://github.com/MorpheApp/morphe-patcher.git
git clone https://github.com/MorpheApp/morphe-patches-library.git

cd eksi-morphe
$env:GITHUB_ACTOR = "local"
$env:GITHUB_TOKEN = "local"
.\gradlew.bat --no-parallel :patches:buildAndroid :patches:generatePatchesList
```

The generated patch bundle is written to `patches/build/libs/patches-<version>.mpp`.
