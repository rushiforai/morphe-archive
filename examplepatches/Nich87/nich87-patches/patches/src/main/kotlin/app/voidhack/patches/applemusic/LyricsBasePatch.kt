package app.voidhack.patches.applemusic

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val LYRICS_CONTROLLER = "Lapp/voidhack/extension/applemusic/lyrics/LrclibController;"
internal const val LYRICS_FEATURES = "Lapp/voidhack/extension/applemusic/lyrics/LyricsFeatures;"
internal const val LYRICS_INTERLUDES = "Lapp/voidhack/extension/applemusic/lyrics/LyricsInterludes;"
internal const val LYRICS_REFLECTION = "Lapp/voidhack/extension/applemusic/lyrics/LrclibReflection;"
internal const val KARAOKE_HOOK = "Lapp/voidhack/extension/applemusic/lyrics/KaraokePronunciation;"
internal const val PLAYBACK_ITEM = "Lcom/apple/android/music/model/PlaybackItem;"
internal const val SONG_INFO_PTR = "Lcom/apple/android/music/ttml/javanative/model/SongInfo\$SongInfoPtr;"
internal const val LYRICS_VM = "Lcom/apple/android/music/player/viewmodel/PlayerLyricsViewModel;"
internal const val LYRICS_FRAGMENT = "Lcom/apple/android/music/player/fragment/PlayerLyricsViewFragment;"
internal const val NATIVE_RENDER_LYRICS = "voidhackNativeRenderLyrics"

internal fun BytecodePatchContext.enableLyricsFeature(methodName: String) {
    val method = mutableClassDefBy(LYRICS_FEATURES).methods.single {
        it.name == methodName && it.parameterTypes.isEmpty() && it.returnType == "Z"
    }
    method.replaceInstruction(0, "const/4 v0, 0x1")
}

private object AppleMusicApplicationCreate : Fingerprint(
    definingClass = "Lcom/apple/android/music/AppleMusicApplication;",
    name = "onCreate",
    parameters = emptyList(),
    returnType = "V",
)

private object PlayerLyricsLoad : Fingerprint(
    definingClass = LYRICS_VM,
    name = "loadLyrics",
    parameters = listOf(PLAYBACK_ITEM),
    returnType = "V",
)

private object PlayerLyricsLoadCoroutine : Fingerprint(
    name = "invokeSuspend",
    parameters = listOf("Ljava/lang/Object;"),
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("loadLyrics(): Cannot cache lyrics: currentPlaybackItem ("),
    ),
    custom = { _, classDef ->
        classDef.type.startsWith("Lcom/apple/android/music/player/viewmodel/PlayerLyricsViewModel\$")
    },
)

private object LyricsFragmentRender : Fingerprint(
    definingClass = LYRICS_FRAGMENT,
    parameters = listOf(SONG_INFO_PTR),
    returnType = "V",
    filters = listOf(
        methodCall(definingClass = PLAYBACK_ITEM, name = "hasCustomLyrics", returnType = "Z"),
        methodCall(
            definingClass = "Lcom/apple/android/music/ttml/javanative/model/SongInfo\$SongInfoNative;",
            name = "getAdamId",
            returnType = "J",
        ),
    ),
)

private object LyricsClock : Fingerprint(
    definingClass = "Lcom/apple/android/music/ttml/SongInfoTimeProcessor;",
    name = "processEvents",
    returnType = "J",
    filters = listOf(methodCall(name = "processEvents_")),
    custom = { method, _ -> method.parameterTypes.take(2) == listOf(SONG_INFO_PTR, "J") },
)

internal val lrclibLyricsResources = resourcePatch {
    execute {
        listOf("values", "values-ja").forEach { directory ->
            checkNotNull(
                AppleMusicApplicationCreate::class.java.getResourceAsStream(
                    "/applemusic/lyrics/$directory/voidhack_lrclib_lyrics.xml",
                ),
            ).use { input ->
                document(input).use { translations ->
                    document("res/$directory/strings.xml").use { destination ->
                        val entries = translations.getElementsByTagName("string")
                        for (index in 0 until entries.length) {
                            destination.documentElement.appendChild(
                                destination.importNode(entries.item(index), true),
                            )
                        }
                    }
                }
            }
        }
    }
}

/**
 * Shared internal TTML / lyrics lifecycle pipeline used by LRCLIB lyrics,
 * On-device pronunciation guides, and Lyrics editor so any combination of those
 * patches composes cleanly without duplicating hooks.
 */
internal val lyricsBasePatch = bytecodePatch {
    dependsOn(
        lrclibLyricsResources,
        appleMusicOfficialPronunciation,
    )
    extendWith("extensions/extension.mpe")

    execute {
        // 1. Capture application context on app startup.
        AppleMusicApplicationCreate.method.addInstruction(
            0,
            "invoke-static/range {p0 .. p0}, $LYRICS_CONTROLLER->captureContext(Landroid/content/Context;)V",
        )

        // 2. Track active lyrics ViewModel & PlaybackItem, and dispatch custom/external loading when enabled.
        PlayerLyricsLoad.method.addInstructionsWithLabels(
            0,
            """
                invoke-static {p0, p1}, $LYRICS_CONTROLLER->onLoadLyrics(Ljava/lang/Object;Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :voidhack_continue_load
                return-void
                :voidhack_continue_load
                nop
            """,
        )

        // 3. Intercept both native emit sites inside PlayerLyricsViewModel$f.invokeSuspend(Object)Object.
        val coroutineMethod = PlayerLyricsLoadCoroutine.method
        val coroutineInstructions = coroutineMethod.instructions
        val emitIndices = coroutineInstructions.withIndex()
            .filter { (_, inst) ->
                val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == LYRICS_VM && ref.name == "access\$getMLyricsResult\$p"
            }
            .map { it.index }
            .sortedDescending()

        check(emitIndices.size >= 2) {
            "Expected at least 2 emit sites in PlayerLyricsViewModel coroutine, found ${emitIndices.size}"
        }

        for (emitStart in emitIndices) {
            val vmCall = coroutineMethod.instructions[emitStart] as FiveRegisterInstruction
            val vmReg = vmCall.registerC

            var pairInitIndex = -1
            var buildMapIndex = -1
            for (idx in emitStart + 1 until minOf(emitStart + 12, coroutineMethod.instructions.size)) {
                val ref = (coroutineMethod.instructions[idx] as? ReferenceInstruction)?.reference as? MethodReference
                    ?: continue
                if (ref.definingClass == "Lkotlin/Pair;" && ref.name == "<init>") {
                    pairInitIndex = idx
                } else if (ref.definingClass == LYRICS_VM && ref.name == "access\$buildTimeRangeToLyricsMap") {
                    buildMapIndex = idx
                    break
                }
            }
            check(pairInitIndex > emitStart && buildMapIndex > pairInitIndex) {
                "Could not locate Pair.<init> and access\$buildTimeRangeToLyricsMap after emit site $emitStart"
            }

            val pairInit = coroutineMethod.instructions[pairInitIndex] as FiveRegisterInstruction
            val firstReg = pairInit.registerD
            val secondReg = pairInit.registerE
            val targetAfterEmit = coroutineMethod.instructions[buildMapIndex + 1]
            val localCount = checkNotNull(coroutineMethod.implementation).registerCount - 2
            val scratchReg = (0 until localCount).first { it != vmReg && it != firstReg && it != secondReg }

            val fmtReg = { reg: Int ->
                if (reg < localCount) "v$reg" else "p${reg - localCount}"
            }

            coroutineMethod.addInstructionsWithLabels(
                emitStart,
                """
                    invoke-static {${fmtReg(vmReg)}, ${fmtReg(firstReg)}}, $LYRICS_CONTROLLER->prepareNativeLyrics(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object ${fmtReg(firstReg)}
                    check-cast ${fmtReg(firstReg)}, $SONG_INFO_PTR
                    invoke-static {${fmtReg(vmReg)}, ${fmtReg(firstReg)}, ${fmtReg(secondReg)}}, $LYRICS_CONTROLLER->onNativeLyricsResult(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)Z
                    move-result v$scratchReg
                    if-eqz v$scratchReg, :voidhack_emit_native
                    goto :voidhack_skip_emit
                    :voidhack_emit_native
                    nop
                """,
                ExternalLabel("voidhack_skip_emit", targetAfterEmit),
            )
        }

        // 4. Rename-and-wrap PlayerLyricsViewFragment.w2(SongInfoPtr)V to notify active song & rendered callbacks.
        val lyricsClass = LyricsFragmentRender.classDef
        val renderMethod = LyricsFragmentRender.method
        val origRenderName = renderMethod.name
        val origRenderAccess = renderMethod.accessFlags
        val nativeRenderName = NATIVE_RENDER_LYRICS
        renderMethod.name = nativeRenderName
        val renderWrapper = ImmutableMethod(
            lyricsClass.type,
            origRenderName,
            renderMethod.parameters,
            "V",
            origRenderAccess,
            null,
            null,
            MutableMethodImplementation(3),
        ).toMutable()
        renderWrapper.addInstructions(
            0,
            """
                invoke-static {p1}, $LYRICS_INTERLUDES->setActiveSong(Ljava/lang/Object;)V
                invoke-virtual {p0, p1}, $LYRICS_FRAGMENT->$nativeRenderName($SONG_INFO_PTR)V
                invoke-static {p0, p1}, $LYRICS_CONTROLLER->onLyricsRendered(Ljava/lang/Object;Ljava/lang/Object;)V
                return-void
            """,
        )
        lyricsClass.methods.add(renderWrapper)

        // 5. Observe SongInfoTimeProcessor ticks for interludes and karaoke pronunciation.
        LyricsClock.method.addInstructions(
            0,
            "invoke-static/range {p0 .. p3}, $KARAOKE_HOOK->syncPosition(Ljava/lang/Object;Ljava/lang/Object;J)V",
        )

        // 6. Add dynamic Lyrics settings entry to Apple Music Settings.
        LibrarySettingsCreated.method.addInstruction(
            0,
            "invoke-static/range {p0 .. p0}, $LYRICS_CONTROLLER->attachSettings(Ljava/lang/Object;)V",
        )
        LibrarySettingsItems.method.apply {
            checkNotNull(implementation).instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }.reversed().forEach { (index, instruction) ->
                    val register = (instruction as OneRegisterInstruction).registerA
                    addInstructions(
                        index,
                        """
                            invoke-static/range {v$register .. v$register}, $LYRICS_CONTROLLER->withSettings(Ljava/util/List;)Ljava/util/List;
                            move-result-object v$register
                        """,
                    )
                }
        }
    }
}
