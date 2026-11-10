# Galaxy XR Steam Link Patches

Maintain 4uva4ek's existing author patches: six controller features, Galaxy XR
vendor-driver identity and OpenXR CPU/GPU BOOST, plus their required helpers. Preserve
attribution and existing supported exact version/code pairs. Do not import other
XR Porting Hub features or reconnect an upstream remote without a user request.
Retired frame synthesis, Full-FOV canvas and hitch experiments stay retired.

Verify native offsets against the exact original input, never a nearby version.
Keep unknown builds inert and preserve conflict guards, defaults and options.
Run `:patches:test`, `:patches:buildAndroid`, `:patches:generatePatchesList` and
relevant real-APK audit tasks after changes. Report executed/skipped counts and
distinguish host verification from headset runtime testing.

All build output and caches belong outside this source tree. Never commit APKs,
keys, personal paths or device identifiers. Do not modify other checkouts.
Headset transfer only writes separately named inert files in Downloads. Installing,
enabling modules, changing settings or firmware requires separately scoped user
authorization. Preserve originals and device boot safety.

An independent release uses the Release workflow or the same prepare_manifest.py
and built-artifact sequence locally. Do not upload a different artifact than the
one whose version, catalog and SHA-256 were verified. Publish no game APKs.
