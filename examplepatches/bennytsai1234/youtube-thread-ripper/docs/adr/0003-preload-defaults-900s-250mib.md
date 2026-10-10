# Preload defaults: 900 s or 250 MiB, whichever comes first

2026-10-03, `47fca6f`, `1cd2b10`. YouTube's Java heap limit is 512 MiB: with a 300 MiB buffer at 4K 3x the heap peaked at 464 MiB, so the memory default is 250 MiB (about 120 s of 4K). The time default was 300 s until the emulator showed the official "Playback buffer size" = Maximum buffering 657 s at 1080p, more than our 300 s target; it became 900 s so the preload target no longer buffers less than the official setting. Numbers: `docs/measurements.md`.
