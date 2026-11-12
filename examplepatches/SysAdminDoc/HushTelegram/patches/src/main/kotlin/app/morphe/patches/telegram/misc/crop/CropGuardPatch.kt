/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.crop

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.names.addInstructions
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.names.tgMutableClassDefByOrNull
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val CROP_GUARD = "$EXTENSION_PACKAGE/misc/CropGuard;"
internal const val CROP_GUARD_BEGIN = "$CROP_GUARD->begin()V"
internal const val CROP_GUARD_MISSING = "$CROP_GUARD->missing(Landroid/graphics/Bitmap;)Z"
internal const val CROP_GUARD_NOT_MADE = "$CROP_GUARD->notMade(Landroid/graphics/Bitmap;)Z"
internal const val CROP_GUARD_STILL_UNREAD = "$CROP_GUARD->stillUnread(Landroid/graphics/Bitmap;)Z"
internal const val CROP_GUARD_HELD = "$CROP_GUARD->held()Z"
internal const val CROP_GUARD_DROP_COPY = "$CROP_GUARD->dropCopy(Ljava/lang/String;)V"
internal const val CROP_VIEWER = "Lorg/telegram/ui/PhotoViewer;"
internal const val CROP_AREA_VIEW = "Lorg/telegram/ui/Components/Crop/CropAreaView;"
private const val BITMAP = "Landroid/graphics/Bitmap;"
private const val CROP_STATE = "Lorg/telegram/messenger/MediaController\$CropState;"
internal const val EDIT_STATE = "Lorg/telegram/messenger/MediaController\$MediaEditState;"
internal const val CROP_STATE_WRITE = "$EDIT_STATE->cropState:$CROP_STATE"
internal const val PAINT_PATH = "$EDIT_STATE->paintPath:Ljava/lang/String;"
internal const val CROPPED_PAINT_PATH = "$EDIT_STATE->croppedPaintPath:Ljava/lang/String;"
internal const val CROPPED_ENTITIES = "$EDIT_STATE->croppedMediaEntities:Ljava/util/ArrayList;"
internal const val IS_CROPPED = "$EDIT_STATE->isCropped:Z"
internal const val THUMB_PATH = "$EDIT_STATE->thumbPath:Ljava/lang/String;"
internal const val IMAGE_PATH = "$EDIT_STATE->imagePath:Ljava/lang/String;"
internal const val IS_LIVE_PHOTO = "$EDIT_STATE->isLivePhoto()Z"
internal const val GET_BITMAP = "Lorg/telegram/messenger/ImageReceiver;->getBitmap()$BITMAP"
internal const val LOAD_BITMAP = "Lorg/telegram/messenger/ImageLoader;->loadBitmap(Ljava/lang/String;Landroid/net/Uri;FFZ)$BITMAP"
internal val CROPPED_BITMAP_PARAMETERS = listOf(BITMAP, CROP_STATE, "[I", "Z")
internal val SEND_PRESSED_PARAMETERS = listOf("Z", "I", "I", "Z", "Z", "Z")

@Suppress("unused")
val cropGuardPatch = bytecodePatch(
    name = "Never send an uncropped photo",
    description = "When Telegram can't finish cropping a photo, keeps the editor open and asks you to try again instead " +
        "of sending the photo uncropped. On by default. Turn it off in HushTelegram settings > Conversations.",
    default = true,
) {
    category("Fixes")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val sites = resolveCropGuard()
        // Assembled on copies first, so a refusal leaves the app untouched.
        sites.insert(
            MutableMethod(ImmutableMethod.of(sites.apply)),
            MutableMethod(ImmutableMethod.of(sites.done)),
            MutableMethod(ImmutableMethod.of(sites.send)),
        )
        sites.insert(sites.apply, sites.done, sites.send)
        enableStatus("cropGuard")
    }
}

/**
 * Where the crop guard goes in. Telegram applies the editor's crop in PhotoViewer's
 * applyCurrentEditMode: it sets the crop on the photo's edit state, reads the photo the viewer
 * shows and draws a cropped copy of it with createCroppedBitmap, then saves that copy as the photo
 * to send. When the photo isn't loaded it returns without a copy, and when drawing the copy fails
 * createCroppedBitmap catches the failure and answers null. Either way the edit state already says
 * cropped, Done closes the crop view and Send goes on with the original file.
 *
 * The guard asks before the crop is set ([entry]) whether the photo is there, and after the copy is
 * drawn ([bake]) whether there is one. A failure returns from the method there, and Done and Send,
 * right after their call to it ([doneAt], [sendAt]), keep the editor open instead of going on.
 * Videos are cropped by the encoder when they're sent, so these checks leave them alone. The viewer
 * counts a live photo as a video too, but its still goes out as the cropped copy the way a photo's
 * does, so the copy check covers it. The photo check doesn't, since a live photo's still isn't the
 * viewer's photo: it's read from its file after the crop is set, from the filter's copy or the
 * photo's own path ([reads]), so a third check asks there, for a live photo only, whether the read
 * came back with a still.
 *
 * Both later checks come after Telegram has set the new crop on the photo's edit state
 * ([photoState]), with the drawing and stickers cropped to it, and the copy check also after Telegram
 * has deleted the photo's earlier edited copy and handed all of that to the viewer's edit state
 * ([viewState], read off [viewField]). A failure at either takes it back ([takeBack]): it deletes the
 * cropped drawing's file, which Telegram would otherwise have deleted on the next crop, and at a
 * still's read also the earlier edited copy and its thumbnail, as Telegram would have before drawing
 * the new one. It takes the crop, drawing and stickers back off both edit states and clears the
 * photo's cropped flag, which an earlier crop may have left set, so the photo reads as uncropped, the
 * way it would now be sent, even when the editor is cancelled next. The editor is still open, and the
 * next Done runs the crop again from the start.
 */
internal class CropGuardSites(
    val apply: MutableMethod,
    val done: MutableMethod,
    val send: MutableMethod,
    val self: Int,
    val entry: Int,
    val entryFree: Int,
    val reads: List<StillRead>,
    val bake: Int,
    val bakeFree: Int,
    val cropped: Int,
    val photoState: Int,
    val viewState: Int,
    val viewField: String,
    val viewCrop: String,
    val viewPaint: String,
    val viewEntities: String,
    val video: String,
    val photo: String,
    val doneAt: Int,
    val doneFree: Int,
    val sendAt: Int,
    val sendFree: Int,
) {
    fun insert(apply: MutableMethod, done: MutableMethod, send: MutableMethod) {
        // Highest index first, so the ones still to come keep their place.
        apply.addInstructionsAtControlFlowLabel(bake + 2, """
            iget-boolean v$bakeFree, v$self, $video
            if-eqz v$bakeFree, :hush_still
            invoke-virtual {v$photoState}, $IS_LIVE_PHOTO
            move-result v$bakeFree
            if-eqz v$bakeFree, :hush_baked
            :hush_still
            invoke-static/range {v$cropped .. v$cropped}, $CROP_GUARD_NOT_MADE
            move-result v$bakeFree
            if-eqz v$bakeFree, :hush_baked
            ${takeBack(photoState, viewState, bakeFree, BAKE_FILES)}
            :hush_baked
            nop
        """)
        for (read in reads.sortedByDescending { it.at }) apply.addInstructionsAtControlFlowLabel(read.at, """
            invoke-virtual {v${read.owner}}, $IS_LIVE_PHOTO
            move-result v${read.free}
            if-eqz v${read.free}, :hush_read
            invoke-static/range {v${read.still} .. v${read.still}}, $CROP_GUARD_STILL_UNREAD
            move-result v${read.free}
            if-eqz v${read.free}, :hush_read
            iget-object v${read.view}, v$self, $viewField
            ${takeBack(read.owner, read.view, read.free, READ_FILES)}
            :hush_read
            nop
        """)
        apply.addInstructionsAtControlFlowLabel(entry, """
            iget-boolean v$entryFree, v$self, $video
            if-nez v$entryFree, :hush_crop
            iget-object v$entryFree, v$self, $photo
            invoke-virtual/range {v$entryFree .. v$entryFree}, $GET_BITMAP
            move-result-object v$entryFree
            invoke-static/range {v$entryFree .. v$entryFree}, $CROP_GUARD_MISSING
            move-result v$entryFree
            if-eqz v$entryFree, :hush_crop
            return-void
            :hush_crop
            nop
        """)
        apply.addInstructions(0, "invoke-static {}, $CROP_GUARD_BEGIN")
        // Plain inserts: a jump onto the instruction after the call comes from a path that didn't apply anything.
        holdAfter(done, doneAt, doneFree)
        holdAfter(send, sendAt, sendFree)
    }

    private fun holdAfter(method: MutableMethod, index: Int, free: Int) = method.addInstructionsWithLabels(index, """
        invoke-static {}, $CROP_GUARD_HELD
        move-result v$free
        if-eqz v$free, :hush_keep
        return-void
    """, ExternalLabel("hush_keep", method.getInstruction(index)))

    /**
     * Takes a failed crop back off the photo's edit state in [state] and the viewer's in [view], then
     * returns: deletes the photo's [files] and clears them with the crop, the cropped stickers and
     * the cropped flag, and clears the viewer's crop, cropped drawing and cropped stickers.
     */
    private fun takeBack(state: Int, view: Int, free: Int, files: List<String>) = """
        ${files.joinToString("\n") { "iget-object v$free, v$state, $it\ninvoke-static/range {v$free .. v$free}, $CROP_GUARD_DROP_COPY" }}
        const/4 v$free, 0x0
        ${(listOf(CROP_STATE_WRITE, CROPPED_ENTITIES) + files).joinToString("\n") { "iput-object v$free, v$state, $it" }}
        iput-boolean v$free, v$state, $IS_CROPPED
        iput-object v$free, v$view, $viewCrop
        iput-object v$free, v$view, $viewPaint
        iput-object v$free, v$view, $viewEntities
        return-void
    """
}

/** What a failed copy deletes: Telegram has already deleted the earlier edited copy and its thumbnail. */
private val BAKE_FILES = listOf(CROPPED_PAINT_PATH)

/** What a failed still read deletes: Telegram deletes the earlier edited copy and its thumbnail only after the read. */
private val READ_FILES = listOf(THUMB_PATH, IMAGE_PATH, CROPPED_PAINT_PATH)

/**
 * A read of a live photo's still in applyCurrentEditMode's video branch. The check goes in front of
 * instruction [at], right after the read's result lands in [still]; [owner] holds the edit state
 * the file's path came off. [free] is the check's scratch register, and [view] takes the viewer's
 * edit state when the read failed.
 */
internal class StillRead(val at: Int, val still: Int, val owner: Int, val free: Int, val view: Int)

internal fun BytecodePatchContext.resolveCropGuard(): CropGuardSites {
    requireStatusMethod("cropGuard")
    controlHook(CROP_GUARD, "begin", emptyList(), "V")
    controlHook(CROP_GUARD, "missing", listOf(BITMAP), "Z")
    controlHook(CROP_GUARD, "notMade", listOf(BITMAP), "Z")
    controlHook(CROP_GUARD, "stillUnread", listOf(BITMAP), "Z")
    controlHook(CROP_GUARD, "held", emptyList(), "Z")
    controlHook(CROP_GUARD, "dropCopy", listOf("Ljava/lang/String;"), "V")
    val viewer = tgMutableClassDefByOrNull(CROP_VIEWER)
    controlShape(viewer != null, "the photo viewer is missing")

    val apply = viewer!!.methods.filter { it.isApplyEditMode() }.controlSingle("the photo editor's apply")
    val body = apply.controlBody()
    val first = body.firstOrNull()
    val copiesThis = { at: Int ->
        body[at].opcode in listOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16) &&
            (body[at] as TwoRegisterInstruction).registerB == apply.localRegisterCount()
    }
    controlShape(first != null && copiesThis(0), "the photo editor's apply no longer starts by keeping this")
    val self = (first as TwoRegisterInstruction).registerA
    controlShape(self <= 15, "the photo editor's apply keeps this out of an iget's reach")
    // D8 copies this into the same register again further down, which keeps it this.
    controlShape(body.indices.none { it > 0 && body[it].writes(self) && !copiesThis(it) },
        "the photo editor's apply writes over its copy of this")
    controlShape(ControlFlow.of(apply).normal.none { 0 in it }, "something jumps back to the start of the photo editor's apply")

    val makeCrop = body.indices.filter {
        body[it].opcode == Opcode.INVOKE_VIRTUAL && body[it].controlRef()?.endsWith("($CROP_STATE)V") == true
    }.controlSingle("the crop view's makeCrop call")
    val cropView = ((body[makeCrop] as ReferenceInstruction).reference as MethodReference).definingClass
    val entry = (0 until makeCrop).lastOrNull { at ->
        body[at].opcode == Opcode.IGET_OBJECT && body[at].reads(self) && body[at].controlField()?.definingClass == CROP_VIEWER &&
            body[at + 1].opcode == Opcode.IGET_OBJECT && body[at + 1].controlField()?.type == cropView &&
            (body[at + 1] as TwoRegisterInstruction).registerB == (body[at] as OneRegisterInstruction).registerA
    }
    controlShape(entry != null, "the photo editor's crop branch no longer starts by reading the crop view")

    val bitmap = (makeCrop + 1 until body.size).firstOrNull {
        body[it].opcode == Opcode.INVOKE_VIRTUAL && body[it].controlRef() == GET_BITMAP
    }
    controlShape(bitmap != null && body[bitmap - 1].opcode == Opcode.IGET_OBJECT && body[bitmap - 1].reads(self) &&
        body[bitmap - 1].controlField()?.definingClass == CROP_VIEWER && body[bitmap + 1].opcode == Opcode.MOVE_RESULT_OBJECT,
        "the photo editor no longer reads the photo it shows after the crop")
    val photo = body[bitmap!! - 1].controlRef()!!

    val flow = ControlFlow.of(apply)
    val video = (makeCrop + 1 until bitmap - 1).filter { at ->
        body[at].opcode == Opcode.IGET_BOOLEAN && body[at].reads(self) && body[at].controlField()?.definingClass == CROP_VIEWER &&
            body[at + 1].opcode == Opcode.IF_EQZ && (body[at + 1] as OneRegisterInstruction).registerA == (body[at] as OneRegisterInstruction).registerA &&
            flow.normal[at + 1].any { it in bitmap - 2 until bitmap }
    }.controlSingle("the photo editor's is-a-video check")
    controlShape(body.any { it.opcode == Opcode.INVOKE_VIRTUAL && it.controlRef() == IS_LIVE_PHOTO },
        "the photo editor no longer tells a live photo from a video")
    // A live photo's still is read from its file in the video branch: the filter's copy, else the photo's own path.
    val reads = (makeCrop + 1 until bitmap).filter { body[it].controlRef() == LOAD_BITMAP }.map { apply.stillRead(body, flow, it) }
    controlShape(reads.size == 2 && reads.all { it != null }, "the photo editor no longer reads a live photo's still from its file")

    val bake = body.indices.filter { at ->
        body[at].opcode in listOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE) && body[at].isCroppedBitmap() &&
            body.getOrNull(at + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT && body.getOrNull(at + 2)?.controlRef() == PAINT_PATH
    }.controlSingle("the photo editor's cropped copy")
    controlShape(bake > bitmap, "the photo editor draws its cropped copy before reading the photo")
    controlShape(flow.normal.indices.filter { bake + 2 in flow.normal[it] || bake + 2 in flow.exceptional[it] } == listOf(bake + 1),
        "something jumps past the photo editor's cropped copy")
    val cropped = (body[bake + 1] as OneRegisterInstruction).registerA

    // The crop the copy is drawn with: read off the photo's edit state and handed to the viewer's just before.
    val crop = (body[bake] as? FiveRegisterInstruction)?.registerD ?: ((body[bake] as RegisterRangeInstruction).startRegister + 1)
    val cropRead = (0 until bake).lastOrNull { body[it].writes(crop) } ?: -1
    controlShape(cropRead >= 0 && body[cropRead].opcode == Opcode.IGET_OBJECT && body[cropRead].controlRef() == CROP_STATE_WRITE,
        "the photo editor's cropped copy no longer takes the photo's own crop")
    val viewShare = (cropRead + 1 until bake).filter { at ->
        body[at].opcode == Opcode.IPUT_OBJECT && (body[at] as OneRegisterInstruction).registerA == crop &&
            body[at].controlRef()?.endsWith(":$CROP_STATE") == true
    }.controlSingle("the viewer's copy of the photo's crop")
    val photoState = (body[cropRead] as TwoRegisterInstruction).registerB
    val viewState = (body[viewShare] as TwoRegisterInstruction).registerB
    controlShape(photoState <= 15 && viewState <= 15, "the photo editor keeps its edit states out of an iput's reach")
    controlShape((cropRead..bake + 1).none { body[it].writes(photoState) || body[it].writes(viewState) } &&
        (cropRead + 1..bake + 2).all { at ->
            flow.normal.indices.filter { at in flow.normal[it] || at in flow.exceptional[it] } == listOf(at - 1)
        }, "the photo editor's edit states may change between its crop read and its cropped copy")
    // The drawing and stickers cropped with the photo go to the viewer's state next to the crop.
    val viewCopy = { field: String, what: String ->
        (cropRead + 1 until bake).filter { at ->
            body[at].opcode == Opcode.IPUT_OBJECT && (body[at] as TwoRegisterInstruction).registerB == viewState &&
                body[at - 1].opcode == Opcode.IGET_OBJECT && body[at - 1].controlRef() == field && body[at - 1].reads(photoState) &&
                (body[at - 1] as OneRegisterInstruction).registerA == (body[at] as OneRegisterInstruction).registerA
        }.controlSingle(what).let { body[it].controlRef()!! }
    }
    val viewPaint = viewCopy(CROPPED_PAINT_PATH, "the viewer's copy of the photo's cropped drawing")
    val viewEntities = viewCopy(CROPPED_ENTITIES, "the viewer's copy of the photo's cropped stickers")
    // The still reads come before Telegram reads the viewer's edit state, so their check reads it off this itself.
    val viewLoad = (0 until viewShare).lastOrNull { body[it].writes(viewState) }
    controlShape(viewLoad != null && body[viewLoad].opcode == Opcode.IGET_OBJECT && body[viewLoad].reads(self) &&
        body[viewLoad].controlField()?.definingClass == CROP_VIEWER &&
        body[viewLoad].controlField()?.type == body[viewShare].controlField()?.definingClass,
        "the photo editor no longer reads the viewer's edit state off the viewer")
    // The reads take the still's path off the edit state the crop is set on and the copy is drawn with.
    controlShape(reads.all { it!!.owner == photoState } && (entry!!..bake).none { body[it].writes(photoState) },
        "the photo editor reads a live photo's still off another edit state")
    // Telegram deletes the earlier edited copy and its thumbnail after the reads; a failed read deletes them itself.
    controlShape(listOf(THUMB_PATH, IMAGE_PATH).all { field ->
        (bitmap until cropRead).any { body[it].opcode == Opcode.IPUT_OBJECT && body[it].controlRef() == field && body[it].reads(photoState) }
    }, "the photo editor no longer drops the photo's earlier edited copy before drawing the new one")

    val applyRef = "$CROP_VIEWER->${apply.origName}()V"
    val doneSites = mutableListOf<Triple<ClassDef, Method, Int>>()
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@classDefForEach
        for (method in cls.methods) {
            val code = method.controlBody()
            for (at in code.indices) {
                if (code[at].opcode != Opcode.INVOKE_VIRTUAL || code[at].controlRef() != applyRef) continue
                val checksCropArea = (maxOf(0, at - 4) until at).any { code[it].controlField()?.definingClass == CROP_AREA_VIEW }
                val next = code.getOrNull(at + 1)
                val switchesMode = next?.opcode == Opcode.INVOKE_VIRTUAL && next.controlRef()?.let {
                    it.startsWith("$CROP_VIEWER->") && it.endsWith("(I)V")
                } == true
                if (checksCropArea && switchesMode) doneSites += Triple(cls, method, at)
            }
        }
    }
    val (doneClass, doneStock, doneCall) = doneSites.controlSingle("the crop view's Done button")
    val doneParameters = doneStock.parameterTypes.map { it.toString() }
    val done = tgMutableClassDefBy(doneClass).methods.single {
        it.name == doneStock.name && it.parameterTypes.map { type -> type.toString() } == doneParameters
    }
    controlShape(done.returnType == "V", "the crop view's Done button returns a value")

    val sendCalls = viewer.methods.filter { it.origParameterTypes == SEND_PRESSED_PARAMETERS && it.origReturnType == "V" }
        .map { it to it.controlBody().indices.filter { at -> it.controlBody()[at].controlRef() == applyRef } }
        .filter { (_, calls) -> calls.size == 1 }
    val (send, sendCall) = sendCalls.controlSingle("the photo editor's send").let { (method, calls) -> method to calls.single() }

    return CropGuardSites(
        apply, done, send, self,
        entry!!, apply.freeLocalsAt("Never send an uncropped photo", entry, 1).single(),
        reads.filterNotNull(),
        // The check reads the copy and both edit states after its scratch register is written, so none can share it.
        bake, apply.freeLocalsAt("Never send an uncropped photo", bake + 2, 4).first { it != cropped && it != viewState && it != photoState },
        cropped,
        photoState, viewState, body[viewLoad!!].controlRef()!!, body[viewShare].controlRef()!!, viewPaint, viewEntities,
        body[video].controlRef()!!, photo,
        doneCall + 1, done.freeLocalsAt("Never send an uncropped photo", doneCall + 1, 1, highest = 255).single(),
        sendCall + 1, send.freeLocalsAt("Never send an uncropped photo", sendCall + 1, 1, highest = 255).single(),
    )
}

/**
 * The still read at [at], or null unless its path comes straight off an edit state, a field of it or
 * a call on it, with nothing jumping in and nothing writing that register before the result lands,
 * and unless an empty read goes on to Telegram's own return.
 */
private fun MutableMethod.stillRead(body: List<Instruction>, flow: ControlFlow, at: Int): StillRead? {
    val call = body[at] as? FiveRegisterInstruction ?: return null
    if (body.getOrNull(at + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT) return null
    val written = (0 until at).lastOrNull { body[it].writes(call.registerC) } ?: return null
    val fromState = { ref: String? -> ref?.startsWith("$EDIT_STATE->") == true }
    val (from, owner) = when {
        body[written].opcode == Opcode.IGET_OBJECT && fromState(body[written].controlRef()) ->
            written to (body[written] as TwoRegisterInstruction).registerB
        body[written].opcode == Opcode.MOVE_RESULT_OBJECT && body[written - 1].opcode == Opcode.INVOKE_VIRTUAL &&
            (body[written - 1] as FiveRegisterInstruction).registerCount == 1 &&
            fromState(body[written - 1].controlRef()) && body[written - 1].controlRef()!!.endsWith("()Ljava/lang/String;") ->
            written - 1 to (body[written - 1] as FiveRegisterInstruction).registerC
        else -> return null
    }
    val straight = (from + 1..at + 2).all { x -> flow.normal.indices.filter { x in flow.normal[it] || x in flow.exceptional[it] } == listOf(x - 1) }
    if (!straight || (written..at + 1).any { body[it].writes(owner) }) return null
    val still = (body[at + 1] as OneRegisterInstruction).registerA
    if (!flow.nullReturns(body, at + 2, still)) return null
    val free = freeLocalsAt("Never send an uncropped photo", at + 2, 4).filter { it != still && it != owner }
    return StillRead(at + 2, still, owner, free[0], free[1])
}

/**
 * Whether a null in [register] at instruction [from] reaches a return-void: through code that has
 * one way on and leaves [register] alone, to a null check on it whose null branch jumps straight there.
 */
private fun ControlFlow.nullReturns(body: List<Instruction>, from: Int, register: Int): Boolean {
    val seen = mutableSetOf<Int>()
    var at = from
    while (seen.add(at)) {
        val check = body[at]
        if (check.opcode in listOf(Opcode.IF_EQZ, Opcode.IF_NEZ) && (check as OneRegisterInstruction).registerA == register) {
            var next = if (check.opcode == Opcode.IF_NEZ) at + 1 else normal[at].singleOrNull { it != at + 1 } ?: return false
            while (seen.add(next) && body[next].opcode in listOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)) next = normal[next].single()
            return body[next].opcode == Opcode.RETURN_VOID
        }
        if (check.writes(register)) return false
        at = normal[at].singleOrNull() ?: return false
    }
    return false
}

/** applyCurrentEditMode: sets an edit state's crop, reads the shown photo and draws the cropped copy. */
private fun Method.isApplyEditMode(): Boolean {
    if (AccessFlags.STATIC.isSet(accessFlags) || parameterTypes.isNotEmpty() || returnType != "V") return false
    val code = controlBody()
    return code.any { it.opcode == Opcode.IPUT_OBJECT && it.controlRef() == CROP_STATE_WRITE } &&
        code.any { it.controlRef() == GET_BITMAP } &&
        code.any { it.opcode in listOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE) && it.isCroppedBitmap() }
}

/** A call to PhotoViewer's static createCroppedBitmap(Bitmap, CropState, int[], boolean). */
private fun Instruction.isCroppedBitmap(): Boolean {
    val method = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return method.definingClass == CROP_VIEWER && method.origParameterTypes == CROPPED_BITMAP_PARAMETERS &&
        method.origReturnType == BITMAP
}

private fun Instruction.reads(register: Int) = (this as? TwoRegisterInstruction)?.registerB == register

private fun Instruction.writes(register: Int): Boolean {
    val destination = (this as? OneRegisterInstruction)?.registerA ?: return false
    return opcode.setsRegister() && (destination == register || (opcode.setsWideRegister() && destination + 1 == register))
}
