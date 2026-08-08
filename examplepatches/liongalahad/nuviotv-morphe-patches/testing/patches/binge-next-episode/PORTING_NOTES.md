# Porting notes

## Source behavior

In NuvioTV 0.8.2-beta, `PlayerRuntimeController.playNextEpisode` uses a private static helper to flatten `AddonStreams` results and call the shared stream selector. The helper passes three distinct values to that selector: the current stream's binge-group identifier, Nuvio's **Prefer Binge Group** setting and a `bingeGroupOnly` boolean.

The shared selector returns the matching binge-group stream when one exists. When no match exists, `bingeGroupOnly = false` permits the normal autoplay fallback; `bingeGroupOnly = true` returns no automatic selection so the controller opens its existing manual picker.

The patch rewrites only that helper's `bingeGroupOnly` parameter at entry:

`effective = originalBingeGroupOnly || morpheManualFallbackEnabled`

This preserves any stricter decision already made by Nuvio. The setting has no effect when Nuvio's **Prefer Binge Group** branch is disabled.

## Fingerprint rationale

`NextEpisodeStreamSelectionFingerprint` deliberately targets the next-episode helper instead of the shared selector, which is also used by ordinary stream launches. It requires all of the following structural evidence:

- a public, static, final method owned by a coroutine `SuspendLambda` subclass;
- the exact ten-parameter shape used by the helper, including the boolean at parameter 8;
- a return type of Nuvio's `Stream` model;
- an `AddonStreams.getStreams(): List` call; and
- a call to the ten-parameter shared selector with its final two boolean arguments.

The fingerprint must match exactly once. No obfuscated class or method names are used.

## Future versions

For each new Nuvio version, verify that the boolean still means `bingeGroupOnly`, that a null automatic selection still reaches the source picker, and that the helper remains exclusive to Next Episode. If the parameter order or selector contract changes, update both the fingerprint and injected register rather than loosening the match.

## Deliberate omissions

The patch does not rank streams, compare codecs, inspect device playback capabilities, synthesize missing binge-group metadata or change the source timeout. These concerns belong to Nuvio's existing selector and addon results.
