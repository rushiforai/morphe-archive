package app.dewaze.patches.favorites

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.dewaze.patches.shared.Constants.COMPATIBILITY_WAZE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/dewaze/extension/FavoritesOnMapPatch;"
private const val DRIVE_TO_MANAGER_BASE = "Lcom/waze/navigate/DriveToNativeManagerBase;"

@Suppress("unused")
val favoritesOnMapPatch = bytecodePatch(
    name = "Favorites on map",
    description = "Always shows your favorites as stars with their name on the map, " +
        "on the phone and in Android Auto, also when not navigating.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WAZE)

    extendWith("extensions/extension.mpe")

    execute {
        // 1. Remember the native manager that can list favorites.
        mutableClassDefBy(DRIVE_TO_MANAGER_BASE).methods
            .filter { it.name == "<init>" }
            .forEach { it.callAfterSuperConstructor("onDriveToManagerCreated") }

        // 2. Remember the main map controller, so new favorites can trigger a redraw.
        MainMapControllerConstructorFingerprint.method.callAfterSuperConstructor("onMainMapControllerCreated")

        // 3. Add the favorite markers to every resolved main map content.
        MainMapContentResolverFingerprint.method.apply {
            instructions
                .withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index }
                .reversed()
                .forEach { index ->
                    val register = (instructions[index] as OneRegisterInstruction).registerA
                    addInstructionsAtControlFlowLabel(
                        index,
                        """
                            invoke-static { v$register }, $EXTENSION_CLASS->onMainMapContent(Ljava/lang/Object;)Ljava/lang/Object;
                            move-result-object v$register
                        """,
                    )
                }
        }
    }
}

/**
 * Calls `EXTENSION_CLASS.<hook>(this)` right after the constructor's call to its super constructor.
 * Not at the end: Waze's constructors reuse the register of `this` for other values, so by the
 * last `return-void` it no longer holds the object. The object's fields are filled in later, so
 * the hook must only keep a reference.
 */
private fun MutableMethod.callAfterSuperConstructor(hook: String) {
    val thisRegister = implementation!!.registerCount - parameterRegisterCount() - 1
    val index = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_DIRECT &&
            (instruction as FiveRegisterInstruction).registerC == thisRegister &&
            ((instruction as ReferenceInstruction).reference as MethodReference).name == "<init>"
    }
    if (index < 0) throw PatchException("Super constructor call not found in $definingClass")
    addInstructions(index + 1, "invoke-static { p0 }, $EXTENSION_CLASS->$hook(Ljava/lang/Object;)V")
}

private fun MutableMethod.parameterRegisterCount() =
    parameterTypes.sumOf { type -> if (type.toString() == "J" || type.toString() == "D") 2.toInt() else 1 }
