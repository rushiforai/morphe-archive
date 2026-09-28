# Morphe Patches

Custom Morphe patches for Android applications (including **Jain Panchang** `com.jaindarshan.panchangtithi` and more).

📦 [Add this source in Morphe Manager](https://morphe.software/add-source?github=adish08/morphe-patches) · 📥 [Releases](https://github.com/adish08/morphe-patches/releases)

---

## 📱 Supported Apps & Patches

### Jain Panchang (`com.jaindarshan.panchangtithi` v10.2)

| Patch | Default | What it does |
|-------|---------|--------------|
| **Premium unlock** | on | Forces `hasActiveSubscriptions` true, injects a fake purchase list via `PurchaseAndroid.Companion.fromJson`, and forces `SharedStorage.set("isPremium", true)` |
| **Remove ads** | on | Stubs full-screen/native `load`, resolves show promises with null, no-ops `BaseAdView.loadAd` / banner `requestAd`, and stubs AdMob mediation adapter entry points |

Compatibility: `com.jaindarshan.panchangtithi` `10.2` (APKS split bundle).

---

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/Adish08/morphe-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Jain Panchang&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 10.2 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Premium unlock](#premium-unlock) | Unlocks premium features by faking active subscriptions and purchases. |  |
| [Remove ads](#remove-ads) | Disables banner, interstitial, rewarded, app open, and native ads. |  |

</details>

<!-- PATCHES_END -->

---

## 📲 How to Apply

### Morphe Manager (Recommended)
1. Tap [Add this source in Morphe Manager](https://morphe.software/add-source?github=adish08/morphe-patches).
2. Select the target application from your device or storage.
3. Choose your desired patches and tap **Patch**.

### Morphe CLI

```bash
java -jar morphe-cli.jar patch \
  --patches=patches-<version>.mpp \
  --keystore=Morphe.keystore \
  --keystore-password=<pass> \
  --keystore-entry-alias=<alias> \
  --keystore-entry-password=<pass> \
  --out=patched.apk \
  target.apks
```

---

## 🛠️ Building Locally

Requires JDK 17+ and an Android SDK (`local.properties` → `sdk.dir`).

```bash
./gradlew buildAndroid
# Output: patches/build/libs/patches-<version>.mpp
```

---

## 📜 License

Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE) — see [NOTICE](NOTICE) for naming restrictions.
