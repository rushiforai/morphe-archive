# Graph Report - Morphe Stuff  (2026-11-10)

## Corpus Check
- 30 files · ~46,077 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 12 file(s) not represented in the graph (top: (none) 6, .properties 2, .xml 1)

## Summary
- 671 nodes · 1480 edges · 67 communities (21 shown, 46 thin omitted)
- Extraction: 97% EXTRACTED · 3% INFERRED · 0% AMBIGUOUS · INFERRED: 40 edges (avg confidence: 0.81)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `a3229c85`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- Semantic Release Automation
- JSONObject
- KayoPatch.java
- .getAvailableAudioOptions
- generate_patches_readme.py
- Fingerprints.kt
- CHANGELOG.md
- package.json
- [1.0.6](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.0.5...v1.0.6) (2026-10-24)
- PatchListGenerator.kt
- KayoPatch.kt
- android.content.Context
- Constants.kt
- ExamplePatch
- gradlew
- Bug Report Template
- rules/graphify.md
- workflows/graphify.md
- Open PR to Main Workflow
- KayoPatch
- [1.0.2](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.0.1...v1.0.2) (2026-10-23)
- [1.0.4](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.0.3...v1.0.4) (2026-10-24)
- .getIntField
- Builder
- [1.1.10](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.1.9...v1.1.10) (2026-10-30)
- Builder
- [1.4.0](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.3.0...v1.4.0) (2026-11-06)
- [1.1.3](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.1.2...v1.1.3) (2026-10-27)
- [1.1.5](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.1.4...v1.1.5) (2026-10-28)
- KayoPatchTest
- [1.1.6](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.1.5...v1.1.6) (2026-10-28)
- [1.1.7](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.1.6...v1.1.7) (2026-10-30)
- .getFieldAny
- [1.1.9](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.1.8...v1.1.9) (2026-10-30)
- .buildAndShowDialog
- [1.2.1](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.2.0...v1.2.1) (2026-11-06)
- [1.3.0](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.2.1...v1.3.0) (2026-11-06)
- 1.0.0 (2026-10-23)
- ImmutableList
- .getFieldAny
- .extractVideoTracks
- TrackGroup
- [1.1.11](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.1.10...v1.1.11) (2026-11-06)
- KayoTvPatch
- [1.4.1](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.4.0...v1.4.1) (2026-11-06)
- [1.4.3](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.4.2...v1.4.3) (2026-11-08)
- KayoMobilePatch
- KayoPatchTest.java
- .getActiveStreamMetrics
- ExoPlayer
- [1.1.2](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.1.1...v1.1.2) (2026-10-27)
- [1.1.4](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.1.3...v1.1.4) (2026-10-28)
- [1.2.0](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.1.11...v1.2.0) (2026-11-06)
- [1.6.0](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.5.0...v1.6.0) (2026-11-10)
- DefaultTrackSelector
- Tracks
- .getActiveStreamMetrics
- JSONObject
- android.widget.TextView
- [1.0.3](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.0.2...v1.0.3) (2026-10-24)
- [1.1.1](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.1.0...v1.1.1) (2026-10-27)
- [1.5.0](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.4.3...v1.5.0) (2026-11-10)

## God Nodes (most connected - your core abstractions)
1. `KayoPatch` - 120 edges
2. `KayoTvPatch` - 113 edges
3. `KayoPatchTest` - 31 edges
4. `Builder` - 30 edges
5. `KayoMobilePatch` - 28 edges
6. `TrackGroup` - 27 edges
7. `Tracks` - 19 edges
8. `DefaultTrackSelector` - 19 edges
9. `Builder` - 18 edges
10. `ExoPlayer` - 14 edges

## Surprising Connections (you probably didn't know these)
- `🩹 Patches list` --references--> `main()`  [INFERRED]
  README.md → patches/src/main/kotlin/util/PatchListGenerator.kt
- `Bug Report Template` --semantically_similar_to--> `Feature Request Template`  [INFERRED] [semantically similar]
  .github/ISSUE_TEMPLATE/bug_report.yml → .github/ISSUE_TEMPLATE/feature_request.yml
- `KayoPatch` --references--> `ExoPlayer`  [EXTRACTED]
  extensions/extension/src/main/java/app/template/extension/kayo/KayoPatch.java → extensions/extension/src/main/java/com/google/android/exoplayer2/ExoPlayer.java
- `KayoPatch` --references--> `Tracks`  [EXTRACTED]
  extensions/extension/src/main/java/app/template/extension/kayo/KayoPatch.java → extensions/extension/src/main/java/com/google/android/exoplayer2/Tracks.java
- `KayoPatch` --references--> `DefaultTrackSelector`  [EXTRACTED]
  extensions/extension/src/main/java/app/template/extension/kayo/KayoPatch.java → extensions/extension/src/main/java/com/google/android/exoplayer2/trackselection/DefaultTrackSelector.java

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **GitHub Issue Template Configuration Suite** — github_issue_template_bug_report, github_issue_template_feature_request, github_issue_template_config [EXTRACTED 1.00]

## Communities (67 total, 46 thin omitted)

### Community 0 - "Semantic Release Automation"
Cohesion: 0.40
Nodes (5): Dependabot Configuration, Conventional Changelog Version Pinning, Release Workflow, Fallback Build Verification, Semantic Release Automation

### Community 2 - "KayoPatch.java"
Cohesion: 0.08
Nodes (33): alertdialog, android.app.Activity, android.graphics.drawable.GradientDrawable, android.os.Handler, android.view.View, android.view.ViewGroup, arraylist, clipboardmanager (+25 more)

### Community 4 - "generate_patches_readme.py"
Cohesion: 0.13
Nodes (18): anchor(), build_content(), patches_table(), pkg_emoji(), Render a markdown table of supported versions. Experimental versions get a 🧪…, Wrap a patches table in a <details> spoiler with a versions sub-table. If…, Build the full generated patches section., Generates the patches section of README.md from patches-list.json and injects… (+10 more)

### Community 5 - "Fingerprints.kt"
Cohesion: 0.05
Nodes (72): accessflags, fieldaccess, Fingerprint, matchafterimmediately, methodcall, AbstractDaznPlayerControlsOnClickFingerprint, AbstractDaznPlayerControlsSetupFingerprint, AbstractDaznPlayerControlsTrackSelectorVisibilityFingerprint (+64 more)

### Community 6 - "CHANGELOG.md"
Cohesion: 0.18
Nodes (10): [1.0.1](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.0.0...v1.0.1) (2026-10-23), [1.0.5](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.0.4...v1.0.5) (2026-10-24), [1.1.0](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.0.6...v1.1.0) (2026-10-26), [1.1.8](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.1.7...v1.1.8) (2026-10-30), [1.4.2](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.4.1...v1.4.2) (2026-11-07), 🐛 Bug Fixes, 🐛 Bug Fixes, 🐛 Bug Fixes (+2 more)

### Community 7 - "package.json"
Cohesion: 0.14
Nodes (13): devDependencies, conventional-changelog-conventionalcommits, gradle-semantic-release-plugin, @MorpheApp/changelog, semantic-release, @semantic-release/exec, @semantic-release/git, conventional-changelog-conventionalcommits (+5 more)

### Community 9 - "PatchListGenerator.kt"
Cohesion: 0.13
Nodes (20): file, gsonbuilder, jsonobject, loadpatchesfromjar, manifest, Patch, generatePatchList(), JsonCompatibility (+12 more)

### Community 10 - "KayoPatch.kt"
Cohesion: 0.13
Nodes (13): addinstruction, addinstructions, addinstructionswithlabels, bytecodepatch, compatibility_kayo_sports, compatibility_kayo_sports_tv, fieldreference, getinstruction (+5 more)

### Community 12 - "Constants.kt"
Cohesion: 0.33
Nodes (5): apkfiletype, apptarget, compatibility, Constants, supportedabi

### Community 14 - "gradlew"
Cohesion: 0.83
Nodes (3): gradlew script, die(), warn()

### Community 19 - "Bug Report Template"
Cohesion: 1.00
Nodes (3): Bug Report Template, Issue Template Configuration, Feature Request Template

### Community 23 - "KayoPatch"
Cohesion: 0.13
Nodes (3): KeyEvent, SuppressWarnings, KayoPatch

### Community 27 - "Builder"
Cohesion: 0.18
Nodes (3): TrackSelectionOverride, Builder, TrackSelectionParameters

### Community 29 - "Builder"
Cohesion: 0.13
Nodes (3): Builder, Override, Parameters

### Community 33 - "KayoPatchTest"
Cohesion: 0.13
Nodes (10): DummyDefaultBandwidthMeter, DummyHdmiPluginV461, DummyHdmiPluginV481, DummyLivePlaybackSpeedControl, DummyLoadArgumentsV481, DummyLoadControl, DummyRenderersFactory, KayoPatchTest (+2 more)

### Community 41 - "1.0.0 (2026-10-23)"
Cohesion: 0.67
Nodes (3): 1.0.0 (2026-10-23), 🐛 Bug Fixes, ✨ New Features

### Community 42 - "ImmutableList"
Cohesion: 0.19
Nodes (6): collection, ImmutableList, iterator, java.util.AbstractList, linkedhashmap, SafeVarargs

### Community 45 - "TrackGroup"
Cohesion: 0.24
Nodes (3): AudioTrackOption, Override, TrackGroup

### Community 51 - "KayoPatchTest.java"
Cohesion: 0.24
Nodes (4): arrays, assert, Format, field

### Community 57 - "[1.6.0](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.5.0...v1.6.0) (2026-11-10)"
Cohesion: 0.67
Nodes (3): [1.6.0](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.5.0...v1.6.0) (2026-11-10), 🐛 Bug Fixes, ✨ New Features

### Community 58 - "DefaultTrackSelector"
Cohesion: 0.33
Nodes (3): DefaultTrackSelector, CountingTrackSelector, Override

## Knowledge Gaps
- **51 isolated node(s):** `@MorpheApp/changelog`, `@MorpheApp/changelog`, `@semantic-release/exec`, `@semantic-release/exec`, `@semantic-release/git` (+46 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 163 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **46 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `KayoPatch` connect `KayoPatch` to `KayoPatchTest`, `KayoPatch.java`, `.getFieldAny`, `DefaultTrackSelector`, `android.content.Context`, `.extractVideoTracks`, `TrackGroup`, `KayoMobilePatch`, `ExoPlayer`, `.getIntField`, `Tracks`, `.getActiveStreamMetrics`, `JSONObject`, `android.widget.TextView`, `.getLongField`?**
  _High betweenness centrality (0.167) - this node is a cross-community bridge._
- **Why does `KayoTvPatch` connect `KayoTvPatch` to `JSONObject`, `KayoPatch.java`, `.getAvailableAudioOptions`, `.getFieldAny`, `.buildAndShowDialog`, `android.content.Context`, `.getFieldAny`, `TrackGroup`, `.getActiveStreamMetrics`, `android.widget.TextView`?**
  _High betweenness centrality (0.152) - this node is a cross-community bridge._
- **Why does `TrackGroup` connect `TrackGroup` to `KayoPatchTest`, `KayoPatch.java`, `.getFieldAny`, `Builder`, `ImmutableList`, `.extractVideoTracks`, `KayoPatchTest.java`, `Tracks`, `Builder`?**
  _High betweenness centrality (0.066) - this node is a cross-community bridge._
- **What connects `@MorpheApp/changelog`, `@MorpheApp/changelog`, `@semantic-release/exec` to the rest of the system?**
  _51 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `KayoPatch.java` be split into smaller, more focused modules?**
  _Cohesion score 0.07673469387755102 - nodes in this community are weakly interconnected._
- **Should `generate_patches_readme.py` be split into smaller, more focused modules?**
  _Cohesion score 0.1286549707602339 - nodes in this community are weakly interconnected._
- **Should `Fingerprints.kt` be split into smaller, more focused modules?**
  _Cohesion score 0.05251141552511415 - nodes in this community are weakly interconnected._