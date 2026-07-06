package dev.jason.gboardpatches.patches.gboard.features.undoredoaccesspoint

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private const val FLAG_FACTORY_CLASS = "Lmku;"

internal val gboardUndoRedoAccessPointBytecodePatch = bytecodePatch(
    description = "讓 Gboard 的 undo/redo 可用。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute {
        injectUndoRedoAccessPointOverride()
    }
}

context(context: BytecodePatchContext)
private fun injectUndoRedoAccessPointOverride() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = FLAG_FACTORY_CLASS,
        name = "a",
        returnType = "Lmkr;",
        parameterTypes = listOf("Ljava/lang/String;", "Z")
    )

    mutableMethod.addInstructions(0, UNDO_REDO_ACCESS_POINT_DELEGATE)
}

private val UNDO_REDO_ACCESS_POINT_DELEGATE = """
    const-string v0, "undo_access_point"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_jasondev_continue

    const/4 p1, 0x1

    :cond_jasondev_continue
""".trimIndent()
