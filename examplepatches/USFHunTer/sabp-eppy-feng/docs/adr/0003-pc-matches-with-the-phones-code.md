---
status: accepted (not built yet)
---

# The PC matches too, with the phone's own Java code, in a helper program

Read along on the PC runs in Audiobookshelf's web player (a userscript, in the separate local "PC read along" repo). It needs the transcript matched to the document there as well, and nothing syncs the phone's match to the PC. So a small helper program on the PC, compiled from the same `read/` Java sources the phone runs (`TextMatcher`, `BookText`, `Xhtml`, `Words`, `Alignment`, `FileTranscript`, `ChapterAligner`, `TranscriptSync`: plain Java plus org.json), matches a book the first time it's opened on the PC and keeps the result in its own cache on the PC, not in the book folder. ADR 0001 still holds for the phone: the phone imports transcript files and matches by itself; only "the PC transcribes only" no longer holds.

## Considered Options

- **Port the matching to JavaScript in the userscript.** No helper needed for matching, but the same algorithm would live in two languages and every fix would have to land twice.
- **The phone exports its match into the book folder.** One algorithm, but the PC would only work for books a phone had opened and matched.
- **pc-transcribe runs the match and writes it next to the transcript.** Rejected once the helper existed for positions (ADR 0004): matching on demand needs no extra step and puts nothing in the book folder for the phones to sync.

## Consequences

- The matching classes must stay free of Android imports. Android-only parts (opening a `Uri`, `PdfRenderer`) stay outside them, as they are now.
- A change to matching reaches the PC when the helper is rebuilt; the helper's cache is keyed so that a new build matches again.
