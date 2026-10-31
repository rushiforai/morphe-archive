package patches.npostarttv

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import java.security.MessageDigest
import java.util.function.Supplier
import patches.atv.exact

private var embeddedStartup: ByteArray? = null
private fun ByteArray.sha256() = MessageDigest.getInstance("SHA-256").digest(this)
    .joinToString("") { "%02x".format(it.toInt() and 255) }

private val startupResources = rawResourcePatch {
    dependsOn(originalInput)
    execute {
        val phone = packageMetadata.isNpoPhone
        val asset = get(if (phone) "assets/koMIKlhio0icA0mv" else "assets/jAAULfkL9PCc9aKk").readBytes()
        check(asset.size == (if (phone) 393436 else 383850) && asset.sha256() ==
            (if (phone) "8474b33b68a7c9493c0f9089dff7af382d013066e1a6d65ff892c2e28d9bc50c"
             else "80155c3fa0db0bd08326d397961c725cf9c1145e87f4855c8450f2c6ca74ebc6"))
        val offset = if (phone) 244836 else 356690
        val dex = asset.copyOfRange(offset, offset + if (phone) 17472 else 12064)
        check(dex.sha256() == (if (phone) "5a219dd911eb6bfc7123943b9f575d8f5a576f8a3e87243965c4f6ef82a5c44c"
            else "bdd57282142aaba6972e50c36246e53a33b5656f532405b0ca36027e96260184"))
        embeddedStartup = dex
    }
}

private fun literal(value: String): String = buildString {
    append('"')
    for (char in value) when (char) {
        '\\' -> append("\\\\")
        '"' -> append("\\\"")
        '\n' -> append("\\n")
        '\r' -> append("\\r")
        '\t' -> append("\\t")
        else -> if (char.code < 32) append("\\u%04x".format(char.code)) else append(char)
    }
    append('"')
}

context(context: BytecodePatchContext)
private fun initializer(owner: String, registers: Int, code: String) {
    val cls = context.mutableClassDefBy(owner)
    check(cls.methods.none { it.name == "<clinit>" }) { "Unexpected TV startup initializer: $owner" }
    val method = MutableMethod(ImmutableMethod(owner, "<clinit>", emptyList(), "V",
        AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value, null, null,
        ImmutableMethodImplementation(registers, emptyList(), emptyList(), emptyList())))
    method.addInstructions(0, code)
    check(cls.methods.add(method))
}

private fun classConstant(type: String) = when (type) {
    "Z" -> "sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;"
    "B" -> "sget-object v3, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;"
    "C" -> "sget-object v3, Ljava/lang/Character;->TYPE:Ljava/lang/Class;"
    "S" -> "sget-object v3, Ljava/lang/Short;->TYPE:Ljava/lang/Class;"
    "I" -> "sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;"
    "J" -> "sget-object v3, Ljava/lang/Long;->TYPE:Ljava/lang/Class;"
    "F" -> "sget-object v3, Ljava/lang/Float;->TYPE:Ljava/lang/Class;"
    "D" -> "sget-object v3, Ljava/lang/Double;->TYPE:Ljava/lang/Class;"
    else -> "const-class v3, $type"
}

internal val startupCompatibility = bytecodePatch(
    name = "Fix PairIP startup",
    description = "Restores build-specific startup data, lifecycle helpers, authentication and media/network callbacks. Preserves genuine token and entitlement checks and retains other protected native callbacks.",
    default = true,
) {
    compatibleWith(npoTv, npoPhone)
    dependsOn(originalInput, startupResources, runtimeCallbacks)
    extendWithAll { listOf(Supplier { checkNotNull(embeddedStartup).inputStream() }) }
    execute {
        val phone = packageMetadata.isNpoPhone
        val strings = if (phone) PhoneStartupRestoreData.strings else StartupRestoreData.strings
        val methods = if (phone) PhoneStartupRestoreData.methods else StartupRestoreData.methods
        check(strings.size == 32 && strings.values.sumOf { it.size } == (if (phone) 1494 else 1437))
        check(methods.size == if (phone) 10 else 9)
        for ((owner, fields) in strings) {
            val cls = mutableClassDefBy(owner)
            val declared = cls.fields.filter { it.type == "Ljava/lang/String;" && it.accessFlags and AccessFlags.STATIC.value != 0 }
            check(declared.map { it.name }.toSet() == fields.keys) { "Changed TV startup String fields: $owner" }
            initializer(owner, 1, buildString {
                for ((name, value) in fields) {
                    append("const-string v0, ${literal(value)}\n")
                    append("sput-object v0, $owner->$name:Ljava/lang/String;\n")
                }
                append("return-void")
            })
        }
        for ((owner, entries) in methods.entries.groupBy { it.key.substringBefore("->") }) {
            val declared = mutableClassDefBy(owner).fields.filter { it.type == "Ljava/lang/reflect/Method;" }
            check(declared.map { it.name }.toSet() == entries.map { it.key.substringAfter("->") }.toSet())
            initializer(owner, 5, buildString {
                for ((field, restore) in entries) {
                    append("const-class v0, ${restore.helper}\n")
                    append("const-string v1, ${literal(restore.name)}\n")
                    append("const/16 v2, ${restore.parameters.size}\nnew-array v2, v2, [Ljava/lang/Class;\n")
                    for ((index, type) in restore.parameters.withIndex()) {
                        append(classConstant(type)).append('\n')
                        append("const/16 v4, $index\naput-object v3, v2, v4\n")
                    }
                    append("invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;\n")
                    append("move-result-object v0\nsput-object v0, $field:Ljava/lang/reflect/Method;\n")
                }
                append("return-void")
            })
        }
        exact("Lcom/pairip/SignatureCheck;", "verifyIntegrity(Landroid/content/Context;)V", 3, 41).addInstructions(0, "return-void")
        exact("Lcom/pairip/StartupLauncher;", "launch()V", 3, 17).addInstructions(0, "return-void")
        // VMRunner.<clinit>/invoke remain original. Two functional callers are restored
        // through runtimeCallbacks; no global VM no-op or receiver suppression is used.
    }
}
