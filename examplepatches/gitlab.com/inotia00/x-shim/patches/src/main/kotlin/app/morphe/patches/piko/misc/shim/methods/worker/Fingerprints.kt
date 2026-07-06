package app.morphe.patches.piko.misc.shim.methods.worker

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.OpcodesFilter.Companion.opcodesToFilters
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal const val OFFLINE_CLASS_PREFIX = "Lcom/google/android/gms/ads/internal/offline/buffering"
internal const val OFFLINE_NOTIFICATION_POSTER_CLASS =
    "$OFFLINE_CLASS_PREFIX/OfflineNotificationPoster;"
internal const val OFFLINE_PING_SENDER_CLASS = "$OFFLINE_CLASS_PREFIX/OfflinePingSender;"

internal object OfflineNotificationPosterDoWorkFingerprint : Fingerprint(
    definingClass = OFFLINE_NOTIFICATION_POSTER_CLASS,
    name = "doWork",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "L",
    parameters = listOf(),
    filters = opcodesToFilters(
        Opcode.INVOKE_INTERFACE,
        Opcode.NEW_INSTANCE,
        Opcode.INVOKE_DIRECT,
        Opcode.RETURN_OBJECT,
        Opcode.NEW_INSTANCE,
        Opcode.INVOKE_DIRECT,
    )
)

internal object OfflinePingSenderConstructorFingerprint : Fingerprint(
    definingClass = OFFLINE_PING_SENDER_CLASS,
    name = "<init>",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IPUT_OBJECT,
            definingClass = "this"
        )
    )
)

internal object OfflinePingSenderDoWorkFingerprint : Fingerprint(
    definingClass = OFFLINE_PING_SENDER_CLASS,
    name = "doWork",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "L",
    parameters = listOf()
)

internal object OfflinePingSenderSyntheticFingerprint : Fingerprint(
    definingClass = OFFLINE_PING_SENDER_CLASS,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.SYNTHETIC),
    filters = listOf(
        methodCall(
            returnType = "V"
        )
    )
)