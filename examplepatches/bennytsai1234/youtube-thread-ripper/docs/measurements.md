# Measurements

Dated results behind the design choices. Phone: vivo V2417A (OriginOS, Android 16), YouTube 21.16.256 with official Morphe Patches 1.45.0, Spoof video streams = visionOS, home Wi-Fi, unless noted. Raw data in `.local/results/`. The network changes minute to minute: one run is one sample.

## Buffer without preload (2026-10-03)

DEFAULT buffer, 4K, 3x: the app is byte-limited, not time-limited. Its limit is about 20.8 MiB, and the buffer cycles 10–25 s of media (3–8 s real time at 3x).

## Preload (2026-10-03)

- 90 s / 250 MiB: the buffer reaches 90 s within about 6 s of playback and stays at 68–102 s; allocator up to about 190 MiB, Java heap up to about 300 of 512 MiB.
- 4K 3x with 300 MiB (about 150 s of media): allocator 312 MiB, Java heap peak 417 of 512 MiB in the first minute and 464 MiB later (318 MiB allocator), no crash. 250 MiB holds about 120 s of 4K.
- With 300 s / 250 MiB, whichever limit comes first (4K hits memory first): first byte 145 ms, first 1 MiB chunk 0.65 s after open, playback 5 s after app launch. Stalls in the first 30 s still happen when total throughput drops (12–14 Mbps over 8 connections for about 28 s) before the buffer has built up; 4K at 3x consumes about 50 Mbps.

## Buffer ceilings on the emulator (2026-10-03)

Paused, so only the LoadControl decision limits the buffer (`.local/results/bufexp-1003`):

- 1080p: Default 117 s (the app's time target starts near 20 s and grows about 10 s every 30–40 s for 5 min, then the 20.8 MiB limit); official Maximum 657 s (starts at 174 s, grows about 10 s every 4 s, stops at 128 MiB); preload 300 s / 250 MiB 309 s.
- 4K: Default 10 s, Maximum 63 s (128 MiB).

## Startup

- With equal-priority chunks a slow first segment (13 Mbps) delayed playback to 11 s vs 4.5 s native (one cold start each). After `Session` lowered Cronet priority with distance from the read position, the next cold start played at 4.2 s (first segment 40 Mbps, so not a clean comparison).
- Phone cold start (Maximum, 1080p, 3x, `debug.tr.log` Startup lines): about 3 s from `am start` to PLAYING, of which about 1.3 s is app start before the first media request; MediaSession PLAYING matched the first moving frame within 0.5 s.

## Network

DNS was ruled out for the slow window seen on 2026-10-03: the same node and answers from every resolver; the China ROM itself appends 114.114.114.114 to DHCP DNS.

## WireGuard (2026-10-09)

`WireGuard`, `Blake2s` and `X25519` were verified on the PC against RFC 7693/7748 vectors and a live WARP handshake (wgcf-registered device, ICMP to 1.1.1.1, 12 ms).
