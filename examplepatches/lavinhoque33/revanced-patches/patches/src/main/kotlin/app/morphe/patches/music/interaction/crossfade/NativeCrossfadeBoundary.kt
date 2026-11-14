/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-13.
 */

package app.morphe.patches.music.interaction.crossfade

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.misc.media.MediaSessionSetPlaybackStateFingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val EXO_PLAYER_TYPE = "Landroidx/media3/exoplayer/ExoPlayer;"

internal fun Method.boundaryCode(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun Method.references() = boundaryCode().mapNotNull { it.getReference<MethodReference>() }
private fun Method.fields() = boundaryCode().mapNotNull { it.getReference<FieldReference>() }
private fun Method.strings() = boundaryCode().mapNotNull { it.getReference<StringReference>()?.string }
private fun Method.signature(parameters: List<String>, result: String) =
    parameterTypes.map { it.toString() } == parameters && returnType == result
private fun Field.instance() = !AccessFlags.STATIC.isSet(accessFlags)
/** The normalization cache stores the exact value sent to Exo, not the separate user-volume parameter. */
internal fun Method.discoverNormalizationField(volumeName: String): FieldReference {
    val code = boundaryCode()
    val call = code.withIndex().single { (_, instruction) ->
        instruction.getReference<MethodReference>()?.let {
            it.definingClass == EXO_PLAYER_TYPE && it.name == volumeName &&
                it.signature(listOf("F"), "V")
        } == true
    }
    val value = when (val instruction = call.value) {
        is FiveRegisterInstruction -> instruction.registerD
        is com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction -> instruction.startRegister + 1
        else -> error("Unsupported native volume invocation")
    }
    val store = code.drop(call.index + 1).first { instruction ->
        (instruction.opcode == Opcode.IPUT && (instruction as TwoRegisterInstruction).registerA == value) ||
            (instruction.opcode.setsRegister() && (instruction as OneRegisterInstruction).registerA == value)
    }
    check(store.opcode == Opcode.IPUT) { "Native normalization value was overwritten before storage" }
    return requireNotNull(store.getReference<FieldReference>()).also {
        check(it.definingClass == definingClass && it.type == "F") {
            "Native normalization value is not stored on the coordinator"
        }
    }
}
private fun Method.initializesSelectorGuard(field: FieldReference): Boolean {
    val code = boundaryCode()
    val read = code.indexOfFirst {
        it.opcode == Opcode.IGET_OBJECT && it.getReference<FieldReference>()?.toString() == field.toString()
    }
    return read >= 0 && code.drop(read + 1).any {
        it.opcode == Opcode.IPUT_OBJECT && it.getReference<FieldReference>()?.toString() == field.toString()
    }
}



/**
 * One read-only graph rooted in the independently discovered PCM renderer/factory, not obfuscated names,
 * field order, or the inherited crossfade fingerprints. Every ambiguous relationship fails before injection.
 * 9.15 uses an AnalyticsCollector interface; 9.40 uses the concrete collector and a merged ListenerSet.
 */
internal class NativeCrossfadeBoundary(private val context: BytecodePatchContext, val pcm: PcmDiscovery) {
    private inline fun <T> boundary(name: String, discover: () -> T): T = try {
        discover()
    } catch (error: Exception) {
        throw IllegalStateException("Native boundary $name: ${error.message}", error)
    }

    private fun cls(type: String) = context.classDefBy(type)
    private fun mutable(type: String) = context.mutableClassDefBy(type)
    private val classes = boundary("classes") {
        buildList { context.classDefForEach { add(it) } }
    }
    val queuePublication = boundary("queuePublication") {
        with(context) { MediaSessionSetPlaybackStateFingerprint.method }
    }
    val publicationEdits = boundary("publicationEdits") { queuePublication.mediaNextHookEdits() }

    private fun hierarchy(type: String): List<ClassDef> = buildList {
        var current: String? = type
        while (current != null && current != "Ljava/lang/Object;") {
            val definition = cls(current)
            add(definition)
            current = definition.superclass
        }
    }

    private fun methods(type: String) = hierarchy(type).flatMap { it.methods }
    private fun fields(type: String) = hierarchy(type).flatMap { it.fields }.filter { it.instance() }
    private fun concrete(type: String): MutableClass {
        val definition = cls(type)
        if (!AccessFlags.INTERFACE.isSet(definition.accessFlags) &&
            !AccessFlags.ABSTRACT.isSet(definition.accessFlags)
        ) return mutable(type)
        return mutable(classes.single {
            !AccessFlags.INTERFACE.isSet(it.accessFlags) && !AccessFlags.ABSTRACT.isSet(it.accessFlags) &&
                (type in it.interfaces || it.superclass == type)
        }.type)
    }

    private fun executable(method: Method): MutableMethod = mutable(method.definingClass).methods.single {
        it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
    }.also { check(it.implementation != null) { "Native boundary has no body: $method" } }

    private fun logged(owner: ClassDef, prefix: String, parameters: List<String>? = null): MutableMethod =
        executable(owner.methods.single {
            it.returnType == "V" && it.strings().any { text -> text.startsWith(prefix) } &&
                (parameters == null || it.parameterTypes.map { type -> type.toString() } == parameters)
        })

    val coordinatorType = boundary("coordinatorType") {
        pcm.factory.parameterTypes[0].toString()
    }
    val coordinatorClass = boundary("coordinatorClass") {
        mutable(coordinatorType)
    }
    val factoryMethod = boundary("factoryMethod") {
        executable(pcm.factory)
    }
    val factoryClass = boundary("factoryClass") {
        mutable(factoryMethod.definingClass)
    }
    val exoPlayerField = boundary("exoPlayerField") {
        coordinatorClass.fields.single { it.instance() && it.type == EXO_PLAYER_TYPE }
    }
    val factoryInputs = boundary("factoryInputs") {
        factoryMethod.fields().filter { it.definingClass == coordinatorType }
            .distinctBy { it.toString() }
    }
    val sessionFieldRef = boundary("sessionFieldRef") {
        factoryInputs.single { field ->
            cls(field.type).fields.any { it.instance() && it.type == factoryClass.type }
        }
    }
    val sessionClass = boundary("sessionClass") {
        mutable(sessionFieldRef.type)
    }
    val factoryFieldRef = boundary("factoryFieldRef") {
        sessionClass.fields.single { it.instance() && it.type == factoryClass.type }
    }
    val loadControlType = boundary("loadControlType") {
        factoryMethod.parameterTypes[1].toString()
    }
    val loadControlField = boundary("loadControlField") {
        coordinatorClass.fields.single {
            it.instance() && (it.type == loadControlType ||
                runCatching { loadControlType in cls(it.type).interfaces }.getOrDefault(false))
        }
    }
    val sharedStateFieldRef = boundary("sharedStateFieldRef") {
        factoryInputs.single { input ->
            input != sessionFieldRef && runCatching {
                fields(concrete(input.type).type).any { it.type == sessionClass.type }
            }.getOrDefault(false)
        }
    }
    val sharedStateClass = boundary("sharedStateClass") {
        concrete(sharedStateFieldRef.type)
    }
    val sharedCallbackFieldRef = boundary("sharedCallbackFieldRef") {
        factoryInputs.single {
            it.toString() != sessionFieldRef.toString() && it.toString() != sharedStateFieldRef.toString()
        }
    }
    val sharedCallbackClass = boundary("sharedCallbackClass") {
        concrete(sharedCallbackFieldRef.type)
    }
    val timelineField = boundary("timelineField") {
        fields(sharedStateClass.type).single { it.type == sessionClass.type }
    }
    private val guardBindings = boundary("guardBindings") {
        hierarchy(sharedStateClass.type).drop(1).flatMap { owner ->
            if (!AccessFlags.ABSTRACT.isSet(owner.accessFlags)) return@flatMap emptyList()
            owner.fields.filter { field ->
                field.instance() && (
                    owner.methods.any { method ->
                        method.returnType == "V" && method.parameterTypes.size == 2 &&
                            method.initializesSelectorGuard(field)
                    } || classes.any { implementation ->
                        // 9.15 inlines initialization into the internal player's constructor.
                        field.type in implementation.interfaces && implementation.methods.any { method ->
                            method.name == "<init>" && owner.type in method.parameterTypes &&
                                method.initializesSelectorGuard(field)
                        }
                    }
                )
            }.map { owner to it }
        }
    }
    val guardOwner = boundary("guardOwner") {
        guardBindings.single().first
    }
    val guardAbstractType = boundary("guardAbstractType") {
        guardOwner.type
    }
    val guardField = boundary("guardField") {
        guardBindings.single().second
    }

    val exoPlayerImplClass = boundary("exoPlayerImplClass") {
        mutable(classes.single { definition ->
            EXO_PLAYER_TYPE in definition.interfaces && definition.methods.any { method ->
                method.name == "<init>" && method.references().any { reference ->
                    reference.parameterTypes.firstOrNull()?.toString() == "Landroid/os/Handler;" &&
                        reference.returnType.startsWith("[") &&
                        coordinatorClass.interfaces.contains(reference.definingClass)
                }
            }
        }.type)
    }
    val exoImplMethods = boundary("exoImplMethods") {
        methods(exoPlayerImplClass.type)
    }
    val exoImplFields = boundary("exoImplFields") {
        fields(exoPlayerImplClass.type)
    }
    val playerInterfaceType = boundary("playerInterfaceType") {
        cls(EXO_PLAYER_TYPE).interfaces.single { type ->
            cls(type).methods.any { it.signature(listOf("Landroid/view/Surface;"), "V") }
        }
    }
    private fun playerMethod(parameters: List<String>, result: String): Method =
        cls(playerInterfaceType).methods.single { it.signature(parameters, result) }
    private fun nativePlayerMethod(method: Method) = exoImplMethods.single {
        it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType &&
            it.implementation != null
    }
    val exoVolumeSetter = boundary("exoVolumeSetter") {
        executable(nativePlayerMethod(playerMethod(listOf("F"), "V")))
    }
    val rawVolumeField = boundary("rawVolumeField") {
        exoVolumeSetter.fields().filter {
            it.type == "F" && it.definingClass == exoVolumeSetter.definingClass
        }.distinctBy { it.toString() }.single()
    }
    val playerVolumeMethod = boundary("playerVolumeMethod") {
        executable(coordinatorClass.methods.single { method ->
            method.signature(listOf("F"), "V") && method.references().any {
                it.name == exoVolumeSetter.name && it.definingClass == EXO_PLAYER_TYPE
            }
        })
    }
    val playerVolumeField = boundary("playerVolumeField") {
        playerVolumeMethod.discoverNormalizationField(exoVolumeSetter.name)
    }
    val setPlayWhenReadyName = boundary("setPlayWhenReadyName") {
        playerMethod(listOf("Z"), "V").name
    }
    val setVideoSurfaceName = boundary("setVideoSurfaceName") {
        playerMethod(listOf("Landroid/view/Surface;"), "V").name
    }
    val releaseName = boundary("releaseName") {
        cls(EXO_PLAYER_TYPE).methods.single {
            it.signature(emptyList(), "V") && it.name != "<clinit>"
        }.name
    }

    private val isPlaying = boundary("isPlaying") {
        exoImplMethods.single { method ->
            method.signature(emptyList(), "Z") && method.boundaryCode().any {
                it is NarrowLiteralInstruction && it.narrowLiteral == 3
            } && method.references().count { it.signature(emptyList(), "Z") } == 1
        }
    }
    val getPlayWhenReadyName = boundary("getPlayWhenReadyName") {
        isPlaying.references().single { it.signature(emptyList(), "Z") }.name
    }
    val getPlaybackStateName = boundary("getPlaybackStateName") {
        isPlaying.references().first { it.signature(emptyList(), "I") }.name
    }
    private val stateGetter = boundary("stateGetter") {
        nativePlayerMethod(playerMethodByName(getPlaybackStateName, "I"))
    }
    private fun playerMethodByName(name: String, result: String) =
        methods(exoPlayerImplClass.type).first { it.name == name && it.signature(emptyList(), result) }
    val playbackInfoClass = boundary("playbackInfoClass") {
        cls(stateGetter.fields().single { it.type.startsWith("L") }.type)
    }
    val playbackInfoField = boundary("playbackInfoField") {
        exoImplFields.single { it.type == playbackInfoClass.type }
    }
    val errorField = boundary("errorField") {
        playbackInfoClass.fields.single { field ->
            var type = field.type
            while (type.startsWith("L") && type != "Ljava/lang/Object;") {
                if (type == "Ljava/lang/Exception;") return@single true
                type = runCatching { cls(type).superclass }.getOrNull() ?: return@single false
            }
            false
        }
    }
    val getDurationName = boundary("getDurationName") {
        exoImplMethods.single { method ->
            method.signature(emptyList(), "J") && method.boundaryCode().any {
                (it as? com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction)?.wideLiteral ==
                    -9223372036854775807L
            }
        }.name
    }
    val getCurrentPositionName = boundary("getCurrentPositionName") {
        exoImplMethods.single { method ->
            method.signature(emptyList(), "J") && method.name != getDurationName && method.references().any {
                it.signature(listOf(playbackInfoClass.type), "J")
            }
        }.name
    }

    val copyOnWriteSetType = boundary("copyOnWriteSetType") {
        "Ljava/util/concurrent/CopyOnWriteArraySet;"
    }
    fun Method.callsCopyOnWriteSet(name: String) = references().any {
        it.definingClass == copyOnWriteSetType && it.name == name
    }
    val listenerWrapperField = boundary("listenerWrapperField") {
        exoImplFields.single { field ->
            runCatching { cls(field.type).methods.any { method ->
                method.name == "<init>" && method.parameterTypes.firstOrNull()?.toString() == copyOnWriteSetType &&
                    "Landroid/os/Looper;" in method.parameterTypes && "Ljava/lang/Thread;" in method.parameterTypes
            } }.getOrDefault(false)
        }
    }
    val listenerWrapperClass = boundary("listenerWrapperClass") {
        cls(listenerWrapperField.type)
    }
    val cauAddMethod = boundary("cauAddMethod") {
        listenerWrapperClass.methods.single {
            it.signature(listOf("Ljava/lang/Object;"), "V") && it.callsCopyOnWriteSet("add") &&
                it.boundaryCode().any { instruction -> instruction.opcode == Opcode.NEW_INSTANCE }
        }
    }
    val cauRemoveMethod = boundary("cauRemoveMethod") {
        listenerWrapperClass.methods.single {
            it.signature(listOf("Ljava/lang/Object;"), "V") && it.callsCopyOnWriteSet("remove")
        }
    }
    val forwardingPlayerField9x = boundary("forwardingPlayerField9x") {
        coordinatorClass.fields.single {
            it.toString() == sharedCallbackFieldRef.toString()
        }
    }
    val exoPlayerCwhField9x = boundary("exoPlayerCwhField9x") {
        exoImplFields.single { it.type == sharedCallbackFieldRef.type }
    }
    val cwhAddListenerMethod = boundary("cwhAddListenerMethod") {
        sharedCallbackClass.methods.single { method ->
            method.returnType == "V" && method.parameterTypes.size == 1 &&
                method.parameterTypes[0].toString() != "Ljava/lang/Object;" && method.references().any {
                    it.toString() == cauAddMethod.toString()
                }
        }
    }
    val cwhListenerType = boundary("cwhListenerType") {
        cwhAddListenerMethod.parameterTypes.single().toString()
    }
    val coordinatorCwhListenerField9x = boundary("coordinatorCwhListenerField9x") {
        coordinatorClass.fields.single { field ->
            field.instance() && runCatching { cwhListenerType in cls(field.type).interfaces }.getOrDefault(false)
        }
    }
    val eventDispatchField9x = boundary("eventDispatchField9x") {
        listenerWrapperField
    }
    val cqbField = boundary("cqbField") {
        fields(sharedCallbackClass.type).single { it.type == playerInterfaceType }
    }
    val dltCallbackTypeOnShared = boundary("dltCallbackTypeOnShared") {
        fields(sharedCallbackClass.type).single { field ->
            sharedCallbackClass.methods.any {
                it.name == "<init>" && it.parameterTypes.map { type -> type.toString() } == listOf(field.type)
            }
        }
    }
    val dltFieldOnExo = boundary("dltFieldOnExo") {
        exoImplFields.single { it.type == dltCallbackTypeOnShared.type }
    }
    val directListenerSetField = boundary("directListenerSetField") {
        exoImplFields.single { it.type == copyOnWriteSetType }
    }
    val directListenerType = boundary("directListenerType") {
        exoImplMethods.single {
            it.returnType == "V" && it.parameterTypes.size == 1 && it.callsCopyOnWriteSet("add") &&
                it.fields().any { field -> field.toString() == directListenerSetField.toString() }
        }.parameterTypes.single().toString()
    }
    val coordinatorListenerField = boundary("coordinatorListenerField") {
        coordinatorClass.fields.single { it.instance() && it.type == directListenerType }
    }

    val videoSurfaceClass = boundary("videoSurfaceClass") {
        mutable(coordinatorClass.fields.filter { it.instance() }.mapNotNull { field ->
            runCatching { cls(field.type) }.getOrNull()
        }.single { definition ->
            definition.type != sharedCallbackFieldRef.type && definition.type != sharedStateFieldRef.type &&
                definition.type != EXO_PLAYER_TYPE && definition.fields.any {
                    it.instance() && it.type == EXO_PLAYER_TYPE
                }
        }.type)
    }
    val videoSurfaceField = boundary("videoSurfaceField") {
        coordinatorClass.fields.single { it.instance() && it.type == videoSurfaceClass.type }
    }
    val releaseMethod = boundary("releaseMethod") {
        executable(exoImplMethods.single {
            it.name == releaseName && it.signature(emptyList(), "V")
        })
    }
    private val collectorReleaseCalls = boundary("collectorReleaseCalls") {
        releaseMethod.references().filter {
            it.definingClass == sharedCallbackFieldRef.type && it.signature(emptyList(), "V")
        }
    }
    val collectorRelease = boundary("collectorRelease") {
        collectorReleaseCalls.singleOrNull()?.let { reference ->
            executable(sharedCallbackClass.methods.single {
                it.name == reference.name && it.signature(emptyList(), "V")
            })
        }
    }
    val releasePostIndex: Int? = boundary("releasePostIndex") {
        if (collectorRelease == null) {
            val code = releaseMethod.boundaryCode()
            val handlerReads = code.withIndex().filter { (_, instruction) ->
                instruction.opcode == Opcode.IGET_OBJECT && instruction.getReference<FieldReference>()?.definingClass ==
                    sharedCallbackClass.type
            }
            val handlerRead = handlerReads.single()
            val handlerRegister = (handlerRead.value as TwoRegisterInstruction).registerA
            code.withIndex().filter { (index, instruction) ->
                index > handlerRead.index && instruction is FiveRegisterInstruction &&
                    instruction.registerC == handlerRegister && instruction.getReference<MethodReference>()?.signature(
                    listOf("Ljava/lang/Runnable;"), "V",
                ) == true
            }.single().index
        } else null
    }
    val releaseRunnableRegister = boundary("releaseRunnableRegister") {
        releasePostIndex?.let {
            (releaseMethod.boundaryCode()[it] as FiveRegisterInstruction).registerD
        }
    }
    val videoSurfaceExoField = boundary("videoSurfaceExoField") {
        videoSurfaceClass.fields.single { it.instance() && it.type == EXO_PLAYER_TYPE }
    }

    val medialibPlayerClass = boundary("medialibPlayerClass") {
        mutable(classes.single { definition ->
            definition.methods.any { it.strings().any { text -> text.startsWith("MedialibPlayer.stopVideo()") } } &&
                definition.methods.any { it.strings().any { text -> text.startsWith("MedialibPlayer.loadVideo(") } }
        }.type)
    }
    val stopVideo = boundary("stopVideo") {
        logged(medialibPlayerClass, "MedialibPlayer.stopVideo()", listOf("I"))
    }
    val pauseVideo = boundary("pauseVideo") {
        logged(medialibPlayerClass, "MedialibPlayer.pauseVideo()", listOf("I"))
    }
    val playVideo = boundary("playVideo") {
        logged(medialibPlayerClass, "MedialibPlayer.playVideo()", emptyList())
    }
    val loadVideoMethod = boundary("loadVideoMethod") {
        logged(medialibPlayerClass, "MedialibPlayer.loadVideo(")
    }
    val playNextInQueueMethod = boundary("playNextInQueueMethod") {
        logged(medialibPlayerClass, "MedialibPlayer.playNextInQueue", emptyList())
    }
    val playNext = boundary("playNext") {
        executable(coordinatorClass.methods.single { method ->
            method.signature(emptyList(), "V") && method.strings().any { it.contains("gapless.seek.next") }
        })
    }
    val playerChainField = boundary("playerChainField") {
        medialibPlayerClass.fields.single { field ->
            field.instance() && playNextInQueueMethod.fields().any { it.toString() == field.toString() } &&
                runCatching { AccessFlags.INTERFACE.isSet(cls(field.type).accessFlags) }.getOrDefault(false)
        }
    }
    val delegateClasses = boundary("delegateClasses") {
        classes.filter { definition ->
            !AccessFlags.INTERFACE.isSet(definition.accessFlags) && playerChainField.type in definition.interfaces &&
                definition.fields.any { it.instance() && it.type == playerChainField.type }
        }.map { definition ->
            mutable(definition.type) to definition.fields.single { it.instance() && it.type == playerChainField.type }
        }.also { check(it.isNotEmpty()) { "No native player-chain decorators" } }
    }
    val modeSwitch = boundary("modeSwitch") {
        executable(classes.flatMap { it.methods }.single { method ->
            method.signature(emptyList(), "V") &&
                "Failed to update user last selected audio" in method.strings()
        })
    }
    val dismiss = boundary("dismiss") {
        executable(classes.flatMap { it.methods }.single { method ->
            method.name == "handleDismissWatchEvent" && method.parameterTypes.size == 1 && method.references().any {
                it.definingClass == "Lcom/google/android/apps/youtube/music/watchpage/ui/WatchWhileLayout;"
            }
        })
    }
    val loopState = boundary("loopState") {
        executable(classes.flatMap { it.methods }.single { method ->
            method.signature(listOf("Ljava/lang/Object;"), "V") && method.strings().any {
                it.startsWith("attempted to update repeat mode but media session was null")
            }
        })
    }
    private val sleepEnum = boundary("sleepEnum") {
        classes.single { definition ->
            definition.superclass == "Ljava/lang/Enum;" && definition.methods.any { method ->
                method.name == "<clinit>" && method.strings().containsAll(
                    listOf("INACTIVE", "ACTIVE_TIMER", "ACTIVE_END_OF_TRACK"),
                )
            }
        }
    }
    val sleepState = boundary("sleepState") {
        executable(classes.flatMap { owner -> owner.methods.filter { method ->
            !AccessFlags.STATIC.isSet(method.accessFlags) && method.signature(listOf(sleepEnum.type), "V") &&
                owner.methods.any { it.signature(emptyList(), sleepEnum.type) }
        } }.single())
    }
    private val effectOwner = boundary("effectOwner") {
        classes.single { definition -> definition.methods.any { method ->
            method.name == "<init>" && method.strings().containsAll(listOf(
                "android.media.action.OPEN_AUDIO_EFFECT_CONTROL_SESSION",
                "android.media.action.CLOSE_AUDIO_EFFECT_CONTROL_SESSION",
            ))
        } }
    }
    val closeSession = boundary("closeSession") {
        executable(effectOwner.methods.single { method ->
            method.signature(listOf("I"), "V") && "android.media.extra.AUDIO_SESSION" in method.strings() &&
                method.references().any { it.toString() == BROADCAST }
        })
    }
    val openSession = boundary("openSession") {
        executable(classes.flatMap { it.methods }.single { method ->
            method.signature(listOf("I"), "V") && method.fields().any { it.type == effectOwner.type } &&
                method.references().any { it.toString() == BROADCAST }
        })
    }
    fun broadcastIndex(method: Method) = method.boundaryCode().indices.single {
        method.boundaryCode()[it].getReference<MethodReference>()?.toString() == BROADCAST
    }

    val descriptorClass = boundary("descriptorClass") {
        cls(loadVideoMethod.parameterTypes.single().toString())
    }
    private val mediaRecord = boundary("mediaRecord") {
        descriptorClass.methods.filter { it.parameterTypes.isEmpty() }.mapNotNull { getter ->
            runCatching { cls(getter.returnType) }.getOrNull()?.let { record -> getter to record }
        }.single { (_, record) -> record.methods.any { method ->
            method.name == "<init>" && method.parameterTypes.firstOrNull()?.toString()
                ?.contains("StreamingDataOuterClass") == true
        } }
    }
    val mediaGetter = boundary("mediaGetter") {
        mediaRecord.first
    }
    val mediaIdClass = boundary("mediaIdClass") {
        mediaRecord.second
    }
    private val mediaConstructor = boundary("mediaConstructor") {
        mediaIdClass.methods.single { method ->
            method.name == "<init>" && method.parameterTypes.firstOrNull()?.toString()
                ?.contains("StreamingDataOuterClass") == true
        }
    }
    val descriptorId: FieldReference = boundary("descriptorId") {
        run {
            val code = mediaConstructor.boundaryCode()
            val candidates = code.withIndex().filter { (_, instruction) ->
                instruction.opcode == Opcode.IGET_OBJECT && instruction.getReference<FieldReference>()?.let {
                    it.definingClass == mediaConstructor.parameterTypes[1].toString() && it.type == "Ljava/lang/String;"
                } == true
            }.mapNotNull { (index, instruction) ->
                val register = (instruction as TwoRegisterInstruction).registerA
                code.drop(index + 1).firstOrNull {
                    (it.opcode == Opcode.IPUT_OBJECT && (it as TwoRegisterInstruction).registerA == register) ||
                        (it.opcode.setsRegister() && (it as OneRegisterInstruction).registerA == register)
                }?.takeIf { it.opcode == Opcode.IPUT_OBJECT }?.getReference<FieldReference>()?.takeIf {
                    it.definingClass == mediaIdClass.type && it.type == "Ljava/lang/String;"
                }
            }.distinctBy { it.toString() }
            candidates.single()
        }
    }
    val getterOpcode = boundary("getterOpcode") {
        if (AccessFlags.INTERFACE.isSet(descriptorClass.accessFlags)) {
            "invoke-interface"
        } else "invoke-virtual"
    }

    fun summary() = "Owned native graph: coordinator=$coordinatorType factory=$factoryMethod " +
        "player=${exoPlayerImplClass.type} state=$sharedStateFieldRef collector=$sharedCallbackFieldRef " +
        "listeners=$listenerWrapperField " +
        "release=${if (collectorRelease == null) "inlined" else "called"} " +
        "decorators=${delegateClasses.size} PCM-branches=${pcm.rendererBranchCount}"

    init {
        check(pcm.rendererBranchCount == 4) { "Expected four stock PCM construction branches" }
        check(loadVideoMethod.parameterTypes.size == 1) { "Native load descriptor ABI changed" }
        listOf(getPlayWhenReadyName, setPlayWhenReadyName, releaseName, setVideoSurfaceName,
            getPlaybackStateName, getDurationName, getCurrentPositionName).forEach { name ->
            check(exoImplMethods.any { it.name == name && it.implementation != null }) {
                "Native player bridge target is missing: $name"
            }
        }
    }

    companion object {
        const val BROADCAST = "Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V"
    }
}

private fun MethodReference.signature(parameters: List<String>, result: String) =
    parameterTypes.map { it.toString() } == parameters && returnType == result
