# Use the Gboard patches

## Local AI and shared speech

[Set up the standalone Local AI companion](local-ai.md) for themed writing tools, image text and shared local dictation. Choose and download models in the companion; Gboard keeps the native keyboard interface. Google backends remain available as explicit choices.

Set up dictation, change how the keyboard looks, and test each feature in a scratch text field. This guide covers Gboard 18.8. Use the [Gboard app page](../apps/gboard.md) for the published patch list, supported APKs and release defaults.

If the keyboard still looks solid with blur on, go to [Frosted Glass](#frosted-glass) for a quick comparison using a transparent panel.

## Install and find your settings

1. In Morphe, choose the original Gboard APK for your device. For 18.8.0.1022711984 beta, **arm64-v8a** is build **176124766** and **armeabi-v7a** is build **176124765**. Choose arm64 on modern 64-bit phones. The build number and ABI both matter.
2. Select the patches you want and review their options. Morphe can restore your saved selection and custom options from an earlier patching run. A fresh selection shows the defaults for the bundle you loaded.
3. Keep **Change package name** selected if you want to install beside stock Gboard. When updating the patched copy, keep its package name and the same Morphe APK signing key. Follow the [installation and update guide](install.md).
4. Enable the patched keyboard in Android's keyboard settings, then select it in a text field. Use the patched keyboard’s gear to open its settings. **Patches** opens patch controls, **Voice typing** chooses your speech engine, and **Theme** applies Gboard themes.

Applying a patch makes its feature available. Some features still need a switch, a download, an Android permission or a supported device. A menu can be hidden or shown disabled when the APK lacks its patch, depending on bundle version. If an item is missing from Morphe’s patch list, check the bundle version before looking for it in Gboard.

### Change package name

This installs the patched copy as `app.morphe.android.inputmethod.latin` by default. Stock Gboard keeps its own settings, dictionaries and app data. After installation, use Android’s keyboard picker to confirm both entries are available and select the patched one. Changing the package again creates another app with separate data.

### Custom branding

Set **App name** and **App icon** in Morphe’s patch options before building. The all-default profile uses **Gboard Parakeet/Rambler** and the bundled **Parakeet** icon. Older bundles and saved choices can show a different name or icon. Check the launcher and Android’s keyboard picker after installing. The name inside Google’s original settings screens can still say Gboard.

### Add Gboard Signature Bypass

Morphe signs the rebuilt keyboard with your local signing key. This patch makes Gboard accept its repackaged signature in places such as Themes. Keep it with the normal patched build. It leaves Android’s installer signature checks in place and does not grant Google service eligibility. If an update says the signatures differ, check the package and use the key that signed the installed patched copy.

## Faster setup for voice typing

| What you want | Where to start | What to expect |
| --- | --- | --- |
| Local dictation | **Voice typing → Local AI voice typing**, then **Use shared local speech** | The selected host recognizer runs on the phone after its speech model is Ready. |
| Polished dictation and spoken edits | **Voice typing → Rambler** | Rambler sends your speech to Google and can use text context to rewrite it. |
| Google’s advanced dictation functions | **Patches → AI & Voice → Advanced Voice Typing** | Bundled recognizer support and Google’s eligibility checks. The patch does not create a third dictation type. |
| Headset input | **Patches → AI & Voice → Use Bluetooth microphone**, then **Voice typing → Use Bluetooth microphone** | The first exposes the stock switch. The second asks Gboard to use the headset when its routing rules allow it. |

### Parakeet voice typing

Open **Voice typing → Local AI voice typing → Open or install Local AI**. Choose Parakeet TDT v3, Parakeet Ultra, Nemotron Streaming or Whisper Tiny in the companion's **Speech recognition** settings. Download the chosen profile, enable shared speech and wait for Ready. Then enable **Use shared local speech** in Gboard. Model files are managed in the host, not downloaded again for each integrating app.

Tap the keyboard microphone in a scratch note and test a language declared by the selected profile. The supplied Whisper Tiny integration uses an English prefix. Keep text/image processing off if speech is all you need. Selected local speech reports missing models or memory pauses explicitly; it does not silently switch to Google. See [the complete setup](local-ai.md#set-up-local-dictation).

### Rambler voice typing

Choose **Rambler** under **Voice typing → Dictation type**. Try a short paragraph and pause, then select a sentence and say “make this shorter.” Rambler can return polished text and apply spoken edits. It sends the recording to Google. Availability depends on the network, locale and Google’s service. Use the Parakeet choice if you want the local engine.

### Rambler personal dictionary

Under **Voice typing → Voice dictionary**, add an unusual name in the **Voice correction list**. Dictate a sentence containing it in Rambler. The list is supplied with Rambler dictation to help it recognize names and terms. You can add or remove entries and import or export the list from its own screen. Gboard’s **Settings → Dictionary** is a separate typing dictionary.

### Rambler contact names

This extends the Voice correction list. Enable **Contact names** under **Voice dictionary** and grant Android contacts access if you want to use it. Start a fresh dictation and check that a known name appears. Names removed from the list stay removed. The legacy embedded Parakeet decoder can use this list. Shared Parakeet Ultra has a separate contact-name switch in **Local AI voice typing**. The list can be sent to Google when you select Rambler. Keep only the entries you want the active recognizer to see.

### Parakeet personal dictionary

This patch's acoustic dictionary integration belongs to the legacy embedded Parakeet decoder. For contact-name hints with shared speech, choose Local Model Host v0.1.145 or later, select **Parakeet Ultra**, then turn on **Use contact names** under **Voice typing → Local AI voice typing** and grant Android contacts permission. Gboard sends a limited set of names for that dictation session. Parakeet TDT v3, Nemotron and Whisper Tiny use ordinary shared recognition.

### Rambler custom instructions

Open **Voice typing → Rambler → Custom instructions**. Add a small formatting preference such as “Write every number in digits,” then dictate “four red bicycles.” The instructions are sent with Rambler dictation and added to Google’s own rules, so results can vary. Remove the instruction or turn its switch off to compare. Avoid putting secrets in this field.

### Rambler cursor-aware editing

Put the cursor between two existing sentences, then dictate a sentence. Rambler can use text after the cursor as well as text before it to fit the insertion. For a second test, select one sentence and say “make this more formal.” The selection can be sent for rewriting, and the result can be selected again for a follow-up edit. Check the surrounding text and cursor placement before accepting a change.

### Rambler app context

Rambler can receive the active app’s name and context from the input field, such as its hint. This helps it distinguish a chat reply from an email or search. Compare the same harmless sentence in two kinds of field if you want to see the effect. Treat variation as a possible result. The app and field context go to Google when this feature is active.

### Rambler stop after silence

Open **Voice typing → Rambler → Stop after silence**. Pick **3, 5, 8 or 10 seconds**, or turn it off. Dictate a phrase and wait beyond the selected interval. The session should finish and keep the text as if you tapped the checkmark. An unusually long pause within a sentence can also end the session, so choose a longer delay if you pause often.

### Rambler toolbar & revert extras (18.8)

Requires **Rambler voice typing** to supply its flag handling. In a Rambler session, check the floating toolbar for its overflow button. For revert behavior, use a short dictation that offers both a cleaned-up result and a full transcript, then switch between those views. The patch keeps the rewritten result available through the revert transition. Lite edit history only affects requests when Gboard is already using Jetson Lite. A regular Rambler session cannot verify it.

### Rambler automatic retry (18.8)

If this patch appears in your bundle, enable it with **Rambler voice typing**. Rambler can automatically retry an eligible recognition error using the audio already recorded for that utterance. It may send that audio to Google again. Normal dictation does not exercise this path. If a recognition error occurs during a harmless test, watch whether Gboard retries without a second press and check that it inserts the result only once. A fully offline device or a permanent service failure can still fail.

### Advanced voice typing (NGA)

Open **Patches → AI & Voice → Advanced Voice Typing**, enable it and restart the keyboard if prompted. The 18.8 patch bundles the matching dictation component for the two supported ABIs. A component can load before an eligible dictation session is available. Google’s recognition services, language support and device eligibility still matter.

Use the ordinary dictation selector and test a supported locale with a sentence and an advanced editing command. **Standard voice typing settings** under **AI & Voice**, if present, manages Google’s Advanced features, punctuation and language switching preferences. These controls do not add Google voice commands to Parakeet. If the advanced service is unavailable, use ordinary Google dictation or a ready Parakeet model. Live Transcribe language downloads cannot supply a missing Gboard dictation component.

### Use Bluetooth microphone

1. Pair a Bluetooth headset that has microphone input and make sure it is connected.
2. Under **Patches → AI & Voice → Use Bluetooth microphone**, turn on the patch’s exposure switch if needed.
3. Open Gboard **Voice typing** and turn on the stock **Use Bluetooth microphone** switch.
4. Dictate a harmless phrase with the phone away from the headset. Compare with the stock switch off. Disconnect the headset and start a fresh session to check the fallback.

Gboard’s routing depends on Android and the input device. The 18.8 Bluetooth path uses Android 12 or later, can prefer wired or USB input, and can exclude some car devices. A paired headset or a visible switch alone does not prove capture. Test the actual recognizer you use since a separate recognizer can choose its own audio input.

## Keyboard appearance

### Frosted Glass

An opaque keyboard panel can cover the blur entirely. **Follow theme** uses the theme’s background, and an official theme can remain opaque. Increasing **Blur strength** alone cannot reveal anything behind that opaque layer.

**Make the effect easy to see**

1. Open **Patches → Keys, Layout & Symbols → Frosted Glass** and turn on **Enable live blur**. The patch being selected in Morphe makes the settings available. The live-blur switch controls the effect inside Gboard.
2. Set **Background transparency → Custom**. Use **Custom transparency** around **65%** and **Blur strength** around **60** as a starting point. Higher transparency lets more of the app behind the keyboard show through. **0%** is opaque. The strength scale runs from **1 to 100**.
3. Leave **Key transparency → Follow theme** for the first test. The keys can stay readable while the panel shows the blur. Open a text field with a colorful image, pattern or large contrasting text behind the keyboard. A blank white or black background gives little to blur.
4. For an A/B comparison, keep the same theme, transparency and screen. Turn **Enable live blur** off, reopen the keyboard, then turn it on and reopen it again. The layout behind the panel should soften with blur on. Lower the transparency or strength afterward if you want a subtler look.

**When it still looks solid or flickers:** Live blur requires Android 12+ and device support for cross-window blur. Try with battery saver off if Android has suppressed blur, and test in a second app. Background transparency can still work even when Android cannot blur what is behind it. Keep **Extend to navigation bar** off if the bottom strip flickers or navigation buttons become hard to see. Test Frosted Glass with a plain Dynamic Color theme first. A custom image, a nearly opaque tint or AMOLED black with **Follow theme** can hide the effect.

### Rounded Keyboard Panel

Open **Patches → Keys, Layout & Symbols → Rounded Keyboard Panel**. Enable it, choose which corners to round and adjust the top and bottom radii. Use a contrasting app background to see the outline, and reopen the keyboard after each change. This affects the panel around the keys. Use **Key Shape Selection** for individual key faces.

### Custom Theme

Open Gboard’s **Theme** screen to import a compatible ZIP theme or use the theme gallery in **Patches → Keys, Layout & Symbols → Custom Theme**. Keep the signature compatibility patch applied. Save or import a trusted theme, select it, and tap **Apply**. Gallery packs are downloaded on demand. A downloaded pack stays inactive until you apply the theme. If a ZIP is rejected, try a known-compatible pack and keep the previous theme while checking the file.

### Top Toolbar Item Count

Select **Top Toolbar Item Count** when patching in Morphe. In **Patches → Keys, Layout & Symbols → Top Toolbar Item Count**, turn on **Enable**, set **Count** to a value from 3 to 8, and restart Gboard when prompted. Open the keyboard in a regular text field and check the toolbar. The number of available items can vary with the editor and enabled features. Set the count first, then use the pencil in Gboard’s toolbar menu to drag items onto the top bar.

### G Logo on Spacebar

Open **Patches → Keys, Layout & Symbols → G logo**. Select the built-in G, another glyph or your own PNG, WebP or JPEG. Adjust the size and color. Leave the language label visible until the image is positioned as you like. Reopen the keyboard and check the logo in the theme and language you normally use.

In v1.107.1, the logo stays visible when switching between QWERTY, Handwriting and Morse code with **G logo** enabled. This was verified on a OnePlus 15. [Issue #13](https://gitlab.com/johninnld/nl-morphe-patches/-/work_items/13) tracks the original report.

### Key Shape Selection

Open **Theme**, select a supported theme and look for **Key shape** in its details. Apply the theme and compare rounded or theme-defined keys with square ones. Theme assets determine the available shapes. This option changes individual keys and is separate from rounding the outer panel.

### AMOLED dark keyboard

Apply **AMOLED dark keyboard** in Morphe, then choose **Gboard Settings → Theme → Dynamic Color → Apply** and turn on Android’s **Dark theme**. Open a text field. The panel behind and between keys should be pure black. Key faces and accents can stay gray or colored. Switch Android back to light mode and reopen the keyboard to confirm the light palette still works. There is no separate AMOLED theme tile.

## Writing, capture and editing

### Shift + Backspace Forward Delete

After selecting this patch in Morphe, open **Patches → Keyboard Tools & Shortcuts → Shift + Backspace Forward Delete** and turn the switch on. Restart Gboard if prompted. Place the cursor just before a character. Hold the on-screen Shift key and tap the on-screen Backspace key to delete the character after the cursor. Backspace by itself deletes the character before the cursor.

### Long-Press Editing Shortcuts

In **Patches → Keyboard Tools & Shortcuts → Long-Press Editing Shortcuts**, set the default menu position to **First** or **Last**. Each key can follow the default or choose its own position. Reopen the keyboard after saving. Long-press A to select all, Z to undo, C to copy, X to cut, V to paste or Y to redo. Undo and redo depend on the editor. The menu keeps the key’s usual accents and other entries.

### Custom Symbols

With the patch selected in Morphe, switch to an English layout and open **Custom Symbols** in the keyboard’s tools menu. Choose a category and tap a symbol to insert it. Gboard opens its native expression panel with 11 custom categories. Use its tabs to change categories and its keyboard button to return to typing.

### Grammar Checker

On Android 12 or later, select the patched Gboard as Android’s spell checker and turn on **Gboard → Text correction → Grammar check**. In an editor that supports Android spell checking, tap an underlined phrase to see replacement suggestions. Language and grammar-model availability affect what Gboard can check. To use Gemma for the same underline and replacement menu, choose Local AI and turn on **Inline grammar** in **Writing preferences**. Keep the patched Gboard selected as Android's spell checker.

### Enable Inline Autofill Suggestions

Apply this patch in Morphe and select the patched Gboard as your keyboard. It enables Gboard's existing Android inline autofill module. On Android 11 or later, open **Bitwarden → Settings → Autofill**, enable the autofill service, select Bitwarden as Android's provider and choose **Inline** under **Display autofill suggestions** (older clients call this **Use inline autofill**). Keep Gboard's **Text correction → Show suggestion strip** on. A Vaultwarden account uses this same Bitwarden-client setup; Gboard does not connect directly to your vault server.

Open a supported login form for a saved test login. A Bitwarden suggestion or unlock action should appear above the keys; select it and check that the expected fields fill. Android, the target app and Bitwarden still decide whether a field is eligible. The patch does not bypass vault unlocking or domain matching. If no chip appears, compare Bitwarden's popup mode and check its [Android autofill setup](https://bitwarden.com/help/auto-fill-android/).

### Smart Compose

This is the upstream **Inline Suggestions** patch, published here as **Smart Compose** to distinguish it from password autofill. Apply it in Morphe, then open **Gboard → Text correction → Smart Compose** and enable the stock switch. Start an English sentence in a supported app and look for a suggested continuation; swipe right to accept it. Switch Smart Compose off to compare.

The patch opens the client-side rollout gate and exposes the setting; it does not supply a language model or remove the remaining locale, app and model checks. Google's [Smart Compose guidance](https://support.google.com/gboard/answer/7068415?co=GENIE.Platform%3DAndroid&hl=en) describes English/US availability. Dutch completions are not guaranteed. Smart Compose and inline autofill can be selected independently.

### AI Writing Tools

Open **Patches → AI & Voice → AI Writing Tools**. Existing **GBOARD_SERVER**, **PRIVATE_INFERENCE_AICORE** and **PRIVATE_INFERENCE_ASTREA** backends remain selectable, with their original Google account/model/service requirements. Installing the optional local provider does not silently change the selected backend.

#### Optional Local AI setup

Include **AI Writing Tools** when patching Gboard in Morphe. Open **Patches → AI & Voice → Local AI** and choose **Get Local Model Host** or **Update Local Model Host**. After Android confirms the installation, open **Model setup**, prepare a text model and wait for **Model ready**. Then enable **Use Local AI** in Gboard. The local backend reports when the host is stopped or unavailable. [Full Local AI setup](local-ai.md#install-the-companion)

#### Local writing and voice edits

Select text or place the cursor in a draft, then open Gboard's original **Writing Tools** from the toolbar. Try **Proofread**, **Rephrase** or **Professional**. Review the result in the keyboard's current theme before applying it. Changing the editor or selection invalidates pending results.

After setting up **Use shared local speech**, choose **Voice Edit** in the toolbar, tap the microphone and speak an instruction such as “make this friendlier”. Gboard uses the speech model selected in Local Model Host. Review the suggested edit before tapping **Apply**. [Set up local dictation](local-ai.md#set-up-local-dictation)

For **AI Reply** or **My Style**, approve Android's screen-capture prompt, then return to the original conversation. Review the captured image and tap **Read this screen** to use it as context. For **My Style**, add your own examples or preferences under **Local AI → Writing preferences → Your style**. Review the draft before tapping **Apply**. Send it yourself from the conversation when you're ready.

#### Completion, grammar and images

The context screen has separate experimental switches for **Shared Smart Compose** and **Shared inline grammar**. Shared completion uses Gboard's inline surface when the editor supplies usable cursor geometry. Grammar returns native corrections with ranges derived from the original text. Both remain subject to separate native quality, timing and stale-result acceptance; a visible switch is not proof of a working model path. Ordinary typing, glide and word predictions retain their native paths.

For **Scan text** image selection, choose the shared image OCR option and enable vision in the provider. The existing bundled OCR choice remains available. Shared OCR returns literal text; it does not provide fabricated boxes or confidence scores. No provider camera or microphone permission is required.

After verified setup, inference is on-device. APK/model downloads need connectivity. Loading, memory pressure and user Stop remain real states; an installed APK alone does not mean a model is ready.

### Enable OCR / Scan Text

Open a scratch note, open the Gboard toolbar and tap **Scan Text**. Grant camera access, aim at a well-lit printed sentence, select the result and insert it. The bundled recognition path processes Latin script on the device. Check the result for character errors. Under **Patches → Keyboard Tools & Shortcuts → OCR / Scan Text**, choose **Choose an image** to copy text from a photo or screenshot. Printed Latin text gives a better test than handwriting or other scripts.

### Toolbar Editing Buttons

Open the toolbar menu, find **Select All**, **Copy**, **Cut** and **Paste**, then drag the ones you want onto the top row. Test in a scratch note with two lines. Select All should select the editable text, Copy should preserve it, and Cut should remove the selection. Paste uses the current clipboard. Password fields, read-only fields and apps that intercept editor actions may behave differently.

### Cursor trackpad mode

Turn on **Enable cursor trackpad mode** under **Patches → Keyboard Tools & Shortcuts**. Long-press the space bar and slide to move the cursor. Try a two-line note with a mistake in the middle. Use the optional lock mode to keep moving without re-entering the gesture, then exit trackpad mode to return to typing.

### Simple Calculator

Enable it under **Patches → Keyboard Tools & Shortcuts → Simple Calculator**. In a plain text field, type `12*(3+4)` and wait for the suggestion row to show **84**. Tap the result to replace the expression. Longer expressions can be scrolled. Sensitive fields and editors without a normal suggestion row are unsuitable for this test.

### Incognito Mode Toggle

Open **Patches → Keyboard Tools & Shortcuts → Incognito mode**, enable **Add Incognito button** and choose whether clipboard and voice typing should remain available. Open the toolbar menu and add or tap the Incognito access point. Check for Gboard’s incognito indicator and confirm the clipboard and mic behave as configured. This changes Gboard’s own state. An engine that uses a remote service can still send data if voice typing remains allowed.

## Clipboard and local sharing

### Clipboard Enhancements

Open **Patches → Clipboard**. Change retention time, item count, preview lines, column count and optional time or order labels. Copy three harmless snippets, open Gboard’s **Clipboard** and check the display and expiry. A setting that shows more history also leaves more copied text accessible on the phone. Use short retention on shared devices.

### Web Clipboard

Open **Patches → Clipboard → Web Clipboard** and turn on **Enable Web Clipboard**. Keep **Require pairing code** on. On the same trusted Wi-Fi network, open the phone’s **Current URLs** address in your computer browser and enter the pairing code. Copy a dummy snippet on each side and verify it reaches the other side. Add the **Web Clipboard** Quick Settings tile if you want to start and stop the portal quickly.

The browser connects to the phone on the local network. If the address fails, make sure the devices are on the same network, the portal is still running and the network allows devices to talk to each other. Check **Connected clients**, disconnect unknown sessions, and stop the portal after use. Avoid sensitive clipboard content on a shared network.

## Beta features and hidden flags

### Beta features (18.8)

Open **Patches → More settings → Beta features**. The master switch must be on to apply any of these overrides. Turn on only the individual features you want, then restart Gboard when prompted. Turning the master off restores Gboard’s own flag values and keeps your individual choices.

| Feature | How to check it |
| --- | --- |
| Plain-text quick-paste chip | Copy plain text, then open an editable field. Tap the new clipboard chip if offered and confirm one tap inserts the copied text. |
| Floating clipboard chip | Enable Gboard’s clipboard suggestions, switch the keyboard to **Floating**, copy plain text and check the floating suggestion strip. The stock clipboard prerequisite still applies. |
| Invisible floating resizing | In Floating mode, try dragging just inside a side edge. The resize area is invisible. Dragging the move handle repositions the keyboard. |
| Emoji2 provider | Compare the emoji picker with this switch on and off. Android version and font support determine which differences are visible. An unchanged glyph alone is inconclusive. |
| Swipe-to-remove confirmation | Drag an unwanted suggestion out of the strip. Check that the confirmation uses the newer layout. The editor must offer a removable suggestion. |

### Hidden flags (18.8)

Open **Patches → More settings → Hidden flags**. The curated overrides cover **App-specific word biasing**, **App-specific suggestion bar** and **Square search radius**. These are separate controls. A changed setting can reach Gboard while the visible behavior still depends on its models or the current input context.

For the first two, use two ordinary apps and compare suggestions after repeatedly typing the same harmless uncommon word in one of them. For search radius, compare matching suggestions for the same input with the switch on and off. Change one flag at a time, reopen Gboard and check that your choice persists. If you cannot see a repeatable effect, record the switch state and leave the behavior unconfirmed.
