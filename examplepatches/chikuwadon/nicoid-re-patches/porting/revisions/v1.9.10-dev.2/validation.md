# v1.9.10-dev.2 verification revision

Preserves accepted dev.1 ranking, grip, seek-setting and settings/search fixes. Not a main-branch release.

Popup resizing now assigns WindowManager width/height alongside the child geometry. The dev.1 post-layout updateVideoSize call is removed: layout dimensions are not re-published as intrinsic media dimensions. At terminal playback only, one bounded last-frame image is captured from TextureView (SurfaceView PixelCopy is supported on API 26+), fitted by ImageView, and cleared on resumed playback or teardown. No second decoder and no repeated frame capture while playing.

Direct background entry no longer starts NicoidVideoActivity. It starts the existing foreground playback Service and reparents its player into an in-app mini-player. Explicit normal-player minimization is unchanged. Direct-entry expansion uses the existing Service-to-normal playback transfer, not the original Activity-retained-session restore; physical continuity for that transfer remains unverified. Service restart cleanup is distinguished from termination, stale request tokens are rejected, and settings hide the mini view. Native source-video size callbacks are ignored while the Service player is hosted in-app.

Tab gesture MOVE no longer creates bitmaps or draws other Activity trees. Bounded previews are captured after a settling delay outside active touch gestures. Descriptor persistence is deferred until activation. Cross-Activity previews remain a transitional design, not a complete unified screen host.

Validation: 46 Robolectric tests passed on SDK 28/34. 49,129 invocation argument-word checks and 11,726 defined-target dispatch checks passed. Original extension payload, search resources and 800 PNG contracts retained; existing playback/ranking/content suites passed (playback suite: 139 checks). Hook order, terminal-frame isolation and the gesture hot path are checked. Physical-device popup scaling/movement, PixelCopy/native texture output, live media/API/Cast and subjective responsiveness are not verified by these tests.

MPP SHA256: ac573cbbe21e7582334421e1d131e82f56be53b4661f160178e48f3082f984b9

Rebuild staging and prerequisites are the same as dev.1; overlay all native-overrides from this revision and use its Java sources and build.py.
