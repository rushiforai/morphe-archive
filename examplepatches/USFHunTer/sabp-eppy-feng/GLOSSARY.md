# Glossary

**Read along**: the paired EPUB or PDF follows the narration of the audiobook.

**Document**: the EPUB or PDF the user pairs with an audiobook. Used as a reference text.

**Transcript**: text made from the audiobook's audio, with a timing for each word. One per audio file. Made either on the phone, a little at a time, or on the PC in one go and then imported.
_Avoid_: text recognition (nothing is recognised in the document; the audio is transcribed); PC transcript (once imported it is the same thing).

**Transcript file**: a complete transcript of one audio file, made on the PC and put next to that audio file in the book folder, for eppy to import.

**Import**: eppy takes a transcript file as its audio file's transcript, replacing whatever the phone had transcribed of that file.

**Transcription progress**: how much of the audiobook's audio has a transcript, shown as "X of Y transcribed (Z%)".

**Skipped passage**: text in the document that the narrator never reads, confirmed by transcribed audio on both sides of it. Small differences (under about two sentences) are recognition noise, not skipped passages.
_Avoid_: missing text, missing part.

**Not yet transcribed**: document text the transcript hasn't reached. It may or may not be narrated, so it is never treated as a skipped passage.

**Speed up**: transcribing at charging speed for 30 minutes.

**Transcribe whole book**: keep transcribing one book until its transcription progress reaches 100%, regardless of where the listener is, instead of staying a few minutes ahead. It belongs to one book, keeps going in the background, and waits while another book is loaded.
_Avoid_: force read, read all the file.

**Skipped-passage crossing**: the moment normal playback reaches a skipped passage and the narration carries on after it. Seeking or jumping over a skipped passage is not a crossing.

**Full-screen reading**: the read-along text over the whole screen, with a mini player at the bottom, opened from the Read tab or the Read chip. The Read tab in the player stays as it is.
_Avoid_: reading mode, full-screen player.

**Read chip**: the first chip in the row under the player controls; opens the Read tab.

**Character note**: the short line under a character's name in the book's character list, written by the user or suggested.

**Suggested note**: a character note Gemini proposes for the user to edit and save. *From the book*: only from the document's text up to the listening position, so it can't spoil. *From the web*: general information found by searching, which may spoil.

**Listening position**: the document word the narration has reached; text after it hasn't been heard yet.

**Book folder**: the folder holding one audiobook's audio files, along with what belongs to that book: its playback position, bookmarks, character notes, transcript files, and the document for read along. Copy or sync the book folder, and all of these go with the book.

**Playback position**: where the listener is in the audiobook's audio: which audio file, and how far into it. It's the position the listener continues from on another device.
_Avoid_: listening position (that is a document word), progress (too vague: it could also mean transcription progress or statistics).

**Other device's position**: a playback position that another device (phone, tablet or PC) saved in the book folder, more recent than this device's and more than 30 seconds away from it. When two other devices saved one, it's the more recently played. eppy offers to jump to it, and never jumps without asking.
_Avoid_: synced progress, remote position.
