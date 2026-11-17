package app.morphed.patches.twitch.ad.client

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import app.morphed.patches.twitch.settings.patchSettingsPatch
import app.morphed.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import app.morphed.patches.twitch.shared.markIncluded
import app.morphed.patches.twitch.shared.addInstructionsBeforeReturn
import app.morphed.patches.twitch.shared.indicesOf
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphed.patches.twitch.settings.checkRegistersFree
import app.morphed.patches.twitch.settings.reads

private const val CLIENT_ADS_CLASS = "Lapp/morphed/extension/twitch/patches/ClientAdsPatch;"

@Suppress("unused")
val blockClientAdsPatch = bytecodePatch(
    name = "Block client-side ads",
    description = "Makes the app treat every ad eligibility check like a Turbo viewer, so it never starts " +
        "the ads it plays itself (a black screen while their ad server is blocked).",
    default = true
) {
    compatibleWith(COMPATIBILITY_TWITCH)

    dependsOn(patchSettingsPatch)
    extendWith("extensions/twitch.mpe")

    execute {
        markIncluded("adBlock")

        // Ad triggers (the display ads beside the stream in full screen, LeftThird and Banner, and video ads):
        // while the ad blocker is on, every one goes down the app's own decline path.
        AdTriggerFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            fun stringIndex(text: String) = instructions.indexOfFirst {
                it.opcode == Opcode.CONST_STRING && (it.getReference<StringReference>()?.string == text)
            }
            val received = stringIndex("ad_request_client_trigger_received")
            val declined = stringIndex("ad_request_client_trigger_declined")
            check(received in 0 until declined) { "Ad trigger messages not in order in $definingClass->$name" }
            // The decline path starts right after the last check before it.
            val declineStart = (declined downTo received).firstOrNull {
                instructions[it].opcode.name.startsWith("if-", ignoreCase = true)
            }?.plus(1) ?: error("No decline path found in $definingClass->$name")
            // Right after the "received" event is logged; the next instruction writes the register used here.
            val logged = (received until declineStart).firstOrNull { instructions[it].opcode == Opcode.INVOKE_STATIC }
                ?: error("No ad trigger log call in $definingClass->$name")
            val next = instructions[logged + 1]
            check(next is OneRegisterInstruction && next.opcode.setsRegister() && next.registerA <= 255 &&
                !next.opcode.name.startsWith("move-result", ignoreCase = true) &&
                next.registerA !in reads(next)) {
                "Unexpected code after the ad trigger log in $definingClass->$name; the patch needs an update"
            }
            val free = next.registerA
            // Overwritten by the check's result: the decline path must not read what it held before.
            checkRegistersFree(this, declineStart - 1, setOf(free), "the ad trigger check")
            addInstructionsWithLabels(
                logged + 1,
                """
                    invoke-static {}, $CLIENT_ADS_CLASS->declineAdTrigger()Z
                    move-result v$free
                    if-nez v$free, :decline
                """,
                ExternalLabel("decline", getInstruction(declineStart)), // (looked up before the insert: the same instruction after it)
            )
        }

        val reasonsMethod = AdIneligibilityReasonsFingerprint.method
        reasonsMethod.apply {
            // The reasons enum is obfuscated, field names included. It is the enum whose own constants
            // the method reads (a static field of its own type); the extension finds the Turbo reason
            // in it by the constant's name, which the enum keeps.
            val reasonClass = implementation!!.instructions.firstNotNullOfOrNull { instruction ->
                if (instruction.opcode != Opcode.SGET_OBJECT) return@firstNotNullOfOrNull null
                instruction.getReference<FieldReference>()
                    ?.takeIf { it.type == it.definingClass }
                    ?.definingClass
                    // A Kotlin object's INSTANCE field (a logger, say) has its own type too: only an enum will do.
                    ?.takeIf { classDefByOrNull(it)?.superclass == "Ljava/lang/Enum;" }
            } ?: error("Ad ineligibility reasons enum not found in $definingClass->$name")

            indicesOf(Opcode.RETURN_OBJECT).forEach { returnIndex ->
                val set = getInstruction<OneRegisterInstruction>(returnIndex).registerA
                // The method ends here, so any other low register is free to hold the class.
                val type = if (set == 0) 1 else 0
                check(set <= 15 && implementation!!.registerCount > 1) { "Unexpected registers in $name" }
                // Before every path's return, including the branches that jump straight to it.
                addInstructionsBeforeReturn(
                    returnIndex,
                    """
                        const-class v$type, $reasonClass
                        invoke-static { v$set, v$type }, $CLIENT_ADS_CLASS->markIneligible(Ljava/util/Set;Ljava/lang/Class;)V
                    """
                )
            }
        }

        // Optional: the full check's result tells whether an ad was really due (only our reason in
        // it), which decides the "Ad blocked" message. If a Twitch update moves it, blocking still
        // works and the message falls back to the reasons above.
        AdEligibilityCheckFingerprint.methodOrNull?.apply {
            val instructions = implementation!!.instructions.toList()
            val call = instructions.indexOfFirst { instruction ->
                val reference = instruction.getReference<MethodReference>()
                reference?.definingClass == reasonsMethod.definingClass && reference.name == reasonsMethod.name &&
                    reference.returnType == reasonsMethod.returnType
            }
            if (call < 0) return@apply
            val returnIndex = (call until instructions.size).firstOrNull { instructions[it].opcode == Opcode.RETURN_OBJECT }
                ?: return@apply
            val result = getInstruction<OneRegisterInstruction>(returnIndex).registerA
            // Taken as Object: big switch methods often share one return among all their cases, so
            // the register can hold other types on other paths. The extension checks the type.
            addInstructionsBeforeReturn(
                returnIndex,
                "invoke-static/range { v$result .. v$result }, $CLIENT_ADS_CLASS->onEligibilityDecided(Ljava/lang/Object;)V"
            )
        }
    }
}
