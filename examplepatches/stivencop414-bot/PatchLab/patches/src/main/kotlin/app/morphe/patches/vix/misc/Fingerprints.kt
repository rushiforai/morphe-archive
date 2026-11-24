package app.morphe.patches.vix.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

internal object AppUpdateDialogFingerprint : Fingerprint(
    filters = listOf(
        string("AppUpdateDialog#onCreateView"),
    ),
)

internal object SplashShowUpdateDialogFingerprint : Fingerprint(
    definingClass = "Lcom/univision/descarga/mobile/ui/splash/SplashScreenFragment;",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(name = "getChildFragmentManager"),
        string(""),
    ),
)

internal object RequireUpgradeCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lcom/univision/descarga/presentation/viewmodels/config/states/a\$b;", "L"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/univision/descarga/ui/views/base/m;",
            name = "W6",
            returnType = "V",
            parameters = listOf("Ljava/lang/Boolean;"),
        ),
    ),
)

internal object DevToolsPasscodePromptFingerprint : Fingerprint(
    definingClass = "Lcom/univision/descarga/mobile/ui/settings/SettingsScreenFragment;",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Z", "Lkotlin/jvm/functions/Function1;"),
    filters = listOf(
        methodCall(definingClass = "Landroid/view/LayoutInflater;", name = "from"),
    ),
)

internal object DevToolsPasscodeVerifyFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Z", "L"),
    filters = listOf(
        methodCall(definingClass = "Lcom/univision/descarga/domain/delegates/b;", name = "D"),
        methodCall(definingClass = "Lkotlin/jvm/internal/Intrinsics;", name = "areEqual"),
        methodCall(definingClass = "Lcom/univision/descarga/domain/repositories/l;", name = "h1"),
    ),
)
