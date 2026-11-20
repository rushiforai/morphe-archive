package id.ikuradachi.patches.crunchyroll.ui.modals

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.checkCast
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object BrazeBeforeInAppMessageDisplayedFingerprint : Fingerprint(
    name = "beforeInAppMessageDisplayed",
    returnType = "Lcom/braze/ui/inappmessage/InAppMessageOperation;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("L"),
    filters = listOf(
        string("Braze IAM deferred: display not allowed for current profile"),
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = "Lcom/braze/ui/inappmessage/InAppMessageOperation;",
            name = "DISPLAY_LATER",
        ),
    ),
)

object InAppReviewLauncherConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("L", "L", "L", "L", "L"),
    filters = listOf(
        string("inAppReviewStore"),
        string("flowLauncher"),
    ),
)

object InAppReviewBindToLifecycleFingerprint : Fingerprint(
    classFingerprint = InAppReviewLauncherConstructorFingerprint,
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Landroidx/appcompat/app/"),
    filters = listOf(
        string("lifecycle"),
        string("minActiveState"),
    ),
)

object InAppUpdatesPresenterConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("Lcom/ellation/crunchyroll/inappupdates/view/InAppUpdatesLayout;", "L", "L"),
    filters = listOf(
        string("inAppUpdatesManager"),
    ),
)

object InAppUpdatesUpdateStateFingerprint : Fingerprint(
    classFingerprint = InAppUpdatesPresenterConstructorFingerprint,
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("L"),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT),
        methodCall(name = "invoke", returnType = "Ljava/lang/Object;"),
        checkCast("Ljava/lang/Boolean;"),
        methodCall(
            definingClass = "Ljava/lang/Boolean;",
            name = "booleanValue",
            parameters = emptyList(),
            returnType = "Z",
        ),
        opcode(Opcode.MOVE_RESULT, InstructionLocation.MatchAfterImmediately()),
    ),
)

object InAppUpdatesModuleInitFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    filters = listOf(
        string("in_app_updates"),
        fieldAccess(opcode = Opcode.IGET_BOOLEAN, type = "Z"),
        opcode(Opcode.IF_EQZ, InstructionLocation.MatchAfterImmediately()),
    ),
)

object MobileMainNotificationPromptFingerprint : Fingerprint(
    definingClass = "Lcom/ellation/crunchyroll/presentation/mainv2/MobileMainActivity;",
    name = "onCreate",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        string("android.permission.POST_NOTIFICATIONS"),
        methodCall(
            name = "checkSelfPermission",
            parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
            returnType = "I",
            location = InstructionLocation.MatchAfterWithin(1),
        ),
        opcode(Opcode.MOVE_RESULT, InstructionLocation.MatchAfterImmediately()),
        opcode(Opcode.IF_NEZ, InstructionLocation.MatchAfterImmediately()),
    ),
)

object HomeBottomBarNotificationPromptFingerprint : Fingerprint(
    definingClass = "Lcom/ellation/crunchyroll/presentation/main/home/HomeBottomBarActivity;",
    name = "onCreate",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        string("android.permission.POST_NOTIFICATIONS"),
        methodCall(
            name = "checkSelfPermission",
            parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
            returnType = "I",
            location = InstructionLocation.MatchAfterWithin(1),
        ),
        opcode(Opcode.MOVE_RESULT, InstructionLocation.MatchAfterImmediately()),
        opcode(Opcode.IF_NEZ, InstructionLocation.MatchAfterImmediately()),
    ),
)
