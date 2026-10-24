package app.morphe.patches.chmate

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val HTTPS = "Lapp/morphe/extension/chmate/HttpsTransport;"

/** Match OkHttp by its builder contract, including obfuscated and bundled copies. */
internal fun BytecodePatchContext.patchHttpsTransport() {
    var builders = 0
    var connections = 0
    classDefForEach { classDef ->
        // The extension wrappers must retain their actual java.net calls.
        if (classDef.type == HTTPS) return@classDefForEach
        val mutableClass by lazy { mutableClassDefBy(classDef) }
        classDef.methods.forEach methodLoop@ { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@methodLoop
            val strings = instructions.mapNotNull {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
            }
            if ("scheme == null" in strings && "host == null" in strings
                && method.parameterTypes.isEmpty()
                && !AccessFlags.STATIC.isSet(method.accessFlags)
                && method.returnType.startsWith("L")
            ) {
                // build() reads scheme first, then credentials/host, then its only int field: port.
                val scheme = instructions.firstNotNullOfOrNull { instruction ->
                    ((instruction as? ReferenceInstruction)?.reference as? FieldReference)
                        ?.takeIf { instruction.opcode == Opcode.IGET_OBJECT
                            && it.definingClass == classDef.type && it.type == "Ljava/lang/String;" }
                } ?: error("HTTPS: missing OkHttp scheme in ${classDef.type}")
                // Both Kotlin and Java builders null-check scheme and host.
                // Credential/fragment strings must never identify the endpoint.
                val host = instructions.withIndex().firstNotNullOfOrNull { (index, instruction) ->
                    ((instruction as? ReferenceInstruction)?.reference as? FieldReference)
                        ?.takeIf { instruction.opcode == Opcode.IGET_OBJECT
                            && it.definingClass == classDef.type && it.type == "Ljava/lang/String;"
                            && it.name != scheme.name
                            && instructions.getOrNull(index + 1)?.opcode in listOf(Opcode.IF_EQZ, Opcode.IF_NEZ) }
                } ?: error("HTTPS: missing checked OkHttp host in ${classDef.type}")
                val port = classDef.instanceFields.singleOrNull { it.type == "I" }
                    ?: error("HTTPS: ambiguous OkHttp port in ${classDef.type}")
                check(method.implementation!!.registerCount >= 3) {
                    "HTTPS: insufficient builder locals in ${classDef.type}"
                }
                val target = mutableClass.findMutableMethodOf(method)
                target.addInstructionsWithLabels(
                    0,
                    """
                        move-object/from16 v1, p0
                        iget-object v0, v1, $host
                        iget v2, v1, ${classDef.type}->${port.name}:I
                        invoke-static { v0, v2 }, $HTTPS->isHttpUpgradeExempt(Ljava/lang/String;I)Z
                        move-result v0
                        # Small SDK builders alias p0 with v2. Restore the receiver
                        # before either branch resumes the original implementation.
                        move-object/16 p0, v1
                        if-nez v0, :haiagaru_original_https_builder
                        iget-object v0, v1, $scheme
                        invoke-static { v0 }, $HTTPS->shouldUpgrade(Ljava/lang/String;)Z
                        move-result v0
                        if-eqz v0, :haiagaru_original_https_builder
                        const-string v0, "https"
                        iput-object v0, v1, $scheme
                        iget v0, v1, ${classDef.type}->${port.name}:I
                        invoke-static { v0 }, $HTTPS->upgradePort(I)I
                        move-result v0
                        iput v0, v1, ${classDef.type}->${port.name}:I
                    """,
                    ExternalLabel("haiagaru_original_https_builder", target.implementation!!.instructions.first()),
                )
                builders++
                return@methodLoop
            }

            // Replacing the invocation keeps the receiver and arguments unchanged, including
            // aliases reused by the caller. Proxy selection and returned connection type survive.
            instructions.forEachIndexed { index, instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@forEachIndexed
                if (reference.definingClass != "Ljava/net/URL;") return@forEachIndexed
                val parameters = reference.parameterTypes.map(CharSequence::toString)
                val supported = when (reference.name) {
                    "openConnection" -> parameters.isEmpty() || parameters == listOf("Ljava/net/Proxy;")
                    "openStream" -> parameters.isEmpty()
                    else -> false
                }
                if (!supported) return@forEachIndexed
                val (opcode, registers) = when (instruction) {
                    is FiveRegisterInstruction -> {
                        val registers = listOf(instruction.registerC, instruction.registerD,
                            instruction.registerE, instruction.registerF, instruction.registerG)
                            .take(instruction.registerCount).joinToString(", ") { "v$it" }
                        "invoke-static" to "{ $registers }"
                    }
                    is RegisterRangeInstruction -> "invoke-static/range" to
                        "{ v${instruction.startRegister} .. v${instruction.startRegister + instruction.registerCount - 1} }"
                    else -> error("HTTPS: unsupported URL invocation")
                }
                mutableClass.findMutableMethodOf(method).replaceInstruction(
                    index,
                    "$opcode $registers, $HTTPS->${reference.name}(Ljava/net/URL;${parameters.joinToString("")})${reference.returnType}",
                )
                connections++
            }
        }
    }
    check(builders > 0) { "HTTPS: no OkHttp URL builder found" }
    check(connections > 0) { "HTTPS: no java.net connection calls found" }
    println("HTTPS transport: $builders OkHttp builders, $connections java.net calls")
}
