# Porting notes

Source reference: local `NuvioTV-0.8.0-sdh` worktree. Ported behavior includes bracketed and parenthetical annotations, speaker labels, music/sound suppression, whitespace cleanup, Android span preservation, empty-cue suppression, and `CueGroup` timing preservation.

On 0.8.4-beta, Nuvio's normal `CueGroup` path forwards the original group directly and only constructs a replacement group when its own cue normalizer changes a cue. The Morphe hook must therefore clean immediately after Nuvio extracts the incoming cue list and rebuild the incoming group when cleanup changes that list. Nuvio's direct sidecar renderer bypasses this callback, so its final cue list is cleaned separately before `SubtitleView.setCues`. Hooking only Nuvio's conditional constructor misses ordinary and sidecar subtitle cues.

The three modes map to the updated source implementation's `OFF`, `KEEP_LYRICS`, and `REMOVE_LYRICS` modes. Both cleanup modes remove every complete supported square-bracket and parenthetical block without vocabulary classification. `REMOVE_LYRICS` additionally removes all text enclosed by supported normal or mojibake music-note markers. Do not replace structural block removal with the source cleaner's legacy conservative vocabulary helpers.

Deliberately omitted: SDH audit logs, track logs, playback-report DTOs, backend/reporting changes, and Nuvio profile synchronization.

The 0.8.4-beta R8 target is matched through the Media3 interface/callback shape, the sidecar renderer shape and the settings resource/section-building sequence. Never widen a failed fingerprint. A new Nuvio version remains unsupported until isolated patching and every runtime gate pass.

Nuvio's hidden `EXPERIENCE` destination already stays inside the Classic/TV detail pane. The patch exposes that destination and reuses its native setting-card renderer for one `Remove SDH annotations` selector. The selector opens an in-window modal copied from Nuvio's Playback three-choice pattern; it must not become three switches or launch a separate Activity.
