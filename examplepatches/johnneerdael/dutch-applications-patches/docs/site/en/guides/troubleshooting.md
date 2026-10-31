# Find the cause of a problem

## The app is not offered, or patching fails

Compare the package name, app version and build number with the [supported app page](../apps/index.md). Check whether you need a complete split set and have selected all of it. Record the patch bundle version and whether pre-releases are enabled. A patch for an older app version will not automatically work on a newer one.

## Android will not install the result

Android can refuse an update if the installed app and the new APK were signed with different keys. This can happen with the original publisher app or a build signed elsewhere. Record the exact installer error. Save important data before replacing an installation. Do not start troubleshooting by clearing data.

## The app is missing from Android Auto

Use the [Android Auto installation guide](android-auto.md), with links to Shizuku and KingInstaller. The tested Flitsmeister repair is to select external KingInstaller in Morphe, enable Shizuku inside KingInstaller, tap **Install as king**, and confirm **Update**. Morphe's built-in installer choices and Android Auto's Unknown sources checkbox did not solve the tested case. Keep your signing key and update without uninstalling.

## Maps, alerts or audio fail

Check the app page for services that keep running. Buienradar's optional Swrve patch deliberately disables alerts. In [RTL Nieuws](../apps/rtl-nieuws.md), Disable Swrve (expert) disables push notifications and Swrve channel synchronisation. The standard controls keep those functions available. On a fresh installation with Skip consent screens, you enable notifications yourself; existing choices remain.

If [Omroep Brabant](../apps/omroep-brabant.md) no longer asks for notification permission at startup, open its notification settings yourself. Skip consent screens deliberately prevents that automatic request; it does not grant permission.

Whether maps work depends on the settings of the supported release. Coordinating playback may still need the original server requests. Do not block a hostname just because you do not recognise it.

## I still see a service in a network tool

Identify the destination, request time and action that triggered it. A request might fetch configuration, register push notifications, load an article or upload analytics. The name "Firebase" or a matching domain does not tell you what the request was for. [How to interpret evidence](../reference/methodology.md).

## Report something useful

Open an [issue](https://github.com/johnneerdael/dutch-applications-patches/issues) with the app version and build, patch bundle version, selected options and Android version. Describe your steps and include the exact error. Remove tokens, account details, precise coordinates and URLs that could identify you from logs. Say whether a finding came from app code, a DNS record or an inspected request. This helps show what you were able to establish.
