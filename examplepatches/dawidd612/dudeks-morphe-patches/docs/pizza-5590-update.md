# Pizza 5.59.0 (2322): official ARM64 support

All three default Pizza patches support 5.59.0 as a normal, non-experimental
target, alongside 5.57.3 and 5.58.0. The existing profile registry and automatic
DEX role discovery are reused. Future protected native layouts still require
a matching, verified initialization profile; unknown binaries are not patched
with stale offsets.

Published in [v1.36.0](https://github.com/dawidd612/dudeks-morphe-patches/releases/tag/v1.36.0),
PR37 / merge90efcb9 / release commit ee6b8eb. Release39480495633 passes.
Downloaded MPP SHA256:
b8a42988cfefef13505e6a28eed782bb8bc74f4dcb91a40facff990be534c247.
Checksum, ZIP integrity and GitHub attestation verify. All30 scoped Pizza bundle
entries, including Android classes.dex, the extension and profile resources,
match the tested local build. Published metadata exposes three non-experimental
5.59.0 targets. The final APK is byte-identical to the runtime candidate across
all8162 non-signature entries and passes another real Google/server-auth launch
with the same Day56/wallet state.

Publisher-signed APKPure XAPK SHA256:
085a7462ec672c22bebbefc0d79a0480ae1d68b72cb3ad7f6b5ecc501b39b99d.
All five embedded APK signatures and CRCs passed the initial audit. The original
input remains pinned, not replaced by another store build.

CI capture39280529797 (source820ab6c) supplies two independent original-signed
starts with1477 identical strings in32 holders. Native reconstruction changes
50923 executable bytes,3798 constant qwords and200 imports. The only reviewed
IFUNC is memmove in the identical previously reviewed system libc; no runtime
address is embedded. Native input c97e83fd73d3c871d26d2f2587c1f9c99279505a5a70f6787220572c958afe26
reconstructs to b54a7104f95b6ca89f5fb59ac5250a2ffde40922446b505c61f14f211ed36135.
Two visibility instruction windows match uniquely after the reconstructed layout
moves them by0x1000. The separate visibility delta outputs
94bcdf5583791deb65d921d017c2303ba2cb74f5e85988ed6e3737dbf7ffff19.
Six matching upstream SDK methods are restored with their actual behavior.

Local source build and all three patches apply to the complete clean input.
DEX checks pass1477 string initializers,3418 unchanged auth/SDK methods,2165
unchanged billing methods,87 unchanged native bridge methods,6 recovered SDK
methods and5 interpreted reward placements. Play-services guards preserve23
other methods and cancel the two update-code dialogs once. All5 input APKs,
17 native libraries and6772 assets pass preservation checks. Native corruption,
reapply, malformed-range and exact reconstruction checks pass.

Disposable local API35 upgrade retains Chapter1/Day2/funds64.38/gems10. Actual
PNN reward gives exactly one gem(10->11) and one native GLThread66 sequence under
double tap/Home/resume. Three checkout invocations cancel on GLThread with zero
Billing entry/success callbacks. A pepperoni order is prepared, baked, cut and
served; no game-binary behavior is altered by the test driver.

C: had insufficient free space for emulator startup. Test AVD data is copied to
E:/Codex-Morphe-Pizza-5590-20261020; original AVDs and signing key are retained.
Before upgrading the debug copy, its113-entry files/preferences backup was read
and verified in full. Logs, APKs, captures, account data and saves stay local,
outside Git. Two guest force-stop starts, Home/resume, full reboot, offline
Activity recreation and disposable clean Day1 setup/relaunch pass without app
crashes or receiver failures. A complete fresh Day1 playthrough is not claimed.

The copied user environment passes two force-stop starts, Home/resume and two
full reboots. Every case completes real Google Play Games sign-in and reports
ServerAuthCode result auth=true with granted scopes; raw codes are not logged.
The TapBlaze account panel shows Log Out and no login control, confirming the
continuing linked session. Chapter3/Day56/funds496.98/gems181 remain stable
across the matrix. The user confirmed this is the expected current save on
2026-10-20. Fresh credential entry and a wiped-device cloud restore are not
claimed. Tests use API35 emulators with ARM64 translation; physical devices
and ARM32 are not validated.

Paid checkout remains unavailable under the replacement-signing restriction
and is cancelled. Some upstream cosmetic promotions, including Wiggly Ears,
remain visible. Ordinary exchanges, sponsor rewards and existing verified
purchase-token processing are preserved; paid goods are never fabricated.

An additional old installed v1.34.0 / game5.58 control crashes in PairIP and
opens Play Store; that is a separate old control, not a5.59 regression or a test
of the current5.58 profile. Diagnostic manifest-only debuggable APKs were used
solely to read backups and never for runtime success claims or publication.
See pizza-5590-provenance.json for exact reconstruction and runtime evidence.

Implementation and validation were assisted by OpenAI Codex (GPT-6).
