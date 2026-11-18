# Vela Maps

**App version:** 0.5.2621 · **Build:** 46210 · **Original file:** APK

[Download APK](https://buzzheavier.com/64jger382td4){ .md-button .md-button--primary }

Select the complete original APK for this exact version in Morphe Manager.

Use patched Waze or Flitsmeister as a local source for current speed, limits and available road warnings while Vela handles your route. The provider can remain in the background with its overlay off.

[Set up Waze or Flitsmeister data in Google Maps and Vela Maps](../guides/navigation-data.md){ .md-button }

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Receive alerts from a third-party application** | On | Receives speed, limits, road warnings and partial-average zones from a third-party app in Vela and on Android Auto, with compact speed, limit, partial-average and advance-warning details. Today it supports the patched De-Waze and Flitsmeister from these patches; the provider interface is built to take more apps. |

## Advertising and tracking services

This patch adds no separate account, advertising service or telemetry upload. The selected provider continues using its own maps, traffic/location exchange and reporting services. Vela keeps its existing online and location behavior.

Road-warning reports can include camera/incident positions. The integration receives them locally from the provider on the same device; it does not export Vela's device location to the provider.

## Before using

**Known limitation in this release:** external Waze/Flitsmeister warning cards and spoken alerts during Android Auto navigation are still experimental. Native navigation, provider data and a successful parked preview do not prove that every warning will appear or speak. Keep using the provider’s own alerts where you need dependable warning output. Repatch the provider and receiving map together for the updated connection and shutdown behavior.

The native FM event/speech upgrade remains a development feature. Flitsmeister 15.0 / 1289 has passed model/capture coverage checks, and earlier FM15 development builds passed controlled delivery, moving-camera and zone checks with both receivers. The current candidate includes later text, recovery and speech-readiness corrections; its final installed, timing and phone/car acceptance remain open. Its category/output review, parked preview and recovery controls are described in the [native-warning setup section](../guides/navigation-data.md#native-flitsmeister-warning-audio).

Updated navigation-data patches start the selected provider without opening its screen after one-time setup. For Flitsmeister, update Maps or Vela too: the corrected handoff lets a visible receiving map start FM in the background with location access while using the app. This has been checked on an Android 14 emulator; the Android 16 phone check is pending. Always-on location is not a blanket requirement for this handoff. Keep the receiving map visible while selecting FM and check its source status. See the [navigation-data setup guide](../guides/navigation-data.md).

Patch [a supported Waze version](waze.md) or [Flitsmeister 14.17 or 15.0](flitsmeister.md) with **Broadcast navigation data**, complete its first-run setup and grant its driving service location access once. Updated patches start its engine automatically when Vela needs it. Its overlay can stay off. The provider patch's optional **Receiver package** can be set to `app.vela`. Android 14 and newer verify the sender of shared broadcast updates; older versions lack that broadcast-sender check. The separate native FM warning channel authenticates both apps through Binder on all supported Android versions.

In Vela's navigation settings, open **Speed and road alerts** and choose **Vela (native data)**, **De-Waze** or **Flitsmeister**. The choice is saved. The same choice is available under **Navigation provider** in Android Auto settings. **Spoken road warnings** follows Vela's voice/mute settings; car details have their own switch.

On the phone, with an external provider selected, a speed pill shows current speed beside the speed-limit sign, with warning pills stacked above it. An active average-speed zone adds a pill with the observed average and section progress. Averages cover only the observed portion, including when the provider is opened mid-zone. The average stays unknown until enough distance/time has been observed; approximate progress is marked with **≈**. Advance warnings use real pre-entry observations or fresh report positions. Available reports include static/mobile cameras, police, hazards, crashes, jams, closures and enabled provider Flock cameras. Coverage depends on the provider; estimated distances remain approximate.

With Flitsmeister, the pills follow what Flitsmeister itself shows. Warnings sound the same whether they come from Waze or Flitsmeister. Maps and Vela speak their own short wording, such as "Speed camera in 500 metres" or "Start of average speed check", in the app's own language (English, Dutch, German, French, Spanish, Italian or Portuguese, otherwise English). Flitsmeister's alert sound for that type plays first, or replaces the chime when warnings are set to tone; it needs Flitsmeister installed on the phone. Each warning is announced once as it comes up, and again when you enter an average-speed check. An average-speed check counts as one zone, even when the app reports it in segments, so the average keeps counting to the end. Police checks from both apps show the same speed-trap icon. When Vela and Maps both receive warnings, the app on the car screen gets the speaker between announcements.

On Android Auto, the separate event pill uses the supplied icon, a regular numeric value and smaller units. It shows entry distance before a zone, then average speed and independent section progress inside it. The car pill does not print the warning name, percentage or remaining-distance caption; unavailable values show **—**. The speed pill closes the same stack, left of Vela's map buttons. The latest car-pill revision and expanded-overlay/display-profile cases still need final on-device checks.

**Show alerts on the map** (on by default) puts the alert's icon on the map at the exact spot the provider reports, on the phone and on Android Auto. An alert gets a marker only while it also has a pill, so the marker goes away when you pass the spot, leave the route or the provider clears the alert. Fixed Flitsmeister reports, such as speed cameras, stay on the map while their alert lasts. Waze reports and emergency vehicles show only while their reported position is under five seconds old. A Flitsmeister average-speed check is marked at its start while you approach it and at its end once you are inside. Alerts without an exact position, such as traffic jams and Waze average-speed checks, get no marker, and markers show no direction or zone length. On Android Auto the markers sit underneath the pills and also follow **Show details on Android Auto**. The switch is under **Speed and road alerts** on the phone and under **Navigation provider** in Android Auto. Markers are new and still need on-device checks; the Android Auto markers in particular have not been seen in a car yet.

Missing or expired values use Vela's own data where available. The provider status identifies fallback, and an unavailable current speed shows **—**. Changing provider, leaving a zone or losing its fresh observations removes that partial average. Data from the two providers is kept separate.

Selecting Flitsmeister keeps Vela's saved Flock display, voice and detour choices active. General FM speed, limit or warning data does not replace those independent features. De-Waze retains its existing handoff only while the selected Waze feed is fresh; an unselected feed cannot pause native Flock.

Earlier emulator checks covered phone settings, background reception and compact rendering. Google’s original Android Auto 17 host and Desktop Head Unit at 1280×480 also exercised native map, Search, route guidance, GPS and guidance speech. An A4 GPS replay with genuine FM data demonstrated zone progress, clearing and completed warning TTS callbacks. These results do not accept the latest numeric-pill shape, every Waze event, other display profiles or physical-car speech content; those checks remain open. An already-started native Flock refresh can finish while its display and alerts are paused.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
