# Retired: Android Surface actual video — tried, low resolution

On 2026-09-11 the user reported low-resolution output and requested retirement.
**Do not reapply or recommend this experiment.**

The selectable patch, installer/audits, native implementation and build targets,
experiment-only tests, all 4 packaged helper variants, implicit-layer manifest,
and dedicated local installable bundle were removed. The working terminal-quad
high-resolution patch is preserved. The old mode/library identifiers remain only
for cleanup of stale decoded APK resources.

This was `surface_video_v1` / `libgxr_surface_video.so`, targeting exact
2.0.20/5001712 and 2.0.22/5002322. It copied all rendered video projections into
Android Surface swapchains. Static checks had passed; the user reported low
resolution. The exact installed APK and runtime cause were not established.

See the [already-tried record](../../SteamLink-GalaxyXR-Python-Patches-Already-Tried-for_Resolution_issue/README.md)
and [historical assessment](LOW-RESOLUTION-ASSESSMENT-20260911.md). The read-only
native trace script and saved measurements remain evidence, not an active patch.
Existing APKs or bundles already imported on another device are not modified by
this repository cleanup.

Retirement validation: cached Kotlin/Morphe compilation and all 101 JUnit tests
passed, including stale-helper cleanup and resource absence. Registry host tests
and both 2-/3-projection trigger integration checks passed using Zig C++ (the
Visual Studio CMake generator could not find an installed toolchain). Catalogs
were regenerated through the production generator with the experimental channel;
all remaining entries and version metadata match the previous catalogs. No APK
installation, headset test or new published release was performed.
