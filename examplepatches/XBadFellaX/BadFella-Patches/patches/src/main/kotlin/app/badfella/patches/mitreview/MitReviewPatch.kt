package app.badfella.patches.mitreview

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction20t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.security.MessageDigest

@Suppress("unused")
val mitReviewReadingMeterPatch = resourcePatch(
    name = "MIT Tech Review reading meter",
    description = "Removes local article gates and the remaining-views banner, and enables the app's ad-free flag for native and article ads. Keeps account authentication; does not grant a server subscription.",
) {
    compatibleWith(Compatibility(
        name = "MIT Technology Review", packageName = "com.technologyreview.mit",
        apkFileType = ApkFileType.APKM, appIconColor = 0xFFCC00,
        targets = listOf(AppTarget(version = "3.0", versionCode = 1787908458, isExperimental = false)),
    ))
    execute {
        val hashes = mapOf(
            "classes.dex" to "b1f75707d84783c4df3d9b60d700c6fcb7ea4fbff9d0a49490af4f560fdc94bf",
            "classes2.dex" to "21f36cf693026bf03c2a682f23234b8d9e20db3f70702a1a7234b6628e8c6cde",
            "classes3.dex" to "8c4a562b87215ad629499dfdc3f125da18710be4738280a38bceef6bf8f586c9",
            "classes4.dex" to "dce7a0447296ce52a3b9a823c11877eac5be1576052a42f9f862dbc48045685b",
            "classes5.dex" to "d66bc47cdefc08b551985e9c984677a0e2723df3596efe54874423d6ad2a6941",
            "classes6.dex" to "1add858778a2dc1b67c0d765efab6cee2a46fda5b697a51de803a8a0c2aba107",
            "classes7.dex" to "b3abb534340ce53f1937b9bec2734a2f905fdbc51a48a4ab5497a3a0172133a8",
        )
        check(listApkEntries().filter { Regex("classes\\d*\\.dex").matches(it) }.toSet() == hashes.keys) {
            "MIT Tech Review DEX inventory changed"
        }
        val files = hashes.map { (name, hash) -> get(name).also { file ->
            val actual = MessageDigest.getInstance("SHA-256").digest(file.readBytes())
                .joinToString("") { "%02x".format(it) }
            check(actual == hash) { "Unreviewed MIT Tech Review DEX: $name" }
        } }
        val owner = "Lcom/kaldorgroup/pugpigbolt/net/paywall/MeteredPaywallManager;"
        val auth = "Lcom/kaldorgroup/pugpigbolt/net/Auth;"
        val story = "Lcom/kaldorgroup/pugpigbolt/domain/Story;"
        val edits = mutableSetOf<String>()
        for (file in files) {
            val dex = DexFileFactory.loadDexFile(file, null)
            if (dex.classes.none { it.type == owner || it.type == auth }) continue
            val classes = dex.classes.map { cls ->
                if (cls.type != owner && cls.type != auth) cls else {
                    val methods = cls.methods.map { method ->
                        val adFlag = cls.type == auth && method.name == "userInfo"
                        if (!adFlag && (cls.type != owner || method.name !in setOf("isLocked", "read", "getBannerFragment"))) method else {
                            val params = if (method.name == "read") listOf(story, "Landroidx/lifecycle/Lifecycle;", "Ljava/lang/Runnable;")
                                else if (adFlag) emptyList() else listOf(story)
                            check(method.parameterTypes.map { it.toString() } == params)
                            check(edits.add(method.name)) { "Duplicate MIT Tech Review target: ${method.name}" }
                            val impl = checkNotNull(method.implementation)
                            val replacement = if (adFlag) {
                                check(method.returnType == "Ljava/util/Map;" && impl.registerCount == 6 && impl.tryBlocks.isEmpty())
                                val code = impl.instructions.toList()
                                check(code.count { it.opcode == Opcode.RETURN_OBJECT } == 1)
                                check((code.last() as OneRegisterInstruction).registerA == 0)
                                val returnAddress = code.dropLast(1).sumOf { it.codeUnits }
                                var address = 0
                                code.forEach { instruction ->
                                    if (instruction is OffsetInstruction) check(address + instruction.codeOffset < returnAddress)
                                    address += instruction.codeUnits
                                }
                                // Decorate the existing result; preserve real identity, tokens and subscription state.
                                code.dropLast(1) + listOf(
                                    ImmutableInstruction21c(Opcode.CONST_STRING, 1,
                                        ImmutableStringReference("http://schema.pugpig.com/attribute/disable_adverts")),
                                    ImmutableInstruction21c(Opcode.CONST_STRING, 2, ImmutableStringReference("true")),
                                    ImmutableInstruction35c(Opcode.INVOKE_INTERFACE, 3, 0, 1, 2, 0, 0,
                                        ImmutableMethodReference("Ljava/util/Map;", "put",
                                            listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), "Ljava/lang/Object;")),
                                    code.last(),
                                )
                            } else if (method.name != "getBannerFragment") {
                                check(method.returnType == if (method.name == "read") "V" else "Z")
                                val code = impl.instructions.toList()
                                check(code.count { it.opcode == Opcode.IF_LT } == 1)
                                var changed = 0
                                code.map { instruction ->
                                    if (method.name == "read" && instruction.opcode == Opcode.IF_LT) {
                                        val offset = (instruction as OffsetInstruction).codeOffset
                                        check(offset == 7)
                                        changed++
                                        ImmutableInstruction20t(Opcode.GOTO_16, offset)
                                    } else if (method.name == "isLocked" && instruction.opcode == Opcode.CONST_4 &&
                                        (instruction as OneRegisterInstruction).registerA == 2 &&
                                        (instruction as NarrowLiteralInstruction).narrowLiteral == 1) {
                                        changed++
                                        // The live feed's fifth item can use the subscriber-only "excluded" meter.
                                        ImmutableInstruction11n(Opcode.CONST_4, 2, 0)
                                    } else instruction
                                }.also { check(changed == 1) }
                            } else {
                                check(method.returnType == "Landroidx/fragment/app/Fragment;")
                                listOf(ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
                                    ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0))
                            }
                            ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType,
                                method.accessFlags, method.annotations, method.hiddenApiRestrictions,
                                ImmutableMethodImplementation(impl.registerCount, replacement,
                                    if (method.name != "getBannerFragment") impl.tryBlocks else emptyList(),
                                    if (method.name != "getBannerFragment") impl.debugItems else emptyList()))
                        }
                    }
                    ImmutableClassDef(cls.type, cls.accessFlags, cls.superclass, cls.interfaces, cls.sourceFile,
                        cls.annotations, cls.fields, methods)
                }
            }
            val output = file.resolveSibling(file.name + ".tmp")
            try {
                DexPool.writeTo(output.absolutePath, ImmutableDexFile(dex.opcodes, classes))
                output.copyTo(file, overwrite = true)
            } finally { output.delete() }
        }
        check(edits == setOf("isLocked", "read", "getBannerFragment", "userInfo")) { "MIT Tech Review targets changed: $edits" }
    }
}
