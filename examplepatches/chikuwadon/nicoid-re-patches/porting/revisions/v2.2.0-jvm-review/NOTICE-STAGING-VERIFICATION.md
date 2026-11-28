# v2.2.0 notice staging verification

Local verification, 2026-11-27. Not a publication.

The notice-only MPP SHA-256 caa29ae2e567f9799b597b0eb144245421ebca374cb951ff1567ac06726a20f9 was applied locally using Morphe Patcher 2.5.0 to the exact stock nicoid 6.49 APK. One patch loaded, all 11,414 final classes retained, all four output DEX files and 1,191 patched resource files byte-identical to the prior reconstruction's local application. The same seven obsolete root advertising resources were scheduled for deletion. The requested STRIP_SAFE mode fell back to FULL, as in the previous local test. Generated patches-list.json was byte-identical. This is not a fresh Manager 2.8.0 / Patcher 2.6.0 STRIP_SAFE test of the notice-only archive.

The staging script stage-reviewed-notices.py reconstructs the 27 supplementary notices from the already transferred recovery tree, historical repository notices and the reviewed license files. It preserves the 24 original members and rejects any output not matching the exact reviewed archive SHA-256. Its locally verified Git blob c22250b80119982e4cd3bc2a980bb853b9df2060 matches the committed file. Restored AndroidX notice and source-reference blobs were verified against the original dev.5 snapshot. Local reconstruction reproduced the full 5,594,602-byte notice-only archive byte-for-byte.

The follow-up private CI workflow now verifies the notice-stage script, Android MPP structure, latest public preparation branch's exact release integrity guard (including rejection of the earlier pre-notice MPP), and unchanged patch metadata. It is not the production release workflow; no release has been created. Its new execution has not yet been verified.

Of the 26 changed helper class families lacking basename matches in the dev.5 source inventory, FixedCommentCollision has an exact original dev.120 smali match (SHA-256 b5adab493a700cb7de3d6a8442f5259c3b245d5d5d57c2ddcba624a805d4a244). The other 25 require preferred-source/provenance review. This is a narrowed search of available archives, not a declaration that the other 218 class families have complete matching source. The rights to distribute stock-derived material, full corresponding source and LGPL combined-work obligations remain separate open issues. The standard public Gradle/release path and CodeQL are still unverified. No release safeguards are relaxed.

## GitHub Actions verification completed

Run 46009218871, job 140540115858, private workflow head 915f7cc359629d835832de8b84e4897a692d3d5d. All steps completed successfully. Gradle BUILD SUCCESSFUL in 2m 48s. Logs confirm all 60 locked inputs, both intermediate/final DEX pairs, original reconstructed MPP hash and the reviewed 5,594,602-byte notice-only MPP SHA-256 caa29ae2e567f9799b597b0eb144245421ebca374cb951ff1567ac06726a20f9. Android MPP validation found 21 root DEX classes. Release-integrity record/check, deliberate rejection of pre-notice MPP and identical patch metadata passed. Artifact 15202671809 (5,529,000 bytes; digest sha256:7158d22889c3db97357bce06dade97e03a646e5e94b27c81d06417189ff45d74) includes notice-only MPP and verification logs, expires 2026-11-30 13:44:13 UTC. This supersedes the earlier pending isolated CI result. No full public source integration, corresponding-source clearance, CodeQL, device test of the notice-only archive or release has occurred.

## Conventional release-path rehearsal completed

Verified against the actual GitHub Actions job and logs on 2026-11-27. Private review run 46010425961, job 140544219527, head 46c9b97d61d0bf5ed13ced8b8c4f2ef1a376466f, public preparation scripts at 89c9403ae3dda1712b3d1de16be15ced4413f612. All steps and post-job steps succeeded.

- 60 SHA-256-locked inputs (46 distinct contents), all four cumulative DEX hashes, and reconstructed source/classpath locks passed.
- Gradle BUILD SUCCESSFUL in 2m 52s; reproduced pre-notice MPP 5,517,602 bytes, SHA-256 151cc1e7eeed2450855de8b7f115c038a47420b6bd48ac3f5d75d28df4695aa7.
- Canonical release output patches/build/libs/patches-2.2.0.mpp: 5,594,602 bytes, SHA-256 caa29ae2e567f9799b597b0eb144245421ebca374cb951ff1567ac06726a20f9; Android MPP validation, patch metadata generation, repeated integrity record/check and all nine legacy integrity tests passed. Baseline resources remained unchanged.
- Artifact 15203032950, v220-conventional-release-review, 5,529,178 bytes, SHA-256 6d00933bc4fe5f47b0a45052ba4aa09a71094c1293ce0dbf45eb8c1b0504deb2; expires 2026-11-30 13:52:47 UTC.

This supersedes the pending conventional-path rehearsal, but the successful job staged the private source archive into a disposable checkout and set version 2.2.0 there. The public release-preparation branch still has version 2.1.9 and does not contain the recovery build tree. Public source integration, preferred-source/provenance and licensing clearance, production CI/CodeQL, and exact final archive device confirmation remain open. No main/dev merge, tag or Release was performed. Do not publish the rehearsal artifact as a substitute for those gates.
