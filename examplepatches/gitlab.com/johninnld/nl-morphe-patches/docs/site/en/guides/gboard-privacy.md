# Set up Gboard for private local AI

Use Local Model Host for writing, translation, text from images, and dictation on your phone. Apply **Block Gboard telemetry** to suppress the identified background reporting and remove stock Translate. Internet access remains available for searches and downloads you use.

## Choose the patches and providers

1. In Morphe, select **Block Gboard telemetry**, **AI Writing Tools**, **Enable OCR / Scan Text**, and **Parakeet voice typing**. Keep your existing package name and signing key when updating. Leave **Rambler voice typing** unselected if you want to omit the Google voice mode from the patched keyboard.
2. In Gboard, go to **Patches → AI & Voice → Local AI**. Install **Local Model Host**, choose a Gemma model on Android 11 or later with 64-bit ARM, and wait for **Ready**. Turn on **Use Local AI** in Gboard.
3. For dictation, choose and download a host speech model that lists your language. In Gboard's **Voice typing** settings choose **Standard** (sometimes labelled **Parakeet**) and enable **Use shared local speech**. Wait for the speech model to be **Ready**. If you will only type, you can leave voice typing off.
4. Choose a destination in **Local AI → Writing preferences → Translation language** and use the **AI Translate** toolbar action. The stock **Translate** tile is removed with the telemetry patch.
5. For **Scan Text**, **AI Reply** and **My Style** with images, enable image processing in the Host. Approve each requested Android capture and check its preview before proceeding.

See the [Local AI feature guide](local-ai.md) for writing, translating, screen context, OCR, Smart Compose, inline grammar and Voice Edit.

## What leaves the phone

| Feature | Data involved |
| --- | --- |
| **Local AI writing, AI Translate, Scan Text and screen context** | Gboard passes the selected draft or image to Local Model Host on the device. Review previews before applying them. |
| **Shared local speech and Voice Edit** | The microphone recording goes to the Host on the device. Voice Edit also gives Gemma the draft and transcribed instruction to propose a change. |
| **GIF search and trending** | Tenor receives the query you enter and requests for results or images. The patch suppresses the separate share report. |
| **Models, language packs, themes and Emoji Kitchen assets** | Download services receive requests for the chosen assets. Optional packs may need a first download. Those requests serve assets independently of the draft. |
| **Original Google writing or voice modes** | Their providers can receive the text, audio or context required by the selected mode. Use Local AI and shared Standard speech for private text and audio. |
| **Manual feedback, Android backup and delegated services** | Feedback can submit the content you choose. Backup and Play services operate under their own Android settings and permissions. The patch targets identified Gboard submissions. |

The patch suppresses identified Clearcut uploads and Play services client metrics alongside Tenor share reports. Android can still make connections for system services and Gboard retains network access. This setup gives the listed Local AI actions a local inference path. A claim about every connection or every native and delegated component would require additional traffic evidence.

## Check your setup offline

1. Finish downloading the selected models and confirm they show **Ready**. Temporarily turn off both Wi-Fi and mobile data.
2. In a scratch editor, proofread a synthetic sentence and use **AI Translate** to translate it. Check both previews and cancel or apply them.
3. In **Scan Text**, select a sample image and review its text. Tap the ordinary mic and dictate a short test sentence. Check that the words appear.
4. Re-enable connectivity when you want to download assets or use GIF search. If a local action fails, check the selected route and readiness in the [Local AI guide](local-ai.md).

For other apps that use the Host, leave online grounding disabled when you want local-only processing. When enabled and requested by a client, a search tool sends a query to the configured provider.
