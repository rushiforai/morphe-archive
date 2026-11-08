package semicoloncolonel.mobilestream.patches.appletv.tv

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.appletv.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// Apple TV Android TV 17.0.2. The app is Apple's native engine (libluna).
// Promos for other titles are part of the video, with a "Skip" button, and
// recaps and intros have "Skip Recap" and "Skip Intro" buttons.
// The engine describes its screen to Android as JSON for screen readers
// (LunaAccessibilityNodeProvider.updateAXTree), but only while it believes a
// screen reader is on. Every Native.onScreenReaderStatusChanged call is routed
// through AutoSkipper, which always reports one, and each screen update is
// passed to AutoSkipper, which presses the buttons the options chose.
//
// The phone app shares the package name but not this code. Morphe Manager can
// still select this patch for it, so it does nothing there.

private const val PROVIDER = "Lcom/apple/atve/generic/LunaAccessibilityNodeProvider;"
private const val NATIVE = "Lcom/apple/atve/luna/Native;"
private const val SKIPPER = "Lsemicoloncolonel/mobilestream/extension/appletv/AutoSkipper;"

private fun ReferenceInstruction.isScreenReaderReport() =
    (reference as? MethodReference)?.let {
        it.definingClass == NATIVE && it.name == "onScreenReaderStatusChanged"
    } == true

private fun switchFingerprint(name: String) = Fingerprint(
    definingClass = SKIPPER,
    name = name,
    returnType = "Z",
)

@Suppress("unused")
val autoSkipPatch = bytecodePatch(
    name = "Auto-skip (Android TV)",
    description = "Presses Skip for you on the parts you choose: Apple's promos for other titles, recaps, and intros.",
) {
    compatibleWith(Constants.TV_COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    val promos by booleanOption(
        key = "skipPromos",
        default = true,
        title = "Skip promos",
        description = "Skips Apple's promos for other titles that play before a show or movie.",
        required = true,
    )
    val recaps by booleanOption(
        key = "skipRecaps",
        default = false,
        title = "Skip recaps",
        description = "Skips the recap of earlier episodes.",
        required = true,
    )
    val intros by booleanOption(
        key = "skipIntros",
        default = false,
        title = "Skip intros",
        description = "Skips a show's opening titles.",
        required = true,
    )

    execute {
        if (classDefByOrNull(PROVIDER) == null) return@execute
        val updateTree = mutableClassDefBy(PROVIDER).methods.firstOrNull {
            it.name == "updateAXTree" && it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;")
        } ?: return@execute

        val targets = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lcom/apple/atve/") && classDef.methods.any { method ->
                    method.implementation?.instructions?.any {
                        it.opcode == Opcode.INVOKE_STATIC && (it as ReferenceInstruction).isScreenReaderReport()
                    } == true
                }
            ) {
                targets += classDef.type
            }
        }
        if (targets.isEmpty()) return@execute

        targets.forEach { type ->
            mutableClassDefBy(type).methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode != Opcode.INVOKE_STATIC ||
                        !(instruction as ReferenceInstruction).isScreenReaderReport()
                    ) return@forEachIndexed
                    val register = (instruction as FiveRegisterInstruction).registerC
                    method.replaceInstruction(index, "invoke-static { v$register }, $SKIPPER->screenReader(Z)V")
                }
            }
        }

        mapOf("skipPromos" to promos, "skipRecaps" to recaps, "skipIntros" to intros).forEach { (name, on) ->
            switchFingerprint(name).method.returnEarly("const/4 v0, ${if (on == true) "0x1" else "0x0"}\nreturn v0")
        }

        updateTree.addInstructions(
            0,
            "invoke-static/range { p0 .. p1 }, $SKIPPER->onTree(Ljava/lang/Object;Ljava/lang/String;)V",
        )
    }
}
