package app.badfella.patches.emby

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.security.MessageDigest
import org.w3c.dom.Element

private val emby = Compatibility(
    name = "Emby", packageName = "com.mb.android", apkFileType = ApkFileType.APK,
    appIconColor = 0x52B54B, targets = listOf(AppTarget(version = "3.5.72")),
)

private fun ByteArray.sha256() = MessageDigest.getInstance("SHA-256")
    .digest(this).joinToString("") { "%02x".format(it) }

private fun replaceOnce(text: String, pattern: Regex, replacement: String): String {
    check(pattern.findAll(text).count() == 1) { "Emby asset anchor changed: ${pattern.pattern}" }
    return pattern.replace(text, replacement)
}

private fun withoutTelemetry(method: Method): Method {
    check(method.returnType == "V")
    val instructions = if (method.name == "<init>") {
        check(method.parameterTypes.map { it.toString() } == listOf("Landroid/content/Context;"))
        listOf(
            ImmutableInstruction35c(Opcode.INVOKE_DIRECT, 1, 0, 0, 0, 0, 0,
                ImmutableMethodReference("Ljava/lang/Object;", "<init>", emptyList(), "V")),
            ImmutableInstruction10x(Opcode.RETURN_VOID),
        )
    } else listOf(ImmutableInstruction10x(Opcode.RETURN_VOID))
    val registers = 1 + method.parameterTypes.sumOf { if (it.toString() in setOf("J", "D")) 2 else 1 }
    return ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType,
        method.accessFlags, method.annotations, method.hiddenApiRestrictions,
        ImmutableMethodImplementation(registers, instructions, emptyList(), emptyList()))
}

@Suppress("unused")
val embyUnlockPatch = resourcePatch(
    name = "Emby client unlock",
    description = "Enables local in-app feature gates using Kirlif's observed approach. Does not grant server Premiere entitlements.",
) {
    compatibleWith(emby)
    execute {
        val native = get("assets/www/native/android/iap.js")
        val shared = get("assets/www/modules/iap.js")
        check(native.readBytes().sha256() == "738442765c523062ccbafe1f4a62e12f6aa3ac6b3e1a6bfee9032e8ea0f5de17") { "Unreviewed Emby native IAP asset" }
        check(shared.readBytes().sha256() == "451ffb05ac75eba56ecefa421b459142093e281395b78498d4729b4053bcefae") { "Unreviewed Emby shared IAP asset" }
        var text = replaceOnce(native.readText(),
            Regex("function isUnlockedByDefault\\(feature\\) \\{[\\s\\S]*?\\n  }(?=\\n  function allowNonPremiere)"),
            "function isUnlockedByDefault(feature) {\n    return Promise.resolve();\n  }")
        text = replaceOnce(text,
            Regex("function allowNonPremiere\\(feature\\) \\{[\\s\\S]*?\\n  }(?=\\n  function restorePurchase)"),
            "function allowNonPremiere(feature) {\n    return true;\n  }")
        val sharedText = replaceOnce(shared.readText(),
            Regex("isUnlockedByDefault:function\\(feature,options\\)\\{[^{}]+}"),
            "isUnlockedByDefault:function(feature,options){return Promise.resolve()}")
        native.writeText(text)
        shared.writeText(sharedText)
    }
}

@Suppress("unused")
val embyRemoveFirebasePatch = resourcePatch(
    name = "Emby remove Firebase and DataTransport",
    description = "Removes Firebase/DataTransport SDK classes and manifest components. Disables Firebase push messaging; keeps Cast and billing libraries.",
) {
    compatibleWith(emby)
    execute {
        // Raw DEX replacement avoids introducing a runtime hook or extension.
        val hashes = mapOf(
            "classes.dex" to "a99c7543330cf1a75e6387588c976d1f54a24d06d61df19f4873c4342b185f86",
            "classes2.dex" to "f3feeac7015303af64403e3d18c3865ec58d63aaec1339faf0536d2743246ee3",
            "classes3.dex" to "f5f71115338ff896b2f652b4eff2ff78bc71da86e8c79791c5892d0cbc79a41e",
            "classes4.dex" to "0a94860ddd1deafcdb11d2c2f556edb2f41dfd8acbf4bac637f6efa89af42d59",
        )
        check(listApkEntries().filter { Regex("classes\\d*\\.dex").matches(it) }.toSet() == hashes.keys) { "Emby DEX inventory changed" }
        val files = hashes.map { (name, hash) ->
            get(name).also { check(it.readBytes().sha256() == hash) { "Unreviewed Emby DEX: $name" } }
        }
        var removed = 0
        var telemetryMethods = 0
        for (file in files) {
            val dex = DexFileFactory.loadDexFile(file, null)
            val retained = dex.classes.filterNot {
                // R8 placed shared Android API wrappers here; WorkManager and Cast need them.
                (it.type != "Lcom/google/firebase/Timestamp\$\$ExternalSyntheticApiModelOutline0;" &&
                    (it.type.startsWith("Lcom/google/firebase/") ||
                        it.type.startsWith("Lcom/google/android/datatransport/"))).also { drop -> if (drop) removed++ }
            }.map { cls ->
                val methods = cls.methods.map { method ->
                    if ((cls.type == "Lcom/android/billingclient/api/zzdt;" && method.name in setOf("<init>", "zza")) ||
                        (cls.type == "Lcom/google/android/gms/internal/cast/zzh;" && method.name in setOf("zzc", "zzd"))) {
                        telemetryMethods++
                        withoutTelemetry(method)
                    } else method
                }
                ImmutableClassDef(cls.type, cls.accessFlags, cls.superclass, cls.interfaces, cls.sourceFile,
                    cls.annotations, cls.fields, methods)
            }
            if (retained.size != dex.classes.size || dex.classes.any { it.type in setOf("Lcom/android/billingclient/api/zzdt;", "Lcom/google/android/gms/internal/cast/zzh;") }) {
                val output = file.resolveSibling(file.name + ".tmp")
                try {
                    DexPool.writeTo(output.absolutePath, ImmutableDexFile(dex.opcodes, retained))
                    output.copyTo(file, overwrite = true)
                } finally { output.delete() }
            }
        }
        check(removed == 780) { "Unexpected Emby SDK class count: $removed" }
        check(telemetryMethods == 4) { "Unexpected Emby telemetry method count: $telemetryMethods" }
        document("AndroidManifest.xml").use { manifest ->
            val nodes = manifest.getElementsByTagName("*")
            var count = 0
            for (index in nodes.length - 1 downTo 0) {
                val node = nodes.item(index) as Element
                val name = node.getAttributeNS("http://schemas.android.com/apk/res/android", "name")
                if (node.tagName in setOf("provider", "service", "receiver") &&
                    (name.startsWith("com.google.firebase.") || name.startsWith("com.google.android.datatransport.") ||
                        name == "com.mb.android.fcm.FcmFirebaseMessagingService")) {
                    node.parentNode.removeChild(node)
                    count++
                }
            }
            check(count == 8) { "Unexpected Emby SDK manifest component count: $count" }
        }
    }
}
