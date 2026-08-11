package app.tadikwa.patches.googleclock

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val DIAG_EXT =
    "Lapp/tadikwa/googleclockdiag/DiagLogger;"

private val CLOCK_DIAG_COMPATIBILITY = Compatibility(
    name = "Clock",
    packageName = "com.google.android.deskclock",
    appIconColor = 0x4285F4,
    targets = listOf(
        AppTarget(
            version = "9.0 (943154005)",
            isExperimental = true,
            description = "Runtime diagnostics for Google Clock 9.0 / versionCode 76073630."
        )
    )
)

// This diagnostic patch depends on the functional redirect patch. At this point the resolver has already been rewritten to the Morphe package, so the fingerprint must match the post-patch constant.
private object ProviderResolverDiagnosticBootstrap : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("com.calm.android"),
        string("com.pandora.android"),
        string("app.morphe.android.apps.youtube.music"),
    )
)

private object RingtonePickerOnCreate : Fingerprint(
    definingClass = "Lcom/android/deskclock/ringtone/RingtonePickerActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

private object ConnectRequest : Fingerprint(
    definingClass = "Lcwg;",
    name = "n",
    returnType = "V",
    parameters = listOf("Ldcr;"),
)

private object SubscribeRequest : Fingerprint(
    definingClass = "Lew;",
    name = "a",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Landroid/os/Bundle;",
        "Lev;",
    ),
)

private object BrowserOnConnected : Fingerprint(
    definingClass = "Leq;",
    name = "onConnected",
    returnType = "V",
    parameters = emptyList(),
)

private object BrowserOnConnectionFailed : Fingerprint(
    definingClass = "Leq;",
    name = "onConnectionFailed",
    returnType = "V",
    parameters = emptyList(),
)

private object BrowserOnConnectionSuspended : Fingerprint(
    definingClass = "Leq;",
    name = "onConnectionSuspended",
    returnType = "V",
    parameters = emptyList(),
)

private object BrowserOnChildrenLoaded : Fingerprint(
    definingClass = "Let;",
    name = "onChildrenLoaded",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/util/List;",
    ),
)

private object BrowserOnError : Fingerprint(
    definingClass = "Let;",
    name = "onError",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

private object ControllerOnPlaybackStateChanged : Fingerprint(
    definingClass = "Lez;",
    name = "onPlaybackStateChanged",
    returnType = "V",
    parameters = listOf(
        "Landroid/media/session/PlaybackState;"
    ),
)

private object ControllerOnMetadataChanged : Fingerprint(
    definingClass = "Lez;",
    name = "onMetadataChanged",
    returnType = "V",
    parameters = listOf(
        "Landroid/media/MediaMetadata;"
    ),
)

private object ControllerOnExtrasChanged : Fingerprint(
    definingClass = "Lez;",
    name = "onExtrasChanged",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

private object ControllerOnQueueChanged : Fingerprint(
    definingClass = "Lez;",
    name = "onQueueChanged",
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
)

private object ControllerOnSessionEvent : Fingerprint(
    definingClass = "Lez;",
    name = "onSessionEvent",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Landroid/os/Bundle;",
    ),
)

private object ControllerOnSessionDestroyed : Fingerprint(
    definingClass = "Lez;",
    name = "onSessionDestroyed",
    returnType = "V",
    parameters = emptyList(),
)

private object MusicProviderStatusClass : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf(
        "MusicProviderStatus {provider=%s, appState=%s, searchAPI=%s, browseAPI=%s, fireAPI=%s, accountType=%s}"
    )
)

private object MusicProviderStatusConstructor : Fingerprint(
    classFingerprint = MusicProviderStatusClass,
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "L", "I", "I", "I", "I", "I"
    ),
)

@Suppress("unused")
val googleClockDiagnosticPatch = bytecodePatch(
    name = "Diagnostic logging for YouTube Music alarms",
    description = "Writes detailed MediaBrowser diagnostics to Download/ClockMorpheDiag-LAST.txt.",
    default = false,
) {
    compatibleWith(CLOCK_DIAG_COMPATIBILITY)

    dependsOn(googleClockMorpheMusicPatch)
    extendWith("extensions/clockdiag.mpe")

    execute {
        // Bootstrap #1: exact activity visible during the failing screen.
        RingtonePickerOnCreate.method.addInstruction(
            0,
            "invoke-static {p0}, $DIAG_EXT->init(Landroid/content/Context;)V"
        )

        // Bootstrap #2: same provider resolver used by our working package redirect.
        // The Context parameter is p0 for static methods, p1 for instance methods.
        ProviderResolverDiagnosticBootstrap.method.apply {
            val contextRegister =
                if (AccessFlags.STATIC.isSet(accessFlags)) "p0" else "p1"

            addInstruction(
                0,
                "invoke-static {$contextRegister}, $DIAG_EXT->init(Landroid/content/Context;)V"
            )
        }

        ConnectRequest.method.addInstruction(
            0,
            "invoke-static {p1}, $DIAG_EXT->connectRequest(Ljava/lang/Object;)V"
        )

        SubscribeRequest.method.addInstruction(
            0,
            "invoke-static {p1, p2}, $DIAG_EXT->subscribe(Ljava/lang/String;Landroid/os/Bundle;)V"
        )

        BrowserOnConnected.method.addInstruction(
            0,
            "invoke-static {}, $DIAG_EXT->browserConnected()V"
        )

        BrowserOnConnectionFailed.method.addInstruction(
            0,
            "invoke-static {}, $DIAG_EXT->browserConnectionFailed()V"
        )

        BrowserOnConnectionSuspended.method.addInstruction(
            0,
            "invoke-static {}, $DIAG_EXT->browserConnectionSuspended()V"
        )

        BrowserOnChildrenLoaded.method.addInstruction(
            0,
            "invoke-static {p1, p2}, $DIAG_EXT->children(Ljava/lang/String;Ljava/util/List;)V"
        )

        BrowserOnError.method.addInstruction(
            0,
            "invoke-static {p1}, $DIAG_EXT->browserError(Ljava/lang/String;)V"
        )

        ControllerOnPlaybackStateChanged.method.addInstruction(
            0,
            "invoke-static {p1}, $DIAG_EXT->playback(Landroid/media/session/PlaybackState;)V"
        )

        ControllerOnMetadataChanged.method.addInstruction(
            0,
            "invoke-static {p1}, $DIAG_EXT->mediaMetadata(Landroid/media/MediaMetadata;)V"
        )

        ControllerOnExtrasChanged.method.addInstruction(
            0,
            "invoke-static {p1}, $DIAG_EXT->mediaExtras(Landroid/os/Bundle;)V"
        )

        ControllerOnQueueChanged.method.addInstruction(
            0,
            "invoke-static {p1}, $DIAG_EXT->queue(Ljava/util/List;)V"
        )

        ControllerOnSessionEvent.method.addInstruction(
            0,
            "invoke-static {p1, p2}, $DIAG_EXT->sessionEvent(Ljava/lang/String;Landroid/os/Bundle;)V"
        )

        ControllerOnSessionDestroyed.method.addInstruction(
            0,
            "invoke-static {}, $DIAG_EXT->controllerSessionDestroyed()V"
        )

        MusicProviderStatusConstructor.method.apply {
            addInstruction(
                0,
                "invoke-static/range {p1 .. p6}, $DIAG_EXT->statusArgs(Ljava/lang/Object;IIIII)V"
            )

            val returnIndex =
                instructions.indexOfLast {
                    it.opcode == Opcode.RETURN_VOID
                }

            if (returnIndex < 0) {
                throw PatchException(
                    "MusicProviderStatus constructor return not found"
                )
            }

            addInstruction(
                returnIndex,
                "invoke-static {p0}, $DIAG_EXT->statusOut(Ljava/lang/Object;)V"
            )
        }
    }
}
