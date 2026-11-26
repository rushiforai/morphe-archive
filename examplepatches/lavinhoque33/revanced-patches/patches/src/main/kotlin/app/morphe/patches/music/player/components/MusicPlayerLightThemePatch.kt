/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-25
 */

package app.morphe.patches.music.player.components

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.music.utils.extension.Constants.EXTENSION_PATH
import app.morphe.patches.music.utils.extension.Constants.PLAYER_CLASS_DESCRIPTOR
import app.morphe.patches.music.utils.extension.sharedExtensionPatch
import app.morphe.patches.music.utils.playservice.is_8_12_or_greater
import app.morphe.patches.music.utils.playservice.is_8_51_or_greater
import app.morphe.patches.music.utils.playservice.is_9_39_or_greater
import app.morphe.patches.music.utils.playservice.versionCheckPatch
import app.morphe.patches.music.utils.resourceid.sharedResourceIdPatch
import app.morphe.util.cloneMutableAndPreserveParameters
import app.morphe.util.findInstructionIndicesReversed
import app.morphe.util.findMutableClassOrThrow
import app.morphe.util.fingerprint.matchOrThrow
import app.morphe.util.fingerprint.mutableClassOrThrow
import app.morphe.util.fingerprint.resolvable
import app.morphe.util.getWalkerMethod
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val PALETTE = "$EXTENSION_PATH/patches/player/MusicPlayerLightTheme;"
private const val BACKDROP_PAINTER = "$EXTENSION_PATH/patches/player/MusicPlayerLightTheme\$BackdropPainter;"
private const val WATCH = "Lcom/google/android/apps/youtube/music/watchpage/"
private const val PILL = "Lcom/google/android/apps/youtube/music/player/audiovideoswitcher/ui/" +
        "AudioVideoSwitcherToggleView;"
private const val TINT = "Landroid/content/res/ColorStateList;"
private const val DRAWABLE = "Landroid/graphics/drawable/Drawable;"
private const val GRADIENT = "Landroid/graphics/drawable/GradientDrawable;"
private const val BITMAP = "Landroid/graphics/Bitmap;"
private const val ARTWORK_VIEW = "Lcom/google/android/apps/youtube/music/ui/image/AutoCropImageView;"
private const val ARTWORK_CLEAR = "$ARTWORK_VIEW->setImageDrawable($DRAWABLE)V"
private const val ARTWORK_BIND = "$ARTWORK_VIEW->setImageBitmap($BITMAP)V"

private object PlayerArtworkBindFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(BITMAP),
    filters = listOf(
        methodCall(definingClass = ARTWORK_VIEW, name = "setImageDrawable", parameters = listOf(DRAWABLE)),
        methodCall(definingClass = ARTWORK_VIEW, name = "setImageBitmap", parameters = listOf(BITMAP)),
    ),
)

/** Theme can install this without installing the optional Player components settings or behavior. */
internal val musicPlayerLightThemePatch = bytecodePatch(
    description = "Music player light palette hooks",
) {
    dependsOn(sharedExtensionPatch, sharedResourceIdPatch, versionCheckPatch)

    lateinit var painter: MutableMethod

    execute {
        // Forced Music 6.20 is dark-only. Leave its existing Player components hooks alone.
        if (!is_8_12_or_greater) return@execute

        painter = if (is_8_51_or_greater) {
            ModernPlayerBackgroundFingerprint.method
        } else {
            switchToggleColorFingerprint.matchOrThrow(miniPlayerConstructorFingerprint).method.let { callback ->
                callback.getWalkerMethod(callback.indexOfFirstInstructionOrThrow(Opcode.INVOKE_DIRECT))
            }
        }

        if (audioVideoSwitchToggleFingerprint.resolvable()) {
            audioVideoSwitchToggleFingerprint.mutableClassOrThrow().methods.forEach { method ->
                method.rewriteCalls("$PILL->setAlpha(F)V", "setPillAlpha(Landroid/view/View;F)V")
            }
        }

        val pill = findMutableClassOrThrow(PILL)
        pill.methods.forEach { method ->
            method.rewriteCalls(
                "Landroid/widget/ImageView;->setImageTintList($TINT)V",
                "setPillImageTint(Landroid/widget/ImageView;$TINT)V",
            )
        }
        // The same native class is shared with the video overlay. Pass the owner at the stock
        // selector binding, not in onDraw, to leave the media overlay and animation alone.
        pill.methods.single { it.name == "onLayout" }.apply {
            val bounds = indexOfFirstInstructionOrThrow {
                getReference<MethodReference>()?.toString() == "$DRAWABLE->setBounds(Landroid/graphics/Rect;)V"
            }
            val call = getInstruction<FiveRegisterInstruction>(bounds)
            // Modern natives overwrite p0 with the Rect move-result. Bind while p0 is still the View.
            addInstruction(
                bounds - 2,
                "invoke-static {p0, v${call.registerC}}, " +
                        "$PALETTE->bindPillSelector(Landroid/view/View;$DRAWABLE)V",
            )
        }
    }

    finalize {
        if (is_8_12_or_greater) {
            // Keep the stock fingerprints intact until Player Components and Jam resolve their hooks.
            painter.hookLightBackdrop()
            PlayerArtworkBindFingerprint.method.hookArtworkBind()
            painter.hookMiniplayerDefault()
            painter.hookLightTitleChevron()
            hookMusicPlayerLightLike()
            if (is_9_39_or_greater) findMutableClassOrThrow(PILL).hookLightPillColors()

            val timeBar = findMutableClassOrThrow("${WATCH}MusicPlaybackControlsTimeBar;")
            timeBar.methods.forEach { method ->
                method.rewriteCalls(
                    "Landroid/graphics/Paint;->setColor(I)V",
                    "setSeekColor(Landroid/graphics/Paint;I)V",
                )
            }
        }
    }
}

context(_: BytecodePatchContext)
private fun MutableMethod.hookMiniplayerDefault() {
    val presenter = findMutableClassOrThrow(definingClass)
    val painter = this
    // The no-palette path sends the same constructor default to both gradient stops and to the
    // collapsed-player animator. Hook that field's initial value, not any later album assignment.
    val defaultField = presenter.methods.filter { it.parameters.isEmpty() && it.returnType == "V" }
        .mapNotNull { method ->
            val instructions = method.implementation?.instructions ?: return@mapNotNull null
            val callIndex = instructions.indexOfFirst {
                val call = it as? FiveRegisterInstruction
                it.opcode == Opcode.INVOKE_DIRECT && call?.registerD == call?.registerE &&
                        it.getReference<MethodReference>()?.toString() == painter.toString()
            }
            if (callIndex < 0) return@mapNotNull null
            val call = instructions.elementAt(callIndex) as FiveRegisterInstruction
            instructions.take(callIndex).lastOrNull {
                it.opcode == Opcode.IGET && (it as TwoRegisterInstruction).registerA == call.registerD
            }?.getReference<FieldReference>()
        }.distinct().singleOrNull() ?: throw PatchException("Could not resolve the Music miniplayer default color")

    val constructor = presenter.methods.single { method ->
        method.name == "<init>" && method.implementation?.instructions?.any {
            it.opcode == Opcode.IPUT && it.getReference<FieldReference>() == defaultField
        } == true
    }
    val assign = constructor.indexOfFirstInstructionOrThrow {
        opcode == Opcode.IPUT && getReference<FieldReference>() == defaultField
    }
    val register = constructor.getInstruction<TwoRegisterInstruction>(assign).registerA
    if (is_9_39_or_greater) constructor.hookFloatingMiniplayer(assign)
    constructor.addInstructions(
        assign,
        """
            invoke-static {v$register}, $PALETTE->miniplayerDefault(I)I
            move-result v$register
        """,
    )
}

context(_: BytecodePatchContext)
private fun MutableMethod.hookFloatingMiniplayer(defaultAssign: Int) {
    val instructions = implementation!!.instructions.drop(defaultAssign + 1)
    val face = instructions.firstNotNullOf { instruction ->
        instruction.getReference<FieldReference>()?.takeIf {
            instruction.opcode == Opcode.IPUT_OBJECT && it.type == GRADIENT && it.definingClass == definingClass
        }
    }
    // The animator takes the presenter in its constructor, then writes its isolated floating-card face.
    val paint = instructions.mapNotNull { instruction ->
        instruction.getReference<MethodReference>()?.takeIf {
            it.name == "<init>" && it.parameterTypes.singleOrNull()?.toString() == definingClass
        }?.definingClass
    }.distinct().flatMap { animator ->
        findMutableClassOrThrow(animator).methods.filter { method ->
            method.parameters.singleOrNull()?.type == "I" && method.returnType == "V" &&
                    method.implementation?.instructions?.any {
                        it.opcode == Opcode.IGET_OBJECT && it.getReference<FieldReference>() == face
                    } == true
        }
    }.single()
    if (paint.rewriteCalls("$GRADIENT->setColor(I)V", "setFloatingMiniplayerColor(${GRADIENT}I)V") != 1) {
        throw PatchException("Could not resolve the Music floating miniplayer color")
    }
}

context(_: BytecodePatchContext)
private fun MutableMethod.hookLightTitleChevron() {
    val presenter = findMutableClassOrThrow(definingClass)
    val title = "Lcom/google/android/libraries/youtube/common/ui/YouTubeTextView;"
    val binders = presenter.methods.filter { method ->
        method.parameterTypes.isEmpty() && method.returnType == "V" &&
                method.implementation?.instructions?.any {
                    it.getReference<MethodReference>()?.toString() ==
                            "$title->setCompoundDrawablesRelativeWithIntrinsicBounds(IIII)V"
                } == true
    }
    // The 8.x presenter has no related-page compound chevron.
    if (binders.isEmpty()) return
    if (binders.single().rewriteCalls("$DRAWABLE->setTint(I)V", "setTitleChevronTint(${DRAWABLE}I)V") != 1) {
        throw PatchException("Could not resolve the Music player title chevron tint")
    }
}

private fun MutableClass.hookLightPillColors() {
    val update = methods.single { method ->
        method.parameterTypes.isEmpty() && method.returnType == "V" &&
                method.implementation?.instructions?.any { it.isPillColorAnimation() } == true
    }.cloneMutableAndPreserveParameters(this)
    val calls = update.findInstructionIndicesReversed { isPillColorAnimation() }
    if (calls.size != 2) throw PatchException("Could not resolve the Music Song/Video pill paints")

    // Native order is face, then selector. Keep the receiver live when stock reuses its
    // original register for the selector color.
    for ((step, index) in calls.withIndex()) {
        val call = update.getInstruction<FiveRegisterInstruction>(index)
        val ref = call.getReference<MethodReference>()
        val color = call.registerD
        val override = if (step == 0) "pillSelectionColor" else "pillFaceColor"
        update.addInstructions(
            index + 1,
            """
                move-result v$color
                invoke-virtual {v${call.registerC}, v$color, v${call.registerE}, v${call.registerF}}, $ref
            """,
        )
        // Replace the original call so branches to that instruction also run the color hook.
        update.replaceInstruction(
            index,
            "invoke-static {p0, v$color}, $PALETTE->$override(Landroid/view/View;I)I",
        )
    }
}

private fun Instruction.isPillColorAnimation() =
    opcode == Opcode.INVOKE_VIRTUAL && getReference<MethodReference>()?.let { ref ->
        ref.returnType == "V" && ref.parameterTypes.size == 2 &&
                ref.parameterTypes[0] == "I" && ref.parameterTypes[1] == "J"
    } == true

context(_: BytecodePatchContext)
private fun MutableMethod.hookLightBackdrop() {
    val watchLayout = bindBackdropPainter()
    val stockGuard = getInstruction<BuilderOffsetInstruction>(1)
    val paintStart = getInstruction<Instruction>(stockGuard.target.location.index)

    // Only the first two-stop array is the page background. Later arrays are native media scrims.
    val array = indexOfFirstInstructionOrThrow(Opcode.FILLED_NEW_ARRAY)
    val result = getInstruction<OneRegisterInstruction>(array + 1).registerA
    val watchRegister = if (result == 0) 1 else 2
    val stockHookIndex = array + 2
    val hook = getInstruction(stockHookIndex).getReference<MethodReference>()
    val afterOptions = hook?.toString() == "$PLAYER_CLASS_DESCRIPTOR->changePlayerBackgroundColor([I)[I"
    addInstructions(
        if (afterOptions) stockHookIndex + 2 else stockHookIndex,
        """
            iget-object v$watchRegister, p0, $watchLayout
            invoke-static {v$result, v$watchRegister, p1, p2}, $PALETTE->paintBackdrop([ILandroid/view/View;II)[I
            move-result-object v$result
        """,
    )

    // Artwork can change while the native no-palette input stays identical. Skip just the
    // native equality check during the synchronous repaint requested by the thumbnail binder.
    addInstructionsWithLabels(
        0,
        """
            iget-object v0, p0, $watchLayout
            invoke-static {v0}, $PALETTE->refreshingArtwork(Landroid/view/View;)Z
            move-result v0
            if-nez v0, :paint
        """,
        ExternalLabel("paint", paintStart),
    )

    // These independent paints use the stock secondary scalar, not the gradient array above.
    if (rewriteCalls(
            "Landroid/widget/ImageView;->setImageTintList($TINT)V",
            "setPlayPauseTint(Landroid/widget/ImageView;$TINT)V",
        ) != 1 || rewriteCalls(
            "Landroid/view/View;->setBackground($DRAWABLE)V",
            "setPageBackground(Landroid/view/View;$DRAWABLE)V",
        ) != 1
    ) {
        throw PatchException("Could not resolve the independent Music player paints")
    }
}

context(_: BytecodePatchContext)
private fun MutableMethod.bindBackdropPainter(): FieldReference {
    val presenter = findMutableClassOrThrow(definingClass)
    val constructor = presenter.methods.single { method ->
        method.name == "<init>" && method.parameterTypes.firstOrNull()?.endsWith("WatchWhileLayout;") == true
    }
    val watchType = constructor.parameterTypes.first()
    val assign = constructor.indexOfFirstInstructionOrThrow {
        opcode == Opcode.IPUT_OBJECT && getReference<FieldReference>()?.let {
            it.definingClass == presenter.type && it.type == watchType
        } == true
    }
    val store = constructor.getInstruction<TwoRegisterInstruction>(assign)
    val field = constructor.getInstruction(assign).getReference<FieldReference>()!!
    val painter = this

    presenter.interfaces.add(BACKDROP_PAINTER)
    presenter.methods.add(
        ImmutableMethod(
            presenter.type, "rvxRepaintArtwork",
            listOf("I", "I", "J").map { ImmutableMethodParameter(it, null, null) },
            "V", AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null, MutableMethodImplementation(5),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                    invoke-direct {p0, p1, p2, p3, p4}, $painter
                    return-void
                """,
            )
        },
    )
    constructor.addInstruction(
        assign + 1,
        "invoke-static {v${store.registerA}, v${store.registerB}}, " +
                "$PALETTE->bindBackdrop(Landroid/view/View;$BACKDROP_PAINTER)V",
    )
    return field
}

private fun MutableMethod.hookArtworkBind() {
    val sites = findInstructionIndicesReversed {
        val call = getReference<MethodReference>()?.toString()
        opcode == Opcode.INVOKE_VIRTUAL && (call == ARTWORK_CLEAR || call == ARTWORK_BIND)
    }
    if (sites.size != 2) throw PatchException("Could not resolve Music's thumbnail clear and bind")

    for (index in sites) {
        val call = getInstruction<FiveRegisterInstruction>(index)
        addInstruction(
            index,
            "invoke-static {v${call.registerC}, v${call.registerD}}, " +
                    "$PALETTE->bindArtwork(Landroid/view/View;$BITMAP)V",
        )
    }
}

private fun MutableMethod.rewriteCalls(stock: String, replacement: String): Int {
    val calls = findInstructionIndicesReversed {
        opcode == Opcode.INVOKE_VIRTUAL && getReference<MethodReference>()?.toString() == stock
    }
    for (index in calls) {
        val call = getInstruction<FiveRegisterInstruction>(index)
        replaceInstruction(index, "invoke-static {v${call.registerC}, v${call.registerD}}, $PALETTE->$replacement")
    }
    return calls.size
}
