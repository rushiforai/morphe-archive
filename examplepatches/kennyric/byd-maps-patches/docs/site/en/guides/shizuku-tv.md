# Shizuku on Android TV and Google TV

Use this guide for a television. For a car connected to your phone, follow [Android Auto installation](android-auto.md).

## Install the manager

Try [Shizuku-Next](https://github.com/rushiranpise/Shizuku-Next/releases) first, or use [Porter’s TV setup](https://porter.darken.eu/setup#android-tv). Porter needs its compatibility companion for Shizuku-only clients. Keep an existing working setup; follow the [switching guidance](shizuku.md#choose-an-implementation) before replacing a provider.

Sideload the release APK and open it. Check that your remote can reach the start controls, app-permission list and settings. A USB or Bluetooth mouse can help with system dialogs that do not work well with the remote.

## Pair and start on the TV

Some Android 11+ TVs expose **Developer options → Wireless debugging → Pair device with pairing code**. Availability depends on the manufacturer.

1. Open the manager’s pairing flow.
2. Open the TV’s pairing-code dialog and keep it visible.
3. Follow the manager’s instructions. Porter offers a TV pairing helper that temporarily needs accessibility access.
4. After pairing succeeds, choose **Start** and wait for the service to report that it is running.
5. Open the client app and approve its access request.

## Start from a computer

If the TV’s pairing screen is unavailable or difficult to use, install [Android SDK Platform-Tools](https://developer.android.com/tools/releases/platform-tools) on a computer and enable the TV’s debugging option.

For a TV with wireless pairing, use the address and separate ports shown on its screens:

```sh
adb pair TV_ADDRESS:PAIRING_PORT
adb connect TV_ADDRESS:CONNECTION_PORT
```

For an older **Network debugging** option, use `adb connect` with the address and port specified by the TV. Approve its debugging prompt, then check:

```sh
adb devices
```

Run the installed manager’s current computer-start command. Add `-s DEVICE_SERIAL` immediately after `adb` if several devices are connected.

Check the client after sleep, wake and a full reboot. Automatic startup depends on your TV, network and selected start method; start the service again if necessary.
