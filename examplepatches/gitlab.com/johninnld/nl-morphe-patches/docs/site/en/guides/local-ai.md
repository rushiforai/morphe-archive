# Use Local AI with Gboard

Local AI adds an optional on-device route for writing help, image text and dictation. A separate Local Model Host app owns the models, so Gboard and other integrating apps can share them. Its installation and inference do not require the Play Store, AICore, a Google account or Google Play services.

The standard install retains the original Gboard backends.

## Block Gboard telemetry

Apply **Block Gboard telemetry** in Morphe to stop the identified Clearcut uploads, Play services client metrics and Tenor share reports. The patch hides stock Translate and blocks its cloud request. **AI Translate** remains available with Local AI. GIF search, downloads, LAN tools, companion updates and manual feedback retain network access. See [private setup and data flows](gboard-privacy.md).

This patch does not change the selected speech recognizer. Use the local model setup to choose and verify shared speech separately.

## Install the companion

1. Apply **AI Writing Tools**, **Enable OCR / Scan Text** and, for shared dictation, **Parakeet voice typing** in Morphe. Keep your existing package name and signing key when updating Gboard.
2. Open the patched Gboard's **Patches → AI & Voice → Local AI** settings. Use **Get Local Model Host** or **Update Local Model Host**. Gboard downloads the pinned signed APK and verifies it before opening Android's installer.
3. Approve installation from Gboard if Android requests it. Keep the existing companion's data when updating.
4. Open **Model setup**. Choose Gemma 4 E2B or the optional E4B profile if it is offered for your hardware. Download the selected model and enable Local AI and text/image processing. Enable image support for image tasks.
5. Wait for the text/image model to say **Ready**. Return to Gboard and enable **Use Local AI**.

The current companion requires **Android 11 or later and 64-bit ARM**. E4B needs more memory than E2B. A model being selectable does not guarantee that it can load under the current memory conditions. The setup screen distinguishes download, verification, loading, Ready and a memory pause.

For a standalone installation without Gboard, use the [companion project](https://gitlab.com/johninnld/local-model-host) and [verified installation guide](../developers/local-ai/install.md).

With Gboard networking enabled, opening Local AI setup checks for a newer official Host. If one is available, choose **Update Local Model Host**. Gboard verifies the package, version, SHA-256 and signer before Android asks you to confirm installation.

This Gboard bundle pins **Local Model Host v0.1.145** for first-time setup. The Host accepts installed apps by default and lets you optionally allow or block apps in **App access**. If a restricted policy blocks Gboard, change that choice in the Host and reopen Local AI. [Host release and developer files](https://gitlab.com/johninnld/local-model-host/-/releases/v0.1.145).

## Write in the current keyboard theme

Open Gboard's **Writing Tools** from the toolbar. Local actions use the keyboard's applied theme. Try Proofread, Rephrase or Professional on a short draft, review the preview and apply or cancel. Keep normal editor undo available.

Additional actions include shortening, summaries, replies, style examples and a saved instruction where offered. A reply needs supplied conversation context; it does not read another app automatically. Use **Read this screen** explicitly and approve Android's screen-capture consent when asked. Apps that block capture cannot be read through that workflow. Nothing is sent as a message for you.

**AI Translate** uses the destination selected under Local AI's **Writing preferences → Translation language**. Choose that destination first. Experimental Smart Compose and inline grammar have their own Writing preferences switches; suggestions still need review. The picker offers all 38 baseline languages; the source language is inferred from your draft. These are destination choices, not a claim that translation quality has been verified in every language.

| Action | How to use it |
| --- | --- |
| **Proofread** | Type or select a draft in an editable field. Open **Writing Tools → Proofread**. Check the proposed corrections and tap **Apply**. |
| **Rephrase**, **Professional** and other visible tones | Open **Writing Tools**, select the style, then review the proposed rewrite. Use **Cancel** to keep the draft. |
| **AI Translate** | Set **Translation language** first. Open the toolbar's **AI Translate** action with your draft in the editor. Check the destination and preview before applying. |
| **AI Instruction** | In **Writing preferences**, save an instruction such as “Keep the dates and shorten to one sentence.” Open **AI Instruction** from the toolbar and review the edit. |
| **Suggest Changes** | Open the toolbar action with a draft. Choose one proposed instruction to generate a preview. Applying the preview is a separate step. |
| **AI Reply** | Open the toolbar action in an editable conversation, approve the screen capture, review the screenshot and choose **Read this screen**. Review the draft yourself before inserting it. |
| **My Style** | Open the toolbar action with writing examples visible in the app, confirm the capture and use **Read this screen**. Review the result before applying. |
| **Smart Compose** | Enable the experimental switch in **Writing preferences**. Type a partial sentence and review any offered continuation. |
| **Inline grammar** | On Android 12 or later, select the patched Gboard as Android's spell checker and enable **Inline grammar** in **Writing preferences**. Gemma checks supported text fields on the device. Tap a blue underline to review and choose a correction. |
| **Voice Edit** | Set up shared local speech as well as the text model, then open **Voice Edit** and follow the recording steps below. |

Open **Grammar check** from the toolbar to check a draft directly with Local AI. It shows a preview only when it has a change to offer. Applying or cancelling a local edit, grammar check or translation returns to the regular keyboard. **Suggest Changes** offers editing instructions for you to choose before it generates a preview.

## What Gemma 4 handles best

Start with a short draft that has one clear purpose, such as a routine status update, a direct request or a simple translation. Review the preview before applying it. Check who does what, names, times, numbers, links, negation and conditions. A fluent result can change any of these details.

Both Gemma 4 E2B and E4B can miss text or change meaning. Multi-step instructions, mixed-language drafts, ambiguous words, and passages with several commitments are harder to verify. For longer drafts, work in short sections that each make sense on their own. A short draft can still be mistranslated; there is no verified word limit that guarantees accuracy. The language picker lists destinations, and quality varies by source language, destination and task.

In a small OnePlus CPU check, E4B preserved meaning on seven of eight routine French-to-Dutch drafts. E2B passed five of the same eight. These results apply to those examples. In another case, both models kept both lines but changed who made the coffee.

With Local Model Host 0.1.155 or a later version, plain-text requests with an empty tool list skip an unnecessary decoding constraint that could end a multiline result after the first line. Check that the preview contains each line you expected. If the preview drops information or offers an unusable edit, close it and keep the original draft.

## Read text from an image

With Local AI selected and the host’s text and image model **Ready**, open an editable field and tap **Scan Text** in the Gboard toolbar. Tap **Choose an image** to select an existing photo or screenshot, or tap the camera shutter to capture a new frame. Review the result. Select the text you want and tap **Insert** to put it in the active field.

The local image path returns text generated from the image. Check names and numbers. It is distinct from barcode/QR scanning and does not provide OCR word boxes or confidence scores. The existing Google/bundled OCR route has its own setup when Local AI is not selected.

## Set up local dictation

Open **Voice typing → Local AI voice typing → Open or install Local AI**. Choose and download a speech profile in **Local AI → Speech recognition**, enable speech and wait for its Ready state. Then enable **Use shared local speech** in Gboard.

| Choice | What to check |
| --- | --- |
| Parakeet TDT v3 or Ultra | Selected profile's declared languages and download |
| Nemotron Streaming | Streaming profile's language and readiness information |
| Whisper Tiny | The supplied integration uses an English prefix |

Downloads are managed in the companion, not separately in Gboard. Text/image processing can be off if you only want speech. The microphone and insertion UI remain Gboard's. Selected local speech reports an unavailable model or memory pause instead of silently switching to Google.

**Voice Edit** takes an explicit recording in the keyboard. With a draft open, choose **Voice Edit → Record instruction** and speak when it says it is listening. Your selected shared speech model transcribes the instruction. Gemma uses the transcript and draft to propose an edit. Review it and tap **Apply** or **Cancel**.

Local Model Host v0.1.145 or later can use contact names with Parakeet Ultra. Select Ultra in the Host, then enable **Use contact names** in Gboard’s **Local AI voice typing** settings and grant contacts access. Gboard passes names locally for each dictation session. Google and Rambler have their own voice dictionary settings.

## Memory, storage and privacy

**Always ready** keeps a foreground notification and reduces cold-start delay. On-demand mode saves residency between uses. Android may still reclaim a process, and genuine memory pressure can pause loading. A client app cannot override your Stop action.

Only selected managed model downloads are retained. Switching removes the previous managed download after its active use ends. Original files you imported from Downloads remain yours to manage.

The writing baseline covers 38 languages. Other languages remain available with a clear experimental-quality caveat; quality and speed vary by task and model. Speech and voice providers have separate language lists.

Text, image and speech inference stay on the device. Model/APK setup needs downloads. Search tools make network requests only when enabled by you and permitted by the consuming app. Review every generated edit before applying it.

[All Gboard patches](gboard.md) · [Developer integration](../developers/local-ai/index.md)

## Diagnose a failed local action

**Suggest Changes** returns editing instructions for you to choose; it does not rewrite the draft immediately. “No editing changes were suggested” is a valid result. An unreadable suggestions format is reported separately from model readiness.

Reply and My Style first request one Android-approved screen capture, then show **Read this screen** before local analysis. Returning from Android’s permission or image picker can recreate the input connection. The preview must match the same app, field and unchanged draft, and **Apply/Insert** checks a fresh snapshot again. Changing the draft or editor cancels a late result.

For an actionable debug report, enable the opt-in tags, reproduce once, then disable them:

```sh
adb shell setprop log.tag.LocalModelHost DEBUG
adb shell setprop log.tag.GboardLocalAi DEBUG
adb logcat -v threadtime -s LocalModelHost:D GboardLocalAi:D '*:S'
# Stop logcat with Ctrl-C, then disable tracing.
adb shell setprop log.tag.LocalModelHost INFO
adb shell setprop log.tag.GboardLocalAi INFO
```

The host tag requires the companion build which includes request diagnostics. Logs contain operation, correlation ID, image stages, timing and terminal error codes; they exclude your draft, prompt, image contents and keys. Keep raw device logs out of public bug reports and attach the relevant failure code and steps.
