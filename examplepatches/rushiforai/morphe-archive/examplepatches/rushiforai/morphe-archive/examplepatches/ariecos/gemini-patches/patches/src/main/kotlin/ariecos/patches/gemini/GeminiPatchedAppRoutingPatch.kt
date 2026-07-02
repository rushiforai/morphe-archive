package ariecos.patches.gemini

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.fingerprint
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

val allowlistFingerprint = fingerprint {
    returns("Z")
    parameters()
    strings("com.google.android.apps.youtube.music")
}

@Suppress("unused")
val geminiRoutingPatch = bytecodePatch(
    name = "Route intents to patched apps",
    description = "Replaces unused internal package names in Gemini's allowlist " +
                  "with Morphe-patched YouTube and YouTube Music package names.",
    default = true,
) {
    compatibleWith(
        "com.google.android.apps.bard",
        "com.google.android.googlequicksearchbox",
    )

    execute {
        val method = allowlistFingerprint.method

        val replacements = mapOf(
            "com.google.intelligence.sense.ambientmusic.functional.emulator" to
                "app.morphe.android.apps.youtube.music",
            "com.google.intelligence.sense.ambientmusic.history.functional" to
                "app.morphe.android.youtube",
        )

        method.implementation!!.instructions.toList().forEachIndexed { index, instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference?.toString()
                ?: return@forEachIndexed
            val replacement = replacements[ref] ?: return@forEachIndexed
            val register = (instruction as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA
            method.replaceInstruction(index, "const-string v$register, \"$replacement\"")
        }
    }
}
