package app.originisland.patches.music.musiccard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.smali.ExternalLabel
import app.originisland.patches.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.originisland.patches.shared.mediasession.MediaBrowserServiceGetCurrentBrowserInfoFingerprint
import app.originisland.patches.shared.mediasession.MediaBrowserServiceOnGetRootFingerprint
import app.originisland.patches.shared.mediasession.MediaBrowserServiceOnLoadChildrenFingerprint
import app.originisland.patches.shared.mediasession.MediaBrowserServiceOnLoadChildrenWithOptionsFingerprint
import app.originisland.patches.shared.mediasession.MediaSessionCallbackOnCustomActionFingerprint
import app.originisland.patches.shared.mediasession.MediaSessionCallbackOnPlayFingerprint
import app.originisland.patches.shared.mediasession.MediaSessionCallbackOnPlayFromMediaIdFingerprint
import app.originisland.patches.shared.mediasession.MediaSessionCallbackOnSetRatingFingerprint
import app.originisland.patches.shared.mediasession.MediaSessionConstructorFingerprint
import app.originisland.patches.shared.mediasession.MediaSessionSetMetadataFingerprint
import app.originisland.patches.shared.mediasession.MediaSessionSetPlaybackStateFingerprint
import app.originisland.patches.shared.mediasession.addMusicCardHook
import app.originisland.patches.shared.mediasession.indicesOfCalls
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import org.w3c.dom.Element

private const val EXTENSION_PACKAGE = "Lapp/originisland/extension/"
private const val EXTENSION_CLASS = "${EXTENSION_PACKAGE}OriginIslandMusicCardPatch;"
private const val LIBRARY_BROWSER_CLASS = "${EXTENSION_PACKAGE}LibraryBrowser;"

private const val MORPHE_EXTENSION_PACKAGE = "Lapp/morphe/extension/"

private const val MEDIA_SESSION_CLASS = "Landroid/media/session/MediaSession;"
private const val MEDIA_BROWSER_SERVICE_CLASS = "Landroid/service/media/MediaBrowserService;"
private const val REMOTE_USER_INFO_CLASS = "Landroid/media/session/MediaSessionManager\$RemoteUserInfo;"

private const val MUSIC_BROWSER_SERVICE =
    "com.google.android.apps.youtube.music.mediabrowser.MusicBrowserService"

/**
 * The music card only offers the heart button, the loop mode button, lyrics and lists to apps
 * it controls through a media browser service that declares this action.
 * Every other app gets a controller without them.
 */
private const val MUSIC_CARD_SERVICE_ACTION = "com.vivo.musicwidgetmix.support.service"

private const val KEEP_PACKAGE = "Keep"

/**
 * A package of the list of apps the card offers to pick from while nothing plays.
 */
private const val LUNA_MUSIC_PACKAGE = "com.luna.music"

/**
 * A package of that list the card has no name of its own for, so it shows the name of the app.
 */
private const val OWN_NAME_PACKAGE = "cn.missevan"

private lateinit var packageNameOption: Option<String>

private val musicCardServiceResourcePatch = resourcePatch {
    // Last, so that it is not undone by a patch that expects the package of the app.
    finalize {
        val packageName = packageNameOption.value!!
        if (packageName == KEEP_PACKAGE) return@finalize

        var oldPackageName = ""
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            oldPackageName = manifest.getAttribute("package")
            fun renamed(name: String) =
                if (name.startsWith("$oldPackageName.")) name.replaceFirst(oldPackageName, packageName) else name

            manifest.setAttribute("package", packageName)

            // Two apps cannot declare the same providers or permissions.
            val providers = document.getElementsByTagName("provider")
            (0 until providers.length).map { providers.item(it) as Element }.forEach { provider ->
                provider.setAttribute(
                    "android:authorities",
                    provider.getAttribute("android:authorities").split(';').joinToString(";", transform = ::renamed)
                )
            }
            listOf("permission", "uses-permission").forEach { tag ->
                val permissions = document.getElementsByTagName(tag)
                (0 until permissions.length).map { permissions.item(it) as Element }.forEach { permission ->
                    permission.setAttribute("android:name", renamed(permission.getAttribute("android:name")))
                }
            }
        }

        // Settings of the app and of other patches open screens of the app by its package.
        val targetPackage = "android:targetPackage=\"$oldPackageName\""
        get("res").walkTopDown().filter { it.isFile && it.extension == "xml" }.forEach { file ->
            val text = file.readText()
            if (text.contains(targetPackage)) {
                file.writeText(text.replace(targetPackage, "android:targetPackage=\"$packageName\""))
            }
        }
    }

    execute {
        document("AndroidManifest.xml").use { document ->
            val services = document.getElementsByTagName("service")
            val browserService = (0 until services.length)
                .map { services.item(it) as Element }
                .firstOrNull { it.getAttribute("android:name") == MUSIC_BROWSER_SERVICE }
                ?: throw PatchException("Could not find $MUSIC_BROWSER_SERVICE")

            // A copy of the app that is installed under another package asks the app for its
            // downloads, and has to be allowed to see it for that.
            val manifest = document.documentElement
            val queries = manifest.getElementsByTagName("queries").item(0) as? Element
                ?: (manifest.appendChild(document.createElement("queries")) as Element)
            queries.appendChild(
                document.createElement("intent").apply {
                    appendChild(
                        document.createElement("action").apply {
                            setAttribute("android:name", MUSIC_CARD_SERVICE_ACTION)
                        }
                    )
                }
            )

            browserService.appendChild(
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
val originIslandMusicCardPatch = bytecodePatch(
    name = "Origin Island music card",
    description = "Lets the OriginOS music card on the lock screen and Origin Island like songs, " +
            "switch between repeat and shuffle, show the playlist, the playlists of the library " +
            "and the downloads, and show the lyrics of the Third-party lyrics patch.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    packageNameOption = stringOption(
        key = "packageName",
        default = KEEP_PACKAGE,
        values = mapOf(
            "Keep the package of YouTube Music" to KEEP_PACKAGE,
            "Offered by the card as YouTube Music while nothing plays" to OWN_NAME_PACKAGE,
            "Offered by the card as Qi Shui Yin Yue while nothing plays" to LUNA_MUSIC_PACKAGE
        ),
        title = "Package name",
        description = "The package to install this copy of YouTube Music under.",
        required = true
    ) {
        it == KEEP_PACKAGE || it!!.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$"))
    }

    dependsOn(musicCardServiceResourcePatch)

    extendWith("extensions/extension.mpe")

    execute {
        // The app only lets allowlisted clients connect to its media browser service.
        // The card is answered before the app is asked, with a root of the platform,
        // so that it loads the playlist through the platform as well.
        MediaBrowserServiceOnGetRootFingerprint.matchAll().forEach { match ->
            match.method.apply {
                val parameterRegisters = 4
                if (implementation!!.registerCount - parameterRegisters < 1) {
                    throw PatchException("Not enough registers in onGetRoot")
                }

                // The extension loads lists of the library as a client of the app. The app decides
                // what a client may browse from its package and uid, which it is given here.
                // The parameter registers of this method can be out of reach of a regular invoke.
                addInstructions(
                    0,
                    """
                        invoke-static/range { p1 .. p3 }, $LIBRARY_BROWSER_CLASS->getClientPackage(Ljava/lang/String;ILandroid/os/Bundle;)Ljava/lang/String;
                        move-result-object p1
                        invoke-static/range { p2 .. p3 }, $LIBRARY_BROWSER_CLASS->getClientUid(ILandroid/os/Bundle;)I
                        move-result p2
                    """
                )

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

        // The app asks for the client again with every request to its media browser service.
        MediaBrowserServiceGetCurrentBrowserInfoFingerprint.matchAll().forEach { match ->
            match.method.apply {
                // The extension calls it for the app.
                if (definingClass.startsWith(EXTENSION_PACKAGE)) return@forEach

                indicesOfCalls(MEDIA_BROWSER_SERVICE_CLASS, "getCurrentBrowserInfo").forEach { index ->
                    val serviceRegister = (getInstruction(index) as? FiveRegisterInstruction)?.registerC
                        ?: throw PatchException("Unexpected call of getCurrentBrowserInfo in $definingClass")

                    replaceInstruction(
                        index,
                        "invoke-static { v$serviceRegister }, $LIBRARY_BROWSER_CLASS->" +
                                "getCurrentBrowserInfo($MEDIA_BROWSER_SERVICE_CLASS)$REMOTE_USER_INFO_CLASS"
                    )
                }
            }
        }

        // Other patches publish metadata to the session from their extensions,
        // so every call is hooked and not only the one of the app.
        MediaSessionSetMetadataFingerprint.matchAll().forEach { match ->
            match.method.apply {
                // The extension of this patch publishes to the session as well.
                if (definingClass.startsWith(EXTENSION_PACKAGE)) return@forEach

                val isAppMetadata = !definingClass.startsWith(MORPHE_EXTENSION_PACKAGE)

                // Reversed, so the indices of the remaining calls stay valid.
                indicesOfCalls(MEDIA_SESSION_CLASS, "setMetadata").reversed().forEach { index ->
                    val instruction = getInstruction<FiveRegisterInstruction>(index)
                    val sessionRegister = instruction.registerC
                    val metadataRegister = instruction.registerD

                    val extensionMethod = if (isAppMetadata) "onSetMetadata" else "onSetExtensionMetadata"

                    addInstructions(
                        index,
                        """
                            invoke-static { v$sessionRegister, v$metadataRegister }, $EXTENSION_CLASS->$extensionMethod(Landroid/media/session/MediaSession;Landroid/media/MediaMetadata;)Landroid/media/MediaMetadata;
                            move-result-object v$metadataRegister
                        """
                    )
                }
            }
        }

        // The app makes its session before it has anything to play.
        MediaSessionConstructorFingerprint.matchAll().forEach { match ->
            match.method.apply {
                if (definingClass.startsWith(EXTENSION_PACKAGE) ||
                    definingClass.startsWith(MORPHE_EXTENSION_PACKAGE)
                ) return@forEach

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

        // The app tells if a song is liked with a custom action of its playback state,
        // which it keeps up to date better than the rating of its metadata.
        MediaSessionSetPlaybackStateFingerprint.matchAll().forEach { match ->
            match.method.apply {
                if (definingClass.startsWith(EXTENSION_PACKAGE) ||
                    definingClass.startsWith(MORPHE_EXTENSION_PACKAGE)
                ) return@forEach

                indicesOfCalls(MEDIA_SESSION_CLASS, "setPlaybackState").reversed().forEach { index ->
                    val instruction = getInstruction<FiveRegisterInstruction>(index)

                    addInstructions(
                        index,
                        "invoke-static { v${instruction.registerC}, v${instruction.registerD} }, " +
                                "$EXTENSION_CLASS->onSetPlaybackState(" +
                                "${MEDIA_SESSION_CLASS}Landroid/media/session/PlaybackState;)V"
                    )
                }
            }
        }

        // The card opens some apps to have them play, if they are not running.
        MusicActivityOnResumeFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onActivityResume(Landroid/app/Activity;)V"
        )

        // The card asks a closed app to play, which has nothing loaded to play yet.
        MediaSessionCallbackOnPlayFingerprint.matchAll().forEach { match ->
            if (match.method.definingClass.startsWith("Lapp/originisland/extension/")) return@forEach
            match.method.apply {
                // The method has no registers of its own, so the callback is given back to go on.
                addInstructionsWithLabels(
                    0,
                    """
                        invoke-static { p0 }, $EXTENSION_CLASS->onPlay(Ljava/lang/Object;)Ljava/lang/Object;
                        move-result-object p0
                        if-nez p0, :app
                        return-void
                        :app
                        check-cast p0, $definingClass
                    """
                )
            }
        }

        MediaSessionCallbackOnSetRatingFingerprint.matchAll().forEach { match ->
            match.method.addInstructions(
                0,
                """
                    invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->onSetRating(Landroid/media/Rating;)Landroid/media/Rating;
                    move-result-object p1
                """
            )
        }

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
            match.method.addMusicCardHook(
                EXTENSION_CLASS,
                "p0 .. p2",
                "onLoadChildren($onLoadChildrenParameters)Ljava/lang/String;"
            )
        }

        MediaBrowserServiceOnLoadChildrenWithOptionsFingerprint.matchAll().forEach { match ->
            match.method.addMusicCardHook(
                EXTENSION_CLASS,
                "p0 .. p3",
                "onLoadChildren(${onLoadChildrenParameters}Landroid/os/Bundle;)Ljava/lang/String;"
            )
        }
    }
}
