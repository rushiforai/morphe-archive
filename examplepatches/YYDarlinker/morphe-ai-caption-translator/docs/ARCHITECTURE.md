# Architecture

This document describes the retained N37R2 product used for the 1.4.0 release. Historical N-card reports preserve their original claims and failures; they are not current contracts.

## Patch-time boundaries

`patches/` contains Kotlin bytecode/resource patches and structural fingerprints. The two public roots are `AI caption translator` and `Remember caption selection`; anonymous support dependencies share localization, resource mapping and the extension. The extension has the independent `app.yydarlinker` runtime namespace. It does not ship a copied official extension.

The AI root binds the actual caption model, menu/draw/long-press seams, typed settings and player evidence. Feature permission is published after required bindings are established. Resource IDs are resolved from the target resources, not copied from another APK. Ambiguous or incomplete bindings fail closed. Original source text and signed track identity are retained.

`extensions/extension.mpe` is a raw precompiled DEX merged by Morphe. Java runtime code implements networking, source timing, validation, presentation, caches and settings. Complex logic lives in the extension rather than large injected methods. See [Morphe conventions](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/3_structure_and_conventions.md).

## Caption pipeline

1. Capture an owned native caption selection and immutable video/session/target/configuration context. Original tracks use local source display; only Auto-translate selections enter the translation API path.
2. Retrieve the source subtitles and choose bounded same-language timing references. Keep multiple descriptors; a shared 1500ms reference budget permits at most three attempts. JSON3 word/segment/cue boundaries carry their actual evidence level. Partial anchors may retime a local source component; unproven inner words remain estimated.
3. Preserve source coverage and real hard breaks. Build bounded semantic source tasks and request blocks; prompt/hash/cache identities include the appropriate immutable policy context. One normal API call translates a block with explicit source references, rather than asking a separate model to invent timestamps.
4. Validate returned source references, increasing ranges, owned-window coverage and structural requirements. Presentation warnings are distinct from rejection or paid repair. Invalid provider output cannot acquire publication permission.
5. Plan pages from source intervals and actual geometry. Preserve the Chinese compatibility path; non-Chinese pages prefer appropriate punctuation/clause boundaries. A fitting short event stays whole. Multi-page minimum duration is 1200ms; impossible capacity may yield an explicitly diagnosed safe blank. Estimated page times are labelled, not presented as measured target-language audio alignment.
6. Display using confirmed player evidence and fresh sampled clock projection. Seek/video/session changes revoke stale epochs. Pause and rendering use consistent evidence rather than returning to an older event.

Scheduling remains **focus 2 + prefetch 2 = total 4**. Network deadlines, cancellation and provider failures remain distinct. No unbounded retry, extra speech recognition service or universal negative timestamp offset is introduced by release preparation.

## Ownership, UI and geometry

`CaptionPlayerAuthority` separates player ownership from caption render epochs. COMPACT/transition states revoke display; a compact transition immediately hides the overlay. Stable player evidence allows a current scene to render again. A stale owner or retired session cannot publish.

Controller/session/cache coordination uses the retained CAS publication contract. Main-thread lifecycle calls revoke permission without waiting for network/cache physical completion; background cleanup has a bounded barrier. Cache preparation and filesystem work remain outside lifecycle locks.

The overlay occupies a stable Activity root. Horizontal placement converts the current visible video rectangle into host coordinates and uses its physical center with physical gravity; inherited RTL `START` semantics cannot reinterpret a physical left margin. Text bidi direction stays independent. Existing size, vertical position, timing and pagination contracts are retained. Position-only updates do not rebuild LayoutParams. Deferred geometry work is coalesced and guarded by ownership; player notification callbacks do not scan the tree synchronously.

Settings use the official Morphe language for resources while preserving actual Activity/window ownership and editable field identity. Localization changes display defaults without mutating user requirements or effective request identity. Normal preview binding does not reset measurement caches. Diagnostics use immutable snapshots and bounded background lanes; ordinary row binding/draw does not decrypt credentials or archive diagnostics synchronously.

## Distribution

The generated MPP contains patcher code, resources and the embedded raw MPE. Public target metadata is generated from the same patch definitions. Tests, controlled hosts, original APKs and signed test APKs are not public distribution assets. See [compatibility](COMPATIBILITY.md) and [release process](RELEASING.md).
