/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.facer

import app.fakh.patches.facer.shared.Constants.COMPATIBILITY_FACER_PHONE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val AUTOPLAY_EXT = "Lapp/fakh/extension/facer/FacerAutoplay;"

/** `ExoPlayerPool` creator lambda that builds a Media3 ExoPlayer and calls `setPlayWhenReady(true)`. */
private val exoPlayerPoolCreateFingerprint = Fingerprint(
    strings = listOf("looks_media_cache_", "exoplayer_internal.db"),
)

/** `ExoPlayerPool` reuse lambda that resets a pooled ExoPlayer and calls `setPlayWhenReady(true)`. */
private val exoPlayerPoolReuseFingerprint = Fingerprint(
    strings = listOf("reference", "exoPlayer", "key", "uri"),
)

/** `ExoPlayerPool.kt` pool-type sealed class (`"creation"`, `"detail"`, `"feed"`). */
private val poolTypeFeedFingerprint = Fingerprint(
    name = "<clinit>",
    strings = listOf("feed"),
)

/** `VideoViewBinder.b(View, String)` starts legacy `VideoView` and `SimpleExoPlayerView` immediately. */
private val videoViewBinderFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Ljava/lang/String;"),
    custom = { method, _ ->
        method.implementation?.instructions?.any { insn ->
            (insn as? ReferenceInstruction)?.reference?.let {
                it is MethodReference &&
                    it.definingClass == "Lcom/google/android/exoplayer2/ui/SimpleExoPlayerView;" &&
                    it.name == "setPlayer"
            } == true
        } == true
    },
)

/**
 * Shared hook used by both `Stop Featured Looks autoplay` and `Stop video autoplay` so each patch
 * can pause its own videos at 1000ms without conflicting or leaving spinners stuck.
 */
internal val looksAutoplayHookPatch = patch {
    extendWith("extensions/extension.mpe")

    execute {
        val feedSubclassType = poolTypeFeedFingerprint.classDef.type
        val feedTypeClass = poolTypeFeedFingerprint.classDef.superclass
            ?: throw PatchException("ExoPlayerPool type superclass not found")
        var poolFieldOnPoolClass: FieldReference? = null
        var poolClassType: String? = null
        classDefForEach { classDef ->
            val f = classDef.instanceFields.singleOrNull { it.type == feedTypeClass }
            if (f != null && classDef.instanceFields.any { it.type == "Ljava/util/LinkedHashMap;" }) {
                poolClassType = classDef.type
                poolFieldOnPoolClass = f
            }
        }
        val poolTypeField = poolFieldOnPoolClass ?: throw PatchException("ExoPlayerPool poolType field not found")
        val poolType = poolClassType ?: throw PatchException("ExoPlayerPool class not found")

        // 1. Gate `playWhenReady(true)` in ExoPlayerPool creator lambda (`p1` is `key: String`).
        val createMethod = exoPlayerPoolCreateFingerprint.method
        val createInsns = createMethod.instructions.toList()
        val playCallIndex = createInsns.indexOfLast { insn ->
            insn.opcode == Opcode.INVOKE_VIRTUAL &&
                ((insn as ReferenceInstruction).reference as? MethodReference)?.let {
                    it.parameterTypes.map(CharSequence::toString) == listOf("I", "Z") && it.returnType == "V"
                } == true
        }
        if (playCallIndex < 0) throw PatchException("ExoPlayer playWhenReady call not found in ExoPlayerPool")
        val playMethodRef = (createInsns[playCallIndex] as ReferenceInstruction).reference as MethodReference
        val createPoolFieldName = createInsns.indices.firstNotNullOfOrNull { idx ->
            val insn = createInsns[idx]
            if (insn.opcode != Opcode.IGET_OBJECT) return@firstNotNullOfOrNull null
            val fieldRef = (insn as ReferenceInstruction).reference as? FieldReference ?: return@firstNotNullOfOrNull null
            if (fieldRef.definingClass != createMethod.definingClass || fieldRef.type != "Ljava/lang/Object;") {
                return@firstNotNullOfOrNull null
            }
            val next = createInsns.getOrNull(idx + 1) ?: return@firstNotNullOfOrNull null
            val castType = ((next as? ReferenceInstruction)?.reference as? TypeReference)?.type
            if (next.opcode == Opcode.CHECK_CAST && castType == poolType) fieldRef.name else null
        } ?: throw PatchException("Pool field not found on ${createMethod.definingClass}")
        val createCallInsn = createInsns[playCallIndex] as FiveRegisterInstruction
        val createArgReg = createCallInsn.registerD
        val createPlayerReg = createCallInsn.registerC
        // Free scratch register distinct from createPlayerReg and createArgReg.
        val createKeyReg = (0..15).first { it != createPlayerReg && it != createArgReg }
        createMethod.replaceInstruction(playCallIndex, "nop")
        createMethod.addInstructionsWithLabels(
            playCallIndex,
            """
                move-object/from16 v$createArgReg, p0
                iget-object v$createArgReg, v$createArgReg, ${createMethod.definingClass}->$createPoolFieldName:Ljava/lang/Object;
                check-cast v$createArgReg, $poolType
                iget-object v$createArgReg, v$createArgReg, $poolType->${poolTypeField.name}:$feedTypeClass
                instance-of v$createArgReg, v$createArgReg, $feedSubclassType
                move-object/from16 v$createKeyReg, p1
                check-cast v$createKeyReg, Ljava/lang/String;
                invoke-static { v$createKeyReg, v$createArgReg }, $AUTOPLAY_EXT->shouldPlay(Ljava/lang/String;Z)Z
                move-result v$createArgReg
                if-eqz v$createArgReg, :fakh_skip_create_play
                const/4 v$createArgReg, 0x1
                invoke-virtual { v$createPlayerReg, v$createArgReg, v$createArgReg }, $playMethodRef
                :fakh_skip_create_play
                nop
            """,
        )

        // 2. Gate `playWhenReady` in ExoPlayerPool reuse lambda (`p2` is `key: String`).
        val reuseMethod = exoPlayerPoolReuseFingerprint.method
        val reuseInsns = reuseMethod.instructions.toList()
        val reusePlayIndex = reuseInsns.indexOfLast { insn ->
            insn.opcode == Opcode.INVOKE_VIRTUAL &&
                (insn as ReferenceInstruction).reference == playMethodRef
        }
        if (reusePlayIndex < 0) throw PatchException("ExoPlayer playWhenReady call not found in pool reuse lambda")
        val reusePoolField = mutableClassDefBy(exoPlayerPoolReuseFingerprint.classDef).instanceFields
            .singleOrNull { it.type == poolType }
            ?: throw PatchException("Pool field not found on pool reuse lambda")
        val reuseCallInsn = reuseInsns[reusePlayIndex] as FiveRegisterInstruction
        val reuseArgReg = reuseCallInsn.registerD
        val reusePlayerReg = reuseCallInsn.registerC
        reuseMethod.replaceInstruction(reusePlayIndex, "nop")
        reuseMethod.addInstructionsWithLabels(
            reusePlayIndex,
            """
                iget-object v$reuseArgReg, p0, ${reuseMethod.definingClass}->${reusePoolField.name}:$poolType
                iget-object v$reuseArgReg, v$reuseArgReg, $poolType->${poolTypeField.name}:$feedTypeClass
                instance-of v$reuseArgReg, v$reuseArgReg, $feedSubclassType
                check-cast p2, Ljava/lang/String;
                invoke-static { p2, v$reuseArgReg }, $AUTOPLAY_EXT->shouldPlay(Ljava/lang/String;Z)Z
                move-result v$reuseArgReg
                invoke-virtual { v$reusePlayerReg, v$reuseArgReg, v$reuseArgReg }, $playMethodRef
            """,
        )

        // 3. Gate `playWhenReady(true)` in `LooksVideoViewKt$UriVideoView` (`invokeSuspend`).
        var looksVideoCalls = 0
        var looksVideoOuterPrefix: String? = null
        classDefForEach { classDef ->
            if (classDef.type == createMethod.definingClass || classDef.type == reuseMethod.definingClass) {
                return@classDefForEach
            }
            val targetMethods = classDef.methods.filter { m ->
                m.name == "invokeSuspend" &&
                    m.implementation?.instructions?.any {
                        it.opcode == Opcode.INVOKE_VIRTUAL && (it as ReferenceInstruction).reference == playMethodRef
                    } == true
            }
            if (targetMethods.isEmpty()) return@classDefForEach
            looksVideoOuterPrefix = classDef.type.substringBefore('$') + "$"
            val mutable = mutableClassDefBy(classDef)
            val lvPoolField = mutable.instanceFields.singleOrNull { it.type == poolType }
                ?: throw PatchException("Pool field not found on ${classDef.type}")
            val lvKeyField = mutable.instanceFields.singleOrNull { it.type == "Ljava/lang/String;" }
                ?: throw PatchException("Key field not found on ${classDef.type}")
            mutable.methods.filter { it.name == "invokeSuspend" }.forEach { m ->
                val indices = m.instructions.toList().mapIndexedNotNull { idx, insn ->
                    if (insn.opcode == Opcode.INVOKE_VIRTUAL && (insn as ReferenceInstruction).reference == playMethodRef) {
                        idx
                    } else {
                        null
                    }
                }
                indices.reversed().forEach { idx ->
                    val callInsn = m.instructions.elementAt(idx) as FiveRegisterInstruction
                    val playerReg = callInsn.registerC
                    val argReg = callInsn.registerD
                    val keyReg = (0..15).first { it != playerReg && it != argReg }
                    m.replaceInstruction(idx, "nop")
                    m.addInstructionsWithLabels(
                        idx,
                        """
                            iget-object v$argReg, p0, ${classDef.type}->${lvPoolField.name}:$poolType
                            iget-object v$argReg, v$argReg, $poolType->${poolTypeField.name}:$feedTypeClass
                            instance-of v$argReg, v$argReg, $feedSubclassType
                            iget-object v$keyReg, p0, ${classDef.type}->${lvKeyField.name}:Ljava/lang/String;
                            invoke-static { v$keyReg, v$argReg }, $AUTOPLAY_EXT->shouldPlay(Ljava/lang/String;Z)Z
                            move-result v$argReg
                            if-eqz v$argReg, :fakh_lv_skip_$idx
                            const/4 v$argReg, 0x1
                            invoke-virtual { v$playerReg, v$argReg, v$argReg }, $playMethodRef
                            :fakh_lv_skip_$idx
                            nop
                        """,
                    )
                    looksVideoCalls++
                }
            }
        }
        if (looksVideoCalls == 0) throw PatchException("LooksVideoView playWhenReady calls not found")

        // 4. Dismiss LooksVideoView loading spinner on `STATE_READY (3)` even when paused.
        val outerPrefix = looksVideoOuterPrefix ?: throw PatchException("LooksVideoView outer prefix not found")
        var listenerPatched = 0
        classDefForEach { classDef ->
            if (!classDef.type.startsWith(outerPrefix)) return@classDefForEach
            val boolMethod = classDef.methods.singleOrNull {
                it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf("Z") &&
                    it.implementation?.instructions?.any { insn ->
                        ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.name == "setValue"
                    } == true
            } ?: return@classDefForEach
            val stateMethod = classDef.methods.singleOrNull {
                it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf("I") &&
                    it.implementation != null
            } ?: return@classDefForEach

            val mutable = mutableClassDefBy(classDef)
            val mutableState = mutable.methods.single {
                it.name == stateMethod.name && it.parameterTypes == stateMethod.parameterTypes
            }
            val retIdx = mutableState.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            mutableState.addInstructionsWithLabels(
                retIdx,
                """
                    const/4 v0, 0x3
                    if-ne p1, v0, :fakh_not_ready
                    const/4 v0, 0x1
                    invoke-virtual { p0, v0 }, ${classDef.type}->${boolMethod.name}(Z)V
                    :fakh_not_ready
                    nop
                """,
            )
            listenerPatched++
        }
        if (listenerPatched != 1) throw PatchException("Expected 1 LooksVideoView Player.Listener, found $listenerPatched")

        // 5. Start ExoPlayer items at 1000ms instead of 0ms (TIME_UNSET) so paused videos show a
        // focused frame instead of an opening blur/fade-in.
        var basePlayerType: String? = null
        classDefForEach { classDef ->
            if (classDef.type == playMethodRef.definingClass) {
                basePlayerType = classDef.superclass
            }
        }
        val baseType = basePlayerType ?: throw PatchException("ExoPlayerImpl superclass not found")
        var seekPositionsPatched = 0
        classDefForEach { classDef ->
            if (classDef.type != baseType) return@classDefForEach
            val target = mutableClassDefBy(classDef).methods.singleOrNull { m ->
                m.returnType == "V" &&
                    m.parameterTypes.size == 1 &&
                    m.parameterTypes[0].toString().startsWith("L") &&
                    m.implementation?.instructions?.any {
                        it is WideLiteralInstruction && it.wideLiteral == Long.MIN_VALUE + 1L
                    } == true
            } ?: throw PatchException("BasePlayer.setMediaItem not found on $baseType")
            target.instructions.toList().forEachIndexed { idx, insn ->
                if (insn is WideLiteralInstruction && insn.wideLiteral == Long.MIN_VALUE + 1L) {
                    val reg = (insn as OneRegisterInstruction).registerA
                    target.replaceInstruction(idx, "const-wide/16 v$reg, 0x3e8")
                    seekPositionsPatched++
                }
            }
        }
        if (seekPositionsPatched == 0) throw PatchException("TIME_UNSET start position not found on $baseType")
    }
}

@Suppress("unused")
val stopAutoplayPatch = patch(
    name = "Stop video autoplay",
    description = "Stops Looks feed and promo videos from playing on their own while keeping Looks detail playback working.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FACER_PHONE)
    category("Feature")
    dependsOn(looksAutoplayHookPatch)

    execute {
        var appHooked = 0
        classDefForEach { classDef ->
            if (classDef.type != "Lcom/jeremysteckling/facerrel/App;") return@classDefForEach
            mutableClassDefBy(classDef).methods
                .filter { it.name == "onCreate" && it.parameters.isEmpty() }
                .forEach { m ->
                    m.addInstructions(0, "invoke-static {}, $AUTOPLAY_EXT->disableFeedVideos()V")
                    appHooked++
                }
        }
        if (appHooked != 1) throw PatchException("App.onCreate not found")

        val binderMethod = videoViewBinderFingerprint.method
        val binderInsns = binderMethod.instructions.toList()
        var legacyPatched = 0
        binderInsns.forEachIndexed { idx, insn ->
            if (insn.opcode == Opcode.INVOKE_VIRTUAL) {
                val ref = (insn as ReferenceInstruction).reference as? MethodReference ?: return@forEachIndexed
                if (ref.definingClass == "Landroid/widget/VideoView;" && ref.name == "start") {
                    binderMethod.replaceInstruction(idx, "nop")
                    legacyPatched++
                } else if (ref.parameterTypes.map(CharSequence::toString) == listOf("Z") &&
                    ref.returnType == "V" &&
                    idx > binderInsns.size - 10
                ) {
                    binderMethod.replaceInstruction(idx, "nop")
                    legacyPatched++
                }
            }
        }
        if (legacyPatched != 2) throw PatchException("Expected 2 legacy video autoplay calls, found $legacyPatched")
    }
}
