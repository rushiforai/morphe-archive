package dev.jason.gboardpatches.patches.gboard.features.clipboard

import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertThrows
import org.junit.Test

class GboardClipboardTargetSourceContractTest {
    @Test
    fun `production is target-only exact 1777 with pure runtime reads`() {
        validate(loadSources())
    }

    @Test
    fun `old token wrong member signature and missing target mutations fail`() {
        val stock = loadSources()
        listOf(
            stock.mutate("Leun;", "Leln;"),
            stock.mutate("Levu;", "Lemr;"),
            stock.mutate("Levn;", "Lemk;"),
            stock.mutate("Lkl;", "Lkm;"),
            stock.mutate("name = \"l\"", "name = \"k\""),
            stock.mutate("0x7f14094c", "0x7f140928"),
            stock.mutate("\"euk\"", "\"elk\""),
            stock.mutate("\"eum\"", "\"elm\""),
            stock.mutate("receiver.getClass(), \"w\"", "receiver.getClass(), \"y\""),
            stock.mutate("expectedRecent != currentRecent", "expectedRecent > currentRecent"),
            stock.mutate("name = \"call\"", "name = \"run\""),
            stock.mutate("CLIPBOARD_LOADER_CALLABLE_CLASS = \"Leun;\"", ""),
        ).forEachIndexed { index, mutation ->
            assertThrows("mutation $index", IllegalStateException::class.java) {
                validate(mutation)
            }
        }
    }

    private fun validate(sources: Sources) {
        requireAll(sources.patchOptions, "Leun;", "Levu;", "Levn;", "Lkl;")
        requireAll(sources.loaderPatch,
            "CLIPBOARD_LOADER_CALLABLE_CLASS", "name = \"call\"", "emptyList()")
        requireAll(sources.prunePatch,
            "CLIPBOARD_PRUNE_CALLABLE_CLASS", "name = \"call\"", "emptyList()")
        requireAll(sources.adapterPatch,
            "CLIPBOARD_ADAPTER_CLASS", "\"F\"", "\"p\"",
            "listOf(RECYCLER_VIEW_HOLDER_CLASS, \"I\")",
            "ITEM_BIND_ENTRY_COPIES", "ITEM_BIND_EXPANDED_REGISTER_COUNT",
            "ITEM_BIND_STOCK_FINGERPRINT", "ITEM_BIND_PATCHED_FINGERPRINT",
            "expandClipboardItemBindRegisters()", "validateExpandedClipboardItemBind()")
        requireAll(sources.columnPatch, "name = \"l\"", "parameterTypes = emptyList()")
        requireAll(sources.runtimeSupport,
            "CLIPBOARD_LOADER_CALLABLE_CLASS = \"eun\"",
            "CLIPBOARD_PRUNE_CALLABLE_CLASS = \"evu\"",
            "CLIPBOARD_ADAPTER_CLASS = \"evn\"",
            "CLIPBOARD_VIEW_HOLDER_CLASS = \"evl\"",
            "LAST_VISIBLE_TIMESTAMP_PREF_RES_ID = 0x7f14094c",
            "receiver.getClass(), \"w\"",
            "resolveClass(classLoader, \"euo\")",
            "resolveClass(classLoader, \"ewb\")",
            "resolveClass(classLoader, \"euk\")",
            "resolveClass(classLoader, \"eum\")",
            "resolveClass(classLoader, \"evr\")",
            "resolveClass(classLoader, \"pnp\")",
            "resolveClass(classLoader, \"cbv\")",
            "declaredField(dataHandlerClass, \"f\")",
            "declaredField(dataHandlerClass, \"g\")",
            "declaredField(adapterClass, \"e\")",
            "declaredField(adapterClass, \"n\")",
            "declaredField(adapterClass, \"o\")",
            "declaredField(adapterClass, \"y\")",
            "declaredMethod(dataHandlerClass, \"l\"",
            "declaredMethod(preferencesClass, \"N\"",
            "declaredMethod(preferenceBaseClass, \"s\"",
            "timestampToEpochMillis(handles.clipTimestampField.get(clip))")
        requireAll(sources.uiAdapter,
            "expectedRecent != currentRecent",
            "expectedPinned != currentPinned",
            "expectedSize != currentSize",
            "clearCountdownBinding(textView, Long.valueOf(clipId))")

        val forbidden = listOf(
            "Leln;", "Lemr;", "Lemk;", "Lkm;", "0x7f140928",
            "\"eln\"", "\"emr\"", "\"emk\"", "\"elo\"", "\"emy\"",
            "\"elk\"", "\"elm\"", "\"emo\"", "\"oql\"", "\"bze\"",
            "name = \"k\"", "receiver.getClass(), \"y\"",
            "expectedRecent > currentRecent", "expectedPinned > currentPinned",
            "expectedSize > currentSize",
        )
        val targetSources = listOf(sources.patchOptions, sources.loaderPatch,
            sources.prunePatch, sources.adapterPatch, sources.columnPatch,
            sources.runtimeSupport, sources.uiAdapter)
        forbidden.forEach { token -> check(targetSources.none { token in it }) { token } }

        listOf(
            "readClipboardTtlCustomMinutes",
            "readClipboardMaxCountCustomValue",
            "readClipboardContentMaxLinesCustomValue",
        ).forEach { methodName ->
            val body = methodBody(sources.settings, methodName)
            listOf("ensureDefaults", ".edit(", ".apply(", ".commit(").forEach { token ->
                check(token !in body) { "$methodName writes through $token" }
            }
        }
        check("GboardClipboardSettings.ensureDefaults" !in sources.runtimeSupport)
    }

    private fun requireAll(source: String, vararg tokens: String) {
        tokens.forEach { token -> check(token in source) { "Missing $token" } }
    }

    private fun methodBody(source: String, methodName: String): String {
        val start = source.indexOf(" $methodName(")
        check(start >= 0) { methodName }
        val next = Regex("\\n    (?:public|private|protected) static ")
            .find(source, start + methodName.length)?.range?.first ?: -1
        return source.substring(start, if (next >= 0) next else source.length)
    }

    private fun loadSources(): Sources = Sources(
        read("patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/clipboard/GboardClipboardPatchOptions.kt"),
        read("patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/clipboard/GboardClipboardLoaderPatch.kt"),
        read("patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/clipboard/GboardClipboardPrunePatch.kt"),
        read("patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/clipboard/GboardClipboardAdapterPatch.kt"),
        read("patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/clipboard/GboardClipboardColumnCountPatch.kt"),
        read("extensions/extension/src/main/java/dev/jason/gboardpatches/extension/clipboard/runtime/GboardClipboardRuntimeSupport.java"),
        read("extensions/extension/src/main/java/dev/jason/gboardpatches/extension/clipboard/runtime/hooks/GboardClipboardUiHookAdapter.java"),
        read("extensions/extension/src/main/java/dev/jason/gboardpatches/extension/clipboard/settings/GboardClipboardSettings.java"),
    )

    private fun read(relative: String): String = Files.readString(repoRoot().resolve(relative))

    private fun repoRoot(): Path = generateSequence(Path.of("").toAbsolutePath()) { it.parent }
        .first { Files.exists(it.resolve("patches/src/main/kotlin")) }

    private data class Sources(
        val patchOptions: String,
        val loaderPatch: String,
        val prunePatch: String,
        val adapterPatch: String,
        val columnPatch: String,
        val runtimeSupport: String,
        val uiAdapter: String,
        val settings: String,
    ) {
        fun mutate(old: String, replacement: String): Sources {
            val values = listOf(patchOptions, loaderPatch, prunePatch, adapterPatch,
                columnPatch, runtimeSupport, uiAdapter, settings)
            val index = values.indexOfFirst { old in it }
            check(index >= 0) { old }
            val changed = values.toMutableList()
            changed[index] = changed[index].replaceFirst(old, replacement)
            return Sources(changed[0], changed[1], changed[2], changed[3], changed[4],
                changed[5], changed[6], changed[7])
        }
    }
}
