# pc-transcribe

Transcribes audiobooks on a PC with an NVIDIA GPU into **transcript files** that eppy imports when the Read tab
opens. See `../../.scratch/pc-transcribe/spec.md` and `../../docs/adr/0001-pc-transcribes-phone-matches.md`.

## Setup (Windows)

1. Install [uv](https://docs.astral.sh/uv/) and an NVIDIA driver recent enough for CUDA 12.
2. In this folder: `uv sync`. That installs faster-whisper and the CUDA 12 cuBLAS/cuDNN 9 runtime as pip wheels
   (`nvidia-cublas-cu12`, `nvidia-cudnn-cu12`); no CUDA Toolkit install is needed. `transcribe.py` adds their DLL
   folders itself. `pyproject.toml` asks uv for versions that ship Windows wheels, since some releases are Linux-only.
3. The first run downloads the Whisper large-v3 model (about 3 GB) from Hugging Face into `~/.cache/huggingface`.

Tested with Python 3.13, uv 0.11, an RTX 4090 and driver 621.14: a 57-hour m4b in 37 minutes (91x real time).

## Use

    uv run transcribe.py <audio file or folder>

- A folder is searched recursively for `.m4b .m4a .mp3 .ogg .opus .flac`. Folders holding a `.nomedia` or `.ignore`
  file are left out (handy for backups).
- Each audio file gets `<audio name without extension>.transcript.json` next to it. An audio file whose transcript file
  is newer than the audio is skipped, so running it again only does new or changed books.
- With an `.epub` in the audio's folder, the tool builds the same names prompt the phone builds (capitalised words the
  book never writes in lower case) and prints it once per book; it helps Whisper spell the names. No EPUB (or a PDF):
  no prompt.
- One progress line per file, then its speed. A file that fails (won't decode, ...) is reported and the run goes on;
  the exit code is 1 if any failed. Ctrl+C stops it; the file in progress gets no transcript file (it's written to a
  `.tmp` and renamed only when complete). There is no resume inside a file.
- The model loads once per run. Audio is decoded and transcribed in 30-minute pieces, so a 57-hour book needs no more
  memory than a short one. Each piece starts 30 seconds before the previous one ended (Whisper can drop the first
  words of a piece); only the words after the join are kept from it.
- **Speech Whisper left out is done again.** Whisper and its voice detector now and then skip a stretch of narration
  (10–20 seconds, often an effect voice), which eppy would then mark as a skipped passage. After each piece, every
  pause of 4–30 seconds between words that is loud (narration measures -14 to -25 dB; real pauses are below -40 dB),
  and every long segment with too few words, is transcribed again on its own, with up to three amounts of context
  around it, and the missing words are put in. This adds about 10% to the time.
- Times are in the audio file's own (container) time, which is what the phone's player and seeks use. A joined m4b
  trims a few samples at every chapter join that a decoder still outputs (7.7 s over a 57-hour volume).

Then copy the `.transcript.json` files into the book's folder on the phone, next to its audio files, and open the
book in eppy with its EPUB (or text PDF) paired. eppy imports them when it loads the book's document (opening the
book, switching back to it, or restarting the app), shows "Imported transcript for N file(s)", switches transcription
on for the book and shows 100%. The phone only imports a file that names one of the book's audio files, matches its length within
2 seconds and is complete; anything else is noted in Settings → Diagnostics. A newer copy is imported again.

## The transcript file

`{"v":1, "name":"<audio file name>", "dur":<ms>, "covered":[[0,<dur>]], "segs":[[t0,t1,text,[[w0,w1,word],...]],...]}`,
UTF-8, times in integer milliseconds from the start of that audio file: the format the phone stores its own
transcripts in (`FileTranscript.save`). Segments the phone would drop as hallucinations are dropped here too (empty,
repeated, short with a high no-speech probability, or all in `[...]` / `(...)`).

## Self-check (no GPU)

    uv run python -m unittest

## Checking skipped passages

To see whether the passages eppy marks "Not in the audiobook" really are missing from the audio, for a book folder
with one audio file, its `.transcript.json` and its `.epub`:

1. Run eppy's own matching on the PC (from the repo root, with the Android SDK in `ANDROID_HOME`):
   `EPPY_AUDIT_DIR="<book folder>" EPPY_AUDIT_OUT=ui-tests/build/skip-audit ./gradlew -p ui-tests testDebugUnitTest --tests '*SkipAudit*' --rerun`
   writes `skip-audit.json`.
2. `uv run audit_skips.py "<book folder>" <skip-audit.json> <report.html>` transcribes each marked stretch again on
   its own and writes a report: **false mark** (80%+ of the passage's words are in the audio), **probably skipped**
   (half or fewer), or unclear, with the time in the audio file. The report quotes only each passage's first and last
   words; keep it out of git all the same.
