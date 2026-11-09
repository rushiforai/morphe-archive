package semicoloncolonel.mobilestream.patches.appletv.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import semicoloncolonel.mobilestream.patches.appletv.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// Apple TV phone app 3.0.0. The app's core builds each page and episode list
// as JSON and hands it to the screens: pages through
// ServiceInterface.getValue(BridgeDocumentResult), and episode lists through
// the decoder of EpisodeCollectionInterface.onEpisodeCollectionRequest. Both
// are passed through ReleaseTimes.filter first, which writes the exact
// release day and time of upcoming titles, in the device's time zone, where
// the app shows only a day or "Coming Soon". See ReleaseTimes for details.

private const val TIMES = "Lsemicoloncolonel/mobilestream/extension/appletv/ReleaseTimes;"

internal object DocumentValueFingerprint : Fingerprint(
    definingClass = "Lcom/apple/android/tv/model/javascriptbridge/ServiceInterface;",
    name = "getValue",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Lcom/apple/android/tv/tvappservices/bindings/BridgeDocumentResult;"),
)

internal object TimeFormatFingerprint : Fingerprint(
    definingClass = TIMES,
    name = "timeFormat",
    returnType = "Ljava/lang/String;",
)

internal object EpisodeListDecodeFingerprint : Fingerprint(
    definingClass = "Lcom/apple/android/tv/model/javascriptbridge/EpisodeCollectionInterface\$onEpisodeCollectionRequest\$2\$decoded\$1;",
    name = "<init>",
)

@Suppress("unused")
val releaseTimesPatch = bytecodePatch(
    name = "Show release times",
    description = "Shows the time in your time zone when an upcoming episode or title is released.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    val timeFormat by stringOption(
        key = "timeFormat",
        default = "device",
        values = mapOf("Device setting" to "device", "12-hour" to "12", "24-hour" to "24"),
        title = "Time format",
        description = "Shows times in 12-hour or 24-hour format, or as the device is set.",
        required = true,
    ) { it == "device" || it == "12" || it == "24" }

    execute {
        // The Android TV app has none of these classes.
        val value = DocumentValueFingerprint.methodOrNull ?: return@execute

        value.apply {
            val returns = instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }.map { it.index }.reversed()
            returns.forEach { index ->
                val register = getInstruction<OneRegisterInstruction>(index).registerA
                addInstructions(
                    index,
                    """
                        invoke-static/range { v$register .. v$register }, $TIMES->filter(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v$register
                    """,
                )
            }
        }

        TimeFormatFingerprint.method.returnEarly(
            "const-string v0, \"${timeFormat ?: "device"}\"\nreturn-object v0",
        )

        // decoded$1(String json, Continuation): filter the JSON on the way in.
        EpisodeListDecodeFingerprint.methodOrNull?.takeIf {
            it.parameterTypes.firstOrNull()?.toString() == "Ljava/lang/String;"
        }?.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $TIMES->filter(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p1
            """,
        )
    }
}
