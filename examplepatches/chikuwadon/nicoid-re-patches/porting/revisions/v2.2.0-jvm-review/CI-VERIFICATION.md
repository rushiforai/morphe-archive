# v2.2.0 isolated Gradle recovery verification

Verified 2026-11-27. The isolated GitHub Actions reconstruction completed successfully, including all post-job steps.

- Private review workflow run: 46005924116, job 140528939293, head c9625a0e049d85f81a029923ee474240ef75d1fb.
- Previous run 46005476521 failed before Gradle due to an overly narrow credential-format check. The correction retains the source archive SHA-256 and all artifact locks.
- Input archive and baseline hash checks: PASS.
- Fixed dependencies: 60 files, 46 distinct contents, no archive-layout dependency.
- dev.110 helper: 8,898 classes, c048054f80cc769d00d23730a55d1bbc1b8873a4f6c455b3eb5f7ffc35d0faa5.
- Final helper: 8,898 classes, 93bb4a9292290bd0483d9c20a6f3e3bd2f6e1c5227e1e4560e5ede90105c031b.
- dev.110 method delta: 211 classes, 6cbc43f3c0815308e0817a0ed343823bd53a707a656323ddd33616dfc82dbf08.
- Final method delta: 211 classes, beeaf475e6a15d15a48797c8704c416800028f9567cd7a6a4cb3f88ec908de03.
- Gradle BUILD SUCCESSFUL in 2m 24s.
- Rebuilt MPP: 5,517,602 bytes, SHA-256 151cc1e7eeed2450855de8b7f115c038a47420b6bd48ac3f5d75d28df4695aa7, exact match to audited local reconstruction.
- Generated patch metadata: version 2.2.0, one nicoid Re patch, compatible with nicoid 6.49.
- Evidence artifact: 15202341489, SHA-256 07bf818620e58da60c06a258bc10d0b8abf7d4aec0ecb4d8de4e69e170470173 (build log and generated metadata, not the MPP).

This verifies the isolated Gradle reconstruction task, not the standard release task, CodeQL, complete corresponding source, license compliance or a fresh Manager/Patcher 2.6.0 STRIP_SAFE device run. The local exact-MPP can be supplied privately for device verification because its SHA-256 matches the CI output. No tag, merge or release was made. Earlier recovery records describing isolated Gradle as untested are superseded by this result; other release gates remain in force.

## Device verification of reconstructed candidate

Maintainer reported normal operation and supplied the following Manager log on 2026-11-27 (JST). The supplied candidate was the local reconstruction previously matched against the CI MPP. The Manager log does not independently include an MPP or APK SHA-256.

- Samsung SC-52D, Android 16 / API 36, arm64 JVM 25.0.5.1, Manager 2.8.0 / Patcher 2.6.0.
- Stock nicoid 6.49, input APK 5,012,989 bytes; source version 2.2.0; one patch loaded.
- Seven obsolete advertising root files scheduled for deletion.
- Certified SAFE layout and full reference audits passed; STRIP_SAFE verified 16,914 -> 11,414 classes, 5,500 removed.
- nicoid Re succeeded; actual compiler mode STRIP_SAFE, no FULL fallback.
- Patch 5.323 s, compile 1.910 s, total 7.363 s including signing; average heap 256 MB, peak 347 MB.
- Signed APK 8,936,049 bytes. This matches the previously reported RC.4 APK size; size equality alone is not proof of byte equality.
- Device result: PASS within the maintainer's reported tested scope. No independent exhaustive device regression or fresh application runtime log was supplied.

This closes the fresh Manager 2.8.0 / Patcher 2.6.0 STRIP_SAFE verification gate for the tested candidate. Complete corresponding-source/provenance and licensing review, standard public Gradle/release integration, CI/CodeQL and publication remain outstanding. No release or tag has been created by this documentation update.
