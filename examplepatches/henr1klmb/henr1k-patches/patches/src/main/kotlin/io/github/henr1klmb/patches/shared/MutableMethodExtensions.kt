package io.github.henr1klmb.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

fun MutableMethod.clearBody() {
    val impl = implementation ?: return

    // impl.tryBlocks ist ein Collections.unmodifiableList()-Wrapper um die echte MutableList
    val unmodifiableTryBlocks = impl.tryBlocks
    if (unmodifiableTryBlocks.isNotEmpty()) {
        val innerListField = unmodifiableTryBlocks.javaClass.superclass
            ?.getDeclaredField("c")
            ?.apply { isAccessible = true }
            ?: unmodifiableTryBlocks.javaClass.getDeclaredField("list").apply { isAccessible = true }

        (innerListField.get(unmodifiableTryBlocks) as? MutableList<*>)?.clear()
    }

    val count = impl.instructions.size
    if (count > 0) {
        removeInstructions(0, count)
    }
}

fun MutableMethod.ensureRegisters(needed: Int) {
    val impl = implementation ?: return
    if (impl.registerCount < needed) {
        val field = impl.javaClass.getDeclaredField("registerCount").apply {
            isAccessible = true
        }
        field.setInt(impl, needed)
    }
}