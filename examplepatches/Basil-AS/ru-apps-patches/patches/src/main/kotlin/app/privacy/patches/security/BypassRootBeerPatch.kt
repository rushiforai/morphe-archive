// Targets the scottyab/rootbeer native root-detection library
// (`com.scottyab.rootbeer.RootBeerNative`), found bundled (JNI shim only, or the
// full library) in Avito, T-Bank, Ozon and Ozon Bank during the outside-the-
// 31-SDK-checklist package census. `checkForRoot([Ljava/lang/Object;)I` is a native
// method, so it has no bytecode body to patch directly; every call site is nop'd
// instead and its `move-result` forced to 0 (clean), matching the technique already
// used by BypassAntiTamperPatch for T-Bank's native RASP executor calls.
//
// Gated to exactly these 4 packages (any version — the native method's signature is
// JNI-stable and the call-site scan is structural, not version-sensitive) rather than
// left universal: morphe-patcher force-disables `default = true` on any patch with no
// package-scoped Compatibility (`resolveDefaultValue()` in the framework's own
// Patch.kt), logging "Warning: Universal patches must be declared with default
// false" and silently dropping back to false. Declaring real packageName targets
// here (confirmed empirically to be the only way around that check) is what lets
// this patch actually ship in the default build instead of staying opt-in-only.
package app.privacy.patches.security

import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.shared.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val ROOT_BEER_NATIVE = "Lcom/scottyab/rootbeer/RootBeerNative;"

private fun MethodReference.isRootBeerCheckForRoot() = definingClass == ROOT_BEER_NATIVE &&
    name == "checkForRoot" &&
    parameterTypes.size == 1 &&
    parameterTypes[0].toString() == "[Ljava/lang/Object;" &&
    returnType == "I"

@Suppress("unused")
val bypassRootBeerPatch = bytecodePatch(
    name = "Bypass RootBeer root detection",
    description = "Stubs calls into the scottyab/rootbeer native root-checking library so it always reports a clean (non-rooted) result.",
    default = true,
) {
    compatibleWith(
        Compatibility(packageName = "com.avito.android", name = "Avito"),
        Compatibility(packageName = "com.idamob.tinkoff.android", name = "T-Bank"),
        Compatibility(packageName = "ru.ozon.app.android", name = "Ozon"),
        Compatibility(packageName = "ru.ozon.fintech.finance", name = "Ozon Bank"),
    )

    execute {
        var patchedCalls = 0

        classDefForEach { classDef ->
            val hasTarget = classDef.methods.any { method ->
                method.instructionsOrNull?.any { instruction ->
                    instruction.methodReferenceOrNull()?.isRootBeerCheckForRoot() == true
                } == true
            }
            if (!hasTarget) return@classDefForEach

            mutableClassDefBy(classDef).methods.forEach { method ->
                val instructions = method.instructionsOrNull?.toList() ?: return@forEach

                instructions.forEachIndexed { index, instruction ->
                    val reference = instruction.methodReferenceOrNull()
                    if (reference?.isRootBeerCheckForRoot() != true) return@forEachIndexed

                    method.replaceInstruction(index, "nop")

                    val nextInstruction = instructions.getOrNull(index + 1)
                    if (nextInstruction?.opcode == Opcode.MOVE_RESULT) {
                        val moveResult = nextInstruction as OneRegisterInstruction
                        method.replaceInstruction(
                            index + 1,
                            "const/4 v${moveResult.registerA}, 0",
                        )
                    }
                    patchedCalls++
                }
            }
        }

        println("Bypass RootBeer root detection: stubbed $patchedCalls checkForRoot() call(s).")
    }
}
