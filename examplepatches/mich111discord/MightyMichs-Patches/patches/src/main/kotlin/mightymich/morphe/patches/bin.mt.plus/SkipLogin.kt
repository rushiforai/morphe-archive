package mightymich.morphe.patches.bin.mt.plus

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.booleanOption
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Skip MT account login requirement (experimental).
 *
 * Anchors from 2.26.10:
 * - ". Log in to MT account "
 * - "requestNeedLogin(...)"
 * - "{\"isLogin\":\"false\"}"
 * - C_LoginWeb / toWebLogin
 *
 * Forces likely isLogin / needLogin ()Z gates to a configured value and no-ops
 * void methods that only open the login web flow when names match.
 */
@Suppress("unused")
val skipLoginPatch = bytecodePatch(
    name = "Skip MT account login (Experimental)",
    description = "Tries to skip the MT account login wall so local features work offline. " +
        "Server-synced cloud features will still need a real account.",
    default = true,
) {
    compatibleWith(MTManagerCompatibility.MT_MANAGER)

    val treatAsLoggedIn by booleanOption(
        key = "treatAsLoggedIn",
        default = true,
        title = "Treat as logged in",
        description = "Force login-state getters to true (logged in). " +
            "If the app misbehaves, try turning this off and only blocking the login prompt.",
    )

    execute {
        val returnTrue = """
            const/4 v0, 0x1
            return v0
        """
        val returnFalse = """
            const/4 v0, 0x0
            return v0
        """

        var hits = 0
        val seen = mutableSetOf<String>()

        val anchors = listOf(
            ". Log in to MT account ",
            "requestNeedLogin(...)",
            "{\"isLogin\":\"false\"}",
            "C_LoginWeb",
            "toWebLogin",
            "isLogin",
            "needLogin",
            "NeedLogin",
        )

        for (anchor in anchors) {
            val defs = try {
                classDefByStrings(anchor)
            } catch (_: Exception) {
                emptyList()
            }
            for (def in defs) {
                if (AccessFlags.INTERFACE.isSet(def.accessFlags)) continue
                val t = def.type
                if (t.startsWith("Landroid") || t.startsWith("Landroidx") ||
                    t.startsWith("Ljava") || t.startsWith("Lkotlin") ||
                    t.startsWith("Lcom/google") || t.startsWith("Lcom/alipay") ||
                    t.startsWith("Lcom/umeng") || t.startsWith("Lcom/tencent")
                ) {
                    continue
                }
                if (!seen.add(t)) continue
                val clazz = try {
                    mutableClassDefBy(def)
                } catch (_: Exception) {
                    continue
                }

                for (method in clazz.methods) {
                    if (AccessFlags.ABSTRACT.isSet(method.accessFlags)) continue
                    if (AccessFlags.NATIVE.isSet(method.accessFlags)) continue
                    val impl = method.implementation ?: continue
                    val n = method.name
                    val lower = n.lowercase()

                    if (method.returnType == "Z" && method.parameterTypes.isEmpty()) {
                        if (impl.instructions.count() > 100) continue
                        val looksLogin =
                            lower.contains("login") ||
                                lower.contains("logged") ||
                                lower.contains("account") ||
                                lower.contains("auth") ||
                                lower.startsWith("is") ||
                                lower.startsWith("has") ||
                                lower.startsWith("need") ||
                                lower.startsWith("require") ||
                                lower.startsWith("check")
                        if (!looksLogin) continue
                        val smali = if (treatAsLoggedIn == true) {
                            if (lower.contains("need") || lower.contains("require") ||
                                lower.contains("should") || lower.contains("must")
                            ) {
                                returnFalse
                            } else {
                                returnTrue
                            }
                        } else {
                            if (lower.contains("need") || lower.contains("require")) {
                                returnFalse
                            } else {
                                continue
                            }
                        }
                        try {
                            method.addInstructions(0, smali)
                            hits++
                        } catch (_: Exception) {
                        }
                    }

                    if (method.returnType == "V" && method.parameterTypes.isEmpty()) {
                        if (impl.instructions.count() > 40) continue
                        if (lower.contains("login") &&
                            (lower.contains("show") || lower.contains("open") ||
                                lower.contains("start") || lower.contains("goto") ||
                                lower.contains("launch") || lower == "login" ||
                                lower.contains("weblogin"))
                        ) {
                            try {
                                method.addInstructions(0, "return-void")
                                hits++
                            } catch (_: Exception) {
                            }
                        }
                    }
                }
            }
        }
    }
}
