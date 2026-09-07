# RGB10 patch recheck — 2026-09-06

**RGB10 projection output is working in the sampled run.**

Read live from the connected headset at approximately 13:43 Europe/Paris, using buffered startup logs from the running Steam Link process. Installed package reports 2.0.20 / 5001712. No app restart or installation was performed for this recheck.

| Evidence | Result |
|---|---|
| Projection frames at 13:40:59 | 3 samples, each with 2 projection layers and 4 views |
| Every sampled projection view | 32857 / GL_RGB10_A2, 1536 × 1536 |
| Corresponding submissions | Frames 1, 2 and 3: result 0, original projection pointers preserved |
| Decoder configuration | c2.qti.hevc.decoder; raw.pixel-format.value = 54 (P010 configuration) |
| Other successful allocations | 35907 / GL_SRGB8_ALPHA8 at 1280 × 800; these handles are not referenced by the sampled projection views |

The previous sample used GL_SRGB8_ALPHA8 for its projections. The new sample removes that observed 8-bit projection-storage bottleneck. The presence of other 8-bit allocations does not contradict the projection result.

Source review: OledCalibrationPatch.kt supports the exact 2.0.20 / 5001712 layout and changes its 2 guarded projection-format instruction sites, at 0x10a9c4 and 0x10aa34. The RGB10 option also generates an explicit sRGB-to-linear conversion and lower-amplitude dither. It does not replace every swapchain allocation or modify the host encoder or Android decoder.

This confirms successful RGB10 storage/submission for these sampled frames. It does not validate decoded pixel values, lower-bit preservation through shader arithmetic, or the compositor and physical panel. Buffered samples describe the recorded run; they are not continuous per-frame monitoring.
