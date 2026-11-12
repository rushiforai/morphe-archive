package app.badfella.patches.revolution

import app.badfella.patches.util.commitAll
import app.badfella.patches.util.loadDexHandles
import app.badfella.patches.util.resolveUniqueClass
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import java.security.MessageDigest

@Suppress("unused")
val revolutionProPatch = resourcePatch(
    name = "Torrent Search Revolution local Pro",
    description = "Enables the local Pro/ad-free branches, including search, native and banner ads and Pro settings. Preserves startup callbacks. Reviewed on 2.3.5; changed app bytecode requires review. Does not grant a Pro Key subscription or server entitlement.",
) {
    compatibleWith(Compatibility(
        name = "Torrent Search Revolution V2", packageName = "torrent.search.revolutionv2",
        apkFileType = ApkFileType.APKS,
    ))
    execute {
        // Bind instruction offsets to the reviewed code, independently of the version label.
        val reviewed = mapOf(
            "classes3.dex" to "3cf4a0897abe18f18bde0eefc7c1a4ccfdf51c33f8b927c8ca16639efa0ddc22",
            "classes7.dex" to "d46d077ceede0f3a62bb4e0e93bbc2fc3e6083faa364718077d5748115e655d4",
        )
        for ((name, expected) in reviewed) {
            val actual = MessageDigest.getInstance("SHA-256").digest(get(name).readBytes())
                .joinToString("") { "%02x".format(it) }
            check(actual == expected) { "Torrent Search Revolution $name changed; this APK needs review" }
        }
        val search = "Lcom/example/torrentsearchrevolutionv2/presentation/activities/SearchActivity;"
        val targets = mapOf(
            "Lat2;" to mapOf("g" to listOf(11), "onResume" to listOf(27)),
            search to mapOf("C" to listOf(14), "J" to listOf(35), "u" to listOf(16),
                "onResume" to listOf(51, 96)),
            "Ldb;" to mapOf("onClick" to listOf(121)),
            "Lj82;" to mapOf("onCreateView" to listOf(164)),
            "Lo12;" to mapOf("<init>" to listOf(13)),
            "Lo6;" to mapOf("d" to listOf(8), "f" to listOf(10)),
            "Ltp1;" to mapOf("run" to listOf(159)),
        )
        val dexes = loadDexHandles(this)
        var changed = 0
        for ((descriptor, edits) in targets) {
            val (handle, cls) = dexes.resolveUniqueClass(descriptor)
            val seen = mutableSetOf<String>()
            val methods = cls.methods.map { method ->
                val indices = edits[method.name] ?: return@map method
                check(seen.add(method.name)) { "Ambiguous Revolution method: $method" }
                val original = checkNotNull(method.implementation)
                val instructions = original.instructions.toMutableList()
                for (index in indices) {
                    val call = instructions[index - 1]
                    check(call.opcode == Opcode.INVOKE_INTERFACE &&
                        (call as ReferenceInstruction).reference.toString() ==
                        "Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z" &&
                        (call as FiveRegisterInstruction).registerCount == 3 &&
                        instructions[index].opcode == Opcode.MOVE_RESULT) { "Revolution Pro read changed: $method" }
                    val register = (instructions[index] as OneRegisterInstruction).registerA
                    check(register in 0..15)
                    // Same code-unit size: retain branches, exception handlers and the Pro startup callback.
                    instructions[index] = ImmutableInstruction11n(Opcode.CONST_4, register, 1)
                    changed++
                }
                ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType,
                    method.accessFlags, method.annotations, method.hiddenApiRestrictions,
                    ImmutableMethodImplementation(original.registerCount, instructions,
                        original.tryBlocks, original.debugItems))
            }
            check(seen == edits.keys) { "Missing Revolution Pro consumer: $descriptor" }
            handle.replaceClass(cls, ImmutableClassDef(cls.type, cls.accessFlags, cls.superclass, cls.interfaces,
                cls.sourceFile, cls.annotations, cls.fields, methods))
        }
        check(changed == 13) { "Expected thirteen Revolution Pro reads, found $changed" }
        dexes.commitAll()
    }
}
