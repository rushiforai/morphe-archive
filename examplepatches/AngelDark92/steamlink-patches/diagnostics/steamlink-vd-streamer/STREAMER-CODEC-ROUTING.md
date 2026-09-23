# Installed Virtual Desktop Streamer: managed codec and gamma routing

Read-only audit: **2026-09-22**. Source: `C:/Program Files/Virtual Desktop Streamer/VirtualDesktop.Streamer.exe`, **1.34.22.0**, 22600728 bytes, SHA-256 `6bfec9e4e62509f4fdb0ec21c144b4584f9450701dcf5bd756d6fd2aec7cbb51`. The earlier supplied Android client is **1.34.18.0 / 10683**. These are different builds; this is not proof of a tested client/server pairing.

The executable is a merged managed assembly containing Streamer, Core, Net, graphics wrappers, and encoder wrappers. Many implementation names are obfuscated. The evidence therefore identifies methods and fields by exact metadata token and RVA, and traces decoded IL operands and branches. No installed executable was run or modified. No user settings, account records, network connections, or process state were read by this extraction.

## Result

Selecting HEVC 10-bit or AV1 10-bit supplies a codec enum to a **Windows encoder implementation**, with capability-dependent fallback. It is not selection of a client dithering shader. The relevant PCVR host also applies an explicit gamma transform before encoding: normally `pow(saturate(rgb), 0.9 / GammaSetting)` in its preprocessing effects. That transform is common to the traced codec choices, not a special HEVC10/AV110 noise formula.

Copying this pre-encode transform into Steam Link's post-decode OLED options would change its position relative to RGB/YUV conversion, chroma subsampling, and lossy compression. It would not reproduce VD's encoder configuration or recover information already lost in Steam Link's received bitstream. No evidence from this trace supports calling such a client change the **same mechanism** or promising the user's observed banding improvement. The encoder and preprocessing evidence explains concrete differences; it does not isolate the causal source of the visual improvement.

## Enum, UI, and preference routing

The installed assembly's Constant table establishes `Automatic=0`, `H264=1`, `HEVC=2`, `H264Plus=5`, **`HEVC10bit=6`**, `AV1=10`, **`AV110bit=11`**. This independently verifies the Windows values rather than importing Android enum assumptions. `managed-routing-index.json` records the constants and hashes of all 39 retained methods.

| Step | Exact evidence | Behavior |
|---|---|---|
| UI choices | `managed-ui.il.txt:1`, token `0x0600057d`, RVA `0x36b6c`, IL `004d-0068` | `VideoCodecProvider.BeginQuery` adds boxed enum values 6 and 11 to the displayed choices and derives labels from the same enum. The preference value is not an arbitrary dropdown index. |
| Preference setter | `managed-selected.il.txt:1`, token `0x060003c1`, RVA `0x246c4` | `StreamerSettings.set_PreferredCodec` stores the selected enum, raises property change, and invokes `OnPreferredCodechanged` (`0x060003e2`, RVA `0x25250`). |
| Encoder creation input | `managed-selected.il.txt:929`, token `0x06000467`, RVA `0x2bc24`, IL `0044-0069` | Reads `get_PreferredCodec`; passes that enum with adapter, image size, and stream arguments into the encoder selection/construction route. |
| NVIDIA selection | `managed-factory.il.txt:1`, token `0x0600046a`, RVA `0x2be08`; NVIDIA predicate `0x06021554`, RVA `0x88dbd8` | Checks adapter VendorId=4318 (`0x10de`) and codec/capability conditions; selects type `0x02003e44`, the wrapper that imports NVENC. HEVC10 and AV1-family branches have separate capability checks. |
| AMD selection | Same factory, IL `0090-0100`; AMD predicate `0x06021555`, RVA `0x88dc30` | Checks VendorId=4098/4130 and capabilities; selects type `0x02003e15`, the AMF wrapper. |
| Other/fallback selection | Same factory, IL `0102-0112` | Selects type `0x02003e1c`. Its inspected methods use Media Foundation; this audit does not establish a specific Intel Quick Sync implementation or its 10-bit behavior. |
| Requested versus actual codec | `managed-selected.il.txt:2541`, NVENC apply method `0x060215f0`, RVA `0x8931d8`, IL `0081-012a` | Applies HMD feature/capability checks. Paths can downgrade 11→6, 6→2, and 2→1. A saved preference alone is not proof of the codec selected for a live stream. |
| Displayed codec name | `managed-selected.il.txt:569`, PCVR method `0x06000403`, RVA `0x26b90`, IL `04ed-050a` | Reads the encoder's chosen codec, writes `SharedStreamerSettings.ActiveCodec`, then writes its display label to `StreamerSettings.CodecName`. `CodecName` and `PreferredCodec` have different roles. |

The parent task separately reported a scoped read of `PreferredCodec=6` and `CodecName="H.264+"`. The code above explains why those 2 persisted values need not agree: the preference is an input; the name is updated from an encoder's selected result. It does not determine when that name was written or which codec would be selected now. This report did not read that settings file or observe a live connection.

## PCVR preprocessing gamma: an actual host transform

`OculusStreamer` is the installed host's PCVR path name; it also contains explicit handling of `vrserver`. Its method `0x06000413`, RVA `0x28ab8`, loads `Effects/Sharpening` or `Effects/Foveation` and separately `Effects/Fovea`. At IL `039e-03a8` and `0421-042b`, it obtains their `Gamma` parameters and stores fields `0x040002a5` and `0x040002a9`. See `managed-gamma.il.txt:260-339`.

The configuration method `0x06000403`, RVA `0x26b90`, executes the following verified sequence (`managed-selected.il.txt:690-731`):

```text
IL 062e: read SharedUserSettings.Gamma
IL 0635: test special-process flag
IL 0640-0654: special-process-only adjustment of GammaSetting
IL 0656: call HMD predicate 0x060212b0
IL 065b-0664: choose predicate ? 0.6 : 0.9
IL 0669-0674: selectedConstant * (1.0 / GammaSetting)
IL 067f: write the resulting float to main-effect Gamma
IL 068c: write the same float to fovea-effect Gamma
```

The HMD predicate `0x060212b0`, RVA `0x8766b8`, returns **false unconditionally** (`managed-gamma.il.txt:790`). Therefore the selected constant in this exact build is **0.9**. There is no codec argument or codec branch in this sequence. The `Gamma` property's `DefaultValueAttribute` blob is `01000000803f0000`, declaring float **1.0**; the index records this metadata. The ordinary metadata-default exponent is consequently **0.9**. An actual session can supply a different Gamma setting; this audit does not read it.

The special-process set contains only `GrimVRClient-Win64-Shipping`: `OculusStreamer` static constructor `0x06000430`, RVA `0x2a930`, in `managed-gamma-extra.il.txt:1`. Method `0x06000413` sets the special flag by checking the process name against that set. Its adjustment invokes an obfuscated cached delegate with arguments `(1.0, GammaSetting)` before computing the exponent. The delegate's exact operation was not resolved in this bounded audit; no minimum/maximum claim is made. This branch is process-specific, not HEVC10-specific.

The parent task independently disassembled the installed Effects bytecode and established the final RGB operation as `pow(saturate(sampleOrSharpenedRGB), Gamma)`. `shader-inventory.json` pins those input containers. The managed parameter bindings above connect that shader operation to the concrete host value, rather than treating an unused shader constant as active behavior. The preceding Android audit's disabled `GammaBoost` branch does **not** negate this separate host-side preprocessing.

## Range, AQ, 2-pass, and YUV444

These PCVR settings are set on the encoder before applying the codec. Their verified sources are in method `0x06000403`, `managed-selected.il.txt:226-269`, followed by setter calls at lines 303-339 and the analogous other streams:

| Encoder property | Source and receiver |
|---|---|
| Full range | If HMD predicate `0x060212b1` is true, force true; otherwise read `SharedUserSettings.IncreaseVideoNominalRange`. Setter `0x06021528`, backing field `0x04014d9b`, getter `0x06021527`. |
| Adaptive quantization | Read `StreamerSettings.EnableAQ`; setter `0x0602152e`, field `0x04014da0`, getter `0x0602152d`. |
| 2-pass | Read `StreamerSettings.Enable2Pass`; setter `0x06021530`, field `0x04014da1`, getter `0x0602152f`. |
| YUV444 | Require HMD Features bit 131072 and `StreamerSettings.EnableYuv444`; setter `0x06021532`, field `0x04014da2`, getter `0x06021531`. |

Predicate `0x060212b1`, RVA `0x8766f0`, returns `HmdType != 259`; thus the exception that consults the nominal-range preference is value 259. See the final method in `managed-gamma-extra.il.txt`. This source does not branch on 8-bit versus 10-bit for the PCVR range decision. No inference about a live negotiated HMD value is required for that code-level result.

## AMF interop and its vendor workaround

The P/Invoke metadata identifies `AMFApplyCodec` at token `0x0602157b` in `libVirtualDesktopAMF` with signature:

```text
bool AMFApplyCodec(IntPtr encoder, VideoCodec codec,
                  SharpDX.Size2 inputSize, SharpDX.Size2 outputSize,
                  bool fullRange, bool enableAQ, bool enable2Pass)
```

The concrete caller is `0x06021563`, RVA `0x88e48c`, IL `0131-015c` (`managed-selected.il.txt:2422-2439`). Both size arguments come from getter `0x0602151d`; the 3 booleans come from `0x06021527`, `0x0602152d`, and `0x0602152f`, respectively. Their identities are established by the PCVR setting setters above. In particular, the final AMF boolean is **2-pass**, not YUV444.

`AMFCreateEncoder(IntPtr context, bool vendorWorkaround)` is token `0x06021579`. The call at method `0x0602156c`, RVA `0x88ebc0`, IL `002e`, reads backing field `0x04014db7`. Initialization at method `0x06021561`, RVA `0x88e330`, IL `0045-004a`, obtains that field from adapter predicate `0x06021557`, RVA `0x88dcfc`.

That predicate requires the AMD adapter test and an adapter description containing `RX 90` using comparison enum value 5, then tests the substring-search result against -1. See `managed-gamma-extra.il.txt:95`. Therefore the native constructor boolean is an RX 90-series-specific adapter workaround, not the generic HDR flag or the 10-bit codec toggle. The native encoder audit handles what that boolean changes inside AMF.

## NVENC scope

The NVIDIA implementation is type `0x02003e44`. Its codec apply method is fully retained at `managed-selected.il.txt:2541` (`0x060215f0`, RVA `0x8931d8`). Methods `0x060215f9`, `0x060215fc`, and `0x060215fd` are retained in `managed-nvenc-input.il.txt`; the separate native encoder investigation maps the obfuscated structures to NVENC fields in `nvenc-layout-evidence.txt`.

This branch performs actual encoder configuration for codec 6 or 11, rather than selecting a post-decode noise effect. Shader-only Steam Link options cannot invoke these Windows NVENC/AMF APIs, change the PC encoder's input conversion, or renegotiate the received bitstream. The exact output/input depth fields and submitted texture format belong to the companion encoder evidence, not an inference from codec names.

## Reproduction and boundaries

From the repository root:

```powershell
python -B diagnostics/steamlink-vd-streamer/managed-evidence.py --write
```

The extractor uses the existing local `dnfile`/`dncil` audit dependencies, requires the exact executable SHA-256 above, decodes method bodies without executing the application, and regenerates 6 selected IL excerpts plus `managed-routing-index.json`. The index records source identity, enum constants, Gamma default metadata, and method RVAs/body hashes. It does not inspect user configuration. Negative-string searches are not used as substitutes for the positive branch evidence above.

Still unmeasured: the user's active GPU/backend/codec negotiation during the earlier comparison, Gamma setting, encoder driver behavior, exact encoder output, current-client changes between 1.34.18 and 1.34.22, and the contribution of each stage to visible banding. No process restart, setting change, device operation, blue-noise modification, or production patch edit occurred in this investigation. Only compact scripts and selected evidence were created; installed binaries and existing fixtures remain unchanged.
