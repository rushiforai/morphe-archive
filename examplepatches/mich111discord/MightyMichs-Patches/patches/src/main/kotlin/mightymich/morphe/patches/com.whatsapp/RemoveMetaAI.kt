package mightymich.morphe.patches.com.whatsapp

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.booleanOption
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Hide Meta AI entry points in WhatsApp (home FAB / pill, hub tab, related gates).
 *
 * Anchors for 2.26.x:
 * - preference key bonsai_meta_ai_button_setting_enabled (older builds)
 * - UI hub com.whatsapp.aihub.metaai (AiFragmentBase)
 * - user-visible "Meta AI" / "Ask Meta AI" strings
 *
 * Forces small ()Z show-gates to false and soft-no-ops obvious Meta AI UI setup
 * methods. Soft-success so missing anchors do not fail the patch session.
 */
@Suppress("unused")
val removeMetaAIPatch = bytecodePatch(
    name = "Remove Meta AI",
    description = "Hides Meta AI on the chats home screen (FAB / pill), related hub entry " +
        "points, and common feature gates. Does not delete existing Meta AI chats.",
    default = true,
) {
    compatibleWith(WhatsAppCompatibility.WHATSAPP)

    val aggressive by booleanOption(
        key = "aggressive",
        default = false,
        title = "Aggressive hide",
        description = "Also force extra ()Z methods in Meta-AI-anchored classes. " +
            "May hide unrelated AI experiments; leave off unless the FAB still shows.",
    )

    execute {
        val returnFalse = """
            const/4 v0, 0x0
            return v0
        """

        var hits = 0
        val seen = mutableSetOf<String>()

        val anchors = listOf(
            "bonsai_meta_ai_button_setting_enabled",
            "Meta AI",
            "meta_ai",
            "MetaAI",
            "metaai",
            "AiFragmentBase",
            "aihub",
            "com.whatsapp.aihub",
            "Ask Meta AI",
            "meta-ai",
        )

        fun looksLikeShowGate(name: String): Boolean {
            val n = name.lowercase()
            return n.contains("meta") ||
                n.contains("ai") ||
                n.contains("bonsai") ||
                n.contains("bot") ||
                n.startsWith("is") ||
                n.startsWith("has") ||
                n.startsWith("should") ||
                n.startsWith("can") ||
                n.startsWith("get") ||
                n.startsWith("check") ||
                n.length <= 4
        }

        for (anchor in anchors) {
            val defs = try {
                classDefByStrings(anchor)
            } catch (_: Exception) {
                emptyList()
            }
            for (def in defs) {
                if (AccessFlags.INTERFACE.isSet(def.accessFlags)) continue
                val typeName = def.type
                if (typeName.startsWith("Landroid") ||
                    typeName.startsWith("Landroidx") ||
                    typeName.startsWith("Ljava") ||
                    typeName.startsWith("Lkotlin") ||
                    typeName.startsWith("Lcom/google")
                ) {
                    continue
                }
                val inScope =
                    typeName.contains("whatsapp", ignoreCase = true) ||
                        typeName.contains("aihub", ignoreCase = true) ||
                        typeName.contains("metaai", ignoreCase = true) ||
                        typeName.startsWith("LX/") ||
                        typeName.startsWith("Lcom/whatsapp")
                if (!inScope && aggressive != true) continue
                if (!seen.add(typeName)) continue

                val clazz = try {
                    mutableClassDefBy(def)
                } catch (_: Exception) {
                    continue
                }

                var local = 0
                for (method in clazz.methods) {
                    if (AccessFlags.ABSTRACT.isSet(method.accessFlags)) continue
                    if (AccessFlags.NATIVE.isSet(method.accessFlags)) continue
                    val impl = method.implementation ?: continue
                    val n = method.name
                    val count = impl.instructions.count()

                    if (method.returnType == "Z" && method.parameterTypes.isEmpty()) {
                        if (count < 1 || count > 60) continue
                        if (aggressive != true && !looksLikeShowGate(n)) continue
                        try {
                            method.addInstructions(0, returnFalse)
                            hits++
                            local++
                        } catch (_: Exception) {
                        }
                        if (local >= if (aggressive == true) 14 else 8) break
                    }

                    if (method.returnType == "V" && method.parameterTypes.size <= 1) {
                        if (count < 1 || count > 40) continue
                        val lower = n.lowercase()
                        if (!(lower.contains("meta") || lower.contains("aihub") ||
                                lower.contains("bonsai") || lower.contains("fab"))
                        ) {
                            continue
                        }
                        if (!(lower.contains("show") || lower.contains("bind") ||
                                lower.contains("setup") || lower.contains("init") ||
                                lower.contains("attach") || lower.contains("update") ||
                                lower.contains("create"))
                        ) {
                            continue
                        }
                        try {
                            method.addInstructions(0, "return-void")
                            hits++
                        } catch (_: Exception) {
                        }
                    }
                }
            }
        }
        // Soft success — Meta AI UI moves between minor versions.
    }
}
