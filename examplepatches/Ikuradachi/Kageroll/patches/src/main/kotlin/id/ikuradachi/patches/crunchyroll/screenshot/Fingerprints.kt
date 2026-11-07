package id.ikuradachi.patches.crunchyroll.screenshot

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

object MembershipCardDialogFingerprint : Fingerprint(
    filters = listOf(
        string("getViewModel()Lcom/ellation/crunchyroll/presentation/settings/membership/card/ui/MembershipCardViewModelImpl;"),
    ),
)

object MembershipCardOnViewCreatedFingerprint : Fingerprint(
    classFingerprint = MembershipCardDialogFingerprint,
    name = "onViewCreated",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
    filters = listOf(
        opcode(Opcode.CONST_16),
        methodCall(smali = "Landroid/view/Window;->setFlags(II)V"),
    ),
)

object ComposeDialogFingerprint : Fingerprint(
    filters = listOf(
        string("Dialog has no window"),
    ),
)

object ComposeDialogSetFlagsFingerprint : Fingerprint(
    classFingerprint = ComposeDialogFingerprint,
    filters = listOf(
        opcode(Opcode.CONST_16),
        opcode(Opcode.MOVE),
        opcode(Opcode.CONST_16),
        methodCall(smali = "Landroid/view/Window;->setFlags(II)V"),
    ),
)

object ArcActivityCaptureCallbackFingerprint : Fingerprint(
    definingClass = "Lcom/crunchyroll/crarc/presentation/ArcActivity;",
    name = "onStart",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(smali = "Landroid/app/Activity;->registerScreenCaptureCallback(Ljava/util/concurrent/Executor;Landroid/app/Activity\$ScreenCaptureCallback;)V"),
    ),
)
