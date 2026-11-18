# Fennec

Give Fennec, the F-Droid build of Firefox, the Firefox name and launcher icon.

**App version:** 159.0.1 · **Build:** 1590120 · **Original file:** APK

[Use your original APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Download the Fennec APK for your phone's processor from [F-Droid](https://f-droid.org/packages/org.mozilla.fennec_fdroid/); F-Droid publishes each version as separate builds with their own build numbers. **Custom branding** is compatible with every Fennec version: it only changes the app's name and launcher icon in the manifest and adds its own icon resources, so new releases need no patch update. The version above is the reference input. Fennec is built by [relan/fennecbuild](https://gitlab.com/relan/fennecbuild) from Mozilla's Firefox source (MPL-2.0).

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Custom branding** | On | Renames Fennec to Firefox and sets the Firefox launcher icon. The name and icon can be changed. |

## Advertising and tracking services

This patch changes only the app name and launcher icon. Fennec's features, add-ons, permissions and network behaviour are unchanged.

## Before using

**Custom branding** has an **App name** field, prefilled with Firefox, and an **App icon** dropdown: Original Fennec or Firefox (the Firefox logo on white, default). Clear the name to keep Fennec's own name. The Firefox icon is an adaptive icon; its monochrome layer for themed icons shows the fox around the globe. Changing the name or icon requires patching again.

The new name appears in the launcher, recent apps, the default-browser choice and Android app information. Fennec's own screens, notifications and download folders keep the Fennec name. Fennec's own **App icon** setting still works: choosing one of its alternative icons replaces the Firefox icon until you choose the default again.

Fennec is not affiliated with Mozilla. Mozilla and Firefox are trademarks of the Mozilla Foundation. The icon is user-selected launcher artwork for your own device and does not turn Fennec into Mozilla's app.

A patched APK must be signed again. A Fennec installation from F-Droid cannot be updated with a different signing key, so remove it first or install the patched copy on a device without it.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
