package app.template.patches.flashscore.competitions

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.template.patches.flashscore.controls.FlashscoreControlsCategory
import app.template.patches.flashscore.controls.flashscoreControls
import app.template.patches.flashscore.spoiler.EVENT_MODEL_TO_STRING
import app.template.patches.flashscore.spoiler.classByToString
import app.template.patches.flashscore.spoiler.flashscoreMatchRowPatch
import app.template.patches.flashscore.spoiler.rewriteStub
import app.template.patches.flashscore.spoiler.stringFieldAfter
import app.template.patches.flashscore.spoiler.stub
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.HevalListFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal const val COMPETITION_FILTER = "Lapp/template/extension/flashscore/CompetitionFilter;"

/** The app's event filter logs this (EQUALS); it is the only method with the string (26.11.6: nz4.s()). */
internal const val FILTER_EVENTS_LOG = "FILTER_EVENTS: "

/** EventEntity.toString() and LeagueModel.toString() start with these (R8 renames the classes). */
internal const val EVENT_ENTITY_TO_STRING = "EventEntity{model="
internal const val LEAGUE_MODEL_TO_STRING = "LeagueModel{name='"
internal const val LEAGUE_ID_LABEL = "', id='"

/** The Favourites list's filter type (an enum constant name, kept as the enum's name string). */
internal const val FAVOURITES_FILTER = "FILTER_MYFS"

private const val STRING = "Ljava/lang/String;"
private const val OBJECT = "Ljava/lang/Object;"
private const val ARRAY_LIST = "Ljava/util/ArrayList;"

/** The switch: the long-press entry and the filter. */
internal val HIDE_COMPETITIONS = HevalFeature(
    id = "flashscore.hide_competitions",
    name = "Hide competitions",
    description = "Long-press a match in a list to hide its competition.",
    category = FlashscoreControlsCategory.LEAGUES,
    icon = "eye_off",
)

/** The hidden competitions (template ids, labelled by league name); the user can edit or clear it. */
internal val HIDDEN_COMPETITIONS = HevalListFeature(
    id = "flashscore.hidden_competitions",
    name = "Hidden competitions",
    description = "Remove a competition here to show its matches again.",
    category = FlashscoreControlsCategory.LEAGUES,
    icon = "eye_off",
    dependencies = listOf(HIDE_COMPETITIONS.id),
)

internal val COMPETITION_FEATURES = listOf(HIDE_COMPETITIONS, HIDDEN_COMPETITIONS)

private fun Method.isStatic() = AccessFlags.STATIC.isSet(accessFlags)
private fun Instruction.stringRef() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
private fun Instruction.fieldRef() = (this as? ReferenceInstruction)?.reference as? FieldReference
private fun Instruction.methodRef() = (this as? ReferenceInstruction)?.reference as? MethodReference
private fun Instruction.typeRef() = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type

/** The one instance field of [owner] typed [type]; throws on any other count. */
private fun instanceField(owner: ClassDef, type: String, what: String): FieldReference {
    val found = owner.fields.filter { it.type == type && !AccessFlags.STATIC.isSet(it.accessFlags) }
    return found.singleOrNull() ?: throw PatchException("${owner.type} has ${found.size} $type fields, expected one ($what)")
}

/** The one method whose code holds the string [value] exactly. */
private fun BytecodePatchContext.methodWithString(value: String): Pair<String, Method> {
    val found = mutableListOf<Pair<String, Method>>()
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            if (method.implementation?.instructions?.any { it.stringRef() == value } == true) found += classDef.type to method
        }
    }
    return found.singleOrNull() ?: throw PatchException("${found.size} methods with \"$value\", expected one")
}

/** Feed-key enum constant names (26.11.6: ohc; ZA, ZAA, ZAB, ZH). */
internal const val FEED_NAME = "NAME"
internal const val FEED_NAME_PART_1 = "NAME_PART_1"
internal const val FEED_NAME_PART_2 = "NAME_PART_2"
internal const val FEED_TEMPLATE_ID = "TEMPLATE_ID"

/**
 * The LeagueModel String field each feed key is stored in: the feed-key enum's constant name gives its
 * ordinal (the <clinit> constructor calls, register values tracked), and the league holder's key method
 * switches on that ordinal; each case's first iput-object of a [league] String field is the key's field.
 */
private fun BytecodePatchContext.leagueFeedFields(holder: String, league: String): Map<String, FieldReference> {
    val wanted = listOf(FEED_NAME, FEED_NAME_PART_1, FEED_NAME_PART_2, FEED_TEMPLATE_ID)
    val enums = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        if (classDef.superclass == "Ljava/lang/Enum;") {
            val strings = classDef.methods.firstOrNull { it.name == "<clinit>" }?.implementation?.instructions
                ?.mapNotNull { it.stringRef() }?.toSet() ?: return@classDefForEach
            if (strings.containsAll(wanted)) enums += classDef
        }
    }
    val enum = enums.singleOrNull() ?: throw PatchException("${enums.size} enums name ${wanted.joinToString()}, expected one (the league feed keys)")
    // Constant name -> ordinal.
    val ordinals = mutableMapOf<String, Int>()
    val regs = mutableMapOf<Int, Any>()
    enum.methods.single { it.name == "<clinit>" }.implementation!!.instructions.forEach { insn ->
        val ref = insn.methodRef()
        if ((insn.opcode == Opcode.INVOKE_DIRECT || insn.opcode == Opcode.INVOKE_DIRECT_RANGE) && ref?.name == "<init>" &&
            ref.definingClass == enum.type && ref.parameterTypes.size >= 2 &&
            ref.parameterTypes[0].toString() == STRING && ref.parameterTypes[1].toString() == "I"
        ) {
            val args = when (insn) {
                is FiveRegisterInstruction -> listOf(insn.registerC, insn.registerD, insn.registerE)
                is RegisterRangeInstruction -> listOf(insn.startRegister, insn.startRegister + 1, insn.startRegister + 2)
                else -> emptyList()
            }
            val name = regs[args.getOrNull(1)] as? String
            val ordinal = regs[args.getOrNull(2)] as? Int
            if (name != null && ordinal != null) ordinals[name] = ordinal
            return@forEach
        }
        when (insn.opcode) {
            Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO -> regs[(insn as OneRegisterInstruction).registerA] = insn.stringRef()!!
            Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST ->
                regs[(insn as OneRegisterInstruction).registerA] = (insn as com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction).narrowLiteral
            Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16, Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16 -> {
                val move = insn as TwoRegisterInstruction
                val value = regs[move.registerB]
                if (value != null) regs[move.registerA] = value else regs.remove(move.registerA)
            }
            else -> if (insn.opcode.setsRegister()) {
                (insn as? OneRegisterInstruction)?.registerA?.let { regs.remove(it); if (insn.opcode.setsWideRegister()) regs.remove(it + 1) }
            }
        }
    }
    wanted.forEach { if (it !in ordinals) throw PatchException("${enum.type}: no ordinal found for $it") }
    if (ordinals.values.toSet().size != ordinals.size) throw PatchException("${enum.type}: duplicate ordinals $ordinals")

    // The holder's key method: the one with a packed-switch that casts to the enum.
    val methods = classDefBy(holder).methods.filter { m ->
        val code = m.implementation?.instructions?.toList() ?: return@filter false
        code.any { it.opcode == Opcode.PACKED_SWITCH } && code.any { it.opcode == Opcode.CHECK_CAST && it.typeRef() == enum.type }
    }
    val method = methods.singleOrNull() ?: throw PatchException("$holder: ${methods.size} key switches over ${enum.type}, expected one")
    val insns = method.implementation!!.instructions.toList()
    val addresses = IntArray(insns.size)
    insns.indices.drop(1).forEach { addresses[it] = addresses[it - 1] + insns[it - 1].codeUnits }
    val switches = insns.indices.filter { insns[it].opcode == Opcode.PACKED_SWITCH }
    val switchAt = switches.singleOrNull() ?: throw PatchException("$holder->${method.name}: ${switches.size} packed-switches, expected one")
    val payloadAddress = addresses[switchAt] + (insns[switchAt] as OffsetInstruction).codeOffset
    val payload = insns.getOrNull(addresses.indexOf(payloadAddress)) as? com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
        ?: throw PatchException("$holder->${method.name}: no packed-switch payload")
    val cases = payload.switchElements.associate { it.key to addresses.indexOf(addresses[switchAt] + it.offset) }
    return wanted.associateWith { key ->
        val start = cases[ordinals.getValue(key)]?.takeIf { it >= 0 }
            ?: throw PatchException("$holder->${method.name}: no switch case for $key (ordinal ${ordinals[key]})")
        insns.drop(start).takeWhile { it.opcode != Opcode.RETURN_VOID && it.opcode != Opcode.GOTO && it.opcode != Opcode.GOTO_16 }
            .firstNotNullOfOrNull { insn ->
                insn.fieldRef()?.takeIf { insn.opcode == Opcode.IPUT_OBJECT && it.definingClass == league && it.type == STRING }
            } ?: throw PatchException("$holder->${method.name}: the $key case stores no $league String field")
    }
}

// Hide competitions (2026-11-14, stage B2, owner request), like Sofascore's and FotMob's: Manager default off,
// category "Leagues and countries", a switch (flashscore.hide_competitions) and the Patch settings list
// flashscore.hidden_competitions that depends on it (edit or clear it there). The user marks a competition by
// long-pressing a match row ("Hide this competition" / "Show this competition" in the row dialog shared with
// Spoiler-free mode, flashscoreMatchRowPatch). Read on every list rebuild, so no restart.
// 1. The filter: the app's event filter (26.11.6: nz4.s()Ljava/util/ArrayList;, the only method with the string
//    "FILTER_EVENTS: ") builds a fresh ArrayList of event entities (one new-instance, the register every
//    return-object returns), runs the app's own filters, then casts its list filter (26.11.6: gg7) out of a field
//    and sorts. Right after that check-cast it calls CompetitionFilter.filterEvents(filter, list), which drops the
//    events of hidden competitions in place; both returns follow (no branch from before the cast lands after it).
//    Every match list reads its events there (Today/Live, Favourites, sports, custom), and a league's header goes
//    with its events. The insertion is not right before each return because the method overwrites p0 (the filter)
//    on one path before returning; the cast point is the one site where both the list and the filter are live.
// 2. Favourites: a list whose filter type (gg7's only ex8 field) is the enum constant named FILTER_MYFS is never
//    filtered, so starred matches stay in Favourites (FotMob keeps favourites too; Sofascore hides them). Matches
//    of a hidden competition the user starred still leave the other lists.
// 3. The key is the league's template id (LeagueModel field read by its only ()Z method, the "is my league" check
//    that passes it with the sport id to a static (I, String)Z; Flashscore keys pinned leagues by it, e.g.
//    "1_198_dYlOSQOD"), which stays the same across seasons and stages. The league id (LeagueModel.a, read after
//    "', id='" in its toString) is built as "<sportId>;<header>" by the feed parser and its header part can name a
//    stage, so it is only the fallback key when an event has no template id; both forms are checked and both are
//    removed on "Show this competition". The app's own LeagueRowModel (toString "LeagueRowModel(sportId=") gets
//    mhc.f as tournamentTemplateId, next to mhc.l (tournamentId, the season) and mhc.e (tournamentStageId), so the
//    key covers every season and stage; the feed-key enum names it TEMPLATE_ID (key ZH; the emulator stored
//    "1_8bP2bXmH"). Label (fixed after the 2026-11-14 emulator run, which saved the key as the label): the feed's
//    NAME (mhc.b, after "LeagueModel{name='") is not sent for list leagues, so the label is NAME_PART_1 · NAME_PART_2
//    (mhc.h · mhc.j, the header's prefix and league name), resolved through the feed-key enum and the holder's key
//    switch (leagueFeedFields); NAME is the fallback. filterEvents re-reports the label of each hidden league once
//    per process, so a label saved as the key is corrected the next time its matches are filtered.
// 4. The match lists cache their filtered events per list, and no safe refresh trigger was found, so the dialog
//    shows a toast that the change applies when the list reloads.
// The R8 names (event entity -> model -> league holder -> league and its fields, the filter's type field) are
// resolved here and written into CompetitionFilter's stub accessors. Not covered: team and competition pages, the
// Compose lists, search, the widget and notifications.
@Suppress("unused")
val hideCompetitionsPatch = flashscoreControls.featurePatch(
    HIDE_COMPETITIONS,
    description = "Hides matches of the competitions you pick.",
    default = false,
    dependencies = setOf(flashscoreMatchRowPatch),
) {
    classDefBy(COMPETITION_FILTER)

    // Find every site before the first edit.
    // 1. The event filter and its hook point.
    val (filterOwner, filterFound) = methodWithString(FILTER_EVENTS_LOG)
    if (filterFound.returnType != ARRAY_LIST) throw PatchException("$filterOwner->${filterFound.name} returns ${filterFound.returnType}, expected ArrayList")
    if (filterFound.isStatic()) throw PatchException("$filterOwner->${filterFound.name} is static")
    val filter = mutableClassDefBy(filterOwner).methods.single {
        it.name == filterFound.name && it.parameterTypes == filterFound.parameterTypes && it.returnType == ARRAY_LIST
    }
    val code = filter.implementation!!
    val insns = code.instructions.toList()
    val p0 = code.registerCount - 1 - filter.parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
    val returns = insns.indices.filter { insns[it].opcode == Opcode.RETURN_OBJECT }
    if (returns.isEmpty()) throw PatchException("$filterOwner->${filter.name} has no return-object")
    val listRegs = returns.map { (insns[it] as OneRegisterInstruction).registerA }.toSet()
    val list = listRegs.singleOrNull() ?: throw PatchException("$filterOwner->${filter.name} returns registers $listRegs, expected one")
    val listWrites = insns.indices.filter { i ->
        val insn = insns[i]
        insn.opcode.setsRegister() && (insn as? OneRegisterInstruction)?.registerA == list ||
            insn.opcode.setsWideRegister() && (insn as? OneRegisterInstruction)?.registerA == list - 1
    }
    val listWrite = listWrites.singleOrNull()
        ?: throw PatchException("$filterOwner->${filter.name} writes the returned v$list ${listWrites.size} times, expected once")
    if (insns[listWrite].opcode != Opcode.NEW_INSTANCE || insns[listWrite].typeRef() != ARRAY_LIST) {
        throw PatchException("$filterOwner->${filter.name}: the returned list is not a new ArrayList")
    }
    // The cast of the list filter out of p0's Object field: iget-object p0, p0, <owner>->x:Object; check-cast p0, T.
    val casts = insns.indices.filter { i ->
        i > 0 && insns[i].opcode == Opcode.CHECK_CAST && (insns[i] as OneRegisterInstruction).registerA == p0 &&
            insns[i - 1].opcode == Opcode.IGET_OBJECT && (insns[i - 1] as TwoRegisterInstruction).let { it.registerA == p0 && it.registerB == p0 } &&
            insns[i - 1].fieldRef()?.let { it.definingClass == filterOwner && it.type == OBJECT } == true &&
            i > listWrite && returns.all { r -> r > i }
    }
    val cast = casts.singleOrNull()
        ?: throw PatchException("$filterOwner->${filter.name}: ${casts.size} filter casts of p0 between the list and the returns, expected one")
    val filterType = insns[cast].typeRef()!!
    val hookAt = cast + 1
    filter.requireNoBranchTargetAt(hookAt, "Hide competitions filter hook")
    // Every return must come through the hook: no branch from before the cast may land after it.
    val addresses = IntArray(insns.size)
    insns.indices.drop(1).forEach { addresses[it] = addresses[it - 1] + insns[it - 1].codeUnits }
    insns.indices.filter { it < cast }.forEach { i ->
        val insn = insns[i]
        if (insn.opcode == Opcode.PACKED_SWITCH || insn.opcode == Opcode.SPARSE_SWITCH) {
            throw PatchException("$filterOwner->${filter.name} switches before the filter cast")
        }
        if (insn is OffsetInstruction) {
            val target = addresses[i] + insn.codeOffset
            if (target > addresses[cast]) throw PatchException("$filterOwner->${filter.name}: a branch before the filter cast skips the hook")
        }
    }
    // Nor may an exception handler land between the cast and the last return (it could return the list
    // without passing the hook), nor code after the last return jump back into that stretch.
    val lastReturn = returns.max()
    code.tryBlocks.flatMap { it.exceptionHandlers }.forEach { handler ->
        if (handler.handlerCodeAddress > addresses[cast] && handler.handlerCodeAddress <= addresses[lastReturn]) {
            throw PatchException("$filterOwner->${filter.name}: an exception handler lies between the filter cast and the returns")
        }
    }
    insns.indices.filter { it > lastReturn }.forEach { i ->
        val insn = insns[i]
        if (insn.opcode == Opcode.PACKED_SWITCH || insn.opcode == Opcode.SPARSE_SWITCH) {
            throw PatchException("$filterOwner->${filter.name} switches after its last return")
        }
        if (insn is OffsetInstruction) {
            val target = addresses[i] + insn.codeOffset
            if (target > addresses[cast] && target <= addresses[lastReturn]) {
                throw PatchException("$filterOwner->${filter.name}: code after the last return jumps between the filter cast and the returns")
            }
        }
    }
    if (p0 > 15 || list > 15) throw PatchException("$filterOwner->${filter.name}: v$p0 / v$list do not fit a 4-bit invoke")

    // 2. The Favourites exemption: the filter's only field of the enum with FILTER_MYFS.
    val enums = mutableListOf<String>()
    classDefForEach { classDef ->
        if (classDef.superclass == "Ljava/lang/Enum;" && classDef.methods.any { m ->
                m.name == "<clinit>" && m.implementation?.instructions?.any { it.stringRef() == FAVOURITES_FILTER } == true
            }
        ) enums += classDef.type
    }
    val filterClass = classDefBy(filterType)
    val typeFields = enums.mapNotNull { enum ->
        filterClass.fields.filter { it.type == enum && !AccessFlags.STATIC.isSet(it.accessFlags) }.takeIf { it.isNotEmpty() }
    }
    val typeField = typeFields.singleOrNull()?.singleOrNull()
        ?: throw PatchException("$filterType has ${typeFields.flatten().size} fields of the $FAVOURITES_FILTER enum ($enums), expected one")

    // 3. The element chain: EventEntity -> EventModel -> league holder -> LeagueModel.
    val entity = classByToString(EVENT_ENTITY_TO_STRING)
    val model = classByToString(EVENT_MODEL_TO_STRING)
    val league = classByToString(LEAGUE_MODEL_TO_STRING)
    val modelField = instanceField(entity, model.type, "the event model")
    val holderFields = model.fields.filter { field ->
        !AccessFlags.STATIC.isSet(field.accessFlags) && field.type.startsWith("L") && !field.type.startsWith("Ljava/") &&
            field.type != league.type && classDefByOrNull(field.type)?.fields?.count {
                it.type == league.type && !AccessFlags.STATIC.isSet(it.accessFlags)
            } == 1
    }
    val holderField = holderFields.singleOrNull()
        ?: throw PatchException("${model.type} has ${holderFields.size} fields holding one ${league.type}, expected one (the league)")
    val leagueField = instanceField(classDefBy(holderField.type), league.type, "the league")
    val leagueToString = league.methods.single { it.name == "toString" && it.parameterTypes.isEmpty() && it.implementation != null }
    val nameField = leagueToString.stringFieldAfter(LEAGUE_MODEL_TO_STRING, league.type)
    val idField = leagueToString.stringFieldAfter(LEAGUE_ID_LABEL, league.type)
    val myLeague = league.methods.filter {
        it.returnType == "Z" && it.parameterTypes.isEmpty() && !it.isStatic() && it.implementation != null
    }.singleOrNull() ?: throw PatchException("${league.type} has no single ()Z method (the my-league check)")
    // The template id is the String field whose iget feeds the String argument of the static (I, String)Z
    // "is my league" call (26.11.6: iget-object p0, p0, mhc.f; invoke-static {v0, p0}, mqg.d(I, String)Z).
    val myLeagueInsns = myLeague.implementation!!.instructions.toList()
    val lookups = myLeagueInsns.indices.filter { i ->
        val insn = myLeagueInsns[i]
        (insn.opcode == Opcode.INVOKE_STATIC || insn.opcode == Opcode.INVOKE_STATIC_RANGE) && insn.methodRef()?.let {
            it.returnType == "Z" && it.parameterTypes.map(CharSequence::toString) == listOf("I", STRING)
        } == true
    }
    val lookup = lookups.singleOrNull()
        ?: throw PatchException("${league.type}->${myLeague.name} calls ${lookups.size} static (I, String)Z, expected one")
    val stringArg = when (val call = myLeagueInsns[lookup]) {
        is FiveRegisterInstruction -> call.registerD.takeIf { call.registerCount == 2 }
        is RegisterRangeInstruction -> (call.startRegister + 1).takeIf { call.registerCount == 2 }
        else -> null
    } ?: throw PatchException("${league.type}->${myLeague.name}: the (I, String)Z call does not pass two registers")
    val argWrite = (lookup - 1 downTo 0).firstOrNull { i ->
        val insn = myLeagueInsns[i]
        insn.opcode.setsRegister() && (insn as? OneRegisterInstruction)?.registerA == stringArg ||
            insn.opcode.setsWideRegister() && (insn as? OneRegisterInstruction)?.registerA == stringArg - 1
    } ?: throw PatchException("${league.type}->${myLeague.name}: nothing writes the String argument v$stringArg")
    val templateField = myLeagueInsns[argWrite].fieldRef()?.takeIf {
        myLeagueInsns[argWrite].opcode == Opcode.IGET_OBJECT && it.definingClass == league.type && it.type == STRING
    } ?: throw PatchException("${league.type}->${myLeague.name}: the (I, String)Z call's String argument is not an iget of a ${league.type} String field")
    // No branch may land between that iget and the call (another value could reach the argument).
    val myAddresses = IntArray(myLeagueInsns.size)
    myLeagueInsns.indices.drop(1).forEach { myAddresses[it] = myAddresses[it - 1] + myLeagueInsns[it - 1].codeUnits }
    myLeagueInsns.forEachIndexed { i, insn ->
        if (insn is OffsetInstruction) {
            val target = myAddresses[i] + insn.codeOffset
            if (target > myAddresses[argWrite] && target <= myAddresses[lookup]) {
                throw PatchException("${league.type}->${myLeague.name}: a branch lands between the template-id read and the call")
            }
        }
    }
    if (templateField.name == idField.name || templateField.name == nameField.name) {
        throw PatchException("${league.type}: the template id field ${templateField.name} is the id or the name")
    }

    // 3b. The display name. The feed's NAME field (mhc.b) is not sent for list leagues (only toString reads
    //     it; the emulator stored the key as the label); the league header shows NAME_PART_1 (prefix,
    //     "AFRICA") and NAME_PART_2 (league name), which the app passes to its LeagueRowModel as prefix and
    //     leagueName. Their fields come from the feed-key enum (constant name -> ordinal) and the holder's
    //     key switch (ordinal -> the LeagueModel field it stores the value in). TEMPLATE_ID (feed key ZH, the
    //     row model's tournamentTemplateId) must be the template field found above.
    val feedFields = leagueFeedFields(holderField.type, league.type)
    val prefixField = feedFields[FEED_NAME_PART_1] ?: throw PatchException("no LeagueModel field for $FEED_NAME_PART_1")
    val titleField = feedFields[FEED_NAME_PART_2] ?: throw PatchException("no LeagueModel field for $FEED_NAME_PART_2")
    if (feedFields[FEED_TEMPLATE_ID]?.name != templateField.name) {
        throw PatchException("${league.type}: $FEED_TEMPLATE_ID is stored in ${feedFields[FEED_TEMPLATE_ID]?.name}, the my-league check reads ${templateField.name}")
    }
    if (feedFields[FEED_NAME]?.name != nameField.name) {
        throw PatchException("${league.type}: $FEED_NAME is stored in ${feedFields[FEED_NAME]?.name}, toString names ${nameField.name}")
    }

    // 4. The stubs.
    val extension = mutableClassDefBy(COMPETITION_FILTER).methods
    fun stub(name: String) = extension.stub(COMPETITION_FILTER, name)
    val stubs = listOf(
        "isEvent", "eventModel", "leagueHolder", "league", "leagueId", "leagueTemplateId", "leagueName",
        "leaguePrefix", "leagueTitle", "filterType",
    ).associateWith { stub(it) }

    // Edits.
    stubs.getValue("isEvent").rewriteStub(
        """
            instance-of p0, p0, ${entity.type}
            return p0
        """,
    )
    fun read(stubName: String, owner: String, field: FieldReference) = stubs.getValue(stubName).rewriteStub(
        """
            check-cast p0, $owner
            iget-object p0, p0, $owner->${field.name}:${field.type}
            return-object p0
        """,
    )
    read("eventModel", entity.type, modelField)
    read("leagueHolder", model.type, holderField)
    read("league", holderField.type, leagueField)
    read("leagueId", league.type, idField)
    read("leagueTemplateId", league.type, templateField)
    read("leagueName", league.type, nameField)
    read("leaguePrefix", league.type, prefixField)
    read("leagueTitle", league.type, titleField)
    read("filterType", filterType, typeField)

    filter.addInstructionsChecked(
        hookAt,
        "invoke-static { v$p0, v$list }, $COMPETITION_FILTER->filterEvents($OBJECT$ARRAY_LIST)V",
    )

    flashscoreControls.register(HIDDEN_COMPETITIONS)
}
