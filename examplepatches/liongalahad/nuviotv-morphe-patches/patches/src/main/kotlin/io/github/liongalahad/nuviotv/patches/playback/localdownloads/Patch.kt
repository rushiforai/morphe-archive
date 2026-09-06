package io.github.liongalahad.nuviotv.patches.playback.localdownloads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import io.github.liongalahad.nuviotv.patches.settings.hub.settingsUiPatch
import io.github.liongalahad.nuviotv.patches.shared.Constants.NUVIO_COMPATIBILITY
import io.github.liongalahad.nuviotv.patches.shared.updates.patchedAppUpdatesPatch
import io.github.liongalahad.nuviotv.patches.shared.playback.uriDataSourcePatch
import io.github.liongalahad.nuviotv.patches.shared.registerSegmentedMediaProvider
import io.github.liongalahad.nuviotv.patches.shared.registerSharedStorageSettings
import org.w3c.dom.Element

private const val RUNTIME =
    "Lio/github/liongalahad/nuviotv/extension/playback/localdownloads/LocalDownloadsRuntime;"
private const val SETTINGS_METADATA = "io.github.liongalahad.nuviotv.settings.provider.local_downloads"
private const val SETTINGS_CATEGORY =
    "io.github.liongalahad.nuviotv.extension.playback.localdownloads.LocalDownloadsSettingsCategory"
private const val DEFAULT_ACCESS =
    "io.github.liongalahad.nuviotv.extension.playback.localdownloads.LocalDownloadsDefaultFolderAccessActivity"
private const val PROGRESS =
    "io.github.liongalahad.nuviotv.extension.playback.localdownloads.LocalDownloadsProgressActivity"
private const val DELETE =
    "io.github.liongalahad.nuviotv.extension.playback.localdownloads.LocalDownloadsDeleteActivity"
private const val DOWNLOADS_MANAGER =
    "io.github.liongalahad.nuviotv.extension.playback.localdownloads.LocalDownloadsManagerActivity"
private const val DOWNLOAD_ACTION =
    "io.github.liongalahad.nuviotv.extension.playback.localdownloads.LocalDownloadsEntryActionActivity"
private const val SOURCE_ACTION =
    "io.github.liongalahad.nuviotv.extension.playback.localdownloads.LocalDownloadsSourceActionActivity"
private const val PLAYBACK_DIAGNOSTIC =
    "io.github.liongalahad.nuviotv.extension.playback.localdownloads.LocalDownloadsPlaybackDiagnosticActivity"
private const val MOVIE_ACTION =
    "io.github.liongalahad.nuviotv.extension.playback.localdownloads.LocalDownloadsMovieActionActivity"
private const val DELETE_ALL =
    "io.github.liongalahad.nuviotv.extension.playback.localdownloads.LocalDownloadsDeleteAllActivity"
private const val SERVICE =
    "io.github.liongalahad.nuviotv.extension.playback.localdownloads.LocalDownloadsService"
private const val FUNCTION3 = "Lkotlin/jvm/functions/Function3;"
private const val KOTLIN_FUNCTION = "Lkotlin/Function;"

private val localDownloadsResources = resourcePatch {
    compatibleWith(NUVIO_COMPATIBILITY)
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val application = document.getElementsByTagName("application").item(0) as Element
            registerSharedStorageSettings(document, application)
            registerSegmentedMediaProvider(document, application)
            listOf(
                "android.permission.MANAGE_EXTERNAL_STORAGE" to null,
                "android.permission.READ_EXTERNAL_STORAGE" to "32",
                "android.permission.WRITE_EXTERNAL_STORAGE" to "28",
                "android.permission.FOREGROUND_SERVICE" to null,
                "android.permission.FOREGROUND_SERVICE_DATA_SYNC" to null
            ).forEach { (name, maxSdk) ->
                val present = (0 until document.getElementsByTagName("uses-permission").length).any { index ->
                    (document.getElementsByTagName("uses-permission").item(index) as Element)
                        .getAttribute("android:name") == name
                }
                if (!present) manifest.insertBefore(document.createElement("uses-permission").apply {
                    setAttribute("android:name", name)
                    maxSdk?.let { setAttribute("android:maxSdkVersion", it) }
                }, application)
            }

            val queries = (0 until document.getElementsByTagName("queries").length)
                .map { document.getElementsByTagName("queries").item(it) as Element }.firstOrNull()
                ?: document.createElement("queries").also { manifest.insertBefore(it, application) }
            val hasPickerQuery = (0 until queries.getElementsByTagName("action").length)
                .map { queries.getElementsByTagName("action").item(it) as Element }
                .any { it.getAttribute("android:name") == "android.intent.action.OPEN_DOCUMENT_TREE" }
            if (!hasPickerQuery) queries.appendChild(document.createElement("intent").apply {
                appendChild(document.createElement("action").apply {
                    setAttribute("android:name", "android.intent.action.OPEN_DOCUMENT_TREE")
                })
            })

            listOf(DEFAULT_ACCESS, PROGRESS, DELETE, DOWNLOAD_ACTION, SOURCE_ACTION, MOVIE_ACTION, DELETE_ALL)
                .forEach { name ->
                application.appendChild(document.createElement("activity").apply {
                    setAttribute("android:name", name)
                    setAttribute("android:exported", "false")
                    setAttribute("android:excludeFromRecents", "true")
                    setAttribute("android:theme", "@android:style/Theme.Translucent.NoTitleBar")
                })
            }
            application.appendChild(document.createElement("activity").apply {
                setAttribute("android:name", PLAYBACK_DIAGNOSTIC)
                setAttribute("android:exported", "false")
                setAttribute("android:excludeFromRecents", "true")
                setAttribute("android:theme", "@android:style/Theme.Translucent.NoTitleBar")
            })
            application.appendChild(document.createElement("activity").apply {
                setAttribute("android:name", DOWNLOADS_MANAGER)
                setAttribute("android:exported", "false")
                setAttribute("android:excludeFromRecents", "true")
                setAttribute("android:theme", "@android:style/Theme.Material.NoActionBar")
            })
            application.appendChild(document.createElement("service").apply {
                setAttribute("android:name", SERVICE)
                setAttribute("android:exported", "false")
                setAttribute("android:foregroundServiceType", "dataSync")
            })
            application.appendChild(document.createElement("meta-data").apply {
                setAttribute("android:name", SETTINGS_METADATA)
                setAttribute("android:value", SETTINGS_CATEGORY)
            })
        }
    }
}

private fun wrapDialogContent(
    method: MutableMethod,
    targetParameter: Int?,
    manualParameter: Int,
    showParameter: Int
) {
    val targetMove = targetParameter?.let { "move-object/from16 v0, p$it" } ?: "const/4 v0, 0x0"
    method.addInstructions(
        0,
        """
            $targetMove
            move-object/from16 v1, p$manualParameter
            move/from16 v2, p$showParameter
            invoke-static { v0, v1, v2 }, $RUNTIME->prepareOptions(Ljava/lang/Object;Lkotlin/jvm/functions/Function0;Z)V
        """
    )

    val lambdaCallIndex = method.implementation!!.instructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@indexOfFirst false
        reference.definingClass == "Lp1/x;" && reference.name == "d" &&
            reference.parameterTypes.map(CharSequence::toString).let { parameters ->
                parameters.size == 3 && parameters[0] == "I" && parameters[1] == KOTLIN_FUNCTION
            }
    }
    check(lambdaCallIndex >= 0) { "Options dialog composable-lambda builder was not found" }
    val contentRegister = when (val call = method.implementation!!.instructions[lambdaCallIndex]) {
        is FiveRegisterInstruction -> call.registerD
        is RegisterRangeInstruction -> call.startRegister + 1
        else -> error("Options dialog composable-lambda builder uses an unsupported invoke format")
    }
    method.addInstructions(
        lambdaCallIndex,
        """
            invoke-static/range { v$contentRegister .. v$contentRegister }, $RUNTIME->wrapOptionsContent(Lkotlin/jvm/functions/Function3;)Lkotlin/jvm/functions/Function3;
            move-result-object v$contentRegister
        """
    )
}

/** Adds the patch-owned episode actions to Nuvio 0.8.11's native action-list overlay. */
private fun augmentEpisodeOptions(method: MutableMethod) {
    method.addInstructions(
        0,
        """
            move-object/from16 v0, p0
            move-object/from16 v1, p14
            move/from16 v2, p15
            invoke-static { v0, v1, v2 }, $RUNTIME->prepareOptions(Ljava/lang/Object;Lkotlin/jvm/functions/Function0;Z)V
        """
    )

    val listBuildIndex = method.implementation!!.instructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@indexOfFirst false
        reference.definingClass == "Lkotlin/collections/CollectionsKt;" &&
            reference.name == "build" &&
            reference.parameterTypes.map(CharSequence::toString) == listOf("Ljava/util/List;") &&
            reference.returnType == "Ljava/util/List;"
    }
    check(listBuildIndex >= 0) { "Episode options action-list builder was not found" }
    val resultInstruction = method.implementation!!.instructions.getOrNull(listBuildIndex + 1)
        ?: error("Episode options action-list builder has no result instruction")
    check(resultInstruction.opcode == Opcode.MOVE_RESULT_OBJECT) {
        "Episode options action-list builder does not return into an object register"
    }
    val listRegister = (resultInstruction as? OneRegisterInstruction)?.registerA
        ?: error("Episode options action-list result uses an unsupported instruction format")
    method.addInstructions(
        listBuildIndex + 2,
        """
            invoke-static/range { v$listRegister .. v$listRegister }, $RUNTIME->extendEpisodeOptions(Ljava/util/List;)Ljava/util/List;
            move-result-object v$listRegister
        """
    )
}

@Suppress("unused")
val localdownloadsPatch = bytecodePatch(
    name = "Local Downloads",
    description = "Downloads selected direct movie and episode sources to local storage for exact local playback.",
    default = false
) {
    compatibleWith(NUVIO_COMPATIBILITY)
    dependsOn(patchedAppUpdatesPatch, settingsUiPatch, localDownloadsResources, uriDataSourcePatch)
    extendWith("extensions/nuviotv.mpe")

    execute {
        listOf(
            HeroContentFingerprint,
            HeroActionRowFingerprint,
            HeroOptionsDialogFingerprint,
            EpisodeOptionsDialogFingerprint,
            EpisodeCardContentFingerprint,
            ContinueOptionsDialogFingerprint,
            StreamRouteFingerprint,
            StreamScreenFingerprint,
            SourceCardFingerprint,
            NativeSourceTvButtonFingerprint,
            NativeDefaultableTvButtonFingerprint,
            NativeTextFingerprint,
            SubtitleWorkerFingerprint,
            NuvioNavHostFingerprint,
            PlayerMediaSourceFactoryFingerprint,
            FullscreenPlaybackStateListenerFingerprint
        ).forEach { it.matchAll(1..1) }
        HeroContentFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                move-object/from16 v1, p1
                move-object/from16 v2, p4
                move-object/from16 v3, p24
                invoke-static { v0, v1, v2, v3 }, $RUNTIME->enterHero(Ljava/lang/Object;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;Ljava/lang/Object;)V
                const-class v0, ${NativeDefaultableTvButtonFingerprint.classDef.type}
                invoke-static/range { v0 .. v0 }, $RUNTIME->observeNativeTvButtonClass(Ljava/lang/Class;)V
                const-class v0, ${NativeTextFingerprint.classDef.type}
                invoke-static/range { v0 .. v0 }, $RUNTIME->observeNativeTextClass(Ljava/lang/Class;)V
            """
        )

        HeroActionRowFingerprint.method.apply {
            val actionCalls = implementation!!.instructions.withIndex().filter { (_, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@filter false
                val p = reference.parameterTypes.map(CharSequence::toString)
                reference.returnType == "V" && p.size == 13 &&
                    p[2] == "Ljava/lang/String;" && p[3] == "Lkotlin/jvm/functions/Function0;" &&
                    p[4] == "Lkotlin/jvm/functions/Function0;" && p[5] == "Z" && p[6] == "Z" &&
                    p[7] == "J" && p[8] == "J" &&
                    p[9] == "Lkotlin/jvm/functions/Function0;" && p[11] == "I" && p[12] == "I"
            }
            check(actionCalls.size == 2) { "Native hero Library/Watched action calls were not found" }
            val watchedCall = actionCalls.last().value as? RegisterRangeInstruction
                ?: error("Native Watched action call does not use the expected range format")
            check(watchedCall.registerCount == 15) {
                "Native Watched action call uses an unexpected register count"
            }
            val composerRegister = watchedCall.startRegister + 12
            addInstructions(
                actionCalls.last().index + 1,
                "invoke-static/range { v$composerRegister .. v$composerRegister }, $RUNTIME->renderMovieDownloadAction(Ljava/lang/Object;)V"
            )
        }

        wrapDialogContent(HeroOptionsDialogFingerprint.method, null, 4, 3)
        augmentEpisodeOptions(EpisodeOptionsDialogFingerprint.method)
        wrapDialogContent(ContinueOptionsDialogFingerprint.method, 0, 6, 5)
        ContinueOptionsDialogFingerprint.method.addInstructions(
            0,
            """
                const-class v0, ${NativeDefaultableTvButtonFingerprint.classDef.type}
                invoke-static/range { v0 .. v0 }, $RUNTIME->observeNativeTvButtonClass(Ljava/lang/Class;)V
                const-class v0, ${NativeTextFingerprint.classDef.type}
                invoke-static/range { v0 .. v0 }, $RUNTIME->observeNativeTextClass(Ljava/lang/Class;)V
            """
        )

        EpisodeCardContentFingerprint.method.apply {
            val instructions = implementation!!.instructions
            val cardOwner = instructions.mapNotNull { instruction ->
                (instruction as? ReferenceInstruction)?.reference as? FieldReference
            }.filter { field -> field.type == VIDEO }
                .map(FieldReference::getDefiningClass).distinct().single()
            val watchedIconIndex = instructions.indexOfFirst { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@indexOfFirst false
                reference.returnType == "Li2/f;" && reference.parameterTypes.isEmpty()
            }
            check(watchedIconIndex >= 0) { "Episode watched icon call was not found" }
            val watchedRead = instructions.withIndex().firstOrNull {
                    (index, instruction) ->
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                instruction.opcode == Opcode.IGET_BOOLEAN && field?.definingClass == cardOwner &&
                    instructions.getOrNull(index + 1)?.opcode == Opcode.IF_EQZ
            } ?: error("Episode watched-state field read was not found")
            val expectedComposerParameter = implementation!!.registerCount - 2
            val composerParameterMove = instructions.withIndex().take(watchedRead.index).firstOrNull {
                    (index, instruction) ->
                instruction.opcode in setOf(
                    Opcode.MOVE_OBJECT,
                    Opcode.MOVE_OBJECT_FROM16,
                    Opcode.MOVE_OBJECT_16
                ) && (instruction as? TwoRegisterInstruction)?.registerB == expectedComposerParameter &&
                    instructions.getOrNull(index + 1).let { next ->
                        next?.opcode == Opcode.CHECK_CAST &&
                            (next as? OneRegisterInstruction)?.registerA ==
                            (instruction as TwoRegisterInstruction).registerA &&
                            ((next as? ReferenceInstruction)?.reference as? TypeReference)?.type ==
                            "Lf1/p;"
                    }
            }
            check(composerParameterMove != null) {
                "Episode-card p2 parameter is not cast to the expected Compose interface"
            }
            val composerRegister =
                (composerParameterMove.value as TwoRegisterInstruction).registerA
            val cardContentRegister =
                (watchedRead.value as? TwoRegisterInstruction)?.registerB
                    ?: error("Episode watched-state read has no card-content register")
            check(cardContentRegister < 16 && composerRegister < 16) {
                "Episode badge arguments are not available to a verifier-safe invoke"
            }
            addInstructions(
                watchedRead.index + 1,
                "invoke-static { v$cardContentRegister, v$composerRegister }, " +
                    "$RUNTIME->renderDownloadedEpisodeBadge" +
                    "(Ljava/lang/Object;Ljava/lang/Object;)V"
            )
        }

        StreamRouteFingerprint.method.apply {
            implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index to (it.value as OneRegisterInstruction).registerA }
                .asReversed()
                .forEach { (index, register) ->
                    addInstructions(
                        index,
                        """
                            invoke-static/range { v$register .. v$register }, $RUNTIME->rewriteStreamRoute(Ljava/lang/String;)Ljava/lang/String;
                            move-result-object v$register
                        """
                    )
                }
        }

        val subtitleWorkerType = SubtitleWorkerFingerprint.classDef.type
        StreamScreenFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                const-class v1, $subtitleWorkerType
                invoke-static/range { v1 .. v1 }, $RUNTIME->observeSubtitleWorkerClass(Ljava/lang/Class;)V
                invoke-static/range { v0 .. v0 }, $RUNTIME->observeStreamViewModel(Ljava/lang/Object;)V
                move-object/from16 v0, p5
                invoke-static/range { v0 .. v0 }, $RUNTIME->wrapResolvedCallback(Lkotlin/jvm/functions/Function1;)Lkotlin/jvm/functions/Function1;
                move-result-object p5
                move-object/from16 v0, p6
                invoke-static/range { v0 .. v0 }, $RUNTIME->wrapResolvedCallback(Lkotlin/jvm/functions/Function1;)Lkotlin/jvm/functions/Function1;
                move-result-object p6
            """
        )

        SourceCardFingerprint.method.apply {
            addInstructions(
                0,
                """
                    move-object/from16 v0, p0
                    move-object/from16 v1, p5
                    invoke-static { v0, v1 }, $RUNTIME->wrapSourceClick(Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)Lkotlin/jvm/functions/Function0;
                    move-result-object p5
                """
            )
            val sourceButtonCalls = implementation!!.instructions.withIndex().filter { (_, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@filter false
                reference.definingClass == NativeSourceTvButtonFingerprint.classDef.type &&
                    reference.name == NativeSourceTvButtonFingerprint.method.name &&
                    reference.parameterTypes.map(CharSequence::toString).size == 11
            }
            check(sourceButtonCalls.size == 1) { "Native source-row TV Button call was not found exactly once" }
            addInstructions(
                sourceButtonCalls.single().index,
                "invoke-static/range { p5 .. p5 }, $RUNTIME->prepareSourceKeyTarget(Lkotlin/jvm/functions/Function0;)V"
            )
        }

        NativeSourceTvButtonFingerprint.method.apply {
            val modifierType = parameterTypes[1].toString()
            addInstructions(
                0,
                """
                    invoke-static/range { p1 .. p1 }, $RUNTIME->attachPreparedSourceKeyHandler(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object p1
                    check-cast p1, $modifierType
                """
            )
        }

        NuvioNavHostFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p0 .. p0 }, $RUNTIME->observeNavController(Ljava/lang/Object;)V"
        )

        PlayerMediaSourceFactoryFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p1
                move-object/from16 v1, p2
                move-object/from16 v2, p4
                invoke-static { v0, v1, v2 }, $RUNTIME->attachDownloadedSubtitles(Landroid/content/Context;Ljava/lang/String;Ljava/util/List;)Ljava/util/List;
                move-result-object p4
            """
        )

        FullscreenPlaybackStateListenerFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p0 .. p1 }, $RUNTIME->onPlaybackStateChanged(Ljava/lang/Object;I)V"
        )
    }
}
