package app.morphe.patches.tiktok.shared.discovery

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionFilter
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.*
import com.android.tools.smali.dexlib2.dexbacked.DexBackedClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.google.gson.GsonBuilder
import java.io.File
import java.security.MessageDigest

/** Identical patcher matching semantics, with a reusable evidence record for every TikTok hook. */
open class TikTokFingerprint(
    definingClass: String? = null,
    name: String? = null,
    accessFlags: List<AccessFlags>? = null,
    returnType: String? = null,
    parameters: List<String>? = null,
    filters: List<InstructionFilter>? = null,
    strings: List<String>? = null,
    custom: ((Method, ClassDef) -> Boolean)? = null,
) : Fingerprint(definingClass = definingClass, name = name, accessFlags = accessFlags,
    returnType = returnType, parameters = parameters, filters = filters, strings = strings, custom = custom) {
    init { instances.add(this) }
    companion object {
        private val instances = java.util.Collections.newSetFromMap(java.util.WeakHashMap<TikTokFingerprint, Boolean>())
        private val originalClasses = mutableMapOf<String, ClassDef>()
        context(BytecodePatchContext)
        fun captureOriginalClasses() {
            originalClasses.clear()
            classDefForEach { owner ->
                if (!owner.type.startsWith("Lapp/morphe/")) {
                    // Dex-backed definitions are immutable. Snapshot any definitions already
                    // made mutable by dependencies before other TikTok patches modify them.
                    originalClasses[owner.type] = if (owner is DexBackedClassDef) owner else ImmutableClassDef.of(owner)
                }
            }
        }
        private val obfuscated = Regex("L(?:X|Y)/[^;]+;|Lkotlin/jvm/internal/(?:A[^;]+);?")
        private fun type(value: String) = obfuscated.replace(value, "L?;")
        private fun member(owner: String, name: String) = if (owner.startsWith("Landroid/") ||
            owner.startsWith("Ljava/") || owner.startsWith("Ljavax/")) name else "*"
        private fun tokens(method: Method): List<String> = buildList {
            add(type(method.parameterTypes.joinToString("") + ")" + method.returnType))
            method.implementation?.instructions?.forEach { instruction ->
                val ref = (instruction as? ReferenceInstruction)?.reference
                val detail = when (ref) {
                    is StringReference -> "s:" + ref.string
                    is MethodReference -> "m:" + type(ref.definingClass) + "->" + member(ref.definingClass, ref.name) +
                        "(" + type(ref.parameterTypes.joinToString("")) + ")" + type(ref.returnType)
                    is FieldReference -> "f:" + type(ref.definingClass) + "->" + member(ref.definingClass, ref.name) + ":" + type(ref.type)
                    is TypeReference -> "t:" + type(ref.type)
                    else -> ""
                }
                add(instruction.opcode.name.lowercase().replace('_', '-').replace('/', '-') + " " + detail)
            }
        }
        context(BytecodePatchContext)
        fun writeReport() {
            val entries = instances.toList().sortedBy { it.javaClass.name }.map { fingerprint ->
                val method = fingerprint.originalMethodOrNull
                val original = method?.let { resolved ->
                    originalClasses[resolved.definingClass]?.methods?.firstOrNull {
                        it.name == resolved.name && it.parameterTypes == resolved.parameterTypes &&
                            it.returnType == resolved.returnType
                    }
                }
                val evidence = original?.takeIf { it.implementation != null }?.let(::tokens)
                linkedMapOf<String, Any?>(
                    "hook" to (fingerprint.javaClass.name + ":" + (fingerprint.definingClass ?: "") + ":" + (fingerprint.name ?: "")),
                    "status" to if (method == null) "unresolved-or-optional" else "resolved",
                    "owner" to method?.definingClass, "name" to method?.name,
                    "parameters" to method?.parameterTypes, "returns" to method?.returnType,
                    "registers" to original?.implementation?.registerCount,
                    "declaredStrings" to fingerprint.strings,
                    "tokens" to evidence,
                    "structuralSha256" to evidence?.let {
                        MessageDigest.getInstance("SHA-256").digest(it.joinToString("\n").toByteArray(Charsets.UTF_8))
                            .joinToString("") { byte -> "%02x".format(byte) }
                    },
                )
            }
            File("tiktok-hook-report.json").writeText(GsonBuilder().setPrettyPrinting().create()
                .toJson(mapOf("schema" to 1, "fingerprints" to entries)))
            println("[BlueIT Hook Discovery] recorded ${entries.size} fingerprints in tiktok-hook-report.json")
            originalClasses.clear()
        }
    }
}
