package app.template.patches.BusFinder

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.BUS_FINDER

private const val EXTENSION_CLASS = "Lapp/template/extension/ExamplePatch;"

@Suppress("unused")
val examplePatch = resourcePatch(
    name = "Silent Beep",
    description = "Replaces beep sounds a silent mp3 file.",
) {
    compatibleWith(BUS_FINDER)

    execute {
        val beep_ok = get("res/raw/beep_ok.mp3")
        val beep_ko = get("res/raw/beep_ko.mp3")

        val silence = object {}.javaClass.classLoader
            .getResourceAsStream("BusFinder/beep/silence.mp3")
            ?.use { it.readBytes() }
            ?: throw IllegalStateException("silence.mp3 not found")

        get("res/raw/beep_ok.mp3").writeBytes(silence)
        get("res/raw/beep_ko.mp3").writeBytes(silence)
    }
}
