/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.patchLog
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.EXTENSION_ROOT
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.namedRegisters
import app.morphe.util.superclassChain
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "Hide closeup buttons"

internal const val CLOSEUP_BUTTONS = "$EXTENSION_PACKAGE/ui/CloseupButtons;"
internal const val CLOSEUP_BACK_HOOK = "$CLOSEUP_BUTTONS->backArrow(Landroid/view/View;)V"
internal const val CLOSEUP_LENS_HOOK = "$CLOSEUP_BUTTONS->lens(Landroid/view/View;)V"
internal const val CLOSEUP_VISIBILITY_HOOK = "$CLOSEUP_BUTTONS->visibility(Landroid/view/View;I)I"
internal const val CLOSEUP_SEARCH_LABEL_HOOK = "$CLOSEUP_BUTTONS->searchLabel(Z)Z"
internal const val CLOSEUP_REMIX_HOOK = "$CLOSEUP_BUTTONS->remix(Landroid/view/View;)V"
internal const val CLOSEUP_ACTION_BAR_HOOK = "$CLOSEUP_BUTTONS->actionBar(Landroid/view/View;)V"
internal const val CLOSEUP_VISIT_SITE_HOOK = "$CLOSEUP_BUTTONS->visitSite(Landroid/view/View;)V"
internal const val CLOSEUP_SAVE_BUTTON_HOOK = "$CLOSEUP_BUTTONS->saveButton(Landroid/view/View;)V"

/** Pinterest's own button class. The Save button on a pin is one, and the extension knows it by its id. */
internal const val GESTALT_BUTTON = "Lcom/pinterest/gestalt/button/view/GestaltButton;"

/** The last thing a GestaltButton's style method does to it before moving on to its size. */
internal const val COMPOUND_PADDING = "Landroid/widget/TextView;->setCompoundDrawablePadding(I)V"

/** The R fields naming each button's id. This build reads ids from R rather than inlining them. */
internal const val CLOSEUP_BACK_ID = "closeup_back_button"
internal const val CLOSEUP_LENS_ID = "flashlight_search_button"

/** A pin with several pictures shows them in a carousel, which has a lens of its own under this id. */
internal const val CLOSEUP_CAROUSEL_LENS_ID = "carousel_flashlight_button"

/** The Remix button's id, passed to the call that makes it. */
internal const val CLOSEUP_REMIX_ID = "collages_remix_closeup_button"

/** The id the comment button in the row under a pin's picture gives itself. */
internal const val CLOSEUP_COMMENTS_ID = "action_module_comments_icon"

/** The Visit site button's id, given by a lambda its row builds. */
internal const val CLOSEUP_VISIT_SITE_ID = "clickthrough_button"

private const val BUTTON_GROUP = "/GestaltButtonGroup;"

/** The closeup state's toString names the lens label's flag right before reading it. */
internal const val SEARCH_LABEL_FLAG = ", isVisualActionAnimated="

/** The end of the string the same toString names the lens's glow flag with. */
internal const val SEARCH_GLOW_FLAG = "isGlowAnimationEnabled="

/** The R string the lens wears as its label. */
internal const val SEARCH_IMAGE_TEXT = "search_image"

private const val FIND_VIEW = "Landroid/view/View;->findViewById(I)Landroid/view/View;"
private const val GET_CLASS = "Ljava/lang/Object;->getClass()Ljava/lang/Class;"
private val MOVE_OBJECTS = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)
private val ANDROID_VIEWS = listOf("Landroid/view/", "Landroid/widget/")

/** Where a button is handed to the extension: the hook goes in at [index], passing [register], a [view]. */
internal class ButtonSite(val method: Method, val index: Int, val register: Int, val view: String, val found: Boolean)

internal fun Instruction.readsId(id: String): Boolean {
    if (opcode != Opcode.SGET) return false
    val field = (this as ReferenceInstruction).reference as? FieldReference ?: return false
    return field.name == id && field.type == "I"
}

/**
 * Every place [id]'s button is found or built, from the methods that read the R field of that name.
 * Found: the id read, `findViewById` with it, and `move-result-object`. The hook goes right after,
 * and the button's class is the check-cast that follows, after Kotlin's getClass null check if
 * there is one, made on the button or on the copy a `move-object` makes of it (the picture
 * carousel's lens). Built: a method answering one of the APK's own views through a single
 * `return-object`, where that view takes the id (see [tiedToId]). The hook goes right before it,
 * and the class is the method's return type. Constructed: see [constructedAt]. Anything else
 * reading the id, such as a table pairing ids with names, isn't a button.
 */
internal fun BytecodePatchContext.buttonSites(id: String): List<ButtonSite> {
    val sites = mutableListOf<ButtonSite>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        owner.methods.forEach { method -> sites += buttonSites(method, id) }
    }
    return sites
}

private fun BytecodePatchContext.buttonSites(method: Method, id: String): List<ButtonSite> {
    val body = method.instructions()
    val reads = body.indices.filter { body[it].readsId(id) }
    if (reads.isEmpty()) return emptyList()
    val found = reads.mapNotNull { foundAt(method, body, it, id) }
    if (found.isNotEmpty()) return found
    val returns = body.indices.filter { body[it].opcode == Opcode.RETURN_OBJECT }
    if (returns.size == 1 && classDefByOrNull(method.returnType) != null && isFrameworkView(method.returnType)) {
        val at = returns.single()
        val button = (body[at] as OneRegisterInstruction).registerA
        if (tiedToId(body, reads, button)) return listOf(ButtonSite(method, at, button, method.returnType, false))
    }
    return constructedAt(method, body, reads)
}

/**
 * Built in place: one of the APK's own views constructed from an object whose own constructor took
 * the id, in a method that goes on to do more. 14.40.0 builds the second closeup's lens that way,
 * where 14.39.0 called a small method answering it. The hook goes right after the view's
 * constructor, the only place the new view is sure to be in that register, so these sites are
 * checked like a found button's.
 */
private fun BytecodePatchContext.constructedAt(method: Method, body: List<Instruction>, reads: List<Int>): List<ButtonSite> {
    val ids = reads.map { (body[it] as OneRegisterInstruction).registerA }.toSet()
    val holders = mutableSetOf<Int>()
    val sites = mutableListOf<ButtonSite>()
    for (index in reads.min() + 1 until body.size) {
        val call = body[index]
        if (call !is FiveRegisterInstruction && call !is RegisterRangeInstruction) continue
        val target = (call as ReferenceInstruction).reference as? MethodReference ?: continue
        val registers = call.namedRegisters()
        if (target.name != "<init>" || registers.isEmpty()) continue
        val passed = registers.drop(1)
        if (passed.any { it in ids }) {
            holders += registers.first()
            continue
        }
        if (passed.none { it in holders }) continue
        val type = target.definingClass
        if (classDefByOrNull(type) == null || !isFrameworkView(type)) continue
        sites += ButtonSite(method, index + 1, registers.first(), type, true)
    }
    return sites
}

/**
 * True when the view answered in [button] takes the id read at [reads]: `setId` is called on it
 * with the id, or its constructor takes an object whose own constructor took the id. A method
 * that answers some other view, the parent it looked the button up in for one, doesn't qualify.
 */
internal fun tiedToId(body: List<Instruction>, reads: List<Int>, button: Int): Boolean {
    val ids = reads.map { (body[it] as OneRegisterInstruction).registerA }.toSet()
    val holders = mutableSetOf<Int>()
    for (index in reads.min() + 1 until body.size) {
        val call = body[index]
        if (call !is FiveRegisterInstruction && call !is RegisterRangeInstruction) continue
        val method = (call as ReferenceInstruction).reference as? MethodReference ?: continue
        val registers = call.namedRegisters()
        if (registers.isEmpty()) continue
        val passed = registers.drop(1)
        if (method.name == "setId" && method.parameterTypes.map { it.toString() } == listOf("I") &&
            registers.first() == button && passed.any { it in ids }) return true
        if (method.name != "<init>") continue
        if (passed.any { it in ids }) holders += registers.first()
        if (registers.first() == button && passed.any { it in holders }) return true
    }
    return false
}

private fun foundAt(method: Method, body: List<Instruction>, at: Int, id: String): ButtonSite? {
    val find = body.getOrNull(at + 1) as? FiveRegisterInstruction ?: return null
    if (find.opcode != Opcode.INVOKE_VIRTUAL || (find as ReferenceInstruction).reference.toString() != FIND_VIEW ||
        find.registerCount != 2 || find.registerD != (body[at] as OneRegisterInstruction).registerA) return null
    val kept = body.getOrNull(at + 2)
    if (kept?.opcode != Opcode.MOVE_RESULT_OBJECT) return null
    val button = (kept as OneRegisterInstruction).registerA
    var next = at + 3
    val check = body.getOrNull(next)
    if (check is FiveRegisterInstruction && check.opcode == Opcode.INVOKE_VIRTUAL && check.registerCount == 1 &&
        check.registerC == button && (check as ReferenceInstruction).reference.toString() == GET_CLASS) next++
    var cast = body.getOrNull(next)
    var copy = button
    if (cast?.opcode in MOVE_OBJECTS && (cast as TwoRegisterInstruction).registerB == button) {
        copy = cast.registerA
        cast = body.getOrNull(next + 1)
    }
    if (cast?.opcode != Opcode.CHECK_CAST || (cast as OneRegisterInstruction).registerA != copy) {
        throw PatchException("$PATCH: ${method.definingClass}->${method.name} finds the $id button without casting it to its class")
    }
    return ButtonSite(method, at + 3, button, ((cast as ReferenceInstruction).reference as TypeReference).type, true)
}

/**
 * Every place [id]'s button is made by a call: a method other than a constructor, passed the id
 * while its register still holds it, answering one of the APK's own views into the
 * `move-result-object` right after. 14.42.0 makes the Remix button that way. The hook goes right
 * after, the only place the new button is sure to be in that register, so these sites are checked
 * like a found button's.
 */
internal fun BytecodePatchContext.madeSites(id: String): List<ButtonSite> {
    val sites = mutableListOf<ButtonSite>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        owner.methods.forEach { method ->
            val body = method.instructions()
            body.indices.filter { body[it].readsId(id) }.mapNotNullTo(sites) { madeAt(method, body, it) }
        }
    }
    return sites
}

private fun BytecodePatchContext.madeAt(method: Method, body: List<Instruction>, read: Int): ButtonSite? {
    val id = (body[read] as OneRegisterInstruction).registerA
    for (index in read + 1 until body.size - 1) {
        val call = body[index]
        val target = (call as? ReferenceInstruction)?.reference as? MethodReference
        if (target != null && target.name != "<init>" && (call is FiveRegisterInstruction || call is RegisterRangeInstruction) &&
            id in call.namedRegisters()) {
            val kept = body[index + 1]
            val type = target.returnType
            if (kept.opcode == Opcode.MOVE_RESULT_OBJECT && classDefByOrNull(type) != null && isFrameworkView(type)) {
                return ButtonSite(method, index + 2, (kept as OneRegisterInstruction).registerA, type, true)
            }
        }
        if (call.writes(id)) return null
    }
    return null
}

/** True when the instruction puts a new value in [register]. */
private fun Instruction.writes(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val written = (this as? OneRegisterInstruction)?.registerA ?: return false
    return written == register || opcode.setsWideRegister() && written + 1 == register
}

/**
 * A row of buttons, an APK view handed over right after its [constructors] call their parent's,
 * with the APK views those constructors [built].
 */
internal class ButtonRow(val type: String, val constructors: List<Method>, val built: List<String>)

/**
 * The row of buttons under a pin's picture: an APK view whose constructor builds the comment
 * button, an APK view whose own constructor gives itself [CLOSEUP_COMMENTS_ID]. Like, share and
 * more are among the other APK views that constructor builds, and the extension tells them apart by
 * the ids they hold.
 */
internal fun BytecodePatchContext.actionRows(): List<ButtonRow> {
    val comments = classesWhere { owner ->
        owner.methods.any { method ->
            method.name == "<init>" && method.instructions().let { body -> body.any { it.readsId(CLOSEUP_COMMENTS_ID) } && body.any { it.setsId() } }
        }
    }.filter { isFrameworkView(it) }.toSet()
    return rows { built -> built.any { it in comments } }
}

/**
 * The rows that can hold the Visit site button: APK views whose constructor builds a
 * GestaltButtonGroup and a lambda that gives its button [CLOSEUP_VISIT_SITE_ID].
 */
internal fun BytecodePatchContext.visitRows(): List<ButtonRow> {
    val namers = classesWhere { owner -> owner.methods.any { method -> method.instructions().any { it.readsId(CLOSEUP_VISIT_SITE_ID) } } }.toSet()
    return rows { built -> built.any { it.endsWith(BUTTON_GROUP) } && built.any { it in namers } }
}

private fun Instruction.setsId(): Boolean {
    val method = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return method.name == "setId" && method.parameterTypes.map { it.toString() } == listOf("I")
}

private fun BytecodePatchContext.classesWhere(test: (ClassDef) -> Boolean): List<String> {
    val types = mutableListOf<String>()
    classDefForEach { owner -> if (!owner.type.startsWith(EXTENSION_ROOT) && test(owner)) types += owner.type }
    return types
}

/** The APK views with constructors whose built types pass [builds]. */
private fun BytecodePatchContext.rows(builds: (List<String>) -> Boolean): List<ButtonRow> {
    val found = linkedMapOf<String, List<Method>>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        val constructors = owner.methods.filter { it.name == "<init>" && builds(it.built()) }
        if (constructors.isNotEmpty()) found[owner.type] = constructors
    }
    return found.filterKeys { isFrameworkView(it) }.map { (type, constructors) ->
        ButtonRow(type, constructors, constructors.flatMap { it.built() }.distinct().filter { classDefByOrNull(it) != null && isFrameworkView(it) })
    }
}

private fun Method.built() = instructions().filter { it.opcode == Opcode.NEW_INSTANCE }
    .map { ((it as ReferenceInstruction).reference as TypeReference).type }

/**
 * Where the constructor calls [parent]'s constructor (or another of its own) on its `this`
 * register, or null when it doesn't or something else goes in that register first. The row is
 * handed over from that register right after the call, because D8 may reuse it once `this` is no
 * longer read.
 */
internal fun Method.parentCall(parent: String?): Int? {
    val self = implementation!!.registerCount - 1 - parameterTypes.map { if (it.toString() in setOf("J", "D")) 2 else 1 }.sum()
    val body = instructions()
    val call = body.indexOfFirst { instruction ->
        val target = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        val receiver = when (instruction) {
            is FiveRegisterInstruction -> instruction.registerC
            is RegisterRangeInstruction -> instruction.startRegister
            else -> -1
        }
        (instruction.opcode == Opcode.INVOKE_DIRECT || instruction.opcode == Opcode.INVOKE_DIRECT_RANGE) && target?.name == "<init>" &&
            target.definingClass in setOf(parent, definingClass) && receiver == self
    }
    return call.takeIf { it >= 0 && body.take(it).none { instruction -> instruction.writes(self) } }
}

/** A read of the lens label's or glow's flag into [register], with the hook going in right after [index]. */
internal class LabelRead(val method: Method, val index: Int, val register: Int)

/**
 * Where the lens decides to wear its Search image label, play the animation that shows it, and
 * glow: every read of the closeup state's label and glow flags in the one class that builds the
 * lens, picks the search_image string and reads the label flag. Each flag is the first of the
 * state's own booleans its toString reads after naming it, the glow's being the first that isn't
 * the label's. Pinterest sets the label flag on the first two eligible closeups of a day and clears it
 * after, so the hook only ever makes a closeup look like the third, and the glow is a separate
 * effect the same hook switches off. Throws when any part is missing or there's more than one
 * candidate.
 */
internal fun BytecodePatchContext.labelReads(): List<LabelRead> {
    val described = methodsWithString(SEARCH_LABEL_FLAG).filter { it.name == "toString" && it.parameterTypes.isEmpty() }
    val toString = described.singleOrNull()
        ?: throw PatchException("${described.size} closeup states describe their lens label flag")
    val body = toString.instructions()
    fun ownFlagAfter(names: (String) -> Boolean, not: String = ""): FieldReference? {
        val named = body.indexOfFirst { (it as? ReferenceInstruction)?.reference.let { text -> text is StringReference && names(text.string) } }
        if (named < 0) return null
        return body.drop(named + 1).filter { it.opcode == Opcode.IGET_BOOLEAN }
            .map { (it as ReferenceInstruction).reference as FieldReference }
            .firstOrNull { "$it" != not }
            ?.takeIf { it.definingClass == toString.definingClass && it.type == "Z" }
    }
    val flag = ownFlagAfter({ it == SEARCH_LABEL_FLAG })
        ?: throw PatchException("the closeup state ${toString.definingClass} names its lens label flag without reading its own boolean")
    val glow = ownFlagAfter({ it.endsWith(SEARCH_GLOW_FLAG) }, "$flag")
        ?: throw PatchException("the closeup state ${toString.definingClass} doesn't name and read its lens glow flag")
    fun Instruction.reads(field: FieldReference) = opcode == Opcode.IGET_BOOLEAN && "${(this as ReferenceInstruction).reference}" == "$field"
    val builders = mutableListOf<ClassDef>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        val code = owner.methods.map { it.instructions() }
        if (code.any { body -> body.any { it.readsId(CLOSEUP_LENS_ID) } } && code.any { body -> body.any { it.readsId(SEARCH_IMAGE_TEXT) } } &&
            code.any { body -> body.any { it.reads(flag) } }) builders += owner
    }
    val builder = builders.singleOrNull() ?: throw PatchException("${builders.size} lens builders read its label flag")
    val reads = builder.methods.flatMap { method ->
        method.instructions().withIndex().filter { (_, read) -> read.reads(flag) || read.reads(glow) }
            .map { (at, read) -> LabelRead(method, at, (read as TwoRegisterInstruction).registerA) }
    }
    if (reads.none { it.method.instructions()[it.index].reads(glow) }) {
        throw PatchException("the lens builder ${builder.type} never reads the lens glow flag $glow")
    }
    return reads
}

/** Where a GestaltButton has its look applied: the hook goes in at [index], passing the button in [register]. */
internal class StyleSite(val method: Method, val index: Int, val register: Int)

/**
 * Where every GestaltButton, the Save button on a pin among them, has just been styled: its method
 * taking the old and new style, right after its one `setCompoundDrawablePadding` on itself. Its
 * colors, text and icons are all set by then, and the path that skips the padding for an unchanged
 * icon branches to the same spot, so the hook goes in at that spot's label. The method's this
 * register must still hold the button there: nothing writes it before, nothing branches backward
 * and nothing is caught. Throws when there isn't exactly one such method.
 */
internal fun BytecodePatchContext.styleSite(): StyleSite {
    val button = classDefByOrNull(GESTALT_BUTTON) ?: throw PatchException("there's no $GESTALT_BUTTON")
    val sites = button.methods.mapNotNull { method ->
        val parameters = method.parameterTypes.map { it.toString() }
        if (AccessFlags.STATIC.isSet(method.accessFlags) || method.returnType != "V" || parameters.size != 2 ||
            parameters[0] != parameters[1] || parameters[0].length == 1) return@mapNotNull null
        val code = method.implementation ?: return@mapNotNull null
        val self = code.registerCount - 1 - parameters.size
        val body = method.instructions()
        val pads = body.indices.filter { at ->
            val call = body[at]
            call is FiveRegisterInstruction && call.registerC == self && (call as ReferenceInstruction).reference.toString() == COMPOUND_PADDING
        }
        val pad = pads.singleOrNull() ?: return@mapNotNull null
        if (code.tryBlocks.isNotEmpty() || body.take(pad).any { it.writes(self) } || body.any { it.branchesBack() }) return@mapNotNull null
        StyleSite(method, pad + 1, self)
    }
    return sites.singleOrNull() ?: throw PatchException("${sites.size} $GESTALT_BUTTON methods style it and pad its icon on itself")
}

private fun Instruction.branchesBack(): Boolean = when (this) {
    is SwitchPayload -> switchElements.any { it.offset < 0 }
    is OffsetInstruction -> codeOffset < 0
    else -> false
}

/** True when the class's first ancestor outside the APK is one of Android's view classes. */
private fun BytecodePatchContext.isFrameworkView(type: String) =
    superclassChain(type).drop(1).lastOrNull()?.let { outside -> ANDROID_VIEWS.any { outside.startsWith(it) } } == true

@Suppress("unused")
val hideCloseupButtonsPatch = bytecodePatch(
    name = PATCH,
    description = "Lets you hide the buttons on a pin you open, each with its own switch. That covers the back arrow and " +
        "the visual search (lens) button that float over the picture, the like, comment, share and more buttons under it, " +
        "the Remix button and the Visit site button. Another switch keeps the lens but drops its glow and the Search " +
        "image label Pinterest puts on it for your first pins each day. Two more rows draw the red Save button smaller " +
        "or paint it a color you pick. Your phone's back gesture still leaves the pin, and Search image in the pin menu " +
        "still works. They all start off. Turn them on in HushPinterest settings > Interface.",
) {
    category("Interface")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        requireStatusMethod("hideCloseupButtons")
        requireStatusMethod("closeupButtons")
        requireStatusMethod("closeupSearchLabel")
        requireStatusMethod("closeupActionBar")
        requireStatusMethod("closeupRemix")
        requireStatusMethod("closeupVisitSite")
        requireStatusMethod("closeupSaveButton")
        val backs = buttonSites(CLOSEUP_BACK_ID)
        val single = buttonSites(CLOSEUP_LENS_ID)
        if (backs.isEmpty()) throw PatchException("$PATCH: nothing finds the closeup's back arrow")
        if (single.isEmpty()) throw PatchException("$PATCH: nothing builds the closeup's visual search button")
        // Only pins with several pictures have the carousel's lens, so a build without it still
        // hides the lens on every other pin.
        val carousel = buttonSites(CLOSEUP_CAROUSEL_LENS_ID)
        if (carousel.isEmpty()) patchLog.warning("$PATCH: nothing finds the picture carousel's visual search button")
        val lenses = single + carousel
        // The label has its own switch, so a build where its flag can't be pinned down still gets
        // both buttons, just without that third switch.
        val labels = try {
            labelReads()
        } catch (missing: PatchException) {
            patchLog.warning("$PATCH: ${missing.message}. Hide Search image label isn't in this build.")
            emptyList()
        }

        // Everything is found and checked before the first change.
        val views = (backs + lenses).map { it.view }.distinct().map { type ->
            if (!isFrameworkView(type)) throw PatchException("$PATCH: the button class $type is not an Android view")
            mutableClassDefBy(type).also { requireOverride(it, "setVisibility", listOf("I")) }
        }.toMutableList()
        val hooked = backs.map { it to CLOSEUP_BACK_HOOK } + lenses.map { it to CLOSEUP_LENS_HOOK }
        val edits = hooked.map { (site, hook) -> Triple(mutable(site.method), site, hook) }
        for ((method, site, _) in edits) {
            // A found button is only in its register on the path from findViewById, and a constructed
            // one on the path from its constructor.
            val at = method.implementation!!.instructions[site.index] as BuilderInstruction
            if (site.found && at.location.labels.isNotEmpty()) {
                throw PatchException("$PATCH: ${site.method.definingClass}->${site.method.name} branches into the found button")
            }
        }

        // Remix, the row under the picture and Visit site each have their own switches, so a build
        // where one of them can't be pinned down still gets the rest. Each group's views must all take
        // the visibility hook, or none of its switches is offered.
        fun takesHook(group: String, types: List<String>): Boolean {
            val adding = types.filter { type -> views.none { it.type == type } }.map { mutableClassDefBy(it) }
            try {
                adding.forEach { requireOverride(it, "setVisibility", listOf("I")) }
            } catch (refused: PatchException) {
                patchLog.warning("$PATCH: ${refused.message}. $group isn't in this build.")
                return false
            }
            views += adding
            return true
        }
        val remixes = madeSites(CLOSEUP_REMIX_ID).filter { site ->
            val at = mutable(site.method).implementation!!.instructions[site.index] as BuilderInstruction
            if (at.location.labels.isEmpty()) return@filter true
            patchLog.warning("$PATCH: ${site.method.definingClass}->${site.method.name} branches into the Remix button")
            false
        }
        if (remixes.isEmpty()) patchLog.warning("$PATCH: nothing makes the Remix button. Hide Remix button isn't in this build.")
        val remix = remixes.isNotEmpty() && takesHook("Hide Remix button", remixes.map { it.view }.distinct())
        // A row is handed over from its constructor's this register right after its parent's
        // constructor, before D8 can reuse that register.
        fun handedOver(group: String, rows: List<ButtonRow>): List<ButtonRow> {
            val kept = rows.filter { row ->
                val parent = classDefBy(row.type).superclass
                row.constructors.all { it.parentCall(parent) != null }.also { calls ->
                    if (!calls) patchLog.warning("$PATCH: ${row.type}'s constructor doesn't call its parent's on its this register first")
                }
            }
            if (kept.isEmpty()) patchLog.warning("$PATCH: no row to hand over for $group. It isn't in this build.")
            return kept
        }
        val actions = handedOver("Hide pin action buttons", actionRows()).let { rows ->
            if (rows.isNotEmpty() && takesHook("Hide pin action buttons", rows.flatMap { it.built }.distinct())) rows else emptyList()
        }
        val visits = handedOver("Hide Visit site button", visitRows()).let { rows ->
            if (rows.isNotEmpty() && takesHook("Hide Visit site button", rows.map { it.type })) rows else emptyList()
        }
        // The Save button's size and color ride on Pinterest's button styling, so a build where that
        // can't be pinned down still hides every button.
        val style = try {
            styleSite()
        } catch (missing: PatchException) {
            patchLog.warning("$PATCH: ${missing.message}. The Save button's size and color aren't in this build.")
            null
        }

        // Within one method the later site goes in first, so the earlier index still holds. A button
        // goes in at the label of the instruction it precedes; a label read's answer goes in after the
        // read, off any label there, so only the path from the read is filtered.
        val inserts = mutableListOf<Pair<Int, () -> Unit>>()
        val sites = edits + if (remix) remixes.map { Triple(mutable(it.method), it, CLOSEUP_REMIX_HOOK) } else emptyList()
        for ((method, site, hook) in sites) inserts += site.index to {
            method.addInstructionsAtControlFlowLabel(site.index, "invoke-static/range { v${site.register} .. v${site.register} }, $hook")
        }
        for ((rows, hook) in listOf(actions to CLOSEUP_ACTION_BAR_HOOK, visits to CLOSEUP_VISIT_SITE_HOOK)) {
            for (row in rows) for (constructor in row.constructors) {
                val method = mutable(constructor)
                val after = constructor.parentCall(classDefBy(row.type).superclass)!! + 1
                inserts += after to { method.addInstructions(after, "invoke-static { p0 }, $hook") }
            }
        }
        if (style != null) {
            val method = mutable(style.method)
            inserts += style.index to {
                method.addInstructionsAtControlFlowLabel(style.index, "invoke-static/range { v${style.register} .. v${style.register} }, $CLOSEUP_SAVE_BUTTON_HOOK")
            }
        }
        for (read in labels) {
            val method = mutable(read.method)
            inserts += read.index + 1 to {
                method.addInstructions(read.index + 1, """
                    invoke-static { v${read.register} }, $CLOSEUP_SEARCH_LABEL_HOOK
                    move-result v${read.register}
                """)
            }
        }
        for ((_, insert) in inserts.sortedByDescending { it.first }) insert()
        val prefix = """
            invoke-static { p0, p1 }, $CLOSEUP_VISIBILITY_HOOK
            move-result p1
        """
        for (view in views) {
            val own = view.methods.singleOrNull { it.name == "setVisibility" && it.parameters() == listOf("I") }
            if (own != null) own.addInstructions(0, prefix) else addOverride(view, "setVisibility", listOf("I"), prefix)
        }
        enableCapability("closeupButtons")
        if (labels.isNotEmpty()) enableCapability("closeupSearchLabel")
        if (remix) enableCapability("closeupRemix")
        if (actions.isNotEmpty()) enableCapability("closeupActionBar")
        if (visits.isNotEmpty()) enableCapability("closeupVisitSite")
        if (style != null) enableCapability("closeupSaveButton")
        enableStatus("hideCloseupButtons")
    }
}
