package app.pigfoot.patches.fing

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import com.android.tools.smali.dexlib2.Opcodes
import java.security.MessageDigest

internal const val FING_PACKAGE = "com.overlook.android.fing"
internal const val FING_VERSION = "12.13.5"
internal const val FING_CODE = 121305003

internal fun requireFingVersion(name: String, code: String) {
    require(name == FING_VERSION && code == FING_CODE.toString()) { "Unsupported Fing version/build code" }
}

// Measured independently from the untouched merged full APKM, not from the donor.
internal val fingClassPins = mapOf(
    FING_PRIVACY_ACTIVITY to "c78e4761f50b62adf675bb5827b3db75f619821a09a066c273843aad5e052b67",
    "Lak/a;" to "fd375542a7ddfc3d627e41805bd2332d232a46ae8f138abbb7717b6aea718405",
    "Lap/l;" to "f47ba4cd2c9b10be5f80d9d63a23e490b33297f02754df0bca52843b23074a76",
    "Lcom/google/android/gms/analytics/CampaignTrackingReceiver;" to "a50f57124522a0484357c5d8e9b03bec258e9797204e36dcc7554c3337a265b4",
    "Lcom/overlook/android/fing/ui/base/ServiceActivity;" to "359eb0b10be7fc2864ec94b733db070b16135367e2bdca07d46f492f537ef334",
    "Lik/o;" to "be9fbd670a20be6a2263c7208f1e0e35d5539e7ee302fae9f939825b70c6a84d",
    "Lpe/e;" to "d5ec6d55df8c2c0df4e62c4381d0a908cad28bd44404a0c3033a644aad28f2c7",
    "Lpg/c;" to "ba206ccc26be937c318cd9c8eb7605b57f61e684ffaddc78e6baf9d05ccb4e2b",
    "Lqm/o;" to "dcf1dfd24a5a7d5735702eb81d10f3d44e1eaf9e228cc33591182c4d342ecd95"
)

internal fun fingClassHash(definition: ClassDef): String {
    val pool = DexPool(Opcodes.forDexVersion(39))
    pool.internClass(definition)
    val store = MemoryDataStore()
    pool.writeTo(store)
    return MessageDigest.getInstance("SHA-256").digest(store.data).joinToString("") { "%02x".format(it) }
}

internal data class FingMethodPolicy(val owner: String, val name: String, val descriptor: String, val value: Boolean?, val enumOwner: String? = null, val enumField: String? = null)

internal val fingPremiumPolicy = listOf(
    FingMethodPolicy("Lak/a;", "h", "(I)Z", true),
    FingMethodPolicy("Lqm/o;", "e", "()Z", true),
    FingMethodPolicy("Lak/a;", "d", "()Lik/o;", null, "Lik/o;", "c")
)
internal val fingTelemetryPolicy = listOf(
    FingMethodPolicy("Lpe/e;", "E", "()Z", true), // Analytics hard deactivation.
    FingMethodPolicy("Lpe/e;", "F", "()Z", false), // Automatic screen reporting.
    FingMethodPolicy("Lap/l;", "p", "()Z", false), // Crashlytics automatic-collection arbiter.
    FingMethodPolicy("Lpg/c;", "a", "(Z)V", null), // Ignore attempts to re-enable automatic collection.
    FingMethodPolicy("Lcom/google/android/gms/analytics/CampaignTrackingReceiver;", "zzb", "(Landroid/content/Context;)Z", false)
)

internal fun Method.fingDescriptor() = "(" + parameterTypes.joinToString("") + ")" + returnType

/** Whole-body replacement: no stale handlers, old branch targets or dead donor instructions. */
internal fun fingMethodReplacement(method: Method, policy: FingMethodPolicy): ImmutableMethod {
    require(method.definingClass == policy.owner && method.name == policy.name && method.fingDescriptor() == policy.descriptor) {
        "Unsupported Fing method policy target"
    }
    val impl = requireNotNull(method.implementation) { "Missing Fing method body" }
    require(when {
        policy.enumOwner != null -> policy.value == null && policy.enumField != null &&
            method.returnType == policy.enumOwner && impl.registerCount > 0
        policy.value == null -> policy.enumField == null && method.returnType == "V"
        else -> policy.enumField == null && method.returnType == "Z" && impl.registerCount > 0
    })
    val code = if (policy.enumOwner != null) listOf(
        ImmutableInstruction21c(Opcode.SGET_OBJECT, 0,
            ImmutableFieldReference(policy.enumOwner, policy.enumField!!, policy.enumOwner)),
        ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)
    ) else if (policy.value == null) listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)) else listOf(
        ImmutableInstruction11n(Opcode.CONST_4, 0, if (policy.value) 1 else 0),
        ImmutableInstruction11x(Opcode.RETURN, 0)
    )
    return ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType,
        method.accessFlags, method.annotations, method.hiddenApiRestrictions,
        ImmutableMethodImplementation(impl.registerCount, code, emptyList(), emptyList()))
}
