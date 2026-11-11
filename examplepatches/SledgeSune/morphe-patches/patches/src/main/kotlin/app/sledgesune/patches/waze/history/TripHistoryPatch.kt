package app.sledgesune.patches.waze.history

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import app.morphe.patcher.util.smali.ExternalLabel
import app.sledgesune.patches.shared.Constants.COMPATIBILITY_WAZE

private const val EXTENSION_CLASS = "Lapp/sledgesune/extension/waze/TripHistoryPatch;"
private const val NAVIGATION_INFO = "Lcom/waze/navigate/NavigationInfoNativeManagerBase;"

// The classes below are named in the manifest or called from native code by name, so they keep their real names.

private object ApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/waze/mobile/WazeMobileApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

/** The native core reports that navigation started (true) or stopped (false). */
private object NavigationStateChangedFingerprint : Fingerprint(
    definingClass = NAVIGATION_INFO,
    name = "onNavigationStateChangedJNI",
    returnType = "V",
    parameters = listOf("Z", "I"),
)

/** Called repeatedly while navigating. Used as a "still driving" heartbeat. */
private object EtaSecondsChangedFingerprint : Fingerprint(
    definingClass = NAVIGATION_INFO,
    name = "onCurrentEtaSecondsChangedJNI",
    returnType = "V",
    parameters = listOf("I"),
)

/**
 * Click action of Settings > Privacy > Navigation history
 * (obfuscated, e.g. `Lcom/waze/settings/gl;->a()V` in 5.27.4.900).
 * Opens a web page whose address comes from server config.
 */
private object OpenNavigationHistoryFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/waze/config/ConfigValues;",
            name = "CONFIG_VALUE_PRIVACY_DRIVE_HISTORY_URL",
        ),
        string("drive_history"),
    )
)

/**
 * Builds the headers the app adds when it loads Waze's own web pages
 * (obfuscated, e.g. `Lcom/waze/sharedui/web/g;->a(II)Ljava/util/Map;`).
 * They identify the signed-in app user to www.waze.com.
 */
private object WebClientHeadersFingerprint : Fingerprint(
    returnType = "Ljava/util/Map;",
    parameters = listOf("I", "I"),
    filters = listOf(
        string("X-Waze-Mobile-RT-Token"),
    )
)

@Suppress("unused")
val tripHistoryPatch = patch(
    name = "Trip history",
    description = "Shows the start and end time of each drive under Settings > Privacy > Navigation history. " +
        "Uses the drive list from Waze's servers, and trips recorded on the phone when not signed in.",
    default = true
) {
    compatibleWith(COMPATIBILITY_WAZE)

    extendWith("extensions/extension.mpe")

    execute {
        // Range invokes are used for parameters, since parameter registers can be above v15.
        ApplicationOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onApplicationCreate(Landroid/app/Application;)V"
        )

        // Record trips on the phone.
        NavigationStateChangedFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p1 .. p2 }, $EXTENSION_CLASS->onNavigationStateChanged(ZI)V"
        )
        EtaSecondsChangedFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->onNavigationHeartbeat(I)V"
        )

        // Show the trip history screen instead of going straight to Waze's web page.
        val webHeaders = WebClientHeadersFingerprint.method
        OpenNavigationHistoryFingerprint.method.apply {
            val originalClass = definingClass.removePrefix("L").removeSuffix(";").replace('/', '.')

            addInstructionsWithLabels(
                0,
                """
                    const/4 v0, 0x0
                    invoke-static { v0, v0 }, ${webHeaders.definingClass}->${webHeaders.name}(II)Ljava/util/Map;
                    move-result-object v0
                    const-string v1, "$originalClass"
                    const-string v2, "$name"
                    invoke-static { v0, v1, v2 }, $EXTENSION_CLASS->showHistory(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :original
                    return-void
                """,
                ExternalLabel("original", getInstruction(0))
            )
        }
    }
}
