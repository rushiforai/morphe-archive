# NuvioTV startup track reselection

Current target: **NuvioTV 1.1.0-beta.9 (1072)**. See [beta.9 contracts and verification](NuvioBeta9.md). Version-specific DEX notes, commands and artifacts for earlier versions below are historical; use the beta.9 contract and `verifyNuvioLatest` for the current release.

**NuvioTV - Fix startup track reselection** is an independent, disabled-by-default
patch for `com.nuvio.tv` 1.1.0-beta.9 (version code 1072). Select it explicitly
when patching. There is no runtime toggle or background worker.

The original ExoPlayer track-reselection path can request a seek before a playing
media period exists. `ExoPlayerImplInternal.seekToCurrentPosition(boolean)` then
dereferences the null period. The patch returns through the original return
instruction in that case. When a playing period exists, the original seek path
is preserved. This is a startup exception guard, not a general frame-drop fix.

The matcher checks the reviewed original method fingerprint, registers,
signature, instruction count and null-period anchor. It rejects missing,
ambiguous, changed and already-patched methods. Verification exercises the null
and active-period paths and writes/reloads the resulting DEX.

Run `build-local.ps1 :patches:buildAndroid :patches:verifyNuvioPlayerStability
:patches:verifyNuvioBeta8Bundle --offline`. The packaged verifier checks this
patch alone and together with the other beta.8 patches. The latest original APK
and its native contract are described in [NuvioBeta8.md](NuvioBeta8.md).

Keep the guard enabled for beta.8: the original defect remains present. The
absence of a later exception does not prove the guard is unnecessary, because
guard activation is not logged. Any newer app version needs fresh inspection.
