package app.pigfoot.patches.bitwarden

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.security.MessageDigest

internal const val BITWARDEN_PACKAGE = "com.x8bit.bitwarden"
internal const val BITWARDEN_VERSION = "2026.10.1"
internal const val BITWARDEN_CODE = "21986"
internal const val BITWARDEN_SIGNER = "754185cd4cdfde598748b043048bfe59a17264c2"

/** Owner of the privileged-browser validator (CallingAppInfo.validatePrivilegedApp wrapper). */
internal const val BITWARDEN_VALIDATOR = "Lvde;"
/** ValidateOriginResult.Error data objects: not-allowed (reaches the trust prompt) and signature-not-found. */
internal const val BITWARDEN_NOT_ALLOWED = "Lhya;"
internal const val BITWARDEN_SIGNATURE_NOT_FOUND = "Liya;"
/** Walks the Google, community and user-trusted allow lists and falls through only on not-allowed. */
internal const val BITWARDEN_ORIGIN_SOURCE = "Lx47;"

/** Original-class pins (dexlib2 re-serialization SHA-256) of the qualified 2026.10.1 APK. */
internal val bitwardenClassPins = mapOf(
    BITWARDEN_VALIDATOR to "289512e8a36708aab3c29be674aed90a700843e8ff36afbd1770ae2d1c4d7057",
    BITWARDEN_NOT_ALLOWED to "39d57c7644ec3527a29aa1547c6c18e39fe7a6047b2b6e7e5278214a62083e41",
    BITWARDEN_SIGNATURE_NOT_FOUND to "bd740511701a68cad01894cfd108a5d2e4a258a07b2381aba7e266a548cac58e",
    BITWARDEN_ORIGIN_SOURCE to "859621f8766762154d336305194bf5a7f1707a2664a983ac9a5fde1dd668467c"
)

internal fun requireBitwardenTarget(packageName: String?, version: String?, code: String?) {
    require(packageName == BITWARDEN_PACKAGE && version == BITWARDEN_VERSION && code == BITWARDEN_CODE) {
        "Unsupported Bitwarden package/version/build"
    }
}

internal fun bitwardenClassHash(definition: ClassDef): String {
    val pool = DexPool(Opcodes.forDexVersion(39))
    pool.internClass(definition)
    val store = MemoryDataStore()
    pool.writeTo(store)
    return MessageDigest.getInstance("SHA-256").digest(store.data).joinToString("") { "%02x".format(it) }
}

/**
 * The validator's `signature not found` result (IllegalStateException from getOrigin) is the only
 * place a re-signed browser is rejected without a way out. Reading the not-allowed object there
 * instead lets the origin lookup continue to the user-trusted list and show the trust prompt.
 * Exactly one such read must exist in the qualified method; anything else is rejected before mutation.
 */
internal fun trustResignedBrowser(method: MutableMethod, notAllowedField: FieldReference, signatureNotFoundField: FieldReference) {
    require(method.definingClass == BITWARDEN_VALIDATOR && method.returnType == "Lmya;" &&
        method.parameterTypes.map { it.toString() } == listOf("Lnc1;", "Ljava/lang/String;", "Ljava/lang/String;", "Z")) {
        "Unsupported Bitwarden validator method"
    }
    val instructions = requireNotNull(method.implementation) { "Missing Bitwarden validator body" }.instructions.toList()
    val reads = instructions.indices.filter { index ->
        val instruction = instructions[index]
        instruction.opcode == Opcode.SGET_OBJECT && instruction is ReferenceInstruction &&
            (instruction.reference as? FieldReference)?.let { it.definingClass == signatureNotFoundField.definingClass && it.name == signatureNotFoundField.name } == true
    }
    require(reads.size == 1) { "Expected one signature-not-found result in the Bitwarden validator, found ${reads.size}" }
    val register = (instructions[reads.single()] as OneRegisterInstruction).registerA
    method.replaceInstruction(reads.single(),
        "sget-object v$register, ${notAllowedField.definingClass}->${notAllowedField.name}:${notAllowedField.type}")
}
