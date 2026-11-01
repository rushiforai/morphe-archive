# Install patches

Morphe Manager applies this source’s published patch bundles to your original app files.

## 1. Get the right original app

Find your app in the [app directory](../apps/index.md) and [download its original file](downloads.md). Match both the version and build. Use the complete APKS or APKM archive for split apps. Phone and Android TV versions are separate targets.

## 2. Add the patch source

Install [Morphe Manager](https://morphe.software/), then open [Add to Morphe](https://morphe.software/add-source?github=johninnl/nl-morphe-patches). Check that the source is `johninnl/nl-morphe-patches`.

Tap the source’s **Update** button to get its latest published patch bundle. Check the bundle version before patching. A bundle version is separate from the app version.

## 3. Apply patches

Select the original app file, review the patch choices and apply them. Start with the default selection and read the [app page](../apps/index.md) for any feature tradeoffs. Manager may include other patches required by your choices.

If a patch fails, check the original file and compatibility message before installing the result.

## 4. Install and update

Save important app data first. Android usually cannot replace the publisher's app with a patched app because they use different signing keys. Removing the installed app can delete its data.

Use the same signing key for future patched updates, and keep a working installer. Updating the patch source does not change an app already installed; patch the original file again to update it.

Check startup and the features you use, such as playback, maps, login or alerts. [Troubleshooting](troubleshooting.md) explains common problems.

For Flitsmeister in the car, follow the [Android Auto installer steps](android-auto.md). For privileged installation tools, see [Shizuku](shizuku.md) or [Android TV setup](shizuku-tv.md).
