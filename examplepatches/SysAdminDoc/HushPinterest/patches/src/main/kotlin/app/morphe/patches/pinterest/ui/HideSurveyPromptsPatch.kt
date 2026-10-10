/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.freeLocalsAt
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.EXTENSION_ROOT
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "Hide survey prompts"

/**
 * The element Pinterest logs when Maybe later is tapped on its "Got a minute?" survey invite, an
 * enum constant's name, which Pinterest keeps. Only that button's click handler reads it.
 */
internal const val SURVEY_DECLINE = "SURVEY_IN_BROWSER_PROMPT_DECLINE_BUTTON"

/** The counter name format the same click handler logs, which finds it by string. */
internal const val SURVEY_DECLINE_COUNTER = "%s_%s_%d_%d"

/** Why a Gestalt modal alert went away: a kept enum, CONFIRM_BUTTON_CLICK for the primary button. */
internal const val ALERT_DISMISS_REASON = "Lcom/pinterest/component/alert/AlertContainer\$a;"

/** The reason Pinterest's alert container gives when the secondary button, here Maybe later, closes it. */
internal const val ALERT_CANCEL = "CANCEL_BUTTON_CLICK"
private const val ALERT_CONFIRM = "CONFIRM_BUTTON_CLICK"

internal const val SURVEY_HOOK = "$UI_HOOKS->hideSurveyPrompts()Z"

/** The survey experience an advertiser sponsored poll comes as, an enum constant's name Pinterest keeps. */
internal const val SPONSORED_POLL = "ANDROID_IN_APP_BRAND_SURVEY"

/** The sponsored poll's own view. It keeps its name, and the poll's pop-up builds it. */
internal const val POLL_VIEW = "Lcom/pinterest/expressSurvey/view/ExpressSurveyView;"

internal const val SPONSORED_POLL_HOOK = "$UI_HOOKS->hideSponsoredPolls()Z"

private const val FUNCTION1 = "Lkotlin/jvm/functions/Function1;"
private const val FUNCTION1_INVOKE = "$FUNCTION1->invoke(Ljava/lang/Object;)Ljava/lang/Object;"

/**
 * The survey invite launcher's shape: an instance method answering nothing that takes a String, a
 * Context, the experience, a ScreenLocation, the event manager, the placement and a Bundle. One
 * method has it.
 */
internal fun Method.isSurveyLauncher(): Boolean {
    if (implementation == null || AccessFlags.STATIC.isSet(accessFlags) || returnType != "V") return false
    val types = parameters()
    return types.size == 7 && types[0] == "Ljava/lang/String;" && types[1] == "Landroid/content/Context;" &&
        types[3] == "Lcom/pinterest/framework/screens/ScreenLocation;" && types[6] == "Landroid/os/Bundle;" &&
        listOf(2, 4, 5).all { types[it].startsWith("L") && !types[it].startsWith("Ljava/") && !types[it].startsWith("Landroid/") }
}

private fun Method.reads(field: FieldReference, opcode: Opcode) = instructions().any {
    it.opcode == opcode && ((it as ReferenceInstruction).reference as? FieldReference)?.toString() == field.toString()
}

private fun Method.readsStatic(owner: String, name: String) = instructions().any {
    it.opcode == Opcode.SGET_OBJECT && ((it as ReferenceInstruction).reference as? FieldReference)
        ?.let { field -> field.definingClass == owner && field.name == name && field.type == owner } == true
}

/**
 * Where the hook goes and what it uses, all found and checked before anything changes.
 *
 * @property at the instruction right after the launcher stores the alert's dismiss listener
 * @property alert the register holding the alert there
 * @property notifier the alert's own method that hands a dismiss reason to that listener
 * @property scratch the one local the hook borrows
 */
internal class SurveyPrompt(val launcher: MutableMethod, val at: Int, val alert: Int, val notifier: String, val scratch: Int)

/**
 * Pinterest builds its "Got a minute?" survey invite in one launcher. It makes a Gestalt modal
 * alert, gives its secondary button, Maybe later, the click handler that logs [SURVEY_DECLINE],
 * stores a dismiss listener in the alert, and only then posts the alert to show after a delay.
 * When the alert closes for any reason but its primary button, that listener tells Pinterest's
 * survey manager the invite was dismissed, which marks the experience dismissed on the server.
 * Tapping Maybe later closes it with [ALERT_CANCEL].
 *
 * The hook goes right after that store. With the switch on it hands [ALERT_CANCEL] to the alert's
 * own notifier, so Pinterest runs exactly what follows Maybe later, and returns before the alert
 * is posted. Off or paused, the launcher carries on as it always did.
 */
internal fun BytecodePatchContext.surveyPrompt(): SurveyPrompt {
    val declines = methodsWithString(SURVEY_DECLINE_COUNTER)
        .filter { method -> method.fields().any { it.name == SURVEY_DECLINE && it.type == it.definingClass } }
        .map { it.definingClass }.distinct()
    val decline = declines.one("$PATCH: Maybe later handler")

    val launchers = mutableListOf<Method>()
    classDefForEach { owner ->
        if (!owner.type.startsWith(EXTENSION_ROOT)) owner.methods.filterTo(launchers) { it.isSurveyLauncher() }
    }
    val found = launchers.one("$PATCH: survey invite launcher")
    if (found.instructions().none { it.opcode == Opcode.NEW_INSTANCE &&
            ((it as ReferenceInstruction).reference as TypeReference).type == decline }) {
        throw PatchException("$PATCH: the survey invite launcher no longer builds the Maybe later handler")
    }

    val reason = classDefByOrNull(ALERT_DISMISS_REASON)
        ?: throw PatchException("$PATCH: $ALERT_DISMISS_REASON is missing")
    if (reason.fields.none { it.name == ALERT_CANCEL && it.type == ALERT_DISMISS_REASON && AccessFlags.STATIC.isSet(it.accessFlags) }) {
        throw PatchException("$PATCH: $ALERT_DISMISS_REASON has no $ALERT_CANCEL")
    }

    // The alert's dismiss listener: a Function1 field of the alert that one of the alert's own
    // methods, taking only a dismiss reason, reads and invokes.
    val body = found.instructions()
    val stores = body.withIndex().mapNotNull { (index, instruction) ->
        if (instruction.opcode != Opcode.IPUT_OBJECT) return@mapNotNull null
        val field = (instruction as ReferenceInstruction).reference as FieldReference
        if (field.type != FUNCTION1) return@mapNotNull null
        val notifiers = classDefByOrNull(field.definingClass)?.methods?.filter { method ->
            !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
                method.parameters() == listOf(ALERT_DISMISS_REASON) && method.reads(field, Opcode.IGET_OBJECT) &&
                method.calls().any { it.toString() == FUNCTION1_INVOKE }
        }.orEmpty()
        if (notifiers.size == 1) Triple(index, instruction as TwoRegisterInstruction, notifiers.single()) else null
    }
    val (store, put, notifier) = stores.one("$PATCH: survey alert's dismiss listener")

    // The listener stored is new, built right above the store, and it tells the primary button
    // apart from every other way out, so the cancel reason takes its declined arm.
    val built = body.getOrNull(store - 2)
    val listener = ((built as? ReferenceInstruction)?.reference as? TypeReference)?.type
    if (built?.opcode != Opcode.NEW_INSTANCE || (built as OneRegisterInstruction).registerA != put.registerA ||
        (body[store - 1] as? ReferenceInstruction)?.reference.let { it !is MethodReference || it.name != "<init>" || it.definingClass != listener } ||
        classDefByOrNull(listener!!)?.methods?.any { it.name == "invoke" && it.readsStatic(ALERT_DISMISS_REASON, ALERT_CONFIRM) } != true) {
        throw PatchException("$PATCH: the survey alert's dismiss listener no longer tells its primary button from the rest")
    }

    val launcher = mutable(found)
    val at = store + 1
    val next = launcher.implementation!!.instructions.getOrNull(at)
        ?: throw PatchException("$PATCH: the survey invite launcher ends at its dismiss listener")
    if ((next as BuilderInstruction).location.labels.isNotEmpty()) {
        throw PatchException("$PATCH: the instruction after the dismiss listener is also a branch target")
    }
    val alert = put.registerB
    if (alert > 15) throw PatchException("$PATCH: the survey alert is in v$alert, out of reach of a plain invoke")
    val scratch = launcher.freeLocalsAt(PATCH, at, 1, reads = listOf(alert)).single()
    return SurveyPrompt(launcher, at, alert, notifier.toString(), scratch)
}

/** The hook as it goes in front of the instruction after the store. */
internal fun surveyPromptSmali(found: SurveyPrompt) = """
    invoke-static {}, $SURVEY_HOOK
    move-result v${found.scratch}
    if-eqz v${found.scratch}, :hush_keep_survey
    sget-object v${found.scratch}, $ALERT_DISMISS_REASON->$ALERT_CANCEL:$ALERT_DISMISS_REASON
    invoke-virtual { v${found.alert}, v${found.scratch} }, ${found.notifier}
    return-void
"""

/**
 * Where the sponsored poll hook goes.
 *
 * @property runner the method that hands a survey experience to the invite launcher
 * @property at the first instruction of the arm it takes for a sponsored poll instead
 * @property scratch the one local the hook borrows
 */
internal class SponsoredPoll(val runner: MutableMethod, val at: Int, val scratch: Int)

/**
 * Each sponsored poll check in this method as the index its poll arm starts at and the index its
 * branch skips to: a `sget-object` of [SPONSORED_POLL] typed as its own class, a static two-argument
 * check answering a boolean that takes it second, the `move-result` and an `if-eqz` on that answer.
 */
internal fun Method.sponsoredPollArms(): List<Pair<Int, Int>> {
    val body = instructions()
    val addresses = body.runningFold(0) { address, instruction -> address + instruction.codeUnits }
    return (0 until body.size - 3).mapNotNull { k ->
        val read = body[k]
        if (read.opcode != Opcode.SGET_OBJECT) return@mapNotNull null
        val constant = (read as ReferenceInstruction).reference as? FieldReference ?: return@mapNotNull null
        if (constant.name != SPONSORED_POLL || constant.type != constant.definingClass) return@mapNotNull null
        val check = body[k + 1]
        if (check.opcode != Opcode.INVOKE_STATIC) return@mapNotNull null
        val callee = (check as ReferenceInstruction).reference as? MethodReference ?: return@mapNotNull null
        val passed = check as FiveRegisterInstruction
        if (callee.returnType != "Z" || callee.parameters().size != 2 || callee.parameters()[1] != constant.type ||
            passed.registerCount != 2 || passed.registerD != (read as OneRegisterInstruction).registerA) return@mapNotNull null
        val answer = body[k + 2]
        val branch = body[k + 3]
        if (answer.opcode != Opcode.MOVE_RESULT || branch.opcode != Opcode.IF_EQZ ||
            (branch as OneRegisterInstruction).registerA != (answer as OneRegisterInstruction).registerA) return@mapNotNull null
        val target = addresses.indexOf(addresses[k + 3] + (branch as OffsetInstruction).codeOffset)
        if (target <= k + 4 || target >= body.size) null else Pair(k + 4, target)
    }
}

/**
 * Advertiser sponsored polls aren't feed items. Each comes as its own kind of survey experience,
 * and the one method that hands survey experiences to the invite launcher checks for that kind
 * first and opens the poll's own pop-up instead. The hook goes at the start of that arm. With the
 * switch on it returns before anything is built or shown, the same way the method returns when a
 * poll is already open. Every other survey goes on to the invite launcher and [surveyPrompt].
 */
internal fun BytecodePatchContext.sponsoredPoll(launcher: MethodReference): SponsoredPoll {
    fun launches(call: MethodReference) = call.definingClass == launcher.definingClass && call.name == launcher.name &&
        call.parameters() == launcher.parameters() && call.returnType == launcher.returnType

    val sites = mutableListOf<Triple<Method, Int, Int>>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        for (method in owner.methods) {
            val body = method.implementation?.instructions ?: continue
            if (body.none { it.opcode == Opcode.SGET_OBJECT &&
                    ((it as ReferenceInstruction).reference as? FieldReference)?.name == SPONSORED_POLL }) continue
            if (launches(method) || method.calls().none(::launches)) continue
            method.sponsoredPollArms().mapTo(sites) { (at, target) -> Triple(method, at, target) }
        }
    }
    val (found, at, target) = sites.one("$PATCH: advertiser sponsored poll check")
    if (found.returnType != "V") throw PatchException("$PATCH: the sponsored poll check is in a method that answers a value")

    val body = found.instructions()
    if (body.drop(target).none { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let(::launches) == true }) {
        throw PatchException("$PATCH: the sponsored poll check no longer leaves other surveys to the invite launcher")
    }
    val opensPoll = body.subList(at, target).any { instruction ->
        instruction.opcode == Opcode.NEW_INSTANCE &&
            classDefByOrNull(((instruction as ReferenceInstruction).reference as TypeReference).type)?.methods?.any { method ->
                method.instructions().any {
                    it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == POLL_VIEW
                }
            } == true
    }
    if (!opensPoll) throw PatchException("$PATCH: the sponsored poll check no longer opens the poll's own pop-up")

    val runner = mutable(found)
    val first = runner.implementation!!.instructions[at]
    if (first.location.labels.isNotEmpty()) {
        throw PatchException("$PATCH: the sponsored poll arm's first instruction is also a branch target")
    }
    val scratch = runner.freeLocalsAt(PATCH, at, 1).single()
    return SponsoredPoll(runner, at, scratch)
}

/** The hook as it goes in front of the sponsored poll arm's first instruction. */
internal fun sponsoredPollSmali(found: SponsoredPoll) = """
    invoke-static {}, $SPONSORED_POLL_HOOK
    move-result v${found.scratch}
    if-eqz v${found.scratch}, :hush_keep_poll
    return-void
"""

@Suppress("unused")
val hideSurveyPromptsPatch = bytecodePatch(
    name = PATCH,
    description = "Turns down Pinterest's \"Got a minute?\" survey invite before it pops up, the same way tapping Maybe later does, " +
        "so the same survey doesn't come back. Advertiser sponsored polls don't pop up either. " +
        "Starts off. Turn it on in HushPinterest settings > Interface.",
) {
    category("Interface")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        requireStatusMethod("hideSurveyPrompts")
        requireStatusMethod("surveyPrompts")
        // Both places are found and checked before either changes.
        val invite = surveyPrompt()
        val poll = sponsoredPoll(invite.launcher)
        invite.launcher.addInstructionsWithLabels(invite.at, surveyPromptSmali(invite),
            ExternalLabel("hush_keep_survey", invite.launcher.getInstruction(invite.at)))
        poll.runner.addInstructionsWithLabels(poll.at, sponsoredPollSmali(poll),
            ExternalLabel("hush_keep_poll", poll.runner.getInstruction(poll.at)))
        enableCapability("surveyPrompts")
        enableStatus("hideSurveyPrompts")
    }
}
