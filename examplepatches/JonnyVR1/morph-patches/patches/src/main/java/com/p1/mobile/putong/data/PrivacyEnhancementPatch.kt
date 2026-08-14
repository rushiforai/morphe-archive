package com.p1.mobile.putong.data

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private val instructionCache = java.util.WeakHashMap<Method, List<Instruction>>()
private fun Method.cachedInstructions(): List<Instruction> =
    instructionCache.getOrPut(this) { implementation?.instructions?.toList() ?: emptyList() }

private const val RETURN_VOID = "return-void"

private const val RETURN_FALSE = """
    const/4 v0, 0x0
    return v0
"""

private const val RETURN_TRUE = """
    const/4 v0, 0x1
    return v0
"""

private const val RETURN_EMPTY_LIST = """
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
    move-result-object v0
    return-object v0
"""

private fun isConstructor(method: Method): Boolean =
    method.name == "<init>" || method.name == "<clinit>"

private val apkSignatureVerificationFingerprint = Fingerprint(
    filters = listOf(
        fieldAccess(type = "Ljavax/security/auth/x500/X500Principal;"),
        methodCall(name = "getSubjectX500Principal"),
    ),
)

@Suppress("unused")
@JvmField
val privacyEnhancementPatch = bytecodePatch(
    name = "Privacy Enhancement",
    description = "Advanced privacy protections: root/emulator detection bypass, ShuMeng SDK blocking, Facebook SDK emulator detection bypass, APK signature verification bypass, package enumeration prevention, VPN/proxy detection bypass, overlay detection bypass",
    default = true,
) {
    compatibleWith(tantanCompatibility)
    execute {
        val suPathStrings = setOf("/data/local/su", "/system/xbin/su", "/su/bin/su")
        val fbEmulatorStrings = setOf("google_sdk", "Genymotion", "generic", "Emulator")

        val jmd0Anchors = setOf("/system/app/Superuser.apk", "/system/xbin/daemonsu")
        val mmd0Anchors = setOf("/system/bin/cufsdosck", "/system/bin/conbb")
        val ert0Anchors = setOf("ranchu", "generic", "emulator")
        val fbEmulatorAnchors = setOf("google_sdk", "Genymotion", "vbox86p")
        val additionalRootAnchors = setOf("/data/local/su", "/system/xbin/su", "/su/bin/su")
        val shuMengAnchors = setOf("shumeng_init", "shuzilm")
        val packageEnumAnchors = setOf("getInstalledPackages", "firstInstallTime")
        val vpnProxyAnchors = setOf("http.proxyHost", "https.proxyHost")
        val overlayAnchors = setOf("canDrawOverlays")

        val allAnchors = jmd0Anchors + mmd0Anchors + ert0Anchors + fbEmulatorAnchors + additionalRootAnchors + shuMengAnchors + packageEnumAnchors + vpnProxyAnchors + overlayAnchors

        var jmd0Class: ClassDef? = null
        var mmd0Class: ClassDef? = null
        var ert0Class: ClassDef? = null
        var fbEmulatorClass: ClassDef? = null
        var additionalRootClass: ClassDef? = null
        var shuMengClass: ClassDef? = null
        var packageEnumClass: ClassDef? = null
        var vpnProxyClass: ClassDef? = null
        var overlayClass: ClassDef? = null
        var matchedCount = 0

        classDefForEach { classDef ->
            if (matchedCount == 9) return@classDefForEach

            val type = classDef.type
            if (type.startsWith("Landroid/") || type.startsWith("Lkotlin/") || type.startsWith("Ljava/")) {
                return@classDefForEach
            }

            val foundStrings = mutableSetOf<String>()
            for (method in classDef.methods) {
                val impl = method.implementation ?: continue
                for (instr in impl.instructions) {
                    if (instr is ReferenceInstruction && instr.reference is StringReference) {
                        val s = (instr.reference as StringReference).string
                        if (s in allAnchors) {
                            foundStrings.add(s)
                        }
                    }
                }
            }

            if (foundStrings.isEmpty()) return@classDefForEach

            when {
                jmd0Class == null && foundStrings.containsAll(jmd0Anchors) -> { jmd0Class = classDef; matchedCount++ }
                mmd0Class == null && foundStrings.containsAll(mmd0Anchors) -> { mmd0Class = classDef; matchedCount++ }
                ert0Class == null && foundStrings.containsAll(ert0Anchors) -> { ert0Class = classDef; matchedCount++ }
                fbEmulatorClass == null && foundStrings.containsAll(fbEmulatorAnchors) -> { fbEmulatorClass = classDef; matchedCount++ }
                additionalRootClass == null && foundStrings.containsAll(additionalRootAnchors) -> { additionalRootClass = classDef; matchedCount++ }
                shuMengClass == null && foundStrings.containsAll(shuMengAnchors) -> { shuMengClass = classDef; matchedCount++ }
                packageEnumClass == null && foundStrings.containsAll(packageEnumAnchors) -> { packageEnumClass = classDef; matchedCount++ }
                vpnProxyClass == null && foundStrings.containsAll(vpnProxyAnchors) -> { vpnProxyClass = classDef; matchedCount++ }
                overlayClass == null && foundStrings.containsAll(overlayAnchors) -> { overlayClass = classDef; matchedCount++ }
            }
        }

        listOf(jmd0Class, mmd0Class).forEach { classDef ->
            classDef?.let {
                mutableClassDefBy(it).methods.forEach { method ->
                    if (method.implementation == null) return@forEach
                    if (isConstructor(method)) return@forEach
                    if (method.returnType == "Z" && method.parameterTypes.isEmpty()) {
                        method.addInstructions(0, RETURN_FALSE)
                    }
                }
            }
        }

        classDefByOrNull("Lcom/tantanapp/beatles/utils/DeviceUtil;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "Ljava/lang/Boolean;" && method.parameterTypes.isEmpty()) {
                    method.addInstructions(0, """
                        const/4 v0, 0x0
                        invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                        move-result-object v0
                        return-object v0
                    """)
                }
            }
        }

        ert0Class?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "Z" && method.parameterTypes.size == 1 && method.parameterTypes[0] == "Z") {
                    method.addInstructions(0, RETURN_FALSE)
                }
            }
        }

        fbEmulatorClass?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "Z" && method.parameterTypes.isEmpty() && AccessFlags.STATIC.isSet(method.accessFlags)) {
                    val hasEmulatorStrings = method.cachedInstructions().any { instr ->
                        instr is ReferenceInstruction && instr.reference is StringReference &&
                            (instr.reference as StringReference).string in fbEmulatorStrings
                    }
                    if (hasEmulatorStrings) {
                        method.addInstructions(0, RETURN_FALSE)
                    }
                }
            }
        }

        shuMengClass?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "V" && method.parameterTypes.isNotEmpty() && method.parameterTypes[0] == "Landroid/content/Context;") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        apkSignatureVerificationFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "Z" && method.parameterTypes.size == 1 && method.parameterTypes[0] == "Landroid/content/Context;" && AccessFlags.STATIC.isSet(method.accessFlags)) {
                    method.addInstructions(0, RETURN_TRUE)
                }
            }
        }

        packageEnumClass?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                val callsGetInstalledPackages = method.cachedInstructions().any { instr ->
                    instr is ReferenceInstruction && instr.reference is MethodReference &&
                        (instr.reference as MethodReference).name == "getInstalledPackages"
                }
                if (callsGetInstalledPackages && method.returnType.startsWith("L") && method.returnType.endsWith(";")) {
                    method.addInstructions(0, RETURN_EMPTY_LIST)
                }
            }
        }

        additionalRootClass?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "Z" && method.parameterTypes.isEmpty() && AccessFlags.STATIC.isSet(method.accessFlags)) {
                    val hasSuPaths = method.cachedInstructions().any { instr ->
                        instr is ReferenceInstruction && instr.reference is StringReference &&
                            (instr.reference as StringReference).string in suPathStrings
                    }
                    if (hasSuPaths) {
                        method.addInstructions(0, RETURN_FALSE)
                    }
                }
            }
        }

        vpnProxyClass?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "Z" && AccessFlags.STATIC.isSet(method.accessFlags)) {
                    val hasVpnProxyChecks = method.cachedInstructions().any { instr ->
                        if (instr is ReferenceInstruction && instr.reference is MethodReference) {
                            val methodName = (instr.reference as MethodReference).name
                            methodName == "hasTransport" || methodName == "getDefaultProxy"
                        } else if (instr is ReferenceInstruction && instr.reference is StringReference) {
                            (instr.reference as StringReference).string in setOf("http.proxyHost", "https.proxyHost")
                        } else false
                    }
                    if (hasVpnProxyChecks) {
                        method.addInstructions(0, RETURN_FALSE)
                    }
                }
            }
        }

        overlayClass?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                if (isConstructor(method)) return@forEach
                if (method.returnType == "Z" && method.parameterTypes.size == 1 && method.parameterTypes[0] == "Landroid/content/Context;") {
                    val hasCanDrawOverlays = method.cachedInstructions().any { instr ->
                        instr is ReferenceInstruction && instr.reference is MethodReference &&
                            (instr.reference as MethodReference).name == "canDrawOverlays"
                    }
                    if (hasCanDrawOverlays) {
                        method.addInstructions(0, RETURN_FALSE)
                    }
                }
            }
        }
    }
}
