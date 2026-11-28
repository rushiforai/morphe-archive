package dev.abotmaker.ramblerenhancements.patches

import app.morphe.patcher.patch.Patch
import com.google.gson.GsonBuilder

object PatchCatalog {
    val morpheRegistrations: List<Patch<*>> = listOf(
        ramblerBanglaLiteScriptPatch,
        ramblerBanglaPhoneticEnginePatch,
        gboardAmoledDarkKeyboardPatch,
        gboardClipboardReorderPatch,
        ramblerToolbarExtrasPatch,
        gboardHiddenFlagsOverridePatch,
        ramblerAtMentionSuggestionsPatch,
        ramblerWaveformAnimationPatch,
        ramblerCustomInstructionsPatch,
        ramblerPersonalDictionaryPatch,
        ramblerContactNamesPatch,
        ramblerCursorEditingPatch,
        ramblerAppContextPatch,
        ramblerProductivityToolsPatch,
    )

    fun publishedInventory(version: String): String {
        val patchesJson = morpheRegistrations
            .sortedBy { it.name.orEmpty() }
            .map { patch ->
                val compatMap = linkedMapOf<String, List<String>?>()
                patch.compatibility?.forEach { compat ->
                    val pkg = compat.packageName ?: return@forEach
                    val hasWildcard = compat.targets.isEmpty() || compat.targets.any { it.version == null }
                    compatMap[pkg] = if (hasWildcard) {
                        null
                    } else {
                        compat.targets.mapNotNull { it.version }
                    }
                }
                val deps = patch.dependencies
                    .mapNotNull { dep -> dep.name }
                    .distinct()
                    .sorted()
                linkedMapOf(
                    "name" to patch.name,
                    "description" to patch.description,
                    "use" to patch.default,
                    "dependencies" to deps,
                    "compatiblePackages" to compatMap,
                    "options" to emptyList<Any>(),
                )
            }
        val payload = linkedMapOf(
            "version" to version,
            "patches" to patchesJson,
        )
        return GsonBuilder().serializeNulls().setPrettyPrinting().create().toJson(payload) + "\n"
    }
}
