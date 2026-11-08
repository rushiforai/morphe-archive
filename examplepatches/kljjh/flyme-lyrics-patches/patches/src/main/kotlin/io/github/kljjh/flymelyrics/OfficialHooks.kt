package io.github.kljjh.flymelyrics

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal object OfficialHooks {
    const val LOCKSCREEN = "Lapp/morphe/extension/music/patches/lyrics/session/LockScreenLyrics;"
    const val MINIPLAYER = "Lapp/morphe/extension/music/patches/lyrics/session/MiniplayerLyrics;"
    const val UTILS = "Lapp/morphe/extension/shared/Utils;"
    const val BRIDGE = "Lio/github/kljjh/flymelyrics/FlymeLyrics;"
    const val PANEL_INSTALLER = "Lapp/morphe/extension/music/patches/lyrics/ui/LyricsPanelInstaller;"
    private const val LYRICS_MANAGER = "Lapp/morphe/extension/music/patches/lyrics/LyricsManager;"
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
        method("mediaSession", result = SESSION)

        fun helper(name: String, params: List<String>, registers: Int, code: String) {
            cls.methods.add(ImmutableMethod(LOCKSCREEN, PREFIX + name,
                params.map { ImmutableMethodParameter(it, emptySet(), null) }, "V",
                AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value,
                emptySet(), null, MutableMethodImplementation(registers)).toMutable().apply { addInstructions(0, code) })
        }
        helper("Emit", listOf("Ljava/lang/String;"), 3, """
            invoke-static {}, $UTILS->getContext()$CONTEXT
            move-result-object v0
            invoke-static {}, $LOCKSCREEN->mediaSession()$SESSION
            move-result-object v1
            invoke-static {v0, v1, p0}, $BRIDGE->onLine($CONTEXT${SESSION}Ljava/lang/String;)V
            return-void
        """)
        helper("Clear", emptyList(), 1, """
            invoke-static {}, $UTILS->getContext()$CONTEXT
            move-result-object v0
            invoke-static {v0}, $BRIDGE->clear($CONTEXT)V
            return-void
        """)
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

    fun instrumentMiniplayer(cls: MutableClass) {
        fun fail(detail: String): Nothing = throw PatchException("Unsupported official mini-player lyrics layout: $detail. Tested with official Morphe 2.1.0.")
        fun method(name: String): MutableMethod =
            cls.methods.singleOrNull { it.name == name && it.parameterTypes.isEmpty() && it.returnType == "V" && AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null }
                ?: fail("missing static $name")

        val update = method("update")
        val restore = method("restoreIfMirrored")
        if (update.calls(LOCKSCREEN, "${PREFIX}Emit", listOf("Ljava/lang/String;"), "V").isNotEmpty() ||
            restore.calls(LOCKSCREEN, "${PREFIX}Clear", emptyList(), "V").isNotEmpty()
        ) fail("add-on is already present; use an original APK")
        val lineIndex = update.calls(LYRICS_MANAGER, "getCurrentLineText", emptyList(), "Ljava/lang/String;").singleOrNull()
            ?: fail("getCurrentLineText call is not unique")
        val next = update.implementation!!.instructions.elementAtOrNull(lineIndex + 1)
        if (next?.opcode != Opcode.MOVE_RESULT_OBJECT) fail("mini-player lyric return register changed")
        val lineRegister = (next as OneRegisterInstruction).registerA
        update.addInstruction(lineIndex + 2, "invoke-static/range {v$lineRegister .. v$lineRegister}, $LOCKSCREEN->${PREFIX}Emit(Ljava/lang/String;)V")
        restore.addInstruction(0, "invoke-static {}, $LOCKSCREEN->${PREFIX}Clear()V")
    }

}
