package app.morphe.patches.piko.misc.shim.methods.async

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val GMS_INTERACTIVE_MEDIA_CLASS_PREFIX =
    "Lcom/google/ads/interactivemedia/v3/internal/"
private const val GMS_INTERNAL_ADS_CLASS_PREFIX = "Lcom/google/android/gms/internal/ads/"

internal object InteractiveMediaASyncTaskReferenceFingerprint : Fingerprint(
    definingClass = GMS_INTERACTIVE_MEDIA_CLASS_PREFIX,
    name = "run",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string("Error with setting not visible reason"),
        newInstance(GMS_INTERACTIVE_MEDIA_CLASS_PREFIX),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            smali = "Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z",
        ),
        newInstance(GMS_INTERACTIVE_MEDIA_CLASS_PREFIX),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            smali = "Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z",
        ),
        newInstance(GMS_INTERACTIVE_MEDIA_CLASS_PREFIX),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            smali = "Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z",
        )
    )
)

private object InteractiveMediaHelperFieldParentFingerprint : Fingerprint(
    definingClass = GMS_INTERACTIVE_MEDIA_CLASS_PREFIX,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            smali = "Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z",
        ),
        string("setNativeViewHierarchy")
    )
)

internal object InteractiveMediaHelperFieldFingerprint : Fingerprint(
    classFingerprint = InteractiveMediaHelperFieldParentFingerprint,
    name = "doInBackground",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("[Ljava/lang/Object;"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = GMS_INTERACTIVE_MEDIA_CLASS_PREFIX,
            type = GMS_INTERACTIVE_MEDIA_CLASS_PREFIX
        ),
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = GMS_INTERACTIVE_MEDIA_CLASS_PREFIX,
            type = "Lorg/json/JSONObject;"
        ),
    )
)

internal object InternalAdsASyncTaskReferenceFingerprint : Fingerprint(
    definingClass = GMS_INTERNAL_ADS_CLASS_PREFIX,
    name = "run",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string("Error with setting not visible reason"),
        newInstance(GMS_INTERNAL_ADS_CLASS_PREFIX),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            smali = "Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z",
        ),
        newInstance(GMS_INTERNAL_ADS_CLASS_PREFIX),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            smali = "Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z",
        ),
        newInstance(GMS_INTERNAL_ADS_CLASS_PREFIX),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            smali = "Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z",
        )
    )
)

private object InternalAdsHelperFieldParentFingerprint : Fingerprint(
    definingClass = GMS_INTERNAL_ADS_CLASS_PREFIX,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            smali = "Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z",
        ),
        string("setNativeViewHierarchy")
    )
)

internal object InternalAdsHelperFieldFingerprint : Fingerprint(
    classFingerprint = InternalAdsHelperFieldParentFingerprint,
    name = "doInBackground",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("[Ljava/lang/Object;"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = GMS_INTERNAL_ADS_CLASS_PREFIX,
            type = GMS_INTERNAL_ADS_CLASS_PREFIX
        ),
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = GMS_INTERNAL_ADS_CLASS_PREFIX,
            type = "Lorg/json/JSONObject;"
        ),
    )
)