package dev.jason.gboardpatches.patches.gboard.features.clipboard

import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertThrows
import org.junit.Test

class GboardClipboardTargetSourceContractTest {
    @Test
    fun `production is target-only exact 1803 with pure runtime reads`() {
        validate(loadSources())
    }

    @Test
    fun `old token wrong member signature and missing target mutations fail`() {
        val stock = loadSources()
        listOf(
            stock.mutate("Lfik;", "Leun;"),
            stock.mutate("Lfjv;", "Levu;"),
            stock.mutate("Lfjk;", "Levn;"),
            stock.mutate("Lkr;", "Lkl;"),
            stock.mutate("name = \"l\"", "name = \"k\""),
            stock.mutate("0x7f1409d3", "0x7f14094c"),
            stock.mutate("\"fih\"", "\"euk\""),
            stock.mutate("\"fij\"", "\"eum\""),
            stock.mutate("receiver.getClass(), \"w\"", "receiver.getClass(), \"y\""),
            stock.mutate("expectedRecent != currentRecent", "expectedRecent > currentRecent"),
            stock.mutate("name = \"call\"", "name = \"run\""),
            stock.mutate("name = \"g\"", "name = \"call\""),
            stock.mutate("Object dataHandler = receiver;", "Object dataHandler = null;"),
            stock.mutate("CLIPBOARD_LOADER_CALLABLE_CLASS = \"Lfik;\"", ""),
        ).forEachIndexed { index, mutation ->
            assertThrows("mutation $index", IllegalStateException::class.java) {
                validate(mutation)
            }
        }
    }

    private fun validate(sources: Sources) {
        requireAll(sources.patchOptions, "Lfik;", "Lfjv;", "Lfjk;", "Lkr;")
        requireAll(sources.loaderPatch,
            "CLIPBOARD_LOADER_CALLABLE_CLASS", "name = \"call\"", "emptyList()")
        requireAll(sources.prunePatch,
            "CLIPBOARD_PRUNE_CALLABLE_CLASS", "name = \"g\"", "returnType = \"V\"",
            "emptyList()")
        requireAll(sources.adapterPatch,
            "CLIPBOARD_ADAPTER_CLASS", "\"F\"", "\"p\"",
            "listOf(RECYCLER_VIEW_HOLDER_CLASS, \"I\")",
            "ITEM_BIND_ENTRY", "ITEM_BIND_BEFORE_METHOD_DESCRIPTOR",
            "ITEM_BIND_EXPANDED_REGISTER_COUNT",
            "expandClipboardItemBindRegisters()", "validateExpandedClipboardItemBind()")
        requireAll(sources.columnPatch, "name = \"l\"", "parameterTypes = emptyList()")
        requireAll(sources.runtimeSupport,
            "CLIPBOARD_LOADER_CALLABLE_CLASS = \"fik\"",
            "CLIPBOARD_ADAPTER_CLASS = \"fjk\"",
            "CLIPBOARD_VIEW_HOLDER_CLASS = \"fji\"",
            "LAST_VISIBLE_TIMESTAMP_PREF_RES_ID = 0x7f1409d3",
            "receiver.getClass(), \"w\"",
            "resolveClass(classLoader, \"fil\")",
            "resolveClass(classLoader, \"fjv\")",
            "resolveClass(classLoader, \"fih\")",
            "resolveClass(classLoader, \"fij\")",
            "resolveClass(classLoader, \"fjo\")",
            "resolveClass(classLoader, \"qhy\")",
            "resolveClass(classLoader, \"cdl\")",
            "declaredField(dataHandlerClass, \"f\")",
            "declaredField(dataHandlerClass, \"g\")",
            "declaredField(adapterClass, \"e\")",
            "declaredField(adapterClass, \"n\")",
            "declaredField(adapterClass, \"o\")",
            "declaredField(adapterClass, \"y\")",
            "declaredField(clipModelClass, \"c\")",
            "clipIsSensitiveMethod = declaredMethod(clipClass, \"m\")",
            "readClipboardShowSensitiveContent(preferences)",
            "declaredMethod(dataHandlerClass, \"t\"",
            "declaredMethod(preferencesClass, \"I\"",
            "declaredMethod(preferenceBaseClass, \"s\"",
            "timestampToEpochMillis(handles.clipTimestampField.get(clip))")
        requireAll(sources.pruneAdapter,
            "Object dataHandler = receiver;",
            "Context context = support.pruneContext(handles, receiver);")
        requireAll(sources.uiAdapter,
            "cardPreviewFeature.beforeItemBind(receiver, position)",
            "cardPreviewFeature.afterItemBind()",
            "sensitiveContentFeature.apply(",
            "expectedRecent != currentRecent",
            "expectedPinned != currentPinned",
            "expectedSize != currentSize",
            "clearCountdownBinding(textView, Long.valueOf(clipId))")

        val forbidden = listOf(
            "Leun;", "Levu;", "Levn;", "Lkl;", "0x7f14094c",
            "\"eln\"", "\"emr\"", "\"emk\"", "\"elo\"", "\"emy\"",
            "\"elk\"", "\"elm\"", "\"emo\"", "\"oql\"", "\"bze\"",
            "name = \"k\"", "receiver.getClass(), \"y\"",
            "pruneCallableOwnerField",
            "expectedRecent > currentRecent", "expectedPinned > currentPinned",
            "expectedSize > currentSize",
        )
        val targetSources = listOf(sources.patchOptions, sources.loaderPatch,
            sources.prunePatch, sources.adapterPatch, sources.columnPatch,
            sources.runtimeSupport, sources.pruneAdapter, sources.uiAdapter)
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
        read("extensions/extension/src/main/java/dev/jason/gboardpatches/extension/clipboard/runtime/hooks/GboardClipboardPruneHookAdapter.java"),
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
        val pruneAdapter: String,
        val uiAdapter: String,
        val settings: String,
    ) {
        fun mutate(old: String, replacement: String): Sources {
            val values = listOf(patchOptions, loaderPatch, prunePatch, adapterPatch,
                columnPatch, runtimeSupport, pruneAdapter, uiAdapter, settings)
            val index = values.indexOfFirst { old in it }
            check(index >= 0) { old }
            val changed = values.toMutableList()
            changed[index] = changed[index].replaceFirst(old, replacement)
            return Sources(changed[0], changed[1], changed[2], changed[3], changed[4],
                changed[5], changed[6], changed[7], changed[8])
        }
    }
}
