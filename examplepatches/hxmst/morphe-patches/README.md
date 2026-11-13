# Hxmst Morphe Patches

Custom [Morphe](https://morphe.software) patch bundle. This is a general patches repository that I made for various Android applications.

Click the button below, or manually add this repo URL to Morphe Manager: `hxmst/morphe-patches`

<a href="https://morphe.software/add-source?github=hxmst/morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

---

## Patches List

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/hxmst/morphe-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary>📦 Ola Electric&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**Package name:** `com.olaelectric.companion`

**🎯 Supported versions:**

| 5.4.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Allow Plaintext HTTP Traffic](#allow-plaintext-http-traffic) | Allows cleartext HTTP connections to local self-hosted servers. |  |
| [Bypass Root Detection](#bypass-root-detection) | Disables root detection, allowing the app to run on rooted devices. |  |
| [Disable SSL Pinning](#disable-ssl-pinning) | Disables SSL certificate pinning to allow intercepting and inspecting network traffic. |  |
| [Disable TLS Validation](#disable-tls-validation) | Disables hostname verification and certificate chain validation for self-signed or invalid certificates. |  |
| [Reroute API Calls to Self-Hosted Server](#reroute-api-calls-to-self-hosted-server) | Redirects API requests from Ola servers to your custom backend. | • Self-Hosted Server Host / IP<br>• Self-Hosted Server Port<br>• Target Protocol Scheme<br>• Reroute kong2.olaelectric.com<br>• Reroute apps2.olacabs.com |

</details>

<details open>
<summary>📦 Vi App&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.mventus.selfcare.activity`

**🎯 Supported versions:**

| 10.33.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable RASP](#disable-rasp) | Bypasses device security checks such as root, USB debugging, and modified environment detection, so the app can be used normally on any device. |  |

</details>

<!-- PATCHES_END -->

---

## Obtaining the APK

To patch an application, you will need the clean, original APK / XAPK package for `<yourapp>`:

1. Obtain the official APK of `<yourapp>` using a trusted APK provider, exporting it from your device, or using [Aurora Store](https://github.com/AuroraOSS/AuroraStore).
2. If using Aurora Store:
   - Search for `<yourapp>` in Aurora Store.
   - Download the target supported version.
   - Export the APK / bundle to your storage.
3. Save or transfer the APK / XAPK file to your computer or Android device storage for patching.

---

## Building the Patch Bundle (`.mpp`)

To build the standalone `.mpp` patch bundle locally:

```bash
# Clone the repository
git clone https://github.com/hxmst/morphe-patches.git
cd morphe-patches

# Build the Android patch bundle
./gradlew buildAndroid
```

The compiled patch bundle will be generated at:

```
patches/build/libs/patches-<version>.mpp
```

---

## How to Apply the Patches

### Method A: Using Morphe Desktop CLI

1. Download the latest all-in-one CLI JAR from [Morphe Desktop Releases](https://github.com/MorpheApp/morphe-desktop/releases).
2. Generate an options file if you want custom patch settings:

   ```bash
   java -jar morphe-desktop-all.jar options-create \
     --patches patches/build/libs/patches-*.mpp \
     --filter-package-name <com.example.yourapp> \
     --out options.json
   ```

   Edit `options.json` if needed to customize your options.

3. Patch the APK:

   ```bash
   java -jar morphe-desktop-all.jar patch \
     --patches patches/build/libs/patches-*.mpp \
     --options-file options.json \
     <yourapp>.apk \
     --out <yourapp>.patched.apk
   ```

4. Install the output APK onto your Android phone:
   ```bash
   adb install -r <yourapp>.patched.apk
   ```

### Method B: Using Morphe Manager (Android GUI)

1. Open **Morphe Manager** on your Android device.
2. Go to **Sources** > **Add Source**.
3. Link your GitHub repository (`hxmst/morphe-patches`) or import the `.mpp` file directly into Manager.
4. Select the downloaded `<yourapp>` APK / XAPK.
5. Select the patches you wish to apply, configure any options if needed, and tap **Patch**.
6. Install the patched APK.

---

## License & Acknowledgments

- Licensed under [GPLv3](LICENSE).
- Built using the [Morphe Patcher](https://github.com/MorpheApp/morphe-patcher) ecosystem.
