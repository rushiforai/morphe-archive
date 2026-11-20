package app.keyboardspeed.patches.youtube.captions

import app.keyboardspeed.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/keyboardspeed/extension/MonitorCaptionSizePatch;"

/**
 * The extension class of the Morphe YouTube patches that applies the caption size setting of Morphe.
 */
private const val MORPHE_CAPTION_SCALE_CLASS = "Lapp/morphe/extension/youtube/patches/CaptionViewportPatch;"

/**
 * Sets the font size of the captions, which all caption renderers of the app use.
 */
internal object CaptionWindowFontSizeFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/libraries/youtube/player/subtitles/ui/SubtitleWindowView;",
    returnType = "V",
    parameters = listOf("F"),
    filters = listOf(
        methodCall(smali = "Ljava/lang/Math;->abs(F)F"),
        fieldAccess(opcode = Opcode.IPUT, definingClass = "this", type = "F"),
    ),
)

private val captionSizes = mapOf(
    "50%" to 50,
    "60%" to 60,
    "67%" to 67,
    "75%" to 75,
    "80%" to 80,
    "90%" to 90,
    "100%" to 100,
    "110%" to 110,
    "125%" to 125,
    "150%" to 150,
)

@Suppress("unused")
val monitorCaptionSizePatch = bytecodePatch(
    name = "Monitor caption size",
    description = "Sets the caption size by the screen the app is on: one size on the screen of the phone, " +
        "another on a monitor, such as with Samsung DeX or a USB-C dock. " +
        "Replaces the caption size setting of Morphe.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    extendWith("extensions/extension.mpe")

    val phoneCaptionSize by intOption(
        key = "phoneCaptionSize",
        default = 100,
        values = captionSizes,
        title = "Caption size on the phone",
        description = "Size of the captions on the screen of the phone, in percent of the caption size of the app, " +
            "like the caption size setting of Morphe.",
        required = true,
    ) { it != null && it in 10..300 }

    val monitorCaptionSize by intOption(
        key = "monitorCaptionSize",
        default = 75,
        values = captionSizes,
        title = "Caption size on a monitor",
        description = "Size of the captions on a monitor, in percent of the caption size of the app, " +
            "like the caption size setting of Morphe.",
        required = true,
    ) { it != null && it in 10..300 }

    lateinit var fontSizeMethod: MutableMethod

    execute {
        fontSizeMethod = CaptionWindowFontSizeFingerprint.method
        fontSizeMethod.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->scaleFontSize(F)F
                move-result p1
            """,
        )

        mapOf(
            "getPhoneCaptionSize" to phoneCaptionSize!!,
            "getMonitorCaptionSize" to monitorCaptionSize!!,
        ).forEach { (name, value) ->
            mutableClassDefBy(EXTENSION_CLASS).methods.first { it.name == name }.addInstructions(
                0,
                """
                    const/16 v0, $value
                    return v0
                """,
            )
        }
    }

    // The Morphe YouTube patches can be executed after this patch.
    finalize {
        // If Morphe scales the same font size with its caption size setting, the extension divides that scale out.
        val morpheScales = fontSizeMethod.instructions.any { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass ==
                MORPHE_CAPTION_SCALE_CLASS
        }
        mutableClassDefBy(EXTENSION_CLASS).methods.first { it.name == "isMorpheCaptionScaleApplied" }.addInstructions(
            0,
            """
                const/4 v0, ${if (morpheScales) "0x1" else "0x0"}
                return v0
            """,
        )
    }
}
