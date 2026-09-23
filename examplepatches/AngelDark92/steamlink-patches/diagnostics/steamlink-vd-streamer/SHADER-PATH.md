# Installed Windows PCVR shader evidence

2026-09-22; Streamer **1.34.22.0**. [Installed inputs](installed-inputs.json) pin
the executable and 4 Effects files. [disassemble_shaders.py](disassemble_shaders.py)
reads embedded DXBC containers, validates their declared chunk boundaries and calls
Microsoft's [D3DDisassemble](https://learn.microsoft.com/en-us/windows/win32/api/d3dcompiler/nf-d3dcompiler-d3ddisassemble).
It does not run the shaders. Signature-only containers are excluded.

[shader-inventory.json](shader-inventory.json) records **76** shader bodies from
the executable and Effects files. The standalone PCVR effect pixel shaders are:

| Source | DXBC offset | Relevant result |
|---|---|---|
| `Effects/Fovea.tkb` | `0x21` | Optional adaptive sharpening, then saturated RGB raised to Gamma |
| `Effects/Foveation.tkb` | `0x1e7` | Spatial warp and optional sharpening, then the same power function |
| `Effects/Sharpening.tkb` | `0x1e7` | Optional sharpening, then the same power function |
| `Effects/Supersample.tkb` | `0x1e7` | 4 input samples averaged; alpha = 1 |

In `build/vd-streamer-shaders/Fovea-21.asm`, instructions 65-69 are:

```text
mov_sat r1.xyz, r1.xyzx
log r0.xyz, r1.xyzx
mul r0.xyz, r0.xyzx, cb0[0].xxxx
exp o0.xyz, r0.xyzx
mov o0.w, l(1.000000)
```

DXBC `log`/`exp` here implement the power expression, not an RGB noise hash.
Foveation instructions 76-80 and Sharpening instructions 62-66 perform the same
operation using `cb0[0].z` for Gamma. Sharpening's integer bit patterns belong to
reciprocal/square-root approximations; they are not evidence of random noise.

Managed code binds the effect parameter named `Gamma` and sets both the base and
foveal effect instances. The normal value is `0.9 / SharedUserSettings.Gamma`, whose
default is 1.0. The HMD predicate selecting the alternate 0.6 factor always returns
false in this executable. A special process-name set only contains
`GrimVRClient-Win64-Shipping`; its adjustment is separate from codec selection.
See [the IL trace](STREAMER-CODEC-ROUTING.md) for tokens, branches and bindings.

These shaders contain sampling, spatial filtering and a transfer adjustment. The
traced bodies contain no explicit dither texture, time-varying noise or final
10-to-8 quantizer. The only fraction/round search hit across the scanned bodies is
`round_ni` in the generic executable's `MipmapCS` coordinate logic, not these video
effects. Opcode searches alone are not a proof about every program or driver
stage; the conclusion is limited to the traced video effects.

The power function runs **on the PC before encoding**. Moving it into an Android
post-decode shader would change its relationship to color conversion and codec
quantization. Therefore no additional client gamma operation was implemented.
