# Graph Report - patches  (2026-11-02)

## Corpus Check
- 136 files · ~64,347 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 523 nodes · 1531 edges · 26 communities (14 shown, 12 thin omitted)
- Extraction: 99% EXTRACTED · 1% INFERRED · 0% AMBIGUOUS · INFERRED: 12 edges (avg confidence: 0.85)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `1650e2be`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- bytecodepatch
- Fingerprint
- CommentToolsPatch.kt
- BytecodeUtils.kt
- FeedFilterPatch.kt
- patchexception
- CommentMenuBlockHooks.kt
- BlockAuthorPatch.kt
- FreeRegisterProvider.kt
- FeatureGateLabPatch.kt
- CopyIdsPatch.kt
- NativeFocusBridge.kt
- PatchListGenerator.kt
- CommentBoxButtons.kt
- FollowDiagnosticsPatch.kt
- Build.java

## God Nodes (most connected - your core abstractions)
1. `getReference()` - 44 edges
2. `indexOfFirstInstructionOrThrow()` - 15 edges
3. `addInstructionsAtControlFlowLabel()` - 14 edges
4. `findMutableMethodOf()` - 11 edges
5. `requireLocals()` - 9 edges
6. `getFreeRegisterProvider()` - 9 edges
7. `indexOfFirstInstructionReversedOrThrow()` - 8 edges
8. `findInstructionIndicesReversedOrThrow()` - 8 edges
9. `guardAtEntry()` - 7 edges
10. `indexOfFirstInstruction()` - 7 edges

## Surprising Connections (you probably didn't know these)
- `installSwitchPlayGuards()` --calls--> `awemeParameterRegister()`  [INFERRED]
  patches/src/main/kotlin/app/czyeru/patches/tiktok/interaction/blockauthor/NativePlaybackBridge.kt → patches/src/main/kotlin/app/czyeru/patches/tiktok/interaction/blockauthor/BlockAuthorPatch.kt
- `sharedExtensionPatch()` --calls--> `returnEarly()`  [EXTRACTED]
  patches/src/main/kotlin/app/czyeru/patches/shared/misc/extension/SharedExtensionPatch.kt → patches/src/main/kotlin/app/czyeru/util/BytecodeUtils.kt
- `filterProfileItemsAtReturns()` --calls--> `addInstructionsAtControlFlowLabel()`  [EXTRACTED]
  patches/src/main/kotlin/app/czyeru/patches/tiktok/feedfilter/FeedFilterPatch.kt → patches/src/main/kotlin/app/czyeru/util/BytecodeUtils.kt
- `filterFriendsFinalDelivery()` --calls--> `addInstructionsAtControlFlowLabel()`  [EXTRACTED]
  patches/src/main/kotlin/app/czyeru/patches/tiktok/feedfilter/FeedFilterPatch.kt → patches/src/main/kotlin/app/czyeru/util/BytecodeUtils.kt
- `filterProfileDetailAdEvent()` --calls--> `addInstructionsAtControlFlowLabel()`  [EXTRACTED]
  patches/src/main/kotlin/app/czyeru/patches/tiktok/feedfilter/FeedFilterPatch.kt → patches/src/main/kotlin/app/czyeru/util/BytecodeUtils.kt

## Import Cycles
- None detected.

## Communities (26 total, 12 thin omitted)

### Community 0 - "bytecodepatch"
Cohesion: 0.12
Nodes (3): resolveSearchEnabledBoundary(), resolveSuggestedAccountInjectorGates(), indexOfFirstInstructionOrThrow()

### Community 1 - "Fingerprint"
Cohesion: 0.05
Nodes (14): cacheChainCallbackShape(), feedItemListStoreCount(), isStickerPreviewBindCall(), ownListFieldWrites(), patchBooleanGate(), isTargetClass(), resolveSharePanel(), isCommentSortEligibilityMethod() (+6 more)

### Community 2 - "CommentToolsPatch.kt"
Cohesion: 0.06
Nodes (24): body(), captureDislikeTouchListener(), commentSuggestionGate(), isCommentSceneService(), isCommentSearchHeaderFactory(), questions(), registerReplySearch(), replyModel() (+16 more)

### Community 3 - "BytecodeUtils.kt"
Cohesion: 0.06
Nodes (24): cloneMutable(), cloneMutableAndPreserveParameters(), containsLiteralInstruction(), customLiteral(), findFieldFromToString(), findInstructionIndexFromToString(), findInstructionIndicesReversed(), findInstructionIndicesReversedOrThrow() (+16 more)

### Community 4 - "FeedFilterPatch.kt"
Cohesion: 0.06
Nodes (21): activityOnCreateExtensionHook(), sharedExtensionPatch(), branchTargetIndex(), filterChainedCacheDelivery(), filterFriendsFinalDelivery(), filterProfileDetailAdEvent(), filterProfileItemsAtReturns(), filterReachBottomCacheDelivery() (+13 more)

### Community 5 - "patchexception"
Cohesion: 0.08
Nodes (5): adPositionFingerprint(), wxSdkFingerprint(), isAccentEndpoint(), rrggbb(), findMutableMethodOf()

### Community 6 - "CommentMenuBlockHooks.kt"
Cohesion: 0.09
Nodes (8): addCommentCopySanitizerInstructions(), findClipboardHelperCallIndexes(), isCommentCopyBuilder(), commentMenuBlockIcon(), isCommentMenuListSink(), isShareActionKey(), resolveCommentMenuBlock(), getFreeRegisterProvider()

### Community 7 - "BlockAuthorPatch.kt"
Cohesion: 0.14
Nodes (8): awemeParameterRegister(), validateBlockPager(), calls(), implementationResume(), installNativePlayback(), installSwitchPlayGuards(), resolveNativePlayback(), resolveNativePlaybackMembers()

### Community 8 - "FreeRegisterProvider.kt"
Cohesion: 0.16
Nodes (6): buildInstructionOffsetArray(), findFreeRegister(), findFreeRegisters(), findFreeRegistersInternal(), findInstructionIndexByOffset(), getBranchTargetInstructionIndex()

### Community 9 - "FeatureGateLabPatch.kt"
Cohesion: 0.13
Nodes (3): isCompactCommentHeaderBind(), resolveCompactCommentHeader(), patchBoundary()

### Community 10 - "CopyIdsPatch.kt"
Cohesion: 0.23
Nodes (7): bioTextField(), hookLiveCard(), invokes(), liveBioSets(), liveNameSets(), resolveShareAppsPanel(), sharePackageField()

### Community 11 - "NativeFocusBridge.kt"
Cohesion: 0.21
Nodes (5): abandonsFocus(), implementsAudioListener(), requestsFocus(), resolveNativeFocus(), superclassChain()

### Community 13 - "CommentBoxButtons.kt"
Cohesion: 0.35
Nodes (6): commentBoxButtonFields(), commentBoxButtonOf(), commentBoxButtonStore(), plusPanelLookups(), resolveCommentBoxButtons(), resolvePlusPanelTiles()

### Community 14 - "FollowDiagnosticsPatch.kt"
Cohesion: 0.26
Nodes (6): detailedFollowRequestInstructions(), jediFollowRequestInstructions(), patchCommonFollowApi(), patchNetworkExecuteCall(), patchNetworkParseResponse(), simpleFollowRequestInstructions()

## Knowledge Gaps
- **12 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `getReference()` connect `Fingerprint` to `bytecodepatch`, `CommentToolsPatch.kt`, `BytecodeUtils.kt`, `FeedFilterPatch.kt`, `patchexception`, `CommentMenuBlockHooks.kt`, `FeatureGateLabPatch.kt`, `CopyIdsPatch.kt`, `NativeFocusBridge.kt`, `CommentBoxButtons.kt`, `FollowDiagnosticsPatch.kt`?**
  _High betweenness centrality (0.050) - this node is a cross-community bridge._
- **Should `bytecodepatch` be split into smaller, more focused modules?**
  _Cohesion score 0.12134899126769046 - nodes in this community are weakly interconnected._
- **Why does `addInstructionsAtControlFlowLabel()` connect `FeedFilterPatch.kt` to `bytecodepatch`, `BytecodeUtils.kt`, `CopyIdsPatch.kt`, `CommentToolsPatch.kt`?**
  _High betweenness centrality (0.011) - this node is a cross-community bridge._
- **Should `Fingerprint` be split into smaller, more focused modules?**
  _Cohesion score 0.05029838022165388 - nodes in this community are weakly interconnected._
- **Why does `findMutableMethodOf()` connect `patchexception` to `bytecodepatch`, `CommentToolsPatch.kt`, `BytecodeUtils.kt`, `FeedFilterPatch.kt`, `CopyIdsPatch.kt`, `NativeFocusBridge.kt`, `FollowDiagnosticsPatch.kt`?**
  _High betweenness centrality (0.008) - this node is a cross-community bridge._
- **Should `CommentToolsPatch.kt` be split into smaller, more focused modules?**
  _Cohesion score 0.05714285714285714 - nodes in this community are weakly interconnected._
- **Should `BytecodeUtils.kt` be split into smaller, more focused modules?**
  _Cohesion score 0.06009783368273934 - nodes in this community are weakly interconnected._