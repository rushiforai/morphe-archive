package app.morphe.patches.chmate

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Update both native Back callbacks: search input and response popups/navigation. */
internal fun BytecodePatchContext.patchThreadSearchBack(version: String) {
    val (owner, base, name) = when (version) {
        "0.8.10.191 dev" -> Triple("Lo/pa;", "Lo/r8lambdahIGIGCNpKpFqE0lgDli724UCuDM;", "A")
        "0.8.10.242 dev" -> Triple("Ljp/syoboi/a2chMate/ui/reslist/ResListFragment;",
            "Ljp/syoboi/a2chMate/fragment/RoidonListFragment;", "q")
        // 226's input callback updater is private and is already called directly
        // by its input-state observer; it cannot be shadowed by the response screen.
        else -> return
    }
    val fragment = mutableClassDefBy(owner)
    val parent = mutableClassDefBy(base)
    check(parent.methods.single { it.name == name && it.parameterTypes.isEmpty() && it.returnType == "V" }.accessFlags and 2 == 0)
    val update = fragment.methods.single { it.name == name && it.parameterTypes.isEmpty() && it.returnType == "V" }
    check(update.implementation!!.instructions.none {
        val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == base && ref.name == name && ref.parameterTypes.isEmpty()
    }) { "Native search Back callback is already delegated: $version" }
    // No extra listeners or key interception: Android keeps hiding the IME first.
    // Preserve the response callback's precedence for popups and hit navigation.
    update.addInstructions(0, "invoke-super/range {p0 .. p0}, $base->$name()V")
}
