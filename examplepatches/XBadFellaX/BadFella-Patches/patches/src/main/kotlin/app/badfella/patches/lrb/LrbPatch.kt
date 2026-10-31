package app.badfella.patches.lrb

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.security.MessageDigest
import org.w3c.dom.Element

@Suppress("unused")
val lrbPremiumReadingPatch = resourcePatch(
    name = "LRB premium reading",
    description = "Unlocks locally paywalled LRB articles and issues by making the standard paywall manager report content as unlocked, and brands the settings version banner Patched by BadFella. Keeps account authentication and store billing; does not grant a server subscription.",
) {
    compatibleWith(Compatibility(
        name = "London Review of Books", packageName = "uk.co.lrb.mag", apkFileType = ApkFileType.APK,
        targets = listOf(AppTarget(version = "4.6.0", versionCode = 1790353861, isExperimental = true)),
    ))
    execute {
        val hashes = mapOf(
            "classes.dex" to "47631070894bf149dd5e969cfd2760bfba77b33859f3b4e014747c85b664216b",
            "classes2.dex" to "40625c068f47e4c0b26d7fe51c7c29c83dbd77b0806cf72fa95213d7ee4aae18",
            "classes3.dex" to "3636f39ff4a94eea3d890990f35436f688379dc1024834b8a4f90a6742b7a579",
            "classes4.dex" to "d4915a6692ff5e4f6aef6e16b287fb1e4a83e3dbe817240af3936904a8ec21c9",
            "classes5.dex" to "d44ffa65f89bc3fbb8140f41ac91e508447c3b695240d771f5fb53eb43f69357",
            "classes6.dex" to "467e0495cc3c769620116d04a6ab9958e9040aa7b49feff055580a4f885f8c2a",
            "classes7.dex" to "4baef26a05b1d8d04de4f8b1df292778dcfb368f6ab0f6a61528f5f1f84141b7",
        )
        check(listApkEntries().filter { Regex("classes\\d*\\.dex").matches(it) }.toSet() == hashes.keys) {
            "LRB DEX inventory changed; use version 4.6.0 build 1790353861"
        }
        val files = hashes.map { (name, hash) -> get(name).also { file ->
            val actual = MessageDigest.getInstance("SHA-256").digest(file.readBytes())
                .joinToString("") { "%02x".format(it) }
            check(actual == hash) { "Unreviewed LRB DEX: $name" }
        } }
        val owner = "Lcom/kaldorgroup/pugpigbolt/net/paywall/StandardPaywallManager;"
        val story = "Lcom/kaldorgroup/pugpigbolt/domain/Story;"
        var edited = 0
        for (file in files) {
            val dex = DexFileFactory.loadDexFile(file, null)
            if (dex.classes.none { it.type == owner }) continue
            val classes = dex.classes.map { cls ->
                if (cls.type != owner) cls else {
                    val methods = cls.methods.map { method ->
                        if (method.name != "isLocked") method else {
                            check(method.parameterTypes.toList() == listOf(story) && method.returnType == "Z") {
                                "LRB paywall gate signature changed"
                            }
                            val impl = checkNotNull(method.implementation)
                            check(impl.registerCount == 2 && impl.tryBlocks.isEmpty()) {
                                "LRB paywall gate implementation changed"
                            }
                            val code = impl.instructions.toList()
                            check(code.size == 3
                                && code[0].opcode == Opcode.INVOKE_VIRTUAL
                                && (code[0] as ReferenceInstruction).reference.toString() == "$story->isLocked()Z"
                                && code[1].opcode == Opcode.MOVE_RESULT
                                && (code[1] as OneRegisterInstruction).registerA == 0
                                && code[2].opcode == Opcode.RETURN
                                && (code[2] as OneRegisterInstruction).registerA == 0) {
                                "LRB paywall gate shape changed"
                            }
                            edited++
                            ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType,
                                method.accessFlags, method.annotations, method.hiddenApiRestrictions,
                                ImmutableMethodImplementation(impl.registerCount,
                                    listOf(ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
                                        ImmutableInstruction11x(Opcode.RETURN, 0)),
                                    emptyList(), emptyList()))
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
        check(edited == 1) { "LRB paywall gate edits: $edited" }
        document("res/values/strings.xml").use { doc ->
            val strings = doc.getElementsByTagName("string")
            val message = (0 until strings.length).mapNotNull { strings.item(it) as? Element }
                .single { it.getAttribute("name") == "version_info_message" }
            check(message.textContent.startsWith("Powered by Bolt") &&
                message.textContent.contains("Timeline version")) { "LRB version banner changed" }
            message.textContent = "Patched by BadFella\n" + message.textContent
        }
        // The settings footer renders from the bundled text store, not the resource table.
        val banner = get("assets/bundle/en-gb/strings.xml")
        val bannerText = banner.readBytes().toString(Charsets.UTF_8)
        val stockBanner = "<string name=\"version_info_message\">Powered by Pugpig Bolt %1\$s (%2\$s)\n" +
            "Timeline version %3\$s\nConfiguration version %4\$d</string>"
        check(bannerText.contains(stockBanner)) { "LRB version banner asset changed" }
        val brandedBanner = stockBanner.replace(">Powered by Pugpig Bolt", ">Patched by BadFella\nPowered by Pugpig Bolt")
        banner.writeBytes(bannerText.replace(stockBanner, brandedBanner).toByteArray(Charsets.UTF_8))
    }
}
