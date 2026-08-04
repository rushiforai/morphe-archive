<div align="center">
    <img src="https://github.com/alan7383.png" width="120" style="border-radius: 50%;"/>
    <h1>SofaTime Patches</h1>
    <p><b>Unlock the full potential of your SofaTime app!</b></p>
</div>

Hey there! I created these custom Morphe patches for SofaTime mostly for my own personal use. They help me bypass license checks, restore Google Sign-In, and unlock premium features seamlessly. I'm sharing them here so you can enjoy a better experience too.

Please keep in mind that I work on these in my free time, so I might not always be able to fix issues immediately. 

<div align="center">
    <br>
    <a href="https://morphe.software/add-source?github=alan7383/sofatime-patches">
        <img src="https://img.shields.io/badge/Add_to_Morphe-000000?style=for-the-badge&logo=android&logoColor=white" alt="Add to Morphe Manager"/>
    </a>
    <br><br>
</div>

## Features

**Premium Unlocked**  
Access all premium features, custom themes, and advanced tracking tools effortlessly.

**License Check Bypassed**  
Allows side-loading and installation from custom APK sources by bypassing PairIP and Google Play Store verification.

**Google Sign-In Restored**  
Brings back functional Google Sign-In on repackaged APKs by using a custom embedded OAuth flow.

**Telemetry Disabled**  
Blocks Firebase Crashlytics and Sessions at the component registration level, disabling all crash reporting and session tracking.

> [!IMPORTANT]
> **Backup your data first!**
> 
> Please back up your progress before installing or updating patched builds. Don't worry, your progress is normally already saved, this is just in case something goes wrong.
> 
> **How to back up:**
> 
> **Manual ZIP Backup (Safest)**: Open SofaTime > Profile > Settings > Data > **Export Sofa Time backup**. Keep this `.zip` safe! To restore, simply choose **Import Sofa Time backup**.
> 
> **Cloud Sync**: Ensure **Sofa Time Cloud** is connected in Settings > Sync. To save your data to the cloud, just tap **Sync from this device**.

## Patches List

<!-- PATCHES_START EXPANDED -->
> **[v1.3.6](https://github.com/alan7383/sofatime-patches/releases/tag/v1.3.6)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;4 patches total
<details open>
<summary>📦 SofaTime&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 1.2.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass Google Sign-In](#bypass-google-sign-in) | Bypasses SHA-1 check by using embedded WebView OAuth for Google Sign-In. |  |
| [Bypass license check](#bypass-license-check) | Bypasses PairIP license verification. |  |
| [Disable telemetry](#disable-telemetry) | Disables Firebase Crashlytics, Sessions, and Analytics. |  |
| [Unlock premium features](#unlock-premium-features) | Unlocks all premium capabilities. |  |

</details>

<!-- PATCHES_END -->

## Patch Details

For those curious about how it works under the hood:

**Bypass Google Sign-In**  
This patch bypasses the SHA-1 check by dynamically fingerprinting the Google Sign-In method (`googleSignInMethodFingerprint`) to delegate authentication to a precompiled Kotlin extension (`GoogleSignInHelper.kt`). It displays an in-app WebView OAuth flow, captures the direct Google ID Token / Auth Code, and asynchronously resumes the Kotlin coroutine by boxing the token into `kotlin.Result`.

**Bypass License Check**  
Bypasses the strict PairIP anti-piracy and license checks. It short-circuits license verification by injecting void returns into `LicenseClient.checkLicense()` and `initializeLicenseCheck()`, and forces `LicenseContentProvider.onCreate()` to return true.

**Unlock Premium Features**  
Overrides the entitlement state checks by injecting `return true` into the `PremiumEntitlement` Smali methods (`isPremium` and `isPremiumPurchased`), forcing all premium feature gates to evaluate as active.

**Disable Telemetry**  
Blocks Firebase Crashlytics and Sessions by patching their `ComponentRegistrar.getComponents()` methods to return an empty list, preventing their Firebase components from ever being registered. This stops all crash reporting, session tracking, and any analytics bridging without affecting other Firebase services (Auth, Firestore, FCM).

## How to use

The easiest way is to add the source directly to Morphe:  
[Click here to add it](https://morphe.software/add-source?github=alan7383/sofatime-patches)

Alternatively, you can manually add this repository URL as a patch source in Morphe:  
`https://github.com/alan7383/sofatime-patches`

## Getting the SofaTime APKM

Can't find the SofaTime APKM online? No worries, you can extract it straight from your own device. I've also requested SofaTime to be listed on APKMirror to make things easier for everyone.

In the meantime, the easiest way is to use ML Manager. Install it from the Play Store, open it, find SofaTime in your app list, and export it. ML Manager will extract the full APKM into `Android/media/com.javiersantos.mlmanager`. Then in Morphe, just pick that `.apkm` file as the app to patch, and you're good to go.

Since SofaTime is distributed as an APKM, extracting it this way gets you all the split APKs Morphe needs to apply the patches.

## Building locally

If you want to build these patches yourself, check out the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation).

```bash
./gradlew build
```

## Support me

If you enjoy these patches and want to support my work, you can buy me a coffee on [Ko-fi](https://ko-fi.com/alan7383). It means a lot, thanks!

## License

SofaTime Patches are licensed under the [GNU General Public License v3.0](LICENSE).
