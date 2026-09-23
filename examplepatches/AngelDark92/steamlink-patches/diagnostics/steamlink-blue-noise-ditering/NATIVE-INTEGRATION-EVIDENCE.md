# Fovea-only shader interception: exact native integration

Measured 2026-09-22 from the 3 decoded inputs listed in
[`native-layouts.json`](native-layouts.json). All source hashes remained unchanged.
This is static native-path evidence, not an APK install, Android linker test,
GPU compilation, live host-shader capture, or headset/panel result. The
2.0.20/5001712 input remains an analysis reconstruction.

## Loading and interception

All 3 scene libraries have an explicit `DT_NEEDED` reference to `libGLESv3.so`.
Its 12-byte string slot can hold `libgxd.so` plus NUL padding. The helper must
depend on the real GLESv3 and EGL libraries so unrelated imports remain available.
Only these scene imports are renamed; each is `SHN_UNDEF`, global/default-visible,
and referenced by an `R_AARCH64_JUMP_SLOT` relocation:

- `glShaderSource` → `gxShaderSource`.
- `glDrawArrays` → `gxDrawArrays`.
- `eglCreateContext`, `eglDestroyContext`, `eglMakeCurrent`, `eglTerminate` →
  the corresponding `gxd`-prefixed name.

The 4 shader-lifecycle calls require a different narrow route.
`glCompileShader`, `glLinkProgram`, `glDeleteShader`, and `glDeleteProgram` are
**defined in the scene library**, as 16-byte stubs dispatching through their
`*fnptr` globals. Renaming their dynamic-symbol names alone would not hook them.
They are initialized by `chewInit`, not `eglGetProcAddress`.

`chewInit` walks 75 entries in parallel `symnames` and `syms` arrays. Each name
is resolved by `dlsym(RTLD_NEXT, name)`, then by `dlsym(NULL, name)` if the 1st
lookup returned NULL. The result is stored through the corresponding pointer
from `syms`. The JSON independently records the name and pointer relocations;
the 4 entries match by index (40, 46, 44, 43 respectively). Replacing only
their `.rodata` lookup strings with `gxCompileShader`, `gxLinkProgram`,
`gxDeleteShader`, and `gxDeleteProgram` routes the existing stubs through the
helper. Preserve the `dlsym` import, all executable instructions, dynamic-symbol
definitions, and every unrelated table entry.

| Exact base | GLES dependency string | `chewInit` | Masked/fovea draw | Opaque/base draw |
|---|---:|---:|---:|---:|
| 2.0.20/5001712 | `0x6f686` | `0x16caac` | `0xf1c44` | `0xf1d24` |
| 2.0.22/5002244 | `0x68717` | `0x173c0c` | `0xeea60` | `0xeeb40` |
| 2.0.23/5002363 | `0x69956` | `0x17c6ac` | `0xf1ba0` | `0xf1c80` |

Dependency values are file offsets. Function and draw values are module-relative
virtual addresses; the draw return addresses are each call address +4.

## Actual fovea layer and uniforms

The complete base and foveal fallback shaders share the same 1,087-byte prefix.
The prefix is byte-identical across the 3 inputs, SHA-256
`cbf2d90eb70b9769dd64e57da5d76dbc38ab7213dcf7b940c956813a1ddaa99a`.
The native constructor appends either the 29-byte opaque suffix or the 296-byte
masked suffix. Their hashes are recorded in the JSON; they are identical across
all 3 inputs.

`SRGBCorrectionPass::RenderSpecific(int, bool, unsigned int)` selects the shader
at object+`0x28` for its masked/fovea branch and object+`0x20` for its opaque/base
branch. Each branch has a distinct `glDrawArrays` call, listed above. An output
quantizer gated by the exact masked draw call can therefore exclude the base
draw even if a shader has been replaced. Shader recognition is still required:
do not modify an unknown host-supplied shader merely because it uses that draw.

The old `uvmask` weight was in the **common** prefix. Both complete programs
included it, so it did not establish fovea-layer-only processing. Multiplying
noise by a spatial weight also did not eliminate the fragment arithmetic on
base draws. The old 8-bit toggle selected `VideoDitherMode.OFF`; it did not
perform output dithering after interpolation or colour arithmetic.

For each exact input, disassembly of `UpdateShaderUniforms` proves native writes
to locations 4–11; `RenderSpecific` writes 3, 6, 12, and 13. The embedded video
sampler is at location 2. Reserve locations 0–13; 14 and 15 are candidates for
`SL_blueNoise` and `SL_enabled`. Validate the complete linked program's actual
uniform locations after every link, including vertex-stage uniforms and array
ranges. A texture unit is separate from a uniform location; select an unused
unit and preserve its texture and sampler bindings.

## Scope constraints

Apply the same final sRGB8 quantizer to either declared input depth. Texture
filtering, colour conversion, and fade can create fractional output codes even
from 8-bit inputs. Input toggles do not negotiate host codec depth or prove the
decoder's physical storage precision. Preserve `GL_SRGB8_ALPHA8` output.

The requested fovea-only scope supersedes the original plan's all-layer scope.
Shader push/reload must continue working. Unknown replacements pass through
unchanged and are reported as unsupported; a static known-source allowlist does
not prove coverage of live host shader variants that have not been captured.

The available local Android toolchain is
`.android-sdk/ndk/27.2.12479018/toolchains/llvm/prebuilt/windows-x86_64/bin/`.
CMake exists at `build/tooling/cmake/data/bin/cmake.exe`. Neither tool availability
nor native compilation establishes Android runtime success.
