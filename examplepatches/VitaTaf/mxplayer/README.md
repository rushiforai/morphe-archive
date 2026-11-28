# MX Player Patches

A Morphe patch source for MX Player Pro.

Currently includes a patch for **MX Player Pro 1.93.4** that strips HDR10+ dynamic metadata from the HW+ decoding path while preserving HDR10, PQ, BT.2020, and other video metadata.

## Patches

- **Bypass re-signing protection**  
  Prevents MX Player Pro from breaking after Morphe re-signs the APK.

- **Strip HDR10+ dynamic metadata**  
  Removes HDR10+ ST 2094-40 metadata before it reaches the hardware decoder.

## Compatibility

Tested with:

- MX Player Pro `1.93.4`
- Package: `com.mxtech.videoplayer.pro`
- ARM64 devices

## Usage

Add this repository as a remote patch source in Morphe Manager, then apply the desired patches to a compatible MX Player Pro APK.

