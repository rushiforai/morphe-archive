package app.template.patches.wemuslim.misc.encryption

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_WEMUSLIM
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val ATHAN_ENCRYPTION = "Lcom/common/support/encryption/AthanEncryption;"

// The stock libagora-ey.so refuses to load in a re-signed APK: AthanEncryption.<clinit> throws,
// KvInitializer then dies in a background thread and the process exits. The library only provides
// these string getters; its values were dumped from the developer-signed 3.5.4 build through the
// JNI methods. The static initializer is skipped and every Java call site is replaced with the
// value, so the native library is never needed. k11 (long) has no call site in this version.
//
// k27 is a PKCS#8 RSA private key used by the Yami mini-program signature check. It is
// deliberately not reproduced here: the call site is replaced with an empty key, the check fails
// closed, and the rest of the app (prayer times, Qibla, Quran/Hadith) is unaffected. Users who
// need a signed Yami mini-program must use the stock app.
private val encryptionValues = mapOf(
    "iv" to "AreyoumySnowman?",
    "k1" to "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjTRuet5L2hQv0WKJl5u+u0EQ7jX/kWCvZ/MniA+QtoHc8x6UV6HOWMCZqk/+IOSWlm+wb5STghfnWd8XU/TO6UTY4XCW0NRplGGuiE93C+gh7TG/iHyye+oL1a8uvBPiJtZorfpXIjxkiX0Q9XiXlThwNZM9DAnmbKl2Ipt/XG+I5VWUVSxoWHi4PIxRp7HzP1YPyMR+WrHK9/po8pbLDkHJifIplitOPQ7LubbO35yV99Y1U7CORmptQSIfee1c1yGjb2XRXtmZnYweB2+7Tgltaa4fDUvY8KjjPH7RlXwXmlRnkoUqpItWkWZulMLTMo+d6J587hA8/eQQzo4EwQIDAQAB",
    "k2" to "65<KF-R>0@PZ!aKQYWCAC9%6)IE=gba5",
    "k3" to "cwN425K71b9a4b10E58dUfls86fQa60P",
    "k4" to "",
    "k5" to "7773558",
    "k6" to "56f37712c802435d8b7289ad26238b4a",
    "k7" to "93fg^bZcr2T}*RX?qjKTAoAtqv@]xHu}",
    "k8" to "SXxcrcc7oqnPXV9ycDerVP",
    "k9" to "",
    "k10" to "",
    "k13" to "+MbQeShVmYq3t6w9z\$C&F)J@NcRfUjWn",
    "k14" to "63c4f499ba6a5259c4ebb88a",
    "k15" to "",
    "k16" to "",
    "k17" to "eZkJygE4oh/0lhV3GGPg2a1tAawUKiZP6LSffTUprxlrAFcxEVzmW3r/7Wz2K7sT",
    "k18" to "MIIDLzCCAhegAwIBAgIBMDANBgkqhkiG9w0BAQUFADAyMQswCQYDVQQGEwJDTjELMAkGA1UECwwCU00xFjAUBgNVBAMMDWUuaXNodW1laS5jb20wHhcNMjIwNDE4MTEzNjQyWhcNNDIwNDEzMTEzNjQyWjAyMQswCQYDVQQGEwJDTjELMAkGA1UECwwCU00xFjAUBgNVBAMMDWUuaXNodW1laS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCKQWvoUZR+Xrn8vWrsvnud/0u4WqNL83bcDn6rPzaUElkZrkaqRx9km5zLDYSQ7oqLHlutEo8Cz8BwKyed0QA5080XKURFd2djq8GKVEnzNizIOnvkSl2BSKuN/aHWvroCDulDmv9BW0SQFxW6QAvpkgyDwQJsPzGq6Gg/WZmcFbjX0Lj9ZdO2u7nhPENmkEGKfzHmeUVHOTWskl+6tos8ROr/Z4Tov3y8Ro851ZV4Ong1/VdRJUi4yJKy5mVYChBiww89GqsViZqUt/VoydNy3ukzp/wwmCo0eMguL+E7LHEDVogWXxf5vDRr++X5+0MpaxLwc11HV/6CTfo6HZvFAgMBAAGjUDBOMB0GA1UdDgQWBBRRCMdLqRsTTaZxCzBXCJadGbca5TAfBgNVHSMEGDAWgBRRCMdLqRsTTaZxCzBXCJadGbca5TAMBgNVHRMEBTADAQH/MA0GCSqGSIb3DQEBBQUAA4IBAQBjfWgpcN3r9ZXa58I955J/cDVdsqUqAYaDoTT72RdjfDPp86GkGh1ZSVblmTYnsP+lvuV2Btk9YMkku4A7MhTmj1fgxnIzjuz39tH2YsyEEYIgDcibdAGYBEvkXmiBWdCxt8TpxnSYUDxO6cHVA8gd/zlYkFu9UrKeKHI2uXJordhl+qbQkUGWP7FQ53alsmWyVi3ckoVPdgSDnqGpjdxqnOSiBCZ5VEz24/nURqokEhFtkUZCMepe3Omp58E4cST5W2ej9CnjzvyLmFVygsbSx+3CH+q0teGAnepFJyv1u08syv3J7gOg/hOW4dOrJvtIEQeGDooHDge2NW0yLnA5",
    "k19" to "7291e8f7a70ce204a2c2382de4256c7f",
    "k20" to "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBALM95iqgnEURnctzJP/nYS53lMG75RGo\n2r7mnhD5XP8+x6bHS2Do8O5ycZSp7faJ4HoEfevPJWGOhbzTEJM+3NUCAwEAAQ==",
    "k21" to "925906699745-gqq5o2nosortc7e97q5t9kroiruvrooo.apps.googleusercontent.com",
    "k22" to "rfw62hb1kjr4",
    "k23" to "0a6843014c294a05866bcfbc00539ddd",
    "k24" to "40000546",
    "k25" to "WrMvwCzseoELCIN8",
    "k26" to "p2GR5Mp8xS3ZpVtO",
    "k27" to "",
    "k28" to "1:925906699745:android:89e990b51c26094182bea0",
    "k29" to "muslim-376506",
    "k30" to "AIzaSyDq3pQfR6tWozuv1mDJO6tiVRBc7iddqTM",
)

private fun String.asSmaliString(): String = buildString {
    append('"')
    for (char in this@asSmaliString) {
        when (char) {
            '\\' -> append("\\\\")
            '"' -> append("\\\"")
            '\n' -> append("\\n")
            '\r' -> append("\\r")
            '\t' -> append("\\t")
            else -> append(char)
        }
    }
    append('"')
}

private fun registerWidth(type: CharSequence): Int = when (type.toString()) {
    "J", "D" -> 2
    else -> 1
}

private fun registerName(method: Method, register: Int): String {
    val parameterRegisters = method.parameterTypes.sumOf(::registerWidth) +
        if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1
    val localCount = method.implementation!!.registerCount - parameterRegisters
    return if (register < localCount) "v$register" else "p${register - localCount}"
}

private fun BytecodePatchContext.patchNativeKeyCalls() {
    val callSiteTypes = mutableSetOf<String>()
    classDefForEach { classDef ->
        if (classDef.type == ATHAN_ENCRYPTION) return@classDefForEach
        classDef.methods.forEach { method ->
            val implementation = method.implementation ?: return@forEach
            if (implementation.instructions.any { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    reference?.definingClass == ATHAN_ENCRYPTION
                }
            ) {
                callSiteTypes += classDef.type
            }
        }
    }

    var replaced = 0
    callSiteTypes.forEach { type ->
        mutableClassDefBy(type).methods.forEach { method ->
            val implementation = method.implementation ?: return@forEach
            val instructions = implementation.instructions.toList()
            val replacements = mutableListOf<Pair<Int, String>>()
            var index = 0
            while (index < instructions.size - 1) {
                val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
                if (reference?.definingClass != ATHAN_ENCRYPTION) {
                    index++
                    continue
                }
                if (reference.returnType != "Ljava/lang/String;" || reference.parameterTypes.isNotEmpty()) {
                    throw PatchException(
                        "Unsupported AthanEncryption.${reference.name}(${reference.parameterTypes.joinToString()})" +
                            "${reference.returnType} in ${method.definingClass}->${method.name}",
                    )
                }

                val value = encryptionValues[reference.name]
                    ?: throw PatchException("No dumped value for AthanEncryption.${reference.name}()")
                val moveResult = instructions[index + 1]
                if (moveResult.opcode != Opcode.MOVE_RESULT_OBJECT ||
                    moveResult !is OneRegisterInstruction
                ) {
                    throw PatchException(
                        "AthanEncryption.${reference.name}() in ${method.definingClass}->${method.name} " +
                            "is not followed by move-result-object",
                    )
                }

                val register = registerName(method, moveResult.registerA)
                replacements += index to "const-string $register, ${value.asSmaliString()}"
                index += 2
            }

            replacements.asReversed().forEach { (instructionIndex, code) ->
                method.removeInstructions(instructionIndex, 2)
                method.addInstructions(instructionIndex, code)
            }
            replaced += replacements.size
        }
    }

    if (replaced == 0) {
        throw PatchException("No AthanEncryption key call sites found")
    }
}

@Suppress("unused")
val bypassNativeEncryptionPatch = bytecodePatch(
    name = "Fix native encryption check",
    description = "Fixes the app not starting after patching.",
) {
    compatibleWith(COMPATIBILITY_WEMUSLIM)

    execute {
        val athan = mutableClassDefBy(ATHAN_ENCRYPTION)
        val clinit = athan.methods.firstOrNull {
            it.name == "<clinit>" && it.returnType == "V" && it.parameterTypes.isEmpty()
        } ?: throw PatchException("AthanEncryption.<clinit> not found")
        // The initializer only loads libagora-ey and its ReLinker fallbacks.
        clinit.returnEarly()

        patchNativeKeyCalls()
    }
}
