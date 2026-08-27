# Porting notes

The embedded hook targets Nuvio's `TrackInfo` primary-constructor shape rather than its obfuscated class name. The addon hook targets the option-list builder through the stable `Subtitle` model accessors and language-name conversion call. A third hook targets the 0.8.7 Compose content lambda by the ordered field reads for selection, source, title, and metadata; it observes Nuvio's own optimized snapshot state so cached rows redraw immediately. All fingerprints must match exactly once.

The annotation grammar is deliberately copied into the independent `sdhmarking` compartment rather than depending on the removal patch. The bounded source reader accepts both HTTP(S) addon URLs and `file:` URLs; this is generic source handling and does not depend on the optional Allow Importing Subs from Local Storage package. Detection is conservative: at least 20 bracketed `(...)` or `[...]` annotation blocks and the minimum weighted score are required. Music notes and speaker labels remain supporting evidence only and cannot classify a file without those brackets. The removal patch's destructive transformation behavior is not called or shared.

The setting uses feature-specific manifest metadata in addition to the shared Subtitles category metadata. This permits either subtitle patch to be selected independently without rendering controls belonging to an absent patch.

Deliberate omissions for the initial version: non-English classification, archive extraction, character-set guessing beyond UTF-8, blocking full-file downloads, and content classification of unselected embedded streams.
