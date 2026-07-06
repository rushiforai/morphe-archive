package app.morphe.patches.piko.misc.shim.methods.broadcast.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.checkCast
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstruction
import app.morphe.util.indexOfFirstStringInstruction
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

internal const val GMS_INTERNAL_ADS_CLASS_PREFIX = "Lcom/google/android/gms/internal/ads/"
internal const val INTERACTIVE_MEDIA_ADS_CLASS_PREFIX =
    "Lcom/google/ads/interactivemedia/v3/internal/"
internal const val LIFE_CYCLE_CALLBACKS_ERROR_MESSAGE =
    "Error registering activity lifecycle callbacks."

internal object GoogleAdViewCallbackFingerprint : Fingerprint(
    definingClass = GMS_INTERNAL_ADS_CLASS_PREFIX,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
    filters = listOf(
        string("android.intent.action.SCREEN_ON"),
        newInstance(GMS_INTERNAL_ADS_CLASS_PREFIX),
        string(LIFE_CYCLE_CALLBACKS_ERROR_MESSAGE),
    )
)

internal object GoogleAdViewCallbackDestroyFingerprint : Fingerprint(
    classFingerprint = GoogleAdViewCallbackFingerprint,
    name = "onActivityDestroyed",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;"),
    filters = listOf(
        opcode(Opcode.CONST_4),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            definingClass = GMS_INTERNAL_ADS_CLASS_PREFIX,
            parameters = listOf("I"),
            returnType = "V"
        )
    )
)

internal object GoogleAdViewNoCallbackFingerprint : Fingerprint(
    definingClass = GMS_INTERNAL_ADS_CLASS_PREFIX,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
    filters = listOf(
        string("android.intent.action.SCREEN_ON"),
        newInstance(GMS_INTERNAL_ADS_CLASS_PREFIX),
    ),
    custom = { method, _ ->
        method.indexOfFirstStringInstruction(LIFE_CYCLE_CALLBACKS_ERROR_MESSAGE) < 0 &&
                method.indexOfStringFieldInstruction() < 0
    }
)

private fun Method.indexOfStringFieldInstruction() =
    indexOfFirstInstruction {
        opcode == Opcode.IGET_OBJECT &&
                getReference<FieldReference>()?.type == "Ljava/lang/String;"
    }

internal object MainThreadFingerprint : Fingerprint(
    definingClass = GMS_INTERNAL_ADS_CLASS_PREFIX,
    name = "<init>",
    returnType = "V",
    filters = listOf(
        string(" [AndroidXMedia3/1.4.0-alpha01] ["),
        methodCall(
            opcode = Opcode.INVOKE_DIRECT,
            definingClass = GMS_INTERNAL_ADS_CLASS_PREFIX,
            name = "<init>",
            parameters = listOf("Landroid/os/Handler;")
        ),
        checkCast("Landroid/os/PowerManager;"),
        checkCast("Landroid/net/wifi/WifiManager;"),
    )
)

internal object InteractiveAdViewFingerprint : Fingerprint(
    definingClass = INTERACTIVE_MEDIA_ADS_CLASS_PREFIX,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
    filters = listOf(
        string("android.intent.action.SCREEN_ON"),
        newInstance(INTERACTIVE_MEDIA_ADS_CLASS_PREFIX),
    )
)