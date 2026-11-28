# libhdr10fix

Source for the native HDR10+ filtering interposer used by the MX Player Pro Morphe patch.

The Morphe patch itself should continue to inject the known-good prebuilt binary from:

```text
patches/src/main/resources/native/libhdr10fix.so
```

This directory is kept separately so the native code can be reviewed and rebuilt without silently replacing the tested artifact.

## What it does

`libhdr10fix.so` interposes MX Player's ARM64 implementation of:

```text
media::avc::Transformer::buildAnnexB(media::avc::Buffer&, unsigned char const*, int)
```

It resolves the original implementation in `libmxvp.so`, calls it first, then scans the resulting Annex-B access unit.

For HEVC prefix/suffix SEI NAL units (types 39 and 40), it removes only `user_data_registered_itu_t_t35` SEI messages whose payload begins with:

```text
B5 00 3C 00 01 04
```

That signature identifies the HDR10+ ST 2094-40 payload handled by this patch. Other SEI messages are preserved. The code rebuilds RBSP/EBSP data as necessary and leaves unrelated NAL units untouched.

The implementation is fail-open: malformed/unexpected SEI data is preserved rather than discarded.

## Compatibility

The current source is tied to the MX Player Pro 1.93.4 ARM64 native layout used by this repository. In particular, it resolves `libmxvp.so` and calls the original `buildAnnexB` implementation at RVA:

```text
0xB9694
```

Do not assume that offset is valid for another MX Player release.

## Build

An Android NDK is required; Android Studio is not.

If you already have the Android SDK command-line tools installed, list available NDK packages with:

```powershell
C:\Android\Sdk\cmdline-tools\latest\bin\sdkmanager.bat --list
```

Install the NDK version you want to use:

```powershell
C:\Android\Sdk\cmdline-tools\latest\bin\sdkmanager.bat "ndk;<version>"
```

Then, from this directory:

```powershell
.\build.ps1
```

If the script cannot discover the NDK automatically:

```powershell
.\build.ps1 -NdkPath C:\Android\Sdk\ndk\<version>
```

The output is written to:

```text
build/libhdr10fix.so
```

The build script deliberately does **not** copy that file over the Morphe patch resource.

## Known-good binary

The binary that produced the successful runtime test is 6,384 bytes with SHA-256:

```text
357c95a8f7d7d21675f65fbbec86c0648c278c6b1fcf577cb611aa5e2fcad120
```

That tested binary belongs at:

```text
patches/src/main/resources/native/libhdr10fix.so
```

A rebuild from this source may have a different hash because compiler, linker, or NDK version changes can alter ELF layout and metadata even when the resulting code is functionally equivalent. The included build command is therefore a reproducible source build recipe, not a guarantee of byte-identical output with arbitrary toolchain versions.

If you intentionally replace the prebuilt Morphe resource with a new build, re-test playback and update any expected hash in the patch/CI at the same time.

## Files

- `libhdr10fix.c` — v4 native interposer/filter source.
- `hdr10fix.map` — ELF symbol version script exporting the interposed `VERS_2.0` symbol.
- `build.ps1` — Windows Android-NDK build helper.
- `build/` — generated locally and should not be committed.
