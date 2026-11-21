package io.github.kljjh.flymelyrics

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal object OfficialHooks {
    const val LOCKSCREEN = "Lapp/morphe/extension/music/patches/lyrics/session/LockScreenLyrics;"
    const val MINIPLAYER = "Lapp/morphe/extension/music/patches/lyrics/session/MiniplayerLyrics;"
    const val UTILS = "Lapp/morphe/extension/shared/Utils;"
    const val BRIDGE = "Lio/github/kljjh/flymelyrics/FlymeController;"
    const val PANEL_INSTALLER = "Lapp/morphe/extension/music/patches/lyrics/ui/LyricsPanelInstaller;"
    private const val SESSION = "Landroid/media/session/MediaSession;"
    private const val METADATA = "Landroid/media/MediaMetadata;"
    private const val STATE = "Landroid/media/session/PlaybackState;"
    private const val CONTEXT = "Landroid/content/Context;"
    private const val PREFIX = "flymeLyricsAddon"
    const val MISSING_OFFICIAL = "Select Third-party lyrics from the official Morphe source together with Flyme status bar lyrics, then patch the original YouTube Music APK. Official lyrics hooks are missing."

    private fun Method.calls(owner: String, name: String, parameters: List<String>, result: String) =
        implementation?.instructions?.withIndex()?.filter { (_, insn) ->
            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
            ref != null && ref.definingClass == owner && ref.name == name &&
                    ref.parameterTypes.map { it.toString() } == parameters && ref.returnType == result
        }?.map { it.index } ?: emptyList()

    // This call is inserted in official lyricsPatch.execute. Media-session calls
    // are inserted in a different finalize block and cannot establish selection here.
    fun hostHooks(cls: ClassDef): Boolean =
        cls.methods.any { it.calls(PANEL_INSTALLER, "onTabSelected", listOf("Landroid/view/ViewGroup;"), "V").isNotEmpty() }

    fun requireSelection(selected: Boolean) {
        if (!selected) throw PatchException(MISSING_OFFICIAL)
    }

    fun instrument(cls: MutableClass) {
        fun fail(detail: String): Nothing = throw PatchException("Unsupported official Third-party lyrics layout: $detail. Tested with official Morphe 2.1.0.")
        fun method(name: String, parameters: List<String> = emptyList(), result: String = "V"): MutableMethod =
            cls.methods.singleOrNull { it.name == name && it.parameterTypes.map { t -> t.toString() } == parameters && it.returnType == result && AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null }
                ?: fail("missing static $name")
        if (cls.methods.any { it.name.startsWith(PREFIX) }) fail("add-on is already present; use an original APK")
        val metadata = method("onMediaSessionSetMetadata", listOf(SESSION, METADATA))
        val playback = method("onPlaybackState", listOf(STATE))


        fun helper(name: String, params: List<String>, registers: Int, code: String) {
            cls.methods.add(ImmutableMethod(LOCKSCREEN, PREFIX + name,
                params.map { ImmutableMethodParameter(it, emptySet(), null) }, "V",
                AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value,
                emptySet(), null, MutableMethodImplementation(registers)).toMutable().apply { addInstructions(0, code) })
        }
        helper("Metadata", listOf(SESSION, METADATA), 3, """
            invoke-static {}, $UTILS->getContext()$CONTEXT
            move-result-object v0
            invoke-static {v0, p0, p1}, $BRIDGE->onMetadata($CONTEXT$SESSION$METADATA)V
            return-void
        """)
        helper("Playback", listOf(STATE), 2, """
            invoke-static {}, $UTILS->getContext()$CONTEXT
            move-result-object v0
            invoke-static {v0, p0}, $BRIDGE->onPlaybackState($CONTEXT$STATE)V
            return-void
        """)
        // Calculate every insertion against original instruction indices, then insert backwards.
        val insertions = mutableMapOf<MutableMethod, MutableList<Pair<Int, String>>>()
        fun at(m: MutableMethod, index: Int, code: String) { insertions.getOrPut(m) { mutableListOf() }.add(index to code) }
        at(metadata, 0, "invoke-static/range {p0 .. p1}, $LOCKSCREEN->${PREFIX}Metadata($SESSION$METADATA)V")
        at(playback, 0, "invoke-static/range {p0 .. p0}, $LOCKSCREEN->${PREFIX}Playback($STATE)V")
        insertions.forEach { (m, edits) -> edits.sortedByDescending { it.first }.forEach { (index, code) -> m.addInstruction(index, code) } }
    }

    fun validateReader(lookup: (String) -> ClassDef?) {
        val base = "Lapp/morphe/extension/music/patches/lyrics/"
        val mgr = "${base}LyricsManager;"
        val track = "${base}model/TrackInfo;"
        val string = "Ljava/lang/String;"
        val bool = "Lapp/morphe/extension/shared/settings/BooleanSetting;"
        val settings = lookup("Lapp/morphe/extension/music/settings/Settings;")
        if (settings?.fields?.any { it.name == "LYRICS_ENABLED" && it.type == bool && AccessFlags.STATIC.isSet(it.accessFlags) } != true)
            throw PatchException("Unsupported official master lyrics setting")
        fun requireApi(owner: String, name: String, params: List<String>, result: String, static: Boolean) {
            if (lookup(owner)?.methods?.none { it.name == name && it.parameterTypes.map { p -> p.toString() } == params &&
                        it.returnType == result && AccessFlags.STATIC.isSet(it.accessFlags) == static && AccessFlags.PUBLIC.isSet(it.accessFlags) } != false)
                throw PatchException("Unsupported official lyrics API: $owner->$name")
        }
        requireApi("Lapp/morphe/extension/shared/theme/ThemeUtils;", "getAppForegroundColor", emptyList(), "I", true)
        val chars = "Ljava/lang/CharSequence;"
        val action = "Ljava/lang/Runnable;"
        requireApi("Lapp/morphe/extension/shared/ui/CustomDialog;", "create", listOf("Landroid/content/Context;", chars, chars,
                "Landroid/widget/EditText;", chars, action, action, chars, action, "Z"), "Landroid/util/Pair;", true)
        requireApi(bool, "get", emptyList(), "Ljava/lang/Boolean;", false)
        requireApi("${base}model/MetadataCleaner;", "parseCleanTitleAndArtist", listOf(string, string), "[$string", true)
        requireApi(mgr, "getInstance", emptyList(), mgr, true)
        requireApi(mgr, "getCurrentTrack", emptyList(), track, false)
        requireApi(mgr, "areLyricsSynced", emptyList(), "Z", false)
        requireApi(mgr, "getCurrentLineText", emptyList(), string, false)
        for (name in listOf("title", "artist")) requireApi(track, name, emptyList(), string, false)
    }
    const val FORMATTER = "Lapp/morphe/extension/music/patches/lyrics/model/MiniLyricsFormatter;"
    const val PRESENTATION = "Lapp/morphe/extension/music/patches/lyrics/LyricsPresentation;"
    private const val TIMING = "Lio/github/kljjh/flymelyrics/FlymeTiming;"
    fun instrumentTiming(formatter: MutableClass, presentation: MutableClass) {
        val string = "Ljava/lang/String;"
        val params = listOf(string, "Lapp/morphe/extension/music/patches/lyrics/model/LyricsLine;", string, string)
        fun target(cls: MutableClass, name: String, args: List<String>, result: String) = cls.methods.singleOrNull {
            it.name == name && it.parameterTypes.map { type -> type.toString() } == args && it.returnType == result &&
                AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null
        } ?: throw PatchException("Unsupported official timing method: ${cls.type}->$name")
        val select = target(formatter, "selectionPosition", listOf("J", "I"), "J")
        val present = target(presentation, "present", params, string)
        val mini = target(presentation, "miniLine", listOf("Lapp/morphe/extension/music/patches/lyrics/model/Lyrics;", "J", "J", string, string), string)
        if (mini.calls(FORMATTER, "selectionPosition", listOf("J", "I"), "J").size != 1 ||
            mini.calls(PRESENTATION, "present", params, string).isEmpty() || present.implementation!!.registerCount <= params.size ||
            select.implementation!!.registerCount > 255 || present.implementation!!.registerCount > 255)
            throw PatchException("Unsupported official mini-player timing layout")
        select.addInstructions(0, """
            invoke-static/range {p2 .. p2}, $TIMING->offset(I)I
            move-result p2
        """)
        // present() also advances the official artist/subtitle carousel. A Flyme-only
        // read at a different position must return the text without advancing it.
        present.addInstructionsWithLabels(0, """
            invoke-static {}, $TIMING->isStatusRead()Z
            move-result v0
            if-eqz v0, :official
            return-object p0
        """, ExternalLabel("official", present.implementation!!.instructions.first()))
    }
    const val PREFS = "Lapp/morphe/extension/music/settings/preference/MusicPreferenceFragment;"
    fun instrumentSettings(mini: MutableClass, prefs: MutableClass) {
        fun hook(cls: MutableClass, name: String, isStatic: Boolean, instruction: String) {
            val method = cls.methods.singleOrNull { it.name == name && it.parameterTypes.isEmpty() && it.returnType == "V" &&
                    it.implementation != null && AccessFlags.STATIC.isSet(it.accessFlags) == isStatic }
                ?: throw PatchException("Unsupported official settings hook: ${cls.type}->$name")
            method.addInstruction(0, instruction)
        }
        // This callback runs for master setting changes, even with the mini-player switched off.
        hook(mini, "onSettingsChanged", true, "invoke-static {}, $BRIDGE->refresh()V")
        hook(prefs, "onStart", false, "invoke-static/range {p0 .. p0}, Lio/github/kljjh/flymelyrics/FlymePreference;->install(Landroid/preference/PreferenceFragment;)V")
    }
}
