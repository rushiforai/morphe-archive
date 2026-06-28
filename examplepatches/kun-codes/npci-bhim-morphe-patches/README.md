# 👋🧩 Morphe Patches template

Template repository for Morphe Patches.

## ❓ About

This is a template to create a new Morphe Patches repository.
TODO: Update this about section with a brief introduction/summary about this repo and what it offers.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.2.0](https://github.com/kun-codes/npci-bhim-morphe-patches/releases/tag/v1.2.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary>📦 BHIM UPI&nbsp;&nbsp;•&nbsp;&nbsp;6 patches</summary>
<br>

**🎯 Supported versions:**

| 4.0.24 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass License Check](#bypass-license-check) | Bypasses Google Play Store license verification in com.pairip.licensecheck.LicenseClient to prevent System.exit(0) on non-Play Store installs. |  |
| [Bypass License Paywall](#bypass-license-paywall) | Neutralizes the license paywall and error dialog at the source by patching LicenseClient.startPaywallActivity and LicenseClient.handleError to return immediately. |  |
| [Bypass Pairip Protection](#bypass-pairip-protection) | Removes VMRunner.setContext, SignatureCheck.verifyIntegrity, and LicenseClient.checkLicense calls from Application.attachBaseContext to prevent pairip security initialization. |  |
| [Bypass Signature Verification](#bypass-signature-verification) | Bypasses APK signature verification in com.pairip.SignatureCheck to prevent SignatureTamperedException on modified APKs. |  |
| [Disable Blacklisting](#disable-blacklisting) | Disables the blacklisting check in the affirmation flow to prevent the app from blocking rooted devices server-side. |  |
| [Force Safe Root Status](#force-safe-root-status) | Forces the root status to 'safe' in device details and skips root status comparison logic to bypass root detection on the client side. |  |

</details>

<!-- PATCHES_END -->

#### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=xyz-user/xyz-patches

Or manually add this repository url as a patch source in Morphe: https://github.com/xyz-user/xyz-patches

### 📙 Contributing

Thank you for considering contributing to UserXYZ Morphe Patches.  
You can find the contribution guidelines [here](CONTRIBUTING.md).

### 🛠️ Building

To build UserXYZ Morphe Patches,
you can follow the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation).

## 📜 License

UserXYZ Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE)
