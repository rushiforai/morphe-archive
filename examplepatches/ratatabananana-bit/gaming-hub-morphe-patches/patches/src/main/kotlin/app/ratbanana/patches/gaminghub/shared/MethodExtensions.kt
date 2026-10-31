package app.ratbanana.patches.gaminghub.shared

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.iface.Method

/**
 * At method entry no local register holds a live value, so the locals below
 * the parameter registers are free to use.
 */
internal fun Method.requireFreeRegistersAtEntry(count: Int) {
    val implementation = implementation
        ?: throw PatchException("$definingClass->$name has no implementation")

    val parameterRegisters = parameterTypes.sumOf { type ->
        if (type == "J" || type == "D") 2 else 1
    } + 1 // "this"

    val localRegisters = implementation.registerCount - parameterRegisters
    if (localRegisters < count) {
        throw PatchException(
            "$definingClass->$name has $localRegisters local registers, $count are required",
        )
    }
}
