package semicoloncolonel.mobilestream.patches.slickdeals.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.slickdeals.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Hide sign-up prompts.
//
// Slickdeals 6.36.0 records in its DataStore preferences whether it has shown
// the first-run sign-up flow (has_seen_initial_onboarding), the notification
// prompt screen (has_seen_notification_prompt), and the image tooltip
// (has_seen_image_tooltip), and whether the rating prompt was turned down
// (never_prompt_again_key). Every preference is read through DataStore's
// MutablePreferences.get. Right after the stored value is read, it goes
// through ShoppingAdsFilter, which answers true for those keys, so the app
// treats each prompt as done.
//
// It also shows "Log in / Sign up" nudges after a number of sessions, deal
// views, and searches. The method that decides and shows them now returns at
// once. Prompts that answer something you tapped, such as voting or saving a
// deal, are separate and still appear.
// ─────────────────────────────────────────────────────────────────────────────

private const val ADS_FILTER = "Lsemicoloncolonel/mobilestream/extension/shared/misc/ShoppingAdsFilter;"

@Suppress("unused")
val hideSignUpPromptsPatch = bytecodePatch(
    name = "Hide sign-up prompts",
    description = "Skips the first-run sign-up flow, the notification prompt, the log-in nudges, and the rating prompt.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        fun stringsOf(method: com.android.tools.smali.dexlib2.iface.Method) =
            method.implementation?.instructions?.mapNotNull {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
            } ?: emptyList()

        var preferencesClass: String? = null
        var nudgeKeyClass: String? = null
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val strings = stringsOf(method)
                if ("Do mutate preferences once returned to DataStore." in strings) preferencesClass = classDef.type
                if ("contextual_nudge_sessions_since_nudge" in strings) nudgeKeyClass = classDef.type
            }
        }

        // MutablePreferences.get(key): (key) -> Object, which reads its LinkedHashMap.
        val preferences = preferencesClass ?: throw PatchException("Slickdeals DataStore preferences not found")
        val reader = mutableClassDefBy(preferences).methods.single { method ->
            method.parameterTypes.size == 1 && method.returnType == "Ljava/lang/Object;" &&
                !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
                        ref.definingClass == "Ljava/util/LinkedHashMap;" && ref.name == "get"
                    } == true
                } == true
        }
        val instructions = reader.implementation!!.instructions.toList()
        val get = instructions.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "get"
        }
        val result = instructions[get + 1]
        if (result.opcode != Opcode.MOVE_RESULT_OBJECT) throw PatchException("Slickdeals preference read has no result")
        val value = (result as OneRegisterInstruction).registerA
        val keyRegister = reader.implementation!!.registerCount - 1
        // The key must still be in its parameter register when the value is read.
        val keyWritten = instructions.take(get + 2).any { (it as? OneRegisterInstruction)?.registerA == keyRegister && it.opcode != Opcode.INVOKE_VIRTUAL }
        if (keyWritten) throw PatchException("Slickdeals preference key is overwritten before the value is read")
        reader.addInstructions(
            get + 2,
            """
                invoke-static { v$keyRegister, v$value }, $ADS_FILTER->slickdealsPreference(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v$value
            """.trimIndent(),
        )

        // The nudge decider: a static suspend method of the class that holds the nudge
        // counters, taking that class first.
        val keyClass = nudgeKeyClass ?: throw PatchException("Slickdeals nudge settings not found")
        var nudges = 0
        val owners = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.fields.any { it.type == keyClass } &&
                classDef.methods.any { method ->
                    AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "Ljava/lang/Object;" &&
                        method.parameterTypes.size == 3 && method.parameterTypes[0].toString() == classDef.type
                }
            ) owners += classDef.type
        }
        owners.forEach { owner ->
            mutableClassDefBy(owner).methods.filter { method ->
                AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "Ljava/lang/Object;" &&
                    method.parameterTypes.size == 3 && method.parameterTypes[0].toString() == owner
            }.forEach {
                it.returnEarly(
                    """
                        sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                        return-object v0
                    """.trimIndent(),
                )
                nudges++
            }
        }
        if (nudges != 1) throw PatchException("Slickdeals nudge decider: expected 1, found $nudges")
    }
}
