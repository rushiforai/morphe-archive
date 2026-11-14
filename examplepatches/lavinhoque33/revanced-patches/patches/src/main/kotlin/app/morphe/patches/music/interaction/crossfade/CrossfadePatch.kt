/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/1065
 * https://github.com/MorpheApp/morphe-patches/pull/3635
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-11-13.
 */

package app.morphe.patches.music.interaction.crossfade

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.music.utils.extension.sharedExtensionPatch
import app.morphe.patches.music.utils.playservice.versionCheckPatch
import app.morphe.patches.music.utils.playservice.is_9_00_or_greater
import app.morphe.patches.music.utils.settings.settingsPatch
import app.morphe.patches.music.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.shared.mainactivity.getMainActivityMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import java.util.logging.Logger
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patches.music.utils.settings.CategoryType
import app.morphe.patches.music.utils.settings.ResourceUtils
import app.morphe.patches.music.utils.settings.ResourceUtils.addPreferenceCategory
import app.morphe.patches.music.utils.settings.ResourceUtils.editPreferenceCategory
import app.morphe.util.ResourceGroup
import app.morphe.util.Utils.printWarn
import app.morphe.util.adoptChild
import app.morphe.util.cloneMutable
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.copyResources
import app.morphe.util.registersUsed
import org.w3c.dom.Element

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/music/patches/CrossfadeManager;"

private const val COORDINATOR_INTERFACE =
    $$"Lapp/morphe/extension/music/patches/CrossfadeManager$PlayerCoordinatorAccess;"
private const val EXO_PLAYER_INTERFACE =
    $$"Lapp/morphe/extension/music/patches/CrossfadeManager$ExoPlayerAccess;"
private const val SESSION_INTERFACE =
    $$"Lapp/morphe/extension/music/patches/CrossfadeManager$SessionAccess;"
private const val FACTORY_INTERFACE =
    $$"Lapp/morphe/extension/music/patches/CrossfadeManager$PlayerFactoryAccess;"
private const val SHARED_STATE_INTERFACE =
    $$"Lapp/morphe/extension/music/patches/CrossfadeManager$SharedStateAccess;"
private const val SHARED_CALLBACK_INTERFACE =
    $$"Lapp/morphe/extension/music/patches/CrossfadeManager$SharedCallbackAccess;"
private const val VIDEO_SURFACE_INTERFACE =
    $$"Lapp/morphe/extension/music/patches/CrossfadeManager$VideoSurfaceAccess;"
private const val MEDIALIB_PLAYER_INTERFACE =
    $$"Lapp/morphe/extension/music/patches/CrossfadeManager$MedialibPlayerAccess;"
private const val DELEGATE_INTERFACE =
    $$"Lapp/morphe/extension/music/patches/CrossfadeManager$DelegateAccess;"


/** Replacing the labelled return is essential: inserting before it lets native branches bypass cleanup. */
internal fun MutableMethod.installModeSwitchHooks() {
    val returns = instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
    check(returns.isNotEmpty()) { "Audio/video toggle has no successful completion" }
    returns.reversed().forEach { index ->
        replaceInstruction(index, "invoke-static {}, $EXTENSION_CLASS->onVideoToggleFinished()V")
        addInstruction(index + 1, "return-void")
    }
    addInstruction(0, "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onVideoToggle(Ljava/lang/Object;)V")
}

/** Capture native capability before notification-only filtering, regardless of patch execution order. */
internal fun MutableMethod.mediaNextHookEdits(): List<Pair<Int, String>> {
    val calls = instructions.withIndex().filter { (_, instruction) ->
        instruction.getReference<MethodReference>()?.toString() ==
            "Landroid/media/session/MediaSession;->setPlaybackState(Landroid/media/session/PlaybackState;)V"
    }
    check(calls.isNotEmpty()) { "Platform MediaSession playback-state publication was not found" }
    val target = "Lapp/morphe/extension/music/patches/crossfade/QueueAdvanceBridge;" +
        "->capture(Landroid/media/session/MediaSession;Landroid/media/session/PlaybackState;)V"
    return calls.reversed().map { (index, instruction) ->
        val invoke = when (instruction) {
            is FiveRegisterInstruction -> {
                "invoke-static {v${instruction.registerC}, v${instruction.registerD}}, $target"
            }
            is RegisterRangeInstruction -> {
                val first = instruction.startRegister
                "invoke-static/range {v$first .. v${first + 1}}, $target"
            }
            else -> error("Unsupported platform MediaSession invocation")
        }
        val stateRegister = when (instruction) {
            is FiveRegisterInstruction -> instruction.registerD
            is RegisterRangeInstruction -> instruction.startRegister + 1
            else -> error("Unsupported platform MediaSession invocation")
        }
        val filterIndex = instructions.take(index).indexOfLast { candidate ->
            candidate.getReference<MethodReference>()?.toString() ==
                "Lapp/morphe/extension/music/patches/misc/MediaNotificationControlsPatch;" +
                "->changePlaybackState(Landroid/media/session/PlaybackState;)Landroid/media/session/PlaybackState;"
        }
        val captureIndex = if (filterIndex >= 0) {
            val filter = getInstruction<FiveRegisterInstruction>(filterIndex)
            check(filter.registerCount == 1 && filter.registerC == stateRegister) {
                "Notification filter no longer consumes the native publication state"
            }
            check(getInstruction<OneRegisterInstruction>(filterIndex + 1).registerA == stateRegister &&
                getInstruction(filterIndex + 1).opcode == Opcode.MOVE_RESULT_OBJECT
            ) { "Notification filter result no longer reaches the native publication" }
            val ownerRegister = when (instruction) {
                is FiveRegisterInstruction -> instruction.registerC
                is RegisterRangeInstruction -> instruction.startRegister
                else -> error("Unsupported platform MediaSession invocation")
            }
            check(instructions.drop(filterIndex + 2).take(index - filterIndex - 2).none { candidate ->
                if (!candidate.opcode.setsRegister()) return@none false
                val register = (candidate as OneRegisterInstruction).registerA
                register == stateRegister || register == ownerRegister ||
                    candidate.opcode.setsWideRegister() &&
                    (register + 1 == stateRegister || register + 1 == ownerRegister)
            }) { "Notification publication arguments were overwritten after filtering" }
            filterIndex
        } else index
        captureIndex to invoke
    }
}

internal fun MutableMethod.installMediaNextHook(edits: List<Pair<Int, String>> = mediaNextHookEdits()) {
    edits.forEach { (index, invoke) -> addInstructionsAtControlFlowLabel(index, invoke) }
}

internal fun MutableMethod.installMediaSessionReleaseHook() {
    instructions.withIndex().filter { (_, instruction) ->
        instruction.getReference<MethodReference>()?.toString() == "Landroid/media/session/MediaSession;->release()V"
    }.toList().reversed().forEach { (index, instruction) ->
        val receiver = when (instruction) {
            is FiveRegisterInstruction -> instruction.registerC
            is RegisterRangeInstruction -> instruction.startRegister
            else -> error("Unsupported platform MediaSession release invocation")
        }
        addInstruction(index + 1, "invoke-static/range {v$receiver .. v$receiver}, " +
            "Lapp/morphe/extension/music/patches/crossfade/QueueAdvanceBridge;" +
            "->release(Landroid/media/session/MediaSession;)V")
    }
}

private fun MutableClass.addBridge(
    name: String,
    parameters: List<String>,
    returnType: String,
    registers: Int,
    smali: String
) {
    methods.add(
        ImmutableMethod(
            type,
            name,
            parameters.map { ImmutableMethodParameter(it, null, null) },
            returnType,
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            null,
            null,
            MutableMethodImplementation(registers),
        ).toMutable().apply { addInstructions(0, smali) }
    )
}

private fun FieldReference.isStaticField() = (this as? Field)?.let { AccessFlags.STATIC.isSet(it.accessFlags) } == true

private fun MutableClass.addFieldGetter(methodName: String, fieldRef: FieldReference) {
    val read = if (fieldRef.isStaticField()) "sget-object v0, $fieldRef" else "iget-object v0, p0, $fieldRef"
    addBridge(methodName, emptyList(), "Ljava/lang/Object;", 2, "$read\nreturn-object v0")
}

private fun MutableClass.addFieldSetter(methodName: String, fieldRef: FieldReference) {
    val write = if (fieldRef.isStaticField()) "sput-object p1, $fieldRef" else "iput-object p1, p0, $fieldRef"
    addBridge(methodName, listOf("Ljava/lang/Object;"), "V", 2, "check-cast p1, ${fieldRef.type}\n$write\nreturn-void")
}

/**
 * Ships the crossfade About-screen header graphic: the banner WebP drawable and the
 * full-width ImageView layout it's shown through.  Kept as a resource patch because
 * copyResources needs the resource-patch context; crossfadePatch depends on it.
 */
private val crossfadeBannerResourcePatch = resourcePatch {
    execute {
        copyResources(
            "crossfade",
            ResourceGroup("drawable-nodpi", "morphe_crossfade_about_banner.webp"),
            ResourceGroup("layout", "morphe_crossfade_about_banner.xml"),
        )
    }
}

@Suppress("unused")
val crossfadePatch = bytecodePatch(
    name = "Track crossfade",
    description = "Adds a true dual-player crossfade between consecutive tracks. " +
        "Requires YouTube Music 9.00 or newer; on older versions the patch is a no-op.",
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        versionCheckPatch,
        crossfadeBannerResourcePatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    execute {
        val log = Logger.getLogger(this::class.java.name)
        if (!is_9_00_or_greater) {
            return@execute printWarn(
                "Track crossfade requires YouTube Music 9.00 or newer. " +
                    "Skipping the incompatible older ExoPlayer listener architecture."
            )
        }

        val native = runCatching {
            NativeCrossfadeBoundary(this, discoverPcmCrossfade())
        }.getOrElse {
            return@execute printWarn(
                "Track crossfade native discovery failed; playback unchanged: ${it.message}; " +
                    it.stackTrace.take(4).joinToString(" <- ")
            )
        }
        if (!installPcmCrossfade(native.pcm)) return@execute
        with(native) {
            queuePublication.installMediaNextHook(publicationEdits)
            log.info(native.summary())
            Fingerprint(
                filters = listOf(
                    methodCall(
                        definingClass = "Landroid/media/session/MediaSession;",
                        name = "release",
                        parameters = emptyList(),
                        returnType = "V",
                    ),
                ),
            ).matchAll().forEach { it.method.installMediaSessionReleaseHook() }
            // UI/MediaSession navigation does not necessarily call MedialibPlayer.playNextInQueue.
            // Find its real command dispatcher from the NEXT enum -> command builder -> navigate ABI.
            val nextEnums = mutableSetOf<String>()
            classDefForEach { enumClass ->
                if (enumClass.superclass == "Ljava/lang/Enum;" && enumClass.methods.any { method ->
                        method.name == "<clinit>" && method.implementation?.instructions?.any {
                            it.getReference<StringReference>()?.string == "NEXT"
                        } == true
                    }
                ) nextEnums.add(enumClass.type)
            }
            val navigationReferences = mutableSetOf<MethodReference>()
            classDefForEach { classDef ->
                for (method in classDef.methods) {
                    val code = method.implementation?.instructions ?: continue
                    var builder: MethodReference? = null
                    var following = 0
                    for (instruction in code) {
                        if (following > 0) {
                            if (instruction.opcode == Opcode.INVOKE_INTERFACE) {
                                val reference = instruction.getReference<MethodReference>()!!
                                if (reference.returnType == "V" && reference.parameterTypes.size == 1 &&
                                    reference.parameterTypes.first().toString() == builder!!.returnType
                                ) navigationReferences.add(reference)
                            }
                            following--
                        }
                        if (instruction.opcode != Opcode.INVOKE_VIRTUAL) continue
                        val reference = instruction.getReference<MethodReference>()!!
                        if (reference.parameterTypes.size == 3 &&
                            reference.parameterTypes[2].toString() == "Ljava/util/Map;" &&
                            reference.parameterTypes.first().toString() in nextEnums
                        ) {
                            builder = reference
                            following = 2
                        }
                    }
                }
            }
            val navigation = navigationReferences.singleOrNull()
                ?: error("Native NEXT navigation dispatcher was not uniquely resolved")
            val navigationEntries = mutableListOf<MutableMethod>()
            classDefForEach { classDef ->
                if (navigation.definingClass in classDef.interfaces) {
                    val entry = mutableClassDefBy(classDef.type).methods.firstOrNull {
                        it.name == navigation.name && it.parameterTypes == navigation.parameterTypes &&
                            it.returnType == navigation.returnType && it.implementation != null
                    }
                    if (entry != null) navigationEntries.add(entry)
                }
            }
            check(navigationEntries.isNotEmpty()) { "Native NEXT navigation has no executable dispatcher" }
            navigationEntries.forEach {
                it.addInstruction(0, "invoke-static {}, $EXTENSION_CLASS->onQueueCommand()V")
            }


            // 9.28+ keeps many fields private, and the bridges below read them from other
            // classes, which throws IllegalAccessError at runtime (#2106).
            fun makeFieldPublic(fieldRef: FieldReference) {
                val field = mutableClassDefBy(fieldRef.definingClass).fields.first {
                    it.name == fieldRef.name && it.type == fieldRef.type
                }
                val hiddenFlags = AccessFlags.PRIVATE.value or AccessFlags.PROTECTED.value
                field.setAccessFlags((field.accessFlags and hiddenFlags.inv()) or AccessFlags.PUBLIC.value)
            }

            fun Element.addCrossfadeSwitch(
                key: String,
                defaultValue: String,
                setSummary: Boolean = false,
            ) {
                adoptChild(ResourceUtils.SWITCH_PREFERENCE_TAG_NAME) {
                    setAttribute("android:key", key)
                    setAttribute("android:title", "@string/${key}_title")
                    setAttribute("android:defaultValue", defaultValue)
                    if (setSummary) {
                        setAttribute("android:summary", "@string/${key}_summary")
                    }
                }
            }

            fun Element.addCrossfadeListPreference(key: String) {
                adoptChild(ResourceUtils.LIST_PREFERENCE_TAG_NAME) {
                    setAttribute("android:key", key)
                    setAttribute("android:title", "@string/${key}_title")
                    setAttribute("android:entries", "@array/${key}_entries")
                    setAttribute("android:entryValues", "@array/${key}_entry_values")
                }
            }

            fun Element.addCrossfadeStaticPreference(
                key: String,
                titleKey: String = "${key}_title",
                summaryKey: String? = "${key}_summary",
                tag: String = "Preference",
                layout: String? = null,
            ) {
                adoptChild(tag) {
                    setAttribute("android:key", key)
                    setAttribute("android:title", "@string/$titleKey")
                    summaryKey?.let { setAttribute("android:summary", "@string/$it") }
                    layout?.let { setAttribute("android:layout", it) }
                    setAttribute("android:selectable", "false")
                }
            }

            addPreferenceCategory(CategoryType.PLAYER.value)
            editPreferenceCategory(CategoryType.PLAYER.value) {
                adoptChild(ResourceUtils.PREFERENCE_SCREEN_TAG_NAME) {
                    setAttribute("android:key", "morphe_music_crossfade_screen")
                    setAttribute("android:title", "@string/morphe_music_crossfade_screen_title")
                    setAttribute("android:summary", "@string/morphe_music_crossfade_screen_summary")

                    addCrossfadeSwitch("morphe_music_crossfade_enabled", "false")
                    addCrossfadeListPreference("morphe_music_crossfade_curve")
                    addCrossfadeStaticPreference(
                        key = "morphe_music_crossfade_curve_preview",
                        titleKey = "morphe_music_crossfade_curve_preview_title",
                        summaryKey = null,
                        tag = "app.morphe.extension.music.settings.preference.CrossfadeCurvePreference",
                    )
                    addCrossfadeListPreference("morphe_music_crossfade_duration")
                    addCrossfadeSwitch("morphe_music_crossfade_on_skip", "true", setSummary = true)
                    addCrossfadeSwitch(
                        "morphe_music_crossfade_on_auto_advance",
                        "true",
                        setSummary = true,
                    )
                    addCrossfadeSwitch(
                        "morphe_music_crossfade_session_control",
                        "true",
                        setSummary = true,
                    )
                    adoptChild(ResourceUtils.PREFERENCE_SCREEN_TAG_NAME) {
                        setAttribute("android:key", "morphe_music_crossfade_about")
                        setAttribute("android:title", "@string/morphe_music_crossfade_about_title")
                        setAttribute("android:summary", "@string/morphe_music_crossfade_about_summary")
                        addCrossfadeStaticPreference(
                            key = "morphe_music_crossfade_about_banner",
                            titleKey = "morphe_music_crossfade_about_banner_title",
                            summaryKey = null,
                            layout = "@layout/morphe_crossfade_about_banner",
                        )
                        addCrossfadeStaticPreference("morphe_music_crossfade_about_how")
                        addCrossfadeStaticPreference("morphe_music_crossfade_about_best")
                        addCrossfadeStaticPreference("morphe_music_crossfade_about_quirks")
                        addCrossfadeStaticPreference("morphe_music_crossfade_about_known")
                        addCrossfadeStaticPreference("morphe_music_crossfade_about_unsupported")
                        addCrossfadeStaticPreference("morphe_music_crossfade_about_credit")
                    }
                }
            }

            stopVideo.addInstructions(
                0,
                """
                    invoke-static { p0, p1 }, $EXTENSION_CLASS->onBeforeStopVideo(Ljava/lang/Object;I)Z
                    move-result v0
                    if-eqz v0, :allow_stop
                    return-void
                    :allow_stop
                    nop
                """
            )

            dismiss.addInstruction(0, "invoke-static {}, $EXTENSION_CLASS->onQueueDismissed()V")

            playNext.addInstructions(
                0,
                """
                    invoke-static { p0 }, $EXTENSION_CLASS->onBeforePlayNext(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :allow_next
                    return-void
                    :allow_next
                    nop
                """
            )

            modeSwitch.installModeSwitchHooks()

            pauseVideo.addInstruction(
                0,
                "invoke-static {}, $EXTENSION_CLASS->onPauseVideo()V"
            )

            playVideo.addInstructions(
                0,
                "invoke-static { p0 }, $EXTENSION_CLASS->onPlayVideo(Ljava/lang/Object;)V"
            )
            playNextInQueueMethod.addInstruction(0, "invoke-static {}, $EXTENSION_CLASS->onQueueCommand()V")

            // Range form because loadVideo has enough locals to push p0 past v15.
            // The descriptor is cached so repeat-one can reload the same track.
            loadVideoMethod.addInstruction(
                0,
                "invoke-static/range { p0 .. p1 }, $EXTENSION_CLASS->" +
                        "onBeforeLoadVideo(Ljava/lang/Object;Ljava/lang/Object;)V"
            )

            // Reuse the stock logger's already-built arguments; do not format or allocate them again.
            runCatching {
                val method = loadVideoMethod
                val logAnchor = method.instructions.indexOfFirst {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
                        ?.startsWith("MedialibPlayer.loadVideo(") == true
                }
                check(logAnchor >= 0) { "Native load log anchor missing" }
                val loggerCall = method.instructions.withIndex().first { (index, instruction) ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    index > logAnchor && reference?.returnType == "V" &&
                        reference.parameterTypes.takeLast(2) == listOf("Ljava/lang/String;", "[Ljava/lang/Object;")
                }
                val argumentsRegister = loggerCall.value.registersUsed.last()
                method.addInstruction(
                    loggerCall.index,
                    "invoke-static/range { v$argumentsRegister .. v$argumentsRegister }, " +
                        "$EXTENSION_CLASS->traceNativeLoad([Ljava/lang/Object;)V"
                )
            }.onFailure {
                printWarn("Track crossfade: native LOAD tracing unavailable; playback is unchanged: ${it.message}")
            }

            loopState.addInstruction(
                0,
                "invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->onLoopStateChanged(Ljava/lang/Object;)V"
            )
            sleepState.addInstruction(
                0,
                "invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->onSleepTimerStateChanged(Ljava/lang/Object;)V"
            )

            val closeIndex = broadcastIndex(closeSession)
            val (contextRegister, intentRegister) = closeSession.getInstruction(closeIndex).registersUsed
            closeSession.replaceInstruction(
                closeIndex,
                "invoke-static { v$contextRegister, v$intentRegister }, $EXTENSION_CLASS->" +
                    "closeAudioEffectSession(Landroid/content/Context;Landroid/content/Intent;)V"
            )

            // The OPEN sender already references the discovered effect-session manager.
            // Forward the exact Context/Intent; tracing does not retain or alter OPEN broadcasts.
            val openIndex = broadcastIndex(openSession)
            val (context, intent) = openSession.getInstruction(openIndex).registersUsed
            openSession.replaceInstruction(
                openIndex,
                "invoke-static { v$context, v$intent }, $EXTENSION_CLASS->" +
                    "traceSessionBroadcast(Landroid/content/Context;Landroid/content/Intent;)V"
            )

            getMainActivityMethod("onStop")
                .addInstruction(
                    0,
                    "invoke-static {}, $EXTENSION_CLASS->onActivityStop()V"
                )
            getMainActivityMethod("onStart")
                .addInstruction(
                    0,
                    "invoke-static {}, $EXTENSION_CLASS->onActivityStart()V"
                )
            // Hook onDestroy so we can release in-flight crossfade state when the
            // user swipe-clears from recents (process may survive via foreground
            // service; without cleanup our statics inherit orphaned player refs
            // into the next activity instance).
            getMainActivityMethod("onDestroy")
                .addInstruction(
                    0,
                    "invoke-static {}, $EXTENSION_CLASS->onActivityDestroy()V"
                )


            // These fields are accessed from other classes or through a subclass.
            listOfNotNull(
                guardField,
                sharedStateFieldRef,
                exoPlayerCwhField9x,
                cqbField,
                dltCallbackTypeOnShared,
            ).forEach(::makeFieldPublic)

            coordinatorClass.interfaces.add(COORDINATOR_INTERFACE)
            coordinatorClass.addFieldGetter("patch_getExoPlayer", exoPlayerField)
            coordinatorClass.addFieldGetter("patch_getSession", sessionFieldRef)
            coordinatorClass.addFieldGetter("patch_getLoadControl", loadControlField)
            coordinatorClass.addFieldGetter("patch_getSharedState", sharedStateFieldRef)
            coordinatorClass.addFieldGetter("patch_getSharedCallback", sharedCallbackFieldRef)
            coordinatorClass.addFieldGetter("patch_getVideoSurface", videoSurfaceField)
            coordinatorClass.addBridge(
                "patch_getVolume", emptyList(), "F", 2,
                "iget v0, p0, $playerVolumeField\nreturn v0"
            )

            // The owned graph resolves an interface on 9.15 and a concrete collector on 9.40.
            val collectorType = forwardingPlayerField9x.type
            val collectorInvoke = if (AccessFlags.INTERFACE.isSet(classDefBy(collectorType).accessFlags)) {
                "invoke-interface"
            } else "invoke-virtual"
            coordinatorClass.addBridge(
                "patch_setPlayerWithBindings", listOf("Ljava/lang/Object;"), "V", 4,
                """
                    check-cast p1, ${exoPlayerImplClass.type}
                    iget-object v0, p1, $exoPlayerCwhField9x
                    iget-object v1, p0, $coordinatorCwhListenerField9x
                    $collectorInvoke { v0, v1 }, $collectorType->${cwhAddListenerMethod.name}($cwhListenerType)V
                    iput-object p1, p0, $exoPlayerField
                    return-void
                """
            )

            exoPlayerImplClass.interfaces.add(EXO_PLAYER_INTERFACE)

            fun addExoBridge(bridgeName: String, targetName: String, returnType: String, paramType: String? = null) {
                val parameters = listOfNotNull(paramType)
                val target = exoImplMethods.firstOrNull { method ->
                    method.name == targetName && method.returnType == returnType
                            && method.parameterTypes.map { it.toString() } == parameters
                } ?: error(
                    "Bridge target $targetName($parameters)$returnType not found in " +
                        "${exoPlayerImplClass.type} hierarchy"
                )
                val invoke = if (paramType != null) {
                    "invoke-virtual { p0, p1 }, $target"
                } else {
                    "invoke-virtual { p0 }, $target"
                }
                val (registers, result) = when (returnType) {
                    "I", "Z" -> 2 to "move-result v0\nreturn v0"
                    "J" -> 3 to "move-result-wide v0\nreturn-wide v0"
                    else -> 2 to "return-void"
                }
                exoPlayerImplClass.addBridge(bridgeName, parameters, returnType, registers, "$invoke\n$result")
            }

            addExoBridge("patch_getPlaybackState", getPlaybackStateName, "I")
            addExoBridge("patch_getPlayWhenReady", getPlayWhenReadyName, "Z")
            addExoBridge("patch_getCurrentPosition", getCurrentPositionName, "J")
            addExoBridge("patch_getDuration", getDurationName, "J")
            // The native sink's structurally discovered AudioTrack is authoritative for session ownership.
            exoPlayerImplClass.addBridge(
                "patch_getAudioSessionId", emptyList(), "I", 2,
                "invoke-static { p0 }, " +
                    "Lapp/morphe/extension/music/patches/crossfade/PcmFadeBridge;" +
                    "->sessionId(Ljava/lang/Object;)I\nmove-result v0\nreturn v0"
            )

            makeFieldPublic(playbackInfoField)
            makeFieldPublic(errorField)
            exoPlayerImplClass.addBridge(
                "patch_hasPlaybackError", emptyList(), "Z", 2,
                """
                    iget-object v0, p0, $playbackInfoField
                    iget-object v0, v0, $errorField
                    if-eqz v0, :no_error
                    const/4 v0, 0x1
                    return v0
                    :no_error
                    const/4 v0, 0x0
                    return v0
                """
            )
            exoPlayerImplClass.addBridge(
                "patch_getRawVolume", emptyList(), "F", 2,
                "iget v0, p0, $rawVolumeField\nreturn v0"
            )

            // All of these are existing control-thread boundaries, not renderer/audio-thread hooks.
            fun traceVolumeMethod(
                method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod,
                name: String,
            ) {
                method.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
                    .map { it.index }.reversed().forEach { index ->
                        method.addInstruction(
                            index,
                            "invoke-static/range { p0 .. p1 }, " +
                                "$EXTENSION_CLASS->trace${name}After(Ljava/lang/Object;F)V"
                        )
                    }
                method.addInstruction(
                    0,
                    "invoke-static/range { p0 .. p1 }, $EXTENSION_CLASS->trace${name}Before(Ljava/lang/Object;F)V"
                )
            }

            traceVolumeMethod(playerVolumeMethod, "AppVolume")
            traceVolumeMethod(exoVolumeSetter, "RawVolume")

            exoPlayerImplClass.methods.first {
                it.name == setPlayWhenReadyName && it.parameterTypes.toList() == listOf("Z")
            }.addInstruction(
                0,
                "invoke-static/range { p0 .. p1 }, $EXTENSION_CLASS->tracePlayWhenReady(Ljava/lang/Object;Z)V"
            )
            // Keep native normalization writes separate from PCM fade gain. App setter interception
            // records each player's normalization without multiplying the sample-domain envelope.
            // Fade in/out may hook this native body before or after us.
            val volumeClass = mutableClassDefBy(exoVolumeSetter.definingClass)
            val rawVolumeSetter = exoVolumeSetter.cloneMutable(name = "patch_setVolume")
            val filteredVolumeSetter = exoVolumeSetter.cloneMutable(clearImplementation = true, registerCount = 2)
            filteredVolumeSetter.addInstructions(
                0,
                """
                    invoke-static/range { p0 .. p1 }, $EXTENSION_CLASS->filterVolume(Ljava/lang/Object;F)F
                    move-result p1
                    invoke-virtual/range { p0 .. p1 }, $rawVolumeSetter
                    return-void
                """
            )
            volumeClass.methods.remove(exoVolumeSetter)
            volumeClass.methods.add(rawVolumeSetter)
            volumeClass.methods.add(filteredVolumeSetter)
            addExoBridge("patch_setPlayWhenReady", setPlayWhenReadyName, "V", "Z")
            addExoBridge("patch_release", releaseName, "V")
            addExoBridge("patch_setVideoSurface", setVideoSurfaceName, "V", "Landroid/view/Surface;")

            // The audio offload listener set. The coordinator's listener lives here and
            // has to move to the new player on a swap.

            exoPlayerImplClass.addFieldSetter("patch_setDltCallback", dltFieldOnExo)

            coordinatorClass.addFieldGetter("patch_getCoordinatorListener", coordinatorListenerField)

            val listenerBridges = listOf("patch_addDirectListener" to "add", "patch_removeDirectListener" to "remove")
            for ((bridgeName, setMethod) in listenerBridges) {
                exoPlayerImplClass.addBridge(
                    bridgeName, listOf("Ljava/lang/Object;"), "V", 3,
                    """
                        iget-object v0, p0, $directListenerSetField
                        invoke-virtual { v0, p1 }, $copyOnWriteSetType->$setMethod(Ljava/lang/Object;)Z
                        return-void
                    """
                )
            }

            check(cauAddMethod.parameterTypes == cauRemoveMethod.parameterTypes) {
                "Event dispatcher add/remove listener types differ"
            }
            exoPlayerImplClass.addBridge(
                "patch_attachCwhToEventDispatch", emptyList(), "V", 3,
                """
                    iget-object v0, p0, $eventDispatchField9x
                    iget-object v1, p0, $exoPlayerCwhField9x
                    invoke-virtual { v0, v1 }, $cauAddMethod
                    return-void
                """
            )
            exoPlayerImplClass.addBridge(
                "patch_detachCwhFromEventDispatch", emptyList(), "V", 3,
                """
                    iget-object v0, p0, $eventDispatchField9x
                    iget-object v1, p0, $exoPlayerCwhField9x
                    invoke-virtual { v0, v1 }, $cauRemoveMethod
                    return-void
                """
            )
            log.fine {
                "Detach $exoPlayerCwhField9x from $eventDispatchField9x via $cauRemoveMethod"
            }

            // The graph preflights both ABIs: direct collector cleanup (9.15) and inlined post (9.40).
            if (collectorRelease != null) {
                collectorRelease.addInstructions(
                    0,
                    """
                        sget-boolean v0, $EXTENSION_CLASS->suppressCwhU:Z
                        if-eqz v0, :no_suppress
                        return-void
                        :no_suppress
                        nop
                    """
                )
            } else {
                val runnable = requireNotNull(releaseRunnableRegister)
                val releaseFilter = "$EXTENSION_CLASS->" +
                    "filterAnalyticsRelease(Ljava/lang/Runnable;)Ljava/lang/Runnable;"
                releaseMethod.addInstructions(
                    requireNotNull(releasePostIndex),
                    """
                        invoke-static/range { v$runnable .. v$runnable }, $releaseFilter
                        move-result-object v$runnable
                    """
                )
            }

            sessionClass.interfaces.add(SESSION_INTERFACE)
            sessionClass.addFieldGetter("patch_getFactory", factoryFieldRef)

            factoryClass.interfaces.add(FACTORY_INTERFACE)
            val guardClearSmali = """
                iget-object v0, p1, $sharedStateFieldRef
                check-cast v0, $guardAbstractType
                const/4 v1, 0x0
                iput-object v1, v0, $guardField
            """
            factoryClass.addBridge(
                "patch_createPlayer", listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "I"), "Ljava/lang/Object;",
                // Clearing the guard needs locals that do not overlap the 4 parameter registers.
                7,
                """
                    check-cast p1, $coordinatorType
                    check-cast p2, $loadControlType
                    $guardClearSmali
                    invoke-virtual { p0, p1, p2, p3 }, $factoryMethod
                    move-result-object v0
                    return-object v0
                """
            )

            sharedStateClass.interfaces.add(SHARED_STATE_INTERFACE)
            sharedStateClass.addFieldGetter("patch_getTimeline", timelineField)
            sharedStateClass.addFieldSetter("patch_setTimeline", timelineField)

            sharedCallbackClass.interfaces.add(SHARED_CALLBACK_INTERFACE)
            sharedCallbackClass.addFieldGetter("patch_getCqb", cqbField)
            sharedCallbackClass.addFieldSetter("patch_setCqb", cqbField)
            sharedCallbackClass.addFieldGetter("patch_getDlt", dltCallbackTypeOnShared)
            sharedCallbackClass.addFieldSetter("patch_setDlt", dltCallbackTypeOnShared)

            videoSurfaceClass.interfaces.add(VIDEO_SURFACE_INTERFACE)
            videoSurfaceClass.addFieldSetter("patch_setPlayerReference", videoSurfaceExoField)

            medialibPlayerClass.interfaces.add(MEDIALIB_PLAYER_INTERFACE)
            medialibPlayerClass.addFieldGetter("patch_getPlayerChain", playerChainField)
            medialibPlayerClass.addBridge(
                "patch_playNextInQueue", emptyList(), "V", 1,
                """
                    invoke-virtual { p0 }, $playNextInQueueMethod
                    return-void
                """
            )
            // Repeat-one reloads the cached descriptor instead of advancing the queue.
            medialibPlayerClass.addBridge(
                "patch_getDescriptorVideoId", listOf("Ljava/lang/Object;"), "Ljava/lang/String;", 3,
                """
                    check-cast p1, ${descriptorClass.type}
                    $getterOpcode {p1}, $mediaGetter
                    move-result-object v0
                    iget-object v0, v0, $descriptorId
                    return-object v0
                """,
            )
            medialibPlayerClass.addBridge(
                "patch_loadVideoWith", listOf("Ljava/lang/Object;"), "V", 2,
                """
                    check-cast p1, ${loadVideoMethod.parameterTypes.first()}
                    invoke-virtual { p0, p1 }, $loadVideoMethod
                    return-void
                """
            )


            for ((delegateClass, delegateField) in delegateClasses) {
                delegateClass.apply {
                    interfaces.add(DELEGATE_INTERFACE)
                    addFieldGetter("patch_getDelegate", delegateField)
                }
            }
        }
    }
}
