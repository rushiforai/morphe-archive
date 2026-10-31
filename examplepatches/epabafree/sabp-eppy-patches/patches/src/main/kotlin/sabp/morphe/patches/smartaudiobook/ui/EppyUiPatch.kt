package sabp.morphe.patches.smartaudiobook.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element
import sabp.morphe.patches.smartaudiobook.smartAudioBookCompatibility
import sabp.morphe.patches.smartaudiobook.theme.fontAssetPatch

// eppy is a new home / library / player written as a Morphe extension
// (extensions/sabp). It does not replace SABP's engine: it drives PlayerService through the intent
// actions SABP's own notification and widgets use, reads state from SABP's media session, and calls
// four PlayerService methods through EppyBridge stubs that this patch fills in.
//
// Those methods are found from code whose names R8 has to keep, so the patch does not depend on
// obfuscated names:
//   * MyMediaBrowserService (Android Auto) builds its book lists with
//       PlayerService.<books>(BookData$BookState) -> ArrayList
//       PlayerService.<coverKeys>(ArrayList) -> ArrayList
//       k8.<loadCovers>(Context, ArrayList) -> ArrayList           (static, package-private)
//   * PlayerActivity's SeekBar callbacks call
//       PlayerService.<seekTracking>(Z)V  from onStartTrackingTouch
//       PlayerService.<seekTo>(I)V        from onProgressChanged

private const val EXT = "Lapp/morphe/extension/sabp"
private const val BRIDGE = "$EXT/EppyBridge;"
private const val SABP = "Lak/alizandro/smartaudiobookplayer"
private const val PLAYER_SERVICE = "$SABP/PlayerService;"
private const val BROWSER_SERVICE = "$SABP/MyMediaBrowserService;"
private const val PLAYER_ACTIVITY = "$SABP/PlayerActivity;"
private const val BOOK_STATE = "$SABP/BookData\$BookState;"
private const val BOOKMARK = "$SABP/Bookmark;"
private const val CHARACTER = "$SABP/CharacterDescription;"
private const val SLEEP_SETTINGS = "$SABP/PlayerSettingsSleepActivity;"
private const val SETTINGS_ACTIVITY = "$SABP/PlayerSettingsActivity;"
const val EPPY_VERSION = "0.10.1"
private const val EPPY_ACTIVITY = "app.morphe.extension.sabp.EppyActivity"

private fun newLauncherFilter(doc: org.w3c.dom.Document): Element =
    doc.createElement("intent-filter").apply {
        appendChild(doc.createElement("action").apply { setAttribute("android:name", "android.intent.action.MAIN") })
        appendChild(doc.createElement("category").apply { setAttribute("android:name", "android.intent.category.LAUNCHER") })
    }

private val eppyUiBytecodePatch = bytecodePatch(
    description = "Connects eppy to SABP's player service. Applied with the eppy patch.",
) {
    compatibleWith(smartAudioBookCompatibility)
    dependsOn(fontAssetPatch)
    extendWith("extensions/sabp.mpe")

    execute {
        // Resolve everything first, mutate after. A required target that's missing stops the
        // patch before any class is changed, so it can never half-apply. An optional target that's
        // missing leaves its EppyBridge stub at a safe default; the feature using it hides itself
        // and Settings → Diagnostics shows why (hook report below).
        val hooks = HookReport()

        // ---- required ----------------------------------------------------------------------
        val service = classDefBy(PLAYER_SERVICE)
        val playerActivity = classDefBy(PLAYER_ACTIVITY)
        val onCreate = playerActivity.methods.singleOrNull {
            it.name == "onCreate" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/os/Bundle;")
        } ?: throw PatchException("Smart AudioBook Player: PlayerActivity.onCreate not found.")
        if ((onCreate.implementation?.registerCount ?: 0) - 2 < 1) {
            throw PatchException("Smart AudioBook Player: PlayerActivity.onCreate has no free register.")
        }
        hooks.ok("router", "PlayerActivity.onCreate")

        // Library methods, from the Android Auto browser service.
        val browser = classDefBy(BROWSER_SERVICE)
        val listMethod = browser.methods.singleOrNull {
            it.parameterTypes.map(CharSequence::toString) == listOf(BOOK_STATE) && it.returnType == "Ljava/util/List;"
        } ?: throw PatchException("Smart AudioBook Player: the Android Auto book list method was not found.")
        val calls = listMethod.methodCalls()
        val books = calls.firstOrNull {
            it.definingClass == PLAYER_SERVICE && it.parameterTypes.map(CharSequence::toString) == listOf(BOOK_STATE) &&
                it.returnType == "Ljava/util/ArrayList;"
        } ?: throw PatchException("Smart AudioBook Player: PlayerService book list call not found.")
        hooks.ok("library", books.name)
        val coverKeys = hooks.optional("covers") {
            calls.firstOrNull {
                it.definingClass == PLAYER_SERVICE && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/util/ArrayList;") &&
                    it.returnType == "Ljava/util/ArrayList;"
            }
        }
        val loadCovers = if (coverKeys == null) null else hooks.optional("coverLoader") {
            calls.firstOrNull {
                it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", "Ljava/util/ArrayList;") &&
                    it.returnType == "Ljava/util/ArrayList;"
            }
        }

        // ---- optional ----------------------------------------------------------------------
        // Seeking, from the classic player's SeekBar callbacks.
        val seekTracking = hooks.optional("seekTracking") {
            playerActivity.methods.singleOrNull {
                it.name == "onStartTrackingTouch" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/widget/SeekBar;")
            }?.methodCalls()?.firstOrNull {
                it.definingClass == PLAYER_SERVICE && it.parameterTypes.map(CharSequence::toString) == listOf("Z") && it.returnType == "V"
            }
        }
        val seekTo = hooks.optional("seek") {
            playerActivity.methods.singleOrNull { it.name == "onProgressChanged" && it.parameterTypes.size == 3 }
                ?.methodCalls()?.firstOrNull {
                    it.definingClass == PLAYER_SERVICE && it.parameterTypes.map(CharSequence::toString) == listOf("I") && it.returnType == "V"
                }
        }
        // Live file position: the first int getter the media-metadata builder calls.
        val filePosition = hooks.optional("filePosition") {
            service.methods.firstOrNull { m -> m.hasString("android.media.metadata.DURATION") }
                ?.methodCalls()?.firstOrNull {
                    it.definingClass == PLAYER_SERVICE && it.parameterTypes.isEmpty() && it.returnType == "I"
                }
        }
        // Jump to file + position: the only (String, int, boolean) -> void method.
        val jump = hooks.optional("jump") {
            service.methods.filter {
                it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "I", "Z") && it.returnType == "V"
            }.singleOrNull()?.asReference()
        }
        // Bookmark and character files (static helpers that read/write <folder>/*.sabp.xml).
        fun staticIo(cls: String, key: String): Pair<MethodReference?, MethodReference?> {
            val def = classDefBy(cls)
            val load = hooks.optional("${key}Load") {
                def.methods.singleOrNull {
                    AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "Ljava/util/ArrayList;" &&
                        it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", "Ljava/lang/String;")
                }?.asReference()
            }
            val save = hooks.optional("${key}Save") {
                def.methods.singleOrNull {
                    AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" &&
                        it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", "Ljava/util/ArrayList;", "Ljava/lang/String;")
                }?.asReference()
            }
            return load to save
        }
        val (loadBookmarks, saveBookmarks) = staticIo(BOOKMARK, "bookmarks")
        val (loadCharacters, saveCharacters) = staticIo(CHARACTER, "characters")
        // Speed: PlayerService's public (float speed, int skipSilence) setter. The package-private
        // twin with the same signature applies the default to new books only.
        val setSpeed = hooks.optional("speed") {
            service.methods.filter {
                it.parameterTypes.map(CharSequence::toString) == listOf("F", "I") && it.returnType == "V" &&
                    AccessFlags.PUBLIC.isSet(it.accessFlags)
            }.singleOrNull()?.asReference()
        }
        // Sleep timer countdown text: the String getter that combines the sleep setting
        // (PlayerSettingsSleepActivity) with PlayerActivity's time formatter.
        val sleepRemaining = hooks.optional("sleepRemaining") {
            service.methods.filter { m ->
                m.returnType == "Ljava/lang/String;" && m.parameterTypes.isEmpty() &&
                    m.methodCalls().any { it.definingClass == SLEEP_SETTINGS } &&
                    m.methodCalls().any { it.definingClass == PLAYER_ACTIVITY && it.returnType == "Ljava/lang/String;" }
            }.singleOrNull()?.asReference()
        }
        // Classic player overflow menu (PopupMenu built in PlayerActivity): eppy adds its own
        // "Switch to eppy" item just before show().
        val popupMethods = playerActivity.methods.filter { m ->
            m.methodCalls().any { it.definingClass == "Landroid/widget/PopupMenu;" && it.name == "inflate" } &&
                m.methodCalls().any { it.definingClass == "Landroid/widget/PopupMenu;" && it.name == "show" }
        }
        val classicMenu = hooks.optional("classicMenu") { popupMethods.singleOrNull() }
        // PlayerActivity.onDestroy unregisters a receiver that onCreate registers. When the router
        // sends the classic player to eppy, onCreate returns before registering it, and Android 16
        // then crashes the whole app in onDestroy ("Receiver not registered"). eppy makes that one
        // call tolerant.
        val safeDestroy = hooks.optional("safeDestroy") {
            val m = playerActivity.methods.singleOrNull { it.name == "onDestroy" && it.parameterTypes.isEmpty() }
            val idx = m?.implementation?.instructions?.indexOfFirst {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "unregisterReceiver"
            } ?: -1
            if (m != null && idx >= 0) Pair(m, idx) else null
        }
        val settingsActivity = classDefBy(SETTINGS_ACTIVITY)
        val settingsOnCreate = hooks.optional("classicSettings") {
            settingsActivity.methods.singleOrNull {
                it.name == "onCreate" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/os/Bundle;")
            }
        }

        // Classic-player controls eppy also offers. Each setter is the PlayerService call the classic
        // player makes right before it animates the matching widget (those widget classes and
        // methods keep their names), or the only PlayerService method taking that settings type.
        fun serviceCallBefore(widgetCall: String, params: List<String>): MethodReference? {
            for (m in playerActivity.methods) {
                val refs = m.methodCalls()
                for ((i, r) in refs.withIndex()) {
                    if ("${r.definingClass}->${r.name}" != widgetCall) continue
                    val setter = refs.subList(0, i).lastOrNull {
                        it.definingClass == PLAYER_SERVICE && it.returnType == "V" &&
                            it.parameterTypes.map(CharSequence::toString) == params
                    }
                    if (setter != null) return setter
                }
            }
            return null
        }
        fun serviceSetter(type: String, publicOnly: Boolean) = service.methods.filter {
            it.parameterTypes.map(CharSequence::toString) == listOf(type) && it.returnType == "V" &&
                (!publicOnly || AccessFlags.PUBLIC.isSet(it.accessFlags))
        }.singleOrNull()?.asReference()
        val setBoost = hooks.optional("boost") { serviceCallBefore("Lak/alizandro/widget/BoostVolumeView;->setBoostLevelAnimated", listOf("I")) }
        val setId3 = hooks.optional("id3Titles") { serviceCallBefore("Lak/alizandro/widget/Id3TitlesView;->setActivatedAnimated", listOf("Z")) }
        val setEqualizer = hooks.optional("equalizer") { serviceSetter("$SABP/EqualizerLevels;", true) }
        val setRepeat = hooks.optional("repeat") { serviceSetter("$SABP/RepeatSettings;", false) }
        val setSkipStartEnd = hooks.optional("skipStartEnd") { serviceSetter("$SABP/SkipStartEndSettings;", false) }

        // ---- mutate ------------------------------------------------------------------------
        val mService = mutableClassDefBy(PLAYER_SERVICE)
        mService.methods.single { it.name == "onCreate" && it.parameterTypes.isEmpty() }
            .addInstructions(0, "invoke-static {p0}, $BRIDGE->onPlayerServiceCreated(Landroid/app/Service;)V")
        mService.methods.single { it.name == "onDestroy" && it.parameterTypes.isEmpty() }
            .addInstructions(0, "invoke-static {p0}, $BRIDGE->onPlayerServiceDestroyed(Landroid/app/Service;)V")

        // Crash recorder + diagnostics as early as possible.
        mutableClassDefBy("$SABP/SABPApplication;").methods.single { it.name == "onCreate" && it.parameterTypes.isEmpty() }
            .addInstructions(0, "invoke-static {p0}, $EXT/EppyDiag;->install(Landroid/app/Application;)V")

        // Central player routing. Every route into the classic player (notification, widgets,
        // library, voice search, task restore) starts PlayerActivity, so its onCreate decides once.
        // Same pattern as Morphe's YouTube settings hook (invoke-super → extension → return-void).
        val mPlayerActivity = mutableClassDefBy(PLAYER_ACTIVITY)
        mPlayerActivity.methods.single { it.name == onCreate.name && it.parameterTypes == onCreate.parameterTypes }.addInstructions(
            0,
            """
            invoke-static {p0}, $EXT/EppyRoute;->shouldRedirect(Landroid/app/Activity;)Z
            move-result v0
            if-eqz v0, :eppy_classic
            invoke-super {p0, p1}, ${mPlayerActivity.superclass}->onCreate(Landroid/os/Bundle;)V
            invoke-static {p0}, $EXT/EppyRoute;->redirect(Landroid/app/Activity;)V
            return-void
            :eppy_classic
            nop
            """,
        )

        if (safeDestroy != null) {
            val m = mPlayerActivity.methods.single { it.name == "onDestroy" && it.parameterTypes.isEmpty() }
            val call = m.instructions[safeDestroy.second] as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
            m.removeInstructions(safeDestroy.second, 1)
            m.addInstructions(
                safeDestroy.second,
                "invoke-static {v${call.registerC}, v${call.registerD}}, $EXT/EppyRoute;->safeUnregister(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V",
            )
        }

        // "Switch to eppy" inside Classic: the player's overflow menu and the settings screen.
        if (classicMenu != null) {
            val m = mPlayerActivity.methods.single { it.name == classicMenu.name && it.parameterTypes == classicMenu.parameterTypes }
            val insns = m.instructions
            val showIndex = insns.indexOfFirst {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { r ->
                    r.definingClass == "Landroid/widget/PopupMenu;" && r.name == "show"
                } == true
            }
            val reg = (insns[showIndex] as com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c).registerC
            m.addInstructions(showIndex, "invoke-static {v$reg}, $EXT/EppyRoute;->addClassicMenuItem(Landroid/widget/PopupMenu;)V")
        }
        if (settingsOnCreate != null) {
            val m = mutableClassDefBy(SETTINGS_ACTIVITY).methods.single { it.name == "onCreate" && it.parameterTypes == settingsOnCreate.parameterTypes }
            // After the screen is built: the first call onCreate makes into its own class (the
            // preference-screen builder). R8 reuses p0 later in the method, so take the receiver
            // register from that call rather than assuming p0.
            val insns = m.instructions
            val build = insns.indexOfFirst {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass == SETTINGS_ACTIVITY &&
                    it is com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
            }
            if (build >= 0) {
                val reg = (insns[build] as com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c).registerC
                m.addInstructions(build + 1, "invoke-static {v$reg}, $EXT/EppyRoute;->addClassicSettingsEntry(Landroid/app/Activity;)V")
            }
        }

        // Package-private targets must be public: the extension lives in another package.
        listOfNotNull(books, coverKeys, loadCovers, seekTracking, seekTo, filePosition, jump, loadBookmarks, saveBookmarks,
            loadCharacters, saveCharacters, setSpeed, sleepRemaining, setBoost, setId3, setEqualizer, setRepeat,
            setSkipStartEnd).forEach { makeAccessible(it) }

        // Fill in the EppyBridge stubs for everything that resolved.
        val bridge = mutableClassDefBy(BRIDGE)
        fun stub(name: String) = bridge.methods.single { it.name == name }
        stub("booksForState").replaceBody(
            """
            check-cast p0, $PLAYER_SERVICE
            check-cast p1, $BOOK_STATE
            invoke-virtual {p0, p1}, ${books.smali()}
            move-result-object v0
            return-object v0
            """,
        )
        coverKeys?.let {
            stub("coverKeys").replaceBody(
                """
                check-cast p0, $PLAYER_SERVICE
                invoke-virtual {p0, p1}, ${it.smali()}
                move-result-object v0
                return-object v0
                """,
            )
        }
        loadCovers?.let {
            stub("loadCovers").replaceBody(
                """
                invoke-static {p0, p1}, ${it.smali()}
                move-result-object v0
                return-object v0
                """,
            )
        }
        seekTracking?.let {
            stub("seekTracking").replaceBody(
                """
                check-cast p0, $PLAYER_SERVICE
                invoke-virtual {p0, p1}, ${it.smali()}
                return-void
                """,
            )
        }
        seekTo?.let {
            stub("seekToSeconds").replaceBody(
                """
                check-cast p0, $PLAYER_SERVICE
                invoke-virtual {p0, p1}, ${it.smali()}
                return-void
                """,
            )
        }
        filePosition?.let {
            stub("filePositionSeconds").replaceBody(
                """
                check-cast p0, $PLAYER_SERVICE
                invoke-virtual {p0}, ${it.smali()}
                move-result v0
                return v0
                """,
            )
        }
        jump?.let {
            stub("jumpTo").replaceBody(
                """
                check-cast p0, $PLAYER_SERVICE
                invoke-virtual {p0, p1, p2, p3}, ${it.smali()}
                return-void
                """,
            )
        }
        loadBookmarks?.let {
            stub("loadBookmarks").replaceBody(
                """
                invoke-static {p0, p1}, ${it.smali()}
                move-result-object v0
                return-object v0
                """,
            )
        }
        saveBookmarks?.let {
            stub("saveBookmarks").replaceBody(
                """
                invoke-static {p0, p1, p2}, ${it.smali()}
                return-void
                """,
            )
        }
        loadCharacters?.let {
            stub("loadCharacters").replaceBody(
                """
                invoke-static {p0, p1}, ${it.smali()}
                move-result-object v0
                return-object v0
                """,
            )
        }
        saveCharacters?.let {
            stub("saveCharacters").replaceBody(
                """
                invoke-static {p0, p1, p2}, ${it.smali()}
                return-void
                """,
            )
        }
        setSpeed?.let {
            stub("setSpeed").replaceBody(
                """
                check-cast p0, $PLAYER_SERVICE
                invoke-virtual {p0, p1, p2}, ${it.smali()}
                return-void
                """,
            )
        }
        sleepRemaining?.let {
            stub("sleepRemaining").replaceBody(
                """
                check-cast p0, $PLAYER_SERVICE
                invoke-virtual {p0}, ${it.smali()}
                move-result-object v0
                return-object v0
                """,
            )
        }
        fun objectSetter(stubName: String, ref: MethodReference?, type: String) = ref?.let {
            stub(stubName).replaceBody(
                """
                check-cast p0, $PLAYER_SERVICE
                check-cast p1, $type
                invoke-virtual {p0, p1}, ${it.smali()}
                return-void
                """,
            )
        }
        fun primitiveSetter(stubName: String, ref: MethodReference?) = ref?.let {
            stub(stubName).replaceBody(
                """
                check-cast p0, $PLAYER_SERVICE
                invoke-virtual {p0, p1}, ${it.smali()}
                return-void
                """,
            )
        }
        primitiveSetter("setBoost", setBoost)
        primitiveSetter("setId3Titles", setId3)
        objectSetter("setEqualizer", setEqualizer, "$SABP/EqualizerLevels;")
        objectSetter("setRepeat", setRepeat, "$SABP/RepeatSettings;")
        objectSetter("setSkipStartEnd", setSkipStartEnd, "$SABP/SkipStartEndSettings;")
        stub("isLinked").replaceBody(
            """
            const/4 v0, 0x1
            return v0
            """,
        )
        stub("hookReport").replaceBody(
            """
            const-string v0, "${hooks.encode()}"
            return-object v0
            """,
        )
        hooks.missing().forEach { println("WARNING: eppy: optional hook unavailable: $it") }
    }
}

/** Patch-time record of which SABP targets were found; shown in eppy → Diagnostics. */
private class HookReport {
    private val entries = linkedMapOf<String, String>()

    fun ok(name: String, detail: String) {
        entries[name] = "ok"
    }

    fun <T : Any> optional(name: String, find: () -> T?): T? {
        val found = try {
            find()
        } catch (e: Throwable) {
            entries[name] = "missing: ${e.message ?: e.javaClass.simpleName}"
            return null
        }
        entries[name] = if (found != null) "ok" else "missing: no unique match"
        return found
    }

    fun missing() = entries.filterValues { it != "ok" }.map { "${it.key} (${it.value})" }

    /** name=status;name=status — no quotes or backslashes so it's safe inside const-string. */
    fun encode() = entries.entries.joinToString(";") { (k, v) -> "$k=" + v.replace(Regex("[\"\\\\;=]"), " ") }
}

@Suppress("unused")
val eppyUiPatch = resourcePatch(
    name = "eppy",
    description = "eppy: a new Material 3 player for SABP. A Home screen with Continue Listening and shelves, a " +
        "cover-grid Library, and Now Playing with a circular play button, Add/Remove bookmark, and a " +
        "drag-up sheet: native Chapters, Read along (pair an EPUB/PDF and follow the narration), " +
        "Bookmarks, Details and Up next. Six styles based on reference designs, a floating mini-player, " +
        "adaptive navigation, accessibility and keyboard support. Playback stays on SABP's own engine. " +
        "Best used with Hooman's SABP patch.",
) {
    compatibleWith(smartAudioBookCompatibility)
    dependsOn(eppyUiBytecodePatch, sabp.morphe.patches.smartaudiobook.read.nativeLibsPatch)

    val startScreen by booleanOption(
        key = "startScreen",
        default = true,
        title = "Use eppy as the player",
        description = "Default player interface. On: the app icon, notification, widgets, library and voice " +
            "search all open eppy. Off: they open the classic SABP player. Either way you can switch later in " +
            "eppy Settings → Player interface (with Classic chosen, long-press the app icon → eppy).",
    )
    val defaultSkin by stringOption(
        key = "defaultSkin",
        default = "material",
        values = mapOf(
            "Material You (wallpaper colours)" to "material",
            "Ember: dark with coral, ring player" to "ember",
            "Midnight: deep purple, lilac transcript player" to "midnight",
            "Lavender: light violet glass cards" to "lavender",
            "Paper: warm cream editorial" to "paper",
            "Mono: white, black and yellow" to "mono",
        ),
        title = "Style",
        description = "The look the app starts with, based on the reference designs. Every style can also be " +
            "switched in eppy Settings → Style without re-patching.",
        required = false,
    )
    val speechMatching by booleanOption(
        key = "speechMatching",
        default = false,
        title = "Read-along speech matching",
        description = "Lets Read along match the narration to your EPUB/PDF with Android's on-device speech " +
            "recogniser (Android 13+). Adds the microphone permission, which Android's speech service requires " +
            "even though only the audiobook's own audio is fed to it. You are asked before it's used. Turn off " +
            "to keep read-along to chapter alignment and manual sync only (no microphone permission).",
    )
    val defaultTheme by stringOption(
        key = "defaultTheme",
        default = "system",
        values = mapOf("Follow system" to "system", "Light" to "light", "Dark" to "dark", "Black (AMOLED)" to "black"),
        title = "Default theme",
        description = "Light, dark, black or follow the system. Can be changed later in eppy Settings.",
        required = false,
    )
    val defaultAccent by stringOption(
        key = "defaultAccent",
        default = "wallpaper",
        values = mapOf("Wallpaper (Material You)" to "wallpaper", "Book cover" to "cover", "Custom colour" to "custom"),
        title = "Default accent",
        description = "Where the accent colour comes from. \"Book cover\" picks a readable colour from the " +
            "playing book's artwork. Can be changed later in eppy Settings.",
        required = false,
    )
    val customAccent by stringOption(
        key = "customAccent",
        default = "#E8735A",
        title = "Custom accent colour",
        description = "Hex colour used when the accent is \"Custom colour\", and on Android 11.",
        required = false,
    )

    dependsOn(fontAssetPatch)

    execute {
        // Patch options the extension reads at runtime.
        document("res/values/strings.xml").use { doc ->
            val resources = doc.documentElement
            fun put(name: String, value: String) {
                val existing = (0 until doc.getElementsByTagName("string").length)
                    .map { doc.getElementsByTagName("string").item(it) as Element }
                    .firstOrNull { it.getAttribute("name") == name }
                val el = existing ?: doc.createElement("string").also {
                    it.setAttribute("name", name)
                    it.setAttribute("translatable", "false")
                    resources.appendChild(it)
                }
                el.textContent = value
            }
            put("eppy_default_theme", defaultTheme ?: "system")
            put("eppy_default_accent", defaultAccent ?: "wallpaper")
            put("eppy_custom_accent", customAccent ?: "#E8735A")
            put("eppy_default_skin", defaultSkin ?: "material")
            put("eppy_speech", if (speechMatching == true) "on" else "off")
            put("eppy_version", EPPY_VERSION)
            put("eppy_default_interface", if (startScreen != false) "eppy" else "classic")
        }

        document("AndroidManifest.xml").use { doc ->
            val application = doc.getElementsByTagName("application").item(0) as Element
            val activities = doc.getElementsByTagName("activity")
            val player = (0 until activities.length).map { activities.item(it) as Element }
                .firstOrNull { it.getAttribute("android:name") == "ak.alizandro.smartaudiobookplayer.PlayerActivity" }
                ?: throw PatchException("Smart AudioBook Player: PlayerActivity is missing from the manifest.")

            val eppy = doc.createElement("activity").apply {
                setAttribute("android:name", EPPY_ACTIVITY)
                setAttribute("android:exported", "true")
                setAttribute("android:label", "@string/app_name")
                setAttribute("android:theme", "@android:style/Theme.Material.NoActionBar")
                setAttribute("android:launchMode", "singleTask")
                setAttribute("android:windowSoftInputMode", "adjustResize")
                setAttribute(
                    "android:configChanges",
                    "orientation|screenSize|screenLayout|smallestScreenSize|keyboard|keyboardHidden|navigation|uiMode|density|fontScale",
                )
                setAttribute("android:resizeableActivity", "true")
            }

            // MAIN/LAUNCHER moves to eppy's activity; the router then opens whichever player
            // interface is chosen, so the icon always respects the setting.
            val launcherFilter = (0 until player.childNodes.length)
                .mapNotNull { player.childNodes.item(it) as? Element }
                .firstOrNull { filter ->
                    val cats = filter.getElementsByTagName("category")
                    (0 until cats.length).any {
                        (cats.item(it) as Element).getAttribute("android:name") == "android.intent.category.LAUNCHER"
                    }
                }
            if (launcherFilter != null) {
                player.removeChild(launcherFilter)
                eppy.appendChild(launcherFilter)
            } else {
                eppy.appendChild(newLauncherFilter(doc))
            }
            application.appendChild(eppy)

            if (speechMatching == true) {
                val perms = doc.getElementsByTagName("uses-permission")
                val has = (0 until perms.length).any {
                    (perms.item(it) as Element).getAttribute("android:name") == "android.permission.RECORD_AUDIO"
                }
                if (!has) {
                    doc.documentElement.insertBefore(
                        doc.createElement("uses-permission").apply { setAttribute("android:name", "android.permission.RECORD_AUDIO") },
                        application,
                    )
                }
                // Lets the app find the system speech recogniser on Android 11+ (package visibility).
                val queries = doc.getElementsByTagName("queries").item(0) as? Element
                    ?: doc.createElement("queries").also { doc.documentElement.insertBefore(it, application) }
                queries.appendChild(doc.createElement("intent").apply {
                    appendChild(doc.createElement("action").apply { setAttribute("android:name", "android.speech.RecognitionService") })
                })
            }
        }
    }
}


private fun Method.methodCalls(): List<MethodReference> =
    implementation?.instructions?.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }.orEmpty()

private fun Method.hasString(value: String): Boolean = implementation?.instructions?.any {
    ((it as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.StringReference)?.string == value
} == true

private fun Method.asReference(): MethodReference =
    com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference(definingClass, name, parameterTypes, returnType)

private fun MethodReference.smali(): String =
    "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

private fun MutableMethod.replaceBody(smali: String) {
    removeInstructions(0, instructions.size)
    addInstructions(0, smali.trimIndent())
}

/** Makes a package-private method (and its class) public. Private methods are left alone. */
private fun BytecodePatchContext.makeAccessible(ref: MethodReference) {
    val cls = mutableClassDefBy(ref.definingClass)
    if (cls.accessFlags and AccessFlags.PUBLIC.value == 0) {
        cls.accessFlags = cls.accessFlags or AccessFlags.PUBLIC.value
    }
    val method = cls.methods.firstOrNull {
        it.name == ref.name && it.returnType == ref.returnType &&
            it.parameterTypes.map(CharSequence::toString) == ref.parameterTypes.map(CharSequence::toString)
    } ?: throw PatchException("Smart AudioBook Player: ${ref.name} not found in ${ref.definingClass}.")
    val flags = method.accessFlags
    if (flags and AccessFlags.PRIVATE.value != 0) {
        throw PatchException("Smart AudioBook Player: ${ref.name} is private and cannot be called from the extension.")
    }
    if (flags and AccessFlags.PUBLIC.value == 0) {
        method.accessFlags = (flags and AccessFlags.PROTECTED.value.inv()) or AccessFlags.PUBLIC.value
    }
}
