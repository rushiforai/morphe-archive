# Clause-editorial r8 — v1.0.7 baseline

This revision starts from the exact published v1.0.7 commit. It applies creator/editor subtitle principles: one coherent semantic unit per event, natural clause breaks for long speech, protected syntactic groups, source pause and duration as evidence, and no assumption that every ASR cue is a speaker or shot boundary.

Cost is a hard constraint. The existing single translation-plus-segmentation request, bounded context, output cap and retry policy remain. At most eight compact pause hints derived from already downloaded source timings are added. There is no second model pass, polishing pass, diarization call, scene-recognition call or presentation-only retry. A valid translation is not rejected merely for exceeding a presentation preference.

The model receives a hierarchy: semantic coherence first, syntactic integrity second, source pause third, duration/readability fourth. This avoids accumulating multiple independent clauses in one event while preserving complete meaning. Human speaker/shot boundaries remain source-limited.

Research consulted: BBC Subtitle Guidelines; Netflix Timed Text General Requirements; Netflix Subtitle Timing Guidelines; public editor discussions searched for clause breaks, line breaks, reading speed and shot changes. The common principle is linguistic coherence over arbitrary geometry, with timing and shot synchronization when evidence exists.
