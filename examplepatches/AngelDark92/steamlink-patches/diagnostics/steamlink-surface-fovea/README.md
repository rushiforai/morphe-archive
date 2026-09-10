# Retired: Android-Surface Fovea — tried, did not work

On 2026-09-07 the user reported: "It's not working." The experiment was retired
at their request. No new trace was supplied; the precise failure is unknown.

This tested actual 8-bit foveal pixels through an Android Surface on exact
Steam Link 2.0.22/5002322. It retained 3 projections and replaced the fovea image
source instead of adding the working fix's 2×2 quad. It involved GPU copies and
was not the earlier static-black underside experiment.

The patch, helper, native source, build target, packaging script and capture
script have been removed. The existing high-resolution fix and recommended
bundles are unchanged. Build a clean APK with the normal recommended set to
return to that fix; nothing on the headset was changed by this retirement.

[Historical offline validation](VALIDATION.md) is retained only as provenance.
Passing those checks did not establish headset success. Existing user captures
in Documents were not removed. Do not treat this approach as untried.
