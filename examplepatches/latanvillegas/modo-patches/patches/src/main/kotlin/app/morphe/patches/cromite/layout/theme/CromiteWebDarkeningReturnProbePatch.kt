package app.morphe.patches.cromite.layout.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Separate, default-disabled diagnostic: observes the real boolean returned
 * by Chromium after native content-setting 71 and site exceptions.
 * No return value, conditional branch, JNI call, or existing patch is changed.
 */
private val cromiteForceDarkReturnMethod = Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/night_mode/WebContentsThemeClient;",
    name = "isForceDarkWebContentEnabled",
    returnType = "Z",
    parameters = listOf("Lorg/chromium/content_public/browser/WebContents;"),
)

@Suppress("unused")
val cromiteWebDarkeningReturnProbePatch = bytecodePatch(
    name = "Cromite web darkening final boolean return probe",
    description = "Optional read-only log of final native force-dark decision; max 64 samples per process.",
    default = false,
) {
    compatibleWith("org.cromite.cromite"("153.0.8010.37"))
    extendWith("extensions/cromite.mpe")

    execute {
        classDefBy("Lapp/morphe/extension/cromite/amoled/WebDarkeningReturnProbe;")
        val method = cromiteForceDarkReturnMethod.method
        val impl = checkNotNull(method.implementation)
        check(impl.registerCount == 5) { "Unexpected force-dark method register layout" }

        val original = impl.instructions.toList()
        val strings = original.mapNotNull {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
        }
        check(strings.count { it == "WebContentsForceDark" } == 1)
        check(strings.count { it == "DarkenWebsitesCheckboxInThemesSetting" } == 1)
        val calls = original.mapNotNull {
            (it as? ReferenceInstruction)?.reference as? MethodReference
        }
        check(calls.any { it.definingClass == "LJ/N;" && it.name == "IIOOO" }) {
            "Per-site JNI decision absent; refusing to instrument"
        }

        val returns = original.mapIndexedNotNull { index, instruction ->
            if (instruction.opcode != Opcode.RETURN) return@mapIndexedNotNull null
            val register = (instruction as? OneRegisterInstruction)?.registerA
                ?: error("Unexpected boolean return instruction")
            index to register
        }
        check(returns.isNotEmpty()) { "No boolean return instruction found" }

        // Insert backwards so original instruction indexes remain stable.
        // invoke-static takes a copy of the return register; RETURN itself
        // remains unchanged and retains Chromium's authoritative decision.
        for ((index, register) in returns.asReversed()) {
            method.addInstructions(
                index,
                "invoke-static {v$register}, " +
                    "Lapp/morphe/extension/cromite/amoled/WebDarkeningReturnProbe;->observe(Z)V",
            )
        }
    }
}
