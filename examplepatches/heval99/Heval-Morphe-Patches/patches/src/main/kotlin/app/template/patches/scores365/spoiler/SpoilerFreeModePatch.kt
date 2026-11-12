package app.template.patches.scores365.spoiler

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.scores365.controls.scores365Controls
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.addInstructionsAtControlFlowLabelChecked
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val SPOILER_FREE = "Lapp/template/extension/scores365/SpoilerFree;"
private const val ROW_BINDING = "Lcom/scores365/viewslibrary/databinding/ScoresGameItemLayoutBinding;"
private const val SCORE_BOX = "Lcom/scores365/Design/components/view/ScoreBoxView;"
private const val SCORE_BOX_BINDING = "Lcom/scores365/viewslibrary/databinding/GameScoreBoxBinding;"
private const val STATUS_OBJ = "Lcom/scores365/entitys/StatusObj;"
private const val NOTIFICATION_GAME = "Lcom/scores365/entitys/NotificationGameObj;"
private const val ENTITY_TYPE = "Lcom/scores365/entitys/eDashboardEntityType;"
private const val VIEW_GROUP = "Landroid/view/ViewGroup;"
private const val TEXT_VIEW = "Landroid/widget/TextView;"
private const val IMAGE_VIEW = "Landroid/widget/ImageView;"

private fun Instruction.methodRef() = (this as? ReferenceInstruction)?.reference as? MethodReference

/** The register count the parameters take, `this` included for instance methods. */
private fun Method.insCount(): Int =
    (if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1) +
        parameterTypes.map { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }.sum()

/** The real register index of parameter register p[index] (p0 = v(registers - ins)). */
private fun Method.p(index: Int): Int = implementation!!.registerCount - insCount() + index

private fun Method.where() = "$definingClass->$name"

/** Exactly one match, or a PatchException naming [what]. */
private fun BytecodePatchContext.single(fingerprint: Fingerprint, what: String): MutableMethod {
    val matches = fingerprint.matchAllOrNull().orEmpty()
    if (matches.size != 1) throw PatchException("Spoiler-free mode: $what matched ${matches.size} methods, expected one")
    return matches.single().method
}

/** The method needs a local register (v0) besides its parameters. */
private fun Method.requireLocal() {
    val locals = implementation!!.registerCount - insCount()
    if (locals < 1) throw PatchException("${where()} has no local register for the spoiler-free hook")
}

/**
 * A hook that runs at a return reads the parameter registers there, so none of them may be
 * written anywhere in the method (R8 reuses dead parameter registers).
 */
private fun Method.requireUnwritten(registers: IntRange, what: String) {
    for (instruction in implementation!!.instructions) {
        if (!instruction.opcode.setsRegister()) continue
        val target = (instruction as? OneRegisterInstruction)?.registerA ?: continue
        val written = if (instruction.opcode.setsWideRegister()) target..target + 1 else target..target
        if (written.any { it in registers }) {
            throw PatchException("${where()}: $what register v$target is overwritten (${instruction.opcode})")
        }
    }
}

/** Every concrete method of [type] or its in-app superclasses must offer [name] with [returnType]. */
private fun BytecodePatchContext.requireMethod(type: String, name: String, returnType: String) {
    var current: ClassDef? = classDefByOrNull(type)
    while (current != null) {
        if (current.methods.any { it.name == name && it.returnType == returnType && it.parameterTypes.isEmpty() }) return
        current = current.superclass?.let { classDefByOrNull(it) }
    }
    throw PatchException("$type has no $name()$returnType (the spoiler-free extension calls it by name)")
}

/** Instance field [name] of [type] has [fieldType] (the extension reads it by name). */
private fun BytecodePatchContext.requireField(type: String, name: String, fieldType: String) {
    val field = classDefBy(type).fields.singleOrNull { it.name == name }
        ?: throw PatchException("$type has no field $name (the spoiler-free extension reads it by name)")
    if (field.type != fieldType) throw PatchException("$type->$name is ${field.type}, expected $fieldType")
}

/** The names the extension reaches by reflection: a rename fails the patch instead of the hook. */
private fun BytecodePatchContext.requireModel() {
    requireMethod(GAME_OBJ, "getID", "I")
    requireMethod(GAME_OBJ, "getCompetitionID", "I")
    requireMethod(GAME_OBJ, "getSTime", "Ljava/util/Date;")
    requireMethod(GAME_OBJ, "getStatusObj", STATUS_OBJ)
    requireMethod(STATUS_OBJ, "getIsNotStarted", "Z")
    requireField(GCM_NOTIFICATION, "Game", NOTIFICATION_GAME)
    requireField(GCM_NOTIFICATION, "competitionId", "I")
    requireField(NOTIFICATION_GAME, "GameID", "I")
    requireField(NOTIFICATION_GAME, "CompetitionID", "I")
    requireField(ROW_BINDING, "tvGameEnd", TEXT_VIEW)
    requireField(ROW_BINDING, "tvWinDescription", TEXT_VIEW)
    requireField(ROW_BINDING, "scorePenaltyHome", IMAGE_VIEW)
    requireField(ROW_BINDING, "scorePenaltyAway", IMAGE_VIEW)
    for (name in listOf("home", "away", "gameStateLabel", "gameStateTitle")) requireField(SCORE_BOX_BINDING, name, TEXT_VIEW)
    for (name in listOf("winningTeamIconHome", "winningTeamIconAway")) requireField(SCORE_BOX_BINDING, name, IMAGE_VIEW)
    if (classDefBy(SCORE_BOX).methods.none { it.name == "getBinding" && it.returnType == SCORE_BOX_BINDING && it.parameterTypes.isEmpty() }) {
        throw PatchException("$SCORE_BOX has no getBinding()")
    }
    if (classDefBy(ENTITY_TYPE).methods.none { it.name == "create" && it.parameterTypes.map(CharSequence::toString) == listOf("I") }) {
        throw PatchException("$ENTITY_TYPE has no create(int)")
    }
    val gameFields = classDefBy(GAME_CENTER_ACTIVITY).fields.filter { it.type == GAME_OBJ && !AccessFlags.STATIC.isSet(it.accessFlags) }
    if (gameFields.size != 1) throw PatchException("$GAME_CENTER_ACTIVITY has ${gameFields.size} GameObj fields, expected one")
}

/** Indexes of every return-void, last first, so inserting keeps the earlier ones valid. */
private fun MutableMethod.returnVoids(): List<Int> {
    val returns = instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
    if (returns.isEmpty()) throw PatchException("${where()} has no return-void")
    return returns.asReversed()
}

/**
 * The list row binder: the one method taking (formatter owner, ScoresGameItemLayoutBinding, item,
 * GameObj, ...) that calls the row formatter. Found by its call, not by its R8 name.
 */
private fun BytecodePatchContext.rowBinder(formatter: Method): MutableMethod {
    val found = mutableListOf<Pair<String, Method>>()
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            val params = method.parameterTypes.map(CharSequence::toString)
            if (method.returnType != "V" || params.size < 4 || params[1] != ROW_BINDING || params[3] != GAME_OBJ) return@forEach
            val calls = method.implementation?.instructions?.any { insn ->
                insn.methodRef()?.let {
                    it.definingClass == formatter.definingClass && it.name == formatter.name &&
                        it.returnType == formatter.returnType &&
                        it.parameterTypes.map(CharSequence::toString) == formatter.parameterTypes.map(CharSequence::toString)
                } == true
            } == true
            if (calls) found += classDef.type to method
        }
    }
    val (type, binder) = found.singleOrNull()
        ?: throw PatchException("Spoiler-free mode: ${found.size} row binders call the score formatter, expected one")
    if (!AccessFlags.STATIC.isSet(binder.accessFlags)) throw PatchException("${binder.where()} is not static")
    return mutableClassDefBy(type).methods.single {
        it.name == binder.name && it.parameterTypes.map(CharSequence::toString) == binder.parameterTypes.map(CharSequence::toString)
    }
}

/** ScoreBoxView's one (GameObj)V binder (15.0.0: a), the match page header's score box. */
private fun BytecodePatchContext.scoreBoxBinder(): MutableMethod {
    val binders = mutableClassDefBy(SCORE_BOX).methods.filter {
        it.returnType == "V" && it.implementation != null && it.parameterTypes.map(CharSequence::toString) == listOf(GAME_OBJ)
    }
    if (binders.size != 1) throw PatchException("$SCORE_BOX has ${binders.size} (GameObj)V binders, expected one")
    return binders.single()
}

/** The register the single ViewGroup.addView call with [descriptor] adds to (its receiver). */
private fun MutableMethod.addViewCall(descriptor: String): Pair<Int, Int> {
    val calls = instructions.withIndex().filter { (_, insn) ->
        insn.methodRef()?.let { "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" } == descriptor
    }
    if (calls.size != 1) throw PatchException("${where()}: ${calls.size} calls to $descriptor, expected one (the bell)")
    val (index, call) = calls.single()
    val receiver = when (call) {
        is FiveRegisterInstruction -> call.registerC
        is RegisterRangeInstruction -> call.startRegister
        else -> throw PatchException("${where()}: unexpected addView call ${call.opcode}")
    }
    return index to receiver
}

// Spoiler-free mode (2026-11-08, owner request), phase 1. The user marks a match on its match page
// or a whole competition on its page (an eye icon next to the follow bell); the marks stay on the phone and one switch
// per surface is a Patch settings switch (the master and the five surfaces are registered below,
// all on by default; 365Scores' Settings page gets a "Patch settings" row, see
// controls/Scores365Controls.kt); the marks live in one SharedPreferences file of the extension
// (SpoilerFree in extensions/scores365), read once into memory. Each hook asks its own surface
// first (SpoilerFree.isSurfaceOn).
// A mark hides a match only once it has started; nothing about the match model, its scores, sorting
// or the live indicators changes: the hooks replace or blank text that is already drawn.
//
// 1. Notifications (surface 0): the notification manager's per-notification handler returns at
//    entry when the GCMNotificationObj's Game (NotificationGameObj GameID/CompetitionID) or its
//    competitionId is marked. Notifications without a game pass. The server writes the score into
//    the title and text, so the notification is dropped, never edited.
// 2. Match page toggle: right after GameCenterBaseActivity's toolbar builder adds the follow bell,
//    the eye goes into the same group; the activity is the group's context and the game is its one
//    GameObj field.
// 3. Competition page toggle: the "SingleEntityMainPage" header observer adds the eye right after
//    it adds the follow bell; the extension acts only on SingleEntityDashboardActivity showing a
//    competition (intent "entityIdTag"/"entityTypeTag", typed with eDashboardEntityType.create).
// 4. List rows (surface 1): the row score formatter (GameObj, boolean, AbnormalGameStatusTexts)
//    returns the kickoff time at entry for a marked match; the row binder sizes the text from the
//    same formatter, so the layout follows.
// 5. Row status and winner (surfaces 3 and 4): before the row binder returns, the status line
//    (tvGameEnd) is blanked and the result description and the qualify icons are hidden.
// 6. Match page header (surfaces 2, 3, 4): before ScoreBoxView's (GameObj) binder returns, the
//    score line shows the kickoff time, the status label is blank and the winner marks are cleared.
//    The binder reuses its parameter registers, so it hands (this, game) to the extension at entry.
// Not covered in phase 1: the rows' bold winner name, the other score formatters (GameExtensionsKt
// score/aggregate text and the remaining callers of GameObj.getScores), form chips, standings,
// head-to-head, brackets, tipster and player cards, news, in-app alerts, the match page tabs and
// Wear OS.
@Suppress("unused")
val spoilerFreeModePatch = scores365Controls.featurePatch(
    SPOILER_FREE_MODE,
    default = true,
) {
    classDefBy(SPOILER_FREE)

    // Find every site before the first edit.
    requireModel()
    val handler = single(NotificationHandlerFingerprint, "the notification handler")
    val matchToolbar = single(MatchToolbarFingerprint, "the match page toolbar builder")
    val entityHeader = single(EntityHeaderFingerprint, "the entity page header observer")
    val formatter = single(RowScoreFormatterFingerprint, "the row score formatter")
    val binder = rowBinder(formatter)
    val scoreBox = scoreBoxBinder()

    handler.requireLocal()
    formatter.requireLocal()
    // The toolbar builder reuses its parameter registers, so both toggles take the group from
    // the bell's addView call and the extension finds the activity through the group's context.
    val (bellAdd, bellGroup) = matchToolbar.addViewCall("$VIEW_GROUP->addView(Landroid/view/View;Landroid/view/ViewGroup\$LayoutParams;)V")
    matchToolbar.requireNoBranchTargetAt(bellAdd + 1, "match toggle")
    val (headerAdd, headerGroup) = entityHeader.addViewCall("$VIEW_GROUP->addView(Landroid/view/View;ILandroid/view/ViewGroup\$LayoutParams;)V")
    entityHeader.requireNoBranchTargetAt(headerAdd + 1, "competition toggle")
    binder.requireUnwritten(binder.p(1)..binder.p(3), "binding/item/game")
    // ScoreBoxView.a reuses its parameter registers, so it hands (this, game) over at entry.
    val scoreBoxThis = scoreBox.p(0)

    // 1. Notifications.
    val notification = handler.p(1)
    handler.addInstructionsWithLabelsChecked(
        0,
        """
            invoke-static/range { v$notification .. v$notification }, $SPOILER_FREE->blocksNotification(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :spoiler_stock
            return-void
        """,
        ExternalLabel("spoiler_stock", handler.getInstruction(0)),
    )

    // 2. Match page toggle, right after the bell is added to the toolbar group.
    matchToolbar.addInstructionsChecked(
        bellAdd + 1,
        "invoke-static/range { v$bellGroup .. v$bellGroup }, $SPOILER_FREE->addMatchToggle($VIEW_GROUP)V",
    )

    // 3. Competition page toggle, right after the bell is added to the header group.
    entityHeader.addInstructionsChecked(
        headerAdd + 1,
        "invoke-static/range { v$headerGroup .. v$headerGroup }, $SPOILER_FREE->addCompetitionToggle($VIEW_GROUP)V",
    )

    // 4. List row score text.
    val game = formatter.p(0)
    formatter.addInstructionsWithLabelsChecked(
        0,
        """
            invoke-static/range { v$game .. v$game }, $SPOILER_FREE->rowScoreText(Ljava/lang/Object;)Ljava/lang/String;
            move-result-object v0
            if-eqz v0, :spoiler_stock
            return-object v0
        """,
        ExternalLabel("spoiler_stock", formatter.getInstruction(0)),
    )

    // 5. Row status line and winner hints, before every return of the binder.
    for (index in binder.returnVoids()) {
        binder.addInstructionsAtControlFlowLabelChecked(
            index,
            "invoke-static/range { v${binder.p(1)} .. v${binder.p(3)} }, " +
                "$SPOILER_FREE->afterRowBound(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V",
        )
    }

    // 6. Match page header score box: (this, game) handed over at entry, applied before every return.
    for (index in scoreBox.returnVoids()) {
        scoreBox.addInstructionsAtControlFlowLabelChecked(index, "invoke-static { }, $SPOILER_FREE->afterScoreBox()V")
    }
    scoreBox.addInstructionsChecked(
        0,
        "invoke-static/range { v$scoreBoxThis .. v${scoreBoxThis + 1} }, " +
            "$SPOILER_FREE->beforeScoreBox(Ljava/lang/Object;Ljava/lang/Object;)V",
    )

    SPOILER_FEATURES.drop(1).forEach { scores365Controls.register(it) }
}
