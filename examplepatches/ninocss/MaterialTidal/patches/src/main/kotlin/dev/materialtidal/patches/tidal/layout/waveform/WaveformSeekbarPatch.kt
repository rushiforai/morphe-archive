package dev.materialtidal.patches.tidal.layout.waveform

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.p0Register
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.materialtidal.patches.shared.COMPATIBILITY_TIDAL
import dev.materialtidal.patches.shared.EXTENSION_PATH
import dev.materialtidal.patches.shared.MATERIAL_YOU_CONFIG_CLASS
import dev.materialtidal.patches.shared.SONG_WAVEFORM_BRIDGE_CLASS
import dev.materialtidal.patches.tidal.layout.player.expressivePlayerPatch

private val WAVEFORM_STYLE_CHOICES = mapOf(
    "Mirrored Bars (Recommended)" to 0,
    "Bottom Spectrum Bars" to 1,
    "Smooth Filled Wave" to 2,
)

private val WAVEFORM_BAR_DENSITY_CHOICES = mapOf(
    "Chunky (36 bars)" to 0,
    "Balanced (56 bars, recommended)" to 1,
    "Fine (76 bars)" to 2,
)

@Suppress("unused")
val waveformSeekbarPatch = patch(
    name = "Song waveform seekbar",
    description = "Replaces the player seekbar with an animated audio waveform generated from the playing track, featuring smooth track transitions, scrub zoom, and optional real-time beat pulse.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TIDAL)

    extendWith(EXTENSION_PATH)

    dependsOn(expressivePlayerPatch)

    val waveformStyleOption by intOption(
        key = "waveformStyle",
        default = 0,
        values = WAVEFORM_STYLE_CHOICES,
        title = "Waveform shape",
        description = "Visual style used to draw the song's audio waveform along the seekbar (also adjustable live in Settings → MaterialTidal).",
        required = true,
    )

    val barDensityOption by intOption(
        key = "waveformBarDensity",
        default = 1,
        values = WAVEFORM_BAR_DENSITY_CHOICES,
        title = "Waveform detail",
        description = "Number of bars or curve segments drawn across the waveform seekbar (also adjustable live in Settings → MaterialTidal).",
        required = true,
    )

    val liveReactiveOption by booleanOption(
        key = "waveformLiveReactivity",
        default = true,
        title = "Live beat pulse at playhead",
        description = "Makes the waveform subtly pulse with real-time audio loudness around the playhead (also adjustable live in Settings → MaterialTidal).",
        required = true,
    )

    execute {
        // 1. Configure MaterialYouConfig flags & options.
        val configClass = mutableClassDefBy(MATERIAL_YOU_CONFIG_CLASS)
        configClass.methods.single { it.name == "isWaveformSeekbarPatchInstalled" }
            .returnEarly(true)
        configClass.methods.single { it.name == "defaultPlayerWaveformSeekbarEnabled" }
            .returnEarly(true)
        configClass.methods.single { it.name == "defaultPlayerWaveformStyle" }
            .returnEarly(waveformStyleOption ?: 0)
        configClass.methods.single { it.name == "defaultPlayerWaveformBarDensity" }
            .returnEarly(barDensityOption ?: 1)
        configClass.methods.single { it.name == "defaultPlayerWaveformLiveReactiveEnabled" }
            .returnEarly(liveReactiveOption ?: true)

        // 2. Hook ExoPlayer DefaultAudioSink.handleBuffer(ByteBuffer, long, int)Z for live PCM reactivity.
        DefaultAudioSinkHandleBufferFingerprint.matchSingle().method.let { m ->
            val p0 = m.p0Register
            val p1 = p0 + 1
            val invoke = if (p1 <= 15) {
                "invoke-static { v$p0, v$p1 }, $SONG_WAVEFORM_BRIDGE_CLASS->onAudioSinkBuffer(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V"
            } else {
                "invoke-static/range { v$p0 .. v$p1 }, $SONG_WAVEFORM_BRIDGE_CLASS->onAudioSinkBuffer(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V"
            }
            m.addInstructions(0, invoke)
        }

        // 3. Resolve obfuscated TIDAL player/queue types for SongWaveformBridge.nativeGetActiveTrackId().
        val audioPlayerClass = WaveformAudioPlayerSwitchFingerprint.matchSingle().classDef
        val audioSingletonMethod = WaveformAudioPlayerSingletonFingerprint.matchSingle().method
        val audioItdField = audioPlayerClass.fields.single { it.name == "l" }
        val itdClass = mutableClassDefBy(audioItdField.type)
        val itdGetPlayQueue = itdClass.methods.single { it.name == "getPlayQueue" }
        val playQueueClass = mutableClassDefBy(itdGetPlayQueue.returnType)
        val queueGetCurrentItem = playQueueClass.methods.single { it.name == "getCurrentItem" }
        val queueItemClass = mutableClassDefBy(queueGetCurrentItem.returnType)
        val itemGetMediaParent = queueItemClass.methods.single { it.name == "getMediaItemParent" }

        val invokeItdOp = if (AccessFlags.INTERFACE.isSet(itdClass.accessFlags)) "invoke-interface" else "invoke-virtual"
        val invokeQueueOp = if (AccessFlags.INTERFACE.isSet(playQueueClass.accessFlags)) "invoke-interface" else "invoke-virtual"
        val invokeItemOp = if (AccessFlags.INTERFACE.isSet(queueItemClass.accessFlags)) "invoke-interface" else "invoke-virtual"

        val bridgeClass = mutableClassDefBy(SONG_WAVEFORM_BRIDGE_CLASS)
        replaceBridgeMethod(
            bridgeClass,
            "nativeGetActiveTrackId",
            """
                invoke-static {}, $audioSingletonMethod
                move-result-object v0
                if-eqz v0, :none
                iget-object v0, v0, $audioItdField
                if-eqz v0, :none
                $invokeItdOp { v0 }, $itdGetPlayQueue
                move-result-object v0
                if-eqz v0, :none
                $invokeQueueOp { v0 }, $queueGetCurrentItem
                move-result-object v0
                if-eqz v0, :none
                $invokeItemOp { v0 }, $itemGetMediaParent
                move-result-object v0
                if-eqz v0, :none
                invoke-virtual { v0 }, Lcom/aspiro/wamp/model/MediaItemParent;->getMediaItem()Lcom/aspiro/wamp/model/MediaItem;
                move-result-object v0
                if-eqz v0, :none
                invoke-virtual { v0 }, Lcom/aspiro/wamp/model/MediaItem;->getIdAsString()Ljava/lang/String;
                move-result-object v0
                return-object v0
                :none
                const/4 v0, 0x0
                return-object v0
            """,
        )

        // 4. Resolve DI component (Ljl0;) + OAuth Credentials + Session country code for TIDAL stream lookup.
        val castCredsMethod = WaveformCastCredentialsHelperFingerprint.matchSingle().method
        val hh4Type = castCredsMethod.parameterTypes[0].toString()
        val s81Type = castCredsMethod.returnType
        val s81UnwrapMethod = mutableClassDefBy(s81Type).methods.single {
            !AccessFlags.STATIC.isSet(it.accessFlags) &&
                !it.name.startsWith("<") &&
                it.parameterTypes.isEmpty() &&
                it.returnType == "Ljava/lang/Object;"
        }
        val hbaClass = classDefByOrNull { cd ->
            cd.interfaces.contains("Ljl0;") &&
                cd.methods.any { m -> m.parameterTypes.isEmpty() && m.returnType == hh4Type } &&
                cd.methods.any { m ->
                    m.parameterTypes.isEmpty() &&
                        m.returnType.startsWith("L") &&
                        mutableClassDefByOrNull(m.returnType)?.methods?.any { it.name == "getSessionFromToken" } == true
                }
        } ?: throw PatchException("Could not resolve TIDAL DI component implementing Ljl0; for waveform auth")
        val hbaType = hbaClass.type
        val hbaGetCredsMethod = hbaClass.methods.single {
            it.parameterTypes.isEmpty() && it.returnType == hh4Type
        }
        val hbaGetUserMgrMethod = hbaClass.methods.firstOrNull { m ->
            m.parameterTypes.isEmpty() &&
                m.returnType.startsWith("L") &&
                mutableClassDefByOrNull(m.returnType)?.methods?.any { it.name == "getSessionFromToken" } == true
        } ?: throw PatchException("Could not resolve UserManager getter in $hbaType")
        val tfjGetSessionMethod = mutableClassDefBy(hbaGetUserMgrMethod.returnType).methods.single {
            it.parameterTypes.isEmpty() && it.returnType == "Lcom/tidal/android/user/session/data/Session;"
        }

        replaceBridgeMethod(
            bridgeClass,
            "nativeGetAccessToken",
            buildCredentialFieldGetterSmali(hbaType, hbaGetCredsMethod, castCredsMethod, s81UnwrapMethod, "g"),
        )
        replaceBridgeMethod(
            bridgeClass,
            "nativeGetClientToken",
            buildCredentialFieldGetterSmali(hbaType, hbaGetCredsMethod, castCredsMethod, s81UnwrapMethod, "a"),
        )
        replaceBridgeMethod(
            bridgeClass,
            "nativeGetCountryCode",
            """
                invoke-static {}, Lcom/aspiro/wamp/App${'$'}a;->a()Lcom/aspiro/wamp/App;
                move-result-object v0
                invoke-virtual { v0 }, Lcom/aspiro/wamp/App;->e()Ljl0;
                move-result-object v0
                check-cast v0, $hbaType
                invoke-virtual { v0 }, $hbaGetUserMgrMethod
                move-result-object v0
                if-eqz v0, :fallback
                invoke-interface { v0 }, $tfjGetSessionMethod
                move-result-object v0
                if-eqz v0, :fallback
                invoke-virtual { v0 }, Lcom/tidal/android/user/session/data/Session;->getCountryCode()Ljava/lang/String;
                move-result-object v0
                if-eqz v0, :fallback
                return-object v0
                :fallback
                const-string v0, "US"
                return-object v0
            """,
        )
    }
}

private fun buildCredentialFieldGetterSmali(
    hbaType: String,
    hbaGetCredsMethod: Any,
    castCredsMethod: Any,
    s81UnwrapMethod: Any,
    credFieldName: String,
): String = """
    invoke-static {}, Lcom/aspiro/wamp/App${'$'}a;->a()Lcom/aspiro/wamp/App;
    move-result-object v0
    invoke-virtual { v0 }, Lcom/aspiro/wamp/App;->e()Ljl0;
    move-result-object v0
    check-cast v0, $hbaType
    invoke-virtual { v0 }, $hbaGetCredsMethod
    move-result-object v0
    invoke-static { v0 }, $castCredsMethod
    move-result-object v0
    if-eqz v0, :no_creds
    invoke-virtual { v0 }, $s81UnwrapMethod
    move-result-object v0
    check-cast v0, Lcom/tidal/sdk/auth/model/Credentials;
    if-eqz v0, :no_creds
    iget-object v0, v0, Lcom/tidal/sdk/auth/model/Credentials;->$credFieldName:Ljava/lang/String;
    return-object v0
    :no_creds
    const/4 v0, 0x0
    return-object v0
"""

private fun replaceBridgeMethod(
    bridgeClass: MutableClass,
    methodName: String,
    smali: String,
) {
    val oldMethod = bridgeClass.methods.singleOrNull { it.name == methodName }
        ?: throw PatchException("Bridge method not found: $SONG_WAVEFORM_BRIDGE_CLASS->$methodName")

    val newMethod = ImmutableMethod(
        bridgeClass.type,
        oldMethod.name,
        oldMethod.parameters.map { ImmutableMethodParameter(it.type, it.annotations, it.name) },
        oldMethod.returnType,
        oldMethod.accessFlags,
        oldMethod.annotations,
        oldMethod.hiddenApiRestrictions,
        MutableMethodImplementation(6),
    ).toMutable()

    newMethod.addInstructionsWithLabels(0, smali.trimIndent())

    bridgeClass.methods.remove(oldMethod)
    bridgeClass.methods.add(newMethod)
}
