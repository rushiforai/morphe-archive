r"""Makes shazam.bin: 12 s of 16 kHz mono sound and the Shazam signature shazamio_core (SongRec's algorithm) makes
of it, for ShazamSignatureTest to check the Java port against. Run with Mor's helper Python:

    <Mor>\helper\.venv\Scripts\python make_shazam_fixture.py

Layout (little-endian): int32 samples, int16 samples, int32 uri length, uri (ASCII).
"""
import asyncio
import io
import struct
import wave
from pathlib import Path

import numpy as np
from shazamio_core import Recognizer, SearchParams

RATE = 16000
rng = np.random.default_rng(5)
t = np.arange(12 * RATE) / RATE
tones = sum(np.sin(2 * np.pi * f * t + p) * (0.5 + 0.5 * np.sin(2 * np.pi * r * t))
            for f, p, r in [(330, 0, 0.7), (523, 1, 1.3), (880, 2, 0.4), (1760, 0.5, 2.1), (2637, 1.5, 0.9)])
sound = ((tones / 5 + rng.standard_normal(len(t)) * 0.05) * 20000).clip(-32768, 32767).astype("<i2")
out = io.BytesIO()
with wave.open(out, "wb") as w:
    w.setnchannels(1)
    w.setsampwidth(2)
    w.setframerate(RATE)
    w.writeframes(sound.tobytes())


async def make():
    return await Recognizer().recognize_bytes(value=out.getvalue(), options=SearchParams(segment_duration_seconds=12))

signature = asyncio.run(make())
uri = signature.signature.uri
with open(Path(__file__).with_name("shazam.bin"), "wb") as f:
    f.write(struct.pack("<i", len(sound)))
    f.write(sound.tobytes())
    f.write(struct.pack("<i", len(uri)))
    f.write(uri.encode("ascii"))
print(len(uri), signature.signature.samples, uri[:80])
