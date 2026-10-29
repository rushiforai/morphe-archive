# Patch a supported app

A patch changes parts of an app's installation file. Morphe Manager applies those changes and creates an APK you can install. This repository supplies the patches; you supply the original app files.

## 1. Check your app version

[Download the original file for your app](downloads.md).

Find your app in the [app directory](../apps/index.md). Match its exact version and build number. A newer version of the same app can have different code. Do not assume a patch will work on another build.

Some apps use a split APK set: a base file plus files for your phone's processor, language or screen. Use the complete set specified on the app page. Missing files can prevent installation or leave parts of the app missing.

## 2. Add the patch source

Open [Add to Morphe](https://morphe.software/add-source?github=johnneerdael/dutch-applications-patches) on the device where you use Morphe Manager. Confirm that the source refers to `johnneerdael/dutch-applications-patches`.

Leave Use pre-release patches off for stable releases. Development builds come from `dev` and are intended for testing. The [release notes](https://github.com/johnneerdael/dutch-applications-patches/releases) list the patch bundle versions. The bundle has its own version, separate from the app version.

## 3. Select and apply patches

Select the original APK or complete split set, review the available patches and follow Manager's patching process. [Choosing patches](choose-patches.md) explains the differences between hiding ads, stopping collection and skipping a prompt. Manager can automatically include other components that the selected patch needs.

Read the patch report before installing. If a patch fails or is incompatible, check the app files you selected. Do not assume part of the protection worked.

## 4. Install and check the result

The patched app has a different signing key from the publisher's app. Android normally cannot install one over the other. Updates between patched builds also require matching signing keys.

Save important data before replacing an installation.

After installation, check startup and the features you use: weather, maps, articles, audio or alerts. If audio plays or a banner disappears, you have checked that feature. You have not yet established which network requests the app sent. [Read the evidence guide](../reference/methodology.md).
