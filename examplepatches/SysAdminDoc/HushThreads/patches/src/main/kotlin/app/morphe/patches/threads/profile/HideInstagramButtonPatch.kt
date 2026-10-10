/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Found by reading 450, 449 and 448 (2026-10-09).
 */
package app.morphe.patches.threads.profile

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.parameterRegister
import app.morphe.patches.threads.misc.extension.parameterRegisterNumber
import app.morphe.patches.threads.misc.extension.requireParameterIntact
import app.morphe.patches.threads.misc.extension.requireStatusMethod
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.settings.EXTENSION_ROOT
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.EnumSet

private const val PATCH = "Hide the Instagram button"
internal const val INSTAGRAM_BUTTON = "$EXTENSION_PACKAGE/profile/InstagramButton;"
internal const val SHOW = "$INSTAGRAM_BUTTON->show(Z)Z"

/** The test tag Threads puts on the Instagram button in a profile's header. Kept as is in 448 to 450. */
internal const val INSTAGRAM_BUTTON_TAG = "profile_screen_ig_app_switcher"

/** Every instruction that can send control somewhere other than the next one, returns and throws aside. */
private val BRANCHES = EnumSet.of(
    Opcode.IF_EQ, Opcode.IF_NE, Opcode.IF_LT, Opcode.IF_GE, Opcode.IF_GT, Opcode.IF_LE,
    Opcode.IF_EQZ, Opcode.IF_NEZ, Opcode.IF_LTZ, Opcode.IF_GEZ, Opcode.IF_GTZ, Opcode.IF_LEZ,
    Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32, Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH,
)

/**
 * The profile header's button row: [method], the declared parameter [parameter] that says whether
 * the Instagram button goes in, the `if-eqz` at [guard] that skips the button when it's false, and
 * the tag at [tag] the button's code sets.
 */
internal class ButtonRow(val method: Method, val parameter: Int, val guard: Int, val tag: Int)

/**
 * Hides the Instagram button at the top of a profile.
 *
 * Threads draws a profile header's row of buttons in one Compose function and gives it a boolean
 * parameter for the Instagram button. The button's code sets the test tag [INSTAGRAM_BUTTON_TAG],
 * and an `if-eqz` on that parameter skips all of it when the parameter is false, which is the path
 * Threads already takes for a header without the button. The extension is asked for the parameter
 * first thing, and while the switch is on it answers false. Your own profile and other people's
 * share the function.
 *
 * The function is found by the tag, which has to appear exactly once. The patch refuses rather than
 * guessing when the last branch before the tag isn't an `if-eqz` on a boolean parameter that jumps
 * past it, when anything else jumps, falls or throws into the button's code, or when the parameter is
 * written over before the check reads it.
 */
@Suppress("unused")
val hideInstagramButtonPatch = bytecodePatch(
    name = PATCH,
    description = "Takes the Instagram button off the top of profiles, yours and other people's. The other " +
        "buttons stay. Good for a tidier profile. Starts off. Turn it on in HushThreads settings > More " +
        "settings > Appearance.",
) {
    category("Interface")
    dependsOn(settingsPatch)
    dependsOn(threadsExtensionPatch)
    compatibleWith(*AppCompatibilities.threads())

    execute {
        requireStatusMethod("hideInstagramButton")
        val row = buttonRow()
        val flag = row.method.parameterRegister(row.parameter)
        mutableClassDefBy(row.method.definingClass).findMutableMethodOf(row.method).addInstructions(
            0,
            """
                invoke-static/range { $flag .. $flag }, $SHOW
                move-result $flag
            """,
        )
        enableStatus("hideInstagramButton")
    }
}

/** A method's full signature. A Method is a MethodReference too. */
private fun Method.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

internal fun Instruction.isInstagramButtonTag(): Boolean =
    opcode == Opcode.CONST_STRING && getReference<StringReference>()?.string == INSTAGRAM_BUTTON_TAG

/** Threads' profile header button row: the one place outside the extension that sets [INSTAGRAM_BUTTON_TAG]. */
internal fun BytecodePatchContext.buttonRow(): ButtonRow {
    val tags = classDefByStrings(INSTAGRAM_BUTTON_TAG, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_ROOT) }
        .flatMap { it.methods }
        .distinctBy { it.signature() }
        .filter { method -> method.implementation?.instructions?.any { it.isInstagramButtonTag() } == true }
        // Read through the mutable copy, so what's checked is what the hook goes into.
        .map { mutableClassDefBy(it.definingClass).findMutableMethodOf(it) }
        .flatMap { method ->
            val body = method.implementation?.instructions?.toList().orEmpty()
            body.indices.filter { body[it].isInstagramButtonTag() }.map { method to it }
        }
    val (method, tag) = tags.singleOrPatchException("$PATCH: the profile header's \"$INSTAGRAM_BUTTON_TAG\" tag")
    return method.buttonRowAt(tag)
}

/** The check in front of the Instagram button whose tag is set at [tag]. Throws unless it's the only way in. */
internal fun Method.buttonRowAt(tag: Int): ButtonRow {
    val flow = ControlFlow.of(this)
    val body = flow.instructions
    val guard = (tag - 1 downTo 0).firstOrNull { body[it].opcode in BRANCHES }
        ?: throw PatchException("$PATCH: nothing in ${signature()} decides whether its Instagram button is drawn")
    if (body[guard].opcode != Opcode.IF_EQZ) {
        throw PatchException("$PATCH: ${signature()} decides on its Instagram button with ${body[guard].opcode}, not an if-eqz")
    }
    // Nothing but the check's fall-through leads to the button: no jump, switch or handler lands in it.
    val into = Array(body.size) { mutableListOf<Int>() }
    for (from in body.indices) (flow.normal[from] + flow.exceptional[from]).forEach { into[it] += from }
    for (at in guard + 1..tag) {
        if (into[at] != listOf(at - 1)) {
            throw PatchException("$PATCH: ${signature()} reaches instruction $at of its Instagram button from ${into[at]}, " +
                "not only past the check at $guard")
        }
    }
    val skip = flow.normal[guard].singleOrNull { it != guard + 1 }
    if (skip == null || skip <= tag) {
        throw PatchException("$PATCH: the check at $guard in ${signature()} doesn't jump past its Instagram button")
    }
    val register = (body[guard] as OneRegisterInstruction).registerA
    val parameter = parameterTypes.indices.firstOrNull { parameterRegisterNumber(it) == register }
        ?: throw PatchException("$PATCH: the check at $guard in ${signature()} reads v$register, which isn't a parameter")
    if (parameterTypes[parameter].toString() != "Z") {
        throw PatchException("$PATCH: the check at $guard in ${signature()} reads parameter $parameter, " +
            "a ${parameterTypes[parameter]}, not a boolean")
    }
    // The hook goes in first thing, so the check has to read the parameter as it came in.
    requireParameterIntact(PATCH, parameter, listOf(guard))
    return ButtonRow(this, parameter, guard, tag)
}
