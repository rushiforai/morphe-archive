# Vela Maps

**App version:** 0.5.2621 · **Build:** 46210 · **Original file:** APK

[Download APK](https://buzzheavier.com/64jger382td4){ .md-button .md-button--primary }

Select the complete original APK for this exact version in Morphe Manager.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **External speed controls** | On | Adds De-Waze and Flitsmeister as speed/road-warning providers in Vela and Android Auto, with compact speed, limit, partial-average and advance-warning details. |

## Advertising and tracking services

This patch adds no separate account, advertising service or telemetry upload. The selected provider continues using its own maps, traffic/location exchange and reporting services. Vela keeps its existing online and location behavior.

Road-warning reports can include camera/incident positions. The integration receives them locally from the provider on the same device; it does not export Vela's device location to the provider.

## Before using

Patch [Waze 5.26.90.901](waze.md) or [Flitsmeister 14.17](flitsmeister.md) with **Broadcast navigation data**, open it once and allow its background location/driving service to remain running. Its overlay can stay off. The provider patch's optional **Receiver package** can be set to `app.vela`. Android 14 and newer allow Vela to verify the sending provider through Android; older versions lack that sender verification.

In Vela's navigation settings, open **Speed and road alerts** and choose **Vela (native data)**, **De-Waze** or **Flitsmeister**. The choice is saved. The same choice is available under **Navigation provider** in Android Auto settings. **Spoken road warnings** follows Vela's voice/mute settings; car details have their own switch.

With an external provider selected, the compact map display keeps current speed beside the speed-limit sign. An active average-speed zone adds the observed average, a progress bar, percentage and remaining distance below it. Averages cover only the observed portion, including when the provider is opened mid-zone. The average stays unknown until enough distance/time has been observed; approximate progress is marked with **≈**. Advance warnings use real pre-entry observations or fresh report positions. Available reports include static/mobile cameras, police, hazards, crashes, jams, closures and enabled provider Flock cameras. Coverage depends on the provider; estimated distances remain approximate.

Missing or expired values use Vela's own data where available. The provider status identifies fallback, and an unavailable current speed shows **—**. Changing provider, leaving a zone or losing its fresh observations removes that partial average. Data from the two providers is kept separate.

When an external provider is selected, Vela temporarily pauses its own Flock display and alerts while **either** supported provider supplies fresh usable data. The pause can continue if the selected provider becomes unavailable but the other one is still advertising. Saved Flock preferences stay intact. When neither supplies fresh usable data, Vela's own Flock behavior resumes according to those saved choices; selecting **Vela (native data)** also restores normal behavior.

Phone settings, background reception, compact phone/car rendering and advance speech were checked on an Android 16 emulator using Gearslip as the car host. Physical driving, a physical head unit and Google’s Android Auto host have not been validated. An already-started native Flock refresh can finish while its display and alerts are paused.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
