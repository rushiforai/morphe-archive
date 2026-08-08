# Binge Group Manual Fallback

Patch ID: `binge-next-episode`

This patch adds **Morphe > Playback > Binge Group Manual Fallback**. The switch is off by default.

When Nuvio's **Prefer Binge Group** option is enabled, Next Episode first looks for a source carrying the same binge-group identifier as the current stream. If no match arrives before Nuvio completes source selection:

- **On:** open the manual source picker.
- **Off:** preserve Nuvio's normal fallback, which selects the first eligible source from its ordered results.

A matching source is still selected automatically in either mode. When Nuvio's **Prefer Binge Group** option is disabled, this patch does not change Next Episode behavior.

The patch only changes the helper used by Next Episode. Initial playback, explicit manual source selection, resume flows, stream ordering, capability filtering and codec selection are outside its scope. Binge-group identifiers come from addon stream metadata; the patch does not infer matches from addon names or video properties.

The preference is stored privately in the `morphe_patches` application preferences. It is not synced or sent as telemetry.
