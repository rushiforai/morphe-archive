# Troubleshooting

## The app is missing or patching fails

Match the version and build on the [app page](../apps/index.md). Select the complete original file or split archive. Phone and Android TV builds are separate. Update the source in Manager and check whether the required bundle is available.

Check the [release list](https://github.com/johninnl/nl-morphe-patches/releases) if Manager cannot find a bundle. A source needs a published bundle before Manager can download its patches.

## Android refuses installation

Save the exact installer error. The publisher app and a patched app normally use different signing keys; Android cannot update between them. Back up important data before replacing an installation. Future patched updates need the same signing key to retain data.

## Alerts, login or playback behave differently

Check the selected patches and the tradeoffs on the app page. Optional Swrve patches disable push alerts. Skipping notification setup can require manual opt-in. Marktplaats security profiling controls may affect login or payment. Keep compatibility fixes enabled.

For Flitsmeister Android Auto, follow the [KingInstaller installation steps](android-auto.md).

## An advertisement or network connection remains

Some ads are part of the programme or stream. Tracking controls also keep necessary content, account, payment and notification services available. A provider’s name alone does not identify why the app connected to it.

## Report a problem

Open an [issue](https://github.com/johninnl/nl-morphe-patches/issues) with the app version/build, bundle version, selected patches, device/Android version, exact error and steps to reproduce. Remove credentials and personal data from anything shared.
