# v2.2.0 notice and release staging review

2026-11-27. The device-tested 5,517,602-byte MPP remains fixed at SHA-256 151cc1e7eeed2450855de8b7f115c038a47420b6bd48ac3f5d75d28df4695aa7.

## Notice recovery

The old MP3 source record at porting/revisions/v2.0.3-dev.11/THIRD_PARTY_MP3.md identifies Java LAME v3.98.4, revision 0224bc48f7ca4c9dfafea3d3bee13be741d34552, LGPL v3. Its LICENSE Git blob 65c5ca88a67c30becee01c5a8816d964b03862f9 was restored verbatim in this review directory. The 109 LAME smali files are identical between the checked-in dev.5 DEX and final reconstruction. The final candidate had lost the upstream LGPL license entry. Commons Lang 3.22.0 license and NOTICE were also recovered verbatim from historical commit c78669b and checked against original dev.2 source files.

A local reproducible notice-only review archive preserves all 24 original MPP entries byte-for-byte and adds 27 license/source-notice files, including the LGPL license at its original META-INF path. The additional notices include historical records; they are not an assertion that all historical versions are retained. The resulting MPP is 5,594,602 bytes, SHA-256 caa29ae2e567f9799b597b0eb144245421ebca374cb951ff1567ac06726a20f9. Two independent packaging runs matched; five negative packaging tests passed. The recovered dev.5 MPP verifier and release-integrity record/check accepted the new candidate and rejected tampering. The new v2.2.0 guard conditions also passed locally. The latest full remote release verifier and standard release workflow remain unexecuted. The notice-only archive has not itself been tested on Manager.

## Remaining source and publication gates

A basename-based triage of 244 changed custom helper class families identifies 170 with candidate Java files and 145 with candidate smali files in dev.5, with 26 having neither. This does not establish preferred-form source correspondence; some changes were authored directly in smali and subsequent original deltas may supply more evidence. No requirement to retrieve all 104 historical delta archives is asserted.

The local notice-review package is not a finding of complete LGPL/GPL compliance or rights to redistribute stock-derived methods/resources. Review upstream correspondence, modification/recombination requirements and provenance before publication. The newly added exact-MPP guard does not authorize publication. The public source payload has not yet been transferred, the normal release task and semantic-release integration are not completed, and main/dev remain unchanged. No tag or release was created.
