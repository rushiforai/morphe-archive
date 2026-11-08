package app.morphe.patches.tinder

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private object LegalSettingsFragmentFingerprint : Fingerprint(
    definingClass = "Lcom/tinder/feature/settings/internal/fragment/LegalSettingsFragment;",
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)

private const val TELEGRAM_ROW_HELPER =
    "Lapp/morphe/extension/tinder/patches/TinderTelegramRow;"

/** `com.tinder:id/legal_settings_terms` - the Terms of Service row. */
private const val TERMS_ROW_ID = 0x7f0b027A

/** `com.tinder:id/legal_settings_rows` - the LinearLayout holding the rows. */
private const val ROWS_CONTAINER_ID = 0x7f0b09D6

@Suppress("unused")
val tinderTelegramLinkPatch = bytecodePatch {
    compatibleWith(TinderCompatibility.TINDER)
    extendWith("extensions/extension.mpe")

    execute {
        LegalSettingsFragmentFingerprint.method.apply {
            val instructions = implementation!!.instructions

            // The fragment resolves every Legal row with `fq10.d(id, root)`, so the
            // resource id right before the call tells us which row we are looking at.
            fun resolveView(resourceId: Int): Int {
                instructions.withIndex().forEach { (index, instruction) ->
                    val reference =
                        (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    if (reference?.definingClass != "Lfq10;" || reference.name != "d") {
                        return@forEach
                    }
                    val idRegister =
                        (instruction as? FiveRegisterInstruction)?.registerC ?: return@forEach

                    for (previous in index - 1 downTo 0) {
                        val candidate = instructions[previous]
                        if ((candidate as? OneRegisterInstruction)?.registerA != idRegister) {
                            continue
                        }
                        val literal = (candidate as? NarrowLiteralInstruction)?.narrowLiteral
                        if (literal == resourceId) {
                            // The view lands in the register of the following
                            // move-result-object.
                            val result = instructions[index + 1] as? OneRegisterInstruction
                                ?: error("Legal row lookup does not store its result")
                            return result.registerA
                        }
                        break
                    }
                }
                error("Tinder Legal resource 0x${resourceId.toString(16)} was not found")
            }

            val termsRowRegister = resolveView(TERMS_ROW_ID)
            val containerRegister = resolveView(ROWS_CONTAINER_ID)

            // Insert after the rows are wired up, so Tinder's own click listeners are
            // already attached and the Telegram row is added last.
            val lastListenerIndex = instructions.indexOfLast { instruction ->
                val reference =
                    (instruction as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == "Landroid/view/View;" &&
                    reference.name == "setOnClickListener"
            }
            check(lastListenerIndex >= 0) { "Tinder Legal rows have no click listeners" }

            addInstructions(
                lastListenerIndex + 1,
                """
                    invoke-static {v$containerRegister, v$termsRowRegister}, $TELEGRAM_ROW_HELPER->addBelowTerms(Landroid/view/ViewGroup;Landroid/widget/TextView;)V
                """.trimIndent(),
            )
        }
    }
}
