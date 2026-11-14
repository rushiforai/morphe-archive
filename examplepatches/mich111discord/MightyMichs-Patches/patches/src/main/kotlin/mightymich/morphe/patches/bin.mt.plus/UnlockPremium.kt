package mightymich.morphe.patches.bin.mt.plus

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.booleanOption
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Experimental VIP unlock for MT Manager (bin.mt.plus) 2.26.10.
 *
 * MTProtector + heavy obfuscation hide most gates. This patch forces
 * activation-related ()Z helpers and boolean methods near VIP protocol labels.
 * Native / protector checks may still block some features.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium (Experimental)",
    description = "Best-effort local VIP unlock (activation flags + VIP protocol UI). " +
        "MTProtector may still gate some features in native code.",
    default = true,
) {
    compatibleWith(MTManagerCompatibility.MT_MANAGER)

    val aggressive by booleanOption(
        key = "aggressive",
        default = false,
        title = "Aggressive boolean force",
        description = "Also force extra small ()Z methods in VIP-anchored classes. " +
            "May break unrelated checks; leave off unless needed.",
    )

    execute {
        val returnTrue = """
            const/4 v0, 0x1
            return v0
        """

        var hits = 0
        val seenTypes = mutableSetOf<String>()

        fun forceBoolsFromAnchor(anchor: String, maxPerClass: Int) {
            val defs = try {
                classDefByStrings(anchor)
            } catch (_: Exception) {
                emptyList()
            }
            for (def in defs) {
                if (AccessFlags.INTERFACE.isSet(def.accessFlags)) continue
                val typeName = def.type
                if (typeName.startsWith("Landroid") || typeName.startsWith("Landroidx") ||
                    typeName.startsWith("Ljava") || typeName.startsWith("Lkotlin") ||
                    typeName.startsWith("Lcom/google") || typeName.startsWith("Lcom/alipay") ||
                    typeName.startsWith("Lcom/umeng") || typeName.startsWith("Lcom/tencent")
                ) {
                    continue
                }
                if (!seenTypes.add(typeName)) continue
                val clazz = try {
                    mutableClassDefBy(def)
                } catch (_: Exception) {
                    continue
                }
                var local = 0
                for (method in clazz.methods) {
                    if (AccessFlags.ABSTRACT.isSet(method.accessFlags)) continue
                    if (AccessFlags.NATIVE.isSet(method.accessFlags)) continue
                    if (method.returnType != "Z") continue
                    if (method.parameterTypes.isNotEmpty()) continue
                    val impl = method.implementation ?: continue
                    if (impl.instructions.count() > 80) continue
                    try {
                        method.addInstructions(0, returnTrue)
                        hits++
                        local++
                    } catch (_: Exception) {
                    }
                    if (local >= maxPerClass) break
                }
            }
        }

        listOf(
            "isActivated",
            "setActivated",
            "controlActivated",
            "control_activated",
            "activate_msg",
            "firstActivateTime",
            "KEY_FIRST_ACTIVATE_TIME",
        ).forEach { forceBoolsFromAnchor(it, 8) }

        listOf(
            "SMB (VIP)",
            "SFTP (VIP)",
            "FTPS (VIP)",
            "WebDav (VIP)",
            " (VIP)",
            "ic_vip",
        ).forEach { forceBoolsFromAnchor(it, if (aggressive == true) 16 else 10) }
    }
}
