# The PC only transcribes; the phone still matches, and the transcript file is eppy's own storage JSON

> For read along on the PC, the PC now matches too (ADR 0003). On the phone this ADR still holds.

Transcribing on the phone is slow (a 57-hour book takes days) and only moderately accurate, so a PC with a strong GPU can make the transcript instead. The PC does transcription only: it writes `<audio basename>.transcript.json` next to the audio file, in exactly the v1 JSON that `FileTranscript` already stores (`covered` = the whole file). The phone imports it as that file's transcript and keeps doing matching (TranscriptSync) and skipped passages as before. Using the phone's own format means import is "check name and length, then copy": the phone needs no new parser, and transcripts from either source behave the same.

## Considered Options

- **Readaloud EPUB (Storyteller, EPUB 3 Media Overlays).** eppy already reads overlays as exact sync, but Storyteller re-encodes and splits the audio, so its timeline can drift from the m4b SABP plays. Skipped passages wouldn't be marked, because they come from the transcript, and the EPUB gets huge.
- **PC computes the whole sync and sends anchors.** This duplicates the phone's matching logic for little gain.
- **WhisperX JSON, WebVTT word cues or SRT as the interchange format.** WhisperX and WebVTT need a converter on the phone, and SRT loses per-word times, which TranscriptSync needs.
- **WhisperX forced alignment.** TranscriptSync matches runs of 14 words, so word times that are a few hundred ms more precise don't change the result, and alignment adds torch plus an alignment model.

## Consequences

- Changing the storage format (for example to shrink large transcripts) also changes the transcript file format, so the PC tool and the phone must move together. The `v` field guards this: the phone refuses a version it doesn't know.
- Import replaces the phone's partial transcript of that audio file; it never merges the two.
