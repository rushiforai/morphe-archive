# Gearslip density patch

Goal: Add a Morphe APK patch for Gearslip 0.3.31-alpha that enlarges hosted app text and controls on short car screens. Keep the upstream source checkout unchanged.

Design: Add a density submenu under the existing Screen phone settings, immediately after Size. Put the existing Apps card first in the displayed settings list without changing enum ordinals. Offer From car (default), 160, 180, 200, 220 and 240 DPI. Save locally and apply on the next car connection or restarted preview. Correct the preview density caption and hook the projection density and the density passed to hosted apps consistently, without changing pixels, touch coordinates, phone display density or phone mirroring. Preserve compatibility with the existing drawer patch. Validate exact bytecode contracts and abort changed/ambiguous layouts.

- [x] Verify the supplied APK and identify density consumers.
- [x] Add behavior tests for persistence, defaults, invalid values, reset, and session consistency; run them failing.
- [x] Implement the runtime density preference and phone UI, then the guarded Morphe bytecode hooks.
- [x] Build and run regression tests; apply patches to the original APK and rebuild/sign an isolated test copy.
- [x] Validate actual patched DEX and phone-preview display/app density on a disposable emulator.
- [x] Update English/Dutch app docs and report remaining physical EONON validation.
