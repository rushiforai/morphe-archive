r"""Makes align.bin: the reference results of Mor's align.py (the music filter's lining up), for AlignTest to
check the Java port against. filter.bin comes from Mor's own make_filter_fixture.py. Run with Mor's helper Python:

    <Mor>\helper\.venv\Scripts\python make_align_fixture.py <Mor>\helper

Layout (little-endian): see AlignTest.
"""
import struct
import sys
from pathlib import Path

import numpy as np

sys.path.insert(0, sys.argv[1])
from mor_helper.musicfilter import align  # noqa: E402

RATE = 48000
rng = np.random.default_rng(11)
n = 30 * RATE
# a "song": noise shaped into notes, so it has structure like music
t = np.arange(n) / RATE
notes = np.sin(2 * np.pi * (220 + 40 * np.floor(t * 2) % 400) * t)
song = ((rng.standard_normal((2, n)) * 0.3 + notes) * 9000).clip(-32768, 32767).astype(np.int16)
mono = song.mean(0, dtype=np.float32) / 32768.0
offset = 123457
stream_len = 8 * RATE
stream = (mono[offset:offset + stream_len] * 0.7 + rng.standard_normal(stream_len).astype(np.float32) * 0.05)
stream = stream.astype(np.float32)

reduced_song = align.reduce(mono)
found_at, found_score = align.find(stream, mono, reduced_song)
still_at, still_score = align.still(stream[: 4 * RATE], mono, reduced_song, offset + 40)
other = (rng.standard_normal(4 * RATE) * 0.2).astype(np.float32)
miss_at, miss_score = align.still(other, mono, reduced_song, offset)
prints = [align.thin(align.reduce((rng.standard_normal(20 * RATE) * 0.2).astype(np.float32))),
          align.thin(reduced_song)]
known_at, known_score = align.known(stream, prints)

with open(Path(__file__).with_name("align.bin"), "wb") as f:
    f.write(struct.pack("<ii", n, stream_len))
    f.write(song.astype("<i2").tobytes())
    f.write(stream.astype("<f4").tobytes())
    f.write(other.astype("<f4").tobytes())
    f.write(struct.pack("<i", len(reduced_song)))
    f.write(reduced_song.astype("<f4").tobytes())
    f.write(struct.pack("<qd", -1 if found_at is None else found_at, found_score))
    f.write(struct.pack("<qd", -1 if still_at is None else still_at, still_score))
    f.write(struct.pack("<qd", -1 if miss_at is None else miss_at, miss_score))
    f.write(struct.pack("<qd", -1 if known_at is None else known_at, known_score))
    f.write(struct.pack("<i", len(prints[0])))
    f.write(prints[0].astype("<f4").tobytes())
print("found", found_at, found_score, "still", still_at, still_score, "miss", miss_at, miss_score,
      "known", known_at, known_score)
