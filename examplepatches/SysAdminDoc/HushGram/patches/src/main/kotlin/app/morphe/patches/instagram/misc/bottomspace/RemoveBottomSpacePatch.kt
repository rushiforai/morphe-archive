/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.bottomspace

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.instagram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.instagram.misc.extension.enableStatus
import app.morphe.patches.instagram.misc.extension.instagramExtensionPatch
import app.morphe.patches.instagram.misc.extension.requireStatusMethod
import app.morphe.patches.instagram.misc.settings.EXTENSION_ROOT
import app.morphe.patches.instagram.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val PATCH = "Remove the empty space at the bottom"
internal const val NAVIGATION_BAR_HEIGHT = "$EXTENSION_PACKAGE/misc/BottomSpace;->navigationBarHeight(I)I"

/**
 * Strings only Instagram's window insets listener loads together: it looks up whether the phone has
 * a navigation bar when the phone reports none.
 */
internal const val SHOW_NAVIGATION_BAR = "config_showNavigationBar"
internal const val NAVIGATION_BAR_NOT_FOUND = "_hasNavigationBar_notFound"

/** The system dimension the guess is read from, loaded by the helper the listener calls for it. */
internal const val NAVIGATION_BAR_DIMENSION = "navigation_bar_height"

private const val CONTEXT = "Landroid/content/Context;"

/**
 * Leaves out the room Instagram keeps under its tab bar for a navigation bar the phone doesn't show.
 * Off in the default selection: on a phone that reports its navigation bar late, Instagram's guess
 * is what keeps the tab bar clear of it, so leaving it out is the user's pick.
 */
@Suppress("unused")
val removeBottomSpacePatch = bytecodePatch(
    name = "Remove the empty space at the bottom",
    description = "Takes away the empty room Instagram leaves under its tab bar for a navigation bar that isn't there, " +
        "on a phone that hides its navigation bar and in a pop-up window. A change to the switch shows once Instagram restarts.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch, instagramExtensionPatch)
    compatibleWith(*AppCompatibilities.instagram())

    execute {
        requireStatusMethod("bottomSpace")
        dropGuessedNavigationBar(findGuessedNavigationBar())
        enableStatus("bottomSpace")
    }
}

private fun refuse(detail: String): Nothing = throw PatchException("$PATCH: $detail")

/** The listener, and where the guessed height's move-result is and the register it fills. */
internal class GuessedNavigationBar(val type: String, val name: String, val parameters: List<String>, val at: Int, val register: Int)

/**
 * Finds the one method outside the extension that loads both [SHOW_NAVIGATION_BAR] and
 * [NAVIGATION_BAR_NOT_FOUND], then its one static call taking a Context and answering an int into a
 * method that loads [NAVIGATION_BAR_DIMENSION]: the guess. Fails when the listener isn't there,
 * there's more than one, or it reads the guess some other way, since that's an update this patch
 * hasn't seen.
 */
internal fun BytecodePatchContext.findGuessedNavigationBar(): GuessedNavigationBar {
    val listeners = mutableListOf<Pair<String, Method>>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        classDef.methods.filter { it.holdsString(SHOW_NAVIGATION_BAR) && it.holdsString(NAVIGATION_BAR_NOT_FOUND) }
            .forEach { listeners += classDef.type to it }
    }
    val (type, listener) = listeners.singleOrNull()
        ?: refuse("expected one method loading $SHOW_NAVIGATION_BAR and $NAVIGATION_BAR_NOT_FOUND, found ${listeners.size}")

    val code = listener.implementation!!.instructions.toList()
    val guesses = code.withIndex().filter { (_, instruction) ->
        if (instruction.opcode != Opcode.INVOKE_STATIC && instruction.opcode != Opcode.INVOKE_STATIC_RANGE) return@filter false
        val called = (instruction as ReferenceInstruction).reference as MethodReference
        called.returnType == "I" && called.parameterTypes.map(CharSequence::toString) == listOf(CONTEXT) &&
            readsTheDimension(called)
    }
    val (at, _) = guesses.singleOrNull()
        ?: refuse("expected one read of $NAVIGATION_BAR_DIMENSION in $type->${listener.name}, found ${guesses.size}")
    val result = code.getOrNull(at + 1)
    if (result?.opcode != Opcode.MOVE_RESULT) refuse("$type->${listener.name} drops the guessed height")
    return GuessedNavigationBar(
        type, listener.name, listener.parameterTypes.map(CharSequence::toString), at + 1,
        (result as OneRegisterInstruction).registerA,
    )
}

private fun BytecodePatchContext.readsTheDimension(called: MethodReference): Boolean {
    val helper = classDefByOrNull(called.definingClass)?.methods?.firstOrNull {
        it.name == called.name && AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == called.returnType &&
            it.parameterTypes.map(CharSequence::toString) == called.parameterTypes.map(CharSequence::toString)
    } ?: return false
    return helper.holdsString(NAVIGATION_BAR_DIMENSION)
}

private fun Method.holdsString(value: String) = implementation?.instructions?.any {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value
} == true

/**
 * Right after the listener moves the guessed height out, passes it through [NAVIGATION_BAR_HEIGHT].
 * A range call, so the register may be any.
 */
internal fun BytecodePatchContext.dropGuessedNavigationBar(guess: GuessedNavigationBar) {
    val method = mutableClassDefBy(guess.type).methods.single {
        it.name == guess.name && it.parameterTypes.map(CharSequence::toString) == guess.parameters
    }
    method.addInstructions(
        guess.at + 1,
        """
            invoke-static/range { v${guess.register} .. v${guess.register} }, $NAVIGATION_BAR_HEIGHT
            move-result v${guess.register}
        """,
    )
}
