/*
 * Forked from:
 * https://github.com/andrewliang25/morphe-patches/blob/5db2e57e133aede5297c48b419168cf30fd89953/patches/src/main/kotlin/app/andrewliang/patches/facebook/externalbrowser/ForceExternalBrowserPatch.kt
 * Copyright 2026 Andrew Liang (GPL-3.0).
 *
 * Modified for Hushfacebook (Facebook), 2026, and for HushGram (Instagram), 2026.
 */
package app.morphe.patches.instagram.misc.externalbrowser

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.instagram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.instagram.misc.extension.enableStatus
import app.morphe.patches.instagram.misc.extension.freeLocalsAt
import app.morphe.patches.instagram.misc.extension.instagramExtensionPatch
import app.morphe.patches.instagram.misc.extension.localRegisterCount
import app.morphe.patches.instagram.misc.extension.requireStatusMethod
import app.morphe.patches.instagram.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.namedRegisters
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val REDIRECT =
    "$EXTENSION_PACKAGE/misc/ExternalBrowser;->redirect(Landroid/app/Activity;Landroid/content/Intent;)Z"

private const val PATCH = "Open links in external browser"

/**
 * Instagram's in-app browser, Meta's BrowserLite run in the app's own process. The launchers for
 * a tapped link and for an ad both build an intent for this activity with the link as its data,
 * the ad's with an IABAdsContext in its extras. A kept name the manifest declares.
 */
internal const val IN_APP_BROWSER = "Lcom/instagram/inappbrowser/fragments/BrowserLiteInMainProcessIGActivity;"

@Suppress("unused")
val openLinksExternallyPatch = bytecodePatch(
    name = "Open links in external browser",
    description = "Opens a web link you tap in your default browser instead of Instagram's in-app browser, " +
        "without Instagram's click tracker. Instagram and other Meta pages, and ads, still open in the app.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, instagramExtensionPatch)
    compatibleWith(*AppCompatibilities.instagram())

    // Each hook goes in after the superclass call. At that point the activity is a valid Activity
    // for the extension, and the browser is not built yet. The extension returns false when the
    // link must stay in the app. The injected branch then continues into the original code.
    execute {
        requireStatusMethod("externalBrowser")
        openLinksExternally()
        enableStatus("externalBrowser")
    }
}

/** Both of the browser's hooks, checked before either is written. */
internal fun BytecodePatchContext.openLinksExternally() {
    val browser = mutableClassDefByOrNull(IN_APP_BROWSER)
        ?: throw PatchException("$PATCH: no $IN_APP_BROWSER. Instagram's in-app browser has a new name.")

    // onCreate: the URL is the data of the launch intent. Read it from the activity.
    val onCreate = lifecycleMethod(browser.methods, IN_APP_BROWSER, "onCreate", "Landroid/os/Bundle;")
        .planRedirect(intentFromActivity = true)
    // onNewIntent: the new URL comes in as the parameter. getIntent() still returns the intent
    // that started the browser, which holds the previous link.
    val onNewIntent = lifecycleMethod(browser.methods, IN_APP_BROWSER, "onNewIntent", "Landroid/content/Intent;")
        .planRedirect(intentFromActivity = false)

    onCreate.write()
    onNewIntent.write()
}

/** The browser activity's [name] method taking one [parameter], or a refusal naming it. */
internal fun <T : Method> lifecycleMethod(methods: Iterable<T>, activity: String, name: String, parameter: String): T =
    methods.filter { it.name == name && it.parameterTypes.map(CharSequence::toString) == listOf(parameter) }
        .singleOrPatchException("$PATCH: $activity's $name($parameter)")

/** Puts the redirect after the superclass call of this method. See [planRedirect]. */
internal fun MutableMethod.hookRedirect(intentFromActivity: Boolean) = planRedirect(intentFromActivity).write()

/**
 * Where the redirect goes in this method and what it borrows, checked without writing anything.
 *
 * With [intentFromActivity] the redirect asks the activity for its intent, as onCreate has to;
 * without it the intent is the method's parameter, as onNewIntent gets it.
 *
 * The redirect must go after the superclass call. Before it, the superclass call does not run, and
 * Android answers with `SuperNotCalledException`.
 */
internal fun MutableMethod.planRedirect(intentFromActivity: Boolean): RedirectPlan {
    val superCall = ownSuperCallIndex()
    val injectIndex = superCall + 1

    // The calls below name p0, and onNewIntent's p1, in operands that only reach v15. The
    // patcher's smali compiler leaves out an instruction whose register doesn't fit, without a
    // word, so a method with its parameters higher up has to stop the patch here instead.
    val highest = localRegisterCount() + if (intentFromActivity) 0 else 1
    if (highest > 15) {
        throw PatchException(
            "$PATCH: $definingClass->$name holds a parameter the redirect names in v$highest, above v15",
        )
    }
    requireSuperCallPassesParameters(superCall, if (intentFromActivity) 1 else 2)

    val traceClose = traceCloseIndex(superCall)
    val register = redirectRegister(injectIndex, traceClose)
    return RedirectPlan(this, injectIndex, traceClose, register, intentFromActivity)
}

/** A redirect [planRedirect] checked, written by [write]. */
internal class RedirectPlan(
    private val method: MutableMethod,
    private val injectIndex: Int,
    private val traceClose: Int?,
    private val register: Int,
    private val intentFromActivity: Boolean,
) {
    fun write() {
        val intent = if (intentFromActivity) "v$register" else "p1"
        val loadIntent = if (intentFromActivity) {
            """
                invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
                move-result-object v$register
            """
        } else {
            ""
        }
        val call = """
            $loadIntent
            invoke-static { p0, $intent }, $REDIRECT
            move-result v$register
        """

        if (traceClose != null) {
            // The method opens a trace section in its prologue. A direct return leaves that
            // section open. Thus the branch jumps to the instruction that loads the marker of the
            // close call.
            method.addInstructionsWithLabels(
                injectIndex,
                "$call\nif-nez v$register, :handled",
                ExternalLabel("handled", method.getInstruction(traceClose)),
            )
        } else {
            // There is no trace section to balance, thus the redirect returns. The label binds to
            // the real instruction that comes after, and never to one inside the injected block.
            method.addInstructionsWithLabels(
                injectIndex,
                "$call\nif-eqz v$register, :keepInApp\nreturn-void",
                ExternalLabel("keepInApp", method.getInstruction(injectIndex)),
            )
        }
    }
}

/**
 * The register the redirect borrows after the super call at [injectIndex] - 1: the lowest local,
 * v15 or below since the redirect call names it, that nothing reads from there on. When the
 * redirect jumps to the trace section's close at [traceClose], nothing may read it from there
 * either. The redirect sits in the middle of the method, where a local can still hold something
 * the rest of it wants, so v0 isn't taken on trust.
 */
internal fun Method.redirectRegister(injectIndex: Int, traceClose: Int?): Int =
    freeLocalsAt(PATCH, injectIndex, 1, targets = listOfNotNull(traceClose)).single()

/**
 * Throws unless the super call at [superCall] passes the method's own first [count] parameter
 * registers, `this` and then the rest, in order. The redirect right after it reads p0, and
 * onNewIntent's p1, as the activity and the new intent. A method that had put something else in
 * one of them would still hand the super call the real ones from another register, and the
 * redirect would read the other value without a word.
 */
internal fun Method.requireSuperCallPassesParameters(superCall: Int, count: Int) {
    val call = implementation!!.instructions.elementAt(superCall)
    val passed = call.namedRegisters()
    val parameters = (0 until count).map { localRegisterCount() + it }
    if (passed.take(count) != parameters) {
        throw PatchException(
            "$PATCH: $definingClass->$name's super call passes ${passed.joinToString { "v$it" }}, not its own " +
                parameters.joinToString { "v$it" } + ", so they may hold something else where the redirect reads them",
        )
    }
}

/**
 * Where this method calls the method it overrides: the one `invoke-super` with its own name,
 * parameters and return type. Not simply the first super call, since a browser activity can make
 * another one first, such as `getResources()`. None, or two, stops the patch.
 */
internal fun MutableMethod.ownSuperCallIndex(): Int =
    instructions().withIndex().filter { (_, instruction) ->
        val call = instruction.methodReferenceOrNull()
        (instruction.opcode == Opcode.INVOKE_SUPER || instruction.opcode == Opcode.INVOKE_SUPER_RANGE) &&
            call != null && call.name == name && call.returnType == returnType &&
            call.parameterTypes.map(CharSequence::toString) == parameterTypes.map(CharSequence::toString)
    }.map { it.index }
        .singleOrPatchException("$PATCH: $definingClass->$name's call to super.$name")

/**
 * Where the trace section of the method closes, or null when the method opens none.
 *
 * Instagram wraps onCreate in a section, as Facebook does: a static call before the super call
 * returns the section's marker, and the last static call on the same class that returns nothing
 * takes it back. Instagram 449 loads the close's own label with a `const` just before that call,
 * and a jump to that `const` keeps the section balanced with the right label. A close fed any
 * other way would get whatever its registers held at the jump, so it stops the patch.
 */
internal fun MutableMethod.traceCloseIndex(superCall: Int): Int? {
    val instructions = instructions()

    val tracer = instructions.take(superCall).firstNotNullOfOrNull { instruction ->
        instruction.methodReferenceOrNull()
            ?.takeIf { instruction.opcode == Opcode.INVOKE_STATIC && it.returnType == "I" }
            ?.definingClass
    } ?: return null

    val closeIndex = instructions.indexOfLast { instruction ->
        instruction.opcode == Opcode.INVOKE_STATIC &&
            instruction.methodReferenceOrNull()
                ?.let { it.definingClass == tracer && it.returnType == "V" } == true
    }
    if (closeIndex <= superCall) return null

    val feed = instructions[closeIndex - 1]
    val feedsTheClose = feed.opcode in MARKER_LOADS &&
        (feed as OneRegisterInstruction).registerA in instructions[closeIndex].namedRegisters()
    if (!feedsTheClose) {
        throw PatchException(
            "$PATCH: $definingClass->$name closes its trace section at instruction $closeIndex without a const " +
                "loading its label just before, so the redirect has nowhere to jump that keeps the section balanced",
        )
    }
    return closeIndex - 1
}

private val MARKER_LOADS = setOf(Opcode.CONST, Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST_HIGH16)

private fun MutableMethod.instructions(): List<Instruction> =
    implementation?.instructions?.toList()
        ?: throw IllegalStateException("$definingClass->$name has no body to patch")

private fun Instruction.methodReferenceOrNull() =
    (this as? ReferenceInstruction)?.reference as? MethodReference
