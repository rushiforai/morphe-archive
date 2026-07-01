package app.morphe.patches.busuu

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal object IsPremiumAccountFingerprint : Fingerprint(
    name = "isPremiumAccount",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("access_data"),
    custom = { method, _ ->
        method.implementation?.instructions?.any { insn ->
            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Landroid/accounts/AccountManager;" &&
                    ref.name == "getUserData"
        } ?: false
    }
)

internal object FeatureAccessClassFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    strings = listOf("FeatureAccessDomainModel(featureId=")
)

internal object GetAccessFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        opcode(Opcode.IGET_BOOLEAN),
        opcode(Opcode.RETURN)
    )
)

internal object PremiumPlusFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = emptyList(),
    filters = listOf(
        opcode(Opcode.CONST_STRING),
        opcode(Opcode.CONST_4),
        opcode(Opcode.INVOKE_VIRTUAL),
        opcode(Opcode.MOVE_RESULT),
        opcode(Opcode.RETURN)
    ),
    strings = listOf("key_user_is_premium_plus")
)

internal object LessonsUnlockedFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = emptyList(),
    filters = listOf(
        opcode(Opcode.CONST_STRING),
        opcode(Opcode.CONST_4),
        opcode(Opcode.INVOKE_VIRTUAL),
        opcode(Opcode.MOVE_RESULT),
        opcode(Opcode.RETURN)
    ),
    strings = listOf("extra_had_lesson_unlocked_for_being_premium_or_b2b")
)