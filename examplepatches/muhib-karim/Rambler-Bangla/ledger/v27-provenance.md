# V27.x Provenance Record

Recorded 2026-09-21. The V25-V27 line is uncommitted local smali patch sets built on the V21c base (canonical V23 commit 9008d07 is the last committed state). All builds signed with cert SHA-256 1100d5fff35dbd5942680d18e020a2c8b8b47337bfdff577d01913a64b6d47be, v2-only.

## Artifact chain
- V27 production: SHA-256 39ef49eaa2ebbf9ccd32de0e00f771daab8f45aaa7dca7b70dbf41d8f5b6b05b - crashed at keyboard launch (latent V26 ART VerifyError in vtg.t). Superseded.
- V27.1 production: SHA-256 891edc7369c060f3381efccce86428917f8a2e5b8a430dfd099a1f0546a620d5 - versionCode bump only (176004239); still crashed.
- V27.2 canonical: SHA-256 518c50b0577854c8c0d339c2fc77730bfad8b2d24807d1c9e2947d64db70ccc2 - crash fix (check-cast v5, Lajpe; in vtg.t), verified on-device. Current reference build.
- V27.2 withdrawn twin: SHA-256 af59cf135f24784556aa666a2712e255e6ae962b050756e141905d54c343c10b - v3-signing contaminated, content-identical to canonical, do not distribute.
- V27.3 production: SHA-256 59cc6e7c3abd52c61d2f2b3f8832e5e839ff599dfbd33a99e07fb0b3ec1f1176 - NO-GO, withdrawn: inverted layout branch (per-word voice mode wired to Bangla layout instead of multilingual) + process-global VOICE_MODE race.
- V27.3 staging: SHA-256 e3f798c16bade771345254b6adcfe76976ca01a3433c10dce907c14af0982c27 - NO-GO, withdrawn.

## Evidence
- V27 evidence pack v2: SHA-256 bf1b4add85171a260fce79deb0a58b71102893bb0a6c80baaa4d50cd98673831
- Build provenance doc (final): SHA-256 f34fd074aadcca332f3ec8dd5e852ebd69d73e91c996c9d935e7fdad2137d459

## Open items
- Multilingual voice regression: English rendered as Bangla phonetics via vrh.h ScriptFix chunk conversion. Fix path: processVoice per-word mode with correct layout guard + thread-safe voice context (no process-global static). Next build must pass independent static review before device install.
