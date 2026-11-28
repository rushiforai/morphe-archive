package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction


internal object MainTabMenuFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/maintab/MainTabView;",
    name = "m5",
    returnType = "V",
    parameters = listOf("Lcom/zing/zalo/zview/actionbar/ActionBarMenu;"),
)


@Suppress("unused")
val anhpanUiTweaksPatch = bytecodePatch(
    name = "Minimal top bar & media",
    description = "Hide the search bar, QR/add buttons, and quick heart/share buttons on media.",
    default = true,
) {
    compatibleWith(zaloCompatibility)
    extendWith("extensions/extension.mpe")

    execute {
        check(MainTabMenuFingerprint.matchAll(1..1).size == 1)
        val tabMenu = MainTabMenuFingerprint.method
        val tabMenuBase = tabMenu.implementation!!.registerCount - 2
        val tabMenuRet = tabMenu.implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        check(tabMenuRet >= 0)
        tabMenu.addInstructions(
            tabMenuRet,
            """
                move-object/from16 v0, v$tabMenuBase
                invoke-static {v0}, $ANHPAN_CHAT_LOCK->applyMainTabMenu(Ljava/lang/Object;)V
            """.trimIndent(),
        )
    }
}
