# MrCool Patches 1.0.0

Source update: 2026-10-31. Smart Launcher input is the supplied APKPure XAPK,
`ginlemon.flowerfree`, version `6.6 build 024`, version code `660240`, ARM64.
Base APK SHA-256: `85218c5daf096c3fd9d72c7b53b8a4cfae33d5042b25079a8e6e786be9745a7e`.
All 20 APK modules were validated and merged with APKEditor 1.4.9.

## Changes

- Share compatibility for Smart Launcher builds 020 and 024 between the independent
  Buds3 Pro widget fix and the Pro patch.
- Adapt the upstream Pro patch from hoo-dles/morphe-patches revision
  `1f9d0da03804edd5a2e8642de6fc964814de9dd4`, retaining its attribution.
  Use dexlib's field-reference API to avoid adding the upstream utility library.
- Retain the existing signature compatibility dependency and OpenBubbles bridge.
  No OpenBubbles or watch behavior changes are introduced by this release.

## Verification

The actual Kotlin patch sources compile against official Morphe Desktop 1.20.0.
Repository CI passes patch tests, all 16 widget helper scenarios, 11 Python audit/source-lock
tests, and the combined Android MPP build. The OpenBubbles extension matches its source lock.
Morphe's strict fingerprint validation applies both launcher patches to build 024 and
the bridge to the pinned OpenBubbles 2.0.0 / 20002289 base without forcing compatibility.

Independent DEX inspection confirms exactly four existing launcher methods change:
add-widget configuration, widget reconfiguration, Pro purchase initialization, and
the signature-exit method. All original classes and methods remain. Both widget calls
retain their original six argument registers. Package metadata, original native payloads,
APK signatures, 16 KiB ZIP alignment, and uploaded checksums are checked during packaging.

The OpenBubbles phone and watch assets are copied unchanged from the previously tested
integrated 3.0.0 photo/avatar build. They preserve the existing release certificate and
phone universal APK format. They do not require installing the MPP as well.
The combined MPP's bridge is validated by a fresh patch application; its integration module
was renamed from `phone` to `bridge` during the earlier repository split.

## Installation limits

No device installation or new live hardware test was performed for this release.
Buds3 Pro has earlier hardware confirmation on build 020; build 024 is statically verified.
The Smart Launcher APK uses its own new release signing certificate and stock version code
660240. It cannot replace the previous Manager-signed/MAX-version-code installation in place.
For that installation, apply the MPP using the same Manager key and preserve the installed
version-code policy. Do not uninstall or clear launcher data merely to change certificates.
OpenBubbles phone/watch APKs use their existing matching certificate; preserve app data.
