# Morphe Patcher Notes

Source examined: `app.morphe:morphe-patcher:2.1.0` sources, extracted under `/tmp/mps`.
The patch bundle plugin is `app.morphe.patches:2.1.0`.

## Patch types

| Builder | Context | Resource mode | Can write APK files? |
|---|---|---|---|
| `bytecodePatch` | `BytecodePatchContext` | `NONE` | No. It only produces patched DEX files. |
| `resourcePatch` | `ResourcePatchContext` | `FULL` | Yes. Decodes/encodes resources and other entries. |
| `rawResourcePatch` | `ResourcePatchContext` | `RAW_ONLY` | Yes, without compiling `resources.arsc`. |

`Patcher` selects the mode from the patch types present:

- any `ResourcePatch` -> `FULL`
- any `RawResourcePatch` -> `RAW_ONLY`
- otherwise -> `NONE`

In `NONE` mode, `getOtherResourceFiles(...)` returns `null`, so a pure `bytecodePatch` cannot
persist edits to `lib/**` or `assets/**`.

A `bytecodePatch` can declare `dependsOn(resourcePatch)`, but the resource edits are still
performed by the resource patch and merged by the patcher.

## `ResourcePatchContext`

The useful API:

```kotlin
fun listApkEntries(prefix: String = ""): List<String>
operator fun get(path: String, copy: Boolean = true): File
fun delete(name: String, packageName: String? = null)
fun listDecodableFiles(pattern: String = "**", packageName: String? = null): List<String>
fun decode(vararg patterns: String, packageName: String? = null): List<String>
fun document(path: String): Document
```

- `listApkEntries("lib/")` lists **all** archive entries, including native libraries and
  assets, without staging them.
- `listDecodableFiles(...)` covers the manifest, `res/`, and root entries such as
  `assets/...`, but explicitly **excludes native libraries and DEX**.
- `get("lib/arm64-v8a/libil2cpp.so")` still extracts a native library on demand.
- `get("assets/bin/Data/data.unity3d")` returns a normal writable `File`.
- `delete("lib/x86/libfoo.so")` excludes the entry from the rebuilt APK.
- To add a new entry, write to a path returned by `get(path, copy = false)`; `addFile` is on
  the internal `ResourceCoder`, not on `ResourcePatchContext`.

For non-resource paths, `get` resolves under the working directory’s `root/` tree and stages
the entry from the APK if needed. `res/**` and `package.json` are package-scoped;
`AndroidManifest.xml` lives at the working-directory root.

## Native library handling

`ArsclibResourceCoder` does not stage `lib/**` during decode, to avoid unpacking hundreds of
megabytes. It extracts a library when `get(...)` requests it and records:

```text
lazilyExtractedRootFiles[path] = ExtractedRootFile(length, hash)
```

Change detection compares length first, then a content hash. A same-length byte edit is
therefore still detected.

On rebuild:

- changed root files are collected as `modifiedBinaryResources`;
- `getOtherResourceFiles(...)` moves them into the output `other/` directory;
- `ApkUtils.applyTo(...)` adds them back to the APK;
- `lib/**` entries are aligned to 16 KiB (`LIBRARY_ALIGNMENT = 1024 * 16`);
- existing `.so` paths are kept uncompressed via `uncompressed-files.json`;
- `stripNativeLibraries()` is a no-op when `keepArchitectures` is empty, which is the default.

This is enough to read, edit, and write back `libil2cpp.so`, but it is raw file I/O. There is no
ELF parser, disassembler, assembler, or Unity bundle parser in the patcher.

## APKM / split APKs

`PatcherConfig.apkFile` is a single APK. The Manager/CLI is responsible for merging an
APKM/APKS/XAPK first. The patcher provides:

- `app.morphe.patcher.apk.ApkMerger`
- `ApkFileType.APKM`, `APKS`, `XAPK` (and `_REQUIRED` variants)

For KoPP2, the base APK has no `lib/`; the libraries are in the two split configs. A patch must
declare `ApkFileType.APKM` (or `XAPK`) and be run against the merged APK. With Morphe Manager
2.3.0 the merge happened before patching; the log showed `split=false` and 26 `lib/` entries.

## Options and logging

- `booleanOption(...)` returns an option whose `.value` is `Boolean?`. Compare with
  `== true` or `!= true`.
- `logger` is a **private** property of `ResourcePatchContext`. Define your own:
  ```kotlin
  private val log = java.util.logging.Logger.getLogger("MyPatch")
  ```
- `return@execute` exits the `execute` lambda. `return@resourcePatch` is only valid when the
  lambda is the trailing lambda passed to `resourcePatch(...)`, not inside a nested `execute`.
- `logger.success(...)` / `logger.error(...)` do not exist on `java.util.logging.Logger`; use
  `info`, `warning`, and `severe`.

## Minimal valid resource patch

```kotlin
package io.agrokenga.patches.example

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import java.util.logging.Logger

private val log = Logger.getLogger("ExampleProbe")

val exampleProbe = resourcePatch(
    name = "Example Probe",
    description = "Lists native libraries and hashes one entry.",
    default = false,
) {
    compatibleWith(
        Compatibility(
            name = "KoPP2",
            packageName = "com.paradoxplaza.kopp2",
            apkFileType = ApkFileType.APKM,
            targets = listOf(AppTarget(version = "2.21.4")),
        ),
    )

    val writeBack = booleanOption(
        key = "exampleProbeWriteBack",
        default = false,
        title = "Test write-back",
        description = "Append a byte so the patcher must rebuild the entry.",
    )

    execute {
        val entries = listApkEntries("lib/")
        entries.forEach { log.info("lib entry: $it") }

        val lib = get("lib/arm64-v8a/libil2cpp.so")
        if (!lib.exists()) {
            log.warning("libil2cpp.so is missing; was the APKM merged?")
            return@execute
        }

        val bytes = lib.readBytes()
        log.info("size=${bytes.size}")

        if (writeBack.value == true) {
            lib.appendBytes(byteArrayOf(0))
        }
    }
}
```

## Gotchas

- `get(...)` returns a `File`; it does not return `null`. Check `exists()`.
- Do not use `ByteArray.chunked(...)`; use explicit offset/`ByteBuffer` parsing.
- Do not call `readBytes`/`writeBytes` on the context; call them on the returned `File`.
- The `.so` path must exactly match the merged archive entry, e.g.
  `lib/arm64-v8a/libil2cpp.so`.
- A resource patch that changes `android:extractNativeLibs` may need extra uncompressed paths;
  the existing `.so` entries are already tracked.
- Native modifications are fragile across app versions; offsets are not stable.
