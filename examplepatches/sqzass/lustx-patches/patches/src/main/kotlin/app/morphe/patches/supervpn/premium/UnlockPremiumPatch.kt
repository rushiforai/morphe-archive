/*
 * Copyright 2026 sqzass.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.supervpn.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val VIP_FLOW_CLASS = "Lvl7;"
private const val STATELESS_VIP_CLASS = "Llu;"

private const val TV_SPLASH_CLASS = "Lhqe;"
private const val PRIVACY_POLICY_CLASS = "Lm0a;"
private const val CROWN_CLICK_CLASS = "Lvj8;"

private const val CONNECT_REPORT_CLASS = "Lcp2;"
private const val USER_INFO_CLASS = "Lwcf;"

private const val PREMIUM_USER_STATE =
    "PrimaryPremiumUserActiveSubscriptionNotSignedUp"

private val CP2_CTOR_PARAMS = listOf(
    "Z",
    "Lrj3;",
    "Lvo2;",
    "Lut2;",
    "Z",
    "Z",
    "Z",
    "Z",
    "Lzs2;",
    "I",
    "Z",
    "Z",
    "Ljava/lang/String;",
    "Ljm4;",
)

private val WCF_CTOR_PARAMS = listOf(
    "Ljava/lang/String;",
    "Ljava/lang/String;",
    "Ljava/lang/String;",
    "Z",
    "Ljava/lang/String;",
    "Ljava/lang/String;",
    "J",
    "Ljava/lang/String;",
    "Z",
    "Ljava/lang/String;",
    "I",
    "Ljava/lang/String;",
    "Ljava/lang/String;",
    "Z",
    "Z",
    "Ljava/lang/String;",
    "Ljava/lang/String;",
    "J",
    "Ljava/lang/String;",
    "Ljava/lang/String;",
)

private fun classMethod(
    classType: String,
    name: String,
    returnType: String,
    parameters: List<String>,
): MutableMethod {
    val clazz = mutableClassDefByOrNull(classType)
        ?: throw PatchException("SuperVPN: $classType not found (version drift?)")

    return clazz.methods.singleOrNull { method ->
        method.name == name &&
            method.returnType == returnType &&
            method.parameterTypes == parameters
    } ?: throw PatchException(
        "SuperVPN: $classType->$name$returnType(${parameters.joinToString()}) not found (version drift?)",
    )
}

private fun MutableMethod.firstPutIndex(
    fieldClass: String,
    fieldName: String,
    fieldType: String,
    opcode: Opcode,
): Int? = instructions.indexOfFirst { insn ->
    insn.opcode == opcode &&
        (insn as? ReferenceInstruction)?.reference.let { ref ->
            ref is FieldReference &&
                ref.definingClass == fieldClass &&
                ref.name == fieldName &&
                ref.type == fieldType
        }
}

private fun MutableMethod.forceBooleanWrites(
    fields: List<Triple<String, String, String>>,
    value: Int,
) {
    val patches = fields.mapNotNull { (fieldClass, fieldName, fieldType) ->
        firstPutIndex(fieldClass, fieldName, fieldType, Opcode.IPUT_BOOLEAN)?.let { index ->
            val register = (getInstruction(index) as TwoRegisterInstruction).registerA
            index to register
        }
    }.sortedByDescending { it.first }

    if (patches.size != fields.size) {
        throw PatchException(
            "SuperVPN: expected ${fields.size} boolean write(s), found ${patches.size} (version drift?)",
        )
    }

    patches.forEach { (index, register) ->
        addInstructions(index, "const/16 v$register, 0x$value")
    }
}

private fun MutableMethod.forceStringWrite(
    fieldClass: String,
    fieldName: String,
    value: String,
) {
    val index = firstPutIndex(fieldClass, fieldName, "Ljava/lang/String;", Opcode.IPUT_OBJECT)
        ?: throw PatchException(
            "SuperVPN: $fieldClass->$fieldName:String write not found (version drift?)",
        )

    val register = (getInstruction(index) as TwoRegisterInstruction).registerA
    addInstructions(index, "const-string v$register, \"$value\"")
}

private fun MutableMethod.forceFirstBooleanReadTrue(anchor: String) {
    val index = instructions.indexOfFirst { insn ->
        insn.opcode == Opcode.IGET_BOOLEAN
    }

    if (index < 0) {
        throw PatchException("SuperVPN: $anchor has no IGET_BOOLEAN (version drift?)")
    }

    val register = (getInstruction(index) as TwoRegisterInstruction).registerA
    replaceInstruction(index, "const/16 v$register, 0x1")
}

private fun MutableMethod.returnBeforeString(value: String, anchor: String) {
    val index = instructions.indexOfFirst { insn ->
        insn.opcode == Opcode.CONST_STRING &&
            (insn as? ReferenceInstruction)?.reference.let { ref ->
                ref is StringReference && ref.string == value
            }
    }

    if (index < 0) {
        throw PatchException("SuperVPN: $anchor missing \"$value\" (version drift?)")
    }

    addInstruction(index, "return-void")
}

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Forces Super VPN VIP state, premium UserInfo state, disables promo banners, and suppresses crown/privacy/TV paywall triggers.",
) {
    compatibleWith(
        Compatibility(
            name = "VPN - Super Unlimited Proxy",
            packageName = "com.free.vpn.super.hotspot.open",
            targets = listOf(
                AppTarget(
                    version = "2.37.0",
                    versionCode = 23700,
                ),
            ),
        ),
    )

    execute {
        val statelessVip = mutableClassDefByOrNull(STATELESS_VIP_CLASS)
            ?: throw PatchException("SuperVPN: $STATELESS_VIP_CLASS not found (version drift?)")

        statelessVip.methods.singleOrNull { method ->
            method.name == "<init>" &&
                method.returnType == "V" &&
                method.parameterTypes.isEmpty()
        } ?: throw PatchException("SuperVPN: $STATELESS_VIP_CLASS.<init>()V not found (version drift?)")

        val readsBooleanTrue = statelessVip.methods.any { method ->
            method.instructions.any { insn ->
                insn.opcode == Opcode.SGET_OBJECT &&
                    (insn as? ReferenceInstruction)?.reference.let { ref ->
                        ref is FieldReference &&
                            ref.definingClass == "Ljava/lang/Boolean;" &&
                            ref.name == "TRUE"
                    }
            }
        }

        if (!readsBooleanTrue) {
            throw PatchException("SuperVPN: $STATELESS_VIP_CLASS does not read Boolean.TRUE (version drift?)")
        }

        classMethod(
            VIP_FLOW_CLASS,
            "invoke",
            "Ljava/lang/Object;",
            emptyList(),
        ).addInstructions(
            0,
            """
            new-instance v0, $STATELESS_VIP_CLASS
            invoke-direct {v0}, $STATELESS_VIP_CLASS-><init>()V
            invoke-virtual {v0}, $STATELESS_VIP_CLASS->invoke()Ljava/lang/Object;
            move-result-object v0
            return-object v0
            """.trimIndent(),
        )

        classMethod(
            TV_SPLASH_CLASS,
            "invoke",
            "Ljava/lang/Object;",
            listOf("Ljava/lang/Object;"),
        ).forceFirstBooleanReadTrue("TV splash")

        classMethod(
            PRIVACY_POLICY_CLASS,
            "invoke",
            "Ljava/lang/Object;",
            listOf("Ljava/lang/Object;"),
        ).forceFirstBooleanReadTrue("privacy policy")

        classMethod(
            CROWN_CLICK_CLASS,
            "onClick",
            "V",
            listOf("Landroid/view/View;"),
        ).returnBeforeString("home_tap_crown", "crown click")

        classMethod(
            CONNECT_REPORT_CLASS,
            "<init>",
            "V",
            CP2_CTOR_PARAMS,
        ).forceBooleanWrites(
            fields = listOf(
                Triple(CONNECT_REPORT_CLASS, "e", "Z"),
                Triple(CONNECT_REPORT_CLASS, "f", "Z"),
                Triple(CONNECT_REPORT_CLASS, "g", "Z"),
                Triple(CONNECT_REPORT_CLASS, "h", "Z"),
            ),
            value = 0,
        )

        val userInfoCtor = classMethod(
            USER_INFO_CLASS,
            "<init>",
            "V",
            WCF_CTOR_PARAMS,
        )

        // isPremium = true
        userInfoCtor.forceBooleanWrites(
            fields = listOf(
                Triple(USER_INFO_CLASS, "d", "Z"),
            ),
            value = 1,
        )

        // userState = premium active subscription
        userInfoCtor.forceStringWrite(
            fieldClass = USER_INFO_CLASS,
            fieldName = "j",
            value = PREMIUM_USER_STATE,
        )

        // isMpfEnabled = false
        userInfoCtor.forceBooleanWrites(
            fields = listOf(
                Triple(USER_INFO_CLASS, "n", "Z"),
            ),
            value = 0,
        )

        println("[supervpn] VIP flow, UserInfo, banners, crown/privacy/TV patched")
    }
}
