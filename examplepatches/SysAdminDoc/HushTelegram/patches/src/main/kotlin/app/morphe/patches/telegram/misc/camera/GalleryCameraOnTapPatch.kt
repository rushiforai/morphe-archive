/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.camera

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
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
import app.morphe.patches.telegram.misc.extension.requireParameterIntact
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.namedRegisters
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

private const val PATCH = "Gallery camera on tap"
internal const val PHOTO_LAYOUT = "Lorg/telegram/ui/Components/ChatAttachAlertPhotoLayout;"
internal const val GALLERY_CAMERA = "$EXTENSION_PACKAGE/misc/GalleryCamera;"
private const val SHARED_CONFIG = "Lorg/telegram/messenger/SharedConfig;"
private const val CAMERA_CONTROLLER = "Lorg/telegram/messenger/camera/CameraController;"
private const val CAMERA_VIEW = "Lorg/telegram/messenger/camera/CameraView;"
private const val ACTIVITY = "Landroid/app/Activity;"
private const val CAMERA_PERMISSION = "android.permission.CAMERA"
private const val OBJECT = "Ljava/lang/Object;"

@Suppress("unused")
val galleryCameraOnTapPatch = bytecodePatch(
    name = PATCH,
    description = "Adds a switch, off by default, that keeps the attachment gallery from starting the camera or asking for camera access when it opens. Tapping the camera tile starts it.",
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

/** A camera permission request the user's tap leads to, with the register that holds the layout there. */
internal class PermissionAsk(val method: MutableMethod, val index: Int, val layout: Int)

internal fun BytecodePatchContext.resolveGalleryCameraSites(): GalleryCameraSites {
    requireRuntimeHooks()
    val layout = mutableClassDefBy(PHOTO_LAYOUT)
    val methods = layout.methods.toList()

    val check = methods.filter { !it.isStatic() && it.hasShape(listOf("Z"), "V") && it.instructions().let { body ->
        body.any { instruction -> instruction.field()?.let { it.definingClass == SHARED_CONFIG && it.name == "inappCamera" } == true } &&
            body.any { instruction -> instruction.call()?.let { it.definingClass == CAMERA_CONTROLLER && it.name == "initCamera" } == true } &&
            body.any { instruction -> instruction.string() == CAMERA_PERMISSION } } }.one("checkCamera")
    val checkBody = check.instructions()
    val checkExit = checkBody.indices.filter { checkBody[it].opcode.let { op -> op == Opcode.RETURN_VOID || op == Opcode.THROW } }
        .one("checkCamera exit")
    shape(checkBody[checkExit].opcode == Opcode.RETURN_VOID, "checkCamera no longer returns in one place")

    // checkCamera ends by building the live tile.
    val showCall = checkBody.indices.filter { checkBody[it].call()?.let { call -> call.definingClass == PHOTO_LAYOUT &&
        call.hasShape(emptyList(), "V") } == true }.one("showCamera call")
    shape(showCall == checkExit - 1, "showCamera is no longer checkCamera's last step")
    val show = methods.filter { it.name == checkBody[showCall].call()!!.name && it.hasShape(emptyList(), "V") && !it.isStatic() }.one("showCamera")
    val showBody = show.instructions()
    val cameraView = showBody.mapNotNull { instruction -> instruction.takeIf { it.opcode == Opcode.IPUT_OBJECT }?.field() }
        .filter { it.definingClass == PHOTO_LAYOUT && classDefByOrNull(it.type)?.superclass == CAMERA_VIEW }.distinct().one("camera view field")
    val showExit = showBody.indices.filter { showBody[it].opcode.let { op -> op == Opcode.RETURN_VOID || op == Opcode.THROW } }
        .one("showCamera exit")
    shape(showBody[showExit].opcode == Opcode.RETURN_VOID, "showCamera no longer returns in one place")

    // openCamera(Z) does nothing without the view showCamera built.
    val open = methods.filter { !it.isStatic() && it.hasShape(listOf("Z"), "V") && it.instructions().let { body ->
        body.size > 2 && body[0].opcode == Opcode.IGET_OBJECT && body[0].field() == cameraView &&
            body[1].opcode == Opcode.IF_EQZ && body[1].namedRegisters() == listOf(body[0].namedRegisters()[0]) } }.one("openCamera")

    // The camera tile: in-app camera on, open it; off, hand the tap to the system camera.
    val tap = methods.filter { !it.isStatic() && it.hasShape(emptyList(), "V") && it.instructions().let { body ->
        body.size > 5 && body[0].opcode == Opcode.SGET_BOOLEAN && body[0].field()?.let { it.definingClass == SHARED_CONFIG && it.name == "inappCamera" } == true &&
            body[1].opcode == Opcode.IF_EQZ && body[2].opcode == Opcode.CONST_4 && (body[2] as NarrowLiteralInstruction).narrowLiteral == 1 &&
            body[3].call()?.let { call -> call.definingClass == PHOTO_LAYOUT && call.name == open.name && call.hasShape(listOf("Z"), "V") } == true &&
            body[3].namedRegisters() == listOf(it.localRegisterCount(), body[2].namedRegisters()[0]) && body[4].opcode == Opcode.RETURN_VOID } }
        .one("camera tile tap")
    tap.requireThisIntact(PATCH, listOf(2))

    val asks = permissionAsks(methods, check, tap)

    // The attach menu builds its one gallery when it's made and reuses it for every open. Its
    // show() runs first on each open, on whatever tab, so that's where the gallery goes to sleep.
    // The gallery's own open animation only ends when it's the tab the menu opened on.
    val menus = mutableListOf<String>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/hushtelegram/extension/")) return@classDefForEach
        if (classDef.methods.any { method -> method.name == "<init>" &&
                method.instructions().any { it.opcode == Opcode.NEW_INSTANCE && it.type() == PHOTO_LAYOUT } }) menus += classDef.type
    }
    val menu = mutableClassDefBy(menus.one("attach menu that builds the gallery"))
    val menuGallery = menu.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == PHOTO_LAYOUT }.one("attach menu's gallery field")
        .let { ImmutableFieldReference(it.definingClass, it.name, it.type) }
    val menuShow = menu.methods.filter { it.name == "show" && !it.isStatic() && it.hasShape(emptyList(), "V") }.one("attach menu show")
    val showStart = menuShow.instructions().firstOrNull()
    shape(showStart?.opcode == Opcode.INVOKE_SUPER && showStart.call()?.let { it.name == "show" && it.hasShape(emptyList(), "V") } == true,
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
private fun permissionAsks(methods: List<MutableMethod>, check: Method, tap: Method): List<PermissionAsk> {
    val checkBody = check.instructions()
    // checkCamera stores whether the permission is missing right after asking the system.
    val missingStore = checkBody.indices.filter { checkBody[it].opcode == Opcode.IPUT_BOOLEAN &&
        checkBody[it].field()?.definingClass == PHOTO_LAYOUT &&
        (maxOf(0, it - 6) until it).any { at -> checkBody[at].call()?.let { call -> call.definingClass == ACTIVITY && call.name == "checkSelfPermission" } == true } }
        .one("missing camera permission store")
    val missing = checkBody[missingStore].field()!!

    val requesters = methods.filter { it.isStatic() && it.params().firstOrNull() == PHOTO_LAYOUT && it.cameraOnlyRequests().isNotEmpty() }
    shape(requesters.size == 2, "found ${requesters.size} camera permission requests, expected the tile's and the camera button's")
    return requesters.map { method ->
        val body = method.instructions()
        val reads = body.indices.filter { body[it].opcode == Opcode.IGET_BOOLEAN && body[it].field() == missing }
        if (reads.isEmpty()) {
            // The camera button: asks when the permission is missing and opens the tile's tap otherwise.
            shape(body.any { it.call()?.let { call -> call.definingClass == PHOTO_LAYOUT && call.name == tap.name } == true },
                "camera button no longer leads to the tile's tap")
            method.requireParameterIntact(PATCH, 0, listOf(0))
            PermissionAsk(method, 0, method.localRegisterCount())
        } else {
            // The grid's click on the tile while the permission is missing.
            val read = reads.one("tile's missing permission read")
            val value = body[read].namedRegisters()[0]
            val index = read + 2
            val request = method.cameraOnlyRequests().one("tile's camera request")
            shape(body[read + 1].opcode == Opcode.IF_EQZ && body[read + 1].namedRegisters() == listOf(value) &&
                request in index until index + 8 && (index until request).none { at -> body[at].opcode.let { op ->
                    op.canContinue().not() || op == Opcode.GOTO || op == Opcode.GOTO_16 || op == Opcode.GOTO_32 } },
                "tile's permission request no longer follows the missing permission check")
            method.requireParameterIntact(PATCH, 0, listOf(index))
            PermissionAsk(method, index, method.localRegisterCount())
        }
    }
}

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
        ask.method.addInstructionsAtControlFlowLabel(ask.index,
            "invoke-static/range {v${ask.layout} .. v${ask.layout}}, $GALLERY_CAMERA->wakeForPermission($OBJECT)V")
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
    val owner = classDefByOrNull(GALLERY_CAMERA)
    shape(owner != null && AccessFlags.PUBLIC.isSet(owner.accessFlags), "no public gallery camera runtime")
    for ((name, parameters, returns) in listOf(
        Triple("keepCameraOff", listOf(OBJECT), "Z"),
        Triple("openWhenReady", listOf(OBJECT, OBJECT), "Z"),
        Triple("wakeOnTap", listOf(OBJECT, OBJECT), "Z"),
        Triple("wakeForPermission", listOf(OBJECT), "V"),
        Triple("sleep", listOf(OBJECT), "V"),
    )) {
        shape(owner!!.methods.count { it.name == name && it.hasShape(parameters, returns) && it.isStatic() &&
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
        body[at].call()?.let { it.definingClass == ACTIVITY && it.name == "requestPermissions" } == true &&
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
private fun <T> List<T>.one(what: String): T {
    shape(size == 1, "$what has $size matches")
    return single()
}
private fun Method.isStatic() = AccessFlags.STATIC.isSet(accessFlags)
private fun Method.params(): List<String> = parameterTypes.map { it.toString() }
private fun MethodReference.params(): List<String> = parameterTypes.map { it.toString() }
private fun Method.hasShape(parameters: List<String>, returns: String) = returnType == returns && params() == parameters
private fun MethodReference.hasShape(parameters: List<String>, returns: String) = returnType == returns && params() == parameters
private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference
private fun Instruction.field(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference
private fun Instruction.string(): String? = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
private fun Instruction.type(): String? = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type
