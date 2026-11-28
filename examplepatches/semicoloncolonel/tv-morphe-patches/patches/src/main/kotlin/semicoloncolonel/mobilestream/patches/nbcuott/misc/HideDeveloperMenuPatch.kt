package semicoloncolonel.mobilestream.patches.nbcuott.misc

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import semicoloncolonel.mobilestream.patches.nbcuott.shared.Constants

// MS NOW 7.10.2 for Android TV is a "beta" build of the shell. Its MainActivity
// never sets isRelease, so the field reads false. With that, setupDebug() shows
// "Long press BACK button" over the app for 20 seconds after launch, and
// onKeyLongPress opens the developer menu, which changes the web app's address,
// on a single long press of Back. Every read of isRelease in MainActivity now
// reads true, as it does in CNBC's release build, so the hint is not shown and
// a long press of Back does nothing.

private const val MAIN_ACTIVITY = "Lcom/versant/androidottweb/main/MainActivity;"

@Suppress("unused")
val hideDeveloperMenuPatch = bytecodePatch(
    name = "Hide developer menu",
    description = "Removes the developer menu and the hint about it that appears when the app starts.",
) {
    category("Interface")
    compatibleWith(Constants.MS_NOW)

    execute {
        var reads = 0
        mutableClassDefBy(MAIN_ACTIVITY).methods.forEach { method ->
            // Snapshot: replaceInstruction mutates the live list.
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            instructions.forEachIndexed { index, instruction ->
                if (instruction.opcode != Opcode.IGET_BOOLEAN) return@forEachIndexed
                val field = (instruction as ReferenceInstruction).reference as FieldReference
                if (field.definingClass != MAIN_ACTIVITY || field.name != "isRelease") return@forEachIndexed
                val register = (instruction as TwoRegisterInstruction).registerA
                method.replaceInstruction(index, "const/16 v$register, 0x1")
                reads++
            }
        }
        // setupDebug() and onKeyLongPress(int, KeyEvent) in 7.10.2.
        if (reads == 0) throw PatchException("Hide developer menu: no isRelease reads found")
    }
}
