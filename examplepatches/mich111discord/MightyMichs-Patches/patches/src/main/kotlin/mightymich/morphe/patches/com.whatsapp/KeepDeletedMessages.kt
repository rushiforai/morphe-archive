package mightymich.morphe.patches.com.whatsapp

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.booleanOption
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Keep "Delete for everyone" messages visible locally on WhatsApp 2.26.43.x.
 *
 * Strategy (obfuscated class names — anchor on retained source-file / log strings):
 *  1. No-op StandardRevokePreProcessor / RevokePreProcessor / RevokeEditProcessor
 *     entry methods that apply incoming revokes (return-void).
 *  2. Force isRevokeMessage / isRevoked / messageIsRevoke ()Z → false so UI rows
 *     keep original text instead of the deleted placeholder.
 *  3. Soft-success — partial apply still installs; full wipe needs server-side data.
 *
 * Verified string anchors on 2.26.43.76.
 */
@Suppress("unused")
val keepDeletedMessagesPatch = bytecodePatch(
    name = "Keep deleted messages",
    description = "Show messages that were deleted for everyone. Client-side only; " +
        "already-wiped history cannot be restored.",
    default = true,
) {
    compatibleWith(WhatsAppCompatibility.WHATSAPP)

    val highlight by booleanOption(
        key = "highlight",
        default = true,
        title = "Highlight deleted messages",
        description = "Reserved for future UI tinting of kept-deleted rows.",
    )

    execute {
        var hits = 0

        val revokeAnchors = listOf(
            "StandardRevokePreProcessor.kt",
            "RevokePreProcessor.kt",
            "RevokeEditProcessor.kt",
            "RevokeEditProcessor",
            "FMessageRevokedFactory",
            "UserActionsMessageDeletion/userActionRevokeMessages",
            "/processMessage revoked message ",
            "msgstore/revoke: Failed to re-insert revoked message:",
        )

        for (anchor in revokeAnchors) {
            val defs = try {
                classDefByStrings(anchor)
            } catch (_: Exception) {
                emptyList()
            }
            for (def in defs) {
                if (AccessFlags.INTERFACE.isSet(def.accessFlags)) continue
                val clazz = try {
                    mutableClassDefBy(def)
                } catch (_: Exception) {
                    continue
                }
                for (method in clazz.methods) {
                    if (AccessFlags.ABSTRACT.isSet(method.accessFlags)) continue
                    if (AccessFlags.NATIVE.isSet(method.accessFlags)) continue
                    val impl = method.implementation ?: continue
                    val n = impl.instructions.count()
                    if (n < 3 || n > 200) continue
                    try {
                        when (method.returnType) {
                            "V" -> {
                                method.addInstructions(0, "return-void")
                                hits++
                            }
                            "Z" -> {
                                method.addInstructions(
                                    0,
                                    """
                                        const/4 v0, 0x0
                                        return v0
                                    """,
                                )
                                hits++
                            }
                        }
                    } catch (_: Exception) {
                    }
                }
            }
        }

        val flagAnchors = listOf(
            "isRevokeMessage",
            "messageIsRevoke",
            ", isRevoked=",
            "FMessageRevoked",
            "ConversationRowRevoked.kt",
            "ConversationRowAdminRevoked.kt",
        )
        val flagNames = setOf(
            "isRevokeMessage",
            "isRevoked",
            "messageIsRevoke",
            "isDeleted",
        )
        val seen = mutableSetOf<String>()
        for (anchor in flagAnchors) {
            val defs = try {
                classDefByStrings(anchor)
            } catch (_: Exception) {
                emptyList()
            }
            for (def in defs) {
                if (!seen.add(def.type)) continue
                if (AccessFlags.INTERFACE.isSet(def.accessFlags)) continue
                val t = def.type
                if (t.startsWith("Landroid") || t.startsWith("Landroidx") ||
                    t.startsWith("Ljava") || t.startsWith("Lkotlin")
                ) {
                    continue
                }
                val clazz = try {
                    mutableClassDefBy(def)
                } catch (_: Exception) {
                    continue
                }
                for (method in clazz.methods) {
                    if (method.returnType != "Z") continue
                    if (method.parameterTypes.isNotEmpty()) continue
                    if (AccessFlags.ABSTRACT.isSet(method.accessFlags)) continue
                    if (method.name !in flagNames) continue
                    try {
                        method.addInstructions(
                            0,
                            """
                                const/4 v0, 0x0
                                return v0
                            """,
                        )
                        hits++
                    } catch (_: Exception) {
                    }
                }
            }
        }
    }
}
