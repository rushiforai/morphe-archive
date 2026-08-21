package app.morphe.patches.delonghi.location

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import com.android.tools.smali.dexlib2.Opcode

private const val LOGIN_STARTUP_FRAGMENT =
    "Lcom/ddsx_ayla_android/view/comfort_v4/fragments/login/LoginRegisterStartupFragment;"

private const val LOCATION_PERMISSION_CHECK =
    "Lcom/ddsx_ayla_android/view/comfort_v4/base/NewBaseFragment;->isLocationPermissionGranted()Z"

/** Matches the startup fragment method that requests fine location permission. */
internal object StartupLocationRequestFingerprint : Fingerprint(
    definingClass = LOGIN_STARTUP_FRAGMENT,
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        app.morphe.patcher.string("android.permission.ACCESS_FINE_LOCATION"),
        literal(12001),
        methodCall(smali = "Landroidx/fragment/app/Fragment;->requestPermissions([Ljava/lang/String;I)V"),
    ),
)

/** Matches the login-button handler's location gate. */
internal object LoginLocationGateFingerprint : Fingerprint(
    definingClass = LOGIN_STARTUP_FRAGMENT,
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        literal(1),
        fieldAccess(smali = "${LOGIN_STARTUP_FRAGMENT}->k:Z"),
        methodCall(smali = LOCATION_PERMISSION_CHECK),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
    ),
)

/** Matches the registration-button handler's location gate. */
internal object RegisterLocationGateFingerprint : Fingerprint(
    definingClass = LOGIN_STARTUP_FRAGMENT,
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        literal(0),
        fieldAccess(smali = "${LOGIN_STARTUP_FRAGMENT}->k:Z"),
        literal(1),
        fieldAccess(smali = "${LOGIN_STARTUP_FRAGMENT}->l:Z"),
        methodCall(smali = LOCATION_PERMISSION_CHECK),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
    ),
)
