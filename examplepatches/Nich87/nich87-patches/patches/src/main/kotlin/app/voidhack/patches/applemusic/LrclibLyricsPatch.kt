package app.voidhack.patches.applemusic

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private object LyricsAvailableCheck : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf(PLAYBACK_ITEM),
    filters = listOf(
        methodCall(definingClass = PLAYBACK_ITEM, name = "hasLyrics", returnType = "Z"),
        methodCall(definingClass = PLAYBACK_ITEM, name = "hasCustomLyrics", returnType = "Z"),
    ),
    custom = { _, classDef -> classDef.type.startsWith("Lcom/apple/android/music/player/") },
)

private object LyricsFragmentControlsAnimator : Fingerprint(
    definingClass = LYRICS_FRAGMENT,
    parameters = listOf("I"),
    returnType = "Landroid/animation/Animator;",
)

private object LyricsFragmentHideControls : Fingerprint(
    definingClass = LYRICS_FRAGMENT,
    parameters = listOf("I", "Z"),
    returnType = "V",
)

private object LyricsFragmentShowControls : Fingerprint(
    definingClass = LYRICS_FRAGMENT,
    parameters = listOf("I"),
    returnType = "V",
    filters = listOf(
        opcode(Opcode.INVOKE_SUPER),
        fieldAccess(type = "Lcom/apple/android/music/common/views/VocalAttenuationControl;"),
        methodCall(
            definingClass = "Landroid/view/View;",
            name = "setVisibility",
            returnType = "V",
        ),
    ),
)

private object LyricsFragmentOfflineCheck : Fingerprint(
    definingClass = LYRICS_FRAGMENT,
    parameters = emptyList(),
    returnType = "Z",
    filters = listOf(
        methodCall(definingClass = PLAYBACK_ITEM, name = "hasOfflineLyrics", returnType = "Z"),
    ),
)

@Suppress("unused")
val lrclibLyricsPatch = bytecodePatch(
    name = "LRCLIB lyrics",
    description = "Loads synced and unsynced local LRC files (per-song or auto-matched folder), pasted plain-text/LRC lyrics, and LRCLIB lyrics with per-song overrides, timing offsets, LRC export, and a source indicator.",
) {

    dependsOn(
        lyricsBasePatch,
        lyricsScrollSyncPatch,
    )
    compatibleWith(appleMusicCompatibility)
    extendWith("extensions/extension.mpe")

    execute {
        enableLyricsFeature("lrclib")

        // 1. Enable Now Playing lyrics button for tracks missing official lyrics (rename-and-wrap because p0 is clobbered).
        val availClass = LyricsAvailableCheck.classDef
        val availMethod = LyricsAvailableCheck.method
        val origAvailName = availMethod.name
        val origAvailAccess = availMethod.accessFlags
        val nativeAvailName = "voidhackNativeHasLyrics"
        availMethod.name = nativeAvailName

        val availWrapper = ImmutableMethod(
            availClass.type,
            origAvailName,
            availMethod.parameters,
            "Z",
            origAvailAccess,
            null,
            null,
            MutableMethodImplementation(2),
        ).toMutable()
        availWrapper.addInstructions(
            0,
            """
                invoke-static {p0}, ${availClass.type}->$nativeAvailName($PLAYBACK_ITEM)Z
                move-result v0
                invoke-static {p0, v0}, $LYRICS_CONTROLLER->hasLyrics(Ljava/lang/Object;Z)Z
                move-result v0
                return v0
            """,
        )
        availClass.methods.add(availWrapper)

        // 2. Allow rendering injected LRCLIB / local SongInfoPtr even on non-numeric item IDs (e.g. uploaded tracks).
        //    LyricsBasePatch renamed the native render method to NATIVE_RENDER_LYRICS and wrapped its original name.
        val lyricsClass = mutableClassDefBy(LYRICS_FRAGMENT)
        val renderMethod = lyricsClass.methods.single {
            it.name == NATIVE_RENDER_LYRICS &&
                it.parameterTypes == listOf(SONG_INFO_PTR) &&
                it.returnType == "V"
        }
        val hasCustomCallIdx = renderMethod.instructions.withIndex().first { (_, inst) ->
            val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == PLAYBACK_ITEM && ref.name == "hasCustomLyrics"
        }.index
        val moveResultIdx = hasCustomCallIdx + 1
        val hasCustomReg = (renderMethod.instructions[moveResultIdx] as OneRegisterInstruction).registerA
        renderMethod.addInstructions(
            moveResultIdx + 1,
            """
                invoke-static {v0, v1, v$hasCustomReg}, $LYRICS_CONTROLLER->shouldAllowRender(Ljava/lang/Object;Ljava/lang/Object;Z)Z
                move-result v$hasCustomReg
            """,
        )

        // 3. Sync lyrics source pill fade & visibility with native controls in PlayerLyricsViewFragment.
        val animMethod = LyricsFragmentControlsAnimator.method
        val origAnimName = animMethod.name
        val origAnimAccess = animMethod.accessFlags
        val nativeAnimName = "voidhackNativeControlsAnimator"
        animMethod.name = nativeAnimName
        val animWrapper = ImmutableMethod(
            lyricsClass.type,
            origAnimName,
            animMethod.parameters,
            "Landroid/animation/Animator;",
            origAnimAccess,
            null,
            null,
            MutableMethodImplementation(3),
        ).toMutable()
        animWrapper.addInstructions(
            0,
            """
                invoke-virtual {p0, p1}, $LYRICS_FRAGMENT->$nativeAnimName(I)Landroid/animation/Animator;
                move-result-object v0
                invoke-static {p0, p1, v0}, $LYRICS_CONTROLLER->wrapControlsAnimator(Ljava/lang/Object;ILandroid/animation/Animator;)Landroid/animation/Animator;
                move-result-object v0
                return-object v0
            """,
        )
        lyricsClass.methods.add(animWrapper)

        LyricsFragmentHideControls.method.addInstruction(
            0,
            "invoke-static {p0, p1, p2}, $LYRICS_CONTROLLER->onControlsVisibilityChanged(Ljava/lang/Object;IZ)V",
        )
        LyricsFragmentShowControls.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                invoke-static {p0, p1, v0}, $LYRICS_CONTROLLER->onControlsVisibilityChanged(Ljava/lang/Object;IZ)V
            """,
        )

        // 4. Keep cached / pinned LRCLIB lyrics open offline (PlayerLyricsViewFragment.q2()Z).
        val offlineMethod = LyricsFragmentOfflineCheck.method
        val origOfflineName = offlineMethod.name
        val origOfflineAccess = offlineMethod.accessFlags
        val nativeOfflineName = "voidhackNativeHasOfflineLyrics"
        offlineMethod.name = nativeOfflineName
        val offlineWrapper = ImmutableMethod(
            lyricsClass.type,
            origOfflineName,
            offlineMethod.parameters,
            "Z",
            origOfflineAccess,
            null,
            null,
            MutableMethodImplementation(2),
        ).toMutable()
        offlineWrapper.addInstructions(
            0,
            """
                invoke-virtual {p0}, $LYRICS_FRAGMENT->$nativeOfflineName()Z
                move-result v0
                invoke-static {p0, v0}, $LYRICS_CONTROLLER->hasOfflineCachedLyrics(Ljava/lang/Object;Z)Z
                move-result v0
                return v0
            """,
        )
        lyricsClass.methods.add(offlineWrapper)

        // 5. Keep player controls visible on PlayerLyricsViewFragment when lyrics are missing/loading/instrumental,
        //    and attach LRC corner badge + long-press on player_lyrics & source pill via base onViewCreated.
        val midClassType = checkNotNull(lyricsClass.superclass) { "Missing superclass of PlayerLyricsViewFragment" }
        val midClass = mutableClassDefBy(midClassType)
        val setControlsVisibilityMethod = midClass.methods.single { method ->
            method.returnType == "V" &&
                method.parameters.map { it.type } == listOf("I", "[I")
        }
        setControlsVisibilityMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static {p0, p1}, $LYRICS_CONTROLLER->shouldBlockControlsVisibilityChange(Ljava/lang/Object;I)Z
                move-result v0
                if-eqz v0, :voidhack_allow_controls_vis
                return-void
                :voidhack_allow_controls_vis
                nop
            """,
        )
        val basePlayerType = checkNotNull(midClass.superclass) { "Missing superclass of $midClassType" }
        val basePlayerClass = mutableClassDefBy(basePlayerType)
        val baseOnViewCreated = basePlayerClass.methods.first { method ->
            method.name == "onViewCreated" &&
                method.parameters.map { it.type } == listOf("Landroid/view/View;", "Landroid/os/Bundle;")
        }
        baseOnViewCreated.addInstruction(
            0,
            "invoke-static {p0, p1}, $LYRICS_CONTROLLER->onPlayerViewCreated(Ljava/lang/Object;Landroid/view/View;)V",
        )
    }
}
