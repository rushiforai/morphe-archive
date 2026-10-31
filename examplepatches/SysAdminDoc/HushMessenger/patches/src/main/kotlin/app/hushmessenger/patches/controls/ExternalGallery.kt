package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val EXTERNAL_GALLERY = "external_gallery"
internal const val GALLERY_ACTIVITY = "app.hushmessenger.extension.GalleryActivity"
internal const val ACTIVATE_GALLERY = "Lcom/facebook/xapp/messaging/composer/gallery/event/ActivateGalleryEvent;"
internal const val EDIT_GALLERY_ITEM = "Lcom/facebook/xapp/messaging/composer/gallery/event/EditGalleryItemEvent;"
internal const val COMPOSER_EVENT = "Lcom/facebook/xapp/messaging/composer/event/ComposerEvent;"
internal const val ACTIVITY_RESULT_EVENT = "Lcom/facebook/xapp/messaging/composer/activity/event/ActivityResultEvent;"
private const val CHAT_GALLERY_CALL = "$SETTINGS->chatGallery()Landroid/os/Bundle;"
private const val MEDIA_RESULT_CALL = "$SETTINGS->externalMediaResult(IILandroid/content/Intent;)V"
private const val GALLERY_ITEMS_CALL = "$SETTINGS->galleryItems(Ljava/lang/Object;Landroid/content/Intent;)Z"
private const val PROVIDER_GET = "get()Ljava/lang/Object;"

/** A gallery event handler, its field holding the chat camera launcher's provider, and that provider's interface. */
internal data class GalleryHandler(val id: String, val provider: String, val providerType: String)

/**
 * How the chat's gallery button reaches the chat camera's launcher, read at discovery: the handlers, then the launcher
 * class that runs the start, the start, the chat's result reader, and the chat's handler for a photo from another app
 * with the result event's intent field it reads.
 */
internal data class GalleryRoute(val handlers: List<GalleryHandler>, val launcher: String, val start: String, val reader: String,
    val items: String, val itemsIntent: String)

/** Set by [findExternalGallery] and cleared once the controls are in. */
internal var galleryRoute: GalleryRoute? = null

private fun galleryChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the chat gallery button moved ($detail)")

internal fun Instruction.galleryMethod() = (this as? ReferenceInstruction)?.reference as? MethodReference
internal fun Instruction.galleryField() = (this as? ReferenceInstruction)?.reference as? FieldReference
internal fun Instruction.galleryType() = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type
private fun Method.galleryStrings() = implementation?.instructions
    ?.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }?.toSet().orEmpty()
private fun String.galleryPackage() = substringBeforeLast('/', "")
private fun dotted(type: String) = type.removePrefix("L").removeSuffix(";").replace('/', '.')

/** The registers an invoke passes, in order. */
private fun Instruction.galleryArguments(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}

/** Whether this writes [register], whole or as half of a wide pair. */
internal fun Instruction.galleryWrites(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val written = (this as? OneRegisterInstruction)?.registerA ?: return false
    return written == register || (opcode.setsWideRegister() && written + 1 == register)
}

/**
 * Every register this may read, erring toward more: the second register of each for anything wide, and the destination
 * too unless the instruction only writes it.
 */
private fun Instruction.galleryReads(): Set<Int> {
    // The enum constant's name. Opcode.name is the smali mnemonic ("add-int/2addr").
    val op = opcode.toString()
    val onlyWrites = opcode.setsRegister() && opcode != Opcode.CHECK_CAST && !op.endsWith("_2ADDR")
    val read = when (this) {
        is FiveRegisterInstruction, is RegisterRangeInstruction -> galleryArguments()
        is ThreeRegisterInstruction -> listOfNotNull(registerA.takeUnless { onlyWrites }, registerB, registerC)
        is TwoRegisterInstruction -> listOfNotNull(registerA.takeUnless { onlyWrites }, registerB)
        is OneRegisterInstruction -> listOfNotNull(registerA.takeUnless { onlyWrites })
        else -> emptyList()
    }
    val wide = listOf("WIDE", "LONG", "DOUBLE").any { it in op }
    return read.flatMap { if (wide) listOf(it, it + 1) else listOf(it) }.toSet()
}

internal val GALLERY_ENDS = setOf(Opcode.RETURN_VOID, Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT, Opcode.THROW)
internal val GALLERY_GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)

/** What can run right after instruction [i]: none after a return or throw, null after a switch, which isn't followed. */
private fun List<Instruction>.galleryNext(i: Int): List<Int>? {
    val instruction = this[i]
    return when {
        instruction.opcode in GALLERY_ENDS -> emptyList()
        instruction.opcode == Opcode.PACKED_SWITCH || instruction.opcode == Opcode.SPARSE_SWITCH -> null
        instruction is OffsetInstruction -> branchTarget(i).takeIf { it >= 0 }?.let { target ->
            if (instruction.opcode in GALLERY_GOTOS) listOf(target) else listOf(i + 1, target)
        }
        else -> listOf(i + 1)
    }
}

/** Every instruction the code can run from [start] on, or null when that takes a switch or runs off the end. */
private fun List<Instruction>.galleryReach(start: Int): Set<Int>? {
    val reach = mutableSetOf<Int>()
    val pending = ArrayDeque(listOf(start))
    while (pending.isNotEmpty()) {
        val i = pending.removeFirst()
        if (i !in indices) return null
        if (reach.add(i)) pending.addAll(galleryNext(i) ?: return null)
    }
    return reach
}

/** Whether every way on from [start] writes [register] before it reads it, or ends without touching it. */
private fun List<Instruction>.galleryFree(start: Int, register: Int): Boolean {
    val seen = mutableSetOf<Int>()
    val pending = ArrayDeque(listOf(start))
    while (pending.isNotEmpty()) {
        val i = pending.removeFirst()
        if (!seen.add(i)) continue
        if (register in this[i].galleryReads()) return false
        if (!this[i].galleryWrites(register)) pending.addAll(galleryNext(i)!!)
    }
    return true
}

private fun ClassDef.galleryImplements(iface: String, byType: Map<String, ClassDef>): Boolean =
    generateSequence(this) { cls -> cls.superclass?.let(byType::get) }.take(16).any { iface in it.interfaces }

/**
 * The one class whose objects run [start] as [launcher] declares it, or none. Messenger 583's launcher was abstract, with
 * one final subclass that ran this start and another that brought its own, and the hook calls the start virtually, so it
 * only handed its bundle to the first kind. 584's two subclasses both inherit the start, so the launcher itself is the class.
 * 585 is back to 583's shape.
 */
private fun List<ClassDef>.galleryTarget(launcher: ClassDef, start: Method, byType: Map<String, ClassDef>): ClassDef? {
    val signature = start.parameterTypes.map { it.toString() }
    fun ClassDef.declaresStart() = methods.any {
        it.name == start.name && it.returnType == start.returnType && it.parameterTypes.map { p -> p.toString() } == signature
    }
    fun ClassDef.lineage() = generateSequence(this) { cls -> cls.superclass?.let(byType::get) }.take(16).toList()
    val below = filter { cls -> cls.type != launcher.type && cls.lineage().any { it.type == launcher.type } }
    // 584's launcher is abstract with two final subclasses that both inherit its start, so every object of it runs this start.
    if (below.none { it.declaresStart() }) return launcher
    fun ClassDef.runsStart() = lineage().takeWhile { it.type != launcher.type }.none { it.declaresStart() }
    return (listOf(launcher) + below).filter { cls ->
        !AccessFlags.ABSTRACT.isSet(cls.accessFlags) && cls.runsStart() &&
            below.none { it.declaresStart() && it.lineage().any { up -> up.type == cls.type } }
    }.singleOrNull()
}

/**
 * Which of the chat composer's two kinds of event handler this signature is: the older one, handed the event and its
 * class name, or the composer plugin, handed the event to check its class. 584 has one of each, and a chat's gallery
 * button goes through the plugin.
 */
private fun Method.galleryHandlerKind(): String? {
    val params = parameterTypes.map { it.toString() }
    return when {
        params.size == 2 && params.last() == "Ljava/lang/String;" -> "by name"
        params.size == 4 && params.last() == COMPOSER_EVENT -> "plugin"
        else -> null
    }
}

/**
 * A chat composer event handler that opens Messenger's own gallery on ActivateGalleryEvent and Messenger's editor on
 * EditGalleryItemEvent, by the event's class name or by checking its class.
 */
internal fun Method.isGalleryHandler(): Boolean {
    if (AccessFlags.STATIC.isSet(accessFlags) || returnType != "V") return false
    val code = implementation?.instructions ?: return false
    val events = listOf(ACTIVATE_GALLERY, EDIT_GALLERY_ITEM)
    val handles = when (galleryHandlerKind()) {
        "by name" -> galleryStrings().let { strings -> events.all { dotted(it) in strings } }
        "plugin" -> events.all { event -> code.any { it.opcode == Opcode.INSTANCE_OF && it.galleryType() == event } }
        else -> false
    }
    return handles && code.count { it.opcode == Opcode.CHECK_CAST && it.galleryType() == ACTIVATE_GALLERY } == 1
}

/**
 * The handler's field the Edit branch reads the chat camera's launcher from, the same launcher the gallery button gets:
 *
 *     iget-object vProvider, p0, <handler>->field:<Provider>
 *     ...
 *     invoke-static {..., vEvent, vProvider}, <editor>(..., EditGalleryItemEvent, <Provider>)V
 *
 * Code between the two may branch, as the plugin's does on a cached value, but only the read leads in. 585 reads the
 * field into another register and `move-object`s it into the call's range, so up to four plain moves are followed.
 *
 * and in the editor, on its last parameter:
 *
 *     invoke-interface {pProvider}, <Provider>->get()Ljava/lang/Object;
 *     move-result-object vLauncher
 *     check-cast vLauncher, <launcher interface>
 *     invoke-interface {vLauncher, vExtras, vHost}, <launcher interface>-><start>(Landroid/os/Bundle;<Host>)Z
 */
private fun Method.galleryProvider(iface: String, start: Method, byType: Map<String, ClassDef>): FieldReference? {
    val code = implementation!!.instructions.toList()
    val edits = code.indices.filter { at ->
        code[at].opcode in setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE) &&
            code[at].galleryMethod()?.parameterTypes?.any { it.toString() == EDIT_GALLERY_ITEM } == true
    }
    val e = edits.singleOrNull() ?: return null
    val edit = code[e].galleryMethod()!!
    val providerType = edit.parameterTypes.lastOrNull()?.toString() ?: return null
    val provider = code[e].galleryArguments().lastOrNull() ?: return null
    var load = (e - 1 downTo 0).firstOrNull { code[it].galleryWrites(provider) } ?: return null
    // 585 reads the field into another register and moves it into the call's range, so plain moves are followed.
    repeat(4) {
        val move = code[load].takeIf { it.opcode in setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16) }
            as? TwoRegisterInstruction ?: return@repeat
        load = (load - 1 downTo 0).firstOrNull { code[it].galleryWrites(move.registerB) } ?: return null
    }
    val field = code[load].takeIf { it.opcode == Opcode.IGET_OBJECT }?.galleryField() ?: return null
    if (field.definingClass != definingClass || field.type != providerType) return null
    val inside = load + 1..e
    if (jumpTargets(branches = false).any { it in inside }) return null
    if (code.indices.any { it !in load until e && code[it] is OffsetInstruction && code.branchTarget(it) in inside }) return null
    byType[definingClass]?.fields?.singleOrNull { it.name == field.name && it.type == field.type && !AccessFlags.STATIC.isSet(it.accessFlags) }
        ?: return null
    val editor = byType[edit.definingClass]?.methods?.singleOrNull { it.hookId() == edit.toString() } ?: return null
    return field.takeIf {
        editor.startsFromProvider(providerType, "$iface->${start.name}(${start.parameterTypes.joinToString("")})Z")
    }
}

private fun Method.startsFromProvider(providerType: String, start: String): Boolean {
    val code = implementation?.instructions?.toList() ?: return false
    if (parameterTypes.lastOrNull()?.toString() != providerType) return false
    val provider = implementation!!.registerCount - 1
    if (code.any { it.galleryWrites(provider) }) return false
    val gets = code.indices.filter { at ->
        code[at].opcode == Opcode.INVOKE_INTERFACE && code[at].galleryArguments() == listOf(provider) &&
            code[at].galleryMethod()?.toString() == "$providerType->$PROVIDER_GET"
    }
    val g = gets.singleOrNull() ?: return false
    val launcher = (code.getOrNull(g + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT } as? OneRegisterInstruction)?.registerA
        ?: return false
    val cast = code.getOrNull(g + 2)
    if (cast?.opcode != Opcode.CHECK_CAST || (cast as OneRegisterInstruction).registerA != launcher ||
        cast.galleryType() != start.substringBefore("->")) return false
    for (at in g + 3 until code.size) {
        val instruction = code[at]
        if (instruction.opcode == Opcode.INVOKE_INTERFACE && instruction.galleryMethod()?.toString() == start)
            return instruction.galleryArguments().firstOrNull() == launcher
        if (instruction.galleryWrites(launcher) || instruction is OffsetInstruction) return false
    }
    return false
}

/** The p-number of this method's one parameter of [type], or null when it has none or several. */
internal fun Method.onlyParameter(type: String): Int? {
    val types = parameterTypes.map { it.toString() }
    if (types.count { it == type } != 1) return null
    return types.take(types.indexOf(type)).sumOf { if (it == "J" || it == "D") 2 else 1 } +
        if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
}

/**
 * The chat's handler for a photo or video picked in another app, and the result event's intent field it reads, or null.
 * It's static, handed the chat's thread and the result event, checks for [EXTERNAL_MEDIA_REQUEST], and opens Messenger's
 * editor with the intent's one item:
 *
 *     iget vRequest, pEvent, <event>->A00:I
 *     const/16 v0, 0x458
 *     ...
 *     iget-object vIntent, pEvent, <event>->A02:Landroid/content/Intent;
 */
internal fun Method.galleryItemsIntent(byType: Map<String, ClassDef>): FieldReference? {
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != "V" || onlyParameter(THREAD_KEY_TYPE) == null) return null
    val code = implementation?.instructions?.toList() ?: return null
    val event = parameterRegister(onlyParameter(ACTIVITY_RESULT_EVENT) ?: return null)
    if (code.none { (it as? NarrowLiteralInstruction)?.narrowLiteral == EXTERNAL_MEDIA_REQUEST } || code.any { it.galleryWrites(event) }) return null
    val intent = code.filter { it.opcode == Opcode.IGET_OBJECT && (it as TwoRegisterInstruction).registerB == event }
        .mapNotNull { it.galleryField() }.filter { it.definingClass == ACTIVITY_RESULT_EVENT && it.type == "Landroid/content/Intent;" }
        .distinctBy { it.toString() }.singleOrNull() ?: return null
    byType[ACTIVITY_RESULT_EVENT]?.fields?.singleOrNull { it.name == intent.name && it.type == intent.type && !AccessFlags.STATIC.isSet(it.accessFlags) }
        ?: return null
    return intent
}

/**
 * The chat's gallery event handlers, the chat camera launcher's start, the chat's result reader and its handler for a
 * photo from another app, or none. A gallery handler hands the launcher a marked bundle, and the start swaps that launch
 * for the phone's gallery app, so a pick comes back to the chat that asked under the request code Messenger reads a photo
 * from another app under. The reader takes the pick's type from the result, and a gallery app often sends none, so the
 * hook there fills it in first. The photo handler opens one item in Messenger's editor, so the hook there sends a pick of
 * several to the Send to sheet instead. That needs the chat camera's launcher exactly as the camera switch finds it, the
 * one way each handler's Edit branch reaches it, and both reachable from that handler. There's at most one handler of
 * each kind, and every one found must route, or a gallery button would still open Messenger's gallery with the switch on.
 */
internal fun findExternalGallery(classes: Iterable<ClassDef>): List<Method> {
    galleryRoute = null
    val all = classes.toList()
    val methods = all.flatMap { it.methods }
    val byType = all.associateBy { it.type }
    val readers = methods.filter { it.isComposerResult() }
    val reader = readers.singleOrNull() ?: return emptyList()
    if (AccessFlags.STATIC.isSet(reader.accessFlags) ||
        reader.implementation!!.instructions.none { (it as? NarrowLiteralInstruction)?.narrowLiteral == CHAT_CAMERA_REQUEST }) return emptyList()
    val (items, itemsIntent) = methods.mapNotNull { method -> method.galleryItemsIntent(byType)?.let { method to it } }.singleOrNull()
        ?: return emptyList()
    val factory = methods.filter { it.isChatCameraFactory() }.singleOrNull() ?: return emptyList()
    val launcher = factory.chatCameraLauncherType() ?: return emptyList()
    val launcherClass = byType[launcher] ?: return emptyList()
    if (!launcherClass.galleryImplements(factory.returnType, byType)) return emptyList()
    val start = launcherClass.methods.filter { it.isLauncherStart() }.singleOrNull() ?: return emptyList()
    // The hook has no host to hand the start, so it passes null, which only works while the start never reads it.
    if (start.implementation!!.instructions.any { start.implementation!!.registerCount - 1 in it.galleryReads() }) return emptyList()
    val target = all.galleryTarget(launcherClass, start, byType) ?: return emptyList()
    val handlers = methods.filter { it.isGalleryHandler() }
    if (handlers.isEmpty() || handlers.groupingBy { it.galleryHandlerKind() }.eachCount().values.any { it > 1 }) return emptyList()
    val routed = handlers.map { handler ->
        val provider = handler.galleryProvider(factory.returnType, start, byType) ?: return emptyList()
        val providerClass = byType[provider.type] ?: return emptyList()
        val home = handler.definingClass.galleryPackage()
        fun reachable(cls: ClassDef) = AccessFlags.PUBLIC.isSet(cls.accessFlags) || cls.type.galleryPackage() == home
        if (!AccessFlags.INTERFACE.isSet(providerClass.accessFlags) || !reachable(providerClass) || !reachable(launcherClass) ||
            !reachable(target) || AccessFlags.PRIVATE.isSet(start.accessFlags) ||
            (!AccessFlags.PUBLIC.isSet(start.accessFlags) && launcher.galleryPackage() != home)) return emptyList()
        GalleryHandler(handler.hookId(), provider.toString(), provider.type)
    }
    galleryRoute = GalleryRoute(routed.sortedBy { it.id }, target.type, start.hookId(), reader.hookId(), items.hookId(), itemsIntent.toString())
    return handlers + listOf(start, reader, items)
}

/**
 * The photo handler's thread and result event registers. The hook reads the event's intent into v0 before anything in
 * the handler runs, so it needs one local, and both parameters where a plain iget and invoke reach them.
 */
private fun Method.galleryItemsRegisters(): Pair<Int, Int> {
    val thread = onlyParameter(THREAD_KEY_TYPE)?.let(::parameterRegister)
    val event = onlyParameter(ACTIVITY_RESULT_EVENT)?.let(::parameterRegister)
    if (thread == null || event == null || parameterRegister(0) < 1 || maxOf(thread, event) > 15)
        galleryChanged("the photo result handler's registers")
    return thread to event
}

/** Where a handler's gallery branch starts, and three locals that branch writes before it reads them. */
internal class GallerySite(val at: Int, val extras: Int, val launcher: Int, val started: Int)

/**
 * Right after the handler casts its ActivateGalleryEvent. Every way on from there, through the branch's own branches to
 * its returns and throws, stays outside any try, so a register each of them writes before reading is free for the hook
 * on its way in.
 */
internal fun Method.gallerySite(): GallerySite {
    val code = implementation?.instructions?.toList() ?: galleryChanged("no code")
    val casts = code.indices.filter { code[it].opcode == Opcode.CHECK_CAST && code[it].galleryType() == ACTIVATE_GALLERY }
    val at = (casts.singleOrNull() ?: galleryChanged("${casts.size} gallery events")) + 1
    if (at in jumpTargets()) galleryChanged("a branch lands on the gallery branch")
    val reach = code.galleryReach(at) ?: galleryChanged("a switch or no return in the gallery branch")
    // A catch handler could read what the hook writes.
    val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
    if (implementation!!.tryBlocks.any { block -> reach.any { addresses[it] - block.startCodeAddress in 0 until block.codeUnitCount } })
        galleryChanged("the gallery branch is inside a try")
    val self = parameterRegister(0)
    if (code.any { it.galleryWrites(self) }) galleryChanged("the handler's own register is reused")
    // The hook's plain invokes and branches take registers up to v15, and only locals sit below the parameters.
    val free = (0 until minOf(16, self)).filter { code.galleryFree(at, it) }
    if (free.size < 3) galleryChanged("no free registers")
    return GallerySite(at, free[0], free[1], free[2])
}

internal fun MutableMethod.validateExternalGallery(): Int {
    val route = galleryRoute ?: galleryChanged("no route")
    return when (hookId()) {
        // The camera switch hooks the same start the same way, so whichever comes second leaves it as it is.
        route.start -> if (chatStartRouted()) -1 else chatCameraLaunchSite()
        in route.handlers.map { it.id } -> gallerySite().at
        // The result reader's own parameters, before anything in it runs.
        route.reader -> if (!AccessFlags.STATIC.isSet(accessFlags) && implementation != null) 0 else galleryChanged("the result reader")
        route.items -> galleryItemsRegisters().let { 0 }
        else -> throw PatchException("Messenger controls: unexpected gallery hook ${hookId()}")
    }
}

/**
 * With the switch on, the gallery button hands the chat camera's launcher a marked bundle, which its start turns into a
 * pick in the phone's gallery app. Off, Pause, safe mode, no gallery app, or a launcher that didn't start get Messenger's
 * own gallery as before.
 */
internal fun MutableMethod.injectExternalGallery() {
    val at = validateExternalGallery()
    val route = galleryRoute!!
    if (hookId() == route.start) {
        if (at >= 0) injectChatCameraStart(at)
        return
    }
    if (hookId() == route.reader) {
        addInstructions(at, "invoke-static/range {p1 .. p3}, $MEDIA_RESULT_CALL")
        return
    }
    if (hookId() == route.items) {
        val (thread, event) = galleryItemsRegisters()
        addInstructionsWithLabels(at, """
            iget-object v0, v$event, ${route.itemsIntent}
            invoke-static {v$thread, v0}, $GALLERY_ITEMS_CALL
            move-result v0
            if-eqz v0, :stock_items
            return-void
        """.trimIndent(), ExternalLabel("stock_items", getInstruction(at)))
        return
    }
    val handler = route.handlers.single { it.id == hookId() }
    val site = gallerySite()
    val extras = "v${site.extras}"
    val launcher = "v${site.launcher}"
    val started = "v${site.started}"
    addInstructionsWithLabels(at, """
        invoke-static {}, $CHAT_GALLERY_CALL
        move-result-object $extras
        if-eqz $extras, :stock_gallery
        move-object/from16 $launcher, p0
        iget-object $launcher, $launcher, ${handler.provider}
        if-eqz $launcher, :stock_gallery
        invoke-interface {$launcher}, ${handler.providerType}->$PROVIDER_GET
        move-result-object $launcher
        instance-of $started, $launcher, ${route.launcher}
        if-eqz $started, :stock_gallery
        check-cast $launcher, ${route.launcher}
        const/4 $started, 0x0
        invoke-virtual {$launcher, $extras, $started}, ${route.start}
        move-result $started
        if-eqz $started, :stock_gallery
        return-void
    """.trimIndent(), ExternalLabel("stock_gallery", getInstruction(at)))
}

/**
 * Declares the pick screen, since Messenger's launcher only starts Messenger's own screens, and what it looks for in
 * other apps: Android hides them from Messenger unless its manifest names a photo or video pick.
 */
internal fun Document.addExternalGallery() {
    val root = documentElement ?: throw PatchException("Messenger controls: the manifest has no root")
    val application = getElementsByTagName("application").item(0) as? Element
        ?: throw PatchException("Messenger controls: expected one application")
    application.appendChild(createElement("activity").also { screen ->
        listOf("name" to GALLERY_ACTIVITY, "exported" to "false", "excludeFromRecents" to "true",
            "theme" to "@android:style/Theme.Translucent.NoTitleBar",
            "configChanges" to "orientation|screenSize|smallestScreenSize|screenLayout|keyboardHidden")
            .forEach { (name, value) -> screen.setAttribute("android:$name", value) }
    })
    val children = root.childNodes
    val queries = (0 until children.length).map { children.item(it) }.filterIsInstance<Element>().firstOrNull { it.tagName == "queries" }
        ?: createElement("queries").also { root.appendChild(it) }
    for (type in listOf("image/*", "video/*")) {
        val intent = createElement("intent")
        intent.appendChild(createElement("action").also { it.setAttribute("android:name", "android.intent.action.PICK") })
        intent.appendChild(createElement("data").also { it.setAttribute("android:mimeType", type) })
        queries.appendChild(intent)
    }
}
