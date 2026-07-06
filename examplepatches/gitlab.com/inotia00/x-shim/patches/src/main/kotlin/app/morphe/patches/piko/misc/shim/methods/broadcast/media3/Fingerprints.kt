package app.morphe.patches.piko.misc.shim.methods.broadcast.media3

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.checkCast
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal const val MEDIA_UTIL_CLASS_PREFIX = "Landroidx/media3/common/util/"

internal object RunnableFingerprint : Fingerprint(
    definingClass = MEDIA_UTIL_CLASS_PREFIX,
    name = "run",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string("android.net.conn.CONNECTIVITY_CHANGE"),
        newInstance(MEDIA_UTIL_CLASS_PREFIX)
    )
)

internal object ConnectivityManagerFingerprint : Fingerprint(
    definingClass = MEDIA_UTIL_CLASS_PREFIX,
    name = "run",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        checkCast("Landroid/net/ConnectivityManager;"),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            smali = "Landroid/net/NetworkInfo;->getSubtype()I"
        ),
        checkCast("Landroid/telephony/TelephonyManager;"),
    )
)

internal object ConnectivityManagerConstructorFingerprint : Fingerprint(
    classFingerprint = ConnectivityManagerFingerprint,
    name = "<init>",
    returnType = "V",
    parameters = listOf("I", "Ljava/lang/Object;", "Ljava/lang/Object;")
)

internal object ConnectivityManagerConstructorLegacyFingerprint : Fingerprint(
    classFingerprint = ConnectivityManagerFingerprint,
    name = "<init>",
    returnType = "V",
    parameters = listOf(MEDIA_UTIL_CLASS_PREFIX, "Landroid/content/Context;")
)