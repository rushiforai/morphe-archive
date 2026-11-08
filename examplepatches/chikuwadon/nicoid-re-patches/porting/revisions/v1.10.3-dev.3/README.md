# v1.10.3-dev.3 — development validation

This private development build supersedes v1.10.3-dev.2 without altering its source snapshot or the published v1.10.2 release.

- Issue #112: optional audio continuation when the device screen turns off during **normal playback** (default ON). No automatic popup/background-player mode transition.
- Persist watch statistics and upload timestamp when adding a NicoNico video URL to a device playlist. Restore missing metadata for visible previously pasted entries with bounded, throttled background requests and preserved list scroll.
- Use one shared comment-limit summary for standard, finite and unlimited choices: "取得可能な範囲でコメントを読み込みます。実際の取得数は動画によって異なります".
- Reduce horizontal-tab paging commit distance (30% to 18% for main tabs; 20% to 15% for inline tabs), while keeping the horizontal-vs-vertical direction safety checks and reserved screen-edge areas.
- Retain existing dev.1 deep-scroll pagination, unlimited comment fetch, cache-index optimization, and My Page gestures.

Safety: no third-party URL dereferencing; no new permission or playback mode switch; playlist metadata write serialized through existing storage API; comment fetching remains bounded by content, cancellation and memory availability. Android 9/14/16 runtime verification remains required; this is not an official release.
