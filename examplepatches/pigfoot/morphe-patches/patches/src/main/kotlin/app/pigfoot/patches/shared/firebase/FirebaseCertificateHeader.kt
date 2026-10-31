package app.pigfoot.patches.shared.firebase

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import java.util.Locale

/** App-owned, qualified contract; this is not a universal Firebase fingerprint. */
internal data class FirebaseCertificateHeaderContract(
    val methodId: String,
    val identityOwner: String,
    val packageGetter: String,
    val certificateGetter: String,
    val registerCount: Int,
    val identityRegister: Int,
    val connectionRegister: Int,
    val keyRegister: Int,
    val valueRegister: Int,
    val nextHeader: String
)

/** Validate every site before inserting one uppercase SHA-1 constant. */
internal fun restoreFirebaseCertificateHeader(
    method: MutableMethod,
    certificateSha1: String,
    contract: FirebaseCertificateHeaderContract
) {
    val id = method.definingClass + "->" + method.name + "(" + method.parameterTypes.joinToString("") + ")" + method.returnType
    require(id == contract.methodId) { "Unsupported Firebase header owner" }
    require(certificateSha1.matches(Regex("[0-9a-fA-F]{40}"))) { "Invalid Firebase certificate SHA-1" }
    val impl = requireNotNull(method.implementation) { "Missing Firebase header implementation" }
    val code = impl.instructions.toList()
    fun reference(index: Int) = (code.getOrNull(index) as? ReferenceInstruction)?.reference?.toString()
    fun unique(value: String): Int {
        val sites = code.indices.filter { reference(it) == value }
        require(sites.size == 1) { "Missing or ambiguous Firebase header site" }
        return sites.single()
    }
    val registers = listOf(contract.identityRegister, contract.connectionRegister, contract.keyRegister, contract.valueRegister)
    require(registers.all { it in 0..15 && it < contract.registerCount } &&
        setOf(contract.connectionRegister, contract.keyRegister, contract.valueRegister).size == 3) {
        "Invalid Firebase header register contract"
    }
    require(impl.registerCount == contract.registerCount && code.none {
        (it as? ReferenceInstruction)?.reference?.toString()?.equals(certificateSha1, true) == true
    }) { "Unsupported or already modified Firebase headers" }
    val cert = unique("X-Android-Cert")
    val pkg = unique("X-Android-Package")
    val setHeader = "Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V"
    fun header(index: Int, getter: String) {
        val key = code[index] as? OneRegisterInstruction
        val result = code.getOrNull(index - 1) as? OneRegisterInstruction
        val source = code.getOrNull(index - 2) as? FiveRegisterInstruction
        val call = code.getOrNull(index + 1) as? FiveRegisterInstruction
        require(code[index].opcode == Opcode.CONST_STRING && key?.registerA == contract.keyRegister &&
            code[index - 1].opcode == Opcode.MOVE_RESULT_OBJECT && result?.registerA == contract.valueRegister &&
            code[index - 2].opcode == Opcode.INVOKE_VIRTUAL && reference(index - 2) == "${contract.identityOwner}->$getter()Ljava/lang/String;" &&
            source?.registerCount == 1 && source.registerC == contract.identityRegister &&
            code[index + 1].opcode == Opcode.INVOKE_VIRTUAL && reference(index + 1) == setHeader &&
            call?.registerCount == 3 && call.registerC == contract.connectionRegister &&
            call.registerD == contract.keyRegister && call.registerE == contract.valueRegister) {
            "Unsupported Firebase header call/register contract"
        }
    }
    require(pkg >= 2 && cert >= pkg + 5 && cert + 2 < code.size) { "Unsupported Firebase header order" }
    header(pkg, contract.packageGetter)
    header(cert, contract.certificateGetter)
    require(code[cert + 2].opcode == Opcode.CONST_STRING && reference(cert + 2) == contract.nextHeader &&
        (code[cert + 2] as OneRegisterInstruction).registerA == contract.valueRegister) {
        "Unsupported Firebase header register lifetime"
    }
    impl.addInstruction(cert + 1, BuilderInstruction21c(Opcode.CONST_STRING, contract.valueRegister,
        ImmutableStringReference(certificateSha1.uppercase(Locale.ROOT))))
}
