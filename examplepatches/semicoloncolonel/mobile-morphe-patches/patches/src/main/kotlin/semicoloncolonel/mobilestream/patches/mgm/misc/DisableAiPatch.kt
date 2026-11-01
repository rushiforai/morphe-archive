package semicoloncolonel.mobilestream.patches.mgm.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import semicoloncolonel.mobilestream.patches.mgm.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Disable "MGM+ AI" (OPT-IN, default OFF).
//
// MGM+ has an in-app generative-AI chat assistant, branded "MGM+ AI" and named
// "popcorn" / "popcorn picks" in the code. Two server settings turn it on,
// carried on the app's own Settings model (com.epix.domain.model.Settings):
//
//   enableAiPicks             -> the "Get Personalized Pick" / "Not sure what to
//                                watch?" AI entry points and the chat itself.
//   hasPopcornContentPlacement -> the AI-picks rows placed on the Home screen.
//
// Both are plain boolean fields set once in the Settings constructor from the
// server response (enable_popcornpicks). This forces both to false as they are
// stored, so every screen that reads them (HomeViewModel's AI feature-flag
// gate, HomeState, HomeScreen) sees the feature as off, whatever the server
// sends. Nothing else about the app changes.
// ─────────────────────────────────────────────────────────────────────────────

private const val SETTINGS_CLASS = "Lcom/epix/domain/model/Settings;"
private val AI_FLAG_FIELDS = setOf("enableAiPicks", "hasPopcornContentPlacement")

internal object SettingsConstructorFingerprint : Fingerprint(
    custom = { method, classDef ->
        method.name == "<init>" && classDef.type == SETTINGS_CLASS
    },
)

@Suppress("unused")
val disableAiPatch = bytecodePatch(
    name = "Disable MGM+ AI",
    description = "Turns off the \"MGM+ AI\" chat assistant (the \"Get Personalized Pick\" and " +
        "\"Not sure what to watch?\" prompts, the AI chat, and the AI-picks rows on Home) by " +
        "forcing its feature flags off, whatever the server sends. Nothing else changes.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val constructor = SettingsConstructorFingerprint.method
        val instructions = constructor.implementation!!.instructions.toList()
        // Highest index first, so earlier indices stay valid after inserting.
        var patched = 0
        instructions.indices.reversed().forEach { index ->
            val instruction = instructions[index]
            if (instruction.opcode != Opcode.IPUT_BOOLEAN) return@forEach
            val field = (instruction as ReferenceInstruction).reference as FieldReference
            if (field.definingClass != SETTINGS_CLASS || field.name !in AI_FLAG_FIELDS) return@forEach
            val valueRegister = (instruction as TwoRegisterInstruction).registerA
            constructor.addInstructions(index, "const/4 v$valueRegister, 0x0")
            patched++
        }
        check(patched == AI_FLAG_FIELDS.size) {
            "Disable MGM+ AI: expected ${AI_FLAG_FIELDS.size} flag stores, patched $patched"
        }
    }
}
