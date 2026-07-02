package app.ynotzort.patches.targo

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.ynotzort.patches.shared.Constants.COMPATIBILITY_TARGO
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Framework classes whose boolean getters we must never touch (Map.isEmpty(), etc.).
private fun String.isAppClass() =
    !startsWith("Ljava/") && !startsWith("Landroid/") && !startsWith("Landroidx/") &&
        !startsWith("Lkotlin/") && !startsWith("Lkotlinx/") && !startsWith("Lcom/google/")

@Suppress("unused")
val disableRootCheckPatch = bytecodePatch(
    name = "Disable TargoBank root check",
    description = "Neutralises the splash 'rooted device' block by forcing the security " +
        "verdict getters (o.aNj.con/Aux/AuX) to return false, so the app proceeds to the " +
        "login screen. Validated on V12.68.1 (versionCode 2019102761). " +
        "Note: re-signing breaks Play Integrity app-recognition; keep the app in the Magisk denylist.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TARGO)

    execute {
        val builder = RootDialogBuilderFingerprint.method

        // The dialog builder calls the verdict object's no-argument boolean getters
        // (con()/Aux()/AuX()). Discover them from the bytecode instead of hardcoding
        // obfuscated names, so the patch survives reobfuscation between releases.
        val getterCalls = builder.instructions
            .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .filter { it.returnType == "Z" && it.parameterTypes.isEmpty() && it.definingClass.isAppClass() }
            .distinctBy { it.definingClass to it.name }

        // The verdict holder (o.aNj) is the app class with the most such getters here.
        val verdictClass = getterCalls.groupBy { it.definingClass }
            .maxByOrNull { it.value.size }?.key
            ?: throw PatchException(
                "No app boolean getters found in the root dialog builder — fingerprint likely stale.",
            )

        val mutableClass = mutableClassDefBy(verdictClass)

        getterCalls
            .filter { it.definingClass == verdictClass }
            .forEach { ref ->
                mutableClass.methods.first {
                    it.name == ref.name && it.returnType == "Z" && it.parameterTypes.isEmpty()
                }.addInstructions(
                    0,
                    """
                        const/4 v0, 0x0
                        return v0
                    """,
                )
            }
    }
}
