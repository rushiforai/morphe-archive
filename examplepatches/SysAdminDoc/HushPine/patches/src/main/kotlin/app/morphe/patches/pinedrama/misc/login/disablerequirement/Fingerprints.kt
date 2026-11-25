/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tiktok/misc/login/disablerequirement/Fingerprints.kt
 */
package app.morphe.patches.pinedrama.misc.login.disablerequirement

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.pinedrama.feedfilter.branchTarget
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// Both gates answer a primitive boolean on 46.2.3, 46.7.3, 46.8.3 and 46.9.3, read off each
// fixture with the dexlib2 probe. Saying so here is what makes a build that changed either of
// them to a Boolean object fail to resolve, instead of taking an integer return and failing
// verification on the phone.
// definingClass and name repeat what the custom blocks check, so the search reads only the
// classes that end that way instead of every method of TikTok (#54).
internal object MandatoryLoginServiceFingerprint : Fingerprint(
    definingClass = "/MandatoryLoginService;",
    name = "enableForcedLogin",
    returnType = "Z",
    custom = { method, classDef ->
        classDef.endsWith("/MandatoryLoginService;") && method.name == "enableForcedLogin"
    },
)

internal object MandatoryLoginService2Fingerprint : Fingerprint(
    definingClass = "/MandatoryLoginService;",
    name = "shouldShowForcedLogin",
    returnType = "Z",
    custom = { method, classDef ->
        classDef.endsWith("/MandatoryLoginService;") && method.name == "shouldShowForcedLogin"
    },
)


private const val PATCH = "Disable login requirement"

/**
 * PineDrama's new user step asks which sign-in mode the install is in. The answers are the enum
 * constants NON_LOGIN and FORCED_LOGIN, and this is the one method of the step's service that
 * loads both.
 */
internal object DramaNujModeFingerprint : Fingerprint(
    definingClass = "/DramaNujServiceImpl;",
    returnType = "L",
    parameters = listOf(),
    custom = { method, classDef ->
        classDef.endsWith("/DramaNujServiceImpl;") &&
            method.implementation?.instructions?.let { code ->
                code.any { it.loadsMode("NON_LOGIN", method.returnType) } &&
                    code.any { it.loadsMode("FORCED_LOGIN", method.returnType) }
            } == true
    },
)

private fun Instruction.loadsMode(name: String, type: String) = opcode == Opcode.SGET_OBJECT &&
    getReference<FieldReference>()?.let { it.name == name && it.type == type } == true

/**
 * The yes or no behind the mode: a static check with no arguments whose yes falls through to
 * NON_LOGIN and whose no jumps to FORCED_LOGIN. The server picks the answer. The sign-in pages,
 * deep links and the drama feed ask the same check on their own, so it is the check that gets
 * answered, and the whole app agrees on the mode the way it does on a stock install.
 */
internal fun noLoginCheck(mode: Method): MethodReference {
    val code = mode.implementation?.instructions?.toList().orEmpty()
    val picks = code.indices.filter { code[it].loadsMode("NON_LOGIN", mode.returnType) }
    val pick = picks.singleOrNull() ?: throw PatchException("$PATCH: the mode loads NON_LOGIN ${picks.size} times.")
    val check = code.getOrNull(pick - 3)?.takeIf { it.opcode == Opcode.INVOKE_STATIC }?.getReference<MethodReference>()
    val answer = code.getOrNull(pick - 2)
    val test = code.getOrNull(pick - 1)
    val shaped = check != null && check.returnType == "Z" && check.parameterTypes.isEmpty() &&
        answer?.opcode == Opcode.MOVE_RESULT && test?.opcode == Opcode.IF_EQZ &&
        (test as OneRegisterInstruction).registerA == (answer as OneRegisterInstruction).registerA &&
        code.branchTarget(pick - 1)?.let { code[it].loadsMode("FORCED_LOGIN", mode.returnType) } == true
    if (!shaped) throw PatchException("$PATCH: the mode is no longer picked by one yes or no.")
    return check!!
}

/** The new user step that opens the sign-in page, unless the page has been shown once before. */
internal object DramaNujLoginStepFingerprint : Fingerprint(
    definingClass = "/DramaNujServiceImpl;",
    returnType = "V",
    strings = listOf(SHOWN_BEFORE_KEY),
    custom = { _, classDef -> classDef.endsWith("/DramaNujServiceImpl;") },
)

internal const val SHOWN_BEFORE_KEY = "has_show_login_page"

/** The index of the move that keeps "the sign-in page was shown before", which the step tests next. */
internal fun shownBeforeRead(step: Method): Int {
    val code = step.implementation?.instructions?.toList().orEmpty()
    val keys = code.indices.filter { code[it].getReference<StringReference>()?.string == SHOWN_BEFORE_KEY }
    val key = keys.singleOrNull() ?: throw PatchException("$PATCH: the step names its key ${keys.size} times.")
    val read = (key + 1..key + 3).firstOrNull { index ->
        code.getOrNull(index)?.getReference<MethodReference>()?.let { call ->
            call.name == "getBoolean" && call.returnType == "Z"
        } == true
    } ?: throw PatchException("$PATCH: the step no longer reads its key as a yes or no.")
    return testedMove(code, read + 1, Opcode.IF_EQZ)
        ?: throw PatchException("$PATCH: the step no longer tests its key straight away.")
}

/** Opens a drama's episodes, and sends a signed-out tap to the sign-in page instead. */
internal object SeriesLoginWallFingerprint : Fingerprint(
    definingClass = "/SeriesInnerFeedInterceptor;",
    name = "onInterceptRoute",
    returnType = "Z",
    custom = { method, classDef ->
        classDef.endsWith("/SeriesInnerFeedInterceptor;") && method.name == "onInterceptRoute"
    },
)

/** The index of the move that keeps "signed in" on that route: its one sign-in check, tested next. */
internal fun signedInRead(route: Method): Int {
    val code = route.implementation?.instructions?.toList().orEmpty()
    val checks = code.indices.filter { index ->
        code[index].getReference<MethodReference>()?.let { call ->
            call.name == "isLogin" && call.returnType == "Z" && call.parameterTypes.isEmpty()
        } == true
    }
    val check = checks.singleOrNull() ?: throw PatchException("$PATCH: the drama route asks about sign-in ${checks.size} times.")
    return testedMove(code, check + 1, Opcode.IF_NEZ)
        ?: throw PatchException("$PATCH: the drama route no longer tests sign-in straight away.")
}

/** [at] when it keeps a call's answer in a register a `const/4` can write and [test] reads it next. */
private fun testedMove(code: List<Instruction>, at: Int, test: Opcode): Int? {
    val move = code.getOrNull(at)?.takeIf { it.opcode == Opcode.MOVE_RESULT } as? OneRegisterInstruction ?: return null
    val next = code.getOrNull(at + 1)?.takeIf { it.opcode == test } as? OneRegisterInstruction ?: return null
    return at.takeIf { move.registerA == next.registerA && move.registerA < 16 }
}
