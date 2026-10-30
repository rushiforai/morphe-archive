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
        val asset = get("assets/jAAULfkL9PCc9aKk").readBytes()
        check(asset.size == 383850 && asset.sha256() == "80155c3fa0db0bd08326d397961c725cf9c1145e87f4855c8450f2c6ca74ebc6")
        val dex = asset.copyOfRange(356690, 356690 + 12064)
        check(dex.sha256() == "bdd57282142aaba6972e50c36246e53a33b5656f532405b0ca36027e96260184")
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
    description = "Restores the exact TV startup data and lifecycle helpers, AppAuth discovery and token requests, network updates and audio-route events. Retains native VM execution for other protected callbacks.",
    default = true,
) {
    compatibleWith(npoTv)
    dependsOn(originalInput, startupResources, runtimeCallbacks)
    extendWithAll { listOf(Supplier { checkNotNull(embeddedStartup).inputStream() }) }
    execute {
        check(StartupRestoreData.strings.size == 32 && StartupRestoreData.strings.values.sumOf { it.size } == 1437)
        check(StartupRestoreData.methods.size == 9)
        for ((owner, fields) in StartupRestoreData.strings) {
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
        for ((owner, entries) in StartupRestoreData.methods.entries.groupBy { it.key.substringBefore("->") }) {
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
