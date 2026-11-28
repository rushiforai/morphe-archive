"""Transcribe audiobooks into transcript files eppy imports.

    uv run transcribe.py <audio file or folder>

Writes <audio name without extension>.transcript.json next to each audio file, in the JSON FileTranscript.save
writes on the phone. A folder is searched recursively; audio whose transcript file is newer is skipped, and so are
folders holding a .nomedia or .ignore file. See ../../.scratch/pc-transcribe/spec.md.
"""
import bisect
import json
import os
import re
import sys
import time
import zipfile
from html.parser import HTMLParser
from pathlib import Path

AUDIO = (".m4b", ".m4a", ".mp3", ".ogg", ".opus", ".flac")
SR = 16000
CHUNK_S = 30 * 60  # audio is decoded and transcribed in pieces of about this length, so a 57 h book fits in RAM
TAIL_S = 60  # segments ending in the last minute of a piece are redone with the next piece (no cut words)
OVERLAP_S = 30  # the next piece starts this much before the cut; only words after the cut are kept from it
GAP_S = 4.0  # a pause this long between words in narration is usually speech Whisper left out
SPARSE_WPS, SPARSE_MIN_S = 1.2, 8.0  # a segment this long with fewer words per second probably lost some
REDO_MAX_S = 30.0  # longer pauses are real breaks
REDO_PADS_S = (5.0, 10.0, 15.0)  # context around a stretch done again, tried in turn
REDO_ENOUGH_WPS = 1.5  # words per second that count as the stretch recovered (narration is about 2.6)


def add_cuda_dlls():
    """Windows: CTranslate2 finds cuBLAS/cuDNN from the nvidia-*-cu12 wheels only if their bin folders are searched."""
    if os.name != "nt":
        return
    import importlib.util
    spec = importlib.util.find_spec("nvidia")
    for root in (spec.submodule_search_locations or []) if spec else []:
        for sub in Path(root).iterdir():
            b = sub / "bin"
            if b.is_dir():
                os.add_dll_directory(str(b))
                os.environ["PATH"] = str(b) + os.pathsep + os.environ["PATH"]


class Filter:
    """Segments -> [t0, t1, text, [[w0, w1, word], ...]] in ms, dropping what Transcriber.parse drops."""

    def __init__(self):
        self.prev = None

    def convert(self, segments, offset_ms=0):
        out = []
        for s in segments:
            text = s.text.strip()
            if not text or text == self.prev:
                continue
            if s.no_speech_prob > 0.6 and len(text) < 12:
                continue
            if text[0] == "[" and text[-1] == "]" or text[0] == "(" and text[-1] == ")":  # [Music]
                continue
            self.prev = text
            words = []
            for w in s.words or []:
                word = w.word.strip()
                if word:
                    words.append([offset_ms + ms(w.start), offset_ms + ms(w.end), word])
            out.append([offset_ms + ms(s.start), offset_ms + ms(s.end), text, words])
        return out


def ms(seconds):
    return int(round(seconds * 1000))


class Timeline:
    """
    Decoded time -> container time, in ms. A decoder outputs every sample, but a joined m4b says some aren't played
    (encoder delay at each chapter join: 7.7 s over a 57 h volume). The phone's player, seeks and own transcripts use
    container time, so every time written to the transcript file is converted.
    """

    def __init__(self):
        self.at, self.off = [0.0], [0.0]  # from decoded ms at[i] on, container = decoded + off[i]

    def add(self, decoded_ms, container_ms):
        off = container_ms - decoded_ms
        if abs(off - self.off[-1]) >= 1:  # only where the offset changes (chapter joins), not per frame
            self.at.append(decoded_ms)
            self.off.append(off)

    def __call__(self, decoded_ms):
        return max(0, int(round(decoded_ms + self.off[bisect.bisect_right(self.at, decoded_ms) - 1])))

    def frames(self, frames):
        """Passes decoded frames through, noting where each one is in decoded and container time."""
        pos = 0
        for f in frames:
            if f.time is not None:
                self.add(pos * 1000 / f.sample_rate, f.time * 1000)
            pos += f.samples
            yield f

    def segs(self, segs):
        return [[self(a), self(b), text, [[self(w0), self(w1), w] for w0, w1, w in words]] for a, b, text, words in segs]


def pcm_pieces(path, timeline):
    """Yields the audio as 16 kHz mono float32 arrays of about CHUNK_S seconds each."""
    import av
    import numpy as np
    from faster_whisper.audio import _group_frames, _ignore_invalid_frames, _resample_frames

    resampler = av.audio.resampler.AudioResampler(format="s16", layout="mono", rate=SR)
    buf, n = [], 0
    with av.open(str(path), mode="r") as container:
        decoded = timeline.frames(_ignore_invalid_frames(container.decode(audio=0)))
        frames = _resample_frames(_group_frames(decoded, 500000), resampler)
        for frame in frames:
            a = frame.to_ndarray().reshape(-1)
            buf.append(a)
            n += len(a)
            if n >= CHUNK_S * SR:
                yield np.concatenate(buf).astype(np.float32) / 32768.0
                buf, n = [], 0
    if buf:
        yield np.concatenate(buf).astype(np.float32) / 32768.0


# ---- names prompt, ported from TranscriptSync.namesPrompt (paragraphs split as in Xhtml.toParagraphs) -------------

BLOCK = {"p", "div", "h1", "h2", "h3", "h4", "h5", "h6", "li", "blockquote", "section", "article", "tr", "dd", "dt",
         "figcaption", "pre", "hr", "header", "footer", "aside", "body"}
SKIP = {"script", "style", "head", "title"}
WORD = re.compile(r"[^\W\d_](?:[^\W\d_]|['’-])*")  # \p{L}[\p{L}'’-]*
SENTENCE_END = re.compile(r"[.!?:;\"“”]\s*$")


class Paragraphs(HTMLParser):
    """XHTML -> [(text, is_heading)]."""

    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.out, self.buf, self.heading, self.skip = [], [], False, 0

    def handle_starttag(self, tag, attrs):
        self._tag(tag, False)

    def handle_startendtag(self, tag, attrs):
        if tag in BLOCK:
            self._flush()
            self.heading = False
        elif tag == "br":
            self.buf.append(" ")

    def handle_endtag(self, tag):
        self._tag(tag, True)

    def _tag(self, tag, closing):
        if tag in SKIP:
            self.skip = max(0, self.skip - 1) if closing else self.skip + 1
        elif self.skip:
            pass
        elif tag == "br":
            self.buf.append(" ")
        elif tag in BLOCK:
            self._flush()
            self.heading = not closing and len(tag) == 2 and tag[0] == "h" and tag[1].isdigit()

    def handle_data(self, data):
        if not self.skip:
            self.buf.append(data)

    def _flush(self):
        s = " ".join("".join(self.buf).split())
        if s:
            self.out.append((s, self.heading))
        self.buf = []

    def close(self):
        super().close()
        self._flush()


def epub_paragraphs(epub):
    with zipfile.ZipFile(epub) as z:
        for n in z.namelist():  # shortcut: zip order, not spine order; only ties in the prompt depend on it
            if n.lower().endswith((".xhtml", ".html", ".htm")):
                p = Paragraphs()
                p.feed(z.read(n).decode("utf-8", errors="replace"))
                p.close()
                yield from p.out


def names_prompt(paragraphs):
    """Names and other capitalised words that the book never writes in lower case."""
    caps, lower = {}, set()
    for text, heading in paragraphs:
        if heading:
            continue
        last_end, sentence_start = 0, True
        for m in WORD.finditer(text):
            if SENTENCE_END.search(text[last_end:m.start()]):
                sentence_start = True
            w = m.group()
            last_end = m.end()
            if w[0].islower():
                lower.add(w.lower())
            elif not sentence_start and len(w) > 2 and w != w.upper():
                caps[w] = caps.get(w, 0) + 1
            sentence_start = False
    names = sorted((w for w, n in caps.items() if n >= 3 and w.lower() not in lower), key=lambda w: -caps[w])
    s = ""
    for w in names:
        if len(s) + len(w) > 380:
            break
        s += (", " if s else "") + w
    return s + "." if s else None


def book_prompt(folder):
    """The names prompt from the first .epub in the folder, or None."""
    epubs = sorted(folder.glob("*.epub"))
    return names_prompt(epub_paragraphs(epubs[0])) if epubs else None


def transcript_path(audio):
    return audio.with_name(audio.stem + ".transcript.json")


def seg(start, end, words, no_speech_prob=0.0):
    """A segment like faster-whisper's, made from words (whose text keeps its leading space)."""
    from types import SimpleNamespace
    return SimpleNamespace(start=start, end=end, text="".join(w.word for w in words).strip(), words=words,
                           no_speech_prob=no_speech_prob)


def shifted(segs, by):
    """Segments with all times moved by `by` seconds."""
    from types import SimpleNamespace
    return [seg(s.start + by, s.end + by, [SimpleNamespace(start=w.start + by, end=w.end + by, word=w.word)
                                         for w in s.words or []], s.no_speech_prob) for s in segs]


def words_from(segs, t):
    """Only the words starting at or after t (seconds); segments left without words are dropped."""
    out = []
    for s in segs:
        if s.start >= t:
            out.append(s)
            continue
        kept = [w for w in s.words or [] if w.start >= t]
        if kept:
            out.append(seg(kept[0].start, s.end, kept, s.no_speech_prob))
    return out


def stretches(segs, t0, t1):
    """Stretches of [t0, t1) (seconds) where Whisper probably left speech out: long pauses between words, and
    long segments with too few words. The VAD can miss speech too, so pauses count even where it saw none."""
    out = []
    words = [w for s in segs for w in s.words or []]
    prev = t0
    for w in words + [None]:
        start = w.start if w else t1
        if GAP_S <= start - prev <= REDO_MAX_S:
            out.append((prev, start))
        if w:
            prev = max(prev, w.end)
    for s in segs:
        d = s.end - s.start
        if d >= SPARSE_MIN_S and len(s.words or []) / d < SPARSE_WPS:
            out.append((s.start, s.end))
    return sorted(out)


def loud(buf, a, b):
    """True if [a, b) (seconds) sounds like speech, not a pause: the loudest 10% of 50 ms frames above -38 dBFS.
    Narration measured -14 to -25 dB, the pauses between chapters below -40 dB."""
    import numpy as np
    x = buf[int(a * SR):int(b * SR)]
    n = len(x) // 800 * 800
    if n == 0:
        return False
    frames = x[:n].reshape(-1, 800)
    return float(np.percentile(20 * np.log10(np.sqrt((frames ** 2).mean(1)) + 1e-9), 90)) > -38


def redo(model, buf, segs, prompt, t0, t1):
    """Transcribes the suspicious stretches of [t0, t1) again on their own and puts in what was missing."""
    out = list(segs)
    for a, b in stretches(segs, t0, t1):
        if not loud(buf, a, b):  # a real pause
            continue
        # Whisper (and its VAD) drop such a stretch again or not depending on where the window starts: try a few.
        new = []
        for pad in REDO_PADS_S:
            lo, hi = max(0.0, a - pad), min(len(buf) / SR, b + pad)
            found, _ = model.transcribe(buf[int(lo * SR):int(hi * SR)], language="en", word_timestamps=True,
                                        vad_filter=True, initial_prompt=prompt, batch_size=16)
            got = [w for s in shifted(list(found), lo) for w in s.words if a - 0.2 <= w.start and w.end <= b + 0.2]
            if len(got) > len(new):
                new = got
            if len(new) >= REDO_ENOUGH_WPS * (b - a):
                break
        old = [w for s in out for w in s.words or [] if a - 0.2 <= w.start and w.end <= b + 0.2]
        if len(new) < max(3, 1.5 * len(old) + 3):
            continue
        # Replace what was there in the stretch with the new words.
        kept = []
        for s in out:
            rest = [w for w in s.words or [] if not (a - 0.2 <= w.start and w.end <= b + 0.2)]
            if len(rest) == len(s.words or []):
                kept.append(s)
            elif rest:
                kept.append(seg(rest[0].start, rest[-1].end, rest, s.no_speech_prob))
        out = sorted(kept + [seg(new[0].start, new[-1].end, new)], key=lambda s: s.start)
    return out


def transcribe_file(model, audio, prompt=None, progress=None):
    """Transcribes one audio file and writes its transcript file. Returns the transcript dict."""
    import numpy as np

    flt = Filter()
    segs = []
    carry = np.zeros(0, dtype=np.float32)
    offset = 0  # samples before carry[0]
    fresh = 0  # samples at the start of carry already transcribed by the previous piece (the overlap)
    timeline = Timeline()
    pieces = pcm_pieces(audio, timeline)
    piece = next(pieces, None)
    while piece is not None:
        nxt = next(pieces, None)
        buf = np.concatenate([carry, piece])
        last = nxt is None
        found, _ = model.transcribe(buf, language="en", word_timestamps=True, vad_filter=True,
                                    initial_prompt=prompt, batch_size=16)
        found = words_from(list(found), fresh / SR)
        cut = len(buf)
        if not last:
            # Keep segments that end before the tail; the tail starts again in the next piece.
            limit = len(buf) / SR - TAIL_S
            keep = [s for s in found if s.end <= limit]
            cut = int(keep[-1].end * SR) if keep else int(limit * SR)
            found = keep
        found = redo(model, buf, found, prompt, fresh / SR, cut / SR)
        segs += flt.convert(found, ms(offset / SR))
        if progress and segs:
            progress(segs[-1][1])
        # The next piece starts a little before the cut, so its first words have context (Whisper can drop the
        # start of a piece); words before the cut are dropped from it.
        start = max(0, cut - OVERLAP_S * SR)
        carry = buf[start:]
        fresh = cut - start
        offset += start
        piece = nxt
    dur = timeline(1000 * (offset + len(carry)) / SR)
    t = {"v": 1, "name": audio.name, "dur": dur, "covered": [[0, dur]], "segs": timeline.segs(segs)}
    write(transcript_path(audio), t)
    return t


def write(path, t):
    tmp = path.with_name(path.name + ".tmp")
    try:
        with open(tmp, "w", encoding="utf-8") as f:
            json.dump(t, f, ensure_ascii=False, separators=(",", ":"))
        os.replace(tmp, path)
    finally:
        tmp.unlink(missing_ok=True)


def load_model():
    add_cuda_dlls()
    from faster_whisper import BatchedInferencePipeline, WhisperModel
    return BatchedInferencePipeline(model=WhisperModel("large-v3", device="cuda", compute_type="float16"))


def probe_ms(audio):
    """Container duration for the progress line only (the transcript's dur comes from the decoded audio)."""
    import av
    try:
        with av.open(str(audio)) as c:
            return max(1, (c.duration or 0) // 1000)
    except Exception:
        return 1


def find_audio(path):
    if path.is_file():
        return [path]
    out = []
    for root, dirs, files in os.walk(path):
        if ".nomedia" in files or ".ignore" in files:
            dirs.clear()
            continue
        dirs.sort()
        out += [Path(root) / f for f in sorted(files) if f.lower().endswith(AUDIO)]
    return out


def needs_work(audio):
    t = transcript_path(audio)
    return not (t.is_file() and t.stat().st_mtime > audio.stat().st_mtime)


def main(argv):
    if len(argv) != 2:
        print(__doc__)
        return 2
    path = Path(argv[1])
    if not path.exists():
        print(f"Not found: {path}")
        return 2
    todo = [a for a in find_audio(path) if needs_work(a)]
    print(f"{len(todo)} audio file(s) to transcribe")
    if not todo:
        return 0
    model = load_model()
    prompts, failed = {}, 0
    try:
        for audio in todo:
            if audio.parent not in prompts:
                prompts[audio.parent] = book_prompt(audio.parent)
                print(f"{audio.parent.name}: names prompt: {prompts[audio.parent]}")
            start = time.time()
            total = probe_ms(audio)

            def progress(t_ms, start=start, audio=audio, total=total):
                print(f"\r{audio.name}: {100 * t_ms / total:.0f}%, {time.time() - start:.0f} s", end="", flush=True)

            try:
                t = transcribe_file(model, audio, prompts[audio.parent], progress)
                took = time.time() - start
                print(f"\r{audio.name}: 100%, {t['dur'] / 3.6e6:.2f} h in {took / 60:.1f} min "
                      f"({t['dur'] / 1000 / max(took, 1e-9):.0f}x), {len(t['segs'])} segments")
            except Exception as e:  # one bad file doesn't stop the library
                failed += 1
                print(f"\n{audio.name}: FAILED: {e!r}")
    except KeyboardInterrupt:
        print("\nStopped. The file in progress has no transcript file.")
        return 130
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
