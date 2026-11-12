package app.template.patches.fotmob.spoiler

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.literal
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import com.android.tools.smali.dexlib2.ReferenceType
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
private const val LEAGUE = "Lcom/fotmob/models/League;"
private const val MATCH_ACTIVITY = "Lcom/fotmob/android/feature/match/ui/MatchActivity;"
private const val LIVE_UPDATE_WORKER = "Lcom/fotmob/android/feature/liveupdate/worker/LiveUpdateWorker;"
private const val REMOTE_MESSAGE = "Lcom/google/firebase/messaging/RemoteMessage;"
private const val BUNDLE = "Landroid/os/Bundle;"

internal val SPOILER_FREE_MODE = HevalFeature(
    id = "fotmob.spoiler_free",
    calm = true,
    name = "Spoiler-free mode",
    description = "Lets you hide scores and goal alerts for matches and competitions you mark.",
    category = FotMobControlsCategory.SPOILER_FREE,
    icon = "eye_off",
)

/** The matches marked on their match page (FotMob match ids); the user can un-mark them here. */
internal val SPOILER_FREE_MATCHES = HevalListFeature(
    id = "fotmob.spoiler_matches",
    name = "Marked matches",
    description = "Matches you marked on their match page. Remove one to show its score again.",
    category = FotMobControlsCategory.SPOILER_FREE,
    icon = "eye_off",
    dependencies = listOf(SPOILER_FREE_MODE.id),
)

/** The competitions marked on their page (league ids, like "Hidden competitions"). */
internal val SPOILER_FREE_COMPETITIONS = HevalListFeature(
    id = "fotmob.spoiler_competitions",
    name = "Marked competitions",
    description = "Competitions you marked on their page. Remove one to show its scores again.",
    category = FotMobControlsCategory.SPOILER_FREE,
    icon = "eye_off",
    dependencies = listOf(SPOILER_FREE_MODE.id),
)

// One switch per surface, each default on and each off while the master switch is off, so the user
// chooses what gets hidden. A hook checks its own surface (SpoilerFree.hidesScoreIn* / blocksPush).
private fun spoilerSurface(id: String, name: String, description: String) = HevalFeature(
    id = id,
    calm = true,
    name = name,
    description = description,
    category = FotMobControlsCategory.SPOILER_FREE,
    icon = "eye_off",
    dependencies = listOf(SPOILER_FREE_MODE.id),
)

internal val SPOILER_FREE_NOTIFICATIONS = spoilerSurface(
    "fotmob.spoiler_notifications", "Hide goal alerts",
    "Drops goal and result alerts and hides the score in the ongoing match notification for marked matches.",
)
internal val SPOILER_FREE_LISTS = spoilerSurface(
    "fotmob.spoiler_lists", "Hide scores in match lists",
    "Shows the kickoff time instead of the score in match lists for marked matches.",
)
internal val SPOILER_FREE_MATCH_PAGE = spoilerSurface(
    "fotmob.spoiler_match_page", "Hide scores on the match page",
    "Shows the kickoff time instead of the score at the top of a marked match.",
)
internal val SPOILER_FREE_WIDGET = spoilerSurface(
    "fotmob.spoiler_widget", "Hide scores in the widget",
    "Shows the kickoff time instead of the score in the live score widget for marked matches.",
)

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

/** The fields SpoilerFree reads by name (kept Gson model names); a rename fails here. */
private fun BytecodePatchContext.requireMatchFields() {
    val wanted = mapOf(
        MATCH to mapOf("Id" to "Ljava/lang/String;", "league" to LEAGUE),
        LEAGUE to mapOf("Id" to "I", "ParentId" to "I"),
    )
    for ((owner, fields) in wanted) {
        val present = classDefBy(owner).fields.associate { it.name to it.type }
        fields.forEach { (name, type) ->
            if (present[name] != type) throw PatchException("$owner->$name is ${present[name]}, expected $type")
        }
    }
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
 * The home-screen live score widget's row (LiveScoreAppWidget.Companion: static
 * (Context, Match, boolean, Integer)RemoteViews). It draws "home - away" when the match has started,
 * else the kickoff time, and a status label ("FT", "67'") whose view is hidden when blank.
 */
private fun BytecodePatchContext.widgetScoreHook(): () -> Unit {
    val rows = mutableClassDefBy(LIVE_SCORE_WIDGET).methods.filter {
        it.returnType == "Landroid/widget/RemoteViews;" && AccessFlags.STATIC.isSet(it.accessFlags) &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", MATCH, "Z", "Ljava/lang/Integer;")
    }
    if (rows.size != 1) throw PatchException("$LIVE_SCORE_WIDGET: ${rows.size} match row builders, expected one")
    val row = rows.single()
    val started = startedCheck()

    val insns = row.instructions.toList()
    fun MethodReference.isStarted() = definingClass == MATCH && name == started.name && returnType == "Z" && parameterTypes.isEmpty()
    fun MethodReference.isStatusLabel() = returnType == "Ljava/lang/String;" &&
        parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", MATCH, "Z")
    val startedCalls = insns.indices.filter { insns[it].opcode == Opcode.INVOKE_VIRTUAL && insns[it].methodRef()?.isStarted() == true }
    val labelCalls = insns.indices.filter { insns[it].opcode == Opcode.INVOKE_STATIC && insns[it].methodRef()?.isStatusLabel() == true }
    if (startedCalls.size != 1 || labelCalls.size != 1) {
        throw PatchException("${row.definingClass}->${row.name}: ${startedCalls.size} started checks and ${labelCalls.size} status labels, expected one each")
    }
    val startedCall = startedCalls.single()
    val labelCall = labelCalls.single()
    val startedResult = insns[startedCall + 1] as? OneRegisterInstruction
    val labelResult = insns[labelCall + 1] as? OneRegisterInstruction
    if (insns[startedCall + 1].opcode != Opcode.MOVE_RESULT || insns[labelCall + 1].opcode != Opcode.MOVE_RESULT_OBJECT) {
        throw PatchException("${row.definingClass}->${row.name}: the started check or the status label has no result move")
    }
    val startedMatch = (insns[startedCall] as FiveRegisterInstruction).registerC
    val labelMatch = (insns[labelCall] as FiveRegisterInstruction).registerD
    val flag = startedResult!!.registerA
    val label = labelResult!!.registerA
    if (flag == startedMatch || label == labelMatch) {
        throw PatchException("${row.definingClass}->${row.name}: a result overwrites the match register")
    }

    // Later site first, so the earlier index stays valid. A marked match: the status label is "".
    return { row.applyWidgetHooks(startedCall, labelCall, flag, startedMatch, label, labelMatch) }
}

private fun MutableMethod.applyWidgetHooks(startedCall: Int, labelCall: Int, flag: Int, startedMatch: Int, label: Int, labelMatch: Int) {
    val row = this
    row.addInstructionsChecked(
        labelCall + 2,
        """
            invoke-static { v$label, v$labelMatch }, $SPOILER_FREE->status(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
            move-result-object v$label
        """,
    )
    // A started, marked match counts as not started, so the row takes the kickoff-time branch.
    row.addInstructionsWithLabelsChecked(
        startedCall + 2,
        """
            if-eqz v$flag, :spoiler_keep
            invoke-static/range { v$startedMatch .. v$startedMatch }, $SPOILER_FREE->hidesScoreInWidget(Ljava/lang/Object;)Z
            move-result v$flag
            xor-int/lit8 v$flag, v$flag, 0x1
        """,
        ExternalLabel("spoiler_keep", row.getInstruction(startedCall + 2)),
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
    val targets = mutableListOf<Pair<String, Method>>()
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            val insns = method.implementation?.instructions?.toList() ?: return@forEach
            if (insns.any { it.isScoreFormat() } && insns.any { it.methodRef()?.isStarted() == true }) {
                targets += classDef.type to method
            }
        }
    }
    if (targets.isEmpty()) {
        throw PatchException("no method formats the live score (\"$SCORE_FORMAT\") and asks Match whether it started")
    }

    return {
        for ((type, found) in targets) {
            val row = mutableClassDefBy(type).methods.single {
                it.name == found.name && it.returnType == found.returnType &&
                    it.parameterTypes.map(CharSequence::toString) == found.parameterTypes.map(CharSequence::toString)
            }
            val insns = row.instructions.toList()
            val calls = insns.indices.filter { insns[it].methodRef()?.isStarted() == true }
            // Later site first, so the earlier indexes stay valid.
            for (call in calls.asReversed()) row.hideStartedAt(call, insns, rowHelper(type))
        }
    }
}

/**
 * The SpoilerFree check a row method uses, so each surface answers to its own Patch settings switch:
 * the match page header, the live-update (ongoing) notification, and every other row (the lists).
 */
private fun rowHelper(type: String) = when (type) {
    MATCH_ACTIVITY -> "hidesScoreOnMatchPage"
    LIVE_UPDATE_WORKER -> "hidesScoreInNotifications"
    else -> "hidesScoreInLists"
}

/** After Match's started check at [call]: a marked match that has started counts as not started. */
private fun MutableMethod.hideStartedAt(call: Int, insns: List<Instruction>, helper: String) {
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
// 4. Home-screen live score widget (LiveScoreAppWidget.Companion row builder): after Match's "has
//    started" check, a marked match answers false, so the row draws the kickoff time instead of
//    "home - away"; its status label ("FT", "67'") becomes "" and the widget hides that view. Only
//    this call site changes; the Match model, sorting and every other reader of the check are stock.
// 5. Match rows: every method that formats the live score ("%d %s- %d") and asks Match whether it
//    started (the live row, the fixture row, the match page header, two view-holder methods and the
//    live-update worker, six in 241) gets the same override at each started check, so a marked
//    match shows its kickoff time there too.
// Not covered in phase 1: the score-drawing methods that never ask Match whether it started (the team
// form line, the holder-based builders, the shared string helper), the match page tabs (events,
// stats, momentum), the league and team widgets, search, head-to-head, brackets, standings, the
// bold winner (the live row reads the aggregate and the penalties directly), the status text
// ("FT", the minute) and the widget's bold winner name after a penalty shootout.
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

    fotMobControls.register(SPOILER_FREE_MATCHES)
    fotMobControls.register(SPOILER_FREE_COMPETITIONS)
    fotMobControls.register(SPOILER_FREE_NOTIFICATIONS)
    fotMobControls.register(SPOILER_FREE_LISTS)
    fotMobControls.register(SPOILER_FREE_MATCH_PAGE)
    fotMobControls.register(SPOILER_FREE_WIDGET)
}
