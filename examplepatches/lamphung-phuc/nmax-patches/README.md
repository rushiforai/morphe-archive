# NMAX Patches

Morphe patches that let [NmaxConnect](https://github.com/lamphung-phuc/nmax_connect) show Google Maps or Waze
navigation on the Yamaha NMAX dash. You patch the app on your own phone with Morphe Manager; no patched APK is
shared here.

### How to use these patches

1. Install [NmaxConnect](https://github.com/lamphung-phuc/nmax_connect/releases/latest) and
   [Morphe Manager](https://morphe.software).
2. Add this patch source in Morphe Manager: tap the button below on your phone, or add
   `https://github.com/lamphung-phuc/nmax-patches` by hand.

   <a href="https://morphe.software/add-source?github=lamphung-phuc/nmax-patches">
     <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
   </a>
3. Patch the app you want. Morphe Manager shows which version to download.
   - **Waze NMAX**: Waze 5.27.0.1. Installs next to Waze, with its own login.
   - **Google Maps NMAX**: also install [MicroG-RE 7.3.0](https://github.com/MorpheApp/MicroG-RE/releases) and keep
     Google Play Services. In MicroG-RE, allow location and turn on BeaconDB, or Maps cannot find you.
4. Open NmaxConnect and pick Waze NMAX or Google Maps NMAX as the dash map.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/lamphung-phuc/nmax-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;9 patches total
<details open>
<summary>📦 Google Maps Morphe&nbsp;&nbsp;•&nbsp;&nbsp;7 patches</summary>
<br>

**Package name:** `com.google.android.apps.maps`

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Device certification fix](#device-certification-fix) | Skips the uncertified-device screen that closes Maps on devices Google does not certify. |  |
| [Google Maps for MicroG-RE](#google-maps-for-microg-re) | Connects supported Google Maps builds to MicroG-RE 7.3.0 and avoids a crash when a location-settings dialog cannot open. |  |
| [NMAX icon](#nmax-icon) | Uses the NmaxConnect launcher icon and splash logo. |  |
| [Navigation speech and TTS startup](#navigation-speech-and-tts-startup) | Prefers synthesized navigation speech, keeping the existing audio fallback, and starts Google TTS when Maps opens. |  |
| [NmaxConnect dash map](#nmaxconnect-dash-map) | Lets NmaxConnect show this Maps' live map on the motorbike dash. Hooks found by structure on Maps 26.45. |  |
| [Picture-in-picture setting](#picture-in-picture-setting) | Adds a Picture-in-picture On/Off setting to Maps Settings. Turn it off so navigation does not open a small window when you leave Maps; it starts on, as in Maps. Hooks inspected on Maps 26.41 and 26.42. |  |

</details>

<details open>
<summary>📦 Waze NMAX&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `com.waze`

**🎯 Supported versions:**

| 5.27.0.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [NmaxConnect dash map (Waze)](#nmaxconnect-dash-map-waze) | Lets NmaxConnect show Waze's live map and navigation on the motorbike dash. Hooks found by structure on Waze 5.27. |  |
| [Waze NMAX](#waze-nmax) | Installs Waze next to Google's as com.lampp.wazenmax with NmaxConnect's icon, splash and dash service. |  |

</details>

<!-- PATCHES_END -->

## Credits

The Google Maps patches are based on [fangkampanat/gmaps-patches](https://github.com/fangkampanat/gmaps-patches), built
with [Morphe](https://github.com/MorpheApp). GNU General Public License v3.0, with the additional GPL section 7
requirements in [NOTICE](NOTICE). Not affiliated with Google, Waze, Yamaha or the Morphe project.
