/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.camera

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.requireParameterIntact
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlCall
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val PATCH = "Hide gallery camera tile"
internal const val GALLERY_CAMERA_TILE = "$EXTENSION_PACKAGE/misc/GalleryCameraTile;"
internal const val GALLERY_CAMERA_TILE_ASK = "$GALLERY_CAMERA_TILE->tile(Z)Z"
private val MOVES = listOf(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16)

@Suppress("unused")
val hideGalleryCameraTilePatch = bytecodePatch(
    name = PATCH,
    description = "Adds a switch, off by default, that takes the live camera tile out of the attachment menu's photo grid, so the grid starts with your photos.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val gallery = resolveHideGalleryCameraTile()
        // Assembled on a copy first, so a refusal leaves the app untouched.
        insertCameraTileAnswer(MutableMethod(ImmutableMethod.of(gallery.init)))
        insertCameraTileAnswer(gallery.init)
        enableStatus("hideGalleryCameraTile")
    }
}

/** The gallery's constructor and the field that keeps whether it wants a camera. */
internal class GalleryCameraTileSite(val init: MutableMethod, val needCamera: FieldReference)

/** The extension answers whether this gallery gets the camera before the constructor reads it. */
internal fun insertCameraTileAnswer(target: MutableMethod) {
    val wanted = target.parameterRegisterNumber(3)
    target.addInstructions(0, """
        invoke-static/range {v$wanted .. v$wanted}, $GALLERY_CAMERA_TILE_ASK
        move-result v$wanted
    """)
}

/**
 * ChatAttachAlertPhotoLayout(alert, context, forceDarkTheme, needCamera, resourcesProvider) keeps
 * needCamera in a field for good. checkCamera(Z) returns at once without it, and the grid's adapter
 * is built from it, so a gallery made without it has no camera tile and never starts the camera.
 * That's how Telegram builds the pickers that want no camera.
 */
internal fun BytecodePatchContext.resolveHideGalleryCameraTile(): GalleryCameraTileSite {
    requireStatusMethod("hideGalleryCameraTile")
    controlHook(GALLERY_CAMERA_TILE, "tile", listOf("Z"), "Z")
    val layout = mutableClassDefByOrNull(PHOTO_LAYOUT)
    controlShape(layout != null, "ChatAttachAlertPhotoLayout is missing")
    val init = layout!!.methods.filter { it.name == "<init>" }.controlSingle("gallery constructor")
    val params = init.parameterTypes.map(CharSequence::toString)
    controlShape(params.size == 5 && params[1] == "Landroid/content/Context;" && params[2] == "Z" && params[3] == "Z",
        "the gallery constructor no longer takes the camera choice fourth")

    // checkCamera asks for the camera permission and starts CameraController with the in-app camera on.
    val check = layout.methods.filter { m ->
        !AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" && m.parameterTypes.map(CharSequence::toString) == listOf("Z") &&
            m.controlBody().let { body ->
                body.any { it.controlField()?.let { f -> f.definingClass == "Lorg/telegram/messenger/SharedConfig;" && f.name == "inappCamera" } == true } &&
                    body.any { it.controlCall()?.let { c -> c.definingClass == "Lorg/telegram/messenger/camera/CameraController;" && c.name == "initCamera" } == true } &&
                    body.any { it.controlString() == "android.permission.CAMERA" }
            }
    }.controlSingle("checkCamera")
    // Its first check of the gallery's own flags is whether the gallery wants a camera at all.
    val needCamera = check.controlBody().firstOrNull { it.opcode == Opcode.IGET_BOOLEAN && it.controlField()?.definingClass == PHOTO_LAYOUT }
        ?.controlField()
    controlShape(needCamera != null, "checkCamera no longer checks whether the gallery wants a camera")

    // The constructor stores its fourth parameter there, as is or through one copy, in code that
    // runs straight from the start, so reading it in order is reading what runs.
    val body = init.controlBody()
    val flow = ControlFlow.of(init).normal
    val wanted = init.parameterRegisterNumber(3)
    val store = body.indices.filter { body[it].opcode == Opcode.IPUT_BOOLEAN && body[it].controlField() == needCamera }
        .controlSingle("the gallery's camera choice store")
    controlShape((0 until store).all { flow[it] == listOf(it + 1) } && flow.indices.all { at -> flow[at].none { it <= store && it != at + 1 } },
        "the gallery constructor branches before it keeps the camera choice")
    val value = body[store].namedRegisters()[0]
    val writes = (0 until store).filter { at -> body[at].opcode.setsRegister() && body[at].namedRegisters().firstOrNull() == value }
    val copied = value == wanted && writes.isEmpty() ||
        writes.size == 1 && body[writes[0]].opcode in MOVES && body[writes[0]].namedRegisters() == listOf(value, wanted)
    controlShape(copied, "the gallery no longer keeps the camera choice it was built with")
    init.requireParameterIntact(PATCH, 3, listOf(if (value == wanted) store else writes[0]))
    controlShape(wanted < 256, "the gallery's camera choice is out of a result's reach")
    return GalleryCameraTileSite(init, needCamera!!)
}
