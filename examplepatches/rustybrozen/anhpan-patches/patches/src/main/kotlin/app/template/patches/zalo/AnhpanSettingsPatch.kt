package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val ANHPAN_SETTINGS = "Lapp/template/extension/zalo/settings/AnhpanSettings;"
internal const val ANHPAN_CHAT_LOCK = "Lapp/template/extension/zalo/settings/AnhpanChatLock;"

internal val zaloCompatibility = Compatibility(
    name = "Zalo",
    packageName = "com.zing.zalo",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x0068FF,
    targets = listOf(
        AppTarget(version = "26.11.01"),
        AppTarget(version = null, isExperimental = true),
    ),
)

internal object ZaloSettingsFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/settings/SettingV2View;",
    returnType = "Landroid/view/View;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/widget/LinearLayout;", "Landroid/os/Bundle;"),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET, name = "setting_v2_view", type = "I"),
        methodCall(definingClass = "Landroid/view/LayoutInflater;", name = "inflate"),
        fieldAccess(opcode = Opcode.SGET, name = "itemPrivacy", type = "I"),
    ),
)

internal object ContextMenuW6Fingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/chat/contextmenu/ConversationContextMenuView;",
    returnType = "Lcom/zing/zalo/zdesign/component/popover/PopoverView;",
    parameters = listOf("Lpup;"),
)


@Suppress("unused")
val anhpanSettingsPatch = bytecodePatch(
    description = "Settings entry in Zalo and long-press context menu hook. Automatically enabled when any Anhpan patch is selected.",
) {
    extendWith("extensions/extension.mpe")

    execute {
        // Inject settings entry row in Zalo's settings screen
        check(ZaloSettingsFingerprint.matchAll(1..1).size == 1)
        val settings = ZaloSettingsFingerprint.method
        val callTarget = "$ANHPAN_SETTINGS->attach(Landroid/view/View;Landroid/view/View;)V"
        if (settings.implementation!!.instructions.none {
            (it as? ReferenceInstruction)?.reference?.toString() == callTarget
        }) {
            val privacyIndex = settings.implementation!!.instructions.indexOfFirst {
                it.opcode == Opcode.SGET &&
                    ((it as? ReferenceInstruction)?.reference as? FieldReference)?.name == "itemPrivacy"
            }
            check(privacyIndex >= 0)
            val lookup = settings.getInstruction<FiveRegisterInstruction>(privacyIndex + 1)
            check(lookup.opcode == Opcode.INVOKE_STATIC && lookup.registerCount == 2)
            val privacy = settings.getInstruction<OneRegisterInstruction>(privacyIndex + 2)
            check(privacy.opcode == Opcode.MOVE_RESULT_OBJECT)
            check(settings.getInstruction<OneRegisterInstruction>(privacyIndex + 3).opcode == Opcode.CHECK_CAST)
            val branch = settings.getInstruction<OneRegisterInstruction>(privacyIndex + 4)
            check(branch.opcode == Opcode.IF_EQZ && branch.registerA == privacy.registerA)
            settings.addInstructions(
                privacyIndex + 5,
                "invoke-static {v${lookup.registerC}, v${privacy.registerA}}, $callTarget",
            )
        }

        // Hook long-press context menu: inject capture + menu items for read-only and highlight
        check(ContextMenuW6Fingerprint.matchAll(1..1).size == 1)
        val w6Method = ContextMenuW6Fingerprint.method
        val y6CallIndex = w6Method.implementation!!.instructions.indexOfFirst { instr ->
            (instr.opcode == Opcode.INVOKE_VIRTUAL || instr.opcode == Opcode.INVOKE_SUPER) &&
                ((instr as? ReferenceInstruction)?.reference as? MethodReference)?.name == "Y6"
        }
        check(y6CallIndex >= 0)
        val listReg = w6Method.getInstruction<OneRegisterInstruction>(y6CallIndex + 1).registerA
        val n1SetIndex = w6Method.implementation!!.instructions.indexOfFirst { instr ->
            instr.opcode == Opcode.IPUT_OBJECT &&
                ((instr as? ReferenceInstruction)?.reference as? FieldReference)?.name == "N1"
        }
        check(n1SetIndex >= 0)
        val ej1Reg = w6Method.getInstruction<OneRegisterInstruction>(n1SetIndex).registerA

        w6Method.addInstructions(
            n1SetIndex + 1,
            "invoke-static {v$ej1Reg, p0}, $ANHPAN_CHAT_LOCK->wrapListener(Ljava/lang/Object;Ljava/lang/Object;)V",
        )
        w6Method.addInstructions(
            y6CallIndex + 2,
            "invoke-static {v$listReg, p0}, $ANHPAN_CHAT_LOCK->addLockMenuItem(Ljava/util/List;Ljava/lang/Object;)V",
        )
        w6Method.addInstructions(
            0,
            "invoke-static {p1}, $ANHPAN_CHAT_LOCK->captureConvId(Ljava/lang/Object;)V",
        )
    }
}
