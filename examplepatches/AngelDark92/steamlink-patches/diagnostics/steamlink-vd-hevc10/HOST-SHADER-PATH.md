# Installed SteamVR host: optional client shader overrides

Read-only inspection: **2026-09-22**. No SteamVR setting, host file, process, device, or runtime state was changed. This report records the installed host's conditional shader-send path; it is not a capture of a rendered headset frame.

## Result

**The inspected normal host configuration does not enable the traced remote shader override path.** `watchForShaderChanges` defaults to `false`, the user's current SteamVR configuration contains no override, and the optional client override shader files are absent. The host send routine exits before file inspection when this setting is false. Even when enabled, it sends a replacement only after both shader files contain nonempty source.

Together with the client's embedded fallback construction, this supports using that embedded foveal shader for the inspected normal configuration. A new runtime shader interceptor is not required merely to accommodate these disabled optional overrides. This is a static/configuration inference: live client shader submission and the setting's in-memory value have not been captured. An enabled override configuration is outside this verification.

## Installed identity and configuration

| Item | Observed value |
|---|---|
| SteamVR version | **2.17.10**, recorded in `vrserver.txt:4` at startup `2026-09-22 21:35:48.592` |
| Steam app/build/channel | App **250820**, build **25330290**, **beta**; `steamapps/appmanifest_250820.acf:13,87` |
| Runtime root | `C:/Program Files (x86)/Steam/steamapps/common/SteamVR` |
| Driver | `drivers/vrlink/bin/win64/driver_vrlink.dll` under that runtime |
| Driver size | **13,908,632 bytes** |
| Driver SHA-256 | `1e846be041039798580a91452371f6288c614fb4c152126b137e2c693fb77eef` |
| PE preferred image base | `0x180000000`; addresses below are **RVAs**, unless marked file offsets |
| Default setting | `drivers/vrlink/resources/settings/default.vrsettings:21`: `"watchForShaderChanges" : false` |
| Persisted override | `C:/Program Files (x86)/Steam/config/steamvr.vrsettings`: key absent from `driver_vrlink` |

`C:/Program Files (x86)/Steam/logs/vrserver.txt:104` records that this exact driver path was loaded at `2026-09-22 21:35:48.992`. The OpenVR runtime registry also points to the runtime root above. These identify the installed/loaded driver; they do not establish which shader was subsequently submitted by the Android client.

## Override registration and source availability

The host constructs this map of optional resource paths. It resolves the paths; the registration does not embed a fallback shader body.

| Shader ID | Host resource names | Registration evidence |
|---:|---|---|
| 0 | `{vrlink}/shaders/client_construct_override.vert` / `.frag` | Fragment path referenced at `0x9fe1ad`; ID 0 stored at `0x9fe20c` |
| 1 | `{vrlink}/shaders/client_fov_override.vert` / `.frag` | Fragment path referenced at `0x9fe4d2`; ID 1 stored at `0x9fe52a` |
| 2 | `{vrlink}/shaders/client_nf_override.vert` / `.frag` | Fragment path referenced at `0x9fe6ec`; ID 2 stored at `0x9fe742` |

The installed `drivers/vrlink/resources/shaders` directory is absent. No files with these override names were found in the Steam installation or this toolkit workspace. Existing generated shader fixtures under this workspace are client/audit outputs, not captured host replacement payloads.

The driver has **0** occurrences of `#version`, `samplerExternalOES`, `UniDitherOffsets`, `gl_Frag`, and `void main` in ASCII; the corresponding checked UTF-16 markers are also absent. Its nearby built-in shader text is host D3D/HLSL encoding work. No host-shipped client GLSL source or source hash was recovered, so no equality to the client's embedded prefix is claimed. No host evidence about the decoder-correction matrix was found in this inspection.

## Decisive branch and send evidence

The setting lookup uses the strings `driver_vrlink` and `watchForShaderChanges` at `0x9fe18d–0x9fe1a1`; the returned boolean is stored in the driver object at `+0xff10` by `0x9fe1ba`. The event-dispatch function covering shader sends is `0x9fb850–0x9fc44e`.

```text
RVA 0x9fb9b8: cmp byte ptr [rcx+0xff10], 0
RVA 0x9fb9bf: je  0x9fc41f        ; skip entire override handling when disabled

RVA 0x9fc011: call 0xa260d0       ; read 1st shader file
RVA 0x9fc058: call 0xa260d0       ; read 2nd shader file
RVA 0x9fc0b0: test r8, r8         ; 1st source length
RVA 0x9fc0b3: je  0x9fc1f0       ; skip send if empty
RVA 0x9fc0b9: cmp qword ptr [rsp+0x40], 0
RVA 0x9fc0bf: je  0x9fc1f0       ; skip send if 2nd source empty
RVA 0x9fc0d2: cmp eax, 0xffff     ; enforce combined source-size limit

RVA 0x9fc167: mov eax, [rbx+0x20] ; mapped shader ID
RVA 0x9fc16f: mov [rbp+0x64], eax
RVA 0x9fc18e: mov dword ptr [rbp+0x60], 1
RVA 0x9fc1cc: add r9d, 0x18      ; source bytes + 24-byte header
RVA 0x9fc1dc: mov edx, 0x1e      ; remote value/transport ID
RVA 0x9fc1e1: call 0xa51d80      ; send populated shader payload
```

The file reader at `0xa260d0` opens mode `"rb"`, returns an empty string on open failure, and otherwise reads and NUL-terminates the bytes. It supplies no embedded GLSL replacement. The scanner found 32 direct calls to transport function `0xa51d80`; the shader-send call above was the only one with nearby immediate `edx=0x1e`. This bounded direct-call check is not a claim that every possible indirect transport path has been exhaustively recovered.

| Guard | RVA | File offset | Exact bytes |
|---|---:|---:|---|
| Disabled-setting exit | `0x9fb9b8` | `0x9fadb8` | `80 b9 10 ff 00 00 00 0f 84 5a 0a 00 00` |
| Both sources nonempty | `0x9fc0b0` | `0x9fb4b0` | `4d 85 c0 0f 84 37 01 00 00 48 83 7c 24 40 00 0f 84 2b 01 00 00` |
| Shader transport ID/send | `0x9fc1dc` | `0x9fb5dc` | `ba 1e 00 00 00 e8 9a 5b 05 00` |
| Foveal ID 1 | `0x9fe52a` | `0x9fd92a` | `c7 85 38 09 00 00 01 00 00 00` |
| Base ID 2 | `0x9fe742` | `0x9fdb42` | `c7 44 24 30 02 00 00 00` |

Code-region SHA-256 values, over the indicated end-exclusive RVA intervals:

- `0x9fb850–0x9fc44e`, 3,070 bytes: `eaa54dc01a062330dfccf563ef91cb5046fb7cf05b989a2adf0fe49b8707370b`.
- `0xa260d0–0xa261c9`, 249 bytes: `fa597420d0b39422f6211b51aba7124e75b35c254901ad29e4f4f892cf17bc0a`.

## Recheck and limits

Read-only disassembly can be reproduced from the repository root:

```powershell
$hostDll = 'C:/Program Files (x86)/Steam/steamapps/common/SteamVR/drivers/vrlink/bin/win64/driver_vrlink.dll'
Get-FileHash -LiteralPath $hostDll -Algorithm SHA256
& .android-sdk/ndk/27.2.12479018/toolchains/llvm/prebuilt/windows-x86_64/bin/llvm-objdump.exe `
  --disassemble --no-show-raw-insn --start-address=0x1809fb9b8 --stop-address=0x1809fb9d9 $hostDll
& .android-sdk/ndk/27.2.12479018/toolchains/llvm/prebuilt/windows-x86_64/bin/llvm-objdump.exe `
  --disassemble --no-show-raw-insn --start-address=0x1809fc0b0 --stop-address=0x1809fc1f0 $hostDll
```

Recheck the DLL hash and configuration after SteamVR updates or setting changes. No Settings UI interaction, in-process branch observation, shader capture, Android decoder/GPU test, rendered-image comparison, or headset/panel measurement was performed. Preserve host overrides if a future configuration uses them; this finding supports the inspected default path and does not authorize modifying or disabling host override behavior.
