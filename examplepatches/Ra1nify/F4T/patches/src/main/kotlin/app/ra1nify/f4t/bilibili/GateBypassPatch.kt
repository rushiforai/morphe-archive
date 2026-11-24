package app.ra1nify.f4t.bilibili

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.ra1nify.f4t.shared.BILIBILI
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val ANCHOR_ACCOUNT = "accountMigrate"
private const val ANCHOR_PASSPORT = "bili.passport.auth"

@Suppress("unused")
val gateBypassPatch = bytecodePatch(
    name = "No Limit",
    default = false,
) {
    compatibleWith(BILIBILI)

    dependsOn(bilibiliAntiResalePatch)

    execute {
        val gateClass = try {
            mutableClassDefBy { clazz ->
                clazz.usesString(ANCHOR_ACCOUNT) && clazz.usesString(ANCHOR_PASSPORT)
            }
        } catch (t: Throwable) {
            throw PatchException(diagnoseAnchors(t))
        }

        val flags = gateClass.methods
            .filterIsInstance<MutableMethod>()
            .filter { it.isStaticZeroArgBoolean() }

        if (flags.isEmpty()) {
            throw PatchException(
                "${gateClass.type} declares no static zero-argument boolean gate flag"
            )
        }

        for (flag in flags) {
            flag.forceReturnTrue()
            println("[bi1i] gate flag forced true: ${gateClass.type}->${flag.name}")
        }
        println("[bi1i] ${flags.size} gate flag(s) unlocked")
    }
}

private fun BytecodePatchContext.diagnoseAnchors(cause: Throwable): String {
    val onlyAccount = mutableListOf<String>()
    val onlyPassport = mutableListOf<String>()
    val both = mutableListOf<String>()
    classDefByOrNull { true }
    classDefForEach { clazz ->
        val a = clazz.usesString(ANCHOR_ACCOUNT)
        val p = clazz.usesString(ANCHOR_PASSPORT)
        when {
            a && p -> both += clazz.type
            a -> onlyAccount += clazz.type
            p -> onlyPassport += clazz.type
        }
    }
    return buildString {
        append("no unique class references both \"$ANCHOR_ACCOUNT\" and \"$ANCHOR_PASSPORT\"; ")
        append("this host build is not supported. ")
        append("both=$both, only-accountMigrate=$onlyAccount, only-passport=$onlyPassport ")
        append("(${cause.message})")
    }
}

private fun Method.isStaticZeroArgBoolean(): Boolean =
    AccessFlags.STATIC.isSet(accessFlags) &&
        parameterTypes.isEmpty() &&
        returnType == "Z"

private fun ClassDef.usesString(value: String): Boolean = methods.any { method ->
    method.implementation?.instructions?.any { insn ->
        insn is ReferenceInstruction &&
            (insn.reference as? StringReference)?.string == value
    } == true
}

private fun MutableMethod.forceReturnTrue() {
    val body = implementation as? MutableMethodImplementation
        ?: throw PatchException("$definingClass->$name has no mutable implementation")
    if (body.registerCount < 1) {
        throw PatchException("$definingClass->$name has no registers to return a value in")
    }

    while (body.instructions.isNotEmpty()) {
        body.removeInstruction(body.instructions.size - 1)
    }
    addInstructions(0, "const/4 v0, 0x1\nreturn v0")
}
