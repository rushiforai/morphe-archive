# Wispr Flow keyboard bridge

An experimental LSPosed companion for the Gboard **Wispr Flow** patch. It supports the
Wispr Flow Android app **2.8.5**. Live dictation and text insertion have been confirmed
on a REDMI K90 with patched Gboard **18.5.4**.

The Gboard menu button can be tapped in the menu or held and dragged to the toolbar.
Its first successful tap enables keyboard mode and starts dictation. Tap again to
submit. Wispr's recording, transcription, error and recovery controls remain visible;
the idle floating launcher is hidden. Wispr still handles microphone access, speech
recognition and inserting text through its existing accessibility service.

## Setup

1. Build and install this module, then enable it in LSPosed with only
   `com.wispr.flowapp` selected as its scope. Restart Wispr Flow.
2. Patch Gboard 18.5.4 using this repository's patch bundle and select **Wispr Flow**.
3. Open Wispr Flow once. Keep its usual microphone, overlay and accessibility
   permissions enabled, then open a text field and tap **Wispr Flow** in Gboard.
4. To hide the idle bubble before dictating, use **Gboard settings > Patches >
   AI & Voice > Wispr Flow > Use the keyboard button**. **Restore the floating
   bubble** reverses keyboard mode.

Android 14 or later is required. Gboard sends a package-specific broadcast with its
real sending UID. The receiver inside Wispr accepts commands only from the current
default keyboard's UID. No root command runs in Gboard.

Root with LSPosed is required for this companion. The module runs inside the original
Wispr app, so its APK and sign-in remain intact. A Gboard-only patch cannot start
dictation in Wispr 2.8.5 because Wispr exposes no dictation intent or exported service.
A separate patch to Wispr could provide the same bridge without LSPosed, but would
require signing and installing a modified Wispr APK. That route is not implemented.

Disabling the LSPosed module and restarting Wispr restores its normal behavior.
The bridge leaves the stock UI available on unsupported app versions and does not
change microphone, overlay or accessibility permissions. Wispr updates require
reviewing its private callback signatures before extending support.

## Troubleshooting text insertion

If recording finishes but no text enters the text field, check that Wispr's
accessibility service is enabled and connected. Android UI automation can temporarily
suppress accessibility services even while their settings remain enabled. End the
automation session before testing dictation again.

## Build and tests

From the repository root, with an Android SDK and JDK 21 configured:

```sh
bash ./gradlew -p integrations/wispr-flow-bridge :app:assembleDebug :app:testDebugUnitTest
```

The APK is `app/build/outputs/apk/debug/app-debug.apk` under this directory. Tests
cover sender identity, idle and recording visibility, the native microphone gate,
short-tap arguments and native follow-up events. Physical-device verification must
check starting and submitting dictation, insertion into the original text field,
idle-bubble suppression and restoring the floating launcher.
