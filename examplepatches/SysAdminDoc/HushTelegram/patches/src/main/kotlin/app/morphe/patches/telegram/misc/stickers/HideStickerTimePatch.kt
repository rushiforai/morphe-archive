/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.stickers

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val STICKER_TIME = "$EXTENSION_PACKAGE/misc/StickerTime;"
internal const val MESSAGE_OBJECT = "Lorg/telegram/messenger/MessageObject;"
internal const val MESSAGE_TYPE = "$MESSAGE_OBJECT->type:I"
internal const val ANY_STICKER = "$MESSAGE_OBJECT->isAnyKindOfSticker()Z"
private const val CANVAS = "Landroid/graphics/Canvas;"
private const val STATIC_LAYOUT = "Landroid/text/StaticLayout;"

// MessageObject.TYPE_JOINED_CHANNEL, the one message the time drawer already skips.
private const val TYPE_JOINED_CHANNEL = 27

@Suppress("unused")
val hideStickerTimePatch = bytecodePatch(
    name = "Hide time on stickers",
    description = "Removes the time and read checks from stickers and big animated emoji in chats. Starts off. Turn it " +
        "on in HushTelegram settings > Chats.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val (drawTime, message) = resolveHideStickerTime()
        // Assembled on a copy first, so a refusal leaves the app untouched.
        insertStickerTimeGate(MutableMethod(ImmutableMethod.of(drawTime)), message)
        writeStub(STICKER_TIME, "isSticker", 1, """
            check-cast p0, $MESSAGE_OBJECT
            invoke-virtual {p0}, $ANY_STICKER
            move-result p0
            return p0
        """)
        insertStickerTimeGate(drawTime, message)
        enableStatus("hideStickerTime")
    }
}

/** The bubble's message goes to the extension first, and a yes returns before anything is drawn. */
internal fun insertStickerTimeGate(target: MutableMethod, message: String) {
    target.addInstructionsWithLabels(0, """
        move-object/from16 v0, p0
        iget-object v0, v0, $message
        invoke-static {v0}, $STICKER_TIME->hidden(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :hush_stock
        return-void
    """, ExternalLabel("hush_stock", target.getInstruction(0)))
}

/**
 * A message bubble draws its time from one method that takes the canvas, an alpha and whether its
 * parent asked. It skips a joined-channel notice by its type before drawing, and hands the drawing
 * to a longer method that takes the time's text layout.
 */
internal fun BytecodePatchContext.resolveHideStickerTime(): Pair<MutableMethod, String> {
    requireStatusMethod("hideStickerTime")
    controlHook(STICKER_TIME, "hidden", listOf("Ljava/lang/Object;"), "Z")
    controlHook(STICKER_TIME, "isSticker", listOf("Ljava/lang/Object;"), "Z")
    controlShape(classDefByOrNull(MESSAGE_OBJECT)?.methods?.any { "$MESSAGE_OBJECT->${it.name}()${it.returnType}" == ANY_STICKER &&
        it.parameterTypes.isEmpty() && AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags) } == true,
        "Telegram's sticker check changed")

    val found = mutableListOf<Pair<String, String>>()
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@classDefForEach
        val drawers = cls.methods.filter { m -> m.returnType == "V" && m.parameterTypes.map(CharSequence::toString).let { CANVAS in it && STATIC_LAYOUT in it } }
            .map { "${cls.type}->${it.name}(${it.parameterTypes.joinToString("")})V" }.toSet()
        if (drawers.isEmpty()) return@classDefForEach
        cls.methods.filter { m ->
            !AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" &&
                m.parameterTypes.map(CharSequence::toString).sorted() == listOf("F", CANVAS, "Z").sorted() &&
                m.controlBody().let { body ->
                    body.any { it.controlRef() == MESSAGE_TYPE } && body.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == TYPE_JOINED_CHANNEL } &&
                        body.any { it.controlRef() in drawers }
                }
        }.forEach { found += cls.type to ref(it) }
    }
    val (type, wanted) = found.controlSingle("message time drawing")
    val drawTime = mutableClassDefBy(type).methods.single { ref(it) == wanted }
    val messages = drawTime.controlBody().filter { it.opcode == Opcode.IGET_OBJECT && it.controlRef()?.let { r -> r.startsWith("$type->") && r.endsWith(":$MESSAGE_OBJECT") } == true }
        .mapNotNull { it.controlRef() }.distinct()
    val message = messages.controlSingle("message bubble's message field")
    controlShape(drawTime.implementation!!.registerCount > 4, "the message time drawer has no register to ask in")
    controlShape(ControlFlow.of(drawTime).normal.none { 0 in it }, "something jumps back to the start of the message time drawer")
    return drawTime to message
}

private fun ref(m: Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"
