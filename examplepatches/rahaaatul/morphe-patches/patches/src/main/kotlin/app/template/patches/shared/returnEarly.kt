package app.template.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

fun MutableMethod.returnEarly(value: Boolean) {
    addInstructions(
        0,
        "const/4 v0, 0x${if (value) 1 else 0}\nreturn v0"
    )
}
