package dev.materialtidal.patches.tidal.playback.linn

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import app.morphe.patcher.util.addFreeRegisters
import app.morphe.patcher.util.getFreeRegisterProvider
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.p0Register
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.materialtidal.patches.shared.COMPATIBILITY_TIDAL
import dev.materialtidal.patches.shared.EXTENSION_PATH
import dev.materialtidal.patches.shared.LINN_BRIDGE_CLASS
import dev.materialtidal.patches.shared.LINN_BROADCAST_CONTROLLER_CLASS
import dev.materialtidal.patches.shared.LINN_BUTTON_ADAPTER_CLASS
import dev.materialtidal.patches.shared.LINN_CONFIG_CLASS
import dev.materialtidal.patches.shared.LINN_FACTORY_ADAPTER_CLASS
import dev.materialtidal.patches.shared.LINN_ITEM_ADAPTER_CLASS
import dev.materialtidal.patches.shared.LINN_PLAYBACK_ADAPTER_CLASS
import dev.materialtidal.patches.shared.LINN_PROVIDER_ADAPTER_CLASS
import dev.materialtidal.patches.shared.LINN_VOLUME_CONTROL_ADAPTER_CLASS
import dev.materialtidal.patches.shared.LINN_VOLUME_PROVIDER_ADAPTER_CLASS

private val LINN_AUDIO_QUALITY_CHOICES = mapOf(
    "Hi-Res FLAC (up to 24-bit/192 kHz, Auto fallback)" to 0,
    "Lossless FLAC (16-bit/44.1 kHz)" to 1,
    "High (320 kbps AAC)" to 2,
)

private val LINN_STREAM_MODE_CHOICES = mapOf(
    "Local HTTP Proxy (All Majik DSM models, recommended)" to 0,
    "Direct CDN for Lossless BTS + Proxy for Hi-Res" to 1,
)

@Suppress("unused")
val linnDsmPlaybackPatch = patch(
    name = "Linn Majik DSM Wi-Fi playback",
    description = "Discovers Linn DS/DSM speakers (OpenHome) on the local Wi-Fi in TIDAL's Devices sheet and streams Lossless / Hi-Res FLAC playback with full transport, queue, hardware volume, and lockscreen controls.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TIDAL)

    extendWith(EXTENSION_PATH)

    val audioQualityOption by intOption(
        key = "linnAudioQuality",
        default = 0,
        values = LINN_AUDIO_QUALITY_CHOICES,
        title = "Preferred audio quality",
        description = "Audio quality streamed to Linn Majik DSM over Wi-Fi (Hi-Res remuxes 24-bit/192 kHz DASH FLAC losslessly into native FLAC).",
        required = true,
    )

    val streamModeOption by intOption(
        key = "linnStreamMode",
        default = 0,
        values = LINN_STREAM_MODE_CHOICES,
        title = "Stream delivery mode",
        description = "Local HTTP Proxy guarantees compatibility across all Linn DSM/1-5 generations and enables bit-perfect 24-bit/192 kHz DASH FLAC remuxing.",
        required = true,
    )

    val autoWakeAndSwitchOption by booleanOption(
        key = "linnAutoWakeAndSwitch",
        default = true,
        title = "Auto-wake standby & switch input",
        description = "Automatically wakes the Linn Majik DSM from standby and switches its active source to Playlist when selected in TIDAL.",
        required = true,
    )

    val manualDeviceIpOption by stringOption(
        key = "linnManualDeviceIp",
        default = "",
        title = "Manual Linn DSM IP (optional fallback)",
        description = "Optional LAN IP address (e.g. 192.168.1.50 or 192.168.1.50:55178) if SSDP multicast discovery is blocked on your Wi-Fi network.",
        required = false,
    )

    execute {
        // 1. Apply patch options onto LinnConfig.
        mutableClassDefBy(LINN_CONFIG_CLASS).apply {
            methods.single { it.name == "getAudioQualityMode" }.returnEarly(audioQualityOption ?: 0)
            methods.single { it.name == "getStreamDeliveryMode" }.returnEarly(streamModeOption ?: 0)
            methods.single { it.name == "isAutoWakeAndSwitchEnabled" }.returnEarly(autoWakeAndSwitchOption ?: true)
            methods.single { it.name == "getManualDeviceIp" }.returnEarly(manualDeviceIpOption?.trim().orEmpty())
        }

        // 2. Resolve TIDAL obfuscated Broadcast / Playback / Queue / Auth runtime types.
        val mgrInitMatch = BroadcastProvidersManagerInitFingerprint.matchSingle()
        val vhBindMatch = BroadcastItemViewHolderBindFingerprint.matchSingle()
        val disconnectMatch = BroadcastManagerDisconnectFingerprint.matchSingle()
        val audioSwitchMatch = AudioPlayerSwitchPlaybackFingerprint.matchSingle()
        val playQueueMatch = LocalPlayQueueClassFingerprint.matchSingle()
        val prevActionMatch = LocalPlaybackOnActionPreviousFingerprint.matchSingle()
        val castCredsMatch = CastCredentialsHelperFingerprint.matchSingle()
        val audioSingletonMatch = BroadcastAudioPlayerSingletonFingerprint.matchSingle()
        val itemUpdatedMatch = ItemUpdatedNotifierFingerprint.matchSingle()

        val ha2Class = mgrInitMatch.classDef
        val registerProviderMethod = ha2Class.methods.single {
            !AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.name != "<init>" &&
                it.returnType == "V" &&
                it.parameterTypes.size == 1
        }
        val fa2Type = registerProviderMethod.parameterTypes[0].toString()
        val fa2Class = mutableClassDefBy(fa2Type)
        val fa2AddListenerMethod = fa2Class.methods.single { it.name == "addListener" && it.parameterTypes.size == 1 }
        val fa2GetMethod = fa2Class.methods.single { it.name == "get" && it.parameterTypes.isEmpty() }
        val da2Type = fa2GetMethod.returnType
        val da2Class = mutableClassDefBy(da2Type)

        val hbaType = mgrInitMatch.method.instructions
            .filter { it.opcode == Opcode.CHECK_CAST }
            .map { ((it as ReferenceInstruction).reference as TypeReference).type }
            .firstOrNull { it != ha2Class.type }
            ?: throw PatchException("Could not resolve DI component type in ${ha2Class.type}")
        val hbaClass = mutableClassDefBy(hbaType)

        val ba2Type = da2Class.methods.single { it.name == "addListener" }.parameterTypes[0].toString()
        val y92Type = da2Class.methods.single { it.name == "connect" }.parameterTypes[0].toString()
        val da2CallbackType = da2Class.methods.single { it.name == "disconnect" }.parameterTypes[0].toString()
        val singleType = da2Class.methods.single { it.name == "getAllAvailableDevices" }.returnType
        val ea2Type = da2Class.methods.single { it.name == "getBroadcastProviderButton" }.returnType
        val ga2Type = da2Class.methods.single { it.name == "getBroadcastProviderGroupButton" }.returnType
        val lwjType = da2Class.methods.single { it.name == "getVolumeControl" }.returnType

        val y92Class = mutableClassDefBy(y92Type)
        val y92Init = y92Class.methods.single {
            it.name == "<init>" &&
                it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;", "Ljava/lang/String;", "I")
        }

        val ba2Class = mutableClassDefBy(ba2Type)
        val ba2Connected = ba2Class.methods.single { it.name == "a" && it.parameterTypes.size == 1 }
        val ba2Disconnected = ba2Class.methods.single { it.name == "b" && it.parameterTypes.size == 2 }
        val ba2Connecting = ba2Class.methods.single { it.name == "c" && it.parameterTypes.size == 1 }
        val ba2DevicesUpdated = ba2Class.methods.single { it.name == "d" && it.parameterTypes.isEmpty() }

        val lwjClass = mutableClassDefBy(lwjType)
        val srhType = lwjClass.methods.single { it.name == "getMaxVolumeSubject" }.returnType

        val rxPublishSubjectType = "Lrx/subjects/PublishSubject;"
        val rxBehaviorSubjectClass = classDefByOrNull { classDef ->
            classDef.superclass == srhType &&
                classDef.fields.any { f -> f.type == "Lrx/subjects/SubjectSubscriptionManager;" }
        } ?: throw PatchException("Could not resolve RxJava1 BehaviorSubject subclass of $srhType")

        // Concrete R8-inlined disconnect callback class (Lsz4;) from BroadcastManager.f().
        val disconnectCallIdx = disconnectMatch.instructionMatches.last().index
        val sz4Type = disconnectMatch.method.instructions
            .take(disconnectCallIdx)
            .lastOrNull { it.opcode == Opcode.NEW_INSTANCE }
            ?.let { ((it as ReferenceInstruction).reference as TypeReference).type }
            ?: throw PatchException("Could not resolve concrete disconnect callback in ${disconnectMatch.classDef.type}")
        val sz4Invoke = mutableClassDefBy(sz4Type).methods.single {
            !it.name.startsWith("<") && it.parameterTypes.isEmpty() && it.returnType == "V"
        }

        // AudioPlayer & Playback types.
        val audioPlayerClass = audioSwitchMatch.classDef
        val audioPlayerType = audioPlayerClass.type
        val itdType = audioPlayerClass.fields.single { it.name == "l" }.type
        val itdClass = mutableClassDefBy(itdType)
        val playbackStateProviderField = audioPlayerClass.fields.single { it.name == "a" }
        val progressTrackerField = audioPlayerClass.fields.single { it.name == "c" }
        val mapField = audioPlayerClass.fields.single { it.name == "d" }
        val lifecycleHolderField = audioPlayerClass.fields.single { it.name == "e" }
        val lockField = audioPlayerClass.fields.single { it.type == "Ljava/lang/Object;" }

        val playbackStateProviderClass = mutableClassDefBy(playbackStateProviderField.type)
        val notifyStateMethod = playbackStateProviderClass.methods.single {
            !it.name.startsWith("<") &&
                it.parameterTypes.map { p -> p.toString() } == listOf("Lcom/aspiro/wamp/enums/MusicServiceState;") &&
                it.returnType == "V"
        }

        val progressTrackerClass = mutableClassDefBy(progressTrackerField.type)
        val progressUpdateMethod = progressTrackerClass.methods.single {
            !it.name.startsWith("<") &&
                it.parameterTypes.map { p -> p.toString() } == listOf("I", "I") &&
                it.returnType == "V" &&
                it.instructions.none { insn -> insn.opcode == Opcode.NEW_INSTANCE }
        }
        val progressStartMethod = progressTrackerClass.methods.single {
            !it.name.startsWith("<") &&
                it.parameterTypes.map { p -> p.toString() } == listOf("I", "I") &&
                it.returnType == "V" &&
                it.instructions.any { insn -> insn.opcode == Opcode.NEW_INSTANCE }
        }
        val progressResetMethod = progressTrackerClass.methods.single {
            !it.name.startsWith("<") &&
                !AccessFlags.SYNCHRONIZED.isSet(it.accessFlags) &&
                it.parameterTypes.isEmpty() &&
                it.returnType == "V"
        }

        val hpdType = itdClass.methods.single { it.name == "getPlayQueue" }.returnType
        val hqjType = itdClass.methods.single { it.name == "getVideoPlayerController" }.returnType

        // LocalPlayQueue (Loz9;) & navigation helpers.
        val oz9Class = playQueueMatch.classDef
        val oz9Init = playQueueMatch.method
        val oz9OrderedFields = oz9Init.instructions
            .filter { it.opcode == Opcode.IPUT_OBJECT }
            .map { (it as ReferenceInstruction).reference as FieldReference }
            .take(6)
        if (oz9OrderedFields.size != 6) {
            throw PatchException("Expected 6 dependency fields in ${oz9Class.type}.<init>, found ${oz9OrderedFields.size}")
        }
        val oz9GetCurrentItem = oz9Class.methods.single { it.name == "getCurrentItem" }
        val uqdType = oz9GetCurrentItem.returnType
        val oz9PeekNext = oz9Class.methods.single { it.name == "peekNext" }
        val oz9GetCurPos = oz9Class.methods.single { it.name == "getCurrentItemPosition" }
        val oz9HasNext = oz9Class.methods.single { it.name == "hasNext" }
        val oz9HasPrev = oz9Class.methods.single { it.name == "hasPrevious" }
        val oz9GetRepeat = oz9Class.methods.single { it.name == "getRepeatMode" }
        val oz9MoveNext = oz9Class.methods.single {
            !AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.parameterTypes.isEmpty() &&
                it.returnType == uqdType &&
                it.name != "getCurrentItem" &&
                it.name != "peekNext"
        }

        // Resolve Lird; + Lird;->n() + repeat/event update directly from LocalPlayback.onActionPrevious(Z)V.
        val prevMethod = prevActionMatch.method
        val oz9IrdField = prevMethod.instructions
            .firstOrNull {
                it.opcode == Opcode.IGET_OBJECT &&
                    ((it as ReferenceInstruction).reference as FieldReference).definingClass == oz9Class.type &&
                    ((it as ReferenceInstruction).reference as FieldReference).type != oz9OrderedFields[0].type
            }?.let { (it as ReferenceInstruction).reference as FieldReference }
            ?: throw PatchException("Could not resolve Lird field in LocalPlayback.onActionPrevious")
        val irdPrevMethod = prevMethod.instructions
            .firstNotNullOfOrNull { insn ->
                val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                if (ref != null && ref.definingClass == oz9IrdField.type && ref.returnType == uqdType && ref.parameterTypes.isEmpty()) ref else null
            } ?: throw PatchException("Could not resolve Lird.previous in LocalPlayback.onActionPrevious")
        val irdRepeatField = mutableClassDefBy(oz9IrdField.type).fields.single {
            it.type == "Lcom/aspiro/wamp/enums/RepeatMode;"
        }
        val oz9EqdNotify = prevMethod.instructions
            .firstNotNullOfOrNull { insn ->
                val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                if (ref != null && ref.definingClass == oz9OrderedFields[0].type && ref.parameterTypes.isEmpty() && ref.returnType == "V") ref else null
            } ?: throw PatchException("Could not resolve Leqd.notify in LocalPlayback.onActionPrevious")
        val oz9UpdateRepeatMethod = oz9Class.methods.single {
            !it.name.startsWith("<") &&
                it.name != "setRepeatMode" &&
                it.parameterTypes.map { p -> p.toString() } == listOf("Lcom/aspiro/wamp/enums/RepeatMode;") &&
                it.returnType == "V"
        }
        val oz9PrepareMethod = oz9Class.methods.single {
            it.name == "prepare" && it.parameterTypes.size == 2
        }
        val frdType = oz9PrepareMethod.parameterTypes[1].toString()
        val frdAutoPlayField = mutableClassDefBy(frdType).fields.last { it.type == "Z" }
        val oz9ClearMethod = oz9Class.methods.single {
            it.name == "clear" && it.parameterTypes.map { p -> p.toString() } == listOf("Z")
        }

        // Credentials & UserManager.
        val castCredsMethod = castCredsMatch.method
        val hh4Type = castCredsMethod.parameterTypes[0].toString()
        val s81Type = castCredsMethod.returnType
        val s81UnwrapMethod = mutableClassDefBy(s81Type).methods.single {
            !AccessFlags.STATIC.isSet(it.accessFlags) &&
                !it.name.startsWith("<") &&
                it.parameterTypes.isEmpty() &&
                it.returnType == "Ljava/lang/Object;"
        }
        val hbaGetCredsMethod = hbaClass.methods.single {
            it.parameterTypes.isEmpty() && it.returnType == hh4Type
        }
        val hbaGetUserMgrMethod = hbaClass.methods.firstOrNull { m ->
            m.parameterTypes.isEmpty() &&
                m.returnType.startsWith("L") &&
                mutableClassDefByOrNull(m.returnType)?.methods?.any { it.name == "getSessionFromToken" } == true
        } ?: throw PatchException("Could not resolve UserManager getter in $hbaType")
        val tfjClass = mutableClassDefBy(hbaGetUserMgrMethod.returnType)
        val tfjGetSessionMethod = tfjClass.methods.single {
            it.parameterTypes.isEmpty() && it.returnType == "Lcom/tidal/android/user/session/data/Session;"
        }

        val drawableSpeaker = resourceId(ResourceType.DRAWABLE, "ic_broadcast_audio")
        val drawableConnecting = resourceId(ResourceType.DRAWABLE, "anim_broadcast_tc")
        val drawableConnected = resourceId(ResourceType.DRAWABLE, "anim_broadcast_connected_tc")

        // 3. Inject synchronized-friendly switch helper on AudioPlayer.
        injectAudioPlayerSwitchMethod(
            audioPlayerClass = mutableClassDefBy(audioPlayerType),
            itdType = itdType,
            lifecycleHolderField = lifecycleHolderField,
            progressTrackerField = progressTrackerField,
            progressResetMethod = progressResetMethod,
        )

        // 4. Wire LinnBroadcastItemAdapter superclass (Ly92;) & constructor.
        mutableClassDefBy(LINN_ITEM_ADAPTER_CLASS).apply {
            setSuperClass(y92Type)
            val init = methods.single { it.name == "<init>" }
            val superCallIdx = init.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.INVOKE_DIRECT &&
                    ((insn as ReferenceInstruction).reference as MethodReference).definingClass == "Ljava/lang/Object;"
            }
            if (superCallIdx < 0) {
                throw PatchException("Could not find Object.<init> call in $LINN_ITEM_ADAPTER_CLASS")
            }
            val p0 = init.p0Register
            init.replaceInstruction(
                superCallIdx,
                "invoke-direct { v$p0, v${p0 + 1}, v${p0 + 2}, v${p0 + 3} }, $y92Init",
            )
        }

        // 5. Wire LinnVolumeProviderAdapter superclass (VolumeProviderCompat) & constructor.
        mutableClassDefBy(LINN_VOLUME_PROVIDER_ADAPTER_CLASS).apply {
            setSuperClass("Landroidx/media/VolumeProviderCompat;")
            val init = methods.single { it.name == "<init>" }
            val superCallIdx = init.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.INVOKE_DIRECT &&
                    ((insn as ReferenceInstruction).reference as MethodReference).definingClass == "Ljava/lang/Object;"
            }
            if (superCallIdx < 0) {
                throw PatchException("Could not find Object.<init> call in $LINN_VOLUME_PROVIDER_ADAPTER_CLASS")
            }
            val p0 = init.p0Register
            init.replaceInstruction(
                superCallIdx,
                "invoke-direct { v$p0, v${p0 + 1}, v${p0 + 2}, v${p0 + 3} }, Landroidx/media/VolumeProviderCompat;-><init>(III)V",
            )
        }

        // 6. Wire interface adapters.
        mutableClassDefBy(LINN_FACTORY_ADAPTER_CLASS).apply {
            addInterface(fa2Type)
            addForwardingMethod(
                name = fa2AddListenerMethod.name,
                params = listOf(fa2AddListenerMethod.parameterTypes[0].toString()),
                returnType = "V",
                implName = "addListenerImpl",
                implParams = listOf("Ljava/lang/Object;"),
                implReturnType = "V",
            )
            addForwardingMethod(
                name = "get",
                params = emptyList(),
                returnType = da2Type,
                implName = "getImpl",
                implParams = emptyList(),
                implReturnType = "Ljava/lang/Object;",
            )
        }

        mutableClassDefBy(LINN_PROVIDER_ADAPTER_CLASS).apply {
            addInterface(da2Type)
            addForwardingMethod("addListener", listOf(ba2Type), "V", "addListenerImpl", listOf("Ljava/lang/Object;"), "V")
            addForwardingMethod("connect", listOf(y92Type), "V", "connectImpl", listOf("Ljava/lang/Object;"), "V")
            addForwardingMethod("disconnect", listOf(da2CallbackType), "V", "disconnectImpl", listOf("Ljava/lang/Object;"), "V")
            addForwardingMethod("getAllAvailableDevices", emptyList(), singleType, "getAllAvailableDevicesImpl", emptyList(), "Ljava/lang/Object;")
            addForwardingMethod("getBroadcastProviderButton", emptyList(), ea2Type, "getBroadcastProviderButtonImpl", emptyList(), "Ljava/lang/Object;")
            addForwardingMethod("getBroadcastProviderGroupButton", emptyList(), ga2Type, "getBroadcastProviderGroupButtonImpl", emptyList(), "Ljava/lang/Object;")
            addForwardingMethod("getConnectedItem", emptyList(), y92Type, "getConnectedItemImpl", emptyList(), "Ljava/lang/Object;")
            addForwardingMethod("getVolumeControl", emptyList(), lwjType, "getVolumeControlImpl", emptyList(), "Ljava/lang/Object;")
            addForwardingMethod("isValidItem", listOf(y92Type), "Z", "isValidItemImpl", listOf("Ljava/lang/Object;"), "Z")
        }

        mutableClassDefBy(LINN_BUTTON_ADAPTER_CLASS).apply {
            addInterface(ea2Type)
        }

        mutableClassDefBy(LINN_VOLUME_CONTROL_ADAPTER_CLASS).apply {
            addInterface(lwjType)
            addForwardingMethod("getMaxVolumeSubject", emptyList(), srhType, "getMaxVolumeSubjectImpl", emptyList(), "Ljava/lang/Object;")
            addForwardingMethod("getUpdateVolumeSubject", emptyList(), srhType, "getUpdateVolumeSubjectImpl", emptyList(), "Ljava/lang/Object;")
        }

        mutableClassDefBy(LINN_PLAYBACK_ADAPTER_CLASS).apply {
            addInterface(itdType)
            addForwardingMethod("getPlayQueue", emptyList(), hpdType, "getPlayQueueImpl", emptyList(), "Ljava/lang/Object;")
            addForwardingMethod("getState", emptyList(), "Lcom/aspiro/wamp/enums/MusicServiceState;", "getStateImpl", emptyList(), "Ljava/lang/Object;")
            addForwardingMethod("getVideoPlayerController", emptyList(), hqjType, "getVideoPlayerControllerImpl", emptyList(), "Ljava/lang/Object;")
            addForwardingMethod("getVolumeProvider", emptyList(), "Landroidx/media/VolumeProviderCompat;", "getVolumeProviderImpl", emptyList(), "Ljava/lang/Object;")
            addForwardingMethod("onActionStop", listOf("Lcom/aspiro/wamp/player/PlaybackEndReason;"), "V", "onActionStopImpl", listOf("Ljava/lang/Object;"), "V")
            addForwardingMethod("onActivated", listOf("I", itdType), "V", "onActivatedImpl", listOf("I", "Ljava/lang/Object;"), "V")
        }

        // 7. Populate LinnTidalBridge native* methods.
        val bridgeClass = mutableClassDefBy(LINN_BRIDGE_CLASS)
        val audioSingletonMethod = audioSingletonMatch.method
        val itemUpdatedMethod = itemUpdatedMatch.method

        replaceBridgeMethod(
            bridgeClass,
            "nativeGetAppContext",
            """
                invoke-static {}, Lcom/aspiro/wamp/App${'$'}a;->a()Lcom/aspiro/wamp/App;
                move-result-object v0
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeGetAuthTokens",
            """
                const/4 v0, 0x2
                new-array v0, v0, [Ljava/lang/String;
                invoke-static {}, Lcom/aspiro/wamp/App${'$'}a;->a()Lcom/aspiro/wamp/App;
                move-result-object v1
                invoke-virtual { v1 }, Lcom/aspiro/wamp/App;->e()Ljl0;
                move-result-object v1
                check-cast v1, $hbaType
                invoke-virtual { v1 }, $hbaGetCredsMethod
                move-result-object v1
                invoke-static { v1 }, $castCredsMethod
                move-result-object v1
                if-eqz v1, :no_creds
                invoke-virtual { v1 }, $s81UnwrapMethod
                move-result-object v1
                check-cast v1, Lcom/tidal/sdk/auth/model/Credentials;
                if-eqz v1, :no_creds
                iget-object v2, v1, Lcom/tidal/sdk/auth/model/Credentials;->g:Ljava/lang/String;
                const/4 v3, 0x0
                aput-object v2, v0, v3
                iget-object v2, v1, Lcom/tidal/sdk/auth/model/Credentials;->a:Ljava/lang/String;
                const/4 v3, 0x1
                aput-object v2, v0, v3
                :no_creds
                return-object v0
            """,
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
                if-eqz v0, :no_session
                invoke-interface { v0 }, $tfjGetSessionMethod
                move-result-object v0
                if-eqz v0, :no_session
                invoke-virtual { v0 }, Lcom/tidal/android/user/session/data/Session;->getCountryCode()Ljava/lang/String;
                move-result-object v0
                return-object v0
                :no_session
                const/4 v0, 0x0
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeGetAudioPlayerLock",
            """
                invoke-static {}, $audioSingletonMethod
                move-result-object v0
                iget-object v0, v0, $lockField
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativePerformSwitchToLinnPlayback",
            """
                check-cast p0, $itdType
                invoke-static {}, $audioSingletonMethod
                move-result-object v0
                invoke-virtual { v0, p0 }, $audioPlayerType->switchToExternalPlayback($itdType)V
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativePerformSwitchToLocalPlayback",
            """
                invoke-static {}, $audioSingletonMethod
                move-result-object v0
                iget-object v1, v0, $audioPlayerType->l:$itdType
                if-eqz v1, :switch_now
                iget-object v2, v0, $mapField
                sget-object v3, Lcom/aspiro/wamp/player/PlaybackType;->Local:Lcom/aspiro/wamp/player/PlaybackType;
                invoke-interface { v2, v3 }, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v2
                check-cast v2, $itdType
                if-eqz v2, :switch_now
                if-eq v2, v1, :switch_now
                invoke-interface { v2 }, $itdType->getPlayQueue()$hpdType
                move-result-object v3
                invoke-interface { v1 }, $itdType->getPlayQueue()$hpdType
                move-result-object v4
                if-eqz v3, :switch_now
                if-eqz v4, :switch_now
                if-eq v3, v4, :switch_now
                invoke-interface { v1 }, $itdType->getCurrentMediaPosition()I
                move-result v1
                invoke-interface { v3, v4, v1 }, $hpdType->initFrom(${hpdType}I)V
                :switch_now
                sget-object v1, Lcom/aspiro/wamp/player/PlaybackType;->Local:Lcom/aspiro/wamp/player/PlaybackType;
                invoke-virtual { v0, v1 }, ${audioSwitchMatch.method}
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeCreateLocalPlayQueue",
            """
                invoke-static {}, $audioSingletonMethod
                move-result-object v0
                iget-object v1, v0, $mapField
                sget-object v2, Lcom/aspiro/wamp/player/PlaybackType;->Local:Lcom/aspiro/wamp/player/PlaybackType;
                invoke-interface { v1, v2 }, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v1
                check-cast v1, $itdType
                if-eqz v1, :try_active
                invoke-interface { v1 }, $itdType->getPlayQueue()$hpdType
                move-result-object v7
                goto :got_queue
                :try_active
                iget-object v7, v0, $audioPlayerType->l:$itdType
                if-eqz v7, :fail
                invoke-interface { v7 }, $itdType->getPlayQueue()$hpdType
                move-result-object v7
                :got_queue
                instance-of v0, v7, ${oz9Class.type}
                if-eqz v0, :fail
                check-cast v7, ${oz9Class.type}
                new-instance v0, ${oz9Class.type}
                iget-object v1, v7, ${oz9OrderedFields[0]}
                iget-object v2, v7, ${oz9OrderedFields[1]}
                iget-object v3, v7, ${oz9OrderedFields[2]}
                iget-object v4, v7, ${oz9OrderedFields[3]}
                iget-object v5, v7, ${oz9OrderedFields[4]}
                iget-object v6, v7, ${oz9OrderedFields[5]}
                invoke-direct/range { v0 .. v6 }, $oz9Init
                return-object v0
                :fail
                const/4 v0, 0x0
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeGetPlaybackStateName",
            """
                if-nez p0, :non_null
                const-string v0, "IDLE"
                return-object v0
                :non_null
                check-cast p0, $itdType
                invoke-interface { p0 }, $itdType->getState()Lcom/aspiro/wamp/enums/MusicServiceState;
                move-result-object v0
                if-nez v0, :has_state
                const-string v0, "IDLE"
                return-object v0
                :has_state
                invoke-virtual { v0 }, Lcom/aspiro/wamp/enums/MusicServiceState;->name()Ljava/lang/String;
                move-result-object v0
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeGetPlaybackQueue",
            """
                if-nez p0, :non_null
                const/4 v0, 0x0
                return-object v0
                :non_null
                check-cast p0, $itdType
                invoke-interface { p0 }, $itdType->getPlayQueue()$hpdType
                move-result-object v0
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeNotifyPlaybackState",
            """
                invoke-static { p0 }, Lcom/aspiro/wamp/enums/MusicServiceState;->valueOf(Ljava/lang/String;)Lcom/aspiro/wamp/enums/MusicServiceState;
                move-result-object v0
                invoke-static {}, $audioSingletonMethod
                move-result-object v1
                iget-object v1, v1, $playbackStateProviderField
                invoke-virtual { v1, v0 }, $notifyStateMethod
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeMapStateNameToEnum",
            """
                if-nez p0, :has_name
                sget-object v0, Lcom/aspiro/wamp/enums/MusicServiceState;->IDLE:Lcom/aspiro/wamp/enums/MusicServiceState;
                return-object v0
                :has_name
                invoke-static { p0 }, Lcom/aspiro/wamp/enums/MusicServiceState;->valueOf(Ljava/lang/String;)Lcom/aspiro/wamp/enums/MusicServiceState;
                move-result-object v0
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeNotifyItemUpdated",
            """
                invoke-static {}, $itemUpdatedMethod
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeStartProgress",
            """
                invoke-static {}, $audioSingletonMethod
                move-result-object v0
                iget-object v0, v0, $progressTrackerField
                invoke-virtual { v0, p0, p1 }, $progressStartMethod
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeUpdateProgress",
            """
                invoke-static {}, $audioSingletonMethod
                move-result-object v0
                iget-object v0, v0, $progressTrackerField
                invoke-virtual { v0, p0, p1 }, $progressUpdateMethod
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeResetProgress",
            """
                invoke-static {}, $audioSingletonMethod
                move-result-object v0
                iget-object v0, v0, $progressTrackerField
                invoke-virtual { v0 }, $progressResetMethod
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeQueueInitFrom",
            """
                if-eqz p0, :done
                if-eqz p1, :done
                check-cast p0, $hpdType
                check-cast p1, $hpdType
                invoke-interface { p0, p1, p2 }, $hpdType->initFrom(${hpdType}I)V
                :done
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeQueueGetCurrentItem",
            """
                if-nez p0, :non_null
                const/4 v0, 0x0
                return-object v0
                :non_null
                check-cast p0, $hpdType
                invoke-interface { p0 }, $hpdType->getCurrentItem()$uqdType
                move-result-object v0
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeQueuePeekNext",
            """
                if-nez p0, :non_null
                const/4 v0, 0x0
                return-object v0
                :non_null
                check-cast p0, $hpdType
                invoke-interface { p0 }, $hpdType->peekNext()$uqdType
                move-result-object v0
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeQueueGoTo",
            """
                if-nez p0, :non_null
                const/4 v0, 0x0
                return-object v0
                :non_null
                check-cast p0, $hpdType
                invoke-interface { p0, p1, p2 }, $hpdType->goTo(IZ)$uqdType
                move-result-object v0
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeQueueMoveNext",
            """
                if-nez p0, :non_null
                const/4 v0, 0x0
                return-object v0
                :non_null
                check-cast p0, ${oz9Class.type}
                invoke-virtual { p0 }, $oz9MoveNext
                move-result-object v0
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeQueueMovePrevious",
            """
                if-nez p0, :non_null
                const/4 v0, 0x0
                return-object v0
                :non_null
                check-cast p0, ${oz9Class.type}
                iget-object v0, p0, $oz9IrdField
                iget-object v1, v0, $irdRepeatField
                invoke-virtual { v0 }, $irdPrevMethod
                move-result-object v2
                iget-object v3, p0, ${oz9OrderedFields[0]}
                invoke-interface { v3 }, $oz9EqdNotify
                invoke-virtual { p0, v1 }, $oz9UpdateRepeatMethod
                return-object v2
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeQueueGetCurrentPosition",
            """
                if-nez p0, :non_null
                const/4 v0, 0x0
                return v0
                :non_null
                check-cast p0, $hpdType
                invoke-interface { p0 }, $hpdType->getCurrentItemPosition()I
                move-result v0
                return v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeQueueHasNext",
            """
                if-nez p0, :non_null
                const/4 v0, 0x0
                return v0
                :non_null
                check-cast p0, $hpdType
                invoke-interface { p0 }, $hpdType->hasNext()Z
                move-result v0
                return v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeQueueHasPrevious",
            """
                if-nez p0, :non_null
                const/4 v0, 0x0
                return v0
                :non_null
                check-cast p0, $hpdType
                invoke-interface { p0 }, $hpdType->hasPrevious()Z
                move-result v0
                return v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeQueueGetRepeatModeName",
            """
                if-nez p0, :non_null
                const-string v0, "OFF"
                return-object v0
                :non_null
                check-cast p0, $hpdType
                invoke-interface { p0 }, $hpdType->getRepeatMode()Lcom/aspiro/wamp/enums/RepeatMode;
                move-result-object v0
                if-nez v0, :has_mode
                const-string v0, "OFF"
                return-object v0
                :has_mode
                invoke-virtual { v0 }, Lcom/aspiro/wamp/enums/RepeatMode;->name()Ljava/lang/String;
                move-result-object v0
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeReadPrepareAutoPlay",
            """
                if-nez p0, :has_frd
                const/4 v0, 0x1
                return v0
                :has_frd
                check-cast p0, $frdType
                iget-boolean v0, p0, $frdAutoPlayField
                return v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeReadQueueItemMetadata",
            """
                if-nez p0, :non_null
                const/4 v0, 0x0
                return-object v0
                :non_null
                const/16 v0, 0x8
                new-array v0, v0, [Ljava/lang/String;
                check-cast p0, $uqdType
                invoke-interface { p0 }, $uqdType->getUid()Ljava/lang/String;
                move-result-object v1
                const/4 v2, 0x7
                aput-object v1, v0, v2
                invoke-interface { p0 }, $uqdType->getMediaItemParent()Lcom/aspiro/wamp/model/MediaItemParent;
                move-result-object v1
                if-eqz v1, :done
                invoke-virtual { v1 }, Lcom/aspiro/wamp/model/MediaItemParent;->getId()Ljava/lang/String;
                move-result-object v2
                const/4 v3, 0x0
                aput-object v2, v0, v3
                invoke-virtual { v1 }, Lcom/aspiro/wamp/model/MediaItemParent;->getTitle()Ljava/lang/String;
                move-result-object v2
                const/4 v3, 0x1
                aput-object v2, v0, v3
                invoke-virtual { v1 }, Lcom/aspiro/wamp/model/MediaItemParent;->getDurationMs()I
                move-result v2
                invoke-static { v2 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
                move-result-object v2
                const/4 v3, 0x5
                aput-object v2, v0, v3
                invoke-virtual { v1 }, Lcom/aspiro/wamp/model/MediaItemParent;->getMediaItem()Lcom/aspiro/wamp/model/MediaItem;
                move-result-object v1
                if-eqz v1, :done
                invoke-virtual { v1 }, Lcom/aspiro/wamp/model/MediaItem;->getIdAsString()Ljava/lang/String;
                move-result-object v2
                if-eqz v2, :keep_id
                const/4 v3, 0x0
                aput-object v2, v0, v3
                :keep_id
                invoke-virtual { v1 }, Lcom/aspiro/wamp/model/MediaItem;->getTitle()Ljava/lang/String;
                move-result-object v2
                if-eqz v2, :keep_title
                const/4 v3, 0x1
                aput-object v2, v0, v3
                :keep_title
                invoke-virtual { v1 }, Lcom/aspiro/wamp/model/MediaItem;->getArtistNames()Ljava/lang/String;
                move-result-object v2
                const/4 v3, 0x2
                aput-object v2, v0, v3
                invoke-virtual { v1 }, Lcom/aspiro/wamp/model/MediaItem;->getAlbum()Lcom/aspiro/wamp/model/Album;
                move-result-object v2
                if-eqz v2, :check_dur
                invoke-virtual { v2 }, Lcom/aspiro/wamp/model/Album;->getTitle()Ljava/lang/String;
                move-result-object v3
                const/4 v4, 0x3
                aput-object v3, v0, v4
                invoke-virtual { v2 }, Lcom/aspiro/wamp/model/Album;->getCover()Ljava/lang/String;
                move-result-object v3
                const/4 v4, 0x4
                aput-object v3, v0, v4
                :check_dur
                invoke-virtual { v1 }, Lcom/aspiro/wamp/model/MediaItem;->getDuration()I
                move-result v2
                mul-int/lit16 v2, v2, 0x3e8
                if-lez v2, :check_track
                const/4 v3, 0x5
                aget-object v4, v0, v3
                const-string v5, "0"
                invoke-virtual { v5, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v4
                if-eqz v4, :check_track
                invoke-static { v2 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
                move-result-object v2
                aput-object v2, v0, v3
                :check_track
                instance-of v1, v1, Lcom/aspiro/wamp/model/Track;
                if-eqz v1, :not_track
                const-string v1, "1"
                goto :put_track
                :not_track
                const-string v1, "0"
                :put_track
                const/4 v2, 0x6
                aput-object v1, v0, v2
                :done
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeCreateSingleJust",
            """
                invoke-static { p0 }, $singleType->just(Ljava/lang/Object;)$singleType
                move-result-object v0
                return-object v0
            """,
        )

        val pubFactory = mutableClassDefBy(rxPublishSubjectType).methods.single {
            AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.parameterTypes.isEmpty() &&
                it.returnType == rxPublishSubjectType
        }
        replaceBridgeMethod(
            bridgeClass,
            "nativeCreatePublishSubject",
            """
                invoke-static {}, $pubFactory
                move-result-object v0
                return-object v0
            """,
        )

        val behFactory = rxBehaviorSubjectClass.methods.single {
            AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.parameterTypes.isEmpty() &&
                it.returnType == rxBehaviorSubjectClass.type
        }
        replaceBridgeMethod(
            bridgeClass,
            "nativeCreateBehaviorSubject",
            """
                invoke-static {}, $behFactory
                move-result-object v0
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeSubjectOnNextInt",
            """
                if-nez p0, :has_sub
                return-void
                :has_sub
                invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                move-result-object v0
                instance-of v1, p0, $rxPublishSubjectType
                if-eqz v1, :behavior
                check-cast p0, $rxPublishSubjectType
                invoke-virtual { p0, v0 }, $rxPublishSubjectType->onNext(Ljava/lang/Object;)V
                return-void
                :behavior
                check-cast p0, ${rxBehaviorSubjectClass.type}
                invoke-virtual { p0, v0 }, ${rxBehaviorSubjectClass.type}->onNext(Ljava/lang/Object;)V
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeInvokeDisconnectCallback",
            """
                instance-of v0, p0, $sz4Type
                if-eqz v0, :done
                check-cast p0, $sz4Type
                invoke-virtual { p0 }, $sz4Invoke
                :done
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeNotifyListenerConnected",
            """
                check-cast p0, $ba2Type
                check-cast p1, $da2Type
                invoke-interface { p0, p1 }, $ba2Connected
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeNotifyListenerDisconnected",
            """
                check-cast p0, $ba2Type
                check-cast p1, $da2Type
                invoke-interface { p0, p1, p2 }, $ba2Disconnected
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeNotifyListenerConnecting",
            """
                check-cast p0, $ba2Type
                check-cast p1, $da2Type
                invoke-interface { p0, p1 }, $ba2Connecting
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeNotifyListenerDevicesUpdated",
            """
                check-cast p0, $ba2Type
                invoke-interface { p0 }, $ba2DevicesUpdated
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeSetVolumeProviderCurrentVolume",
            """
                instance-of v0, p0, Landroidx/media/VolumeProviderCompat;
                if-eqz v0, :done
                check-cast p0, Landroidx/media/VolumeProviderCompat;
                invoke-virtual { p0, p1 }, Landroidx/media/VolumeProviderCompat;->setCurrentVolume(I)V
                :done
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeGetDrawableResId",
            """
                const/4 v0, 0x1
                if-ne p0, v0, :check_connected
                const v0, 0x${drawableConnecting.toString(16)}
                return v0
                :check_connected
                const/4 v0, 0x2
                if-ne p0, v0, :speaker
                const v0, 0x${drawableConnected.toString(16)}
                return v0
                :speaker
                const v0, 0x${drawableSpeaker.toString(16)}
                return v0
            """,
        )

        // 8. Register LinnBroadcastProviderFactoryAdapter in BroadcastProvidersManager.<init> before init() loop.
        mgrInitMatch.method.let { initMethod ->
            val lastRegisterIdx = initMethod.instructions.indexOfLast { insn ->
                insn.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((insn as ReferenceInstruction).reference as? MethodReference)?.let {
                        it.definingClass == ha2Class.type && it.name == registerProviderMethod.name
                    } == true
            }
            if (lastRegisterIdx < 0) {
                throw PatchException("Could not find ${ha2Class.type}.${registerProviderMethod.name} call in <init>")
            }
            val p0 = initMethod.p0Register
            val insertIdx = lastRegisterIdx + 1
            val factoryReg = initMethod.getFreeRegisterProvider(insertIdx, 1, p0).getFreeRegister()
            initMethod.addInstructions(
                insertIdx,
                """
                    new-instance v$factoryReg, $LINN_FACTORY_ADAPTER_CLASS
                    invoke-direct { v$factoryReg }, $LINN_FACTORY_ADAPTER_CLASS-><init>()V
                    invoke-virtual { v$p0, v$factoryReg }, $registerProviderMethod
                """.trimIndent(),
            )
        }

        // 9. Patch BroadcastItemViewHolder.c(Ly92;)V (Lka2;) so LinnBroadcastItemAdapter renders
        //    its speaker icon, no protocol badge, no Sonos group button, and a custom Wi-Fi subtitle.
        vhBindMatch.method.let { m ->
            val instanceOfCounts = m.instructions
                .filter { it.opcode == Opcode.INSTANCE_OF }
                .map { ((it as ReferenceInstruction).reference as TypeReference).type }
                .groupingBy { it }
                .eachCount()
            val sonosItemType = instanceOfCounts.entries.singleOrNull { it.value == 3 }?.key
                ?: throw PatchException("Could not identify Sonos broadcast item type in ${m.definingClass}.${m.name}")

            val sonosIndices = m.instructions.withIndex()
                .filter { (_, insn) ->
                    insn.opcode == Opcode.INSTANCE_OF &&
                        ((insn as ReferenceInstruction).reference as TypeReference).type == sonosItemType
                }
                .map { it.index }
            if (sonosIndices.size != 3) {
                throw PatchException("Expected 3 Sonos instance-of checks in ${m.definingClass}.${m.name}, got ${sonosIndices.size}")
            }

            // Locate `invoke-static {v1}, Lrvj;->d(Landroid/view/View;)V` right after `iget-object v1, p0, Lka2;->d:Landroid/widget/TextView;`.
            val subTitleFieldIdx = m.instructions.withIndex()
                .lastOrNull { (i, insn) ->
                    insn.opcode == Opcode.IGET_OBJECT &&
                        ((insn as ReferenceInstruction).reference as FieldReference).let {
                            it.definingClass == m.definingClass && it.type == "Landroid/widget/TextView;"
                        } &&
                        i > sonosIndices[1] &&
                        i < sonosIndices[2]
                }?.index
                ?: throw PatchException("Could not locate subtitle TextView load in ${m.definingClass}.${m.name}")

            val subTitleReg = (m.getInstruction(subTitleFieldIdx) as TwoRegisterInstruction).registerA
            val hideCallIdx = m.instructions.withIndex()
                .drop(subTitleFieldIdx + 1)
                .takeWhile { it.index < sonosIndices[2] }
                .lastOrNull { (_, insn) ->
                    insn.opcode == Opcode.INVOKE_STATIC &&
                        ((insn as ReferenceInstruction).reference as MethodReference).let {
                            it.parameterTypes.size == 1 &&
                                it.parameterTypes[0] == "Landroid/view/View;" &&
                                it.returnType == "V"
                        }
                }?.index
                ?: throw PatchException("Could not find TextView hide helper call before ${sonosIndices[2]} in ${m.definingClass}.${m.name}")

            // Apply edits in descending instruction-index order so earlier indices stay valid!
            val p1 = m.p0Register + 1
            if (p1 < 16 && subTitleReg < 16) {
                m.addInstructions(
                    hideCallIdx + 1,
                    "invoke-static { v$p1, v$subTitleReg }, $LINN_BROADCAST_CONTROLLER_CLASS->bindCustomSubtitle(Ljava/lang/Object;Landroid/view/View;)V",
                )
            } else {
                val regs = m.getFreeRegisterProvider(hideCallIdx + 1, 2, p1, subTitleReg)
                val rItem = regs.getFreeRegister()
                val rTv = regs.getFreeRegister()
                val movItem = if (p1 < 16) "move-object v$rItem, v$p1" else "move-object/from16 v$rItem, v$p1"
                val movTv = if (subTitleReg < 16) "move-object v$rTv, v$subTitleReg" else "move-object/from16 v$rTv, v$subTitleReg"
                m.addInstructions(
                    hideCallIdx + 1,
                    """
                        $movItem
                        $movTv
                        invoke-static { v$rItem, v$rTv }, $LINN_BROADCAST_CONTROLLER_CLASS->bindCustomSubtitle(Ljava/lang/Object;Landroid/view/View;)V
                    """.trimIndent(),
                )
            }

            // Patch 2nd Sonos check (protocolIcon = -1, hidden) then 1st Sonos check (icon = ic_broadcast_audio).
            for (idx in listOf(sonosIndices[1], sonosIndices[0])) {
                val insn = m.getInstruction(idx) as TwoRegisterInstruction
                val destReg = insn.registerA
                val srcReg = insn.registerB
                m.addInstructionsWithLabels(
                    idx + 1,
                    """
                        if-nez v$destReg, :mt_linn_item_$idx
                        instance-of v$destReg, v$srcReg, $LINN_ITEM_ADAPTER_CLASS
                        :mt_linn_item_$idx
                        nop
                    """.trimIndent(),
                )
            }
        }

        // 10. Notify LinnBroadcastController when LocalPlayQueue.prepare(...) loads a new song/album/playlist
        //     or LocalPlayQueue.clear(...) clears the queue, and stop Linn playback on MusicService.onDestroy().
        run {
            val (cloned, added) = oz9PrepareMethod.addFreeRegisters(2)
            val regCount = cloned.implementation!!.registerCount
            val saveQueue = regCount - 2
            val saveFrd = regCount - 1
            val p0AfterPrologue = cloned.p0Register - 2
            val p2AfterPrologue = cloned.p0Register
            cloned.addInstructions(
                added,
                """
                    move-object/from16 v$saveQueue, v$p0AfterPrologue
                    move-object/from16 v$saveFrd, v$p2AfterPrologue
                """.trimIndent(),
            )
            val retIdx = cloned.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            if (retIdx <= added) {
                throw PatchException("No return-void found after prologue in ${cloned.definingClass}.${cloned.name}")
            }
            cloned.replaceInstruction(
                retIdx,
                "invoke-static/range { v$saveQueue .. v$saveFrd }, $LINN_BROADCAST_CONTROLLER_CLASS->onPlayQueuePrepared(Ljava/lang/Object;Ljava/lang/Object;)V",
            )
            cloned.addInstructions(retIdx + 1, "return-void")
        }

        run {
            val (cloned, added) = oz9ClearMethod.addFreeRegisters(1)
            val regCount = cloned.implementation!!.registerCount
            val saveQueue = regCount - 1
            val p0AfterPrologue = cloned.p0Register - 1
            cloned.addInstructions(
                added,
                "move-object/from16 v$saveQueue, v$p0AfterPrologue",
            )
            val retIdx = cloned.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            if (retIdx <= added) {
                throw PatchException("No return-void found after prologue in ${cloned.definingClass}.${cloned.name}")
            }
            cloned.replaceInstruction(
                retIdx,
                "invoke-static/range { v$saveQueue .. v$saveQueue }, $LINN_BROADCAST_CONTROLLER_CLASS->onPlayQueueCleared(Ljava/lang/Object;)V",
            )
            cloned.addInstructions(retIdx + 1, "return-void")
        }

        MusicServiceOnDestroyFingerprint.matchSingle().method.addInstructions(
            0,
            "invoke-static {}, $LINN_BROADCAST_CONTROLLER_CLASS->onMusicServiceDestroyed()V",
        )
    }
}

private fun injectAudioPlayerSwitchMethod(
    audioPlayerClass: MutableClass,
    itdType: String,
    lifecycleHolderField: FieldReference,
    progressTrackerField: FieldReference,
    progressResetMethod: MethodReference,
) {
    if (audioPlayerClass.methods.any { it.name == "switchToExternalPlayback" }) {
        return
    }
    val newMethod = ImmutableMethod(
        audioPlayerClass.type,
        "switchToExternalPlayback",
        listOf(ImmutableMethodParameter(itdType, null, "newPlayback")),
        "V",
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        null,
        null,
        MutableMethodImplementation(8),
    ).toMutable()

    newMethod.addInstructionsWithLabels(
        0,
        """
            if-nez p1, :not_null
            return-void
            :not_null
            iget-object v0, p0, ${audioPlayerClass.type}->l:$itdType
            if-ne v0, p1, :do_switch
            return-void
            :do_switch
            invoke-interface { v0 }, $itdType->getCurrentMediaPosition()I
            move-result v1
            invoke-interface { v0 }, $itdType->onDeactivated()V
            iget-object v2, p0, $lifecycleHolderField
            sget-object v3, Lcom/aspiro/wamp/player/PlaybackLifecycleHolder${'$'}State;->INACTIVE:Lcom/aspiro/wamp/player/PlaybackLifecycleHolder${'$'}State;
            iput-object v3, v2, Lcom/aspiro/wamp/player/PlaybackLifecycleHolder;->a:Lcom/aspiro/wamp/player/PlaybackLifecycleHolder${'$'}State;
            iget-object v2, p0, $progressTrackerField
            invoke-virtual { v2 }, $progressResetMethod
            invoke-interface { p1, v1, v0 }, $itdType->onActivated(I$itdType)V
            iget-object v0, p0, $lifecycleHolderField
            sget-object v1, Lcom/aspiro/wamp/player/PlaybackLifecycleHolder${'$'}State;->ACTIVE:Lcom/aspiro/wamp/player/PlaybackLifecycleHolder${'$'}State;
            iput-object v1, v0, Lcom/aspiro/wamp/player/PlaybackLifecycleHolder;->a:Lcom/aspiro/wamp/player/PlaybackLifecycleHolder${'$'}State;
            iput-object p1, p0, ${audioPlayerClass.type}->l:$itdType
            return-void
        """.trimIndent(),
    )
    audioPlayerClass.methods.add(newMethod)
}

private fun MutableClass.addInterface(interfaceType: String) {
    if (!interfaces.contains(interfaceType)) {
        interfaces.add(interfaceType)
    }
}

private fun MutableClass.addForwardingMethod(
    name: String,
    params: List<String>,
    returnType: String,
    implName: String,
    implParams: List<String>,
    implReturnType: String,
) {
    val paramList = params.mapIndexed { idx, t -> ImmutableMethodParameter(t, null, "p$idx") }
    val implSig = "${this.type}->$implName(${implParams.joinToString("")})$implReturnType"
    val paramRegs = (0..params.size).joinToString(", ") { "p$it" }

    val body = buildString {
        appendLine("invoke-virtual { $paramRegs }, $implSig")
        when (returnType) {
            "V" -> appendLine("return-void")
            "Z", "B", "S", "C", "I", "F" -> {
                appendLine("move-result v0")
                appendLine("return v0")
            }
            "J", "D" -> {
                appendLine("move-result-wide v0")
                appendLine("return-wide v0")
            }
            else -> {
                appendLine("move-result-object v0")
                if (implReturnType != returnType) {
                    appendLine("check-cast v0, $returnType")
                }
                appendLine("return-object v0")
            }
        }
    }

    val totalRegs = 2 + params.sumOf { if (it == "J" || it == "D") 2 else 1 } + 1
    val newMethod = ImmutableMethod(
        this.type,
        name,
        paramList,
        returnType,
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        null,
        null,
        MutableMethodImplementation(maxOf(4, totalRegs)),
    ).toMutable()

    newMethod.addInstructionsWithLabels(0, body.trimIndent())
    methods.removeAll { it.name == name && it.parameterTypes.map { p -> p.toString() } == params }
    methods.add(newMethod)
}

private fun replaceBridgeMethod(
    bridgeClass: MutableClass,
    methodName: String,
    smali: String,
) {
    val oldMethod = bridgeClass.methods.singleOrNull { it.name == methodName }
        ?: throw PatchException("Bridge method not found: ${bridgeClass.type}->$methodName")

    val paramWords = oldMethod.parameters.sumOf { if (it.type == "J" || it.type == "D") 2 else 1 }
    val newMethod = ImmutableMethod(
        bridgeClass.type,
        oldMethod.name,
        oldMethod.parameters.map { ImmutableMethodParameter(it.type, it.annotations, it.name) },
        oldMethod.returnType,
        oldMethod.accessFlags,
        oldMethod.annotations,
        oldMethod.hiddenApiRestrictions,
        MutableMethodImplementation(10 + paramWords),
    ).toMutable()

    newMethod.addInstructionsWithLabels(0, smali.trimIndent())

    bridgeClass.methods.remove(oldMethod)
    bridgeClass.methods.add(newMethod)
}
