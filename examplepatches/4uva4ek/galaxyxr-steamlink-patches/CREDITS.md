# Attribution

The controller tracking, velocity frame, extrapolation, pose timing, grip haptics
and local throw-angle work originated with 4uva4ek and the Galaxy XR modules.
The imported Morphe integration and exact-build adaptation include code from
AngelDark92/xr-porting-hub (commit 4efb4ac), with local controller work from
4uva4ek's working copy. Source selection and original hashes are recorded in
`provenance.json`. Independence of this repository does not remove those credits.

The eight public features are the six controller patches, the Galaxy XR vendor
driver identity patch (4uva4ek commits `739b04c`, `2720a5f`, `24e658a`) and
OpenXR CPU/GPU BOOST (`02b931c`), with their required support code.
No other XR Porting Hub patches, 4XVR patches or retired experiments are imported.

Morphe's patch framework/build plugin and patch-list generator retain their
original notices. Gradle wrapper is Apache-2.0. Shizuku API 13.1.5 (RikkaApps,
MIT) is included in the shared bridge DEX; its license is shipped under
`patches/src/main/resources/licenses/`. Native layers use Khronos OpenXR
headers. Dependency code is not claimed as original controller work.

Not affiliated with Valve, Samsung, Google, Meta or the Morphe project.
