# Mark SDH Subtitles

Patch ID: `sdh-marking`. Target: official NuvioTV `0.8.4-beta`.

The patch adds `Settings > Morphe > Subtitles > Mark SDH subtitles`, a native switch stored under `subtitles.mark_sdh` in private `morphe_patches` preferences. It defaults to off.

When enabled, embedded and addon subtitle titles gain one `SDH` suffix when the track name, language metadata, ID, or URL explicitly indicates SDH/HI/HOH/closed captions. English addon subtitle text may also be sampled in the background, including private `file:` sources supplied by the independent Allow Importing Subs from Local Storage patch. Content detection requires at least 20 bracketed `(...)` or `[...]` annotation blocks in addition to the existing evidence score. Music notes, song lyrics, and speaker labels count as zero bracketed annotations and cannot qualify by themselves. Addon samples are processed sequentially in displayed list order, and each positive result updates its existing row immediately without closing or reopening the subtitle list.

Explicit metadata marking is immediate for every language. Automatic content sampling remains English-only; it is asynchronous, capped at 64 KiB per source, uses one ordered background worker, and has strict connection/read timeouts for network sources. It does not block playback or the initial subtitle repository result. Each positive result invalidates the visible row directly, so its title changes to `English SDH` while the subtitle panel remains open.

Completely unmarked, unselected embedded tracks cannot be content-classified without separately extracting each embedded subtitle stream and remain outside this version's claim. The patch never edits subtitle files or subtitle dialogue.
