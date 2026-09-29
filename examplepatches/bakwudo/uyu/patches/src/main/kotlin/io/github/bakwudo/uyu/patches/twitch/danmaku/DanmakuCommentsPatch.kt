package io.github.bakwudo.uyu.patches.twitch.danmaku

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import io.github.bakwudo.uyu.patches.twitch.settings.setPatchIncluded
import io.github.bakwudo.uyu.patches.twitch.settings.settingsPatch
import io.github.bakwudo.uyu.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.bakwudo.uyu.patches.twitch.shared.EXTENSION_PACKAGE
import io.github.bakwudo.uyu.patches.twitch.theatre.nativeTheatrePatch
import io.github.bakwudo.uyu.patches.util.addInstructionsAtControlFlowLabel
import io.github.bakwudo.uyu.patches.util.instanceField
import io.github.bakwudo.uyu.patches.util.replaceMethodBody

internal const val DANMAKU_EXTENSION_PACKAGE = "$EXTENSION_PACKAGE/danmaku"
internal const val DANMAKU_EXTENSION_CLASS = "$DANMAKU_EXTENSION_PACKAGE/DanmakuPatch;"
private const val VIEW_DELEGATES_CLASS = "$DANMAKU_EXTENSION_PACKAGE/ViewDelegates;"

private const val BASE_VIEW_DELEGATE = "Ltv/twitch/android/core/mvp/viewdelegate/BaseViewDelegate;"
internal const val RX_VIEW_DELEGATE = "Ltv/twitch/android/core/mvp/viewdelegate/RxViewDelegate;"
private const val PLAYER_STATE_HELPER = "uyuReportPlayerState"

@Suppress("unused")
val danmakuCommentsPatch = bytecodePatch(
    name = "Danmaku comments",
    description = "Adds an option to scroll chat messages across the video on live streams, " +
        "Niconico style, in landscape fullscreen and optionally in portrait, the mini player and " +
        "picture in picture. A button in the player turns it on and off, and the rows, speed, " +
        "number of comments, font and colors can be changed in the uyu settings. An option " +
        "hides Twitch's chat in landscape so the stream fills the screen. Streams open in Twitch's " +
        "native player instead of the new React Native one, which this relies on.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)

    dependsOn(settingsPatch, nativeTheatrePatch)

    execute {
        setPatchIncluded("danmakuComments")
        hookChatMessages()
        hookTheatre()
        hookPlayerState()
        hookLandscapeChat()
    }
}

/**
 * Adds the danmaku overlay to each live theatre once its views are created.
 */
private fun BytecodePatchContext.hookTheatre() {
    val rootField = classDefBy(BASE_VIEW_DELEGATE).instanceField("Landroid/view/View;")
    replaceMethodBody(VIEW_DELEGATES_CLASS, "rootView", 2, fieldGetter(BASE_VIEW_DELEGATE, rootField))

    TheatreViewDelegateConstructorFingerprint.method.apply {
        val returnIndices = instructions.indices.filter { instructions[it].opcode == Opcode.RETURN_VOID }
        if (returnIndices.isEmpty()) throw PatchException("Theatre view delegate constructor has no return.")
        returnIndices.asReversed().forEach { index ->
            addInstructionsAtControlFlowLabel(
                index,
                "invoke-static/range { p0 .. p0 }, $DANMAKU_EXTENSION_CLASS->onTheatreCreated(Ljava/lang/Object;)V",
            )
        }
    }
}

/**
 * Reports the player's state (playing, paused, ...) whenever the player presenter updates the
 * state it shows, so comments stop while the stream is paused.
 */
private fun BytecodePatchContext.hookPlayerState() {
    val presenter = PlayerStateUpdateFingerprint.classDef

    // The player, an interface with getState() returning the state enum.
    var getState: String? = null
    val playerField = presenter.fields.singleOrNull { field ->
        if (AccessFlags.STATIC.isSet(field.accessFlags)) return@singleOrNull false
        val type = classDefByOrNull(field.type) ?: return@singleOrNull false
        if (!AccessFlags.INTERFACE.isSet(type.accessFlags)) return@singleOrNull false
        val method = type.methods.singleOrNull { it.name == "getState" && it.parameterTypes.isEmpty() }
            ?: return@singleOrNull false
        val isEnum = classDefByOrNull(method.returnType)?.superclass == "Ljava/lang/Enum;"
        if (isEnum) getState = "${field.type}->getState()${method.returnType}"
        isEnum
    } ?: throw PatchException("Player field not found in the player presenter.")

    // The player's view delegate.
    val viewField = presenter.fields.singleOrNull { field ->
        !AccessFlags.STATIC.isSet(field.accessFlags) &&
            classDefByOrNull(field.type)?.superclass == RX_VIEW_DELEGATE
    } ?: throw PatchException("Player view delegate field not found in the player presenter.")

    presenter.methods.add(
        ImmutableMethod(
            presenter.type,
            PLAYER_STATE_HELPER,
            listOf(ImmutableMethodParameter(presenter.type, null, null)),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(3),
        ).toMutable().apply {
            addInstructionsWithLabels(
                0,
                """
                    iget-object v0, p0, ${fieldSmali(presenter.type, playerField)}
                    if-eqz v0, :done
                    invoke-interface { v0 }, $getState
                    move-result-object v0
                    iget-object v1, p0, ${fieldSmali(presenter.type, viewField)}
                    invoke-static { v1, v0 }, $DANMAKU_EXTENSION_CLASS->onPlayerStateChanged(Ljava/lang/Object;Ljava/lang/Enum;)V
                    :done
                    return-void
                """,
            )
        },
    )

    PlayerStateUpdateFingerprint.method.addInstruction(
        0,
        "invoke-static/range { p0 .. p0 }, ${presenter.type}->$PLAYER_STATE_HELPER(${presenter.type})V",
    )
}

private fun fieldSmali(definingClass: String, field: FieldReference) =
    "$definingClass->${field.name}:${field.type}"

/**
 * Code for a stub with one parameter that returns [field] of its argument if the argument is a
 * [type], and null (or -1 for an int) otherwise. Needs 2 registers.
 */
internal fun fieldGetter(type: String, field: FieldReference): String {
    val isInt = field.type == "I"
    val get = if (isInt) "iget" else "iget-object"
    val ret = if (isInt) "return" else "return-object"
    return """
        instance-of v0, p0, $type
        if-eqz v0, :none
        check-cast p0, $type
        $get v0, p0, $type->${field.name}:${field.type}
        $ret v0
        :none
        const/4 v0, ${if (isInt) "-0x1" else "0x0"}
        $ret v0
    """
}
