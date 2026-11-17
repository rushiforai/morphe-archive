package app.template.patches.flashscore.spoiler

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.flashscore.controls.FlashscoreControlsCategory
import app.template.patches.flashscore.controls.flashscoreControls
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.HevalListFeature
import app.template.patches.shared.hevalcontrols.addHevalGate
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val SPOILER_FREE = "Lapp/template/extension/flashscore/SpoilerFree;"

/** The match list row's view holder (kept: Kotlin data class referenced by name, kept getters). */
internal const val DUEL_HOLDER = "Leu/livesport/LiveSport_cz/view/event/list/item/filler/EventListDuelHolder;"

/** The push handlers whose isValid(NotificationConfig)Z decides whether a match push is shown. */
internal val PUSH_HANDLERS = listOf("HandlerEventDuel", "HandlerEventNoDuel", "HandlerEventReport")
    .map { "Leu/livesport/notification/handler/$it;" }

/** EventModel.toString() starts with this (R8 renames the class). */
internal const val EVENT_MODEL_TO_STRING = "EventModel{sportId="

/** NotificationConfig.toString() starts with this; the event id is read right after [CONFIG_EVENT_ID]. */
internal const val CONFIG_TO_STRING = "NotificationConfig(type="
internal const val CONFIG_EVENT_ID = ", eventId="

private const val STRING = "Ljava/lang/String;"
private const val VIEW = "Landroid/view/View;"
private const val TEXT_VIEW = "Landroid/widget/TextView;"

/** The views SpoilerFree finds by name in a row; a missing name fails the patch. */
internal val ROW_VIEW_IDS = listOf(
    "event_list_result_home", "event_list_result_away",
    "event_list_result_home_penalties", "event_list_result_away_penalties",
    "event_list_result_home_sets", "event_list_result_away_sets",
    "event_list_result_home_part", "event_list_result_away_part",
    "event_list_part_stage",
    "event_list_draw_winner_indicator_home", "event_list_draw_winner_indicator_away",
    "event_list_advancing_participant_home", "event_list_advancing_participant_away",
    "event_list_win_lose_icon",
)

/** The master switch: marking (the long press) and every surface below depend on it. */
internal val SPOILER_FREE_MODE = HevalFeature(
    id = "flashscore.spoiler_free",
    calm = true,
    name = "Spoiler-free mode",
    description = "Long-press a match in a list to hide its score.",
    category = FlashscoreControlsCategory.SPOILER_FREE,
    icon = "eye_off",
)

/** Surface: pushes of marked matches. */
internal val SPOILER_NOTIFICATIONS = HevalFeature(
    id = "flashscore.spoiler_notifications",
    calm = true,
    name = "Hide alerts for marked matches",
    description = "Blocks alerts, goals included, for the matches you mark.",
    category = FlashscoreControlsCategory.SPOILER_FREE,
    icon = "eye_off",
    dependencies = listOf(SPOILER_FREE_MODE.id),
)

/** Surface: the score, status and winner marks of the match list rows. */
internal val SPOILER_LISTS = HevalFeature(
    id = "flashscore.spoiler_lists",
    calm = true,
    name = "Hide scores in match lists",
    description = "Hides the scores of marked matches in match lists.",
    category = FlashscoreControlsCategory.SPOILER_FREE,
    icon = "eye_off",
    dependencies = listOf(SPOILER_FREE_MODE.id),
)

/** The matches marked by a long press (Flashscore event ids); the user can un-mark them here. */
internal val SPOILER_EVENTS = HevalListFeature(
    id = "flashscore.spoiler_events",
    name = "Marked matches",
    description = "Remove a match here to show its score again.",
    category = FlashscoreControlsCategory.SPOILER_FREE,
    icon = "eye_off",
    dependencies = listOf(SPOILER_FREE_MODE.id),
)

/** Every feature this patch registers, in registration order. */
internal val SPOILER_FEATURES = listOf(SPOILER_FREE_MODE, SPOILER_NOTIFICATIONS, SPOILER_LISTS, SPOILER_EVENTS)

private fun Method.params() = parameterTypes.map(CharSequence::toString)
private fun Method.isStatic() = AccessFlags.STATIC.isSet(accessFlags)
private fun Instruction.methodRef() = (this as? ReferenceInstruction)?.reference as? MethodReference
private fun Instruction.fieldRef() = (this as? ReferenceInstruction)?.reference as? FieldReference
private fun Instruction.stringRef() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

/** The one class with a toString() that has a string starting with [prefix] (R8 may move the head piece). */
internal fun BytecodePatchContext.classByToString(prefix: String): ClassDef {
    val found = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        val toString = classDef.methods.firstOrNull {
            it.name == "toString" && it.returnType == STRING && it.parameterTypes.isEmpty() && it.implementation != null
        } ?: return@classDefForEach
        if (toString.implementation!!.instructions.any { it.stringRef()?.startsWith(prefix) == true }) found += classDef
    }
    return found.singleOrNull() ?: throw PatchException("${found.size} classes with a toString starting \"$prefix\", expected one")
}

/** The first String field of [owner] that [method] reads after the const-string [marker]. */
internal fun Method.stringFieldAfter(marker: String, owner: String): FieldReference {
    val insns = implementation!!.instructions.toList()
    val at = insns.indexOfFirst { it.stringRef() == marker }
    if (at < 0) throw PatchException("$definingClass->$name has no \"$marker\"")
    return insns.drop(at + 1).firstNotNullOfOrNull { insn ->
        insn.fieldRef()?.takeIf { insn.opcode == Opcode.IGET_OBJECT && it.definingClass == owner && it.type == STRING }
    } ?: throw PatchException("$definingClass->$name reads no $owner String field after \"$marker\"")
}

/** The one concrete method of [type] matching; throws on any other count. */
private fun BytecodePatchContext.single(type: String, what: String, filter: (Method) -> Boolean): MutableMethod {
    val found = mutableClassDefBy(type).methods.filter { it.implementation != null && filter(it) }
    return found.singleOrNull() ?: throw PatchException("$type: ${found.size} $what methods, expected one")
}

// Spoiler-free mode (2026-11-14, stage B1, owner request), like Sofascore's and FotMob's. The user marks a
// match by long-pressing its row in a match list ("Hide score and alerts" / "Show score" in a small dialog); the marks are the
// Patch settings list flashscore.spoiler_events, which depends on the master switch (turning it off restores
// stock everywhere; the list can be edited or cleared in Patch settings). One switch per surface (on by
// default, depending on the master). Stored on the phone only (SpoilerFree in extensions/flashscore). Read at
// use time (each bind, each push), so no restart is needed.
//
// 1. Match list rows (flashscore.spoiler_lists): the duel row binder (26.11.6: m30.d(ig7, EventListDuelHolder)V,
//    the only V method taking (row, EventListDuelHolder)) calls SpoilerFree.unmaskRow(holder) first and
//    SpoilerFree.maskRow(row, holder) right before its only return-void. For a marked match the mask first shows
//    a dash in the two score cells, empties the penalties/sets/part/stage (FT/AET/Pen) cells and hides the
//    draw/advancing winner indicators and the win/lose icon; then (each step on its own, so a later failure never
//    leaves the score shown) it hides the extra row (aggregate, "Penalties 5-4") and the red-card counts, gives both
//    names the binder's no-winner text appearance and puts the plain row background back (no goal highlight).
//    unmaskRow undoes the last mask before the stock binder runs, so a recycled row is stock. maskRow also sets the
//    long-press listener on the row root (stock has none) while the master switch is on; with the switch off it
//    is removed on the row's next bind. Where the root has no click listener (the bare m30 path; yb4 sets one), a
//    click listener that forwards the tap to AbsListView.performItemClick is added too, so taps still open the
//    match (a long-clickable root consumes the touch). The stage-time cell (StageTimeModel: kick-off time or live minute) is left.
// 2. Notifications (flashscore.spoiler_notifications): HandlerEventDuel/NoDuel/Report.isValid(NotificationConfig)
//    answer false at entry when the config's event id is marked; PushMessagingService then drops the push. The id
//    field comes from NotificationConfig.toString and must be one HandlerEventDuel.isValid reads.
// The R8 names (the row's EventModel field, its event-id field, the highlighter's view field, the neutral name
// style) are resolved here and written into SpoilerFree's stub accessors; the kept getters and fields SpoilerFree
// calls by reflection must be public.
// Since stage B2 (2026-11-14) the binder hook, the eventId stub and the long press are flashscoreMatchRowPatch
// (MatchRowHooks.kt), shared with "Hide competitions": the long press is installed while either switch is on and
// the dialog lists the entries of the switches that are on; the row mask still needs this patch's switches.
// Not covered in v1: the odds row, the live minute, the match page header and tabs, the Compose match rows (team
// and competition pages), the widget, score updates made outside the row binder, and FCM pushes with a
// notification payload that the system shows itself (they never reach the app).
@Suppress("unused")
val spoilerFreeModePatch = flashscoreControls.featurePatch(
    SPOILER_FREE_MODE,
    description = "Lets you hide scores and alerts for matches you mark.",
    default = true,
    dependencies = setOf(flashscoreMatchRowPatch),
) {
    // The Flashscore extension comes with the Patch settings host (its Settings row lives there).
    classDefBy(SPOILER_FREE)

    // Find every site before the first edit. The row binder hook, the eventId stub and the long press
    // are flashscoreMatchRowPatch's (shared with "Hide competitions"); this patch reads the binder only.
    val binderFound = findRowBinder()
    val binderType = binderFound.type
    val binder = binderFound.method
    val insns = binder.implementation!!.instructions.toList()

    // 3. The holder's kept getters SpoilerFree calls by reflection (public, see publicGetter).
    val holder = classDefBy(DUEL_HOLDER)
    fun BytecodePatchContext.publicGetter(type: String, name: String, returns: String? = null): Method {
        val method = classDefBy(type).methods.singleOrNull { it.name == name && it.parameterTypes.isEmpty() && !it.isStatic() }
            ?: throw PatchException("$type has no $name()")
        if (!AccessFlags.PUBLIC.isSet(method.accessFlags)) throw PatchException("$type.$name() is not public (SpoilerFree calls it by reflection)")
        if (returns != null && method.returnType != returns) throw PatchException("$type.$name() returns ${method.returnType}, expected $returns")
        return method
    }
    fun getter(name: String) = publicGetter(DUEL_HOLDER, name)
    // The extra row (aggregate, "Penalties 5-4") and the red-card counts.
    val extraRow = getter("getEventExtraRowHolder").returnType
    publicGetter(extraRow, "getExtraRowLayout", VIEW)
    val indicators = getter("getEventListIndicatorsHolder").returnType
    publicGetter(indicators, "getRedCardsHome", TEXT_VIEW)
    publicGetter(indicators, "getRedCardsAway", TEXT_VIEW)
    val highlighterGetter = getter("getHighlighterHolder")
    val highlighter = highlighterGetter.returnType
    val highlightViews = classDefBy(highlighter).fields.filter { it.type == VIEW && !AccessFlags.STATIC.isSet(it.accessFlags) }
    val highlightView = highlightViews.singleOrNull()
        ?: throw PatchException("$highlighter has ${highlightViews.size} View fields, expected one (the highlighted row)")

    // 4. The neutral name style: the binder styles the names with a static (ZZ)I whose last answer is
    //    the no-winner appearance (26.11.6: l1m.g -> 0x7f150857).
    if (insns.none { it.methodRef()?.let { m -> m.definingClass == TEXT_VIEW && m.name == "setTextAppearance" } == true }) {
        throw PatchException("$binderType->${binder.name} no longer calls TextView.setTextAppearance")
    }
    val styleRefs = insns.filter { it.opcode == Opcode.INVOKE_STATIC }.mapNotNull { it.methodRef() }
        .filter { it.returnType == "I" && it.parameterTypes.map(CharSequence::toString) == listOf("Z", "Z") }
        .distinctBy { "${it.definingClass}->${it.name}" }
    val styleRef = styleRefs.singleOrNull()
        ?: throw PatchException("$binderType->${binder.name} calls ${styleRefs.size} static (ZZ)I style pickers, expected one")
    val styleInsns = classDefBy(styleRef.definingClass).methods.single {
        it.name == styleRef.name && it.params() == listOf("Z", "Z") && it.returnType == "I"
    }.implementation!!.instructions.toList()
    val lastReturn = styleInsns.indexOfLast { it.opcode == Opcode.RETURN }
    val neutral = (styleInsns.getOrNull(lastReturn - 1) as? NarrowLiteralInstruction)
        ?.takeIf { styleInsns[lastReturn - 1].opcode == Opcode.CONST }?.narrowLiteral
        ?: throw PatchException("${styleRef.definingClass}->${styleRef.name}: the last answer is not a constant style")

    // 5. The resources SpoilerFree looks up by name; the holder must still load the two score cells.
    ROW_VIEW_IDS.forEach { resourceId(ResourceType.ID, it) }
    resourceId(ResourceType.DRAWABLE, "bg_event_list")
    val holderCtor = holder.methods.single { it.name == "<init>" && it.params() == listOf(VIEW) }
    val loaded = holderCtor.implementation!!.instructions.mapNotNull { (it as? NarrowLiteralInstruction)?.narrowLiteral }.toSet()
    listOf("event_list_result_home", "event_list_result_away").forEach {
        if (resourceId(ResourceType.ID, it).toInt() !in loaded) throw PatchException("$DUEL_HOLDER no longer finds id/$it")
    }

    // 6. The push handlers and NotificationConfig's event id.
    val config = classByToString(CONFIG_TO_STRING)
    val configEventId = config.methods.single { it.name == "toString" && it.parameterTypes.isEmpty() }
        .stringFieldAfter(CONFIG_EVENT_ID, config.type)
    val validators = PUSH_HANDLERS.map { type ->
        single(type, "isValid(${config.type})Z") { it.name == "isValid" && it.returnType == "Z" && it.params() == listOf(config.type) }
            .also { it.requireNoBranchTargetAt(0, "Spoiler-free push gate") }
    }
    // Cross-check: HandlerEventDuel.isValid logs the same field as "eventId:" (26.11.6: lth.n).
    val duelReads = validators.first().instructions.filter { it.opcode == Opcode.IGET_OBJECT }.mapNotNull { it.fieldRef() }
        .filter { it.definingClass == config.type && it.type == STRING }.map { it.name }.toSet()
    if (configEventId.name !in duelReads) {
        throw PatchException("${PUSH_HANDLERS.first()}.isValid reads ${config.type} fields $duelReads, not the toString event id ${configEventId.name}")
    }

    // 7. The stub accessors.
    val extension = mutableClassDefBy(SPOILER_FREE).methods
    fun stub(name: String) = extension.singleOrNull { it.name == name && it.isStatic() }
        ?: throw PatchException("$SPOILER_FREE has no static $name")
    val highlightStub = stub("highlightView")
    val styleStub = stub("neutralNameStyle")

    // Edits.
    highlightStub.rewriteStub(
        """
            check-cast p0, $DUEL_HOLDER
            invoke-virtual { p0 }, $DUEL_HOLDER->getHighlighterHolder()$highlighter
            move-result-object p0
            iget-object p0, p0, $highlighter->${highlightView.name}:$VIEW
            return-object p0
        """,
    )
    styleStub.rewriteStub(
        """
            const v0, $neutral
            return v0
        """,
    )

    validators.forEach { isValid ->
        isValid.addHevalGate(SPOILER_NOTIFICATIONS.id) { v ->
            """
                move-object/from16 $v, p1
                iget-object $v, $v, ${config.type}->${configEventId.name}:$STRING
                invoke-static { $v }, $SPOILER_FREE->blocksPush($STRING)Z
                move-result $v
                if-eqz $v, :heval_stock
                const/4 $v, 0x0
                return $v
            """
        }
    }

    flashscoreControls.register(SPOILER_NOTIFICATIONS)
    flashscoreControls.register(SPOILER_LISTS)
    flashscoreControls.register(SPOILER_EVENTS)
}
