# Task Validation: attachment-mtime-recovery

- Validated against: the pinned artifact's smali and the patcher/dexlib2 API surface (in-session;
  no sub-agent round was run for this single-instruction change)
- Validation date: 2026-09-24
- Verdict: READY

## INVALID — requires revision

None.

## VALID — confirmed

### 1.2 — the exact call site, and why it must be scoped

- `ReadAttachmentUploadsDbRequest.smali:336` invokes
  `Lkotlin/text/StringsKt;->toLongOrNull(Ljava/lang/String;)Ljava/lang/Long;` and the result is
  tested by `if-nez v12, :cond_bc` — the skip branch. The same `toLongOrNull` appears in nine
  classes of the artifact, so a patch that matched by method reference alone would over-reach.
- Evidence: `analysis/zotero/smali/classes7/org/zotero/android/database/requests/ReadAttachmentUploadsDbRequest.smali` (lines 330–341).

### 2.2 — the replacement is expressible with the available API

- The patcher exposes `replaceInstruction(MutableMethod, Int, String)` and
  `replaceInstruction(MutableMethod, Int, BuilderInstruction)`, and dexlib2 provides
  `BuilderInstruction35c(Opcode, registerCount, registerC…registerG, reference)` — enough to replace
  one `invoke-static` with another of identical shape, reusing the original register.
- Evidence: https://github.com/MorpheApp/morphe-patcher/blob/v1.14.1/api/morphe-patcher.api (`replaceInstruction`, lines 506–507) ; `com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c` (published dexlib2 API used by the patcher itself).

### 2.1 / 2.2 — the extension mechanism

- A patch declares its extension with `extendWith("extensions/extension.mpe")` and the module is
  configured by the `extension { name = … }` block plus an `android { namespace = … }` — the
  template's own example used exactly this shape in this repository before the first change removed
  it, and the build accepted the extension module then.
- Evidence: the removed `extensions/extension/build.gradle.kts` and the template's `ExamplePatch.kt`
  (`extendWith`) as committed in this repository's history (`1af2d95`, `8c8350b`).

## Fixes needed

None.

## Verdict

`VERDICT: READY`
