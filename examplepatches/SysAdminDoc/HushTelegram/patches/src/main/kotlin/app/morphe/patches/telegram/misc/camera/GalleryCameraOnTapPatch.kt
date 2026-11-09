/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.camera

import app.morphe.util.names.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.call
import app.morphe.util.namedRegisters
import app.morphe.util.one
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origSuperclass
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy

private const val PATCH = "Gallery camera on tap"
internal const val PHOTO_LAYOUT = "Lorg/telegram/ui/Components/ChatAttachAlertPhotoLayout;"
internal const val GALLERY_CAMERA = "$EXTENSION_PACKAGE/misc/GalleryCamera;"
private const val SHARED_CONFIG = "Lorg/telegram/messenger/SharedConfig;"
private const val CAMERA_CONTROLLER = "Lorg/telegram/messenger/camera/CameraController;"
private const val CAMERA_VIEW = "Lorg/telegram/messenger/camera/CameraView;"
private const val ACTIVITY = "Landroid/app/Activity;"
private const val CONTEXT = "Landroid/content/Context;"
private const val CAMERA_PERMISSION = "android.permission.CAMERA"
private const val OBJECT = "Ljava/lang/Object;"

@Suppress("unused")
val galleryCameraOnTapPatch = bytecodePatch(
    name = PATCH,
    description = "Keeps the attachment gallery from starting the camera or asking for camera access when it opens. The" +
        " camera starts when you tap its tile. Starts off. Turn it on in HushTelegram settings > Privacy.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireStatusMethod("galleryCameraOnTap")
        // Every site is found and checked before the first edit. The gallery needs all of them:
        // a gate without the tap would leave the camera tile doing nothing.
        val sites = resolveGalleryCameraSites()
        sites.apply()
        enableStatus("galleryCameraOnTap")
    }
}

/**
 * The gallery's camera paths in ChatAttachAlertPhotoLayout. [check] is checkCamera(Z), which asks
 * for the camera permission or starts CameraController; [show] builds the live camera tile; [open]
 * opens it full screen; [tap] is the camera tile's in-app branch; [asks] are the user's own
 * permission requests from the tile and the camera button; [menuShow] is the attach menu's show(),
 * which runs on every open whichever tab the menu opens on, and [menuGallery] its gallery field.
 */
internal class GalleryCameraSites(
    val check: MutableMethod,
    val checkExit: Int,
    val show: MutableMethod,
    val showExit: Int,
    val open: MethodReference,
    val cameraView: FieldReference,
    val tap: MutableMethod,
    val tapIndex: Int,
    val asks: List<PermissionAsk>,
    val menuShow: MutableMethod,
    val menuGallery: FieldReference,
)

/**
 * A camera permission request the user's tap leads to. The wake goes in at [index], handed the
 * layout in [layout]; when [load] is set, the hook first reads the layout into [layout] from that
 * field of the method's own object, since the request's code keeps it nowhere it can be proven.
 */
internal class PermissionAsk(val method: MutableMethod, val index: Int, val layout: Int, val load: FieldReference? = null)

internal fun BytecodePatchContext.resolveGalleryCameraSites(): GalleryCameraSites {
    requireRuntimeHooks()
    val layout = tgMutableClassDefBy(PHOTO_LAYOUT)
    val methods = layout.methods.toList()

    val check = methods.filter { !it.isStatic() && it.hasShape(listOf("Z"), "V") && it.instructions().let { body ->
        body.any { instruction -> instruction.field()?.let { it.origDefiningClass == SHARED_CONFIG && it.origName == "inappCamera" } == true } &&
            body.any { instruction -> instruction.call()?.let { it.origDefiningClass == CAMERA_CONTROLLER && it.origName == "initCamera" } == true } &&
            body.any { instruction -> instruction.string() == CAMERA_PERMISSION } } }.one("checkCamera", ::refuse)
    val checkBody = check.instructions()
    val checkExit = checkBody.indices.filter { checkBody[it].opcode.let { op -> op == Opcode.RETURN_VOID || op == Opcode.THROW } }
        .one("checkCamera exit", ::refuse)
    shape(checkBody[checkExit].opcode == Opcode.RETURN_VOID, "checkCamera no longer returns in one place")

    // checkCamera ends by building the live tile.
    val showCall = checkBody.indices.filter { checkBody[it].call()?.let { call -> call.origDefiningClass == PHOTO_LAYOUT &&
        call.hasShape(emptyList(), "V") } == true }.one("showCamera call", ::refuse)
    shape(showCall == checkExit - 1, "showCamera is no longer checkCamera's last step")
    val show = methods.filter { it.origName == checkBody[showCall].call()!!.name && it.hasShape(emptyList(), "V") && !it.isStatic() }.one("showCamera", ::refuse)
    val showBody = show.instructions()
    val cameraView = showBody.mapNotNull { instruction -> instruction.takeIf { it.opcode == Opcode.IPUT_OBJECT }?.field() }
        .filter { it.origDefiningClass == PHOTO_LAYOUT && tgClassDefByOrNull(it.type)?.origSuperclass == CAMERA_VIEW }.distinct().one("camera view field", ::refuse)
    val showExit = showBody.indices.filter { showBody[it].opcode.let { op -> op == Opcode.RETURN_VOID || op == Opcode.THROW } }
        .one("showCamera exit", ::refuse)
    shape(showBody[showExit].opcode == Opcode.RETURN_VOID, "showCamera no longer returns in one place")

    // openCamera(Z) does nothing without the view showCamera built.
    val open = methods.filter { !it.isStatic() && it.hasShape(listOf("Z"), "V") && it.instructions().let { body ->
        body.size > 2 && body[0].opcode == Opcode.IGET_OBJECT && body[0].field() == cameraView &&
            body[1].opcode == Opcode.IF_EQZ && body[1].namedRegisters() == listOf(body[0].namedRegisters()[0]) } }.one("openCamera", ::refuse)

    // The camera tile: in-app camera on, open it; off, hand the tap to the system camera.
    val tap = methods.filter { !it.isStatic() && it.hasShape(emptyList(), "V") && it.instructions().let { body ->
        body.size > 5 && body[0].opcode == Opcode.SGET_BOOLEAN && body[0].field()?.let { it.origDefiningClass == SHARED_CONFIG && it.origName == "inappCamera" } == true &&
            body[1].opcode == Opcode.IF_EQZ && body[2].opcode == Opcode.CONST_4 && (body[2] as NarrowLiteralInstruction).narrowLiteral == 1 &&
            body[3].call()?.let { call -> call.origDefiningClass == PHOTO_LAYOUT && call.origName == open.origName && call.hasShape(listOf("Z"), "V") } == true &&
            body[3].namedRegisters() == listOf(it.localRegisterCount(), body[2].namedRegisters()[0]) && body[4].opcode == Opcode.RETURN_VOID } }
        .one("camera tile tap", ::refuse)
    tap.requireThisIntact(PATCH, listOf(2))

    val asks = permissionAsks(check, tap)

    // The attach menu builds its one gallery when it's made and reuses it for every open. Its
    // show() runs first on each open, on whatever tab, so that's where the gallery goes to sleep.
    // The gallery's own open animation only ends when it's the tab the menu opened on.
    val menus = mutableListOf<String>()
    forEachClassMentioning(Mention.type(PHOTO_LAYOUT)) { classDef ->
        if (classDef.origType.startsWith("Lapp/hushtelegram/extension/")) return@forEachClassMentioning
        if (classDef.methods.any { method -> method.origName == "<init>" &&
                method.instructions().any { it.opcode == Opcode.NEW_INSTANCE && it.type() == PHOTO_LAYOUT } }) menus += classDef.type
    }
    val menu = tgMutableClassDefBy(menus.one("attach menu that builds the gallery", ::refuse))
    val menuGallery = menu.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.origType == PHOTO_LAYOUT }.one("attach menu's gallery field", ::refuse)
        .let { ImmutableFieldReference(it.definingClass, it.name, it.type) }
    val menuShow = menu.methods.filter { it.origName == "show" && !it.isStatic() && it.hasShape(emptyList(), "V") }.one("attach menu show", ::refuse)
    val showStart = menuShow.instructions().firstOrNull()
    shape(showStart?.opcode == Opcode.INVOKE_SUPER && showStart.call()?.let { it.origName == "show" && it.hasShape(emptyList(), "V") } == true,
        "the attach menu's show no longer starts by showing the dialog")
    shape(menuShow.localRegisterCount() >= 1 && menuShow.localRegisterCount() <= 15, "the attach menu's show has no room for the sleep")

    for (method in listOf(check, show, menuShow)) method.requireThisIntact(PATCH, listOf(0))
    check.requireThisIntact(PATCH, listOf(checkExit))
    return GalleryCameraSites(check, checkExit, show, showExit, open.toReference(), cameraView, tap, 2, asks, menuShow, menuGallery)
}

/**
 * The tile's own camera request, taken when Telegram last found no permission, and the camera
 * button's. A grant brings checkCamera(true) back through the permission result, which a sleeping
 * gallery would refuse, so the tap that asks wakes it first.
 */
private fun BytecodePatchContext.permissionAsks(check: Method, tap: Method): List<PermissionAsk> {
    val checkBody = check.instructions()
    // checkCamera stores whether the permission is missing right after asking the system, through
    // Activity or, since Telegram 13.0, Context, which declares checkSelfPermission.
    val missingStore = checkBody.indices.filter { checkBody[it].opcode == Opcode.IPUT_BOOLEAN &&
        checkBody[it].field()?.origDefiningClass == PHOTO_LAYOUT &&
        (maxOf(0, it - 6) until it).any { at -> checkBody[at].call()?.let { call ->
            call.origDefiningClass in setOf(ACTIVITY, CONTEXT) && call.origName == "checkSelfPermission" } == true } }
        .one("missing camera permission store", ::refuse)
    val missing = checkBody[missingStore].field()!!

    // Since Telegram 13.0, R8 merges the gallery's click lambdas into classes they share with
    // unrelated code, so the two requests are found by what they do wherever they are: a
    // camera-only request that reads the missing flag (the tile) or leads to the tile's tap (the
    // camera button).
    val found = mutableListOf<Pair<String, Method>>()
    forEachClassMentioning(Mention.member(ACTIVITY, "requestPermissions") and Mention.string(CAMERA_PERMISSION)) { classDef ->
        if (classDef.origType.startsWith("Lapp/hushtelegram/extension/")) return@forEachClassMentioning
        for (method in classDef.methods) {
            val body = method.instructions()
            if (body.none { it.call()?.origName == "requestPermissions" } || method.cameraOnlyRequests().isEmpty()) continue
            if (body.any { it.field() == missing } || body.any { it.leadsTo(tap) }) found += classDef.type to method
        }
    }
    shape(found.size == 2, "found ${found.size} camera permission requests, expected the tile's and the camera button's")
    return found.map { (type, stock) ->
        val method = tgMutableClassDefBy(type).methods.filter { it.origName == stock.origName && it.params() == stock.params() &&
            it.origReturnType == stock.origReturnType }.one("${stock.name} camera request", ::refuse)
        val body = method.instructions()
        val reads = body.indices.filter { body[it].opcode == Opcode.IGET_BOOLEAN && body[it].field() == missing }
        val request = method.cameraOnlyRequests().one("${stock.name} camera request", ::refuse)
        if (reads.isEmpty()) {
            // The camera button: asks when the permission is missing and opens the tile's tap
            // otherwise. Its lambda holds the gallery in its one gallery field, read again here.
            shape(body.count { it.leadsTo(tap) } == 1, "camera button no longer leads to the tile's tap")
            shape(!method.isStatic(), "camera button is no longer a lambda that holds its gallery")
            val galleries = method.instructions().mapNotNull { instruction -> instruction.takeIf { it.opcode == Opcode.IGET_OBJECT }
                ?.field()?.takeIf { it.origDefiningClass == method.origDefiningClass && it.origType == PHOTO_LAYOUT } }.distinct()
            val gallery = galleries.one("camera button's gallery field", ::refuse)
            val self = method.localRegisterCount()
            shape(self <= 15, "camera button keeps this past v15")
            method.requireThisIntact(PATCH, listOf(request))
            val layout = method.freeLocalsAt(PATCH, request, 1, highest = 15).single()
            PermissionAsk(method, request, layout, gallery)
        } else {
            // The grid's click on the tile while the permission is missing. The flag's read names
            // the gallery's register, and the wake goes in on the branch that asks.
            val read = reads.one("tile's missing permission read", ::refuse)
            val (value, layout) = body[read].namedRegisters()
            val index = read + 2
            val flow = ControlFlow.of(method)
            shape(body[read + 1].opcode == Opcode.IF_EQZ && body[read + 1].namedRegisters() == listOf(value) &&
                request in index until index + 8 && (index until request).none { at -> body[at].opcode.let { op ->
                    op.canContinue().not() || op == Opcode.GOTO || op == Opcode.GOTO_16 || op == Opcode.GOTO_32 } } &&
                flow.normal.indices.filter { index in flow.normal[it] } == listOf(read + 1),
                "tile's permission request no longer follows the missing permission check")
            PermissionAsk(method, index, layout)
        }
    }
}

/** Whether this calls the camera tile's tap. */
private fun Instruction.leadsTo(tap: Method) =
    call()?.let { it.origDefiningClass == PHOTO_LAYOUT && it.origName == tap.origName && it.hasShape(emptyList(), "V") } == true

private fun GalleryCameraSites.apply() {
    // The exit goes in first, so the gate's jump can land on the return after it.
    val view = check.freeLocalsAt(PATCH, checkExit, 1, highest = 15).single()
    val self = check.localRegisterCount()
    check.addInstructionsAtControlFlowLabel(checkExit, """
        iget-object v$view, v$self, $PHOTO_LAYOUT->${cameraView.name}:${cameraView.type}
        invoke-static {v$self, v$view}, $GALLERY_CAMERA->openWhenReady($OBJECT$OBJECT)Z
        move-result v$view
        if-eqz v$view, :hush_done
        const/4 v$view, 0x1
        invoke-virtual {v$self, v$view}, $PHOTO_LAYOUT->${open.name}(Z)V
        :hush_done
        nop
    """.trimIndent())
    val checkReturn = checkExit + 7
    gate(check, checkReturn)
    gate(show, showExit)

    val answer = tap.freeLocalsAt(PATCH, tapIndex, 1, highest = 15).single()
    val tapSelf = tap.localRegisterCount()
    tap.addInstructionsAtControlFlowLabel(tapIndex, """
        iget-object v$answer, v$tapSelf, $PHOTO_LAYOUT->${cameraView.name}:${cameraView.type}
        invoke-static {v$tapSelf, v$answer}, $GALLERY_CAMERA->wakeOnTap($OBJECT$OBJECT)Z
        move-result v$answer
        if-eqz v$answer, :hush_stock
        const/4 v$answer, 0x1
        invoke-virtual {v$tapSelf, v$answer}, $PHOTO_LAYOUT->${check.name}(Z)V
        return-void
        :hush_stock
        nop
    """.trimIndent())

    for (ask in asks) {
        val load = ask.load?.let { "iget-object v${ask.layout}, v${ask.method.localRegisterCount()}, ${it.definingClass}->${it.name}:${it.type}\n" }
        ask.method.addInstructionsAtControlFlowLabel(ask.index,
            "${load.orEmpty()}invoke-static/range {v${ask.layout} .. v${ask.layout}}, $GALLERY_CAMERA->wakeForPermission($OBJECT)V")
    }
    // Before the dialog shows, so nothing in this open finds the gallery still awake from the last.
    val menuSelf = menuShow.localRegisterCount()
    menuShow.addInstructions(0, """
        iget-object v0, v$menuSelf, ${menuGallery.definingClass}->${menuGallery.name}:${menuGallery.type}
        invoke-static {v0}, $GALLERY_CAMERA->sleep($OBJECT)V
    """.trimIndent())
}

/** checkCamera and showCamera return at once while the gallery sleeps. */
private fun gate(method: MutableMethod, exit: Int) {
    val answer = method.freeLocalsAt(PATCH, 0, 1, targets = listOf(exit), highest = 15).single()
    val self = method.localRegisterCount()
    method.addInstructionsAtControlFlowLabel(0, """
        invoke-static {v$self}, $GALLERY_CAMERA->keepCameraOff($OBJECT)Z
        move-result v$answer
        if-nez v$answer, :hush_done
    """.trimIndent(), ExternalLabel("hush_done", method.getInstruction(exit)))
}

private fun BytecodePatchContext.requireRuntimeHooks() {
    val owner = tgClassDefByOrNull(GALLERY_CAMERA)
    shape(owner != null && AccessFlags.PUBLIC.isSet(owner.accessFlags), "no public gallery camera runtime")
    for ((name, parameters, returns) in listOf(
        Triple("keepCameraOff", listOf(OBJECT), "Z"),
        Triple("openWhenReady", listOf(OBJECT, OBJECT), "Z"),
        Triple("wakeOnTap", listOf(OBJECT, OBJECT), "Z"),
        Triple("wakeForPermission", listOf(OBJECT), "V"),
        Triple("sleep", listOf(OBJECT), "V"),
    )) {
        shape(owner!!.methods.count { it.origName == name && it.hasShape(parameters, returns) && it.isStatic() &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.NATIVE.isSet(it.accessFlags) &&
            !AccessFlags.ABSTRACT.isSet(it.accessFlags) &&
            it.implementation?.instructions?.any { instruction -> !instruction.opcode.format.isPayloadFormat } == true } == 1,
            "no callable public static runtime $name")
    }
}

/**
 * Calls of Activity.requestPermissions whose array holds the camera permission alone: a
 * one-element filled-new-array shortly before, whose element was last set to that string.
 */
private fun Method.cameraOnlyRequests(): List<Int> {
    val body = instructions()
    return body.indices.filter { at ->
        body[at].call()?.let { it.origDefiningClass == ACTIVITY && it.origName == "requestPermissions" } == true &&
            (maxOf(0, at - 6) until at).any { array -> body[array].opcode == Opcode.FILLED_NEW_ARRAY &&
                body[array].namedRegisters().size == 1 && body[array].namedRegisters()[0].let { element ->
                    (array - 1 downTo 0).firstOrNull { element in body[it].writes() }?.let { body[it].string() } == CAMERA_PERMISSION } }
    }
}

private fun Instruction.writes(): Set<Int> {
    if (!opcode.setsRegister()) return emptySet()
    val first = namedRegisters().firstOrNull() ?: return emptySet()
    return if (opcode.setsWideRegister()) setOf(first, first + 1) else setOf(first)
}

private fun Method.toReference(): MethodReference =
    com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference(definingClass, name, parameterTypes, returnType)

private fun refuse(reason: String): Nothing =
    throw PatchException("$PATCH: $reason; refuses changed gallery camera geometry before editing")
private fun shape(valid: Boolean, reason: String) {
    if (!valid) refuse(reason)
}
private fun Method.isStatic() = AccessFlags.STATIC.isSet(accessFlags)
private fun Method.params(): List<String> = parameterTypes.map { it.toString() }
private fun MethodReference.params(): List<String> = parameterTypes.map { it.toString() }
private fun Method.hasShape(parameters: List<String>, returns: String) = returnType == returns && params() == parameters
private fun MethodReference.hasShape(parameters: List<String>, returns: String) = returnType == returns && params() == parameters
private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Instruction.field(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference
private fun Instruction.string(): String? = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
private fun Instruction.type(): String? = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type
