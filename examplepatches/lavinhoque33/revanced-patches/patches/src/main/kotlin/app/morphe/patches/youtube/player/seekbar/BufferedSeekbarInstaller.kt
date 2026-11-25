/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-23.
 * Modified by lavinhoque33, 2026-11-24.
 * Written by lavinhoque33, 2026-11-22.
 */

package app.morphe.patches.youtube.player.seekbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.youtube.utils.extension.Constants.PLAYER_PATH
import app.morphe.util.cloneMutable
import app.morphe.util.Utils.printWarn
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val CANVAS = "Landroid/graphics/Canvas;"
private const val PAINT = "Landroid/graphics/Paint;"
private const val RECT = "Landroid/graphics/Rect;"
private const val VIEW = "Landroid/view/View;"
private const val ANIMATOR = "Landroid/animation/ValueAnimator;"
private const val RECT_SET = "Landroid/graphics/Rect;->set(IIII)V"
private const val EXTENSION = "$PLAYER_PATH/BufferedSeekbarPatch;"
private const val COLOR_EXTENSION = "$PLAYER_PATH/SeekbarColorPatch;"
private const val FADE_BRIDGE = "patch_hiddenPortraitBufferFade"
private const val CHAPTER_ZERO = "patch_hiddenPortraitChapterBufferZero"
private const val HIDDEN_PORTRAIT_VIEW = "patch_hiddenPortraitSeekbar"
private const val PLAYED_PAINT = "patch_hiddenPortraitPlayedPaint"
private const val LEGACY_BUFFER_GATE = "patch_legacyMiniplayerBuffer"

// Obfuscated callback/field roles differ even within the supported versions. The draw sites are checked
// against these shapes before installing anything; do not apply them to forced, untraced versions.
private data class BufferedPainterLayout(
    val view: String,
    val chapter: String,
    val flat: String,
    val paints: String,
    val fade: String,
    val fadeOwner: String,
    val scrub: String,
    val modelField: String,
    val model: String,
    val liveWindow: String,
    val playedChapter: String,
    val flatPlayedReads: Int = 2,
    val flatDrawStateRegister: Int = 13,
    val oldFlat: Boolean = false,
    val sharedFadeRead: Boolean = false,
)

internal fun BytecodePatchContext.installBufferedSeekbar() {
    val layout = when (packageMetadata.versionName) {
        "20.05.46" -> BufferedPainterLayout(
            "hcw", "hdc", "hdc", "hcx", "hdz", "hcs", "ft", "L", "ahwk", "p", "hdd",
            flatPlayedReads = 1, oldFlat = true,
        )
        "21.13.164" -> BufferedPainterLayout(
            "ion", "iot", "iov", "ioo", "ips", "ioj", "fP", "L", "anqf", "p", "iou",
            flatPlayedReads = 3, flatDrawStateRegister = 0,
        )
        "21.39.525" -> BufferedPainterLayout(
            "jol", "jor", "jot", "jom", "jpp", "joh", "gY", "P", "arco", "q", "jos", sharedFadeRead = true,
        )
        "21.45.90" -> BufferedPainterLayout(
            "jta", "jtg", "jti", "jtb", "jue", "jsw", "hY", "Q", "asdt", "r", "jth", sharedFadeRead = true,
        )
        else -> null
    }

    val install = layout?.let { runCatching { prepareBufferedSeekbar(it) }.getOrNull() }
    if (install == null) {
        printWarn("Persistent portrait seekbar buffer is not supported: native buffered painter not found.")
        printWarn("Hidden portrait seekbar gradient is not supported: native played painter not found.")
    } else {
        install()
        val installGradient = runCatching { prepareHiddenPlayedGradient(checkNotNull(layout)) }.getOrNull()
        if (installGradient == null) {
            printWarn("Hidden portrait seekbar gradient is not supported: native played painter not found.")
        } else {
            installGradient()
        }
    }

    if (packageMetadata.versionName == "20.05.46") {
        val installLegacyMiniplayer = runCatching { prepareLegacyMiniplayerBuffer() }.getOrNull()
        if (installLegacyMiniplayer == null) {
            printWarn("Legacy miniplayer buffer is not supported: native geometry or painter gate not found.")
        } else {
            installLegacyMiniplayer()
        }
    }
}

private fun BytecodePatchContext.prepareBufferedSeekbar(layout: BufferedPainterLayout): (() -> Unit)? {
    val view = "L${layout.view};"
    val fade = "L${layout.fade};"
    val fadeOwner = "L${layout.fadeOwner};"
    val paints = "L${layout.paints};"
    val readFade = "$fade->c()F"
    val chapterClass = mutableClassDefBy("L${layout.chapter};")
    val chapter = chapterClass.methods.single { it.parameterTypes == listOf(CANVAS) && it.returnType == "V" }
    val flat = if (layout.oldFlat) chapter else mutableClassDefBy("L${layout.flat};").methods.single {
        it.parameterTypes == listOf(CANVAS) && it.returnType == "V"
    }
    val animatorClass = mutableClassDefBy(fade)
    val owner = mutableClassDefBy(fadeOwner)
    val timebar = mutableClassDefBy(view)
    if (owner.superclass != fade) return null
    val onDraw = timebar.methods.single { it.name == "onDraw" && it.parameterTypes == listOf(CANVAS) }
    val scrub = onDraw.implementation!!.instructions.asSequence()
        .mapNotNull { it.getReference<MethodReference>() }
        .filter { it.name == layout.scrub && it.parameterTypes.isEmpty() && it.returnType == "Z" }
        .distinctBy { it.toString() }
        .single()
    val nativeModel = "L${layout.model};"
    val modelClass = mutableClassDefBy(nativeModel)
    val modelField = mutableClassDefBy(scrub.definingClass).fields.single {
        it.name == layout.modelField && it.type in modelClass.interfaces && AccessFlags.PUBLIC.isSet(it.accessFlags)
    }
    val liveWindow = modelClass.methods.single {
        it.name == layout.liveWindow && it.parameterTypes.isEmpty() && it.returnType == "Z"
    }

    val ownerView = owner.fields.single { it.type == view && AccessFlags.PUBLIC.isSet(it.accessFlags) }
    val animator = animatorClass.fields.single { it.type == ANIMATOR }
    val fadeMethod = animatorClass.methods.single { it.toString() == readFade }
    if (fadeMethod.implementation?.instructions?.none { it.calls("$ANIMATOR->isRunning()Z") } != false) return null

    val chapterInstructions = chapter.implementation!!.instructions
    val chapterRange = chapterInstructions.packedCase(if (layout.oldFlat) 3 else 2) ?: return null
    val chapterFade = chapterRange.filter { chapterInstructions[it].calls(readFade) }
    if (chapterFade.size != 3 || !chapterInstructions.isBufferedPaintRange(chapterRange, paints) ||
        !chapterInstructions[chapterFade[1] + 2].hasLiteral(255f.toRawBits())
    ) return null

    val flatInstructions = flat.implementation!!.instructions
    val flatRange = if (layout.oldFlat) flatInstructions.packedCase(2) else flatInstructions.flatBufferCase()
    if (flatRange == null || !flatInstructions.isBufferedPaintRange(flatRange, paints)) return null
    val flatFade = flatRange.filter { flatInstructions[it].calls(readFade) }
    if (flatFade.size != (if (layout.sharedFadeRead) 1 else 3)) return null
    val flatBufferReads = if (layout.sharedFadeRead) flatFade else flatFade.drop(1)

    // Both chapter buffer paints have a zero-fade substitution. The other call to this predicate
    // selects a special played-color paint; leave that call (and the played alpha read) stock.
    val zero = chapterClass.methods.single { it.name == "a" && it.parameterTypes.isEmpty() && it.returnType == "Z" }
    val zeroInstructions = zero.implementation!!.instructions
    val zeroRead = zeroInstructions.indices.single { zeroInstructions[it].calls(readFade) }
    val zeroCalls = chapterInstructions.indices.filter { chapterInstructions[it].calls(zero.toString()) }
    if (zeroCalls.size != 3 || zeroCalls.any { it !in chapterRange } ||
        !zeroCalls.all { chapterInstructions[it].isOneArgInvoke(Opcode.INVOKE_DIRECT) } ||
        !chapterFade.all { chapterInstructions[it].isOneArgInvoke(Opcode.INVOKE_VIRTUAL) } ||
        !flatBufferReads.all { flatInstructions[it].isOneArgInvoke(Opcode.INVOKE_VIRTUAL) } ||
        !zeroInstructions[zeroRead].isOneArgInvoke(Opcode.INVOKE_VIRTUAL) ||
        zeroInstructions[zeroRead + 2].opcode != Opcode.CONST_4 ||
        !zeroInstructions[zeroRead + 2].hasLiteral(0) ||
        zeroInstructions[zeroRead + 3].opcode != Opcode.CMPL_FLOAT
    ) return null

    val bridge = "$fade->$FADE_BRIDGE($fade)F"
    val bufferedZero = zero.cloneMutable(name = CHAPTER_ZERO).apply { replaceInvoke(zeroRead, bridge) }
    val resolveView = "$fade->$HIDDEN_PORTRAIT_VIEW($fade)$VIEW"
    val hiddenPortraitView = ImmutableMethod(
        fade, HIDDEN_PORTRAIT_VIEW, listOf(ImmutableMethodParameter(fade, null, null)), VIEW,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, MutableMethodImplementation(4),
    ).toMutable().apply {
        addInstructions(0, """
            instance-of v0, p0, $fadeOwner
            if-eqz v0, :unavailable
            iget-object v0, p0, $animator
            invoke-virtual {v0}, $ANIMATOR->isRunning()Z
            move-result v0
            if-nez v0, :unavailable
            check-cast p0, $fadeOwner
            iget-object v1, p0, $ownerView
            iget-object v0, v1, $modelField
            instance-of v2, v0, $nativeModel
            if-eqz v2, :unavailable
            check-cast v0, $nativeModel
            invoke-virtual {v0}, $liveWindow
            move-result v0
            if-nez v0, :unavailable
            invoke-virtual {v1}, $scrub
            move-result v0
            if-nez v0, :unavailable
            return-object v1
            :unavailable
            const/4 v0, 0x0
            return-object v0
        """)
    }
    val fadeBridge = ImmutableMethod(
        fade, FADE_BRIDGE, listOf(ImmutableMethodParameter(fade, null, null)), "F",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, MutableMethodImplementation(4),
    ).toMutable().apply {
        addInstructions(0, """
            invoke-virtual {p0}, $readFade
            move-result v0
            const/4 v1, 0x0
            cmpl-float v1, v0, v1
            if-nez v1, :done
            invoke-static {p0}, $resolveView
            move-result-object v2
            if-eqz v2, :done
            const/4 v1, 0x0
            invoke-static {v2, v0, v1}, $EXTENSION->restoreBufferedFade(${VIEW}FZ)F
            move-result v0
            :done
            return v0
        """)
    }

    return {
        animatorClass.methods.add(hiddenPortraitView)
        animatorClass.methods.add(fadeBridge)
        chapterClass.methods.add(bufferedZero)
        chapter.replaceInvoke(chapterFade.first(), bridge)
        chapter.replaceInvoke(chapterFade.last(), bridge)
        chapter.replaceInvoke(zeroCalls.first(), bufferedZero.toString(), direct = true)
        chapter.replaceInvoke(zeroCalls.last(), bufferedZero.toString(), direct = true)
        flatBufferReads.forEach { flat.replaceInvoke(it, bridge) }
    }
}

/**
 * Both legacy layouts use the floaty bar. Its controller supplies the real buffered position but
 * sets the model's buffer flag to false when the modern miniplayer is off.
 */
private fun BytecodePatchContext.prepareLegacyMiniplayerBuffer(): (() -> Unit)? {
    val timebar = mutableClassDefBy("Lhcw;")
    val painter = mutableClassDefBy("Lhda;")
    val model = mutableClassDefBy("Lahwk;")
    val timebarBase = mutableClassDefBy("Lahwi;")
    val animator = mutableClassDefBy("Lhcs;")
    val drawState = mutableClassDefBy("Lhdg;")
    val paintState = mutableClassDefBy("Lhcz;")
    val geometry = timebar.methods.single { it.toString() == "Lhcw;->fr()V" }
    val selectPainter = painter.methods.single { it.toString() == "Lhda;->a(Ljava/lang/Object;)V" }
    val bufferFlag = model.fields.single { it.name == "o" && it.type == "Z" }
    val modelField = timebarBase.fields.single { it.name == "L" && it.type == "Lahwp;" }
    val liveWindow = model.methods.single { it.toString() == "Lahwk;->p()Z" }
    val scrubbing = timebarBase.methods.single { it.toString() == "Lahwi;->ft()Z" }
    val painterState = painter.fields.single { it.type == drawState.type }
    val painterStyle = drawState.fields.single { it.type == paintState.type }
    val painterAnimator = paintState.fields.single { it.name == "j" && it.type == animator.superclass }
    val animatorView = animator.fields.single { it.type == timebar.type }

    fun MutableMethod.bufferFlagReads() = implementation!!.instructions.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.IGET_BOOLEAN &&
            instruction.getReference<FieldReference>()?.toString() == bufferFlag.toString()
    }

    val geometryRead = geometry.bufferFlagReads().singleOrNull() ?: return null
    val painterReads = selectPainter.bufferFlagReads()
    val geometryCode = geometry.implementation!!.instructions
    val painterCode = selectPainter.implementation!!.instructions
    if (timebar.superclass != "Lhcm;" || mutableClassDefBy("Lhcm;").superclass != timebarBase.type ||
        painterReads.size != 3 || painterReads.any { painterCode[it.index + 1].opcode != Opcode.IF_EQZ } ||
        geometryCode.none { it.calls("Lahwi;->fx()J") } || geometryCode.none { it.calls("Lahwi;->fy()J") } ||
        !geometryCode[geometryRead.index - 1].loadsField("Lhcw;->R:$RECT") ||
        geometryCode[geometryRead.index + 1].opcode != Opcode.IF_EQZ ||
        geometry.implementation!!.registerCount > 16 || selectPainter.implementation!!.registerCount > 16
    ) return null

    val viewGate = makeLegacyBufferGate(timebar.type, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value).apply {
        addInstructions(0, """
            if-nez p1, :done
            invoke-virtual {p0}, $scrubbing
            move-result v0
            if-nez v0, :done
            iget-object v0, p0, $modelField
            instance-of v1, v0, ${model.type}
            if-eqz v1, :done
            check-cast v0, ${model.type}
            invoke-virtual {v0}, $liveWindow
            move-result v0
            if-nez v0, :done
            const v0, 0x7f0b0799
            invoke-static {p0, v0}, $EXTENSION->allowLegacyMiniplayerBuffer(${VIEW}I)Z
            move-result p1
            :done
            return p1
        """)
    }
    val painterGate = makeLegacyBufferGate(painter.type, AccessFlags.PRIVATE.value).apply {
        addInstructions(0, """
            if-nez p1, :done
            iget-object v0, p0, $painterState
            iget-object v0, v0, $painterStyle
            iget-object v0, v0, $painterAnimator
            instance-of v1, v0, ${animator.type}
            if-eqz v1, :done
            check-cast v0, ${animator.type}
            iget-object v0, v0, $animatorView
            invoke-virtual {v0, p1}, $viewGate
            move-result p1
            :done
            return p1
        """)
    }

    return {
        timebar.methods.add(viewGate)
        painter.methods.add(painterGate)
        geometry.wrapBufferFlagRead(geometryRead, "virtual", viewGate.toString())
        painterReads.asReversed().forEach { selectPainter.wrapBufferFlagRead(it, "direct", painterGate.toString()) }
    }
}

private fun makeLegacyBufferGate(owner: String, access: Int) = ImmutableMethod(
    owner, LEGACY_BUFFER_GATE, listOf(ImmutableMethodParameter("Z", null, null)), "Z",
    access, null, null, MutableMethodImplementation(4),
).toMutable()

private fun MutableMethod.wrapBufferFlagRead(read: IndexedValue<Instruction>, invoke: String, gate: String) {
    val register = (read.value as TwoRegisterInstruction).registerA
    addInstructions(read.index + 1, """
        invoke-$invoke {p0, v$register}, $gate
        move-result v$register
    """)
}

private fun BytecodePatchContext.prepareHiddenPlayedGradient(layout: BufferedPainterLayout): (() -> Unit)? {
    val paints = "L${layout.paints};"
    val fade = "L${layout.fade};"
    val flat = mutableClassDefBy("L${layout.flat};").methods.single {
        it.parameterTypes == listOf(CANVAS) && it.returnType == "V"
    }
    val chapterClass = mutableClassDefBy("L${layout.playedChapter};")
    val chapterPaint = chapterClass.methods.single {
        it.parameterTypes == listOf("Z") && it.returnType == PAINT
    }
    val flatInstructions = flat.implementation!!.instructions
    val chapterInstructions = chapterPaint.implementation!!.instructions
    val paintField = "$paints->i:$PAINT"
    val flatRange = if (layout.oldFlat) flatInstructions.packedCase(4) ?: return null else flatInstructions.indices
    val flatPaintReads = flatRange.filter { index ->
        flatInstructions[index].loadsField(paintField) && flatInstructions[index + 1].drawsWithPaint(
            (flatInstructions[index] as TwoRegisterInstruction).registerA
        )
    }
    if (flatPaintReads.size != layout.flatPlayedReads) return null

    val chapterRead = chapterInstructions.indices.single { chapterInstructions[it].loadsField(paintField) }
    val chapterPaintOwnerRead = chapterInstructions[chapterRead - 1]
    val paintOwner = chapterPaintOwnerRead.getReference<FieldReference>() ?: return null
    if (paintOwner.name != "c" || paintOwner.type != paints || chapterPaintOwnerRead.opcode != Opcode.IGET_OBJECT) {
        return null
    }
    val drawState = paintOwner.definingClass
    val drawStateClass = mutableClassDefBy(drawState)
    val playedBounds = drawStateClass.fields.single { it.name == (if (layout.oldFlat) "h" else "f") && it.type == RECT }
    val timeline = drawStateClass.fields.single { it.name == "b" }
    val fadeField = chapterInstructions.asSequence()
        .mapNotNull { it.getReference<FieldReference>() }
        .first { it.definingClass == timeline.type && it.type == fade }

    // These are the stock solid-played fallbacks. In particular, do not change the chapter
    // buffer's separate use of paint i or the native gradient, which already has custom colors.
    val target = "$drawState->$PLAYED_PAINT($drawState)$PAINT"
    val patchChapter = chapterPaint.preparePlayedPaintRead(chapterRead, paintOwner, target) ?: return null
    val patchFlat = if (layout.oldFlat) {
        flat.preparePlayedPaintRead(flatPaintReads.single(), paintOwner, target) ?: return null
    } else {
        val stateRegister = layout.flatDrawStateRegister
        if (flatInstructions.none {
                it.loadsField(playedBounds.toString()) && (it as TwoRegisterInstruction).registerB == stateRegister
            }
        ) return null

        val reads = flatPaintReads.map { it to (flatInstructions[it] as TwoRegisterInstruction).registerA }
        val patch: () -> Unit = {
            reads.asReversed().forEach { (index, paintRegister) ->
                flat.replaceInstruction(index, "invoke-static { v$stateRegister }, $target")
                flat.addInstruction(index + 1, "move-result-object v$paintRegister")
            }
        }
        patch
    }

    val playedPaint = ImmutableMethod(
        drawState, PLAYED_PAINT, listOf(ImmutableMethodParameter(drawState, null, null)), PAINT,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, MutableMethodImplementation(5),
    ).toMutable().apply {
        addInstructions(0, """
            iget-object v0, p0, $paintOwner
            iget-object v0, v0, $paintField
            iget-object v1, p0, $timeline
            iget-object v1, v1, $fadeField
            if-eqz v1, :stock
            invoke-virtual {v1}, $fade->c()F
            move-result v2
            const/4 v3, 0x0
            cmpl-float v2, v2, v3
            if-nez v2, :stock
            invoke-static {v1}, $fade->$HIDDEN_PORTRAIT_VIEW($fade)$VIEW
            move-result-object v2
            if-eqz v2, :stock
            iget-object v1, p0, $playedBounds
            invoke-static {v0, v1, v2}, $COLOR_EXTENSION->getHiddenPlayedPaint($PAINT$RECT$VIEW)$PAINT
            move-result-object v0
            :stock
            return-object v0
        """)
    }

    return {
        drawStateClass.methods.add(playedPaint)
        patchChapter()
        patchFlat()
    }
}

private fun MutableMethod.preparePlayedPaintRead(
    index: Int,
    paintOwner: FieldReference,
    target: String,
): (() -> Unit)? {
    val instructions = implementation!!.instructions
    val paint = instructions[index] as TwoRegisterInstruction
    val owner = instructions[index - 1] as? TwoRegisterInstruction ?: return null
    if (!owner.loadsField(paintOwner.toString()) || owner.registerA != paint.registerB ||
        owner.registerA != paint.registerA
    ) return null

    return {
        replaceInstruction(index - 1, "invoke-static { v${owner.registerB} }, $target")
        replaceInstruction(index, "move-result-object v${paint.registerA}")
    }
}

private fun Instruction.loadsField(field: String): Boolean =
    opcode == Opcode.IGET_OBJECT && getReference<FieldReference>()?.toString() == field

private fun Instruction.drawsWithPaint(paintRegister: Int): Boolean = this is FiveRegisterInstruction &&
    when (getReference<MethodReference>()?.toString()) {
        "$CANVAS->drawRect($RECT$PAINT)V" -> registerE == paintRegister
        "$CANVAS->drawRoundRect(Landroid/graphics/RectF;FF$PAINT)V" -> registerG == paintRegister
        else -> false
    }

private fun Instruction.calls(reference: String): Boolean = getReference<MethodReference>()?.toString() == reference

private fun Instruction.hasLiteral(value: Int): Boolean = (this as? NarrowLiteralInstruction)?.narrowLiteral == value

private fun List<Instruction>.packedCase(selector: Int): IntRange? {
    val switch = indices.singleOrNull { this[it].opcode == Opcode.PACKED_SWITCH } ?: return null
    val addresses = IntArray(size)
    for (index in 1 until size) addresses[index] = addresses[index - 1] + this[index - 1].codeUnits

    val payloadAddress = addresses[switch] + (this[switch] as OffsetInstruction).codeOffset
    val payloadIndex = addresses.binarySearch(payloadAddress)
    val payload = getOrNull(payloadIndex) as? SwitchPayload ?: return null
    val targetAddress = addresses[switch] + (payload.switchElements.singleOrNull { it.key == selector }
        ?: return null).offset
    val start = addresses.binarySearch(targetAddress)
    if (start < 0) return null

    val next = payload.switchElements.asSequence().map { addresses[switch] + it.offset }
        .filter { it > targetAddress }.minOrNull() ?: payloadAddress
    return start until addresses.binarySearch(next)
}

private fun List<Instruction>.flatBufferCase(): IntRange? {
    // Selector 1 is a direct conditional on the newer flat delegate, not a packed switch.
    val branch = (1 until minOf(6, size)).singleOrNull {
        this[it].opcode == Opcode.IF_EQ && this[it - 1].hasLiteral(1)
    } ?: return null
    val address = take(branch).sumOf { it.codeUnits } + (this[branch] as OffsetInstruction).codeOffset
    var current = 0
    val start = indices.firstOrNull {
        val matches = current == address
        current += this[it].codeUnits
        matches
    } ?: return null
    val end = (start until size).firstOrNull { this[it].opcode == Opcode.RETURN_VOID } ?: return null
    return start..end
}

private fun List<Instruction>.isBufferedPaintRange(range: IntRange, paints: String): Boolean =
    range.any { this[it].calls(RECT_SET) } &&
        range.any { this[it].calls("$PAINT->getAlpha()I") } &&
        range.any { this[it].calls("$PAINT->setAlpha(I)V") } &&
        range.any { this[it].getReference<FieldReference>()?.toString() == "$paints->c:$PAINT" } &&
        range.any { this[it].getReference<FieldReference>()?.toString() == "$paints->d:$PAINT" }

private fun Instruction.isOneArgInvoke(expected: Opcode): Boolean =
    opcode == expected && this is FiveRegisterInstruction && registerCount == 1

private fun MutableMethod.replaceInvoke(index: Int, target: String, direct: Boolean = false) {
    val original = implementation!!.instructions[index] as FiveRegisterInstruction
    val invoke = if (direct) "invoke-direct" else "invoke-static"
    replaceInstruction(index, "$invoke {v${original.registerC}}, $target")
}
