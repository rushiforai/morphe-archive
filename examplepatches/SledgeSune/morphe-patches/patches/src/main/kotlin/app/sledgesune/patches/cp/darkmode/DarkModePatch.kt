package app.sledgesune.patches.cp.darkmode

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import app.sledgesune.patches.shared.Constants.COMPATIBILITY_CP
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/sledgesune/extension/cp/DarkModePatch;"

/** Flutter's `FlutterActivityLaunchConfigs.BackgroundMode` value: 1 = opaque, 2 = transparent. */
private const val RENDER_MODE_TEXTURE = 2

/**
 * `FlutterFragmentActivity.getBackgroundMode()` (obfuscated, e.g. `Lq5/k;->i()I` in 2.3.0).
 * Flutter's embedding classes are obfuscated in this app, but keep their strings.
 */
private object BackgroundModeFingerprint : Fingerprint(
    returnType = "I",
    parameters = listOf(),
    filters = listOf(
        string("background_mode"),
        string("No enum constant io.flutter.embedding.android.FlutterActivityLaunchConfigs.BackgroundMode."),
    ),
)

/** `FlutterFragmentActivity.onCreate(Bundle)`, which picks how the Flutter view is drawn. */
private object FlutterActivityOnCreateFingerprint : Fingerprint(
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        string("cached_engine_id"),
        string("Could not instantiate FlutterFragment subclass ("),
    ),
)

/**
 * Flutter's `PlatformChannel.decodeSystemUiOverlayStyle(JSONObject)`
 * (obfuscated, e.g. `Ls2/F;->e(Ls2/F;Lorg/json/JSONObject;)La3/a;` in 2.3.0): the app's status and navigation
 * bar colours and icon brightness.
 */
private object SystemUiOverlayStyleFingerprint : Fingerprint(
    filters = listOf(
        string("statusBarIconBrightness"),
        string("systemNavigationBarIconBrightness"),
    ),
    custom = { method, _ -> method.parameterTypes.any { it.toString() == "Lorg/json/JSONObject;" } },
)

/** Extension stub; the patch writes the chosen mode (0 = auto, 1 = always dark, 2 = off/light). */
private object ModeStubFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS,
    name = "mode",
    returnType = "I",
    parameters = listOf(),
)

@Suppress("unused")
val darkModePatch = patch(
    name = "Dark mode",
    description = "Darkens the app by inverting its colours (hues are kept). Choose Auto (follow the phone), " +
        "Always dark, or Off. Note: brand colours look lighter, and photos and QR codes are inverted too.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CP)

    extendWith("extensions/extension.mpe")

    val mode by stringOption(
        key = "mode",
        default = "auto",
        values = mapOf(
            "Auto (follow phone)" to "auto",
            "Always dark" to "dark",
            "Off (always light)" to "light",
        ),
        title = "Mode",
        description = "Auto follows your phone's light/dark setting (so you can switch to light quickly, " +
            "e.g. to show a ticket QR code). Always dark ignores the phone; Off disables dark mode.",
        required = true,
    )

    execute {
        val modeValue = when (mode) {
            "dark" -> 1
            "light" -> 2
            else -> 0
        }
        ModeStubFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, $modeValue
                return v0
            """,
        )

        val backgroundMode = BackgroundModeFingerprint.method

        FlutterActivityOnCreateFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()

            // onCreate asks for the background mode three times: window setup, transparency mode, render mode.
            // The last answer becomes the render mode. Make it "texture" (a TextureView, which a colour
            // filter can reach) instead of "surface" (a SurfaceView, composited outside the app's window).
            val calls = instructions.indices.filter { index ->
                val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
                instructions[index].opcode == Opcode.INVOKE_VIRTUAL &&
                    reference?.name == backgroundMode.name &&
                    reference.returnType == "I" &&
                    reference.parameterTypes.isEmpty()
            }
            if (calls.size != 3) throw PatchException("Expected 3 background mode calls in onCreate, found ${calls.size}")

            val moveResult = instructions[calls.last() + 1]
            if (moveResult.opcode != Opcode.MOVE_RESULT) {
                throw PatchException("Unexpected instruction after the render mode call: ${moveResult.opcode}")
            }
            val register = (moveResult as OneRegisterInstruction).registerA
            addInstruction(calls.last() + 2, "const/16 v$register, $RENDER_MODE_TEXTURE")

            // `this` is the last-but-one register (onCreate has one parameter).
            val thisRegister = implementation!!.registerCount - 2
            addInstruction(0, "invoke-static/range { v$thisRegister .. v$thisRegister }, $EXTENSION_CLASS->onActivityCreate(Landroid/app/Activity;)V")
        }

        SystemUiOverlayStyleFingerprint.method.apply {
            // Parameters sit in the last registers; `this` comes first for instance methods.
            fun size(type: CharSequence) = if (type.toString() == "J" || type.toString() == "D") 2 else 1
            val isStatic = accessFlags and AccessFlags.STATIC.value != 0
            val thisSize = if (isStatic) 0 else 1
            val firstParameter = implementation!!.registerCount - thisSize - parameterTypes.sumOf { size(it) }
            val jsonIndex = parameterTypes.indexOfFirst { it.toString() == "Lorg/json/JSONObject;" }
            val jsonRegister = firstParameter + thisSize + parameterTypes.take(jsonIndex).sumOf { size(it) }
            addInstruction(
                0,
                "invoke-static/range { v$jsonRegister .. v$jsonRegister }, $EXTENSION_CLASS->adjustSystemBars(Lorg/json/JSONObject;)V",
            )
        }
    }
}
