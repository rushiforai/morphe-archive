# Install and start Shizuku

Shizuku lets apps you approve perform supported Android debugging tasks. Root is not required. For Android Auto installation, start the service and authorize KingInstaller before installing the patched APK.

## Choose an implementation

| Option | When to use it |
| --- | --- |
| [Shizuku-Next](https://github.com/rushiranpise/Shizuku-Next/releases) | The default for these guides and the KingInstaller workflow. |
| [Porter](https://github.com/d4rken-org/porter/releases) | An alternative with its own [setup guide](https://porter.darken.eu/setup). Shizuku-only clients need its compatibility companion. |
| [ShizukuPlus](https://github.com/thejaustin/ShizukuPlus/releases) | An advanced option for clients that specifically require Plus features. Follow that build’s compatibility instructions. |

Keep an existing working setup. When switching, follow the chosen project’s replacement instructions. Next and the original Shizuku use different signing keys. Porter’s Shizuku compatibility companion cannot coexist with another Shizuku provider; use its guided migration before removing anything.

Download the release **APK** from **Assets**, not a source-code archive, and install it on your phone.

## Start on Android 11 or newer

These steps require a usable **Wireless debugging** setting and usually Wi-Fi.

1. Enable **Developer options**, usually by tapping **Build number** repeatedly under **About phone**.
2. Open **Developer options → Wireless debugging** and authorize the network if asked.
3. Open Shizuku-Next and choose its wireless pairing flow. Allow permissions needed for pairing.
4. In Android’s wireless-debugging settings, choose **Pair device with pairing code**. Keep the dialog open and follow Next’s pairing instructions.
5. Return to Next and tap **Start**. Wait until it reports that the service is running.
6. Open KingInstaller or another client, enable its Shizuku option and approve that app’s access request.

## Start with a computer

For Android 10 or older, or when wireless debugging is unavailable, install [Android SDK Platform-Tools](https://developer.android.com/tools/releases/platform-tools), enable **USB debugging**, connect the phone and approve the computer.

Check the connection:

```sh
adb devices
```

Open the installed provider’s computer-start instructions and run the exact command it displays. With multiple devices, add `-s DEVICE_SERIAL` immediately after `adb`.

## After restarting the device

Check that the service is running before using a client that needs it. You may need to start it again. If a client cannot connect, check its permission and reopen it after switching providers.

[Android Auto installation](android-auto.md) · [Android TV setup](shizuku-tv.md)
