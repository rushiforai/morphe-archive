/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.pinterest.actions.PIN_CLOSEUP_PRESENTER
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.freeLocalsAt
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val PATCH = "Pinch to zoom only"

internal const val PINCH_ZOOM_HOOK = "$EXTENSION_PACKAGE/actions/PinchZoom;->pinch(Ljava/lang/Object;)I"

/** What a pin page hands its pinch handler, a class whose name stays. */
internal const val PINCH_CONTEXT = "Lcom/pinterest/feature/search/visual/PinchToZoomTransitionContext;"

/** The pin page presenter's handler for a pinch on its picture, a name that stays. */
internal const val PINCH_HANDLER = "onHandleTransitionFromPinchToZoom"

/** The source a pinch's context carries, an enum constant whose name stays. A tap on a linkless picture carries none. */
internal const val PINCH_SOURCE = "p2z"

/** The pin page presenter's pin, a field whose name stays. */
internal const val CLOSEUP_PIN_FIELD = "pin"

/**
 * The pin page's pinch handler (14.45.0: `OrganicPinCloseupPresenter.onHandleTransitionFromPinchToZoom`,
 * 62 instructions): it may prefetch pins that look like the picture (@8 to @29), then opens visual
 * search on it (@51 to @60). [source] is the context's field that says where the jump came from,
 * [pinch] the value it holds for a pinch, and [pin] the presenter's pin.
 */
internal class PinchHandler(val method: Method, val source: FieldReference, val pinch: String, val pin: String)

internal fun BytecodePatchContext.pinchHandler(): PinchHandler {
    val presenter = classDefByOrNull(PIN_CLOSEUP_PRESENTER) ?: throw PatchException("$PATCH: no pin page presenter $PIN_CLOSEUP_PRESENTER")
    val method = presenter.methods.filter {
        it.name == PINCH_HANDLER && it.parameters() == listOf(PINCH_CONTEXT) && it.returnType == "V" && it.implementation != null
    }.one("$PATCH: the pin page's pinch handler")
    val source = method.fields().filter { it.definingClass == PINCH_CONTEXT }.distinct().filter { field ->
        classDefByOrNull(field.type)?.fields?.any {
            it.name == PINCH_SOURCE && it.type == field.type && AccessFlags.STATIC.isSet(it.accessFlags)
        } == true
    }.one("$PATCH: the pinch's source in what the handler gets")
    val pin = presenter.fields.filter { it.name == CLOSEUP_PIN_FIELD && !AccessFlags.STATIC.isSet(it.accessFlags) }
        .one("$PATCH: the pin page's pin")
    return PinchHandler(method, source, "${source.type}->$PINCH_SOURCE:${source.type}", "$PIN_CLOSEUP_PRESENTER->${pin.name}:${pin.type}")
}

/**
 * Pinch to zoom only (#48). A pinch on a pin's picture zooms a copy of it while your fingers move,
 * then Pinterest's pin page loads pins that look like it and opens them. The handler's first act
 * now is to check that the jump came from a pinch and ask the extension, which opens the picture
 * full screen to zoom in and returns before Pinterest loads anything. A tap on a linkless picture
 * reaches the same handler with no source, so it searches as before.
 */
@Suppress("unused")
val pinchToZoomOnlyPatch = bytecodePatch(
    name = PATCH,
    description = "Pinching a pin's picture opens it full screen to zoom and drag, instead of loading pins that look like it. " +
        "Starts off. Turn it on in HushPinterest settings > Interface.",
) {
    category("Navigation")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        requireStatusMethod("pinchToZoomOnly")
        requireStatusMethod("pinchZoomViewer")
        val handler = pinchHandler()
        val self = handler.method.implementation!!.registerCount - 2
        val context = self + 1
        // iget-object and if-ne take registers up to v15. The parameters may sit higher, so they're copied down first.
        val (value, constant) = handler.method.freeLocalsAt("$PATCH: the pinch handler", 0, 2)
        val method = mutable(handler.method)
        method.addInstructionsAtControlFlowLabel(0, """
            move-object/from16 v$value, v$context
            iget-object v$value, v$value, ${handler.source}
            sget-object v$constant, ${handler.pinch}
            if-ne v$value, v$constant, :hush_pinch_kept
            move-object/from16 v$value, v$self
            iget-object v$value, v$value, ${handler.pin}
            invoke-static {v$value}, $PINCH_ZOOM_HOOK
            move-result v$value
            if-eqz v$value, :hush_pinch_kept
            return-void
        """, ExternalLabel("hush_pinch_kept", method.getInstruction(0)))
        enableCapability("pinchZoomViewer")
        enableStatus("pinchToZoomOnly")
    }
}
