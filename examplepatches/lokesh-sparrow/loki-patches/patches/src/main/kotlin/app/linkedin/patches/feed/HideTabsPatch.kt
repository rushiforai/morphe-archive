package app.linkedin.patches.feed

import app.linkedin.patches.shared.Constants.COMPATIBILITY_LINKEDIN
import app.linkedin.patches.shared.Constants.EXTENSION_PACKAGE
import app.linkedin.patches.shared.markIncluded
import app.linkedin.patches.shared.settingsPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/** HomeNavTabsManager.getHomeNavTabs(): the tabs of the bottom bar. */
private object HomeNavTabsFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/home/HomeNavTabsManager;",
    name = "getHomeNavTabs",
    returnType = "Ljava/util/List;",
    parameters = listOf(),
)

@Suppress("unused")
val hideTabsPatch = bytecodePatch(
    name = "Hide bottom tabs",
    description = "Adds switches to take My Network and Jobs out of the bottom bar.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch)

    execute {
        markIncluded("isHideTabsIncluded")

        HomeNavTabsFingerprint.method.apply {
            val returns = instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
            if (returns.isEmpty()) throw PatchException("getHomeNavTabs has no return")
            // From the last return to the first, so the indexes stay valid.
            for ((index, instruction) in returns.reversed()) {
                val register = (instruction as OneRegisterInstruction).registerA
                addInstructions(
                    index,
                    """
                        invoke-static/range { v$register .. v$register }, $EXTENSION_PACKAGE/LokiPatches;->bottomTabs(Ljava/util/List;)Ljava/util/List;
                        move-result-object v$register
                    """
                )
            }
        }
    }
}
