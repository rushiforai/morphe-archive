package app.sqzass.patches.protonvpn.misc.connectionpreferences

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.instanceOf
import app.morphe.patcher.opcode
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.patch.BytecodePatchContext
import app.sqzass.patches.protonvpn.misc.anchors.KotlinUnitToStringFingerprint
import app.sqzass.patches.protonvpn.misc.anchors.ToStringFingerprint
import app.sqzass.patches.protonvpn.misc.anchors.isFreeUserCall
import app.sqzass.patches.protonvpn.misc.anchors.vpnUserType
import app.sqzass.patches.protonvpn.misc.restrictions.restrictionGuardFingerprint
import app.sqzass.patches.protonvpn.misc.restrictions.freeUserCheckFingerprint
import com.android.tools.smali.dexlib2.Opcode

internal object ConnectionPreferencesToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("ConnectionPreferencesState(isFeatureDiscovered="),
)

internal fun BytecodePatchContext.defaultConnectionRestrictionFingerprint() = restrictionGuardFingerprint("getDefaultProfileId")

internal fun BytecodePatchContext.recentsRecordingFingerprint() = Fingerprint(
    name = "invokeSuspend",
    filters = listOf(
        isFreeUserCall(),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
        opcode(Opcode.IF_NEZ, MatchAfterImmediately()),
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = KotlinUnitToStringFingerprint.originalClassDef.type),
    ),
)

internal object RecentsListViewStateFlowFingerprint : Fingerprint(
    name = "<init>",
    strings = listOf("changeServerManager", "observeConnectionFeedbackViewState"),
)

internal object DefaultConnectionViewStateFlowFingerprint : Fingerprint(
    name = "<init>",
    strings = listOf("effectiveCurrentUserSettings", "getConnectIntentViewState", "observeDefaultConnection"),
)

internal fun BytecodePatchContext.defaultConnectionRecentsFingerprint(): Fingerprint {
    val owner = DefaultConnectionViewStateFlowFingerprint.originalClassDef.type
    return Fingerprint(
        name = "invokeSuspend",
        filters = listOf(
            isFreeUserCall(),
            methodCall(
                definingClass = owner,
                parameters = listOf(owner, "L", vpnUserType, "L", "L", "L", "L"),
                opcodes = listOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE),
            ),
        ),
    )
}

internal object GetQuickConnectIntentConstructorFingerprint : Fingerprint(
    name = "<init>",
    parameters = List(7) { "L" },
    strings = listOf("getDefaultConnectIntent", "observeDefaultConnection"),
)

internal fun BytecodePatchContext.quickConnectIntentFingerprint() = freeUserCheckFingerprint(
    definingClass = GetQuickConnectIntentConstructorFingerprint.originalClassDef.type,
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
)

internal object DefaultConnectionSettingStateToStringFingerprint :
    ToStringFingerprint("DefaultConnectionSettingState(iconRes=")

internal fun BytecodePatchContext.defaultConnectionSettingFingerprint() = Fingerprint(
    name = "invokeSuspend",
    filters = listOf(
        isFreeUserCall(),
        methodCall(
            parameters = listOf("L"),
            returnType = "Ljava/lang/Long;",
            opcodes = listOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE),
        ),
        newInstance(DefaultConnectionSettingStateToStringFingerprint.originalClassDef.type),
    ),
)

internal object ConnectionCardViewStateToStringFingerprint :
    ToStringFingerprint("VpnConnectionCardViewState(cardLabel=")

internal fun BytecodePatchContext.connectionCardLabelFingerprint() = freeUserCheckFingerprint(
    name = "invokeSuspend",
    followingFilters = arrayOf(
        methodCall(
            returnType = ConnectionCardViewStateToStringFingerprint.originalClassDef.type,
            location = MatchAfterWithin(3),
        ),
    ),
)

internal fun BytecodePatchContext.inlinedConnectionCardFingerprint() = Fingerprint(
    name = "invokeSuspend",
    filters = listOf(newInstance(ConnectionCardViewStateToStringFingerprint.originalClassDef.type)),
)

internal object RecentDefaultConnectionToStringFingerprint : ToStringFingerprint("Recent(recentId=")

internal fun BytecodePatchContext.inlinedDefaultConnectionSettingFingerprint() = Fingerprint(
    name = "invokeSuspend",
    filters = listOf(
        instanceOf(RecentDefaultConnectionToStringFingerprint.originalClassDef.type),
        newInstance(DefaultConnectionSettingStateToStringFingerprint.originalClassDef.type),
    ),
)
