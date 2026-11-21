# Wispr Flow keyboard bridge

An experimental LSPosed companion for the Gboard **Wispr Flow** patch. It supports the
Wispr Flow Android app versions **2.8.5** and **2.8.7**, with patched Gboard **18.5.4**.
The in-keyboard controls require bridge **0.3.0** and an updated Gboard patch.

The Gboard menu button can be tapped in the menu or held and dragged to the toolbar.
Tap it to enable keyboard mode and start dictation. Gboard shows its native Advanced
Voice Typing header during dictation. Tap **×** to discard or **✓** to finish the recording
and transcribe it. Keyboard mode hides Wispr's floating launcher and recording controls.
Wispr records and transcribes through its existing service. Gboard uses Wispr’s live mic
level for its native waveform and inserts the finished transcript into the original field.

## Setup

1. Build and install this module, then enable it in LSPosed with only
   `com.wispr.flowapp` selected as its scope. Fully restart Wispr Flow after installing
   or updating the module so its running service loads the new bridge.
2. Patch Gboard 18.5.4 using this repository's patch bundle and select **Wispr Flow**.
3. Open Wispr Flow once. Keep its usual microphone, overlay and accessibility
   permissions enabled, then open a text field and tap **Wispr Flow** in Gboard.
4. To hide the floating controls before dictating, use **Gboard settings > Patches >
   AI & Voice > Wispr Flow > Use the keyboard button**. **Restore the floating
   bubble** restores Wispr's original controls, including its recovery UI.

Android 14 or later is required. Gboard sends a package-specific broadcast with its
real sending UID. The receiver inside Wispr accepts commands only from the current
default keyboard's UID. No root command runs in Gboard.

Root with LSPosed is required for this companion. The module runs inside the original
Wispr app, so its APK and sign-in remain intact. A Gboard-only patch cannot start
dictation in these versions because Wispr exposes no dictation intent or exported service.
A separate patch to Wispr could provide the same bridge without LSPosed, but would
require signing and installing a modified Wispr APK. That route is not implemented.

Disabling the LSPosed module and restarting Wispr restores its normal behavior.
The bridge leaves the stock UI available on unsupported app versions and does not
change microphone, overlay or accessibility permissions. Wispr updates require
reviewing its private callback signatures before extending support.

## Troubleshooting text insertion

Keep the original field focused until transcription finishes. If you switch fields or
dismiss the keyboard before it completes, check Wispr Flow history for the transcript.

## Build

From the repository root, with an Android SDK and JDK 21 configured:

```sh
bash ./gradlew -p integrations/wispr-flow-bridge :app:assembleDebug
```

The APK is `app/build/outputs/apk/debug/app-debug.apk` under this directory.
