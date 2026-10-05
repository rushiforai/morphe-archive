# 🧩 Den Patches

Custom Morphe patches for Android applications, maintained by Kiet Huynh.

---

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.2](https://github.com/tkiethuynh/den-patch/releases/tag/v1.1.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 MISA Money Keeper&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 93.4 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Remove split requirements](#remove-split-requirements) | Removes split requirements from AndroidManifest to allow standalone APK installation. |  |
| [Unlock premium](#unlock-premium) | Unlocks premium subscription features and removes advertisements. |  |

</details>

<details open>
<summary>📦 Proxman&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.5.1 | 1.6.0 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Unlocks all premium features in Proxman by injecting a synthetic Pro entitlement at the RevenueCat RN bridge and neutering the Pairip license check that would otherwise kill the process. |  |

</details>

<!-- PATCHES_END -->

## 📱 Supported Applications

### 1. Sổ Thu Chi MISA (`vn.com.misa.sothuchi`)
- **Compatibility**: Version `93.4` (arm64-v8a)
- **Patches**:
  - `Unlock premium`: Unlocks all premium reporting and expense tracking features, suppresses advertisements.
  - `Remove split requirements`: Strips `requiredSplitTypes` and split metadata from `AndroidManifest.xml` to allow installing as a standalone APK without split install failures (`INSTALL_FAILED_MISSING_SPLIT`).

### 2. Proxman (`com.windium.proxman`)
- **Compatibility**: Version `1.5.1`
- **Patches**:
  - `Unlock Premium`: Injects a synthetic Pro entitlement at the RevenueCat RN bridge and neuters the Pairip license check.


---

## 📦 Releases & Installation

### Using with Morphe Manager
Add this repository as a custom source in Morphe Manager:
```
https://github.com/tkiethuynh/den-patch
```

### Using with Morphe CLI
Download the latest patch bundle (`patches-<version>.mpp` or `.jar`) from [Releases](https://github.com/tkiethuynh/den-patch/releases/latest):

```bash
java -jar morphe-cli.jar patch \
  --patches patches-1.0.0.mpp \
  --out app_patched.apk \
  app_base.apk
```

---

## 🛠️ Building from Source

### Prerequisites
- JDK 21
- Gradle (wrapper included)

### Build Command
```bash
./gradlew buildAndroid
```

Artifacts are produced in `build/libs/`:
- `den-patch-<version>.jar`
- `patches-<version>.mpp`

---

## 📜 License

Den Patches are licensed under the [GNU General Public License v3.0](LICENSE).
