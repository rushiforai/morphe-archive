# Waze and Flitsmeister alerts in other map apps

Keep Google Maps or Vela Maps as your navigation app while patched Waze or Flitsmeister supplies speed, road limits and available road warnings in the background. The apps exchange those observations locally on the same phone. You need to patch both the provider and the map app that receives its data.

!!! important "Flitsmeister stays in the background: update Maps or Vela too"

    Complete the provider's setup once, then select **Flitsmeister** while your receiving map is visible. The corrected receiver handoff can use FM's **Allow only while using the app** location access without opening FM's screen. An older Maps/Vela patch can fail at this handoff even when FM already has location access. This fix has passed an Android 14 emulator check; the Android 16 phone check is pending. Follow [step 2](#2-set-up-the-provider-once).

## What the integration adds

| Data | What the receiving map can show |
| --- | --- |
| Current speed and road limit | A compact speed display beside a speed-limit sign, using fresh provider values and native fallback where available. |
| Average-speed zones | The observed average, progress and remaining distance while a zone is active. Available pre-entry observations can give advance warnings. |
| Road reports | Available static/mobile cameras, police, hazards, crashes, traffic jams and closures. Enabled Waze camera layers can also share their observations. Coverage depends on the provider. |

An average covers only the part of a zone observed since the provider started tracking it. Starting halfway through a zone cannot recover the earlier part. Estimated distances and progress remain approximate; a nearby report is not automatically on your chosen route.

This navigation feed is separate from the providers' advertising and usage tracking. **Remove telemetry** in Waze and **Disable tracking** in Flitsmeister control supported tracking services; **Broadcast navigation data** shares driving observations with your selected map app.

## 1. Patch the apps you need

Choose one provider and one receiving map app. You can install both providers, then select which one to use in the receiving app.

| App | Supported original | Patch required for this setup |
| --- | --- | --- |
| [Waze](../apps/waze.md) | 5.26.90.901, complete APKM | **Broadcast navigation data** |
| [Flitsmeister](../apps/flitsmeister.md) | 14.17 / 1287 or 15.0 / 1289, complete APKS/APKM | **Broadcast navigation data**; keep **Fix PairIP startup** enabled |
| [Google Maps](../apps/google-maps.md) | 26.43.05.1002020710, complete APK | **Receive alerts from a third-party application**; also select **Native navigation for any Android Auto host** for the native car interface |
| [Vela Maps](../apps/vela.md) | 0.5.2621, complete APK | **Receive alerts from a third-party application** |

Apply these patches from Dutch App Patches in Morphe Manager. For Maps, select its patches from this source only; the adapted bearinmind controls are already included. Install the resulting apps and complete first-run setup on the phone. For a receiving navigation app used in Android Auto, follow the [KingInstaller installation guide](android-auto.md).

The provider patch has an optional **Receiver package** setting. Leave it blank if you want either supported map app to receive updates while it runs. To target one app, enter `app.vela` for Vela, or the actual package of your patched Maps copy, normally `org.ungoogled.android.apps.maps`. A custom package or the microG-RE variant needs its own package name. One targeted package will not deliver updates to a different receiver.

## 2. Set up the provider once

1. Open patched **Waze / De-Waze** or **Flitsmeister** once, finish onboarding and grant location access.
2. Long-press that **provider app's** icon and choose **App info**. Alternatively, open Android **Settings → Apps → Waze / De-Waze / Flitsmeister**.
3. Open **Permissions → Location**. For **Flitsmeister**, precise location with **Allow only while using the app** can suffice when updated Maps/Vela starts it from a visible map. You do not need to open FM again for that handoff. For **Waze / De-Waze**, retain **Allow all the time** for the documented background-start setup. Permissions are separate for each provider.
4. Return to updated **Google Maps or Vela Maps**, keep it visible and select **De-Waze** or **Flitsmeister**. Check the source status; the map app automatically retries recoverable startup failures.

Changing this Android permission does not require repatching the apps.

**Need background location for another startup situation?** On Android 11 and newer, **Allow all the time** is granted on the app's settings page after initial location access. See [Android's explanation](https://developer.android.com/develop/sensors-and-location/location/permissions/background). It is not a blanket requirement for the corrected visible-map-to-FM handoff.

A restart while every receiving app is hidden can still be restricted by Android. Return to the receiving map and check its status; the integration keeps FM's screen closed. Check the phone's battery restrictions if updates stop with the screen off. The provider overlay can remain off.

With the updated patches on both sides, opening Maps/Vela or choosing **De-Waze**/**Flitsmeister** silently starts the selected provider's driving engine. Neither provider's screen opens. Android manages it as a foreground location service; notification visibility depends on the phone's notification permission. During this managed session, the provider stays muted: Maps/Vela supplies the spoken warnings and chimes. Your saved provider sound settings and phone volume stay unchanged; normal provider audio resumes after the sharing lease ends. The receiving map checks native engine health during visible use and active navigation, reconnects after process death, and retries a stopped engine with backoff. Missing GPS or road observations do not trigger a restart or become fresh data.

The source status distinguishes startup, a running engine, missing location permission and an unavailable startup API. If the API is unavailable, repatch both apps; older provider patches can still supply broadcasts when opened manually. If Android refuses a background restart, the map reports it without opening the provider. Returning to the map allows another silent attempt. No root or Shizuku is used by the integration.

Choosing the app's own data or ending the receiving session disconnects startup monitoring. Maps/Vela check the provider every 10 seconds. After 15 seconds without a check, Waze or Flitsmeister shuts down only if this API started its engine. An independently running or starting provider is preserved. Opening the provider yourself on the phone or car takes over the session, so it stays running when the map stops checking. Update both the receiving map and provider patches for this behavior.

## 3. Choose the source in your map app

### Google Maps / Ungoogled Maps

1. Open the account menu, then **Waze & external data source**.
2. Open **Navigation data source** and choose **De-Waze · navigation data** or **Flitsmeister · navigation data**.
3. Enable **Compact speed and average-speed control** if you want the speed, limit and active-zone details together.
4. For De-Waze and legacy alerts, open **Road alert types** and select the categories you want; only police reports start selected there. Native Flitsmeister warning audio has its own category/output choices, described [below](#native-flitsmeister-warning-audio).
5. Configure **Road alerts on the map** and **Chime for a road alert ahead** separately. Map pins follow the warning pills, at the provider's own position; older sources pin reports with a known position.
6. Check **Source now** for the provider status. Tap it to request an available snapshot. Automatic startup uses the separate provider API; a snapshot request never makes an old observation fresh.

**Off · Google Maps** restores Maps' own data. The alternative **Waze · Share alerts with Maps** uses the older Waze alert bridge: Waze needs **Share Waze Alerts with external applications**, must be signed in and must remain running. That mode does not provide the extended speed/limit/zone feed. Select the navigation-data option for this guide.

Flitsmeister keeps Maps' independent Flock choices active. Only a fresh selected De-Waze feed retains the earlier native-Flock handoff; route avoidance keeps its separate camera dataset.

### Vela Maps

Vela's settings show separate **Warning bridge**, **Background service** and **Data** status lines after choosing a provider. **Warning bridge: connected** confirms the native warning API handshake; **Data: connected** confirms fresh provider observations. Missing speed or road data can still use Vela's own values. Incomplete warning coverage and audio readiness remain separate statuses. Older provider builds can report **data only · native warnings unavailable** for the newer warning API even while their data feed works. Current compatible patched Waze and FM builds provide the warning handshake separately from engine and data status. Update the chosen provider and receiver together; a connected status alone does not establish complete live-warning coverage.

1. Open navigation settings, then **Speed and road alerts**.
2. Choose **De-Waze** or **Flitsmeister**. **Vela (native data)** restores the native source.
3. Configure **Spoken road warnings** if wanted. It follows Vela's voice and mute settings.
4. In the car settings, **Navigation provider** selects the same saved source. **Show zone and warning details** controls the additional car details.

The current speed and limit remain together. On Android Auto, a separate warning pill shows the event icon and a qualified distance. Before an average-speed zone it shows distance to the entry; inside the zone it shows the observed average and an independent section-progress bar. The car pill omits warning-name prose, percentages and remaining-distance captions. Unknown values show **—**. A point warning (camera, trap, road block) appears only with a distance: Flitsmeister's own look-ahead distance along the road, or the map's route distance. A point the route clearly misses stays hidden, and a pill survives a brief GPS dropout for 3 seconds instead of blinking. FM keeps a still-active warning on screen until FM removes it. The phone view and available zone details remain separate; an average stays unknown until enough distance and time have been observed.

Flitsmeister keeps Vela's independent Flock display, voice and detour choices active. Only a fresh selected De-Waze feed retains the earlier native-Flock handoff; an unselected feed does not pause those features.

## Native Flitsmeister warning audio

These warning controls remain a development feature. Flitsmeister 15.0's models and native capture passed their provider checks. Earlier FM15 development builds also passed controlled delivery, moving-camera, delayed-replay and zone checks with both receivers. The current candidate contains later text, recovery and readiness corrections and still needs final installed, timing and phone/car acceptance. A running provider or successful preview does not establish complete warning support.

This development warning mode targets **Flitsmeister 14.17 (version code 1287)** and now **15.0 (version code 1289)** with matching updated provider and receiver patches. Existing FM15 core support does not make an older installed bundle a native-warning build. Update both sides together when this change is available. An older receiver can still use its legacy feed, but must be updated or have its Flitsmeister source disabled before another map takes exclusive warning audio.

With compatible builds on both sides, choose **Flitsmeister**. Warning audio works straight away with the recommended choices (Voice; cameras, average-speed zones, road danger, emergency vehicles and police); nothing needs confirming. To change them, open **Flitsmeister warning audio** and **Flitsmeister warning categories** in Maps, or **Flitsmeister warning audio** in Vela. The same applies to De-Waze. Explicit previous mute and alert-type choices remain selected; an explicit Maps chime choice migrates to Tone. Map-pin visibility is separate from audible categories.

Choose Voice, Tone or Silent. Native Maps/Vela mute still caps that choice: alerts-only mode uses Tone, and full native mute stays Silent. Voice uses an available installed offline-capable voice. Native announcements do not wait for the old camera-distance or global cooldown heuristic. Missing distance stays unknown, and a moving emergency is not discarded because the car is stationary or the event has no point coordinates.

Only one receiving map owns warning audio. Another receiver can show current warnings while reporting which map handles audio. Reception, queue acceptance, audio start and audio completion are different states. A missing engine, denied focus or interrupted delivery does not automatically unmute FM during the managed session. If previous output might still be playing, the next map remains silent until stop/completion is positively acknowledged.

Use **Parked audio preview** only while parked with navigation stopped. It requests a clearly labelled local synthetic example through the normal audio grant and creates no public road report. It respects native mute. If warning audio remains fenced, **Recover warning audio while parked** opens FM's own confirmation screen. Stop both receiving maps and their speech engine, verify no warning is playing or queued, then confirm the parked reset. Recovery revokes old announcement authority; it does not replay the earlier warning.

A warning received after reconnecting keeps its original deadline. A clearly passed point or expired announcement is not played again. A current warning card can remain visible after its audio deadline; the card itself does not trigger speech. Missing output after an uncertain interruption can be intentional duplicate prevention.

| Warning audio status | What to do |
| --- | --- |
| **Audio ready** | The receiver prepared a voice in the phone's language when the source connected and is ready for a future eligible warning. Check the separate provider status for engine/data reception. |
| **Alerts handled by Google Maps / Vela** | The named map owns warning audio. Change or disable its FM source if you want the other map to handle it. |
| **Warning audio unavailable** | Check the receiving app's voice engine, voice download and native mute setting. Select Tone explicitly if that is the output you want. |
| **Waiting for previous audio to stop** | Keep the vehicle parked, stop both receiving maps and their speech engine, then use parked recovery after confirming that no output remains. |
| **Update the other receiving map** | Update the other map's patch or disable its FM source. An older active receiver prevents exclusive warning audio. |

If the selected engine or voice becomes available, a still-valid waiting warning can retry preparation. Expired warnings are not replayed after a voice download or engine recovery. Keep the explicit Voice/Tone/Silent choice you want; recovery does not override native mute.

### Waze development warning integration

The Waze 5.26.90.901 development integration reuses the same warning client and speakers in Maps/Vela. Its capture coverage remains marked incomplete while runtime acceptance is pending; choosing Voice does not bypass that gate.

In managed Waze event mode, the receiving map's reviewed categories and Voice/Tone/Silent choices govern output. Waze's local camera-sound switches and below-speed-limit restriction apply to Waze's own playback. Native warning enablement, invalidity and familiar/grouped silence still apply to source events. Native visual-only notifications remain visual-only. Maps/Vela continues to provide navigation.

## 4. Check reception before relying on it

After one-time provider setup, while parked, open the receiving map app with an external source selected. Check that the chosen source is listed and that it reports fresh data when observations are available. Leave the provider in the background and confirm reception continues. A stationary speed of zero is valid; a missing speed or limit must remain unknown or use the map's native fallback.

Changing provider, leaving a zone or losing fresh zone observations clears the partial average. The two providers' values are kept separate. Android 14 and newer let the receiving app verify the sender of the shared broadcast feed; older versions lack that Android broadcast-sender check. The separate native FM warning channel authenticates both apps through Binder on all supported Android versions.

| Problem | Check |
| --- | --- |
| **Android blocked background startup** with Flitsmeister | Update Maps/Vela as well as FM, confirm FM's precise location permission, then select FM while the receiving map is visible. FM's screen stays closed; always-on location is not the general fix for an older receiver handoff. |
| De-Waze stays unavailable | In **Waze / De-Waze → App info → Permissions → Location**, select **Allow all the time**, then return to Maps/Vela. Follow [step 2](#2-set-up-the-provider-once). |
| Flitsmeister works but De-Waze does not | Location permission is separate for each app. Check **Allow all the time** for **Waze / De-Waze** too; Flitsmeister's permission does not apply to Waze. |
| Source still stays unavailable | Check that both apps have the updated patches, provider onboarding is complete and the correct source is selected. Check the startup status and the provider app's battery restrictions. |
| One receiver gets data but another does not | Remove or correct the provider patch's optional **Receiver package**, then repatch the provider if you change that option. |
| Speed works but no average appears | A fresh active-zone observation is required, followed by enough observed time and distance. A camera report alone is not an active zone. |
| No map pins in Maps | Enable the map display and pin categories. Pins need a fresh report with a known position. |
| FM data arrives but there is no warning audio | Check the separate FM audio/categories and the warning audio status above. The old chime switch and estimated approach distance do not control native FM announcements. |
| Data stops when the screen locks | Check the source status and phone battery restrictions. Return to the receiving map to retry a blocked silent start. Background-only restarts have different Android restrictions from selecting FM in a visible map. |

Google Maps' consumer display and fallback were checked with controlled provider replays. Vela's background reception, phone/car display and advance speech were checked on an Android 16 emulator with Gearslip. Native Maps navigation has separate Gearslip and official Android Auto Desktop Head Unit checks. These results do not establish every combination of provider, phone, physical car display or live-road accuracy.

For developers, the [shared navigation broadcast contract](https://gitlab.com/johninnld/nl-morphe-patches/-/blob/main/docs/navigation-broadcasts.md) documents the data and freshness rules. Other receiving apps need an implementation of that contract; installing the provider patch alone does not add support to an arbitrary app.

Silent cold startup was also checked for all four Maps/Vela × Waze/Flitsmeister pairs on an Android 16 emulator, using the supplied originals and native engine health. This does not establish all manufacturer power policies or physical car behavior.

The newer FM15 startup correction was checked separately on Android 14 with precise location allowed, background location denied and notifications denied. Both updated receiving apps started the actual FM engine with FM's screen closed. Android 16 support has unit and platform-source evidence; the physical-phone check remains pending. See the [startup evidence and limits](https://gitlab.com/johninnld/nl-morphe-patches/-/blob/main/docs/research/2026-11-03-fm15-background-startup.md).

## Known Maps Android Auto issues

The car Exit action can leave Maps navigation active, and an FM zone-entry voice warning can be interrupted. These two issues are not fixed by the revised pills. Current Waze driving coverage, expanded music overlays and additional display profiles remain incompletely validated.
