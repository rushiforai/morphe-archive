# Task Validation: attachment-md5-recovery

- Validated against: the pinned artifact's smali, the client source at the tested version,
  and the server's own validation rule (read from `altero/services/storage.py`)
- Validation date: 2026-09-24
- Verdict: READY

## INVALID — requires revision

None.

## VALID — confirmed

### 1.1 / 1.2 — the failure is the client's empty digest, not a server defect

- The device's own trace records the parameters of the request it sent
  (`key=Z5B8C2J9;oldMd5=null;md5=;filesize=208429;mtime=1790273325176`) and the `400` that followed;
  the failing body is 16 bytes, which is the length of `md5 not provided` exactly.
- The server's rule was read rather than assumed (`storage.py:221`): the missing list is built with
  `if not form.get(name)`, so an empty field is indistinguishable from an absent one — which is why
  the message names `md5` while the client believes it sent one.
- Evidence: `/tmp/zotero-logcat-live.txt` (upload-path lines, attachment `Z5B8C2J9`);
  `/tmp/altero/src/altero/services/storage.py` lines 216–230.

### 1.3 / 1.4 — the instruction to replace, and why the obvious shortcut is wrong

- `ReadAttachmentUploadsDbRequest.smali:505` is the guard; the repair below it is the app's own
  recomputation. The class contains exactly one `const-string "null"`, shared with the `backendMd5`
  comparison at `:541` — a `check-cast` separates that comparison from the constant, which is what
  makes the two distinguishable without editing the constant.
- Consequence recorded in the patch: the constant is left in place, only the `areEqual` invoke is
  replaced, and the second comparison's behaviour is unchanged by construction.
- Evidence: `analysis/zotero/smali/classes7/org/zotero/android/database/requests/ReadAttachmentUploadsDbRequest.smali` lines 490–560.

### 2.2 — the replacement is expressible with the available API

- `replaceInstruction(MutableMethod, Int, BuilderInstruction)` plus
  `BuilderInstruction35c(Opcode, registerCount, registerC…registerG, reference)` express the swap: an
  `invoke-static` of two registers replacing an `invoke-static` of two registers, so the following
  `move-result`/`if-eqz` pair is untouched.
- The value register is the comparison's left operand; the file register is read from the existing
  repair's second argument, so the replacement cannot hash the wrong file.
- Evidence: the sibling `AttachmentMtimeRecoveryPatch` in this repository uses the same API for the
  same kind of swap, and the build accepted it.

### 3.1 — the bundle discovers new patches without a registry

- `util/PatchListGenerator.kt` loads patches from the built `.mpp` (`loadPatchesFromJar`) and the
  Gradle plugin scans for declared `bytecodePatch` values, so adding the file is sufficient; verified
  by the sibling patch appearing in the bundle after the same kind of addition.
- Evidence: `patches/src/main/kotlin/util/PatchListGenerator.kt`, `patches/build.gradle.kts`.

## Fixes needed

None.

## Verdict

`VERDICT: READY`
