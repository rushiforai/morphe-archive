package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

internal const val ANHPAN_UI_HELPER = "Lapp/template/extension/zalo/settings/AnhpanUiHelper;"

internal object NormalMsgBindFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/moduleview/message/NormalMsgModuleView;",
    name = "T",
    returnType = "V",
    parameters = listOf("Lpup;", "Z", "I"),
)

@Suppress("unused")
val anhpanChatListFilterPatch = bytecodePatch(
    name = "Clean chat list",
    description = "Hide previews, avatars, dates, draft labels, or rename chats.",
    default = true,
) {
    dependsOn(anhpanSettingsPatch)
    compatibleWith(zaloCompatibility)
    extendWith("extensions/extension.mpe")

    execute {
        val match = NormalMsgBindFingerprint.matchOrNull() ?: return@execute
        match.method.addInstructions(
            0,
            "invoke-static {p0, p1}, $ANHPAN_UI_HELPER->onBindNormalMsg(Landroid/view/View;Ljava/lang/Object;)V",
        )
    }
}
