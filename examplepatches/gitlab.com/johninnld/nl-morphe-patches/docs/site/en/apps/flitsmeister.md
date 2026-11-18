# Flitsmeister

**App version:** 14.17 · **Build:** 1287 · **Original file:** APKS

**Also supported:** 15.0/1289. APKM and APKS inputs must contain the complete split archive.

[Download retained 14.17 original](https://buzzheavier.com/1esn82va0l3d){ .md-button .md-button--primary }

[Install Flitsmeister for Android Auto: steps with screenshots](../guides/android-auto.md){ .md-button }

Select the exact original file in Morphe Manager. For 15.0, use the complete build 1289 archive; both inspected min-SDK 29 and 32 bundles are supported. The download above remains the supported 14.17 original.

[Set up Waze or Flitsmeister data in Google Maps and Vela Maps](../guides/navigation-data.md){ .md-button }

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Broadcast navigation data** | On | Shares current speed, effective limits, road alerts and approaching/active average-speed zones through the same local contract as Waze. No overlay required. |
| **Disable partner services** | On | Removes Parking, Toll and Carwash entries and related settings. |
| **Disable tracking** | On | Stops the supported optional usage statistics, advertising identifiers and diagnostics. |
| **Fix PairIP startup** | On | Lets the patched app start and use its supported features after installation. Keep this enabled. |
| **Guest mode** | On | Adds Continue as guest, lets you reopen without signing in, and hides the large account sign-up card. |
| **Hide Pro notices** | On | Hides automatic Pro/Plus offers, badges and Android Auto upgrade notices. |
| **Hide ads** | On | Removes commercial location-based promotions, their images and advertising notifications. In 15.0, hides unowned paid soundpack offers while keeping usable voice selection. Traffic warnings remain. |
| **Allow any Android Auto host** | On | Lets any Android Auto compatible host run Flitsmeister's car screens, such as Google's Android Auto, DriveDeck, Gearslip, MyCar, Flywheel, BetterAuto, AndroidAuto and AARE, whatever its package name or signing key. |
| **Unlock Pro** | On | Enables locally controlled Pro options. In 15.0, the menu avatar uses the native PRO badge as a cosmetic change. Features requiring account activation still depend on the service. |

## Advertising and tracking services

The ad and tracking controls cover the supported optional activity from: Firebase, Insider; automatic usage and location measurement; commercial location-based advertising.

Blocking measurement does not block every function from the same provider. Essential app services can still connect.

## Before using

The native FM event/speech upgrade remains a development feature. Flitsmeister 15.0 / 1289 has passed model/capture coverage checks, and earlier FM15 development builds passed controlled delivery, moving-camera and zone checks with both receivers. The current candidate includes later text, recovery and speech-readiness corrections; its final installed, timing and phone/car acceptance remain open. Its category/output review, parked preview and recovery controls are described in the [native-warning setup section](../guides/navigation-data.md#native-flitsmeister-warning-audio).

In Flitsmeister 15.0 the patch also lets a fixed camera you pass again be announced again after one minute instead of Flitsmeister's three; mobile traps and incidents are still announced once. Different cameras are never held back by each other. Maps and Vela receive the warnings Flitsmeister shows on its own screen, including ones it does not announce again, and the alert sound Flitsmeister chose for each announcement.

The recovered startup/native profile targets ARM64. On an Android 16 phone, map startup, HUD, icon changes/reopening, the profile badge and soundpack-offer removal have been checked. Backend entitlements and a physical Android Auto head unit remain separate checks.

Updated navigation-data patches start the selected provider without opening its screen after one-time setup. For Flitsmeister, update Maps or Vela too: the corrected handoff lets a visible receiving map start FM in the background with location access while using the app. This has been checked on an Android 14 emulator; the Android 16 phone check is pending. Always-on location is not a blanket requirement for this handoff. Keep the receiving map visible while selecting FM and check its source status. See the [navigation-data setup guide](../guides/navigation-data.md).

Flitsmeister also sends the start and end point of an average-speed check to Maps and Vela, so they can put its icon on the map: at the start while you approach, at the end once you are inside. Only those two points are sent, not the stretch between them.

**Broadcast navigation data** works while the driving/location service runs in the background, with location permission. The overlay can stay disabled. Compatible receivers use one common action and schema for Flitsmeister and Waze. Native candidates supply estimated pre-entry distance, and available camera, mobile-camera, police, hazard, crash, jam and closure reports can be shared. Averages cover only the observed part, and projected progress is marked as an estimate. [Shared broadcast contract](https://codeberg.org/JohninNL/nl-morphe-patches/src/branch/main/docs/navigation-broadcasts.md).

Navigation, live traffic/location exchange, accounts and reports still use online services. Unlock Pro does not activate backend services. For Android Auto, follow the [KingInstaller installation steps](../guides/android-auto.md).

Choose **Continue as guest** to finish onboarding without an account. Location permission remains your choice. Guest mode keeps optional login available and does not activate account services such as cloud history or parking. It does not repair Google sign-in or remove Android Auto's separate account requirement.

Guest entry and map access have been tested on one phone. Device testing of the sign-up card removal is pending.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
