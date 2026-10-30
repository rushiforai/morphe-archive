# Patch a supported app

A patch changes parts of an app's installation file. Morphe Manager applies those changes and creates an APK you can install. This repository supplies the patches; you supply the original app files.

## 1. Check your app version

[Download the original file for your app](downloads.md).

Find your app in the [app directory](../apps/index.md). Match its exact version and build number. A newer version of the same app can have different code. Do not assume a patch will work on another build.

Some apps use a split APK set: a base file plus files for your phone's processor, language or screen. Use the complete set specified on the app page. Missing files can prevent installation or leave parts of the app missing.

## 2. Add the patch source

Open [Add to Morphe](https://morphe.software/add-source?github=johnneerdael/dutch-applications-patches) on the device where you use Morphe Manager. Confirm that the source refers to `johnneerdael/dutch-applications-patches`.

Leave Use pre-release patches off for stable releases. Development builds come from `dev` and are intended for testing. The [release notes](https://github.com/johnneerdael/dutch-applications-patches/releases) list the patch bundle versions. The bundle has its own version, separate from the app version.

### Test a development build

1. Open **Sources** in Morphe Manager and expand **Dutch App Patches** (`johnneerdael/dutch-applications-patches`).
2. Enable the source's **Pre-release patches** toggle. Some Manager versions call it **Use pre-release patches**. This is per source; the Manager app's own prerelease-update setting can stay off.
3. Tap the source card's **Update** button (the circular arrow). Check its **Version**: a development bundle contains `-dev.`. If it still shows a stable version, refresh that source again before patching.
4. Select your original app file and follow its guide. For [Videoland Android TV](../apps/videoland-android-tv.md), choose the exact TV APKS. **Hide ads** and **Disable tracking** are recommended/default on, so Simple mode applies both. Keep both enabled if you customize the selection. If the app is missing, open the source card's **Apps** list and enable it.

We welcome both successful tests and reproducible failures. [Report your results](https://github.com/johnneerdael/dutch-applications-patches/issues/new/choose) with the app/build, bundle version, chosen controls, subscription tier where relevant, device/Android version and steps. For Videoland, use the [test feedback form](https://github.com/johnneerdael/dutch-applications-patches/issues/new?template=videoland_test.yml); feedback from the paid ad-supported tier is particularly useful. Keep credentials, tokens and identifying logs out of reports.

To return to stable patches, disable **Pre-release patches** for this source and tap **Update**. Switching the source does not replace an already installed patched app; rebuild from the original app files if you want to replace it. Keep your signing key and a working installer for updates.

[Morphe's patch-source documentation](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patch-sources.md) explains the source controls.

## 3. Select and apply patches

Select the original APK or complete split set, review the available patches and follow Manager's patching process. [Choosing patches](choose-patches.md) explains the differences between hiding ads, stopping collection and skipping a prompt. Manager can automatically include other components that the selected patch needs.

Read the patch report before installing. If a patch fails or is incompatible, check the app files you selected. Do not assume part of the protection worked.

## 4. Install and check the result

The patched app has a different signing key from the publisher's app. Android normally cannot install one over the other. Updates between patched builds also require matching signing keys.

Save important data before replacing an installation.

After installation, check startup and the features you use: weather, maps, articles, audio or alerts. If audio plays or a banner disappears, you have checked that feature. You have not yet established which network requests the app sent. [Read the evidence guide](../reference/methodology.md).
