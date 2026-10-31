package app.template.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

/**
 * Bytecode utilities inspired by rushiranpise/morphe-patches and MorpheApp.
 */

fun MutableMethod.clearBody() {
    implementation?.let { impl ->
        val instructionsList = impl.instructions as? MutableList ?: return
        instructionsList.clear()
    }
}

fun MutableMethod.returnEarly(value: Boolean) {
    clearBody()
    val boolConst = if (value) "const/4 v0, 0x1" else "const/4 v0, 0x0"
    addInstructions(0, "$boolConst\nreturn v0")
}

fun MutableMethod.returnEarly(value: Int) {
    clearBody()
    addInstructions(0, "const/4 v0, $value\nreturn v0")
}

fun MutableMethod.returnEarly(value: Long) {
    clearBody()
    addInstructions(0, "const-wide v0, $value\nreturn-wide v0")
}

fun MutableMethod.returnEarly(value: Void?) {
    clearBody()
    addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
}

fun MutableMethod.returnEarly() {
    clearBody()
    addInstructions(0, "return-void")
}

