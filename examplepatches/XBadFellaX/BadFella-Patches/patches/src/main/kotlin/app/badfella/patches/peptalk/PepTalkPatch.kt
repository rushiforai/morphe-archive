package app.badfella.patches.peptalk

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22t
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.security.MessageDigest
import org.w3c.dom.Element

@Suppress("unused")
val pepTalkElitePatch = resourcePatch(
    name = "Pep Talk Elite features",
    description = "Enables local Elite features, labels the profile status and silences unavailable-purchase warnings from background product lookup. Keeps authentication and purchase handling; does not grant server-side access or a subscription.",
) {
    compatibleWith(Compatibility(
        name = "Pep Talk", packageName = "com.peptalk.app", apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFFCF4B,
        targets = listOf(AppTarget(version = "2.31.0", versionCode = 276, isExperimental = true)),
    ))
    execute {
        val hashes = mapOf(
            "classes.dex" to "364a9706749523a45a587849ca1a6b20bcc9d701b88af7343dc6aa6859e2b945",
            "classes2.dex" to "6f0aced390fed9492e30d58b230ddd6680a4c68e3c5e2d2b830e1a1bdc77b9a4",
            "classes3.dex" to "db80eebb378966cc5172fb40cbb5b32911187240e33bea5ef1cb5d240415a518",
        )
        check(listApkEntries().filter { Regex("classes\\d*\\.dex").matches(it) }.toSet() == hashes.keys) {
            "Pep Talk DEX inventory changed; use version 2.31.0 build 276"
        }
        // Validate every input before modifying any file.
        val files = hashes.map { (name, expected) -> get(name).also { file ->
            val digest = MessageDigest.getInstance("SHA-256").digest(file.readBytes())
                .joinToString("") { "%02x".format(it) }
            check(digest == expected) { "Unreviewed Pep Talk DEX: $name" }
        } }
        document("res/values/strings.xml").use { doc ->
            val strings = doc.getElementsByTagName("string")
            val label = (0 until strings.length).mapNotNull { strings.item(it) as? Element }
                .single { it.getAttribute("name") == "get_elite" }
            check(label.textContent == "Get Elite") { "Pep Talk profile label changed" }
            label.textContent = "Elite Unlocked by BadFella"
        }
        var changed = 0
        var warnings = 0
        for (file in files) {
            val dex = DexFileFactory.loadDexFile(file, null)
            var modified = false
            val classes = dex.classes.map { cls ->
                if (cls.type !in setOf("Lft/u0;", "Lx0/c;")) return@map cls
                val methods = cls.methods.map { method ->
                    if (cls.type == "Lx0/c;" && method.name == "invoke" &&
                        method.parameterTypes.map { it.toString() } == listOf("Ljava/lang/Object;")) {
                        val implementation = MutableMethodImplementation(checkNotNull(method.implementation))
                        val index = implementation.instructions.indices.single { index ->
                            (implementation.instructions[index] as? ReferenceInstruction)?.reference.toString() ==
                                "Lcom/revenuecat/purchases/PurchasesErrorCode;->NetworkError:Lcom/revenuecat/purchases/PurchasesErrorCode;"
                        }
                        check(implementation.instructions[index + 1].opcode == Opcode.IF_EQ)
                        val address = implementation.instructions.take(index + 1).sumOf { it.codeUnits }
                        val target = implementation.newLabelForAddress(address +
                            (implementation.instructions[index + 1] as OffsetInstruction).codeOffset)
                        // Only background offerings lookup: explicit purchase/restore errors remain intact.
                        implementation.addInstruction(index + 2, BuilderInstruction21c(Opcode.SGET_OBJECT, 2,
                            ImmutableFieldReference("Lcom/revenuecat/purchases/PurchasesErrorCode;",
                                "PurchaseNotAllowedError", "Lcom/revenuecat/purchases/PurchasesErrorCode;")))
                        implementation.addInstruction(index + 3, BuilderInstruction22t(Opcode.IF_EQ, 0, 2, target))
                        warnings++
                        modified = true
                        return@map ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType,
                            method.accessFlags, method.annotations, method.hiddenApiRestrictions, implementation)
                    }
                    if (cls.type != "Lft/u0;") return@map method
                    if (method.name != "b" || method.parameterTypes.isNotEmpty()) return@map method
                    check(method.returnType == "V" && method.accessFlags == 9)
                    val original = checkNotNull(method.implementation)
                    val instructions = original.instructions.toMutableList()
                    val first = instructions.first()
                    check(first.opcode == Opcode.SGET_OBJECT &&
                        (first as OneRegisterInstruction).registerA == 0 &&
                        (first as ReferenceInstruction).reference.toString() == "Lft/u0;->d:Lft/r0;") {
                        "Pep Talk Elite state publisher changed"
                    }
                    // Publish the existing Elite state through the original flow and observers.
                    instructions[0] = ImmutableInstruction21c(Opcode.SGET_OBJECT, 0,
                        ImmutableFieldReference("Lft/s0;", "a", "Lft/s0;"))
                    changed++
                    modified = true
                    ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType,
                        method.accessFlags, method.annotations, method.hiddenApiRestrictions,
                        ImmutableMethodImplementation(original.registerCount, instructions,
                            original.tryBlocks, original.debugItems))
                }
                ImmutableClassDef(cls.type, cls.accessFlags, cls.superclass, cls.interfaces,
                    cls.sourceFile, cls.annotations, cls.fields, methods)
            }
            if (modified) DexPool.writeTo(file.path, ImmutableDexFile(dex.opcodes, classes))
        }
        check(changed == 1) { "Expected one Pep Talk Elite state publisher, found $changed" }
        check(warnings == 1) { "Expected one Pep Talk background offerings error handler" }
    }
}
