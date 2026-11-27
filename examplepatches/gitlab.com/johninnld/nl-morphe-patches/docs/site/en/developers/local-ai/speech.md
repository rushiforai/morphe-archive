# Shared speech, voices and languages

Keep speech models in Local AI so integrating apps can share them. Release an app's embedded recognizer or synthesizer when migrating; installing the companion alone does not unload those engines.

## Speech recognition

Users choose and download Parakeet TDT v3, Parakeet Ultra, Nemotron Streaming or Whisper Tiny in the host. Query the selected profile's language metadata and readiness. Whisper Tiny's supplied integration uses an English prefix; do not advertise multilingual Whisper from the model family name alone. When the selected adapter advertises `speech.contextBias`, call `openSpeechSession(language, contextPhrases)` to pass optional names or terms for the session. Parakeet Ultra is the supported adapter. Check the capability before collecting names and handle `CONTEXT_BIAS_UNSUPPORTED` if the selected model changes.

After connecting, call `client.openSpeechSession("auto")` on a worker. Your app captures audio with its normal microphone permission. Feed finite float32 mono samples at 16 kHz, in chunks of at most 16000 samples, through `SpeechSession.feed(samples, endOfStream, listener)`. Wait for each acknowledgement/result to bound the queue.

Each result replaces the preceding interim transcript. `final=true` ends the utterance. Cancellation ends the stream; open a new session before feeding more audio. Close the session at conversation end. A busy recognizer, memory pause or user Stop must remain visible; do not silently substitute a cloud recognizer.

Optional turn detection is separately negotiated with `supportsTurnDetection()`. It reports speech/turn state; your app decides when to answer, interrupt playback or execute an action.

## Speech output

For ordinary Android speech, users can select **Local AI** as their system text-to-speech engine. Your app can then use Android's TTS API without hosting another engine.

For direct audio routing, negotiate `supportsSynthesis()` and open a `SynthesisSession`. Call `prepare(listener)` when a conversation starts, wait for readiness, synthesize through the session, and call `release(listener)` at its end. Release removes your hold; another conversation, a user setting or system TTS selection may retain the voice.

The audio format belongs to each stream. Honor the reported sample rate and bounded PCM callbacks. Synthesis completion means the host finished generating audio; the consuming app still owns playback completion, stop/flush, audio focus and interruption handling.

## Offer the selected model's languages

Use `HostCapabilities.synthesisModels()` and the relevant status/profile metadata. Expose voices and locales from the selected/downloaded provider rather than a fixed union of every model in the catalogue. Refresh the UI after a model change.

Pocket TTS language packs, Kokoro, Supertonic and Piper voices have different coverage, downloads and licenses. Declared support, export parity and task-quality evidence are separate. A catalogue language count is not a quality guarantee or evidence that its voice is loaded.

Always-ready preferences, active conversation holds, system TTS selection and memory pressure determine residency. User Stop remains authoritative. Handle not-ready, model-change and disconnect events without replaying old audio.

[Installation](install.md) · [Text tasks](tasks.md) · [Tools and memory](tools-and-memory.md)
