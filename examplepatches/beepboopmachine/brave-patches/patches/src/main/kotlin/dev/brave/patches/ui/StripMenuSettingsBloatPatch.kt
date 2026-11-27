package dev.brave.patches.ui

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import dev.brave.patches.core.braveCorePatch
import dev.brave.patches.shared.COMPATIBILITY_BRAVE

private const val MENU_HELPER = "Ldev/brave/extension/ui/MenuHelper;"

/**
 * Primary customizable 3-dot app menu builder in Brave v1.100.58 (Lhq2;->f()Lb1b;).
 */
internal object MainAppMenuModelFingerprint : Fingerprint(
    definingClass = "Lhq2;",
    name = "f",
    returnType = "Lb1b;",
    parameters = listOf()
)

/**
 * Legacy/fallback 3-dot app menu builder (Lhq2;->U()Lb1b;).
 */
internal object LegacyAppMenuModelFingerprint : Fingerprint(
    definingClass = "Lhq2;",
    name = "U",
    returnType = "Lb1b;",
    parameters = listOf()
)

internal object BraveMainPreferencesFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/settings/BraveMainPreferencesBase;",
    name = "V3",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

@Suppress("unused")
val stripMenuSettingsBloatPatch = patch(
    name = "Strip Menu & Settings Bloat",
    description = "Removes Brave Wallet, Leo AI, Brave News, Brave Rewards, and VPN from the app menu and settings."
) {
    compatibleWith(COMPATIBILITY_BRAVE)

    dependsOn(braveCorePatch)

    extendWith("extensions/brave.mpe")

    execute {
        // 1a. Hook the PRIMARY 3-dot menu builder Lhq2;->f()Lb1b; (.locals 39, returns v5)
        MainAppMenuModelFingerprint.method.apply {
            val returnIdx = instructions.indices.indexOfLast { instructions[it].opcode == Opcode.RETURN_OBJECT }
            if (returnIdx < 0) {
                throw PatchException("Could not locate return-object in Lhq2;->f()Lb1b;")
            }
            val modelListReg = (instructions[returnIdx] as OneRegisterInstruction).registerA
            addInstructions(
                returnIdx,
                "invoke-static {v$modelListReg}, $MENU_HELPER->removeBloatMenuItems(Ljava/lang/Object;)V"
            )
        }

        // 1b. Also hook fallback Lhq2;->U()Lb1b;
        LegacyAppMenuModelFingerprint.methodOrNull?.apply {
            val returnIdx = instructions.indices.indexOfLast { instructions[it].opcode == Opcode.RETURN_OBJECT }
            if (returnIdx >= 0) {
                val modelListReg = (instructions[returnIdx] as OneRegisterInstruction).registerA
                addInstructions(
                    returnIdx,
                    "invoke-static {v$modelListReg}, $MENU_HELPER->removeBloatMenuItems(Ljava/lang/Object;)V"
                )
            }
        }

        // 2. In BraveMainPreferencesBase->V3(Bundle)V, strip bloat preferences right BEFORE return-void
        BraveMainPreferencesFingerprint.method.apply {
            val returnIdx = instructions.indices.indexOfLast { instructions[it].opcode == Opcode.RETURN_VOID }
            if (returnIdx < 0) {
                throw PatchException("Could not locate return-void in BraveMainPreferencesBase->V3(Bundle)V")
            }
            addInstructions(
                returnIdx,
                """
                    invoke-static/range {p0 .. p0}, $MENU_HELPER->removeBloatPreferences(Ljava/lang/Object;)V
                """.trimIndent()
            )
        }
    }
}
