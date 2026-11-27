# Local AI for Android developers

Add local writing, image, speech and extraction features without shipping a separate model inside every app. Local Model Host is a standalone APK with a public Binder SDK. Gboard uses the same service that other Android apps can use.

The inference path requires no Play Store installation, Google Play services, AICore, Google account or privileged client signature. Install the signed companion directly and include its small Java SDK. The official host APK requires **Android 11 or later and 64-bit ARM**. The client SDK can be included in apps that also support older Android versions.

## Start here

1. [Install and verify the companion and SDK](install.md).
2. [Add a proofreading action](quickstart.md).
3. Choose [text and image tasks](tasks.md), [speech and languages](speech.md), or [tools, extraction and memory](tools-and-memory.md).

For keyboard setup, use the [Gboard Local AI guide](../../guides/local-ai.md).

## One host, separate app data

| Part | Responsibility |
| --- | --- |
| Your app | Input collection, permissions, editor state, playback and final actions |
| Java SDK | Binder connection, request correlation, callbacks, cancellation and descriptor transport |
| Local Model Host | Selected models, inference, scheduling, memory admission and user residency settings |
| Android | Process isolation, UID identity, installation confirmation and system TTS selection |

One selected Gemma engine serves text/image consumers. Speech, synthesis and extraction have their own selected models under the shared memory budget. Migrating apps must release their embedded engines to avoid loading the same weights twice. Installing the host does not redirect an app that still calls AICore or its own engine.

Each Android UID owns its sessions, prefixes, requests and private memory. Any app can integrate; there is no caller-signature allowlist. Authenticate the provider before sending data. Another app's session or saved memory is not shared conversation context.

## Discover before offering a feature

Negotiate protocol major/minor, capabilities and the relevant model's readiness. Protocol 1.4 adds extraction, prefetch and private memory alongside text, image, speech, synthesis and optional search. A version number alone does not prove that a route or model is available.

Read the selected profile's language metadata. Declared coverage, export parity and task-quality evidence are different claims. Keep model selection, download progress, loading, Ready, memory pause and user Stop visible as separate states.

[Companion source and complete contracts](https://gitlab.com/johninnld/local-model-host) · [User setup](../../guides/local-ai.md)
