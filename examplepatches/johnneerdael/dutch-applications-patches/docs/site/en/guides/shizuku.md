# Install and start Shizuku

Shizuku lets an app you authorize use Android's debugging privileges. It does not root your device. For the tested [Android Auto installation workflow](android-auto.md), the service must be running and KingInstaller must be authorized before you install the patched APK.

For a new setup, use **Shizuku-Next** below. If your existing implementation already works with the app you need, there is no reason to replace it just to follow this guide. For a television, read the separate [Android TV setup and remote-control guide](shizuku-tv.md).

## Choose an implementation

This is a shortlist, not a list of every fork. We checked releases and substantive maintenance on **30 October 2026** and selected a practical advantage for each option.

| Implementation | Choose it for | Advantage and limits |
| --- | --- | --- |
| **[Shizuku-Next releases](https://github.com/rushiranpise/Shizuku-Next/releases)** | The default setup in these guides; KingInstaller and ordinary Shizuku clients | Keeps the usual Shizuku identity/API, adds pairing assistance and service recovery, and has dedicated TV focus handling. Our KingInstaller test used this implementation. Recovery and automatic startup depend on the device and selected start method. |
| **[Porter releases](https://github.com/d4rken-org/porter/releases)** | A smaller, focused privilege bridge; a TV pairing alternative | Focuses on the bridge rather than a large toolbox. Its TV pairing flow can read the pairing code from Android's dialog. Shizuku-only apps need its separate compatibility companion; use the [guided compatibility migration](https://porter.darken.eu/compatibility). It is not a tested replacement for Next in our KingInstaller workflow. The reviewed release was labelled `v0.8.1-rc0`; read the release notes before choosing a build. |
| **[ShizukuPlus releases](https://github.com/thejaustin/ShizukuPlus/releases)** | An app or integration that explicitly needs the [Plus APIs](https://github.com/thejaustin/ShizukuPlus-API) or Device Owner/Dhizuku integration | Adds interfaces beyond the usual Shizuku API. Those features require a compatible client and do not turn shell access into root. Its separate-package and drop-in builds have different compatibility requirements; recent releases include previews. It is an advanced option, not needed for KingInstaller. |

The [Awesome Shizuku list](https://github.com/timschneeb/awesome-shizuku#shizuku-implementations) is useful for discovery. Its warning about the original app's Android 17 compatibility is one reason not to use the old upstream download as our default. We do not automatically recommend every project in that list. A recent commit or a new theme alone is not a reason to switch.

Shevery remains an actively developed toolbox, but the user reported awkward remote navigation on TV. We therefore do not recommend it as the TV default. The TV guide separates remote usability from whether a service can run on the device.

## 1. Install one provider

Download the regular release APK from the selected project's **Releases → Assets**. Source-code ZIP/TAR archives are not Android applications; a debug APK is not the normal user download. Install the APK, allowing your browser or file manager to install from that source if Android asks.

**Switching is different from updating.** Next uses the same package identity as the original Shizuku but a different signing key. Stop the old service and follow the project's replacement instructions before installing Next. Remove only the old provider when required, not KingInstaller or your patched apps. You may need to pair again and approve clients again. An old server can remain active until stopped or the device is rebooted.

Porter is an exception to a blanket uninstall instruction: standalone Porter can coexist with Shizuku for apps that choose their provider. **Porter Compatibility cannot coexist with another provider owning the Shizuku identity/permission.** Start Porter and use its guided replacement/import screen before manually removing anything. For Plus, read the selected build's compatibility instructions; do not install several competing compatibility companions.

## 2. Start without root on Android 11 or newer

You need a phone that exposes **Wireless debugging**, usually with Wi-Fi connected. Menu names vary by manufacturer.

1. Open **Settings → About phone → Build number** and tap it repeatedly to enable **Developer options**, if necessary.
2. In **Developer options**, enable the debugging options required by the selected app and open **Wireless debugging**. Accept the network authorization prompt if shown.
3. Open Next and choose its wireless-debugging pairing/start flow. Allow the notifications and local-network or nearby-device access it requests for this flow.
4. In Android's **Wireless debugging** screen, choose **Pair device with pairing code**. Keep that dialog open. Complete Next's pairing instructions; if it cannot read the code automatically, enter it as requested.
5. Return to Next and start the service. Pairing and starting are separate steps. Wait for the app to report that the service is running.
6. Open the client app, such as KingInstaller, enable its **Shizuku** option, and approve its request. Select the intended client, not every installed app, for access.

Porter users should follow its [installation and pairing guide](https://porter.darken.eu/setup), then configure the compatibility companion if the client only supports Shizuku. These steps grant debugging access, not root. Some manufacturers restrict what shell access can do.

## 3. If wireless debugging is unavailable

For Android 10 and older, or a device without a usable wireless-debugging screen, use the provider's **computer/USB startup** flow. Install [Google's Android SDK Platform-Tools](https://developer.android.com/tools/releases/platform-tools), enable USB debugging, connect and authorize the device, then run:

```sh
adb devices
```

Open the installed provider's startup instructions and copy **the command it currently displays**. Run that command on the computer. Do not reuse a startup path from another fork or an earlier installation; APK paths and starter binaries can change. With multiple devices, insert `-s DEVICE_SERIAL` immediately after `adb`.

For a device that is already rooted, the provider may offer a root startup option. Rooting a phone is not a prerequisite for the Android Auto workflow, and this guide does not ask you to root it.

## 4. Recheck after a reboot or update

Installing the manager APK does not mean its privileged service is running. After a reboot, check the status before using a client that needs it. Enable automatic startup/recovery only if the selected method supports it, then test a real reboot. Pairing credentials, a watchdog and an automatic-start switch are not proof that the service survived or restarted.

If a client cannot see the provider, check its permission, the running server and the required companion/build. Force-stop and reopen the client after switching providers. If Android reports **INSTALL_FAILED_DUPLICATE_PERMISSION**, resolve the provider or compatibility-companion conflict rather than trying more APKs on top.

## Sources and validation

Our selection is based on [Next's documented capabilities](https://github.com/rushiranpise/Shizuku-Next#features), [Porter's setup and compatibility documentation](https://porter.darken.eu/setup), and [Plus's client requirements](https://github.com/thejaustin/ShizukuPlus#-third-party-app-compatibility). The [original setup manual](https://shizuku.rikka.app/guide/setup/) explains the basic Android debugging startup methods; use the selected fork's current startup command and compatibility instructions.

KingInstaller with Next was tested on an Android 16 emulator, and the user confirmed the working KingInstaller flow on the phone. We have not verified every provider/client combination or every Android 17 device. See [Android TV](shizuku-tv.md) for the separate TV evaluation and its limits.
