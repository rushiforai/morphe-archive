"""15秒の映像用にオリジナルの電子音・効果音を生成する。外部音源は使用しない。"""
import math
from pathlib import Path
import random
import struct
import wave

RATE = 48000
DURATION = 15
rng = random.Random(7)
audio = [0.0] * (RATE * DURATION)


def add(start, duration, synth, gain):
    first = int(start * RATE)
    for i in range(min(int(duration * RATE), len(audio) - first)):
        t = i / RATE
        audio[first + i] += gain * synth(t)


# 120 BPM。柔らかなキックと短いハット。
for beat in range(30):
    add(beat * 0.5, 0.24, lambda t: math.sin(2 * math.pi * (48 * t + 1.4 * (1 - math.exp(-t * 35)))) * math.exp(-t * 22) * min(1, t * 800), 0.42)
    add(beat * 0.5 + 0.25, 0.06, lambda t: rng.uniform(-1, 1) * math.exp(-t * 90) * min(1, t * 2000), 0.065)
    if beat % 2:
        add(beat * 0.5, 0.13, lambda t: rng.uniform(-1, 1) * math.exp(-t * 38) * min(1, t * 1000), 0.095)

# ペンタトニックの短いプラック。終盤はロゴ用に余韻を残す。
notes = [220, 329.6276, 440, 493.8833, 659.2551, 493.8833, 440, 329.6276]
for step in range(56):
    hz = notes[step % len(notes)]
    add(step * 0.25, 0.42, lambda t, hz=hz: (math.sin(2 * math.pi * hz * t) + 0.22 * math.sin(4 * math.pi * hz * t)) * math.exp(-t * 12) * min(1, t * 500), 0.1)
for at in [1.85, 5.35, 8.35, 10.85]:
    add(at, 0.3, lambda t: rng.uniform(-1, 1) * math.sin(math.pi * t / 0.3) ** 2, 0.10)
for hz in [220, 329.6276, 440, 659.2551]:
    add(11, 3.8, lambda t, hz=hz: math.sin(2 * math.pi * hz * t) * math.exp(-t * 1.8) * min(1, t * 40), 0.08)

peak = max(abs(x) for x in audio)
out = Path(__file__).resolve().parents[1] / 'public/audio/short-beat.wav'
out.parent.mkdir(parents=True, exist_ok=True)
with wave.open(str(out), 'wb') as wav:
    wav.setnchannels(1)
    wav.setsampwidth(2)
    wav.setframerate(RATE)
    frames = bytearray()
    for i, value in enumerate(audio):
        fade = min(1, i / (RATE * 0.015), (len(audio) - i) / (RATE * 0.4))
        frames.extend(struct.pack('<h', int(value / max(peak, 1) * fade * 29000)))
    wav.writeframes(frames)
print(out)
