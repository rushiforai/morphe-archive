# Live 10-bit decoder check — 2026-09-25

Read-only capture at approximately 17:52–17:55 Europe/Paris from the connected Galaxy XR. The running application is **Steam Link 2.0.20 / 5001712**, package `com.valvesoftware.steamlinkvr`, PID **17301**. Device build: `UML2.260301.001.I610UEU2AZF3`. This is evidence from the installed application and active session, not from a fixture APK.

## Finding

**The active session uses a decoder-reported 10-bit P010 output path.** Host 10-bit selection and the headset's accepted post-decode output format agree. This is stronger than merely observing the selected option or a decoder configuration request. It does not measure the meaningful low bits in decoded pixels, parse the incoming HEVC bitstream, or establish precision after GPU external-texture import.

| Stage | Current-session evidence | What it establishes |
|---|---|---|
| Host | 17:49:25.927 connection active; 17:49:26.075 `Using 10bit mode: 1` | Host selected 10-bit encoding mode |
| App decoder ownership | Media resource manager associates PID 17301 with `c2.qti.hevc.decoder`; client allocation at 17:49:23 | The decoder belongs to the running Steam Link process |
| Qualcomm decoder output | 17:49:27.138 `[hevcD_29] Output Format at frame 0: YCBCR_420_P010 1536x6144` | Decoder reports accepted P010 output after receiving frames |
| App output notification | 17:49:27.139 `c2.qti.hevc.decoder#624:2D-Output` changes to `video/raw`, width 1536, height 6144, `color-format=54` | Matching P010 output reported to the application, 1 ms after the vendor event |
| Continuing activity | Same component reaches 23,540 completed works at 17:53:48.954, about 90/s; app PID remains 17301 | The evidence belongs to the still-running session rather than a completed previous decoder |
| Blue-noise integration | 17:49:23.332–.333 both background and foveal sources recognized and programs linked | Both helpers' shader integration succeeded; this is not a per-draw execution counter |
| Submitted output | `GXRSurfaceTrigger` frames 1–3 report 2 source projections / 4 views, each format 35907 (`GL_SRGB8_ALPHA8`) | Actual sampled OpenXR submissions use the intended 8-bit sRGB endpoint |

The local NDK `android/hardware_buffer.h` identifies `AHARDWAREBUFFER_FORMAT_YCbCr_P010 = 0x36` (54) and its external-sampler access. P010 is the 10-bit YUV format; a P010 format report alone does not prove that all low bits carry information.

No `SLBlueNoise` unknown-source, restored-original or left-undithered fallback message appears in the retained current-PID log. Shader-link messages and absence of logged fallback do not directly measure every draw's `SL_enabled` uniform. The app log also contains `glDetachShader` INVALID_OPERATION messages, including before these programs were recognized; their cause was not investigated here and they are not evidence of 8-bit decoder fallback.

The startup `profile=1` and `coded.pl.profile=24576` entries precede decoded output and must not be treated as a parsed HEVC SPS result. The actual incoming SPS and its `bit_depth_luma_minus8` / `bit_depth_chroma_minus8` fields were not exposed by this capture. No content sample was read back to test whether low bits survive decoder/import/sampling. The next unresolved boundary is **P010 output → external texture sampling → the quantizer**, not whether the application requested an 8-bit output swapchain.

## Evidence and scope

- [session.json](session.json): application/device identity, current PID and findings.
- [host-selected.txt](host-selected.txt): current connection and host mode.
- [headset-app-selected.txt](headset-app-selected.txt): current-PID codec, helper and projection telemetry.
- [headset-vendor-codec.txt](headset-vendor-codec.txt): vendor decoder lifecycle and output format, including preceding sessions for correlation. Only component **29** belongs to this session.
- [media-resource-manager.txt](media-resource-manager.txt): current process/codec ownership and lifecycle.
- [live-decoder-end.txt](live-decoder-end.txt): continuing current-component decoding during the audit.
- `media-metrics-selected.txt`: ancillary completed-session records; not used as current-session precision proof.

Used the bundled `../Tools/install/platform-tools/adb.exe` for `devices -l`, selected properties/package identity, `pidof`, `logcat -d`, and `dumpsys media.resource_manager` / `media.metrics`. `dumpsys media.codec` is unavailable on this headset (`Can't find service`). No root, APK installation, settings changes, restart, log clearing, screen capture, or stream reconfiguration occurred. USB ADB access does not establish the stream transport.

All retained files are compact diagnostic text, not copied APKs, decoded derivatives or compiler outputs. No temporary package/build artifacts were created; no production code or payload changed. Earlier cleanup allowlists and unrelated files were left untouched.
