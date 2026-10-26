package id.ikuradachi.patches.bstation.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import id.ikuradachi.patches.bstation.shared.Constants.COMPATIBILITY_BSTATION

@Suppress("unused")
val hideHomeSearchBarPatch = bytecodePatch(
    name = "Hide home search bar",
    description = "Hides the search bar on the Home screen.",
) {
    category("Layout")
    compatibleWith(COMPATIBILITY_BSTATION)

    val hideHomeSearchBar = booleanOption(
        key = "hideHomeSearchBar",
        default = true,
        title = "Hide home search bar",
        description = "Hides the search bar and collapses the top container on the Home screen.",
    )

    execute {
        if (hideHomeSearchBar.value != true) return@execute

        val method = HomeViewCreatedFingerprint.method
        val classDef = HomeViewCreatedFingerprint.classDef

        val instructions = method.implementation!!.instructions
        val setVisibilityIndex = instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                instruction is Instruction35c &&
                (instruction.reference as? MethodReference)?.let { ref ->
                    ref.name == "setVisibility" &&
                        ref.parameterTypes.firstOrNull()?.toString() == "I" &&
                        ref.returnType == "V"
                } == true
        }
        check(setVisibilityIndex >= 0) { "Could not find setVisibility instruction in ${method.name}" }

        val setVisibilityInstruction = instructions.elementAt(setVisibilityIndex) as Instruction35c
        val viewRegister = setVisibilityInstruction.registerC

        val hideSearchBarBody = """
            if-eqz p0, :cond_done

            const/16 v0, 0x8
            invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

            invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;
            move-result-object v0

            instance-of v1, v0, Landroid/view/View;
            if-eqz v1, :cond_done

            check-cast v0, Landroid/view/View;
            const/16 v1, 0x8
            invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

            :cond_done
            return-void
        """.trimIndent()

        val hideMethod = MutableMethod(
            ImmutableMethod(
                classDef.type,
                "hideHomeSearchBar",
                listOf(ImmutableMethodParameter("Landroid/view/View;", emptySet(), null)),
                "V",
                AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                emptySet(),
                emptySet(),
                MutableMethodImplementation(3),
            ),
        )
        hideMethod.addInstructions(0, hideSearchBarBody)
        classDef.methods.add(hideMethod)

        method.replaceInstruction(
            setVisibilityIndex,
            "invoke-static {v$viewRegister}, ${classDef.type}->hideHomeSearchBar(Landroid/view/View;)V",
        )
    }
}
