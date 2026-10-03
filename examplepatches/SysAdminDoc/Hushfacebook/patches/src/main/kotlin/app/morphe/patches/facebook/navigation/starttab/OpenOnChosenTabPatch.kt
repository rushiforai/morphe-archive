/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.navigation.starttab

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.feed.feedsheader.FEED_FILTERS_FRAGMENT
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.settings.MAIN_TAB_ACTIVITY
import app.morphe.patches.facebook.misc.settings.declaredInHierarchy
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

/**
 * Opens Facebook on the tab chosen in Hushfacebook's settings when it's started from its launcher
 * icon. See StartTabAnchors.kt for how Facebook picks its start tab, and the extension's
 * StartTabRoute for what the hooks leave alone.
 *
 * The first hook goes first in the onCreate of the main screen's class hierarchy, the method the
 * settings entry already starts in, where the screen's intent is known and nothing of Facebook's
 * has read it yet. It takes the parameters as they come, so it borrows no register. Three more
 * sit in Facebook's start-up: where it hands the main screen a sanitized copy of its intent, where
 * the tab bar decides whether to use the start tab it was given, and where the main screen checks
 * it keeps that tab. Each reads and writes only registers Facebook's own code already uses there.
 * Three more go in the Feeds tab, so a start sent there can open on a chosen filter: see
 * FeedsSubtabAnchors.kt.
 *
 * Off in the default selection: it changes where Facebook opens, which is a choice to make. Picked,
 * its switch still starts off and the tab starts as Marketplace.
 */
@Suppress("unused")
val openOnChosenTabPatch = bytecodePatch(
    // The README table check reads this literal; PATCH carries the same text for the messages.
    name = "Open on a chosen tab",
    description = "Opens Facebook on the tab you pick in Hushfacebook's settings when you start it from its icon. " +
        "It's Marketplace unless you change it. Notifications and links still open where they lead. " +
        "Its switch starts off, so turn it on under Opening Facebook.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        // The route the extension asks by has to be there to be taken. A build whose start tab
        // picker no longer reads the extra would apply this patch and never open the chosen tab.
        val pickers = classDefByStrings(TARGET_TAB_ID, StringComparisonType.EQUALS)
            .flatMap { owner -> owner.methods.filter(::picksStartTab) }
        if (pickers.size != 1) {
            throw PatchException(
                "$PATCH: expected one method that answers Facebook's start tab from an intent's " +
                    "\"$TARGET_TAB_ID\", found ${pickers.size}. Facebook no longer opens a tab the way this patch asks for one.",
            )
        }

        // Every anchor is found before anything changes, so a build missing one is left untouched.
        val handOver = exactlyOne(
            classDefByStrings(SANITIZE_INTENT, StringComparisonType.EQUALS).flatMap { owner ->
                owner.methods.mapNotNull { method -> sanitizedIntentHandOver(method)?.let { method to it } }
            },
            "start-up step that hands the main screen a sanitized copy of its intent (\"$SANITIZE_INTENT\")",
        )
        val gate = exactlyOne(
            classDefByStrings(START_POSITION, StringComparisonType.EQUALS).flatMap { owner ->
                owner.methods.mapNotNull { method -> startPositionGate(method)?.let { method to it } }
            },
            "tab bar start position (\"$START_POSITION\") whose MobileConfig check guards the start tab it was given",
        )
        val keeps = classDefByStrings(TARGET_TAB_ID, StringComparisonType.EQUALS)
            .flatMap { owner -> owner.methods.filter(::keepsAskedStartTab) }
        if (keeps.size != 1) {
            throw PatchException(
                "$PATCH: expected one static check on the main screen that it keeps the start tab its " +
                    "intent's \"$TARGET_TAB_ID\" asked for, found ${keeps.size}.",
            )
        }
        // The Feeds tab's filter (#56), through the handler the Feeds tab already has for one.
        val feeds = classDefByOrNull(FEED_FILTERS_FRAGMENT)
            ?: throw PatchException("$PATCH: this build has no $FEED_FILTERS_FRAGMENT.")
        feedsFragmentRefusal(feeds)?.let { throw PatchException("$PATCH: $it.") }

        // First, since it can still refuse the build before anything else changes.
        val fragment = mutableClassDefBy(FEED_FILTERS_FRAGMENT)
        val handler = fragment.methods.single { it.name == FEEDS_HANDLER }
        handler.askExtensionForFilter(feedsHandlerAnchors(handler)!!)
        fragment.methods.single { it.name == "onResume" && it.parameterTypes.isEmpty() && it.returnType == "V" }
            .tellExtensionAtResumeReturns()
        mutable(handOver.first).handSanitizedIntentToExtension(handOver.second)
        mutable(gate.first).askExtensionAfterGate(gate.second)
        mutable(keeps.single()).askExtensionAtReturns()

        declaredInHierarchy(MAIN_TAB_ACTIVITY, "onCreate", "Landroid/os/Bundle;")
            .addInstruction(0, "invoke-static/range { p0 .. p1 }, $ROUTE")
        enableStatus("startTab")
    }
}

/** The one [found], or a stop naming [what] and how many there were. */
private fun <T> exactlyOne(found: List<T>, what: String): T =
    found.singleOrNull() ?: throw PatchException("$PATCH: expected one $what, found ${found.size}.")

private fun BytecodePatchContext.mutable(method: Method): MutableMethod =
    mutableClassDefBy(method.definingClass).methods.single {
        it.name == method.name && it.returnType == method.returnType &&
            it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString)
    }

/**
 * Replaces the sanitizing step's `Activity.setIntent` at [index] with the extension's stand-in,
 * reading the same registers: the screen and the copy. The stand-in always sets the intent; it
 * only puts the chosen tab back in the copy when it asked for one.
 */
internal fun MutableMethod.handSanitizedIntentToExtension(index: Int) {
    val call = implementation!!.instructions[index]
    val stand = if (call is RegisterRangeInstruction) {
        "invoke-static/range { v${call.startRegister} .. v${call.startRegister + 1} }, $SET_SANITIZED_INTENT"
    } else {
        // The call it replaces named both in four bits, so they fit the same form.
        val (screen, copy) = call.callRegisters()
        "invoke-static { v$screen, v$copy }, $SET_SANITIZED_INTENT"
    }
    replaceInstruction(index, stand)
}

/**
 * Hands the gate's answer, kept by the `move-result` at [index], to the extension and keeps the
 * extension's answer in the same register, before the branch reads it. Nothing may branch to that
 * branch: code arriving there would skip the call.
 */
internal fun MutableMethod.askExtensionAfterGate(index: Int) {
    val branch = implementation!!.instructions[index + 1] as BuilderInstruction
    if (branch.location.labels.isNotEmpty()) {
        throw PatchException("$PATCH: $definingClass->$name has a jump to its start position gate's branch.")
    }
    // The range form of the call reads any register the move-result can name.
    val register = (implementation!!.instructions[index] as OneRegisterInstruction).registerA
    addInstructions(
        index + 1,
        """
            invoke-static/range { v$register .. v$register }, $START_ON_ASKED_TAB
            move-result v$register
        """,
    )
}

/**
 * Hands each answer the check returns to the extension. The call takes the return's place, so a
 * branch to the return goes through it, and a new return follows with the extension's answer.
 */
internal fun MutableMethod.askExtensionAtReturns() {
    val returns = implementation!!.instructions.withIndex()
        .filter { it.value.opcode == Opcode.RETURN }
        .map { it.index to (it.value as OneRegisterInstruction).registerA }
    if (returns.isEmpty()) throw PatchException("$PATCH: $definingClass->$name returns no answer.")
    returns.reversed().forEach { (index, register) ->
        replaceInstruction(index, "invoke-static/range { v$register .. v$register }, $KEEP_ASKED_START_TAB")
        addInstruction(index + 1, "move-result v$register")
        addInstruction(index + 2, "return v$register")
    }
}
