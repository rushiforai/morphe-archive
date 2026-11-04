package semicoloncolonel.mobilestream.patches.yttv.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.yttv.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Hide prompts and promos (OPT-IN, default OFF).
//
// The server sends popups with page responses as a oneof, and each page
// handler compares its case number with the popup types it knows. Two of
// them are promos: 157487819 is the rate-the-app dialog and 96907215 is the
// "mealbar" promo banner, which also arrives as a command. Every comparison
// against those case numbers now uses -1, which no oneof case can hold, so
// those branches never run. Other popups, such as sign-in and location
// prompts, are untouched.
//
// The app tour, the highlights autoplay prompt, and the "Watch on YouTube"
// dialog are shown once and remembered in local preferences. Their defaults
// become "already shown", which takes effect on a fresh install or after the
// app's data is cleared.
// ─────────────────────────────────────────────────────────────────────────────

private const val APP_RATING_PROMO = 157487819
private const val MEALBAR_PROMO = 96907215
private const val NO_CASE = -1

private val SHOWN_ONCE_PREFERENCES = setOf(
    "HAS_SHOWN_APP_TOUR_KEY",
    "HAS_SEEN_HIGHLIGHTS_AUTOPLAY_PROMPT",
    "WATCH_ON_YOUTUBE_DIALOG_SHOWN",
)

private val COMPARISONS = setOf(Opcode.IF_EQ, Opcode.IF_NE)

// The enum of locally stored settings and one-time flags.
internal object LocalPreferencesFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf("HAS_SHOWN_APP_TOUR_KEY", "has_shown_app_tour_key"),
)

@Suppress("unused")
val hidePromptsPatch = bytecodePatch(
    name = "Hide prompts and promos",
    description = "Hides the rate-the-app dialog, promo banners, the app tour, and the " +
        "\"Watch on YouTube\" dialog.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        // Popup case comparisons. Collect first, mutate after: mutableClassDefBy
        // swaps the class map entry.
        val promoCases = setOf(APP_RATING_PROMO, MEALBAR_PROMO)
        val targets = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.methods.any { method ->
                    val instructions = method.implementation?.instructions?.toList() ?: return@any false
                    instructions.indices.any { index -> instructions.isPromoComparison(index, promoCases) }
                }
            ) {
                targets += classDef.type
            }
        }

        var replaced = 0
        targets.forEach { type ->
            mutableClassDefBy(type).methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                instructions.indices.forEach { index ->
                    if (!instructions.isPromoComparison(index, promoCases)) return@forEach
                    val register = (instructions[index] as OneRegisterInstruction).registerA
                    method.replaceInstruction(index, "const v$register, $NO_CASE")
                    replaced++
                }
            }
        }
        if (replaced == 0) throw PatchException("No promo popup comparisons found")

        // One-time prompts start as already shown.
        LocalPreferencesFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            var changed = 0
            // From the end, so earlier indices stay valid.
            instructions.indices.reversed().forEach { index ->
                val instruction = instructions[index]
                if (instruction.opcode != Opcode.CONST_STRING) return@forEach
                val name = ((instruction as ReferenceInstruction).reference as StringReference).string
                if (name !in SHOWN_ONCE_PREFERENCES) return@forEach

                val constructorIndex = (index until instructions.size).first {
                    instructions[it].opcode == Opcode.INVOKE_DIRECT_RANGE
                }
                val constructor = instructions[constructorIndex] as RegisterRangeInstruction
                // (name, ordinal, key, preference, default) after the receiver.
                val defaultRegister = constructor.startRegister + 5
                val original = (0 until constructorIndex).reversed().map { instructions[it] }.first {
                    it.opcode == Opcode.SGET_OBJECT && (it as OneRegisterInstruction).registerA == defaultRegister
                }.let { (it as ReferenceInstruction).reference as FieldReference }

                addInstruction(
                    constructorIndex + 1,
                    "sget-object v$defaultRegister, ${original.definingClass}->${original.name}:${original.type}",
                )
                addInstruction(
                    constructorIndex,
                    "sget-object v$defaultRegister, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;",
                )
                changed++
            }
            if (changed != SHOWN_ONCE_PREFERENCES.size) {
                throw PatchException("Found $changed of ${SHOWN_ONCE_PREFERENCES.size} one-time prompt preferences")
            }
        }
    }
}

// A const of a promo case number whose next instruction compares with it.
private fun List<Instruction>.isPromoComparison(index: Int, cases: Set<Int>): Boolean {
    val instruction = this[index]
    if (instruction.opcode != Opcode.CONST) return false
    if ((instruction as NarrowLiteralInstruction).narrowLiteral !in cases) return false
    val next = getOrNull(index + 1) ?: return false
    if (next.opcode !in COMPARISONS) return false
    val register = (instruction as OneRegisterInstruction).registerA
    val compare = next as TwoRegisterInstruction
    return compare.registerA == register || compare.registerB == register
}
