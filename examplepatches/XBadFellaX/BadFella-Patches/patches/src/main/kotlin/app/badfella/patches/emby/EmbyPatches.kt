package app.badfella.patches.emby

import app.badfella.patches.util.commitAll
import app.badfella.patches.util.loadDexHandles
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.w3c.dom.Element

private val emby = Compatibility(
    name = "Emby", packageName = "com.mb.android", apkFileType = ApkFileType.APK,
    appIconColor = 0x52B54B,
)

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
        // Descriptors are resolved across every classesN.dex; no whole-file DEX identity is pinned.
        val dexes = loadDexHandles(this)
        var removed = 0
        for (handle in dexes) {
            val dex = handle.dex
            var edited = false
            val retained = dex.classes.filterNot {
                // R8 placed shared Android API wrappers here; WorkManager and Cast need them.
                (it.type != "Lcom/google/firebase/Timestamp\$\$ExternalSyntheticApiModelOutline0;" &&
                    (it.type.startsWith("Lcom/google/firebase/") ||
                        it.type.startsWith("Lcom/google/android/datatransport/"))).also { drop -> if (drop) { removed++; edited = true } }
            }.map { cls ->
                val targets = when (cls.type) {
                    "Lcom/android/billingclient/api/zzdt;" -> setOf("<init>", "zza")
                    "Lcom/google/android/gms/internal/cast/zzh;" -> setOf("zzc", "zzd")
                    else -> emptySet()
                }
                if (targets.isEmpty()) return@map cls
                check(cls.methods.any { it.name in targets }) {
                    "Emby telemetry class shape changed: ${cls.type}; this app needs review"
                }
                val methods = cls.methods.map { method ->
                    if (method.name !in targets) method else {
                        edited = true
                        withoutTelemetry(method)
                    }
                }
                ImmutableClassDef(cls.type, cls.accessFlags, cls.superclass, cls.interfaces, cls.sourceFile,
                    cls.annotations, cls.fields, methods)
            }
            if (edited) {
                handle.classes = retained
                handle.changed = true
            }
        }
        check(removed > 0) { "No Emby Firebase or DataTransport classes were found; this build needs review" }
        dexes.commitAll()
        document("AndroidManifest.xml").use { manifest ->
            val nodes = manifest.getElementsByTagName("*")
            var count = 0
            val settings = "http://schemas.android.com/apk/res/android"
            for (index in nodes.length - 1 downTo 0) {
                val node = nodes.item(index) as Element
                val name = node.getAttributeNS(settings, "name")
                if (node.tagName in setOf("provider", "service", "receiver") &&
                    (name.startsWith("com.google.firebase.") || name.startsWith("com.google.android.datatransport.") ||
                        name == "com.mb.android.fcm.FcmFirebaseMessagingService")) {
                    node.parentNode.removeChild(node)
                    count++
                }
            }
            check(count > 0) { "No Emby Firebase manifest components were found; this build needs review" }
        }
    }
}
