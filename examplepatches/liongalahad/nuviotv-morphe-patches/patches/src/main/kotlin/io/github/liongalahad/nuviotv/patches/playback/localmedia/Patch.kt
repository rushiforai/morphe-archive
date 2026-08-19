package io.github.liongalahad.nuviotv.patches.playback.localmedia

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import io.github.liongalahad.nuviotv.patches.settings.hub.settingsUiPatch
import io.github.liongalahad.nuviotv.patches.shared.Constants.NUVIO_COMPATIBILITY
import io.github.liongalahad.nuviotv.patches.shared.registerSharedStorageSettings
import org.w3c.dom.Element

private const val RUNTIME =
    "Lio/github/liongalahad/nuviotv/extension/playback/localmedia/LocalMediaRuntime;"
private const val LIBRARY_UI =
    "Lio/github/liongalahad/nuviotv/extension/playback/localmedia/LocalMediaLibraryUi;"
private const val PICKER_ACTIVITY =
    "io.github.liongalahad.nuviotv.extension.playback.localmedia.LocalMediaFolderPickerActivity"
private const val DEFAULT_FOLDER_ACCESS_ACTIVITY =
    "io.github.liongalahad.nuviotv.extension.playback.localmedia.LocalMediaDefaultFolderAccessActivity"
private const val INTERNAL_FOLDER_PICKER_ACTIVITY =
    "io.github.liongalahad.nuviotv.extension.playback.localmedia.LocalMediaInternalFolderPickerActivity"
private const val DELETE_ACTIVITY =
    "io.github.liongalahad.nuviotv.extension.playback.localmedia.LocalMediaDeleteActivity"
private const val ACTION_ACTIVITY =
    "io.github.liongalahad.nuviotv.extension.playback.localmedia.LocalMediaActionActivity"
private const val PLAYBACK_DIAGNOSTIC_ACTIVITY =
    "io.github.liongalahad.nuviotv.extension.playback.localmedia.LocalMediaPlaybackDiagnosticActivity"
private const val SETTINGS_METADATA =
    "io.github.liongalahad.nuviotv.settings.provider.local_media"
private const val SETTINGS_CATEGORY =
    "io.github.liongalahad.nuviotv.extension.playback.localmedia.LocalMediaSettingsCategory"

private val localMediaResources = resourcePatch {
    compatibleWith(NUVIO_COMPATIBILITY)
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            registerSharedStorageSettings(document, application)
            val manifest = document.documentElement

            listOf(
                "android.permission.MANAGE_EXTERNAL_STORAGE" to null,
                "android.permission.READ_EXTERNAL_STORAGE" to "32",
                "android.permission.WRITE_EXTERNAL_STORAGE" to "28"
            ).forEach { (permissionName, maxSdkVersion) ->
                if ((0 until document.getElementsByTagName("uses-permission").length).none { index ->
                        (document.getElementsByTagName("uses-permission").item(index) as Element)
                            .getAttribute("android:name") == permissionName
                    }
                ) {
                    manifest.insertBefore(document.createElement("uses-permission").apply {
                        setAttribute("android:name", permissionName)
                        maxSdkVersion?.let { setAttribute("android:maxSdkVersion", it) }
                    }, application)
                }
            }

            val queries = (0 until document.getElementsByTagName("queries").length)
                .map { document.getElementsByTagName("queries").item(it) as Element }
                .firstOrNull()
                ?: document.createElement("queries").also {
                    manifest.insertBefore(it, application)
                }
            val hasTreePickerQuery = (0 until queries.getElementsByTagName("action").length)
                .map { queries.getElementsByTagName("action").item(it) as Element }
                .any { it.getAttribute("android:name") == "android.intent.action.OPEN_DOCUMENT_TREE" }
            if (!hasTreePickerQuery) {
                queries.appendChild(document.createElement("intent").apply {
                    appendChild(document.createElement("action").apply {
                        setAttribute("android:name", "android.intent.action.OPEN_DOCUMENT_TREE")
                    })
                })
            }

            listOf(
                PICKER_ACTIVITY,
                DEFAULT_FOLDER_ACCESS_ACTIVITY,
                DELETE_ACTIVITY,
                ACTION_ACTIVITY
            ).forEach { activityName ->
                application.appendChild(document.createElement("activity").apply {
                    setAttribute("android:name", activityName)
                    setAttribute("android:exported", "false")
                    setAttribute("android:excludeFromRecents", "true")
                    setAttribute("android:theme", "@android:style/Theme.Translucent.NoTitleBar")
                })
            }
            application.appendChild(document.createElement("activity").apply {
                setAttribute("android:name", PLAYBACK_DIAGNOSTIC_ACTIVITY)
                setAttribute("android:exported", "false")
                setAttribute("android:excludeFromRecents", "true")
                setAttribute("android:theme", "@android:style/Theme.Translucent.NoTitleBar")
            })
            application.appendChild(document.createElement("activity").apply {
                setAttribute("android:name", INTERNAL_FOLDER_PICKER_ACTIVITY)
                setAttribute("android:exported", "false")
                setAttribute("android:excludeFromRecents", "true")
                setAttribute("android:theme", "@android:style/Theme.Material.NoActionBar")
            })
            application.appendChild(document.createElement("meta-data").apply {
                setAttribute("android:name", SETTINGS_METADATA)
                setAttribute("android:value", SETTINGS_CATEGORY)
            })
        }
    }
}

@Suppress("unused")
val localmediaPatch = bytecodePatch(
    name = "Local Media",
    description = "Adds Library > Storage playback, folder selection, and same-basename sidecar subtitles for local video files.",
    default = false
) {
    compatibleWith(NUVIO_COMPATIBILITY)
    dependsOn(settingsUiPatch, localMediaResources)
    extendWith("extensions/nuviotv.mpe")

    execute {
        LibraryViewModeRowFingerprint.matchAll(1..1)
        listOf(
            NuvioNavHostFingerprint,
            PlayerMediaSourceFactoryFingerprint,
            FullscreenPlaybackStateListenerFingerprint,
            MainActivityKeyEventFingerprint,
            ComposeDialogTouchEventFingerprint,
            CloudStorageCardFingerprint,
            CloudStorageFileRowsFingerprint,
            NativeStorageTvButtonFingerprint
        ).forEach { it.matchAll(1..1) }

        CloudStorageCardFingerprint.method.apply {
            val buttonCallIndex = implementation!!.instructions.indexOfFirst { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                reference?.isNativeStorageTvButtonReference() == true
            }
            check(buttonCallIndex >= 0) { "Native Storage card Button call was not found" }
            addInstructions(
                buttonCallIndex,
                "invoke-static/range { p0 .. p0 }, $LIBRARY_UI->prepareStorageKeyTarget(Ljava/lang/Object;)V"
            )
        }

        CloudStorageFileRowsFingerprint.method.apply {
            val instructions = implementation!!.instructions
            val listGetIndex = instructions.indexOfFirst { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == "Ljava/util/ArrayList;" &&
                    reference.name == "get" && reference.returnType == "Ljava/lang/Object;"
            }
            check(listGetIndex >= 0) { "Native Storage file-list lookup was not found" }
            val fileCastIndex = instructions.withIndex().drop(listGetIndex + 1).firstOrNull {
                it.value.opcode == Opcode.CHECK_CAST &&
                    (it.value as? ReferenceInstruction)?.reference is TypeReference
            }?.index ?: -1
            check(fileCastIndex >= 0) { "Native Storage file model cast was not found" }
            val fileRegister = (instructions[fileCastIndex] as? OneRegisterInstruction)?.registerA
                ?: error("Native Storage file model cast has no register")
            check(instructions.withIndex().drop(fileCastIndex + 1).any {
                val reference = (it.value as? ReferenceInstruction)?.reference as? MethodReference
                reference?.isNativeStorageTvButtonReference() == true
            }) { "Native Storage file-row Button call was not found" }
            // Capture the model while the cast register is still a y8.a. The composable reuses
            // that register for an integer key before calling the native Button, so injecting at
            // the Button call produces invalid bytecode and crashes when a folder is opened.
            addInstructions(
                fileCastIndex + 1,
                "invoke-static/range { v$fileRegister .. v$fileRegister }, $LIBRARY_UI->prepareStorageKeyTarget(Ljava/lang/Object;)V"
            )
        }

        NativeStorageTvButtonFingerprint.method.apply {
            val modifierType = parameterTypes[1].toString()
            addInstructions(
                0,
                """
                    invoke-static/range { p1 .. p1 }, $LIBRARY_UI->attachPreparedStorageKeyHandler(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object p1
                    check-cast p1, $modifierType
                """
            )
        }

        val rowMethod = LibraryViewModeRowFingerprint.method
        val libraryModeButtonOwner = rowMethod.implementation!!.instructions
            .mapNotNull { instruction ->
                (instruction as? ReferenceInstruction)?.reference as? MethodReference
            }.filter { reference ->
                reference.returnType == "V" &&
                    reference.parameterTypes.map(CharSequence::toString).let { parameters ->
                        parameters.size == 13 && parameters[0] == "Lkotlin/jvm/functions/Function0;" &&
                            parameters[8] == "Lkotlin/jvm/functions/Function3;" &&
                            parameters.takeLast(3) == listOf("I", "I", "I")
                    }
            }.map { it.definingClass }.distinct().single()
            .removePrefix("L").removeSuffix(";").replace('/', '.')
        val enumEntriesField = rowMethod.implementation!!.instructions.mapNotNull { instruction ->
            (instruction as? ReferenceInstruction)?.reference as? FieldReference
        }.single { it.type == "Lkotlin/enums/EnumEntries;" }
        val enumType = enumEntriesField.definingClass
        libraryModeEnumType = enumType
        libraryModeLabelOwner = rowMethod.implementation!!.instructions.mapNotNull { instruction ->
            (instruction as? ReferenceInstruction)?.reference as? MethodReference
        }.filter { reference ->
            reference.name == "<init>" &&
                reference.parameterTypes.map(CharSequence::toString) ==
                listOf("Ljava/lang/Object;", "I")
        }.map { it.definingClass }.distinct().single { owner ->
            "Lkotlin/jvm/functions/Function3;" in mutableClassDefBy(owner).interfaces
        }
        LibraryViewModeLabelFingerprint.matchAll(1..1)
        val libraryModeTextOwner = LibraryViewModeLabelFingerprint.method.implementation!!
            .instructions.mapNotNull { instruction ->
                (instruction as? ReferenceInstruction)?.reference as? MethodReference
            }.filter { reference ->
                reference.returnType == "V" &&
                    reference.parameterTypes.map(CharSequence::toString).let { parameters ->
                        parameters.size == 19 &&
                            parameters.firstOrNull() == "Ljava/lang/String;" &&
                            parameters.takeLast(3) == listOf("I", "I", "I")
                    }
            }.map(MethodReference::getDefiningClass).distinct().single()
            .removePrefix("L").removeSuffix(";").replace('/', '.')
        LibraryGridContentFingerprint.matchAll(1..1)
        LibrarySourceLabelFingerprint.matchAll(1..1)
        CloudSearchLabelFingerprint.matchAll(1..1)
        NativeLibraryEmptyStateFingerprint.matchAll(1..1)
        NativeLibraryEmptyContentFingerprint.matchAll(1..1)
        val cloudCardOwner = CloudStorageCardFingerprint.classDef.type
        val cloudCardMethodName = CloudStorageCardFingerprint.method.name
        val cloudItemType = CloudStorageCardFingerprint.method.parameterTypes[0].toString()
        val cloudFileRowsInstructions = CloudStorageFileRowsFingerprint.method.implementation!!.instructions
        val cloudFileListGetIndex = cloudFileRowsInstructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == "Ljava/util/ArrayList;" &&
                reference.name == "get" && reference.returnType == "Ljava/lang/Object;"
        }
        check(cloudFileListGetIndex >= 0) { "Native Cloud file-list lookup was not found" }
        val cloudFileType = cloudFileRowsInstructions.withIndex().drop(cloudFileListGetIndex + 1)
            .firstOrNull { it.value.opcode == Opcode.CHECK_CAST }
            ?.let { (it.value as? ReferenceInstruction)?.reference as? TypeReference }
            ?.type ?: error("Native Cloud file model cast was not found")
        val cloudSearchReference = mutableClassDefBy(cloudCardOwner).methods.filter { method ->
            method.returnType == "V" &&
                method.parameterTypes.map(CharSequence::toString).let { parameters ->
                    parameters.size == 4 && parameters[0] == "Ljava/lang/String;" &&
                        parameters[1] == "Lkotlin/jvm/functions/Function1;" &&
                        parameters[2].startsWith("L") && parameters[3] == "I"
                }
        }.single()
        val cloudDialogReference = mutableClassDefBy(cloudCardOwner).methods.filter { method ->
            method.returnType == "V" &&
                method.parameterTypes.map(CharSequence::toString).let { parameters ->
                    parameters.size == 6 && parameters[0] == cloudItemType &&
                        parameters[1] == "Ljava/lang/String;" &&
                        parameters[2] == "Lkotlin/jvm/functions/Function1;" &&
                        parameters[3] == "Lkotlin/jvm/functions/Function0;" &&
                        parameters[4].startsWith("L") && parameters[5] == "I"
                }
        }.single()
        fun javaOwner(type: String) = type.removePrefix("L").removeSuffix(";").replace('/', '.')
        val cloudSearchOwnerName = javaOwner(cloudSearchReference.definingClass)
        val cloudCardOwnerName = javaOwner(cloudCardOwner)
        val cloudDialogOwnerName = javaOwner(cloudDialogReference.definingClass)
        val emptyStateOwnerName = javaOwner(NativeLibraryEmptyStateFingerprint.classDef.type)
        val emptyStateMethodName = NativeLibraryEmptyStateFingerprint.method.name
        val emptyContentInstructions =
            NativeLibraryEmptyContentFingerprint.method.implementation!!.instructions
        val emptyStateIconReference = emptyContentInstructions.withIndex()
            .mapNotNull { (index, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                if (reference?.definingClass != NativeLibraryEmptyStateFingerprint.classDef.type ||
                    reference.name != emptyStateMethodName
                ) return@mapNotNull null
                emptyContentInstructions.subList(maxOf(0, index - 24), index).asReversed()
                    .firstNotNullOfOrNull { preceding ->
                        ((preceding as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf {
                            it.returnType == "Lh2/f;" && it.parameterTypes.isEmpty()
                        }
                    }
            }.distinctBy { "${it.definingClass}->${it.name}" }.single()
        val emptyStateIconOwnerName = javaOwner(emptyStateIconReference.definingClass)
        val cloudItemOwnerName = javaOwner(cloudItemType)
        val cloudFileOwnerName = javaOwner(cloudFileType)
        val enumClass = mutableClassDefBy(enumType)
        val storageFieldName = "MORPHE_STORAGE"
        check(enumClass.staticFields.none { it.name == storageFieldName }) {
            "Local Media enum field already exists"
        }
        enumClass.staticFields.add(
            MutableField(
                ImmutableField(
                    enumType,
                    storageFieldName,
                    enumType,
                    AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or
                        AccessFlags.FINAL.value or AccessFlags.ENUM.value,
                    null,
                    emptySet(),
                    emptySet()
                )
            )
        )

        val enumValuesField = enumClass.staticFields.single {
            it.type == "[$enumType" && AccessFlags.SYNTHETIC.isSet(it.accessFlags)
        }
        val enumClinit = enumClass.directMethods.single { it.name == "<clinit>" }
        check(enumClinit.implementation!!.registerCount >= 3) {
            "Library view-mode initializer has fewer than three scratch registers"
        }
        val clinitReturn = enumClinit.implementation!!.instructions.indexOfLast {
            it.opcode == Opcode.RETURN_VOID
        }
        check(clinitReturn >= 0) { "Library view-mode initializer return was not found" }
        enumClinit.addInstructions(
            clinitReturn,
            """
                new-instance v0, $enumType
                const-string v1, "Storage"
                const/4 v2, 0x2
                invoke-direct { v0, v1, v2 }, $enumType-><init>(Ljava/lang/String;I)V
                sput-object v0, $enumType->$storageFieldName:$enumType

                const/4 v0, 0x3
                new-array v0, v0, [$enumType
                sget-object v1, ${enumClass.staticFields.first { it.type == enumType && AccessFlags.ENUM.isSet(it.accessFlags) }.let { "$enumType->${it.name}:$enumType" }}
                const/4 v2, 0x0
                aput-object v1, v0, v2
                sget-object v1, ${enumClass.staticFields.filter { it.type == enumType && AccessFlags.ENUM.isSet(it.accessFlags) }[1].let { "$enumType->${it.name}:$enumType" }}
                const/4 v2, 0x1
                aput-object v1, v0, v2
                sget-object v1, $enumType->$storageFieldName:$enumType
                const/4 v2, 0x2
                aput-object v1, v0, v2
                sput-object v0, $enumType->${enumValuesField.name}:[$enumType
                invoke-static { v0 }, Lkotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;
                move-result-object v0
                sput-object v0, $enumType->${enumEntriesField.name}:Lkotlin/enums/EnumEntries;
            """
        )

        val enumEntriesLoadIndex = rowMethod.implementation!!.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.SGET_OBJECT &&
                ((instruction as? ReferenceInstruction)?.reference as? FieldReference) == enumEntriesField
        }
        check(enumEntriesLoadIndex >= 0) { "Library mode entries load was not found" }
        val enumEntriesRegister =
            (rowMethod.implementation!!.instructions[enumEntriesLoadIndex] as OneRegisterInstruction).registerA
        rowMethod.addInstructions(
            enumEntriesLoadIndex + 1,
            """
                invoke-static { v$enumEntriesRegister }, $RUNTIME->visibleLibraryModes(Lkotlin/enums/EnumEntries;)Lkotlin/enums/EnumEntries;
                move-result-object v$enumEntriesRegister
            """
        )

        rowMethod.addInstructions(
            0,
            """
                const-string v2, "$libraryModeButtonOwner"
                const-string v3, "$libraryModeTextOwner"
                const-string v4, "$cloudSearchOwnerName"
                const-string v5, "${cloudSearchReference.name}"
                const-string v6, "$cloudCardOwnerName"
                const-string v7, "$cloudCardMethodName"
                const-string v8, "$cloudDialogOwnerName"
                const-string v9, "${cloudDialogReference.name}"
                const-string v10, "$emptyStateOwnerName"
                const-string v11, "$emptyStateMethodName"
                const-string v12, "$emptyStateIconOwnerName"
                const-string v13, "${emptyStateIconReference.name}"
                const-string v14, "$cloudItemOwnerName"
                const-string v15, "$cloudFileOwnerName"
                invoke-static/range { v2 .. v15 }, $LIBRARY_UI->configureNativeUi(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
                move-object/from16 v0, p0
                move-object/from16 v1, p3
                invoke-static { v0, v1 }, $LIBRARY_UI->storageRefreshContent(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)Lkotlin/jvm/functions/Function2;
                move-result-object p3
                move-object/from16 v1, p2
                invoke-static { v0, v1 }, $RUNTIME->observeLibraryModeSelection(Ljava/lang/Object;Lkotlin/jvm/functions/Function1;)V
            """
        )

        LibraryViewModeLabelFingerprint.method.addInstructionsWithLabels(
            0,
            """
                move-object/from16 v0, p0
                move-object/from16 v1, p2
                move-object/from16 v2, p3
                const-string v3, "$libraryModeTextOwner"
                invoke-static { v0, v1, v2, v3 }, $RUNTIME->renderStorageModeLabel(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :morphe_local_media_label_continue
                sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                return-object v0
                :morphe_local_media_label_continue
                nop
            """
        )

        LibrarySourceLabelFingerprint.method.apply {
            val instructions = implementation!!.instructions
            val nuvioLabelIndex = instructions.indexOfFirst { instruction ->
                ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                    "NUVIO"
            }
            check(nuvioLabelIndex >= 0) { "Library NUVIO source label was not found" }
            val labelRegister = (instructions[nuvioLabelIndex] as? OneRegisterInstruction)
                ?.registerA ?: error("Library NUVIO source label has no destination register")
            addInstructions(
                nuvioLabelIndex + 1,
                """
                    invoke-static/range { v$labelRegister .. v$labelRegister }, $LIBRARY_UI->storageSourceLabel(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$labelRegister
                """
            )
        }

        val gridMethod = LibraryGridContentFingerprint.method
        val gridInstructions = gridMethod.implementation!!.instructions
        val headerItemCalls = gridInstructions.mapIndexedNotNull { index, instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ?: return@mapIndexedNotNull null
            index.takeIf { reference.definingClass == "Lf0/h;" && reference.name == "p" }
        }
        check(headerItemCalls.size >= 2) { "Library grid shared header calls were not found" }
        // The span and content-lambda arguments created for the second shared header are dead
        // immediately after the call, so they are verifier-safe scratch registers. Captured field
        // registers are not safe here: Kotlin's synthetic invoke method reuses them across branches.
        val secondHeaderCall = gridInstructions[headerItemCalls[1]]
        val scratchRegisters = when (secondHeaderCall) {
            is FiveRegisterInstruction ->
                listOf(secondHeaderCall.registerE, secondHeaderCall.registerF)
            is RegisterRangeInstruction ->
                listOf(secondHeaderCall.startRegister + 2, secondHeaderCall.startRegister + 3)
            else -> error("Unsupported Library grid header invocation format")
        }
        check(scratchRegisters.distinct().size == 2 && scratchRegisters.all { it < 16 }) {
            "Library grid header temporaries are not available as scratch registers"
        }
        val firstScratch = scratchRegisters[0]
        val secondScratch = scratchRegisters[1]
        gridMethod.addInstructionsWithLabels(
            headerItemCalls[1] + 1,
            """
                move-object/from16 v$firstScratch, p0
                move-object/from16 v$secondScratch, p1
                invoke-static { v$firstScratch, v$secondScratch }, $LIBRARY_UI->populateStorageGridIfActive(Ljava/lang/Object;Ljava/lang/Object;)Z
                move-result v$firstScratch
                if-eqz v$firstScratch, :morphe_local_media_grid_continue
                sget-object v$firstScratch, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                return-object v$firstScratch
                :morphe_local_media_grid_continue
                nop
            """
        )

        CloudSearchLabelFingerprint.method.apply {
            val instructions = implementation!!.instructions
            val labelResourceIndex = instructions.indexOfFirst { instruction ->
                (instruction as? WideLiteralInstruction)?.wideLiteral == 0x7f1101f5L
            }
            check(labelResourceIndex >= 0) { "Cloud search label resource load was not found" }
            val labelStringCallIndex = instructions.withIndex()
                .drop(labelResourceIndex + 1)
                .firstOrNull { (_, instruction) ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        ?: return@firstOrNull false
                    reference.returnType == "Ljava/lang/String;" &&
                        reference.parameterTypes.any { it.toString() == "Le1/m0;" }
                }?.index ?: error("Cloud search label string lookup was not found")
            val labelResult = instructions.getOrNull(labelStringCallIndex + 1)
                as? OneRegisterInstruction
                ?: error("Cloud search label lookup no longer has an object result")
            check(labelResult.opcode == Opcode.MOVE_RESULT_OBJECT) {
                "Cloud search label lookup no longer returns an object"
            }
            val labelRegister = labelResult.registerA
            addInstructions(
                labelStringCallIndex + 2,
                """
                    invoke-static/range { v$labelRegister .. v$labelRegister }, $LIBRARY_UI->storageSearchLabel(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$labelRegister
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
                invoke-static { v0, v1, v2 }, $RUNTIME->attachSidecarSubtitles(Landroid/content/Context;Ljava/lang/String;Ljava/util/List;)Ljava/util/List;
                move-result-object p4
            """
        )

        FullscreenPlaybackStateListenerFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p0 .. p1 }, $RUNTIME->onPlaybackStateChanged(Ljava/lang/Object;I)V"
        )

        MainActivityKeyEventFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p0 .. p1 }, $RUNTIME->observeKeyEvent(Ljava/lang/Object;Landroid/view/KeyEvent;)V"
        )

        val composeDialogClass = mutableClassDefBy(ComposeDialogTouchEventFingerprint.classDef)
        check(composeDialogClass.methods.none {
            it.name == "dispatchKeyEvent" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/KeyEvent;")
        }) { "Compose dialog already overrides dispatchKeyEvent" }
        val dialogKeyMethod = ImmutableMethod(
            composeDialogClass.type,
            "dispatchKeyEvent",
            listOf(ImmutableMethodParameter("Landroid/view/KeyEvent;", null, "event")),
            "Z",
            AccessFlags.PUBLIC.value,
            null,
            null,
            MutableMethodImplementation(3)
        ).toMutable().apply {
            addInstructions(
                0,
                """
                    invoke-static { p0, p1 }, $RUNTIME->observeKeyEvent(Ljava/lang/Object;Landroid/view/KeyEvent;)V
                    invoke-super { p0, p1 }, Lc/o;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z
                    move-result v0
                    return v0
                """
            )
        }
        composeDialogClass.virtualMethods.add(dialogKeyMethod)
        composeDialogClass.methods.add(dialogKeyMethod)
    }
}
