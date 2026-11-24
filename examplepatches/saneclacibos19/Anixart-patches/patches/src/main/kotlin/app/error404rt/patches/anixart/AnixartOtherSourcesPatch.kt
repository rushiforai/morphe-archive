package app.error404rt.patches.anixart

import app.error404rt.patches.shared.Constants.COMPATIBILITY_ANIXART
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val anixartOtherSourcesPatch = bytecodePatch(
    name = "Always show other sources",
    description = "Всегда показывает кнопку «Искать другие варианты» в результатах поиска источников.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ANIXART)

    execute {
        // p4 is isThirdPartyPlatformsDisabled in buildModels(long, List, boolean, long, Listener).
        StreamingResultsFingerprint.method.addInstructions(0, "const/16 p4, 0x0")
    }
}
