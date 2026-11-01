package dev.jason.gboardpatches.patches.gboard.features.extendeddictionary

import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.GboardFieldTarget
import dev.jason.gboardpatches.patches.gboard.shared.GboardMethodTarget
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.mutableFieldOrThrow
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private const val DATABASE = "Lqqc;"
private const val DATABASE_BASE = "Lqpz;"
private const val LANGUAGE_TAG = "Lsfc;"

internal val EXTENDED_DICTIONARY_RUNTIME_TARGETS = listOf(
    GboardMethodTarget(DATABASE, "<init>", listOf("Landroid/content/Context;"), "V"),
    GboardMethodTarget(DATABASE_BASE, "h", emptyList(), "V"),
    GboardMethodTarget(LANGUAGE_TAG, "g", listOf("Ljava/lang/String;"), LANGUAGE_TAG),
    // Enabled input languages, read for the "no matching language" import warning only.
    GboardMethodTarget("Lpeu;", "a", emptyList(), "Lwns;"),
    GboardMethodTarget("Lpev;", "i", emptyList(), LANGUAGE_TAG),
)

internal val EXTENDED_DICTIONARY_RUNTIME_FIELDS = listOf(
    GboardFieldTarget(DATABASE_BASE, "a", "Ljava/lang/String;"),
    GboardFieldTarget(DATABASE_BASE, "b", "Lqpw;"),
    GboardFieldTarget(LANGUAGE_TAG, "g", "Ljava/lang/String;"),
    GboardFieldTarget(LANGUAGE_TAG, "j", "Ljava/lang/String;"),
)

internal val gboardExtendedDictionaryGuardPatch = bytecodePatch(
    description = "確認 Extended Dictionary runtime 依賴的 Gboard 個人字典 API 存在。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    execute {
        EXTENDED_DICTIONARY_RUNTIME_TARGETS.forEach { target -> findMutableMethodOrThrow(target) }
        EXTENDED_DICTIONARY_RUNTIME_FIELDS.forEach { target -> mutableFieldOrThrow(target) }
    }
}
