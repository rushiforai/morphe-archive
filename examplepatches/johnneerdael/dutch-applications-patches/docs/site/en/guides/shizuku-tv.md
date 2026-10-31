# Shizuku on Android TV and Google TV

Android TV setup has two separate requirements: the privileged service must start, and its controls must be usable with a remote. An APK that installs successfully or advertises Android TV support has not passed both checks. This guide concerns television devices; [Android Auto](android-auto.md) runs from your phone and uses a different installation workflow.

## Which implementation to try

| Option | Practical reason to consider it on TV | What still needs checking |
| --- | --- | --- |
| **[Shizuku-Next](https://github.com/rushiranpise/Shizuku-Next/releases)** | A TV launcher entry and dedicated D-pad focus/text-input handling, alongside service recovery controls. A useful first choice when you want the same Shizuku client API used in the phone guide. | Test the startup screen, permission prompt and your client with your remote. Recovery, Ethernet-only startup and unattended reboot startup depend on the TV and start method. |
| **[Porter](https://github.com/d4rken-org/porter/releases)** | A smaller manager with a [TV-specific pairing flow](https://porter.darken.eu/setup#android-tv) that reads Android's pairing code through a temporary accessibility service. This can avoid entering a code with the remote. | Shizuku-only clients need Porter Compatibility. Pairing accessibility, overlay permissions and the TV's debugging menus must work. The reviewed `v0.8.1-rc0` release carries a release-candidate name. |

Shevery is not our remote-first recommendation: the user reports that its TV navigation is awkward. More tools, automatic-start switches or a Material 3 interface do not by themselves solve D-pad focus. Other forks are not linked here without an additional advantage established for this workflow. See the [selected implementation comparison](shizuku.md#choose-an-implementation) for the separate advanced-client option.

## Install and check remote navigation first

1. Download the regular APK from the selected project's releases and sideload it using the TV's usual app-installation method. Keep the manager APK and any required compatibility companion distinct.
2. Open the manager from the TV launcher or Android's app settings. Use the remote to reach **Home**, the app-permission list and **Settings**.
3. Open a settings dialog, move between its controls with the D-pad, and use **Back** to leave it. Check that focus remains visible and that a search field does not trap the remote or unexpectedly require touch input.
4. If an Android system installation or permission dialog cannot be controlled with the remote, a USB/Bluetooth mouse can help complete that dialog. That is a workaround, not proof that the manager is remote-friendly. Porter documents [TV installation issues](https://porter.darken.eu/troubleshooting). A TV without a browser may also be unable to open external help links; open the setup guide on your phone or computer.

Do not replace a working TV setup just to gain a new interface. Follow the [provider-switching instructions](shizuku.md#1-install-one-provider) if a change is actually needed. In particular, Next and Shizuku-compatible companions can conflict with another provider's package or permission identity.

## Start using the TV's wireless-debugging screen

Some Android 11+ TVs expose **Developer options → Wireless debugging** with **Pair device with pairing code**. The Android version alone does not guarantee that the manufacturer exposes these controls.

With **Next**, follow its pairing/start flow and the TV's pairing dialog. With **Porter**, choose **Pairing** and follow its TV instructions to enable the temporary pairing accessibility service. Open the TV's pairing-code dialog within the stated time limit and keep it open while Porter reads the code. Wait for the result; its screen reports whether the temporary service was turned off. After successful pairing, choose **Start**. Pairing alone does not start the privileged service.

For a TV whose wireless-debugging controls are absent or unusable, use the computer route below instead of assuming that a phone's notification-based pairing instructions will work on a TV.

## Start from a computer over the network

Install [Google's Android SDK Platform-Tools](https://developer.android.com/tools/releases/platform-tools). Enable the TV's debugging option and use the address and port it actually displays.

If the TV provides a pairing-code dialog, run:

```sh
adb pair TV_ADDRESS:PAIRING_PORT
adb connect TV_ADDRESS:CONNECTION_PORT
```

The pairing port and connection port can differ. For a TV with a legacy **Network debugging** option rather than pairing, use `adb connect` with that option's documented endpoint. Do not assume every TV uses port 5555. Only enable network debugging on a trusted network.

Approve the TV's debugging prompt and check the connection:

```sh
adb devices
```

Open the installed provider's computer-start instructions and run **its current command**. Use `adb -s DEVICE_SERIAL ...` when more than one device is connected. Do not copy a starter path from another fork, phone or earlier installation.

## Verify the client and reboot behavior

Open the TV app that needs privileged access and approve its request. With Porter, configure the compatibility companion only if that client requires Shizuku rather than supporting Porter directly. Check a real operation in the client; a running manager screen alone does not prove client compatibility.

Then test sleep/wake, a full reboot, and the network connection you actually use. Working over Wi-Fi does not establish Ethernet-only recovery. Automatic pairing, a watchdog and an autostart setting do not guarantee unattended boot on every TV. Record the TV model, Android version, provider version and which checks passed when reporting a problem.

## Evidence and limits

The TV shortlist is based on [Next's TV-specific implementation](https://github.com/rushiranpise/Shizuku-Next#features) and [Porter's documented TV setup](https://porter.darken.eu/setup#android-tv), checked on 30 October 2026. The independent Android TV 16 emulator check is described in the [research note](https://github.com/johnneerdael/dutch-applications-patches/blob/main/docs/research/2026-10-30-shizuku-implementations.md). Basic remote navigation is a separate check from completed wireless pairing, client authorization, retail-TV compatibility and reboot recovery; do not treat one as proof of the others.
