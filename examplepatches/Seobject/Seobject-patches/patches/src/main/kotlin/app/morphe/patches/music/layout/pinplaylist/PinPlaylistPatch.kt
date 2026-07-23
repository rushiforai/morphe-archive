package app.morphe.patches.music.layout.pinplaylist

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.seobject.patches.music.Compatibility.COMPATIBILITY_YOUTUBE_MUSIC
import app.seobject.patches.music.settings.pinPlaylistSettingsResourcePatch
import app.morphe.util.cloneMutable
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/music/patches/pinplaylist/PinPlaylistPatch;"
private const val SETTINGS_CLASS =
    "Lapp/morphe/extension/music/patches/pinplaylist/PinPlaylistSettings;"

/**
 * Matches MenuItemPresenter.onClick(View).
 *
 * The method resolves a menu item's command through Larbe and dispatches it through
 * Larzp. We intercept at the beginning, identify the current menu item by its icon
 * enum, and consume only Pin/Unpin Speed Dial clicks.
 */
internal object PlaylistMenuItemPresenterClassFingerprint : Fingerprint(
    strings = listOf(
        "com/google/android/apps/youtube/music/ui/presenter/MenuItemPresenter"
    ),
    custom = { _, classDef ->
        classDef.methods.any { method ->
            method.name == "onClick" &&
                method.returnType == "V" &&
                method.parameters.map { parameter -> parameter.type } ==
                listOf("Landroid/view/View;")
        }
    },
)

/**
 * Matches hyz.o(holder, position), the Library RecyclerView/Litho adapter bind.
 */
internal object PlaylistLithoAdapterBindFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Ljava/util/List;",
            name = "get",
            parameters = listOf("I"),
            returnType = "Ljava/lang/Object;",
        ),
        methodCall(
            parameters = emptyList(),
            returnType = "Lcom/facebook/litho/ComponentTree;",
        ),
    ),
    custom = { method, _ ->
        method.parameters.size == 2 &&
            method.parameters[1].type == "I"
    },
)

/**
 * Matches bfrh.h(int), which converts one adapter source position into an
 * AdapterProxyRenderInfo (hyi).
 */
internal object PlaylistAdapterProxyRenderInfoFingerprint : Fingerprint(
    parameters = listOf("I"),
    filters = listOf(
        methodCall(
            name = "getItem",
            parameters = listOf("I"),
            returnType = "Ljava/lang/Object;",
        ),
    ),
    custom = { method, _ ->
        method.returnType.startsWith("L") ||
            method.returnType.startsWith("[")
    },
)

/**
 * Matches the flyout creation method structurally through its stable bottom-sheet tag.
 * No obfuscated defining-class or method name is required.
 */
internal object PlaylistFlyoutSourceFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("MUSIC_MENU_BOTTOM_SHEET_FRAGMENT_TAG"),
    custom = { method, _ ->
        method.parameters.size == 4 &&
            method.parameters[1].type == "Ljava/lang/Object;" &&
            method.parameters.none { parameter ->
                parameter.type == "Landroid/view/View;"
            }
    },
)

/**
 * Matches YouTube Music's native ordinary command-row factory.
 *
 * The protobuf row, title-message, and command classes are renamed between
 * releases. Match the stable construction shape instead of any obfuscated
 * return type:
 *   - static Context + content-id factory,
 *   - Context.getString(int),
 *   - one String -> protobuf title-message factory,
 *   - one String, String, int, boolean -> protobuf command factory.
 *
 * The concrete row and title types are derived from the matched method when
 * the hook is installed, so this fingerprint spans the buzr, bwpd, bwuu, and
 * bwyn menu-model families without version-number checks.
 */
internal object PlaylistNativeMenuRowFactoryFingerprint : Fingerprint(
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
    ),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/content/Context;",
            name = "getString",
            parameters = listOf("I"),
            returnType = "Ljava/lang/String;",
        ),
        methodCall(
            parameters = listOf("Ljava/lang/String;"),
        ),
        methodCall(
            parameters = listOf(
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "I",
                "Z",
            ),
        ),
    ),
    custom = { method, _ ->
        method.implementation?.let { implementation ->
            val staticReferenceCalls =
                implementation.instructions.mapNotNull { instruction ->
                    if (instruction.opcode != Opcode.INVOKE_STATIC &&
                        instruction.opcode != Opcode.INVOKE_STATIC_RANGE
                    ) {
                        return@mapNotNull null
                    }

                    val reference =
                        (instruction as? ReferenceInstruction)
                            ?.reference as? MethodReference
                                ?: return@mapNotNull null

                    if (!reference.returnType.startsWith("L")) {
                        return@mapNotNull null
                    }

                    reference
                }

            val titleFactoryCount =
                staticReferenceCalls.count { reference ->
                    reference.parameterTypes.map { it.toString() } ==
                        listOf("Ljava/lang/String;")
                }

            val commandFactoryCount =
                staticReferenceCalls.count { reference ->
                    reference.parameterTypes.map { it.toString() } ==
                        listOf(
                            "Ljava/lang/String;",
                            "Ljava/lang/String;",
                            "I",
                            "Z",
                        )
                }

            (method.accessFlags and 0x8) != 0 &&
                method.returnType.startsWith("L") &&
                titleFactoryCount == 1 &&
                commandFactoryCount == 1
        } ?: false
    },
)

val pinPlaylistPatch = bytecodePatch(
    name = "Pin playlists",
    description = "Pins playlists to the top of the YouTube Music Library.",
) {
    dependsOn(pinPlaylistSettingsResourcePatch)
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)
    extendWith("extensions/pinplaylist.mpe")

    execute {
        /*
         * Part 1: consume only the fresh local Library Pin/Unpin menu action.
         */
        val menuItemPresenterClass =
            PlaylistMenuItemPresenterClassFingerprint.classDef

        /*
         * Apply the extension-owned icon immediately after YouTube Music calls
         * its native visual binder. The binder receiver register is guaranteed
         * to be the MenuItemPresenter instance because it is taken directly
         * from the matched instance invocation.
         *
         * Do not inject inside the visual binder and assume p0 survives. The
         * app is free to reuse the physical parameter register after entry, as
         * 9.24.51 does. Hooking the caller avoids that register-liveness trap
         * without allocating scratch registers or naming any obfuscated class,
         * method, field, row type, or native icon enum.
         */
        val nativeIconGetter =
            menuItemPresenterClass.methods.single { method ->
                method.parameters.isEmpty() &&
                    method.returnType == "Landroid/widget/ImageView;" &&
                    (method.accessFlags and 0x8) == 0
            }

        val nativeIconGetterReference =
            "${menuItemPresenterClass.type}->" +
                "${nativeIconGetter.name}()" +
                nativeIconGetter.returnType

        val menuItemVisualBindMethod =
            menuItemPresenterClass.methods.single { method ->
                val implementation = method.implementation
                    ?: return@single false

                val invokesNativeIconGetter =
                    implementation.instructions.any { instruction ->
                        val reference =
                            (instruction as? ReferenceInstruction)
                                ?.reference as? MethodReference

                        reference != null &&
                            "${reference.definingClass}->" +
                                "${reference.name}(" +
                                reference.parameterTypes.joinToString("") +
                                ")${reference.returnType}" ==
                                nativeIconGetterReference
                    }

                val writesNativeImageView =
                    implementation.instructions.any { instruction ->
                        val reference =
                            (instruction as? ReferenceInstruction)
                                ?.reference as? MethodReference

                        reference != null &&
                            reference.definingClass ==
                                "Landroid/widget/ImageView;" &&
                            reference.name in setOf(
                                "setImageResource",
                                "setImageDrawable",
                            )
                    }

                method.returnType == "V" &&
                    method.parameters.isEmpty() &&
                    (method.accessFlags and 0x8) == 0 &&
                    invokesNativeIconGetter &&
                    writesNativeImageView
            }

        val menuItemVisualBindReference =
            "${menuItemVisualBindMethod.definingClass}->" +
                "${menuItemVisualBindMethod.name}(" +
                menuItemVisualBindMethod.parameters.joinToString("") {
                    parameter -> parameter.type
                } +
                ")${menuItemVisualBindMethod.returnType}"

        val visualBindCallSites =
            menuItemPresenterClass.methods.flatMap { caller ->
                val implementation = caller.implementation
                    ?: return@flatMap emptyList()

                implementation.instructions
                    .withIndex()
                    .mapNotNull { indexed ->
                        val reference =
                            (indexed.value as? ReferenceInstruction)
                                ?.reference as? MethodReference
                                ?: return@mapNotNull null

                        val descriptor =
                            "${reference.definingClass}->" +
                                "${reference.name}(" +
                                reference.parameterTypes.joinToString("") +
                                ")${reference.returnType}"

                        if (descriptor != menuItemVisualBindReference) {
                            return@mapNotNull null
                        }

                        val receiverRegister =
                            when (val instruction = indexed.value) {
                                is FiveRegisterInstruction ->
                                    instruction.registerC
                                is RegisterRangeInstruction ->
                                    instruction.startRegister
                                else -> error(
                                    "Unsupported MenuItemPresenter visual-bind invoke"
                                )
                            }

                        Triple(
                            caller,
                            indexed.index,
                            receiverRegister,
                        )
                    }
            }

        check(visualBindCallSites.isNotEmpty()) {
            "Expected at least one MenuItemPresenter visual-bind call site"
        }

        visualBindCallSites
            .groupBy { callSite -> callSite.first }
            .forEach { (caller, callSites) ->
                callSites
                    .sortedByDescending { callSite ->
                        callSite.second
                    }
                    .forEach { callSite ->
                        val presenterRegister =
                            callSite.third

                        caller.addInstructionsWithLabels(
                            callSite.second + 1,
                            """
                                invoke-static/range {v$presenterRegister .. v$presenterRegister}, $EXTENSION_CLASS->styleInjectedLibraryPinPresenter(Ljava/lang/Object;)V
                            """
                        )
                    }
            }

        val originalMethod = menuItemPresenterClass.methods.single { method ->
            method.name == "onClick" &&
                method.returnType == "V" &&
                method.parameters.map { parameter -> parameter.type } ==
                listOf("Landroid/view/View;")
        }
        val originalRegisterCount = originalMethod.implementation!!.registerCount

        // onClick(View) has two parameter registers: p0 and p1.
        val parameterRegisterCount = 2
        val firstNewLocalRegister = originalRegisterCount - parameterRegisterCount

        val patchedMethod = originalMethod.cloneMutable(additionalRegisters = 3)

        menuItemPresenterClass.methods.apply {
            remove(originalMethod)
            add(patchedMethod)
        }

        val viewRegister = firstNewLocalRegister
        val presenterRegister = firstNewLocalRegister + 1
        val handledRegister = firstNewLocalRegister + 2

        /*
         * onClick's parameters are p0 (presenter) then p1 (View), while the
         * extension signature is (View, presenter). Copy them into contiguous
         * locals in descriptor order so the range invoke remains verifier-safe.
         */
        patchedMethod.addInstructionsWithLabels(
            0,
            """
                move-object/from16 v$viewRegister, p1
                move-object/from16 v$presenterRegister, p0
                invoke-static/range {v$viewRegister .. v$presenterRegister}, $EXTENSION_CLASS->handleClick(Landroid/view/View;Ljava/lang/Object;)Z
                move-result v$handledRegister
                if-eqz v$handledRegister, :pin_playlist_native_click
                return-void
            """,
            ExternalLabel(
                "pin_playlist_native_click",
                patchedMethod.implementation!!.instructions.first()
            )
        )

        /*
         * True pre-submit hook.
         *
         * Capture every Lhyi returned by bfrh.h(index), then reorder the
         * completed List<Lhzq> immediately before bfrh iterates it and converts
         * it into hzc.b's hvg rows. The adapter therefore receives pinned order
         * on its first render instead of being corrected after binding.
         */
        val renderInfoFactory =
            PlaylistAdapterProxyRenderInfoFingerprint.method

        check((renderInfoFactory.accessFlags and 0x8) == 0) {
            "Expected bfrh.h(int) to be an instance method"
        }

        /*
         * Use range invokes so this remains valid even when the obfuscated
         * method has enough locals to place p0/p1 or the return register above
         * the normal invoke instruction's four-bit register limit.
         */
        renderInfoFactory.addInstructionsWithLabels(
            0,
            """
                invoke-static/range {p0 .. p1}, $EXTENSION_CLASS->beginAdapterProxyRenderInfo(Ljava/lang/Object;I)V
            """
        )

        val getItemCall =
            renderInfoFactory.implementation!!.instructions
                .withIndex()
                .first { indexed ->
                    val referenceInstruction =
                        indexed.value as? ReferenceInstruction
                            ?: return@first false
                    val reference =
                        referenceInstruction.reference
                            as? MethodReference
                            ?: return@first false

                    reference.name == "getItem" &&
                        reference.returnType ==
                        "Ljava/lang/Object;" &&
                        reference.parameterTypes
                            .map { it.toString() } ==
                        listOf("I")
                }
        val getItemCallIndex = getItemCall.index
        val (sourceAdapterRegister, sourcePositionRegister) =
            when (val instruction = getItemCall.value) {
                is FiveRegisterInstruction ->
                    instruction.registerC to instruction.registerD
                is RegisterRangeInstruction ->
                    instruction.startRegister to instruction.startRegister + 1
                else -> error("Unsupported getItem invoke")
            }

        val getItemResult =
            renderInfoFactory.implementation!!.instructions[
                getItemCallIndex + 1
            ] as OneRegisterInstruction

        check(
            renderInfoFactory.implementation!!.instructions[
                getItemCallIndex + 1
            ].opcode == Opcode.MOVE_RESULT_OBJECT
        ) {
            "Expected move-result-object after bewt.getItem"
        }

        renderInfoFactory.addInstructionsWithLabels(
            getItemCallIndex + 2,
            """
                invoke-static/range {v${getItemResult.registerA} .. v${getItemResult.registerA}}, $EXTENSION_CLASS->captureAdapterProxySourceObject(Ljava/lang/Object;)V
            """
        )

        renderInfoFactory.addInstructionsWithLabels(
            getItemCallIndex,
            """
                invoke-static/range {v$sourceAdapterRegister .. v$sourceAdapterRegister}, $EXTENSION_CLASS->captureAdapterProxySourceAdapter(Ljava/lang/Object;)V
                invoke-static/range {v$sourcePositionRegister .. v$sourcePositionRegister}, $EXTENSION_CLASS->remapActiveAdapterProxySourcePosition(I)I
                move-result v$sourcePositionRegister
            """
        )

        renderInfoFactory.implementation!!.instructions
            .withIndex()
            .filter { indexed ->
                indexed.value.opcode == Opcode.RETURN_OBJECT
            }
            .map { indexed ->
                indexed.index to
                    (indexed.value as OneRegisterInstruction).registerA
            }
            .asReversed()
            .forEach { (returnIndex, returnRegister) ->
                renderInfoFactory.addInstructionsWithLabels(
                    returnIndex,
                    """
                        invoke-static/range {v$returnRegister .. v$returnRegister}, $EXTENSION_CLASS->captureAdapterProxyRenderInfo(Ljava/lang/Object;)V
                    """
                )
            }

        /*
         * Hook every active bfrh source-list mutation, not only its dormant
         * replace-all method. The static dump shows the Library path builds
         * List<Lhzq> through h(index) and submits it through hzc.B/S before
         * hzc converts those render infos into hvg rows.
         */
        val adapterProxyClass =
            PlaylistAdapterProxyRenderInfoFingerprint.classDef

        val libraryControllerCandidates =
            PlaylistLithoAdapterBindFingerprint.originalMethod
                .implementation!!.instructions
                .mapNotNull { instruction ->
                    (instruction as? ReferenceInstruction)
                        ?.reference as? MethodReference
                }
                .filter { reference ->
                    reference.returnType == "I" &&
                        reference.parameterTypes.size == 1 &&
                        reference.parameterTypes[0].toString()
                            .startsWith("L")
                }
                .groupBy { reference ->
                    Pair(
                        reference.definingClass,
                        reference.parameterTypes[0].toString(),
                    )
                }
                .entries.filter { entry ->
                    entry.value.map { reference -> reference.name }
                        .distinct().size >= 2
                }

        check(libraryControllerCandidates.size == 1) {
            "Expected one Library controller call group, found " +
                libraryControllerCandidates.map { entry ->
                    entry.key to entry.value.map { reference ->
                        reference.name
                    }
                }
        }

        val libraryControllerType =
            libraryControllerCandidates.single().key.first

        adapterProxyClass.methods
            .filter { method ->
                method.implementation != null &&
                    method.name != "<init>" &&
                    method.name != "<clinit>" &&
                    (method.accessFlags and 0x8) == 0
            }
            .forEach { method ->
                val instructions =
                    method.implementation!!.instructions

                val buildsRenderInfos =
                    instructions.any { instruction ->
                        val referenceInstruction =
                            instruction as? ReferenceInstruction
                                ?: return@any false
                        val reference =
                            referenceInstruction.reference
                                as? MethodReference
                                ?: return@any false

                        reference.definingClass ==
                            renderInfoFactory.definingClass &&
                            reference.name == renderInfoFactory.name &&
                            reference.returnType ==
                            renderInfoFactory.returnType &&
                            reference.parameterTypes
                                .map { it.toString() } ==
                            listOf("I")
                    }

                if (!buildsRenderInfos) {
                    return@forEach
                }

                val mutationCalls =
                    instructions
                        .withIndex()
                        .mapNotNull { indexed ->
                            val referenceInstruction =
                                indexed.value as? ReferenceInstruction
                                    ?: return@mapNotNull null
                            val reference =
                                referenceInstruction.reference
                                    as? MethodReference
                                    ?: return@mapNotNull null

                            if (reference.definingClass !=
                                libraryControllerType) {
                                return@mapNotNull null
                            }

                            val parameterTypes =
                                reference.parameterTypes
                                    .map { it.toString() }
                            val listParameterIndex =
                                parameterTypes.indexOf(
                                    "Ljava/util/List;"
                                )

                            if (listParameterIndex < 0) {
                                return@mapNotNull null
                            }

                            val invokeRegisters =
                                when (val instruction = indexed.value) {
                                    is FiveRegisterInstruction -> {
                                        listOf(
                                            instruction.registerC,
                                            instruction.registerD,
                                            instruction.registerE,
                                            instruction.registerF,
                                            instruction.registerG,
                                        ).take(instruction.registerCount)
                                    }

                                    is RegisterRangeInstruction ->
                                        (instruction.startRegister until
                                            instruction.startRegister +
                                            instruction.registerCount)
                                            .toList()

                                    else -> return@mapNotNull null
                                }

                            /*
                             * Word zero is the invoke-virtual receiver. Wide
                             * J/D parameters occupy two words; all other
                             * parameters, including List, occupy one.
                             */
                            var listWordIndex = 1
                            for (parameterIndex in 0 until
                                listParameterIndex) {
                                val type =
                                    parameterTypes[parameterIndex]
                                listWordIndex +=
                                    if (type == "J" || type == "D") {
                                        2
                                    } else {
                                        1
                                    }
                            }

                            if (listWordIndex >=
                                invokeRegisters.size) {
                                return@mapNotNull null
                            }

                            Pair(
                                indexed.index,
                                invokeRegisters[listWordIndex]
                            )
                        }
                        .asReversed()

                mutationCalls.forEach {
                    (callIndex, listRegister) ->

                    method.addInstructionsWithLabels(
                        callIndex,
                        """
                            invoke-static/range {p0 .. p0}, $EXTENSION_CLASS->beginAdapterProxyReplaceAll(Ljava/lang/Object;)V
                            invoke-static/range {v$listRegister .. v$listRegister}, $EXTENSION_CLASS->prepareAdapterProxyRenderInfos(Ljava/lang/Object;)V
                        """
                    )
                }
            }

        /*
         * AdapterProxy rows all share one render-info object. Reorder them
         * virtually by translating hyz's visual adapter position before its
         * view-type, stable-ID and bind paths read the native row.
         */
        val libraryAdapterClass =
            PlaylistLithoAdapterBindFingerprint.classDef

        val nativeLibraryControllerFields =
            libraryAdapterClass.fields.filter { field ->
                (field.accessFlags and 0x8) == 0 &&
                    field.type.startsWith("L")
            }

        check(nativeLibraryControllerFields.size == 1) {
            "Expected one Library adapter controller field, found " +
                nativeLibraryControllerFields.map { field ->
                    field.name to field.type
                }
        }

        val nativeLibraryControllerType =
            nativeLibraryControllerFields.single().type
        fun isLibraryReplaceAll(method: com.android.tools.smali.dexlib2.iface.Method): Boolean {
            val references = method.implementation?.instructions
                ?.mapNotNull { instruction ->
                    (instruction as? ReferenceInstruction)?.reference
                }
                .orEmpty()

            return references.any { reference ->
                reference is FieldReference &&
                    reference.definingClass == nativeLibraryControllerType &&
                    reference.type == "Ljava/util/List;"
            } && references.any { reference ->
                reference is MethodReference &&
                    reference.definingClass == "Ljava/util/List;" &&
                    reference.name == "clear"
            } && references.any { reference ->
                reference is MethodReference &&
                    reference.definingClass == "Ljava/util/List;" &&
                    reference.name == "iterator"
            }
        }

        val libraryReplaceAllClass = mutableClassDefBy { classDef ->
            classDef.methods.any(::isLibraryReplaceAll)
        }
        val libraryReplaceAllMethod =
            libraryReplaceAllClass.methods.single(::isLibraryReplaceAll)
        val sourceIteratorCall =
            libraryReplaceAllMethod.implementation!!.instructions
                .withIndex()
                .single { indexed ->
                    val reference =
                        (indexed.value as? ReferenceInstruction)
                            ?.reference as? MethodReference

                    reference?.definingClass == "Ljava/util/List;" &&
                        reference.name == "iterator" &&
                        reference.parameterTypes.isEmpty()
                }
        val sourceRowsRegister =
            when (val instruction = sourceIteratorCall.value) {
                is FiveRegisterInstruction -> instruction.registerC
                is RegisterRangeInstruction -> instruction.startRegister
                else -> error("Unsupported List.iterator invoke")
            }

        check(
            libraryReplaceAllMethod.implementation!!.instructions[
                sourceIteratorCall.index + 1
            ].opcode == Opcode.MOVE_RESULT_OBJECT
        ) {
            "Expected move-result-object after List.iterator"
        }

        libraryReplaceAllMethod.addInstructionsWithLabels(
            sourceIteratorCall.index + 2,
            """
                invoke-static {p0, v$sourceRowsRegister}, $EXTENSION_CLASS->inspectNativeLibraryRows(Ljava/lang/Object;Ljava/lang/Object;)V
            """,
        )

        val nativeLibraryControllerClass =
            mutableClassDefBy(nativeLibraryControllerType)
        val originalNativeBatchMutationMethod =
            nativeLibraryControllerClass.methods.single { method ->
                val references = method.implementation?.instructions
                    ?.mapNotNull { instruction ->
                        (instruction as? ReferenceInstruction)?.reference
                    }
                    .orEmpty()

                method.returnType == "V" &&
                    method.parameters.map { parameter -> parameter.type } ==
                    listOf("I") &&
                    references.any { reference ->
                        reference is MethodReference &&
                            reference.definingClass == "Ljava/util/Deque;" &&
                            reference.name == "pollFirst"
                    } && references.any { reference ->
                        reference is MethodReference &&
                            reference.definingClass == "Ljava/util/List;" &&
                            reference.name == "add" &&
                            reference.parameterTypes.map { it.toString() } ==
                            listOf("I", "Ljava/lang/Object;")
                    }
            }

        check((originalNativeBatchMutationMethod.accessFlags and 0x8) == 0) {
            "Expected native Library batch mutation to be an instance method"
        }

        originalNativeBatchMutationMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static/range {p0 .. p0}, $EXTENSION_CLASS->beginNativeLibraryMutation(Ljava/lang/Object;)V
            """,
        )

        originalNativeBatchMutationMethod.implementation!!.instructions
            .withIndex()
            .filter { indexed ->
                indexed.value.opcode == Opcode.RETURN_VOID
            }
            .map { indexed -> indexed.index }
            .asReversed()
            .forEach { returnIndex ->
                originalNativeBatchMutationMethod.addInstructionsWithLabels(
                    returnIndex,
                    """
                        invoke-static {}, $EXTENSION_CLASS->finishNativeLibraryMutation()V
                    """,
                )
            }

        fun isInlineLibraryTransaction(
            method: com.android.tools.smali.dexlib2.iface.Method,
        ): Boolean {
            val references = method.implementation?.instructions
                ?.mapNotNull { instruction ->
                    (instruction as? ReferenceInstruction)?.reference
                }
                .orEmpty()

            return references.any { reference ->
                reference is FieldReference &&
                    reference.definingClass == nativeLibraryControllerType &&
                    reference.type == "Ljava/util/List;"
            } && references.any { reference ->
                reference is MethodReference &&
                    reference.definingClass == "Landroid/util/SparseArray;" &&
                    reference.name == "clear"
            } && references.any { reference ->
                reference is MethodReference &&
                    reference.definingClass == "Ljava/util/List;" &&
                    reference.name == "add" &&
                    reference.parameterTypes.map { it.toString() } ==
                    listOf("I", "Ljava/lang/Object;")
            }
        }

        val inlineTransactionClass = mutableClassDefBy { classDef ->
            classDef.methods.any(::isInlineLibraryTransaction)
        }
        val inlineTransactionMethod =
            inlineTransactionClass.methods.single(::isInlineLibraryTransaction)

        check((inlineTransactionMethod.accessFlags and 0x8) == 0) {
            "Expected inline Library transaction to be an instance method"
        }

        inlineTransactionMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static/range {p0 .. p0}, $EXTENSION_CLASS->beginNativeLibraryMutation(Ljava/lang/Object;)V
            """,
        )

        inlineTransactionMethod.implementation!!.instructions
            .withIndex()
            .filter { indexed ->
                indexed.value.opcode == Opcode.RETURN_VOID
            }
            .map { indexed -> indexed.index }
            .asReversed()
            .forEach { returnIndex ->
                inlineTransactionMethod.addInstructionsWithLabels(
                    returnIndex,
                    """
                        invoke-static {}, $EXTENSION_CLASS->finishNativeLibraryMutation()V
                    """,
                )
            }

        val libraryItemCountMethod =
            libraryAdapterClass.methods.single {
                it.returnType == "I" && it.parameters.isEmpty()
            }

        libraryItemCountMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static/range {p0 .. p0}, $EXTENSION_CLASS->prepareStableLibraryAdapter(Ljava/lang/Object;)V
            """
        )

        val libraryViewTypeMethod =
            libraryAdapterClass.methods.single {
                it.returnType == "I" &&
                    it.parameters.map { parameter ->
                        parameter.type
                    } == listOf("I")
            }

        libraryViewTypeMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static/range {p0 .. p0}, $EXTENSION_CLASS->preparePersistedLibraryAdapter(Ljava/lang/Object;)V
                invoke-static/range {p0 .. p0}, $EXTENSION_CLASS->beginAdapterViewTypePositionRemap(Ljava/lang/Object;)V
                invoke-static/range {p1 .. p1}, $EXTENSION_CLASS->remapAdapterPosition(I)I
                move-result p1
            """
        )

        val libraryStableIdMethod =
            libraryAdapterClass.methods.single {
                it.returnType == "J" &&
                    it.parameters.map { parameter ->
                        parameter.type
                    } == listOf("I")
            }

        libraryStableIdMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static/range {p0 .. p0}, $EXTENSION_CLASS->preparePersistedLibraryAdapter(Ljava/lang/Object;)V
                invoke-static/range {p0 .. p0}, $EXTENSION_CLASS->beginAdapterStableIdPositionRemap(Ljava/lang/Object;)V
                invoke-static/range {p1 .. p1}, $EXTENSION_CLASS->remapAdapterPosition(I)I
                move-result p1
            """
        )

        /*
         * Fast Library adapter hook. Preserve adapter/holder/position at entry,
         * then inspect the fully populated row at every normal return from hyz.o.
         * p1 is either the original holder or its item View at these returns;
         * the extension indexes the pending bind by both identities.
         */
        val libraryBindMethod = PlaylistLithoAdapterBindFingerprint.method

        libraryBindMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static/range {p0 .. p0}, $EXTENSION_CLASS->preparePersistedLibraryAdapter(Ljava/lang/Object;)V
                invoke-static {p0, p1, p2}, $EXTENSION_CLASS->beginBoundLibraryRow(Ljava/lang/Object;Ljava/lang/Object;I)V
                invoke-static/range {p0 .. p0}, $EXTENSION_CLASS->beginAdapterBindPositionRemap(Ljava/lang/Object;)V
                invoke-static/range {p2 .. p2}, $EXTENSION_CLASS->remapAdapterPosition(I)I
                move-result p2
            """
        )

        val libraryBindReturnIndices =
            libraryBindMethod.implementation!!.instructions
                .withIndex()
                .filter { indexed ->
                    indexed.value.opcode == Opcode.RETURN_VOID
                }
                .map { indexed -> indexed.index }
                .asReversed()

        libraryBindReturnIndices.forEach { returnIndex ->
            libraryBindMethod.addInstructionsWithLabels(
                returnIndex,
                """
                    invoke-static {p1}, $EXTENSION_CLASS->finishBoundLibraryRow(Ljava/lang/Object;)V
                """
            )
        }

        /*
         * Native post-normalization flyout insertion (verifier-safe).
         *
         * The native normalization call returns a mutable ArrayList containing only the
         * native rows that survived YouTube Music's own normalization. Build a
         * new row through the app's ordinary native row factory and append it
         * only after that normalization call returns. The native page-menu
         * pipeline then copies and binds the same object through MenuItemPresenter.
         */
        val originalFlyoutSourceMethod =
            PlaylistFlyoutSourceFingerprint.method
        val flyoutSourceClass =
            PlaylistFlyoutSourceFingerprint.classDef
        val nativeRowFactory =
            PlaylistNativeMenuRowFactoryFingerprint.method

        check((nativeRowFactory.accessFlags and 0x8) != 0) {
            "Expected the native menu-row factory to be static"
        }

        val nativeRowType = nativeRowFactory.returnType
        val flyoutAcceptsNativeRowType =
            flyoutSourceClass.methods.any { candidate ->
                val appendsToList =
                    candidate.implementation?.instructions?.any { instruction ->
                        val reference =
                            (instruction as? ReferenceInstruction)
                                ?.reference as? MethodReference

                        reference?.definingClass == "Ljava/util/List;" &&
                            reference.name == "add" &&
                            reference.parameterTypes.map { it.toString() } ==
                                listOf("Ljava/lang/Object;") &&
                            reference.returnType == "Z"
                    } == true

                (candidate.accessFlags and 0x8) != 0 &&
                    candidate.returnType == "V" &&
                    candidate.parameters.map { parameter -> parameter.type } ==
                        listOf(
                            "Ljava/util/List;",
                            nativeRowType,
                        ) &&
                    appendsToList
            }

        check(nativeRowType.startsWith("L") && flyoutAcceptsNativeRowType) {
            "Native row factory result does not match the flyout row model"
        }
        val nativeTitleFactoryCall =
            nativeRowFactory.implementation!!.instructions
                .asSequence()
                .mapNotNull { instruction ->
                    val reference =
                        (instruction as? ReferenceInstruction)
                            ?.reference as? MethodReference
                                ?: return@mapNotNull null

                    instruction to reference
                }
                .single { (instruction, reference) ->
                    (instruction.opcode == Opcode.INVOKE_STATIC ||
                        instruction.opcode == Opcode.INVOKE_STATIC_RANGE) &&
                        reference.parameterTypes
                            .map { it.toString() } ==
                            listOf("Ljava/lang/String;") &&
                        reference.returnType.startsWith("L")
                }

        val nativeTitleFactoryReference =
            nativeTitleFactoryCall.second

        val nativeTitleFactoryDescriptor =
            "${nativeTitleFactoryReference.definingClass}->" +
                "${nativeTitleFactoryReference.name}(" +
                nativeTitleFactoryReference.parameterTypes
                    .joinToString(separator = "") +
                ")${nativeTitleFactoryReference.returnType}"

        val nativeRowFactoryDescriptor =
            "${nativeRowFactory.definingClass}->" +
                "${nativeRowFactory.name}(" +
                nativeRowFactory.parameters
                    .joinToString(separator = "") { parameter ->
                        parameter.type
                    } +
                ")${nativeRowFactory.returnType}"

        val flyoutMenuType =
            originalFlyoutSourceMethod.parameters.first().type

        val flyoutContextField =
            originalFlyoutSourceMethod.implementation!!.instructions
                .asSequence()
                .filter { instruction ->
                    instruction.opcode == Opcode.IGET_OBJECT
                }
                .mapNotNull { instruction ->
                    (instruction as? ReferenceInstruction)
                        ?.reference as? FieldReference
                }
                .first { field ->
                    field.type == "Landroid/content/Context;"
                }

        val flyoutContextFieldDescriptor =
            "${flyoutContextField.definingClass}->" +
                "${flyoutContextField.name}:" +
                flyoutContextField.type

        val flyoutParameterRegisterCount =
            1 + originalFlyoutSourceMethod.parameters.sumOf { parameter ->
                if (parameter.type == "J" || parameter.type == "D") 2 else 1
            }
        val originalFlyoutRegisterCount =
            originalFlyoutSourceMethod.implementation!!.registerCount

        /*
         * cloneMutable keeps the original register file intact and shifts the
         * real parameter registers upward. The original parameter slots become
         * local mirrors used by the unchanged method body. Therefore, merely
         * adding one register per parameter creates no free scratch registers.
         *
         * Allocate the parameter-mirror span plus three truly free registers.
         * The free range begins at the old register count and is never referenced
         * by the original implementation.
         */
        val flyoutScratchRegisterCount = 3
        val flyoutAdditionalRegisterCount =
            flyoutParameterRegisterCount + flyoutScratchRegisterCount

        val patchedFlyoutSourceMethod =
            originalFlyoutSourceMethod.cloneMutable(
                additionalRegisters = flyoutAdditionalRegisterCount
            )

        flyoutSourceClass.methods.apply {
            remove(originalFlyoutSourceMethod)
            add(patchedFlyoutSourceMethod)
        }

        val contextOrListRegister = originalFlyoutRegisterCount
        val playlistIdOrItemRegister = originalFlyoutRegisterCount + 1
        val titleRegister = originalFlyoutRegisterCount + 2
        val shiftedThisRegister =
            originalFlyoutRegisterCount - flyoutParameterRegisterCount +
                flyoutAdditionalRegisterCount

        check(
            (originalFlyoutSourceMethod.accessFlags and 0x8) == 0 &&
                originalFlyoutSourceMethod.parameters.take(3).all { parameter ->
                    parameter.type.startsWith("L") ||
                        parameter.type.startsWith("[")
                } &&
                flyoutMenuType.startsWith("L") &&
                flyoutMenuType.endsWith(";") &&
                nativeRowFactory.returnType.startsWith("L") &&
                nativeRowFactory.returnType.endsWith(";") &&
                contextOrListRegister >= originalFlyoutRegisterCount &&
                titleRegister < shiftedThisRegister &&
                titleRegister <= 15 &&
                shiftedThisRegister <= 15
        ) {
            "Flyout hook requires three verifier-safe scratch registers below v16"
        }

        val normalizationMoveResultIndex =
            patchedFlyoutSourceMethod.implementation!!.instructions
                .withIndex()
                .first { indexed ->
                    val reference =
                        (indexed.value as? ReferenceInstruction)
                            ?.reference as? MethodReference

                    reference != null &&
                        reference.returnType == "Ljava/util/List;" &&
                        reference.parameterTypes
                            .map { it.toString() } ==
                            listOf(
                                flyoutMenuType,
                                "Ljava/lang/Object;",
                            )
                }
                .index + 1

        check(
            patchedFlyoutSourceMethod.implementation!!
                .instructions[normalizationMoveResultIndex]
                .opcode == Opcode.MOVE_RESULT_OBJECT
        ) {
            "Expected move-result-object after native flyout normalization"
        }

        val normalizationResultRegister =
            (patchedFlyoutSourceMethod.implementation!!
                .instructions[normalizationMoveResultIndex]
                as OneRegisterInstruction).registerA

        val nativeNormalizationContinuation =
            patchedFlyoutSourceMethod.implementation!!
                .instructions[normalizationMoveResultIndex + 1]

        /*
         * Resolve flyout identity only after YouTube Music has returned its
         * normalized row list. Nothing is carried across the native method's
         * control-flow graph, and the three scratch registers are outside the
         * original register file.
         *
         * Their lifetimes are deliberately linear:
         *   scratch 0: Context -> normalized List
         *   scratch 1: playlist ID -> native item
         *   scratch 2: title String -> native title message
         *
         * Every call uses range encoding, and the original continuation never
         * reads these scratch registers.
         */
        patchedFlyoutSourceMethod.addInstructionsWithLabels(
            normalizationMoveResultIndex + 1,
            """
                invoke-static/range {p1 .. p3}, $EXTENSION_CLASS->captureFlyoutSource(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

                invoke-static {}, $EXTENSION_CLASS->getActiveFlyoutPlaylistIdForNativeRow()Ljava/lang/String;
                move-result-object v$playlistIdOrItemRegister
                if-eqz v$playlistIdOrItemRegister, :pin_playlist_no_native_row

                iget-object v$contextOrListRegister, p0, $flyoutContextFieldDescriptor
                invoke-static/range {v$contextOrListRegister .. v$contextOrListRegister}, $EXTENSION_CLASS->getActiveFlyoutMenuTitle(Landroid/content/Context;)Ljava/lang/String;
                move-result-object v$titleRegister
                if-eqz v$titleRegister, :pin_playlist_no_native_row

                invoke-static/range {v$titleRegister .. v$titleRegister}, $nativeTitleFactoryDescriptor
                move-result-object v$titleRegister
                if-eqz v$titleRegister, :pin_playlist_no_native_row

                invoke-static/range {v$contextOrListRegister .. v$playlistIdOrItemRegister}, $nativeRowFactoryDescriptor
                move-result-object v$playlistIdOrItemRegister
                if-eqz v$playlistIdOrItemRegister, :pin_playlist_no_native_row

                move-object/from16 v$contextOrListRegister, v$normalizationResultRegister
                invoke-static/range {v$contextOrListRegister .. v$titleRegister}, $EXTENSION_CLASS->insertNativePinMenuItem(Ljava/util/List;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/List;
                move-result-object v$normalizationResultRegister
            """,
            ExternalLabel(
                "pin_playlist_no_native_row",
                nativeNormalizationContinuation
            )
        )

    }

    finalize {
        /*
         * Every extension is merged during patch execution before any patch
         * finalizer runs. Locate Morphe's preference fragment structurally by
         * the resource name it inflates, then install the standalone settings
         * path immediately after addPreferencesFromResource().
         *
         * If no Morphe settings host is present, the Pin playlists feature
         * remains functional with its default settings and this optional UI
         * bridge is simply not installed.
         */
        val settingsClass =
            classDefByStrings("morphe_prefs_icons_bold")
                .singleOrNull { classDef ->
                    classDef.methods.any { method ->
                        method.parameters.isEmpty() &&
                            method.returnType == "V" &&
                            method.implementation?.instructions?.any { instruction ->
                                val reference =
                                    (instruction as? ReferenceInstruction)
                                        ?.reference as? MethodReference

                                reference?.name == "addPreferencesFromResource" &&
                                    reference.parameterTypes
                                        .map { it.toString() } == listOf("I") &&
                                    reference.returnType == "V"
                            } == true
                    }
                } ?: return@finalize

        val initializeMethod = settingsClass.methods.singleOrNull { method ->
            method.parameters.isEmpty() &&
                method.returnType == "V" &&
                method.implementation?.instructions?.any { instruction ->
                    val reference =
                        (instruction as? ReferenceInstruction)
                            ?.reference as? MethodReference

                    reference?.name == "addPreferencesFromResource" &&
                        reference.parameterTypes
                            .map { it.toString() } == listOf("I") &&
                        reference.returnType == "V"
                } == true
        } ?: return@finalize

        val mutableInitializeMethod =
            mutableClassDefBy(settingsClass).methods.single { method ->
                method.name == initializeMethod.name &&
                    method.parameters.map { it.type } ==
                        initializeMethod.parameters.map { it.type } &&
                    method.returnType == initializeMethod.returnType
            }

        val alreadyInstalled =
            mutableInitializeMethod.implementation!!.instructions.any { instruction ->
                val reference =
                    (instruction as? ReferenceInstruction)
                        ?.reference as? MethodReference

                reference?.definingClass == SETTINGS_CLASS &&
                    reference.name == "installPreferencePath" &&
                    reference.parameterTypes
                        .map { it.toString() } ==
                        listOf("Ljava/lang/Object;") &&
                    reference.returnType == "V"
            }

        if (alreadyInstalled) return@finalize

        val addPreferencesIndex =
            mutableInitializeMethod.implementation!!.instructions
                .withIndex()
                .single { indexed ->
                    val reference =
                        (indexed.value as? ReferenceInstruction)
                            ?.reference as? MethodReference

                    reference?.name == "addPreferencesFromResource" &&
                        reference.parameterTypes
                            .map { it.toString() } == listOf("I") &&
                        reference.returnType == "V"
                }
                .index

        mutableInitializeMethod.addInstructions(
            addPreferencesIndex + 1,
            "invoke-static { p0 }, " +
                "$SETTINGS_CLASS->installPreferencePath(Ljava/lang/Object;)V"
        )
    }
}
