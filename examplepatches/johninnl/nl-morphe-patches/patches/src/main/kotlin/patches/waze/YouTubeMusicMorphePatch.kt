package patches.waze

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import patches.waze.Constants.COMPATIBILITY_WAZE
import patches.waze.returnString
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.smali.ExternalLabel
import patches.waze.EXTENSION_PATH
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

internal const val EXTENSION_CLASS =
    "Lapp/wazeytm/extension/waze/PatchedYouTubeMusicSupportPatch;"

private const val DEFAULT_PACKAGE_NAMES = "app.morphe.android.apps.youtube.music"

@Suppress("unused")
val patchedYouTubeMusicSupportPatch = bytecodePatch(
    name = "YT Music Morphe in Waze",
    description = "Adds YT Music Morphe to Waze's built-in audio player. Show list displays supported " +
        "Home recommendations and mixes, not your personal Library. Available shelves depend on the installed client.",
    default = true
) {
    compatibleWith(COMPATIBILITY_WAZE)

    extendWith(EXTENSION_PATH)

    val packageNames by stringOption(
        key = "packageNames",
        default = DEFAULT_PACKAGE_NAMES,
        title = "Package names",
        description = "Comma separated package names of patched YouTube Music apps. " +
            "Installed repackaged YouTube Music apps are also detected automatically.",
        required = true
    ) { value ->
        value != null && value.split(",").all { name ->
            name.trim().matches(Regex("^[a-zA-Z][\\w]*(\\.[a-zA-Z][\\w]*)+$"))
        }
    }

    val homeShelves by stringOption(
        key = "homeShelfTitles", default = "Mixed for you|Covers and remixes|Long listens",
        title = "Home shelf titles",
        description = "Home section titles separated by |, matching the language used in YT Music. " +
            "Speed dial is always included. Only sections returned by the installed Morphe client are shown.",
        required = true
    ) { value -> value != null && value.length <= 2000 && !value.contains('"') && !value.contains('\\') && value.none { it.code < 32 } }

    execute {
        returnString("Lapp/wazeytm/extension/waze/YouTubeMusicHomePatch;", "getConfiguredShelfTitles", homeShelves!!)
        val sdk = discoverAudioSdk()
        val items = sdk.items
        if (items.implementation!!.registerCount < 2) throw PatchException("Home hook needs a local register")
        items.addInstructionsWithLabels(0, """
            invoke-static/range { p0 .. p0 }, Lapp/wazeytm/extension/waze/YouTubeMusicHomePatch;->getItems(Ljava/lang/Object;)Ljava/util/List;
            move-result-object v0
            if-eqz v0, :original_list
            return-object v0
        """, ExternalLabel("original_list", items.implementation!!.instructions.first()))
        sdk.disconnect.addInstruction(0,
            "invoke-static/range { p0 .. p0 }, Lapp/wazeytm/extension/waze/YouTubeMusicHomePatch;->onDisconnected(Ljava/lang/Object;)V")

        // Clone the server side YouTube Music partner entry for patched package names.
        UpdateAppListFingerprint.let {
            val moveResult = it.instructionMatches[1]
            val configRegister = moveResult.getInstruction<OneRegisterInstruction>().registerA

            it.method.addInstruction(
                moveResult.index + 1,
                "invoke-static/range { v$configRegister .. v$configRegister }, $EXTENSION_CLASS->" +
                    "onSdkConfigurationLoaded(Lcom/waze/sdk/SdkConfiguration;)V"
            )
        }

        // Partner icons are only available on the server for the original package name.
        GetCustomizedAppIconUrlFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->getIconPackageName(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p1
            """
        )

        ConfiguredPackageNamesFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "${packageNames!!.replace(" ", "")}"
                return-object v0
            """
        )
    }
}
