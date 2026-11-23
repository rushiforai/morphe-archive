# v2.1.8-dev.2: paused fullscreen transition center controls

## Observed on 2026-11-22 SC-52D bugreport

- 19:43:41.995: playVisibility=4 (INVISIBLE), paused=true, hostShown=true; v2.1.8-dev.1 re-displayed the button
- 19:43:44.963–46.319: playVisibility=0 (VISIBLE), paused=true, hostShown=true; screen symptom remained
- Therefore, restoring the button's visibility once is not a sufficient fix
- The previous PlayerStart215 Watch calls hide() on each pre-draw and at 32 ms intervals until a TextureView update arrives; a paused retained texture may never deliver another decoded frame
- The previous diagnostic did not include the button's true on-screen coordinates, global visible rectangle, or controller alpha

## Change

- Use the already-available TextureView frame when the player is positively paused, has a valid duration, has no pending play intent and the texture remains attached
- Complete the first-frame watcher without waiting for another video frame; stop its repeated hiding and preserve existing queue spacing and fullscreen handoff paths
- Keep normal playing and pending-play first-frame behavior unchanged
- Recover a button displaced fully outside the video rectangle without changing in-frame positions; never override the user's dock-outside-video preference
- Sample real on-screen coordinates, global visibility and controller geometry after transitions, including delayed native re-layout
- Do not change Media3 playback state, video seek position, underlying native DEX patch or UI resources

## Verification expectations

- Build the MPP from pinned published v2.1.7 (SHA-256 d7220da8b7a7b8d630160b1b17234dd471ee6a96c7da6363b912516c53177081)
- Compare every helper class except the deliberately modified PlayerStart215$Watch and the new PausedCenter218 classes
- Round-trip modified Watch semantics through smali and check one first-frame and one paused-frame hook
- Verify extension classes unchanged and MPP all other entries byte-identical to v2.1.7
- On device: pause normal → fullscreen → normal repeatedly, and test playing transitions, first video launch, next video, orientation and intentionally hidden controls
- Even a passing CI build cannot confirm the visual symptom is fixed without device validation
