package app.pigfoot.patches.shared.pairip

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.security.MessageDigest

internal const val PAIRIP_LICENSE_OWNER = "Lcom/pairip/licensecheck/LicenseClient;"

/** App adapters own the qualified original class pin and DEX writer version.
 * Prepares a copy only; nothing in the supplied class is mutated on failure.
 * This is a Java startup-entry skip, not native VM or Play Integrity attestation.
 */
internal fun preparePairipLicenseSkip(original: ClassDef, expectedClassHash: String, dexVersion: Int): MutableMethod {
    require(original.type == PAIRIP_LICENSE_OWNER && expectedClassHash.matches(Regex("[0-9a-f]{64}"))) {
        "Unsupported Pairip license class/pin"
    }
    val pool = DexPool(Opcodes.forDexVersion(dexVersion))
    pool.internClass(original)
    val store = MemoryDataStore()
    pool.writeTo(store)
    val hash = MessageDigest.getInstance("SHA-256").digest(store.data).joinToString("") { "%02x".format(it) }
    require(hash == expectedClassHash) { "Unsupported or already modified Pairip license class" }
    val matches = original.methods.filter { it.name == "checkLicense" &&
        it.parameterTypes == listOf("Landroid/content/Context;") && it.returnType == "V" }
    require(matches.size == 1) { "Missing or ambiguous Pairip license entry" }
    val method = matches.single()
    require(method.accessFlags == 9 && method.implementation != null) { "Unsupported Pairip license entry shape" }
    require(method.implementation!!.instructions.firstOrNull()?.opcode != com.android.tools.smali.dexlib2.Opcode.RETURN_VOID) {
        "Pairip license entry already disabled"
    }
    return MutableMethod(method).also { it.addInstructions(0, "return-void") }
}
