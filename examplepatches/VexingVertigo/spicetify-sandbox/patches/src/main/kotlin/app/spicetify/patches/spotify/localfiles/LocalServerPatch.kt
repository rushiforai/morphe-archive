package app.spicetify.patches.spotify.localfiles

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.patch.InstallerType
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.spicetify.patches.spotify.settings.NativeSettingsAbi
import app.spicetify.patches.spotify.settings.enableSetting
import app.spicetify.patches.spotify.settings.settingsPatch
import app.spicetify.patches.spotify.spotifyCompatibility
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import java.util.Properties

private const val READER = "Lcom/spotify/localfiles/mediastore/MediaStoreReader;"
private const val HOOK = "Lapp/spicetify/extension/spotify/localserver/LocalServerHook;"
private const val ROWS = "Lapp/spicetify/extension/spotify/localserver/LibraryRows;"
private const val OBSERVABLE = "Lio/reactivex/rxjava3/core/Observable;"
private const val PLAYBACK = "Lapp/spicetify/extension/spotify/localserver/ServerPlayback;"
private const val SERVER_PROCESS = "Lapp/spicetify/extension/spotify/localserver/ServerProcess;"
private const val ARTWORK = "Lapp/spicetify/extension/spotify/localserver/ServerArtwork;"
private const val ANDROID = "http://schemas.android.com/apk/res/android"

private val serverResourcesPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val provider = manifest.createElement("provider")
            provider.setAttributeNS(ANDROID, "android:name", "app.spicetify.extension.spotify.localserver.ServerFileProvider")
            provider.setAttributeNS(ANDROID, "android:authorities", "com.spotify.music.spicetify.localserver")
            provider.setAttributeNS(ANDROID, "android:exported", "false")
            provider.setAttributeNS(ANDROID, "android:grantUriPermissions", "false")
            provider.setAttributeNS(ANDROID, "android:process", ":spicetify_server")
            manifest.getElementsByTagName("application").item(0).appendChild(provider)
            val browser = manifest.createElement("activity")
            browser.setAttributeNS(ANDROID, "android:name", "app.spicetify.extension.spotify.settings.ServerMusicActivity")
            browser.setAttributeNS(ANDROID, "android:exported", "false")
            manifest.getElementsByTagName("application").item(0).appendChild(browser)
        }
    }
}

@Suppress("unused")
val localFilesFromServerPatch = bytecodePatch(
    name = "Local files from a server",
    description = "Streams audio from an HTTPS WebDAV folder or Jellyfin music library into Local Files and Your Library. " +
        "Configure the server in Spicetify settings; playback needs Spotify's Local audio files setting. Experimental; requires byte-range support. " +
        "Not available for root mount installs.",
    default = false,
) {
    compatibleWith(spotifyCompatibility)
    dependsOn(settingsPatch, serverResourcesPatch)

    // A root mount install keeps the stock manifest, so the track provider (in its own
    // :spicetify_server process) and the server browser activity declared above would never be
    // registered. Manager also uses this resolver for the initial selection, so it, not `default`,
    // decides whether the patch starts selected.
    availability { installer, _ ->
        if (installer == InstallerType.MOUNT) PatchAvailability.UNAVAILABLE else PatchAvailability.DISABLED
    }

    execute {
        val snapshot = Properties().apply {
            NativeSettingsAbi::class.java.getResourceAsStream("/localfiles/9.1.80.2221.properties")!!.use(::load)
        }
        for (type in snapshot.stringPropertyNames()) {
            val definition = classDefByOrNull(type)
                ?: throw PatchException("Spotify local-files ABI changed: missing $type")
            if (NativeSettingsAbi.digest(definition) != snapshot.getProperty(type)) {
                throw PatchException("Spotify local-files ABI changed: use the verified Spotify 9.1.80.2221 APK.")
            }
        }
        enableSetting("serverFiles")
        val reader = mutableClassDefBy(READER)
        val query = reader.methods.single { it.name == "runQuery" && it.parameterTypes.isEmpty() && it.returnType == "[B" }
        val returns = query.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
        if (returns.size != 1) throw PatchException("Expected one MediaStoreReader query return.")
        val result = returns.single()
        val register = (result.value as OneRegisterInstruction).registerA
        query.addInstructions(result.index, """
            invoke-static/range {v$register .. v$register}, $HOOK->appendServerFiles([B)[B
            move-result-object v$register
        """.trimIndent())
        val start = reader.methods.single { it.name == "startListening" && it.parameterTypes == listOf("J") }
        val completed = start.implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        start.addInstructions(completed, "invoke-static/range {p0 .. p2}, $HOOK->onStartListening(Ljava/lang/Object;J)V")
        reader.methods.single { it.name == "stopListening" && it.parameterTypes.isEmpty() }
            .addInstructions(0, "invoke-static/range {p0 .. p0}, $HOOK->onStopListening(Ljava/lang/Object;)V")

        // Spotify's R8 build renames unused RxJava members; the extension calls these by their public signatures.
        val function = "Lio/reactivex/rxjava3/functions/Function;"
        val consumer = "Lio/reactivex/rxjava3/functions/Consumer;"
        val rxMembers = listOf(
            Triple(OBSERVABLE, "map", listOf(function)) to OBSERVABLE,
            Triple(OBSERVABLE, "switchMap", listOf(function)) to OBSERVABLE,
            Triple(OBSERVABLE, "never", emptyList<String>()) to OBSERVABLE,
            Triple("Lio/reactivex/rxjava3/core/Single;", "subscribe", listOf(consumer, consumer)) to "Lio/reactivex/rxjava3/disposables/Disposable;",
            Triple("Lio/reactivex/rxjava3/core/Observer;", "onNext", listOf("Ljava/lang/Object;")) to "V",
            Triple(function, "apply", listOf("Ljava/lang/Object;")) to "Ljava/lang/Object;",
            Triple(consumer, "accept", listOf("Ljava/lang/Object;")) to "V",
        )
        for ((member, result) in rxMembers) {
            val (type, name, parameters) = member
            val definition = classDefByOrNull(type) ?: throw PatchException("Spotify no longer ships $type.")
            if (definition.methods.none { it.name == name && it.parameterTypes == parameters && it.returnType == result })
                throw PatchException("Spotify renamed $type->$name; server rows in Your Library need it.")
        }
        // Early-return hooks use v0 before the original code runs, so it must be a local, not a parameter.
        fun requireScratchRegister(method: com.android.tools.smali.dexlib2.iface.Method) {
            val parameterRegisters = method.parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 } + 1
            if (method.implementation!!.registerCount <= parameterRegisters)
                throw PatchException("${method.definingClass}->${method.name} has no free register for its hook.")
        }

        // Track files are served from their own process; there, Spotify's own start-up is skipped.
        val application = mutableClassDefBy("Lcom/spotify/music/SpotifyApplication;").methods.single {
            it.name == "onCreate" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        requireScratchRegister(application)
        application.addInstructionsWithLabels(0, """
            invoke-static/range {p0 .. p0}, $SERVER_PROCESS->skipApplication(Landroid/content/Context;)Z
            move-result v0
            if-eqz v0, :spotify
            return-void
        """.trimIndent(), ExternalLabel("spotify", application.getInstruction(0)))
        // Spotify's memory callback reads state its skipped start-up would have created.
        val trimMemory = mutableClassDefBy("Lcom/spotify/music/SpotifyApplication;").methods.single {
            it.name == "onTrimMemory" && it.parameterTypes == listOf("I") && it.returnType == "V"
        }
        requireScratchRegister(trimMemory)
        trimMemory.addInstructionsWithLabels(0, """
            invoke-static/range {p0 .. p0}, $SERVER_PROCESS->isCurrent(Landroid/content/Context;)Z
            move-result v0
            if-eqz v0, :spotify
            return-void
        """.trimIndent(), ExternalLabel("spotify", trimMemory.getInstruction(0)))

        // Your Library requests one window of rows at a time; the extension appends server rows to each window.
        val request = mutableClassDefBy("Lp/ub21;").methods.single {
            it.name == "z" && it.parameterTypes == listOf("Lp/z770;") && it.returnType == OBSERVABLE
        }
        val pageReturns = request.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
        if (pageReturns.size != 1) throw PatchException("Expected one Your Library request return.")
        val pages = (pageReturns.single().value as OneRegisterInstruction).registerA
        request.addInstructions(pageReturns.single().index, """
            invoke-static/range {v$pages .. v$pages}, $ROWS->page($OBSERVABLE)$OBSERVABLE
            move-result-object v$pages
        """.trimIndent())
        // The request register is reused before the return, so capture it on entry. A request filtered
        // by our chip is answered there without asking Spotify's servers.
        requireScratchRegister(request)
        request.addInstructionsWithLabels(0, """
            invoke-static/range {p1 .. p1}, $ROWS->begin(Ljava/lang/Object;)$OBSERVABLE
            move-result-object v0
            if-eqz v0, :native
            return-object v0
        """.trimIndent(), ExternalLabel("native", request.getInstruction(0)))

        // The chip row: our chip follows Spotify's, is labelled after the provider, and is never remembered.
        val chipRow = mutableClassDefBy("Lp/aey;").methods.single {
            it.name == "<init>" && it.parameterTypes == listOf("Ljava/util/List;", "Ljava/util/List;", "I", "I", "Z", "Z")
        }
        chipRow.addInstructions(0, """
            invoke-static/range {p1 .. p2}, $ROWS->chipRow(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
            move-result-object p2
        """.trimIndent())
        val labels = mutableClassDefBy("Lp/igy;")
        for ((name, hook) in listOf("a" to "description", "b" to "label")) {
            val label = labels.methods.single { it.name == name && it.parameterTypes == listOf("Lp/y1j;") && it.returnType == "Ljava/lang/String;" }
            requireScratchRegister(label)
            label.addInstructionsWithLabels(0, """
                invoke-static/range {p1 .. p1}, $ROWS->$hook(Ljava/lang/Object;)Ljava/lang/String;
                move-result-object v0
                if-eqz v0, :native
                return-object v0
            """.trimIndent(), ExternalLabel("native", label.getInstruction(0)))
        }
        // Our rows carry spicetify:server: URIs; opening one shows the server browser instead of a Spotify page.
        val navigator = mutableClassDefBy("Lp/s4h0;")
        for (open in navigator.methods.filter {
            it.returnType == "V" && ((it.name == "b" && it.parameterTypes == listOf("Ljava/lang/String;", "Lp/mb40;", "Landroid/os/Bundle;"))
                || (it.name == "g" && it.parameterTypes == listOf("Ljava/lang/String;")))
        }.also { if (it.size != 2) throw PatchException("Expected Spotify's two URI navigation methods.") }) {
            open.addInstructionsWithLabels(0, """
                invoke-static/range {p0 .. p1}, $ROWS->open(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
                move-result-object p1
                if-nez p1, :native
                return-void
            """.trimIndent(), ExternalLabel("native", open.getInstruction(0)))
        }
        // Now Playing and other local-file artwork: Jellyfin tracks use the album image from the server.
        val image = mutableClassDefBy("Lcom/spotify/imageloader/localfileimage/LocalFileImageLoader;").methods.single {
            it.name == "loadImage" && it.parameterTypes == listOf("Ljava/lang/String;") && it.returnType == "[B"
        }
        requireScratchRegister(image)
        image.addInstructionsWithLabels(0, """
            invoke-static/range {p1 .. p1}, $ARTWORK->bytes(Ljava/lang/String;)[B
            move-result-object v0
            if-eqz v0, :native
            return-object v0
        """.trimIndent(), ExternalLabel("native", image.getInstruction(0)))
        mutableClassDefBy("Lp/ldy;").methods.single { it.name == "b" && it.parameterTypes == listOf("Ljava/util/List;") && it.returnType == "V" }
            .addInstructions(0, """
                invoke-static/range {p1 .. p1}, $ROWS->remembered(Ljava/util/List;)Ljava/util/List;
                move-result-object p1
            """.trimIndent())

        val player = mutableClassDefBy("Lp/s2w;")
        if (player.methods.none { it.name == "a" && it.parameterTypes == listOf("Lcom/spotify/player/model/command/PlayCommand;") })
            throw PatchException("Spotify's player no longer accepts play commands here.")
        val constructor = player.methods.single { it.name == "<init>" }
        val constructed = constructor.implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        constructor.addInstructions(constructed, "invoke-static/range {p0 .. p0}, $PLAYBACK->setPlayer(Ljava/lang/Object;)V")
    }
}
