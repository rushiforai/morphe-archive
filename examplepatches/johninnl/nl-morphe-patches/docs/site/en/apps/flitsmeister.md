# Flitsmeister

**App version:** 14.17 · **Build:** 1287 · **Original file:** APKS

[Download original app](https://buzzheavier.com/1esn82va0l3d){ .md-button .md-button--primary }

[Install Flitsmeister for Android Auto: steps with screenshots](../guides/android-auto.md){ .md-button }

Select the exact original file in Morphe Manager. Use the complete archive for a split app.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Broadcast navigation data** | On | Shares current speed, effective limits, road alerts and approaching/active average-speed zones through the same local contract as Waze. No overlay required. |
| **Disable partner services** | On | Removes Parking, Toll and Carwash entries and related settings. |
| **Disable tracking** | On | Stops the supported optional usage statistics, advertising identifiers and diagnostics. |
| **Fix PairIP startup** | On | Lets the patched app start and use its supported features after installation. Keep this enabled. |
| **Guest mode** | On | Adds Continue as guest, lets you reopen without signing in, and hides the large account sign-up card. |
| **Hide Pro notices** | On | Hides automatic Pro/Plus offers, badges and Android Auto upgrade notices. |
| **Hide ads** | On | Removes commercial location-based promotions, their images and advertising notifications. Traffic warnings remain. |
| **Unlock Pro** | On | Enables locally controlled Pro options. Features requiring account activation still depend on the service. |

## Advertising and tracking services

The ad and tracking controls cover the supported optional activity from: Firebase, Insider; automatic usage and location measurement; commercial location-based advertising.

Blocking measurement does not block every function from the same provider. Essential app services can still connect.

## Before using

**Broadcast navigation data** works while the driving/location service runs in the background, with location permission. The overlay can stay disabled. Compatible receivers use one common action and schema for Flitsmeister and Waze. Native candidates supply estimated pre-entry distance, and available camera, mobile-camera, police, hazard, crash, jam and closure reports can be shared. Averages cover only the observed part, and projected progress is marked as an estimate. [Shared broadcast contract](https://github.com/johninnl/nl-morphe-patches/blob/main/docs/navigation-broadcasts.md).

Navigation, live traffic/location exchange, accounts and reports still use online services. Unlock Pro does not activate backend services. For Android Auto, follow the [KingInstaller installation steps](../guides/android-auto.md).

Choose **Continue as guest** to finish onboarding without an account. Location permission remains your choice. Guest mode keeps optional login available and does not activate account services such as cloud history or parking. It does not repair Google sign-in or remove Android Auto's separate account requirement.

Guest entry and map access have been tested on one phone. Device testing of the sign-up card removal is pending.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
