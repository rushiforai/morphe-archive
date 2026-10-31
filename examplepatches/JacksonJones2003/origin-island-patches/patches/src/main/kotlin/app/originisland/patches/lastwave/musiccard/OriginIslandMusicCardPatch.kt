package app.originisland.patches.lastwave.musiccard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.originisland.patches.shared.Constants.COMPATIBILITY_LASTWAVE
import app.originisland.patches.shared.mediasession.MediaBrowserServiceOnGetRootFingerprint
import app.originisland.patches.shared.mediasession.MediaBrowserServiceOnLoadChildrenFingerprint
import app.originisland.patches.shared.mediasession.MediaBrowserServiceOnLoadChildrenWithOptionsFingerprint
import app.originisland.patches.shared.mediasession.MediaSessionCallbackOnCustomActionFingerprint
import app.originisland.patches.shared.mediasession.MediaSessionCallbackOnPlayFromMediaIdFingerprint
import app.originisland.patches.shared.mediasession.MediaSessionConstructorFingerprint
import app.originisland.patches.shared.mediasession.MediaSessionSetMetadataFingerprint
import app.originisland.patches.shared.mediasession.addMusicCardHook
import app.originisland.patches.shared.mediasession.indicesOfCalls
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import org.w3c.dom.Element

private const val EXTENSION_PACKAGE = "Lapp/originisland/extension/"
private const val EXTENSION_CLASS = "${EXTENSION_PACKAGE}LastWaveMusicCardPatch;"

private const val MEDIA_SESSION_CLASS = "Landroid/media/session/MediaSession;"
private const val MEDIA_BROWSER_SERVICE_CLASS = "Landroid/service/media/MediaBrowserService;"

private const val PLAYBACK_SERVICE = "com.lastwave.app.playback.MusicPlaybackService"

/**
 * The music card only offers the loop mode button and lists to apps it controls through
 * a media browser service that declares this action. Every other app gets a controller without them.
 */
private const val MUSIC_CARD_SERVICE_ACTION = "com.vivo.musicwidgetmix.support.service"

private val lastWaveMusicCardServiceResourcePatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val services = document.getElementsByTagName("service")
            val playbackService = (0 until services.length)
                .map { services.item(it) as Element }
                .firstOrNull { it.getAttribute("android:name") == PLAYBACK_SERVICE }
                ?: throw PatchException("Could not find $PLAYBACK_SERVICE")

            // LastWave declares it itself since version 5.0.0.
            val actions = playbackService.getElementsByTagName("action")
            val declared = (0 until actions.length).any {
                (actions.item(it) as Element).getAttribute("android:name") == MUSIC_CARD_SERVICE_ACTION
            }
            if (declared) return@use

            playbackService.appendChild(
                document.createElement("intent-filter").apply {
                    appendChild(
                        document.createElement("action").apply {
                            setAttribute("android:name", MUSIC_CARD_SERVICE_ACTION)
                        }
                    )
                }
            )
        }
    }
}

@Suppress("unused")
val lastWaveMusicCardPatch = bytecodePatch(
    name = "Origin Island music card",
    description = "Lets the OriginOS music card on the lock screen and Origin Island show lyrics, like songs, " +
            "switch between repeat and shuffle, and show the playlist and play from it.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LASTWAVE)

    dependsOn(lastWaveMusicCardServiceResourcePatch)

    extendWith("extensions/extension.mpe")

    execute {
        fun isExtension(definingClass: String) = definingClass.startsWith(EXTENSION_PACKAGE)

        // The card is answered before the app is asked, with a root of the platform,
        // so that it loads the playlist through the platform as well.
        MediaBrowserServiceOnGetRootFingerprint.matchAll().forEach { match ->
            match.method.apply {
                if (isExtension(definingClass)) return@forEach

                val parameterRegisters = 4
                if (implementation!!.registerCount - parameterRegisters < 1) {
                    throw PatchException("Not enough registers in onGetRoot")
                }

                // The parameter registers of this method can be out of reach of a regular invoke.
                addInstructionsWithLabels(
                    0,
                    """
                        invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->onGetBrowserRoot(Ljava/lang/String;)Landroid/service/media/MediaBrowserService${'$'}BrowserRoot;
                        move-result-object v0
                        if-eqz v0, :original
                        return-object v0
                    """,
                    ExternalLabel("original", getInstruction(0))
                )
            }
        }

        MediaSessionSetMetadataFingerprint.matchAll().forEach { match ->
            match.method.apply {
                // The extension of this patch publishes to the session as well.
                if (isExtension(definingClass)) return@forEach

                // Reversed, so the indices of the remaining calls stay valid.
                indicesOfCalls(MEDIA_SESSION_CLASS, "setMetadata").reversed().forEach { index ->
                    val instruction = getInstruction<FiveRegisterInstruction>(index)

                    addInstructions(
                        index,
                        """
                            invoke-static { v${instruction.registerC}, v${instruction.registerD} }, $EXTENSION_CLASS->onSetMetadata(Landroid/media/session/MediaSession;Landroid/media/MediaMetadata;)Landroid/media/MediaMetadata;
                            move-result-object v${instruction.registerD}
                        """
                    )
                }
            }
        }

        // The app makes its session before it has anything to play.
        MediaSessionConstructorFingerprint.matchAll().forEach { match ->
            match.method.apply {
                if (isExtension(definingClass)) return@forEach

                indicesOfCalls(MEDIA_SESSION_CLASS, "<init>").reversed().forEach { index ->
                    val sessionRegister = (getInstruction(index) as? FiveRegisterInstruction)?.registerC
                        ?: return@forEach

                    addInstructions(
                        index + 1,
                        "invoke-static/range { v$sessionRegister .. v$sessionRegister }, " +
                                "$EXTENSION_CLASS->onSessionCreated($MEDIA_SESSION_CLASS)V"
                    )
                }
            }
        }

        addLastWaveLikes(EXTENSION_CLASS)
        addLastWaveLyrics()
        addLastWaveVoiceSearch()

        // These hooks handle what the music card sends and let the app handle everything else.
        MediaSessionCallbackOnCustomActionFingerprint.matchAll().forEach { match ->
            match.method.addMusicCardHook(
                EXTENSION_CLASS,
                "p1 .. p2",
                "onCustomAction(Ljava/lang/String;Landroid/os/Bundle;)Ljava/lang/String;"
            )
        }

        MediaSessionCallbackOnPlayFromMediaIdFingerprint.matchAll().forEach { match ->
            match.method.addMusicCardHook(
                EXTENSION_CLASS,
                "p1 .. p2",
                "onPlayFromMediaId(Ljava/lang/String;Landroid/os/Bundle;)Ljava/lang/String;"
            )
        }

        val onLoadChildrenParameters = MEDIA_BROWSER_SERVICE_CLASS +
                "Ljava/lang/String;" +
                "Landroid/service/media/MediaBrowserService\$Result;"

        MediaBrowserServiceOnLoadChildrenFingerprint.matchAll().forEach { match ->
            if (isExtension(match.classDef.type)) return@forEach
            match.method.addMusicCardHook(
                EXTENSION_CLASS,
                "p0 .. p2",
                "onLoadChildren($onLoadChildrenParameters)Ljava/lang/String;"
            )
        }

        MediaBrowserServiceOnLoadChildrenWithOptionsFingerprint.matchAll().forEach { match ->
            if (isExtension(match.classDef.type)) return@forEach
            match.method.addMusicCardHook(
                EXTENSION_CLASS,
                "p0 .. p3",
                "onLoadChildren(${onLoadChildrenParameters}Landroid/os/Bundle;)Ljava/lang/String;"
            )
        }
    }
}
