package app.template.patches.fotmob.spoiler

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.literal
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.ReferenceType
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.fotmob.controls.FotMobControlsCategory
import app.template.patches.fotmob.controls.fotMobControls
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.HevalListFeature
import app.template.patches.shared.hevalcontrols.addHevalGate
import app.template.patches.shared.hevalcontrols.featurePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val SPOILER_FREE ="Lapp/template/extension/fotmob/SpoilerFree;"
internal const val LIVE_SCORE_WIDGET = "Lcom/mobilefootie/appwidget/LiveScoreAppWidget\$Companion;"
private const val MATCH = "Lcom/fotmob/models/Match;"
private const val MATCH_STATUS = "Lcom/fotmob/models/Match\$MatchStatus;"
private const val MATCH_AGGREGATE_STATUS = "Lcom/fotmob/models/Match\$AggregateStatus;"
private const val LEAGUE = "Lcom/fotmob/models/League;"
private const val MATCH_ACTIVITY = "Lcom/fotmob/android/feature/match/ui/MatchActivity;"
private const val LIVE_UPDATE_WORKER = "Lcom/fotmob/android/feature/liveupdate/worker/LiveUpdateWorker;"
private const val REMOTE_MESSAGE = "Lcom/google/firebase/messaging/RemoteMessage;"
private const val BUNDLE = "Landroid/os/Bundle;"

internal val SPOILER_FREE_MODE = HevalFeature(
    id = "fotmob.spoiler_free",
    calm = true,
    name = "Spoiler-free mode",
    description = "Hides live scores and goal alerts for matches and competitions you mark.",
    category = FotMobControlsCategory.SPOILER_FREE,
    icon = "eye_off",
)

/** The matches marked on their match page (FotMob match ids); the user can un-mark them here. */
internal val SPOILER_FREE_MATCHES = HevalListFeature(
    id = "fotmob.spoiler_matches",
    name = "Marked matches",
    description = "Matches you marked on their match page; remove one to show its score again.",
    category = FotMobControlsCategory.SPOILER_FREE,
    icon = "eye_off",
    dependencies = listOf(SPOILER_FREE_MODE.id),
)

/** The competitions marked on their page (league ids, like "Hidden competitions"). */
internal val SPOILER_FREE_COMPETITIONS = HevalListFeature(
    id = "fotmob.spoiler_competitions",
    name = "Marked competitions",
    description = "Competitions you marked on their page; remove one to show its scores again.",
    category = FotMobControlsCategory.SPOILER_FREE,
    icon = "eye_off",
    dependencies = listOf(SPOILER_FREE_MODE.id),
)

// One switch per surface, each default on and each off while the master switch is off, so the user
// chooses what gets hidden. A hook checks its own surface (SpoilerFree.hidesScoreIn* / blocksPush).
private fun spoilerSurface(id: String, name: String, description: String, default: Boolean = true) = HevalFeature(
    id = id,
    // The Calm mode preset turns spoiler protection on; keeping final scores hidden stays the user's call.
    calm = default,
    name = name,
    description = description,
    category = FotMobControlsCategory.SPOILER_FREE,
    default = default,
    icon = "eye_off",
    dependencies = listOf(SPOILER_FREE_MODE.id),
)

internal val SPOILER_FREE_NOTIFICATIONS = spoilerSurface(
    "fotmob.spoiler_notifications", "Hide goal alerts",
    "Drops goal alerts and hides the live notification score while a marked match is on.",
)
internal val SPOILER_FREE_LISTS = spoilerSurface(
    "fotmob.spoiler_lists", "Hide scores in match lists",
    "Hides the score in match lists while a marked match is live.",
)
internal val SPOILER_FREE_MATCH_PAGE = spoilerSurface(
    "fotmob.spoiler_match_page", "Hide scores on the match page",
    "Hides the score at the top of a marked match and in its share text while it is live.",
)
internal val SPOILER_FREE_WIDGET = spoilerSurface(
    "fotmob.spoiler_widget", "Hide scores in the widget",
    "Hides the score in the live score widget while a marked match is live.",
)

/**
 * Off by default (2026-11-22, owner): a marked match shows its score again once it is over; with
 * this on it stays hidden after full time too, on every surface and for the full-time alert.
 */
internal val SPOILER_FREE_KEEP_FINAL = spoilerSurface(
    "fotmob.spoiler_keep_final", "Keep final scores hidden",
    "Keeps the score of a marked match hidden after full time too.",
    default = false,
)

/**
 * FotMob's Match.MatchStatus constants after which a match is over (SpoilerRules.FINISHED in the
 * extension, which reads them by name). The patch checks they still exist, so a rename fails here
 * instead of leaving finished matches hidden.
 */
internal val FINISHED_STATUSES = listOf("Finished", "AfterExtraTime", "AfterPenalties", "AwardedWin", "Aborted", "Cancelled")

/** The live statuses the rule relies on being separate constants (they keep the score hidden). */
private val LIVE_STATUSES = listOf("FirstHalf", "Pause", "SecondHalf", "FirstExtraHalf", "SecondExtraHalf", "PauseExtraTime",
    "PenaltiesAreHappening", "After90Minutes", "WaitingForExtratime", "WaitingForPenalties", "Interrupted", "Started", "NotStarted")

/**
 * The MenuProvider.onCreateMenu(Menu, MenuInflater) that inflates [menu] (R8 renames the provider
 * and the method, so it is found by the menu resource id and the inflate call). Exactly one.
 */
private fun BytecodePatchContext.menuBuilder(menu: String): MutableMethod {
    val id = resourceId(ResourceType.MENU, menu).toInt()
    val matches = Fingerprint(
        returnType = "V",
        parameters = listOf("Landroid/view/Menu;", "Landroid/view/MenuInflater;"),
        filters = listOf(
            literal(id),
            methodCall(definingClass = "Landroid/view/MenuInflater;", name = "inflate"),
        ),
    ).matchAllOrNull().orEmpty()
    if (matches.size != 1) {
        throw PatchException("menu/$menu: expected one (Menu, MenuInflater) builder inflating it, found ${matches.size}")
    }
    val method = matches.single().method
    if (AccessFlags.STATIC.isSet(method.accessFlags)) throw PatchException("$method is static")
    return method
}

/** The one field of the provider's own class the builder reads with iget-object: its activity. */
private fun MutableMethod.hostField(): FieldReference {
    val fields = instructions
        .filter { it.opcode == Opcode.IGET_OBJECT }
        .map { (it as ReferenceInstruction).reference as FieldReference }
        .filter { it.definingClass == definingClass }
        .distinctBy { "${it.name}:${it.type}" }
    return fields.singleOrNull()
        ?: throw PatchException("$definingClass->$name reads ${fields.size} object fields of its own class, expected one (the activity)")
}

private val FieldReference.smali get() = "$definingClass->$name:$type"

private fun Instruction.methodRef() = (this as? ReferenceInstruction)?.reference as? MethodReference

/**
 * Behind the switch at entry: `SpoilerFree.<helper>(menu, activity)`, then the stock builder. The
 * scratch v0 holds the activity; when p1 (the menu) is above v15 the 4-bit iget/invoke cannot name
 * the parameters, so they are copied into v0 and v1 first (that needs a second local).
 */
private fun MutableMethod.addMenuItemHook(host: FieldReference, helper: String) {
    val registers = implementation!!.registerCount
    val locals = registers - (parameterTypes.size + 1)
    val call = "$SPOILER_FREE->$helper(Landroid/view/Menu;Ljava/lang/Object;)V"
    val compact = locals + 1 <= 15 // p1's real index (p0 = v<locals>)
    if (!compact && locals < 2) throw PatchException("$definingClass->$name has $locals local registers, the menu hook needs two")
    addHevalGate(SPOILER_FREE_MODE.id) { v ->
        if (compact) {
            """
                iget-object $v, p0, ${host.smali}
                invoke-static { p1, $v }, $call
            """
        } else {
            """
                move-object/from16 $v, p0
                iget-object v1, $v, ${host.smali}
                move-object/from16 $v, p1
                invoke-static { $v, v1 }, $call
            """
        }
    }
}

/**
 * The fields SpoilerFree reads by name (kept Gson model names) and the MatchStatus constant names
 * its finished rule compares with; a rename fails here.
 */
private fun BytecodePatchContext.requireMatchFields() {
    val wanted = mapOf(
        // 242 turned Match and League into Kotlin classes: Id/ParentId became id/parentId (JSON names kept).
        MATCH to mapOf("id" to "Ljava/lang/String;", "league" to LEAGUE, "StatusOfMatch" to MATCH_STATUS),
        LEAGUE to mapOf("id" to "I", "parentId" to "I"),
    )
    for ((owner, fields) in wanted) {
        val present = classDefBy(owner).fields.associate { it.name to it.type }
        fields.forEach { (name, type) ->
            if (present[name] != type) throw PatchException("$owner->$name is ${present[name]}, expected $type")
        }
    }
    val constants = classDefBy(MATCH_STATUS).fields
        .filter { AccessFlags.ENUM.isSet(it.accessFlags) && it.type == MATCH_STATUS }.map { it.name }.toSet()
    val missing = (FINISHED_STATUSES + LIVE_STATUSES).filterNot(constants::contains)
    if (missing.isNotEmpty()) throw PatchException("$MATCH_STATUS no longer has the constants $missing")
}

/**
 * Match's "has the match started" check (241: z0): the instance ()Z that compares StatusOfMatch with
 * NotStarted and KickOffDelayed and calls nothing. Its siblings (live, finished) call it or take a status.
 */
private fun BytecodePatchContext.startedCheck(): Method {
    fun Method.readsStatus(name: String) = implementation?.instructions?.any {
        it.opcode == Opcode.SGET_OBJECT && ((it as ReferenceInstruction).reference as FieldReference).let { f ->
            f.definingClass == MATCH_STATUS && f.name == name
        }
    } == true
    val candidates = classDefBy(MATCH).methods.filter { m ->
        m.returnType == "Z" && m.parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(m.accessFlags) &&
            m.readsStatus("NotStarted") && m.readsStatus("KickOffDelayed") &&
            m.implementation!!.instructions.none { it.opcode.referenceType == ReferenceType.METHOD }
    }
    return candidates.singleOrNull()
        ?: throw PatchException("$MATCH: ${candidates.size} \"has started\" checks, expected one")
}

/**
 * The home-screen live score widget. LiveScoreAppWidget.Companion's match row builder (static
 * (Context, Match, ...)RemoteViews; 242 added float and flag parameters, so only the first two are
 * matched) hands the match to a model builder, static (Context, Match, String) that returns the row's
 * state. That builder asks the Match whether it has started several times: the first result is stored
 * as the state's "show the score" flag and the others pick the status text. Each started check
 * answers "not started" for a marked match, so the row shows the kickoff time and no score or status.
 * (241 had the checks and the status label inside the row builder itself.)
 */
private fun BytecodePatchContext.widgetScoreHook(): () -> Unit {
    val rows = mutableClassDefBy(LIVE_SCORE_WIDGET).methods.filter {
        it.returnType == "Landroid/widget/RemoteViews;" && AccessFlags.STATIC.isSet(it.accessFlags) &&
            !AccessFlags.SYNTHETIC.isSet(it.accessFlags) &&
            it.parameterTypes.take(2).map(CharSequence::toString) == listOf("Landroid/content/Context;", MATCH)
    }
    if (rows.size != 1) throw PatchException("$LIVE_SCORE_WIDGET: ${rows.size} match row builders, expected one")
    val row = rows.single()
    val started = startedCheck()

    val builderRefs = row.instructions.mapNotNull { it.methodRef() }.filter {
        it.returnType != "V" && it.returnType != "Landroid/widget/RemoteViews;" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", MATCH, "Ljava/lang/String;")
    }.distinctBy { "${it.definingClass}->${it.name}${it.parameterTypes}" }
    val builderRef = builderRefs.singleOrNull()
        ?: throw PatchException("${row.definingClass}->${row.name}: ${builderRefs.size} widget state builders, expected one")
    val builder = mutableClassDefBy(builderRef.definingClass).methods.single {
        it.name == builderRef.name && it.returnType == builderRef.returnType &&
            it.parameterTypes.map(CharSequence::toString) == builderRef.parameterTypes.map(CharSequence::toString)
    }

    val insns = builder.instructions.toList()
    fun MethodReference.isStarted() = definingClass == MATCH && name == started.name && returnType == "Z" && parameterTypes.isEmpty()
    val calls = insns.indices.filter { insns[it].opcode == Opcode.INVOKE_VIRTUAL && insns[it].methodRef()?.isStarted() == true }
    if (calls.isEmpty()) throw PatchException("${builder.definingClass}->${builder.name}: no started check")
    val sites = calls.map { call ->
        if (insns[call + 1].opcode != Opcode.MOVE_RESULT) {
            throw PatchException("${builder.definingClass}->${builder.name}: a started check has no result move")
        }
        val flag = (insns[call + 1] as OneRegisterInstruction).registerA
        val match = (insns[call] as FiveRegisterInstruction).registerC
        if (flag == match) throw PatchException("${builder.definingClass}->${builder.name}: a result overwrites the match register")
        Triple(call, flag, match)
    }

    // Later sites first, so the earlier indexes stay valid.
    return { sites.reversed().forEach { (call, flag, match) -> builder.applyWidgetHook(call, flag, match) } }
}

private fun MutableMethod.applyWidgetHook(startedCall: Int, flag: Int, startedMatch: Int) {
    // A started, marked match counts as not started, so the state takes the kickoff-time branch.
    addInstructionsWithLabelsChecked(
        startedCall + 2,
        """
            if-eqz v$flag, :spoiler_keep
            invoke-static/range { v$startedMatch .. v$startedMatch }, $SPOILER_FREE->hidesScoreInWidget(Ljava/lang/Object;)Z
            move-result v$flag
            xor-int/lit8 v$flag, v$flag, 0x1
        """,
        ExternalLabel("spoiler_keep", getInstruction(startedCall + 2)),
    )
}

/** The score format the live rows, the match page header and the live-update worker share. */
internal const val SCORE_FORMAT = "%d %s- %d"

/**
 * The match rows: every method that formats the live score ([SCORE_FORMAT]) and asks a Match whether
 * it has started (241: the live row, the fixture row, the match page header, two view-holder methods
 * and the live-update worker). Each started check answers "not started" for a marked match, so the
 * code takes its kickoff-time branch exactly as the widget row does. Methods that format the score
 * without that check (the form line, the holder-based builders, the shared string helper) cannot be
 * reached this way.
 */
private fun BytecodePatchContext.scoreRowHooks(): () -> Unit {
    val started = startedCheck()
    fun MethodReference.isStarted() = definingClass == MATCH && name == started.name && returnType == "Z" && parameterTypes.isEmpty()
    fun Instruction.isScoreFormat() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string == SCORE_FORMAT

    // Collect first: the class list must not change while it is walked.
    val targets = mutableListOf<Triple<String, Method, String>>()
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            val insns = method.implementation?.instructions?.toList() ?: return@forEach
            if (insns.any { it.isScoreFormat() } && insns.any { it.methodRef()?.isStarted() == true }) {
                targets += Triple(classDef.type, method, rowHelper(classDef))
            }
        }
    }
    if (targets.isEmpty()) {
        throw PatchException("no method formats the live score (\"$SCORE_FORMAT\") and asks Match whether it started")
    }

    return {
        for ((type, found, helper) in targets) {
            val row = mutableClassDefBy(type).methods.single { it.sameAs(found) }
            val insns = row.instructions.toList()
            val calls = insns.indices.filter { insns[it].methodRef()?.isStarted() == true }
            // Later site first, so the earlier indexes stay valid.
            for (call in calls.asReversed()) row.hideFlagAt(call, insns, helper)
        }
    }
}

private fun Method.sameAs(other: Method) = name == other.name && returnType == other.returnType &&
    parameterTypes.map(CharSequence::toString) == other.parameterTypes.map(CharSequence::toString)

/**
 * The SpoilerFree check a row method uses, so each surface answers to its own Patch settings switch:
 * the match page (MatchActivity itself or one of its lambdas and observers, which R8 names freely but
 * which hold the activity in a field: 242's match header observer e28), the live-update (ongoing)
 * notification, and every other row (the lists).
 */
internal fun rowHelper(classDef: ClassDef) = when {
    classDef.type == MATCH_ACTIVITY ||
        classDef.fields.any { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == MATCH_ACTIVITY } -> "hidesScoreOnMatchPage"
    classDef.type == LIVE_UPDATE_WORKER -> "hidesScoreInNotifications"
    else -> "hidesScoreInLists"
}

/**
 * After a Match boolean getter at [call] (the started check, the "has an aggregate" getter): when the
 * flag is true and SpoilerFree.[helper] says the match's score is hidden, the flag becomes false.
 */
private fun MutableMethod.hideFlagAt(call: Int, insns: List<Instruction>, helper: String) {
    val where = "$definingClass->$name"
    val invoke = insns[call]
    val matchRegister = when (invoke) {
        is FiveRegisterInstruction -> invoke.registerC
        is RegisterRangeInstruction -> invoke.startRegister
        else -> throw PatchException("$where: unexpected started check call ${invoke.opcode}")
    }
    val move = insns.getOrNull(call + 1)
    if (move?.opcode != Opcode.MOVE_RESULT) throw PatchException("$where: the started check has no result move")
    val flag = (move as OneRegisterInstruction).registerA
    if (flag == matchRegister) throw PatchException("$where: the started check's result overwrites the match register v$flag")
    addInstructionsWithLabelsChecked(
        call + 2,
        """
            if-eqz v$flag, :spoiler_keep
            invoke-static/range { v$matchRegister .. v$matchRegister }, $SPOILER_FREE->$helper(Ljava/lang/Object;)Z
            move-result v$flag
            xor-int/lit8 v$flag, v$flag, 0x1
        """,
        ExternalLabel("spoiler_keep", getInstruction(call + 2)),
    )
}

private fun Instruction.isMatchCall() = methodRef()?.definingClass == MATCH && opcode in MATCH_CALLS
private val MATCH_CALLS = setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE)

private fun Instruction.receiver(): Int = when (this) {
    is FiveRegisterInstruction -> registerC
    is RegisterRangeInstruction -> startRegister
    else -> -1
}

private fun Instruction.writesRegister(register: Int): Boolean {
    if (!opcode.setsRegister() || this !is OneRegisterInstruction) return false
    return registerA == register || (opcode.setsWideRegister() && registerA + 1 == register)
}

/**
 * The register holding the Match at [index]: the receiver of the nearest Match call before it, which
 * nothing in between overwrites (the code between is straight-line in every site this is used for).
 */
private fun List<Instruction>.matchRegisterBefore(index: Int, where: String): Int {
    val call = (index - 1 downTo 0).firstOrNull { this[it].isMatchCall() }
        ?: throw PatchException("$where: no Match call before $index")
    val register = this[call].receiver()
    if ((call + 1 until index).any { this[it].writesRegister(register) }) {
        throw PatchException("$where: the Match register v$register is overwritten before $index")
    }
    return register
}

/**
 * After the `move-result-object` at [move] (a String, a status): `v = SpoilerFree.<helper>(v, match)`,
 * optionally cast back to [castTo]. Both registers must fit the 4-bit invoke (rule 11).
 */
private fun MutableMethod.passThroughAt(move: Int, value: Int, match: Int, helper: String, castTo: String? = null) {
    val where = "$definingClass->$name"
    if (value > 15 || match > 15) throw PatchException("$where: v$value/v$match do not fit invoke-static at $move")
    requireNoBranchTargetAt(move + 1, "Spoiler-free pass-through")
    val cast = castTo?.let { "\ncheck-cast v$value, $it" } ?: ""
    addInstructionsChecked(
        move + 1,
        "invoke-static { v$value, v$match }, $SPOILER_FREE->$helper\nmove-result-object v$value$cast",
    )
}

/** The thin-space dash of the live-update header text ("2 - 1 • 67'"). */
internal const val THIN_DASH = " - "

private fun Instruction.stringRef() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun MethodReference.isStringFormat() = definingClass == "Ljava/lang/String;" && name == "format" &&
    parameterTypes.map(CharSequence::toString) == listOf("Ljava/util/Locale;", "Ljava/lang/String;", "[Ljava/lang/Object;")

/**
 * The live-update (ongoing) notification (LiveUpdateWorker's notification builder, the method that
 * formats [SCORE_FORMAT]): its texts are built before the progress bar's started check, so that check
 * alone does not hide them. Three results go through SpoilerFree while the match's score is hidden:
 * the header "2 - 1 • 67'" (the StringBuilder built around [THIN_DASH]: maskLeadingScore keeps the
 * minute) and every String.format of [SCORE_FORMAT] (the score and the penalties: maskScore).
 * Returns the sites as (move-result index, value register, match register, helper), last first.
 */
private fun List<Instruction>.notificationSites(where: String): List<Triple<Int, Pair<Int, Int>, String>> {
    val sites = mutableListOf<Triple<Int, Pair<Int, Int>, String>>()
    // The header: the first StringBuilder.toString after the thin-space dash.
    val dash = indexOfFirst { it.opcode == Opcode.CONST_STRING && it.stringRef() == THIN_DASH }
    if (dash < 0) throw PatchException("$where: no \"$THIN_DASH\" header text")
    val toString = (dash + 1 until size).firstOrNull {
        this[it].methodRef()?.let { r -> r.definingClass == "Ljava/lang/StringBuilder;" && r.name == "toString" } == true
    } ?: throw PatchException("$where: the header text is not built with a StringBuilder")
    sites += headerOrFormatSite(toString, where, "maskLeadingScoreInNotifications(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;")
    // The score formats: String.format(Locale, fmt, args) whose fmt register last got SCORE_FORMAT.
    val formats = indices.filter { i ->
        this[i].methodRef()?.isStringFormat() == true && (this[i] as? FiveRegisterInstruction)?.let { call ->
            val fmt = call.registerD
            val write = (i - 1 downTo 0).firstOrNull { this[it].writesRegister(fmt) }
            write != null && this[write].opcode == Opcode.CONST_STRING && this[write].stringRef() == SCORE_FORMAT
        } == true
    }
    if (formats.isEmpty()) throw PatchException("$where: no String.format of \"$SCORE_FORMAT\"")
    formats.forEach { sites += headerOrFormatSite(it, where, "maskScoreInNotifications(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;") }
    return sites.sortedByDescending { it.first }
}

private fun List<Instruction>.headerOrFormatSite(call: Int, where: String, helper: String): Triple<Int, Pair<Int, Int>, String> {
    val move = this.getOrNull(call + 1)
    if (move?.opcode != Opcode.MOVE_RESULT_OBJECT) throw PatchException("$where: no result move after $call")
    return Triple(call + 1, (move as OneRegisterInstruction).registerA to matchRegisterBefore(call, where), helper)
}

private fun BytecodePatchContext.notificationTextHooks(): () -> Unit {
    val builders = classDefBy(LIVE_UPDATE_WORKER).methods.filter { m ->
        m.implementation?.instructions?.any { it.stringRef() == SCORE_FORMAT } == true
    }
    val builder = builders.singleOrNull()
        ?: throw PatchException("$LIVE_UPDATE_WORKER: ${builders.size} methods format \"$SCORE_FORMAT\", expected one (the notification)")
    // Validate now, before the first edit; the indexes are taken again when applying.
    builder.implementation!!.instructions.toList().notificationSites("$LIVE_UPDATE_WORKER->${builder.name}")
    return {
        val method = mutableClassDefBy(LIVE_UPDATE_WORKER).methods.single { it.sameAs(builder) }
        val where = "$LIVE_UPDATE_WORKER->${method.name}"
        for ((move, registers, helper) in method.instructions.toList().notificationSites(where)) {
            method.passThroughAt(move, registers.first, registers.second, helper)
        }
    }
}

/** Match's "has an aggregate" getter: the instance ()Z that only reads the kept hasAggregate field. */
private fun BytecodePatchContext.aggregateGetter(): Method {
    val getters = classDefBy(MATCH).methods.filter { m ->
        m.returnType == "Z" && m.parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(m.accessFlags) &&
            m.implementation?.instructions?.let { insns ->
                insns.count() <= 3 && insns.any {
                    it.opcode == Opcode.IGET_BOOLEAN && ((it as ReferenceInstruction).reference as FieldReference).name == "hasAggregate"
                }
            } == true
    }
    return getters.singleOrNull() ?: throw PatchException("$MATCH: ${getters.size} hasAggregate getters, expected one")
}

/**
 * The main match row (242: n58, the class of [MatchRowAggregateFingerprint]'s binder). Its started
 * checks are hooked with the other rows; two more things there tell the result:
 * - the aggregate score of a two-legged tie ([AGGREGATE_FORMAT], after Match's hasAggregate getter):
 *   the getter's answer gets the same override, so a hidden match shows no aggregate;
 * - the bold winner name (the row's (holder)V method that reads Match's aggregate status, and the
 *   match status for "won on penalties"): every such getter's result is null while the score is
 *   hidden, so neither team counts as the winner.
 */
private fun BytecodePatchContext.matchRowHooks(): () -> Unit {
    val binder = MatchRowAggregateFingerprint.method
    val where = "${binder.definingClass}->${binder.name}"
    val hasAggregate = aggregateGetter()
    fun MethodReference.isHasAggregate() = definingClass == MATCH && name == hasAggregate.name && returnType == "Z" && parameterTypes.isEmpty()
    val aggregateCalls = binder.instructions.toList().let { insns -> insns.indices.filter { insns[it].methodRef()?.isHasAggregate() == true } }
    if (aggregateCalls.size != 1) throw PatchException("$where: ${aggregateCalls.size} hasAggregate checks, expected one")

    fun MethodReference.isWinnerInput() = definingClass == MATCH && parameterTypes.isEmpty() &&
        (returnType == MATCH_AGGREGATE_STATUS || returnType == MATCH_STATUS)
    val rowClass = classDefBy(binder.definingClass)
    val bolders = rowClass.methods.filter { m ->
        m.returnType == "V" && m.implementation?.instructions?.any {
            it.methodRef()?.let { r -> r.definingClass == MATCH && r.returnType == MATCH_AGGREGATE_STATUS } == true
        } == true
    }
    val bolder = bolders.singleOrNull()
        ?: throw PatchException("${rowClass.type}: ${bolders.size} methods read the aggregate status, expected one (the winner names)")
    fun List<Instruction>.winnerSites(label: String) = indices.filter { this[it].methodRef()?.isWinnerInput() == true }.map { call ->
        val move = getOrNull(call + 1)
        if (move?.opcode != Opcode.MOVE_RESULT_OBJECT) throw PatchException("$label: no result move after the getter at $call")
        Triple(call + 1, (move as OneRegisterInstruction).registerA, this[call].receiver())
    }.also { if (it.isEmpty()) throw PatchException("$label: no winner input") }
    bolder.implementation!!.instructions.toList().winnerSites("${rowClass.type}->${bolder.name}")

    return {
        val row = mutableClassDefBy(rowClass.type)
        // The aggregate text.
        val aggregate = row.methods.single { it.sameAs(binder) }
        val insns = aggregate.instructions.toList()
        aggregate.hideFlagAt(insns.indices.single { insns[it].methodRef()?.isHasAggregate() == true }, insns, "hidesScoreInLists")
        // The bold winner names, later sites first.
        val names = row.methods.single { it.sameAs(bolder) }
        val label = "${row.type}->${names.name}"
        val before = names.instructions.toList()
        for ((move, value, match) in before.winnerSites(label).asReversed()) {
            val type = before[move - 1].methodRef()!!.returnType
            names.passThroughAt(move, value, match, "hiddenInLists(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", type)
        }
    }
}

/**
 * The match share text ([MatchShareTextFingerprint]): it returns "Home 2 - 1 Away" only when Match
 * says the match started, so the started check gets the match page override and a hidden match
 * shares its kickoff date and time instead.
 */
private fun BytecodePatchContext.shareTextHook(): () -> Unit {
    val share = MatchShareTextFingerprint.method
    val started = startedCheck()
    fun MethodReference.isStarted() = definingClass == MATCH && name == started.name && returnType == "Z" && parameterTypes.isEmpty()
    fun List<Instruction>.startedCalls() = indices.filter { this[it].methodRef()?.isStarted() == true }
    // Validate now, before the first edit; the indexes are taken again when applying.
    if (share.instructions.toList().startedCalls().isEmpty()) {
        throw PatchException("${share.definingClass}->${share.name}: the share text no longer asks whether the match started")
    }
    return {
        val insns = share.instructions.toList()
        for (call in insns.startedCalls().asReversed()) share.hideFlagAt(call, insns, "hidesScoreOnMatchPage")
    }
}

// Spoiler-free mode (2026-11-08, owner request), phase 1. The user marks a match on its match page or
// a competition on its page ("Spoiler-free: on/off" in the overflow menu); the marks are two Patch
// settings lists that depend on the switch, so turning the switch off restores stock everywhere and
// the lists can be edited in Patch settings. Stored on the phone only (SpoilerFree in
// extensions/fotmob). Read at use time (menu creation, each push), so no restart is needed.
// What gets hidden is the user's choice: besides the master switch there is one switch per surface
// (notifications, match lists, match page header, widget), each depending on the master. Every hook
// calls its own SpoilerFree check, so turning one surface off restores stock there only.
//
// 1. Notifications: PushMessagingService.onMessageReceived returns at entry, behind the switch, when
//    the message bundle's "m" (match id) is marked or its "lid"/"plid" (league, parent league) is a
//    marked competition. The bundle is RemoteMessage's only Bundle field (the data map FotMob copies
//    for its pipeline is built from it). Non-match pushes carry no "m"/"lid" and pass.
// 2. Match page: the MenuProvider inflating menu/activity_match_facts_v2 (its activity field must be
//    MatchActivity) adds the item; the match id is MatchActivity's "PARAM_MATCHID" extra.
// 3. Competition page: the MenuProvider inflating menu/league_info adds the item; the builder is shared
//    with the team and squad member pages, so the extension only acts for LeagueActivity, whose league
//    id is the "leagueId" extra.
// The item is added before the inflate with order 1000 (after the inflated items) and handles its own
// click (MenuItem's click listener runs before the provider's onMenuItemSelected).
// 4. Home-screen widgets (since 242): the widget row state builder, static (Context, Match, String),
//    called by the LiveScoreAppWidget.Companion row builder, its width measurement and the league
//    widget rows. At each of its Match "has started" checks a marked match answers false, so the row
//    shows the kickoff time and no score. A live marked match keeps an empty live-text view, and an
//    aborted match still shows its status label. The Match model and sorting are stock.
// 5. Match rows: every method that formats the live score ("%d %s- %d") and asks Match whether it
//    started (the live row, the fixture row, the match page header, two view-holder methods and the
//    live-update worker, six in 241 and 242) gets the same override at each started check, so a
//    marked match shows its kickoff time (or, in the main row, the minute) there too. The match page
//    header (MatchActivity and its observers, which hold the activity) answers to the match page
//    switch, the worker to the notifications switch, the rest to the lists switch.
//
// Live only (2026-11-22, owner rule of 2026-11-22): every SpoilerFree check also reads the match's
// status (Match.StatusOfMatch, by its enum constant name) and hides only while the match is not over
// (SpoilerRules.FINISHED: Finished, AfterExtraTime, AfterPenalties, AwardedWin,
// Aborted, Cancelled; an unknown or unreadable status counts as live). The hooks run on every bind and
// update, so the score comes back at the next bind once the match is over, with no un-marking. The
// "Keep final scores hidden" switch (off by default) keeps finished marked matches hidden too.
// Same date, more surfaces and fixes:
// 6. The live-update notification's texts are built before its started check, so they get their
//    own pass-throughs: the header "2 - 1 • 67'" and every "%d %s- %d" result (score, penalties).
// 7. The main match row: its aggregate score (after Match's hasAggregate getter) and its bold winner
//    names (the aggregate status and match status getters answer null while hidden).
// 8. The match share text: its started check answers to the match page switch.
// 9. Pushes: blocksPush reads the bundle's "status" (a MatchStatus name), so the full-time push of a
//    marked match goes through unless final scores stay hidden; a missing status still blocks.
// Not covered: the score-drawing methods that never ask Match whether it started (the team form
// lines and team-vs-team rows, ivd.w and gvd.w in 242, whose win/draw/loss colour would still tell
// the result; the widget's shared score helper ynf.f is fed by the hooked state builder), the match
// page tabs (events with hbe.o's half-time score and s48's goal lines, stats, momentum, the shot map
// t9c.o), the event share text, the team widget, search, head-to-head, brackets, standings, the
// status text ("FT", the minute), and the bold winner name of other rows (fa8.a) and the widget after
// a penalty shootout, which only matter with "Keep final scores hidden" on.
@Suppress("unused")
val spoilerFreeModePatch = fotMobControls.featurePatch(
    SPOILER_FREE_MODE,
    default = true,
) {
    // The FotMob extension comes with the Patch settings host (its Settings row lives there).
    classDefBy(SPOILER_FREE)

    // Find every site before the first edit.
    val push = PushMessageReceivedFingerprint.method
    val bundleFields = classDefBy(REMOTE_MESSAGE).fields.filter {
        it.type == BUNDLE && !AccessFlags.STATIC.isSet(it.accessFlags)
    }
    val bundle = bundleFields.singleOrNull()
        ?: throw PatchException("$REMOTE_MESSAGE has ${bundleFields.size} Bundle fields, expected one (the message)")

    val matchMenu = menuBuilder("activity_match_facts_v2")
    val matchHost = matchMenu.hostField()
    if (matchHost.type != MATCH_ACTIVITY) {
        throw PatchException("${matchMenu.definingClass}: the match menu builder's field is ${matchHost.type}, not MatchActivity")
    }
    val leagueMenu = menuBuilder("league_info")
    val leagueHost = leagueMenu.hostField()
    requireMatchFields()
    val widgetHooks = widgetScoreHook()
    val rowHooks = scoreRowHooks()
    val notificationHooks = notificationTextHooks()
    val matchRow = matchRowHooks()
    val shareHook = shareTextHook()

    // 1. Notifications.
    push.addHevalGate(SPOILER_FREE_MODE.id) { v ->
        """
            move-object/from16 $v, p1
            iget-object $v, $v, $REMOTE_MESSAGE->${bundle.name}:$BUNDLE
            invoke-static { $v }, $SPOILER_FREE->blocksPush($BUNDLE)Z
            move-result $v
            if-eqz $v, :heval_stock
            return-void
        """
    }

    // 2. and 3. The two menu items.
    matchMenu.addMenuItemHook(matchHost, "addMatchItem")
    leagueMenu.addMenuItemHook(leagueHost, "addCompetitionItem")

    // 4. The live score widget.
    widgetHooks()

    // 5. The match rows.
    rowHooks()

    // 6. The live-update notification's texts (the same method as its started check above; each
    // hook takes the indexes again).
    notificationHooks()

    // 7. The main row's aggregate score and bold winner names.
    matchRow()

    // 8. The share text.
    shareHook()

    fotMobControls.register(SPOILER_FREE_MATCHES)
    fotMobControls.register(SPOILER_FREE_COMPETITIONS)
    fotMobControls.register(SPOILER_FREE_NOTIFICATIONS)
    fotMobControls.register(SPOILER_FREE_LISTS)
    fotMobControls.register(SPOILER_FREE_MATCH_PAGE)
    fotMobControls.register(SPOILER_FREE_WIDGET)
    fotMobControls.register(SPOILER_FREE_KEEP_FINAL)
}
