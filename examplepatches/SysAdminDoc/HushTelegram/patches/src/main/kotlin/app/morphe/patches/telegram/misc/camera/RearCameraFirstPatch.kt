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
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.requireParameterIntact
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val REAR_CAMERA = "$EXTENSION_PACKAGE/misc/RearCamera;"
internal const val REAR_CAMERA_FRONT = "$REAR_CAMERA->front(Z)Z"
internal const val ATTACH_CAMERA_SUPER = "Lorg/telegram/messenger/camera/CameraView;"
internal const val ATTACH_CAMERA_INIT = "$ATTACH_CAMERA_SUPER-><init>(Landroid/content/Context;ZZ)V"
internal val ATTACH_CAMERA_PARAMETERS = listOf(PHOTO_LAYOUT, "Landroid/content/Context;", "Z", "Z")

@Suppress("unused")
val rearCameraFirstPatch = bytecodePatch(
    name = "Start the camera on the rear lens",
    description = "Adds a switch, off by default, that starts the attachment menu's camera on the rear lens each time, instead of the lens you used last or the front one.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val camera = resolveRearCameraFirst()
        // Assembled on a copy first, so a refusal leaves the app untouched.
        insertRearCamera(MutableMethod(ImmutableMethod.of(camera)))
        insertRearCamera(camera)
        enableStatus("rearCameraFirst")
    }
}

/** The lens choice takes the extension's answer before CameraView reads it. */
internal fun insertRearCamera(target: MutableMethod) {
    val front = target.parameterRegisterNumber(2)
    target.addInstructions(0, """
        invoke-static/range {v$front .. v$front}, $REAR_CAMERA_FRONT
        move-result v$front
    """)
}

/**
 * The attachment gallery's camera is a CameraView subclass built from the gallery, the context,
 * whether to start on the front lens and whether to start lazily. It hands the lens choice
 * straight to CameraView, which keeps it to pick the camera when the view starts.
 */
internal fun BytecodePatchContext.resolveRearCameraFirst(): MutableMethod {
    requireStatusMethod("rearCameraFirst")
    controlHook(REAR_CAMERA, "front", listOf("Z"), "Z")
    val found = mutableListOf<String>()
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/") || cls.superclass != ATTACH_CAMERA_SUPER) return@classDefForEach
        if (cls.methods.any { it.isAttachCameraInit() }) found += cls.type
    }
    val camera = mutableClassDefBy(found.controlSingle("attachment camera")).methods.filter { it.isAttachCameraInit() }
        .controlSingle("attachment camera constructor")
    val body = camera.controlBody()
    val call = body.indices.filter { body[it].controlRef() == ATTACH_CAMERA_INIT &&
        body[it].opcode in listOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE) }.controlSingle("attachment camera's CameraView call")
    val front = camera.parameterRegisterNumber(2)
    controlShape(body[call].namedRegisters() == listOf(camera.localRegisterCount(), camera.parameterRegisterNumber(1), front, camera.parameterRegisterNumber(3)),
        "the attachment camera no longer hands its lens choice to CameraView")
    camera.requireParameterIntact("Start the camera on the rear lens", 2, listOf(call))
    controlShape(front < 256, "the attachment camera's lens choice is out of a result's reach")
    controlShape(ControlFlow.of(camera).normal.none { 0 in it }, "something jumps back to the start of the attachment camera")
    return camera
}

private fun com.android.tools.smali.dexlib2.iface.Method.isAttachCameraInit() =
    name == "<init>" && returnType == "V" && parameterTypes.map(CharSequence::toString) == ATTACH_CAMERA_PARAMETERS
