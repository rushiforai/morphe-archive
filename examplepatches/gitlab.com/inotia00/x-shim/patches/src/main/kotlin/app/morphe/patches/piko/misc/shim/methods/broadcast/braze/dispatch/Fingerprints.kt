package app.morphe.patches.piko.misc.shim.methods.broadcast.braze.dispatch

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

internal const val BRAZE_DISPATCH_CLASS_PREFIX = "Lcom/braze/dispatch"

internal object BrazeDisPatchConnectionFingerprint : Fingerprint(
    definingClass = BRAZE_DISPATCH_CLASS_PREFIX,
    name = "<init>",
    filters = listOf(
        string("dataSyncConfigurationProvider"),
        literal(30),
        opcode(Opcode.IF_LT),
        newInstance(BRAZE_DISPATCH_CLASS_PREFIX),
        newInstance(BRAZE_DISPATCH_CLASS_PREFIX)
    )
)

internal object BrazeDisPatchConnectivityEventConstructorFingerprint : Fingerprint(
    classFingerprint = BrazeDisPatchConnectivityEventLogMessageFingerprint,
    name = "<init>",
    parameters = listOf(
        BRAZE_DISPATCH_CLASS_PREFIX,
        "Landroid/content/Intent;",
        "Landroid/content/BroadcastReceiver\$PendingResult;",
        "Lkotlin/coroutines/Continuation;"
    ),
    returnType = "V",
)

private object BrazeDisPatchConnectivityEventLogMessageFingerprint : Fingerprint(
    definingClass = BRAZE_DISPATCH_CLASS_PREFIX,
    parameters = listOf(),
    returnType = "Ljava/lang/String;",
    filters = listOf(
        string("Retrieving connectivity event data in background")
    )
)

internal object DefaultBrazeImageLoaderFingerprint : Fingerprint(
    definingClass = "Lcom/braze/images/DefaultBrazeImageLoader;",
    name = "initDiskCacheTask",
    returnType = "V",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            name = "INSTANCE"
        ),
        methodCall(
            definingClass = "Lkotlinx/coroutines/"
        )
    )
)
