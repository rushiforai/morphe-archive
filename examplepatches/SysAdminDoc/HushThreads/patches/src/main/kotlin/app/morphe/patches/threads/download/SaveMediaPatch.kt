/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Found by reading 450, 449 and 448 (2026-10-06).
 */
package app.morphe.patches.threads.download

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.feed.Reaching
import app.morphe.patches.threads.feed.reaching
import app.morphe.patches.threads.feed.writes
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.requireStatusMethod
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.extension.writeStub
import app.morphe.patches.threads.misc.settings.implementFunction0
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.patches.threads.misc.theme.holdsNote
import app.morphe.util.ControlFlow
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "Save photos and videos"

internal const val SAVE_MEDIA_ROW = "$EXTENSION_PACKAGE/download/SaveMediaRow;"
internal const val SAVE_MEDIA_CLICK = "$EXTENSION_PACKAGE/download/SaveMediaRow\$Click;"
internal const val ADD_SAVE_ROW = "$SAVE_MEDIA_ROW->add(Ljava/lang/Object;Ljava/lang/Object;)V"

/** Compose's note in the lambda that draws the rows of a post's menu. It names the source file, so it survives Redex. */
internal const val MENU_NOTE = "com.instagram.barcelona.feed.post.actionmenu.PostActionMenuSheet.<anonymous> (PostActionMenuSheet.kt:"

/** What the menu's Copy link item says it is. A Kotlin data object's toString keeps its source name. */
internal const val COPY_LINK = "CopyLinkAction"

private const val ACTIVITY = "Landroid/app/Activity;"
private const val OBJECT = "Ljava/lang/Object;"
private const val STRING = "Ljava/lang/String;"

/**
 * Where the Save row goes and what draws it, all read off the menu's Copy link row: the menu
 * lambda, the index of its Copy link row call and that call as smali; the composer's type; the row
 * and the calls that build its arguments, with the literals Copy link gives them; the menu's post,
 * activity and controller fields; and the controller method Copy link's click closes the menu with.
 */
internal data class SaveRowSite(
    val menu: Method,
    val rowAt: Int,
    val rowCall: String,
    val composerType: String,
    val row: MethodReference,
    val base: FieldReference,
    val role: MethodReference,
    val roleArgument: Int,
    val clickModifier: MethodReference,
    val enabled: Int,
    val style: MethodReference,
    val icon: MethodReference,
    val iconArguments: List<Int>,
    val media: FieldReference,
    val activity: FieldReference,
    val controller: FieldReference,
    val dismiss: MethodReference,
)

/**
 * Save in a post's menu, just below Copy link. Threads draws it with the row and the calls it
 * draws Copy link with, so it looks and reads to TalkBack like its neighbors. A tap hands the
 * menu's post to the extension, which saves its photo, video or every page of a carousel to the
 * gallery, and closes the menu the way Copy link does.
 */
@Suppress("unused")
val saveMediaPatch = bytecodePatch(
    name = PATCH,
    description = "Adds Save to a post's menu, below Copy link. It saves the photo or video to your gallery, every " +
        "page of a carousel too. Good for keeping posts you like. On by default. Turn it off in " +
        "HushThreads settings > Downloads.",
    default = true,
) {
    category("Downloads")
    dependsOn(settingsPatch)
    dependsOn(threadsExtensionPatch)
    compatibleWith(*AppCompatibilities.threads())

    execute {
        requireStatusMethod("saveMedia")
        val site = saveRowSite()
        val writeMediaBridges = mediaBridges(PATCH)
        val writeImageBridges = imageBridges(PATCH)

        implementFunction0(SAVE_MEDIA_CLICK, PATCH)
        writeSaveRowStubs(site)
        writeMediaBridges()
        writeImageBridges()
        // Threads may share the row call with other items: 450 jumps to Copy link's from another
        // item's case. So Copy link's own path gets a copy of the call with the hook after it and
        // then goes where the shared call goes, and every other item still draws through the
        // original, which a branch to it reaches as before.
        val menu = mutableClassDefBy(site.menu.definingClass).findMutableMethodOf(site.menu)
        val after = menu.getInstruction(site.rowAt + 1)
        menu.addInstructionsWithLabels(
            site.rowAt,
            """
                ${site.rowCall}
                invoke-static/range { p0 .. p1 }, $ADD_SAVE_ROW
                goto :copy_link_drawn
            """,
            ExternalLabel("copy_link_drawn", after),
        )
        enableStatus("saveMedia")
    }
}

/**
 * Writes the extension's stubs: the row, built as Copy link's is but with the extension's click,
 * label and icon and without Copy link's impression logging; and readers of the menu's post and
 * activity, and the call that closes it.
 */
internal fun BytecodePatchContext.writeSaveRowStubs(site: SaveRowSite) {
    // The icon call takes the composer, the icon's id and Copy link's other literals, in v3 up.
    val iconEnd = 3 + 1 + site.iconArguments.size
    val iconLiterals = site.iconArguments.withIndex().joinToString("\n") { (index, value) -> "const v${5 + index}, $value" }
    writeStub(SAVE_MEDIA_ROW, "showRow", maxOf(6, iconEnd + 1) + 4, """
        move-object/from16 v0, p0
        check-cast v0, ${site.composerType}
        sget-object v1, ${site.base.text()}
        const v2, ${site.roleArgument}
        invoke-static/range { v2 .. v2 }, ${site.role.signature()}
        move-result-object v2
        move-object/from16 v3, p1
        const/4 v4, 0x0
        const v5, ${site.enabled}
        invoke-static/range { v1 .. v5 }, ${site.clickModifier.signature()}
        move-result-object v1
        invoke-static/range { v0 .. v0 }, ${site.style.signature()}
        move-result-object v2
        move-object v3, v0
        move/from16 v4, p3
        $iconLiterals
        invoke-static/range { v3 .. v$iconEnd }, ${site.icon.signature()}
        move-result-object v3
        move-object/from16 v4, p2
        invoke-static/range { v0 .. v4 }, ${site.row.signature()}
        return-void
    """)
    val menu = site.menu.definingClass
    writeStub(SAVE_MEDIA_ROW, "media", 1, """
        check-cast p0, $menu
        iget-object p0, p0, ${site.media.text()}
        return-object p0
    """)
    writeStub(SAVE_MEDIA_ROW, "activity", 1, """
        check-cast p0, $menu
        iget-object p0, p0, ${site.activity.text()}
        return-object p0
    """)
    writeStub(SAVE_MEDIA_ROW, "dismiss", 1, """
        check-cast p0, $menu
        iget-object p0, p0, ${site.controller.text()}
        invoke-virtual { p0 }, ${site.dismiss.signature()}
        return-void
    """)
}

/**
 * Reads [SaveRowSite] and refuses a build where any of it differs from what was read on 450, 449
 * and 448: one menu lambda that checks for Copy link once, with one row call in that case, taking
 * (composer, modifier, style, icon, String), which Copy link's own path falls into from a case
 * nothing else branches into; a composer that is the lambda's second parameter, cast; a modifier built by a click call taking (modifier, role,
 * Object, String, boolean) on a static base modifier, a literal role, a new click, no click label
 * and a literal; a style built from the composer alone; an icon built from the composer, a literal
 * drawable and other literals; a click whose case for Copy link casts its Object field to the
 * controller and ends on one no-argument call to it; and one field each for the post, the activity
 * and the controller on the menu lambda. Everything the stubs call has to be public.
 */
internal fun BytecodePatchContext.saveRowSite(): SaveRowSite {
    val copyLink = classDefByStrings(COPY_LINK, StringComparisonType.EQUALS)
        .filter { classDef ->
            classDef.methods.any {
                it.name == "toString" && it.parameterTypes.isEmpty() && it.returnType == STRING &&
                    it.body().any { i -> i.getReference<StringReference>()?.string == COPY_LINK }
            }
        }
        .map { it.type }.distinct()
        .singleOrPatchException("$PATCH: the post menu's Copy link item, the class whose toString says \"$COPY_LINK\"")
    val menu = classDefByStrings(MENU_NOTE, StringComparisonType.STARTS_WITH).flatMap { it.methods }
        .filter { it.holdsNote(MENU_NOTE) && it.body().any { i -> i.isInstanceOf(copyLink) } }
        .distinctBy { "${it.definingClass}->${it.name}${it.parameterTypes.joinToString("")}${it.returnType}" }
        .singleOrPatchException("$PATCH: the post menu, the lambda holding \"$MENU_NOTE\" that checks for Copy link")
    val body = menu.body()
    val address = addresses(body)

    val checks = body.indices.filter { body[it].isInstanceOf(copyLink) }
    val checkAt = checks.singleOrNull() ?: throw PatchException("$PATCH: the post menu checks for Copy link ${checks.size} times, not once")
    val skip = body.getOrNull(checkAt + 1)
    if (skip?.opcode != Opcode.IF_EQZ || (skip as OneRegisterInstruction).registerA != (body[checkAt] as TwoRegisterInstruction).registerA) {
        throw PatchException("$PATCH: the post menu doesn't skip its Copy link case when the item isn't Copy link")
    }
    val skipAt = indexAt(address, address[checkAt + 1] + (skip as OffsetInstruction).codeOffset)
    val case = checkAt + 2 until skipAt
    if (case.isEmpty()) throw PatchException("$PATCH: the post menu's Copy link case is empty")

    val rows = case.filter { at ->
        val call = body[at].method()
        call != null && body[at].isStaticCall() && call.returnType == "V" && call.parameterTypes.size == 5 &&
            call.parameterTypes[4].toString() == STRING
    }
    val rowAt = rows.singleOrNull()
        ?: throw PatchException("$PATCH: the post menu's Copy link case makes ${rows.size} row calls, not one")
    val row = body[rowAt].method()!!
    val rowParams = row.parameterTypes.map { it.toString() }
    val composerType = rowParams[0]
    val rowArgs = body[rowAt].arguments()

    // The copy of the row call goes in just before it, where only Copy link's own path runs: that
    // path falls into the call from the instruction before it, and nothing outside the case
    // branches into the case. Other items may still branch to the call itself.
    val flow = ControlFlow.of(menu)
    val inside = checkAt + 2 until rowAt
    if (rowAt - 1 !in inside || rowAt + 1 >= body.size || rowAt !in flow.normal[rowAt - 1] ||
        body.indices.any { from -> from !in checkAt + 1 until rowAt && flow.normal[from].any { it in inside } } ||
        flow.exceptional.any { targets -> targets.any { it in inside } }
    ) throw PatchException("$PATCH: the post menu branches into its Copy link case")
    val rowCall = when (val call = body[rowAt]) {
        is RegisterRangeInstruction ->
            "invoke-static/range { v${call.startRegister} .. v${call.startRegister + call.registerCount - 1} }, ${row.signature()}"
        else -> "invoke-static { ${rowArgs.joinToString { "v$it" }} }, ${row.signature()}"
    }
    // What each of the row's arguments holds on Copy link's own path.
    fun onCopyLinkPath(register: Int): Reaching =
        if (body[rowAt - 1].writes(register)) Reaching(setOf(rowAt - 1), false) else menu.reaching(rowAt - 1, setOf(register))

    // The hook passes the lambda and its second parameter, so neither may change, and the row's
    // composer has to be that parameter, cast.
    val implementation = menu.implementation!!
    val p0 = implementation.registerCount - 1 - menu.parameterTypes.sumOf { width(it.toString()) }
    if (AccessFlags.STATIC.isSet(menu.accessFlags) || menu.parameterTypes.firstOrNull()?.toString()?.let { it.startsWith("L") || it.startsWith("[") } != true) {
        throw PatchException("$PATCH: the post menu isn't a lambda taking its composer first")
    }
    if (body.any { it.writes(p0) || it.writes(p0 + 1) }) throw PatchException("$PATCH: the post menu overwrites its own parameters")
    // What reaches the row's composer, followed back through copies and the cast. 450 reuses the
    // register once the menu is drawn, so writes that never reach the row don't count.
    val composer = rowArgs[0]
    val followed = mutableSetOf<Int>()
    fun fromParameter(register: Int, reaching: Reaching): Boolean {
        if (register == p0 + 1) return true
        if (reaching.fromEntry || reaching.writes.isEmpty()) return false
        return reaching.writes.all { write ->
            val instruction = body[write]
            when {
                !followed.add(write) -> true
                instruction.opcode in OBJECT_MOVES -> (instruction as TwoRegisterInstruction).registerB.let {
                    fromParameter(it, menu.reaching(write, setOf(it)))
                }
                instruction.opcode == Opcode.CHECK_CAST && instruction.getReference<TypeReference>()?.type == composerType ->
                    fromParameter(register, menu.reaching(write, setOf(register)))
                else -> false
            }
        }
    }
    if (!fromParameter(composer, onCopyLinkPath(composer))) {
        throw PatchException("$PATCH: the post menu's Copy link row isn't passed the menu's composer parameter")
    }

    // The modifier: Copy link's click call, perhaps under more modifiers of the same type.
    var producer = menu.producer(onCopyLinkPath(rowArgs[1]), "Copy link's modifier")
    var hops = 0
    while (!producer.second.isClickModifier(rowParams[1])) {
        val params = producer.second.parameterTypes.map { it.toString() }
        if (++hops > 3 || params.firstOrNull() != rowParams[1] || producer.second.returnType != rowParams[1]) {
            throw PatchException("$PATCH: Copy link's modifier isn't built by a click call: ${producer.second.signature()}")
        }
        producer = menu.producer(menu.reaching(producer.first, setOf(body[producer.first].arguments()[0])), "Copy link's modifier")
    }
    val (clickAt, clickModifier) = producer
    val clickArgs = body[clickAt].arguments()
    val baseWrite = menu.reaching(clickAt, setOf(clickArgs[0])).let { if (it.fromEntry) null else it.writes.singleOrNull() }
    val base = baseWrite?.takeIf { body[it].opcode == Opcode.SGET_OBJECT }?.let { body[it].getReference<FieldReference>() }
        ?: throw PatchException("$PATCH: Copy link's modifier isn't built on a static base modifier")
    val (roleAt, role) = menu.producer(menu.reaching(clickAt, setOf(clickArgs[1])), "Copy link's role")
    if (role.parameterTypes.map { it.toString() } != listOf("I") || role.returnType != clickModifier.parameterTypes[1].toString()) {
        throw PatchException("$PATCH: Copy link's role isn't built from an int: ${role.signature()}")
    }
    val roleArgument = menu.literalAt(roleAt, body[roleAt].arguments()[0], "role")
    if (menu.literalAt(clickAt, clickArgs[3], "click label") != 0) throw PatchException("$PATCH: Copy link's click has a label")
    val enabled = menu.literalAt(clickAt, clickArgs[4], "enabled flag")

    val (styleAt, style) = menu.producer(onCopyLinkPath(rowArgs[2]), "Copy link's style")
    if (style.parameterTypes.map { it.toString() } != listOf(composerType) || style.returnType != rowParams[2]) {
        throw PatchException("$PATCH: Copy link's style isn't built from the composer alone: ${style.signature()}")
    }
    if (body[styleAt].arguments()[0] != composer) throw PatchException("$PATCH: Copy link's style isn't built from the row's composer")
    val (iconAt, icon) = menu.producer(onCopyLinkPath(rowArgs[3]), "Copy link's icon")
    val iconParams = icon.parameterTypes.map { it.toString() }
    if (iconParams.size < 2 || iconParams[0] != composerType || iconParams[1] != "I" || iconParams.drop(2).any { it != "I" && it != "Z" }) {
        throw PatchException("$PATCH: Copy link's icon isn't built from the composer, a drawable and literals: ${icon.signature()}")
    }
    val iconArgs = body[iconAt].arguments()
    if (iconArgs[0] != composer) throw PatchException("$PATCH: Copy link's icon isn't built from the row's composer")
    if (menu.literalAt(iconAt, iconArgs[1], "icon") ushr 24 != 0x7f) throw PatchException("$PATCH: Copy link's icon isn't one of Threads' resources")
    val iconArguments = iconArgs.drop(2).map { menu.literalAt(iconAt, it, "icon flag") }

    // Copy link's click, which names the controller and how the menu closes.
    val newAt = menu.reaching(clickAt, setOf(clickArgs[2])).writes.filter { body[it].opcode == Opcode.NEW_INSTANCE }
        .singleOrNull() ?: throw PatchException("$PATCH: Copy link's click isn't one new object")
    val click = body[newAt].getReference<TypeReference>()!!.type
    val constructAt = (newAt + 1 until skipAt).firstOrNull { at ->
        body[at].opcode.let { it == Opcode.INVOKE_DIRECT || it == Opcode.INVOKE_DIRECT_RANGE } &&
            body[at].method()?.let { it.definingClass == click && it.name == "<init>" } == true
    } ?: throw PatchException("$PATCH: Copy link's click is never constructed")
    val constructor = body[constructAt].method()!!
    val constructorParams = constructor.parameterTypes.map { it.toString() }
    val clickClass = classDefByOrNull(click) ?: throw PatchException("$PATCH: Threads carries no $click")
    val intFields = clickClass.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == "I" }
    val objectFields = clickClass.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == OBJECT }
    if (constructorParams.count { it == "I" } != 1 || intFields.size != 1 || objectFields.size != 1 || constructorParams.firstOrNull() != OBJECT) {
        throw PatchException("$PATCH: Copy link's click isn't a merged lambda over one object: ${constructor.signature()}")
    }
    val which = menu.literalAt(constructAt, body[constructAt].arguments()[1 + constructorParams.indexOf("I")], "click case")
    val (controllerType, dismiss) = clickCase(click, intFields.single().name, objectFields.single().name, which)

    val fields = classDefBy(menu.definingClass).fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }
    fun field(type: String, what: String): FieldReference = fields.filter { it.type == type }
        .singleOrPatchException("$PATCH: the post menu's $what, its field of type $type")
    val site = SaveRowSite(
        menu, rowAt, rowCall, composerType, row, base, role, roleArgument, clickModifier, enabled, style, icon, iconArguments,
        field(MEDIA, "post"), field(ACTIVITY, "activity"), field(controllerType, "controller"), dismiss,
    )
    listOf(site.row, site.role, site.clickModifier, site.style, site.icon, site.dismiss).forEach { requirePublic(it) }
    listOf(site.base, site.media, site.activity, site.controller).forEach { requirePublic(it) }
    return site
}

/**
 * The controller type the click's case [which] casts its Object field [objectField] to, and the
 * one no-argument call on it that's followed by a goto: Copy link's click closes the menu with it
 * once it has copied the link. The case is found by the click's int field [intField], which the
 * merged lambda compares with each case's literal, or switches on.
 */
private fun BytecodePatchContext.clickCase(click: String, intField: String, objectField: String, which: Int): Pair<String, MethodReference> {
    val invoke = classDefBy(click).methods.singleOrNull {
        it.name == "invoke" && it.parameterTypes.isEmpty() && it.returnType == OBJECT && it.implementation != null
    } ?: throw PatchException("$PATCH: Copy link's click $click has no invoke()")
    val body = invoke.body()
    val address = addresses(body)
    val readAt = body.indexOfFirst { it.opcode == Opcode.IGET && it.getReference<FieldReference>()?.let { f -> f.definingClass == click && f.name == intField } == true }
    if (readAt < 0) throw PatchException("$PATCH: Copy link's click never reads its case")
    val selector = (body[readAt] as TwoRegisterInstruction).registerA
    val literals = HashMap<Int, Int>()
    val cases = LinkedHashMap<Int, Int>()
    fun target(at: Int) = indexAt(address, address[at] + (body[at] as OffsetInstruction).codeOffset)
    var at = readAt + 1
    dispatch@ while (at < body.size) {
        val instruction = body[at]
        when {
            instruction.opcode == Opcode.IF_EQZ && (instruction as OneRegisterInstruction).registerA == selector ->
                cases.putIfAbsent(0, target(at))
            instruction.opcode == Opcode.IF_EQ && (instruction as TwoRegisterInstruction).let { it.registerA == selector || it.registerB == selector } -> {
                val other = if (instruction.registerA == selector) instruction.registerB else instruction.registerA
                cases.putIfAbsent(literals[other] ?: break@dispatch, target(at))
            }
            (instruction.opcode == Opcode.PACKED_SWITCH || instruction.opcode == Opcode.SPARSE_SWITCH) &&
                (instruction as OneRegisterInstruction).registerA == selector -> {
                val payload = body[target(at)] as SwitchPayload
                payload.switchElements.forEach { cases.putIfAbsent(it.key, indexAt(address, address[at] + it.offset)) }
                break@dispatch
            }
            instruction is OffsetInstruction || instruction.opcode in EXITS || instruction.writes(selector) -> break@dispatch
            instruction.opcode.setsRegister() -> {
                val destination = (instruction as? OneRegisterInstruction)?.registerA ?: break@dispatch
                literals.remove(destination)
                instruction.literal()?.let { literals[destination] = it }
            }
        }
        at++
    }
    val start = cases[which] ?: throw PatchException("$PATCH: Copy link's click has no case $which")
    val end = cases.values.filter { it > start }.minOrNull() ?: body.size
    val region = start until end
    val loadAt = region.firstOrNull { body[it].opcode == Opcode.IGET_OBJECT && body[it].getReference<FieldReference>()?.let { f -> f.definingClass == click && f.name == objectField } == true }
    val cast = loadAt?.let { body.getOrNull(it + 1) }
        ?.takeIf { it.opcode == Opcode.CHECK_CAST && (it as OneRegisterInstruction).registerA == (body[loadAt] as TwoRegisterInstruction).registerA }
        ?: throw PatchException("$PATCH: Copy link's click doesn't cast its object to a controller")
    val controller = cast.getReference<TypeReference>()!!.type
    val dismiss = region.filter { index ->
        body[index].opcode.let { it == Opcode.INVOKE_VIRTUAL || it == Opcode.INVOKE_VIRTUAL_RANGE } &&
            body[index].method()?.let { it.definingClass == controller && it.parameterTypes.isEmpty() && it.returnType == "V" } == true &&
            body.getOrNull(index + 1)?.opcode in GOTOS
    }.map { body[it].method()!! }.distinctBy { it.signature() }
        .singleOrPatchException("$PATCH: the call Copy link's click closes the menu with, a no-argument call on $controller before a goto")
    return controller to dismiss
}

/** The static call whose answer is the one write that [reaching] finds, and its index. */
private fun Method.producer(reaching: Reaching, what: String): Pair<Int, MethodReference> {
    val write = reaching.writes.singleOrNull()?.takeIf { !reaching.fromEntry && it > 0 }
    val body = body()
    val callAt = write?.takeIf { body[it].opcode == Opcode.MOVE_RESULT_OBJECT }?.minus(1)
    val call = callAt?.let { body[it] }?.takeIf { it.isStaticCall() }?.method()
        ?: throw PatchException("$PATCH: $what isn't the answer of one static call")
    return callAt to call
}

/** The literal [register] holds at [at] on every path there. */
private fun Method.literalAt(at: Int, register: Int, what: String): Int {
    val reaching = reaching(at, setOf(register))
    val body = body()
    val values = reaching.writes.map { body[it].literal() }.distinct()
    return values.singleOrNull()?.takeIf { !reaching.fromEntry }
        ?: throw PatchException("$PATCH: Copy link's $what isn't one literal")
}

/** Refuses unless [method] is declared public on a public class, since the extension calls it from outside. */
private fun BytecodePatchContext.requirePublic(method: MethodReference) {
    val classDef = classDefByOrNull(method.definingClass)
    val declared = classDef?.methods?.singleOrNull { it.signature() == method.signature() }
    if (classDef == null || declared == null || !AccessFlags.PUBLIC.isSet(classDef.accessFlags) || !AccessFlags.PUBLIC.isSet(declared.accessFlags)) {
        throw PatchException("$PATCH: ${method.signature()} isn't public")
    }
}

/** The same for [field]. */
private fun BytecodePatchContext.requirePublic(field: FieldReference) {
    val classDef = classDefByOrNull(field.definingClass)
    val declared = classDef?.fields?.singleOrNull { it.text() == field.text() }
    if (classDef == null || declared == null || !AccessFlags.PUBLIC.isSet(classDef.accessFlags) || !AccessFlags.PUBLIC.isSet(declared.accessFlags)) {
        throw PatchException("$PATCH: ${field.text()} isn't public")
    }
}

private fun MethodReference.isClickModifier(modifier: String): Boolean =
    returnType == modifier && parameterTypes.map { it.toString() }.let {
        it.size == 5 && it[0] == modifier && it[2] == OBJECT && it[3] == STRING && it[4] == "Z"
    }

private val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)

private val OBJECT_MOVES = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)

private val EXITS = setOf(Opcode.RETURN_VOID, Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT, Opcode.THROW)

private fun width(type: String) = if (type == "J" || type == "D") 2 else 1

private fun Instruction.isInstanceOf(type: String) = opcode == Opcode.INSTANCE_OF && getReference<TypeReference>()?.type == type

private fun Instruction.isStaticCall() = opcode == Opcode.INVOKE_STATIC || opcode == Opcode.INVOKE_STATIC_RANGE

/** The registers a call passes, one per parameter word. */
private fun Instruction.arguments(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> throw PatchException("$PATCH: $opcode passes no registers")
}

private fun Instruction.literal(): Int? = when (opcode) {
    Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16 -> (this as NarrowLiteralInstruction).narrowLiteral
    else -> null
}

private fun Instruction.method(): MethodReference? = getReference<MethodReference>()

private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun addresses(body: List<Instruction>): IntArray {
    var address = 0
    return IntArray(body.size) { i -> address.also { address += body[i].codeUnits } }
}

private fun indexAt(address: IntArray, target: Int): Int = address.indexOfFirst { it == target }
    .takeIf { it >= 0 } ?: throw PatchException("$PATCH: a branch lands between instructions")

private fun MethodReference.signature(): String = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

private fun FieldReference.text(): String = "$definingClass->$name:$type"
