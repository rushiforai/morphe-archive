package slick.android

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val OBJ = "(Ljava/lang/Object;)Ljava/lang/Object;"
private const val RESULT = "move-result-object v0"

val nativeFeatures =
    bytecodePatch {
        dependsOn(modMenu)
        execute {
            val stateMethod =
                findMethod("stateFromTs") {
                    it.parameterTypes == listOf("Lslack/model/Message;") &&
                        it.returnType == "Lslack/model/MessageState;" && it.accessFlags and 0x8 != 0
                }
            method("Lslick/android/Host;", "messageState").run {
                removeInstructions(0, code.size)
                addInstructions(
                    0,
                    """
                    check-cast p0, Lslack/model/Message;
                    invoke-static {p0}, $stateMethod
                    move-result-object p0
                    return-object p0
                    """,
                )
            }
            val compat = "Landroidx/core/content/res/ResourcesCompat;"
            method("Landroidx/compose/ui/text/font/FontFamilyResolverImpl;", "resolve") {
                it.parameterTypes == listOf("Landroidx/compose/ui/text/font/TypefaceRequest;")
            }.run {
                check(registers == 6)
                intercept(
                    "invoke-static {p1}, Lslick/android/Fonts;->compose$OBJ\n$RESULT",
                    "check-cast v0, Landroidx/compose/ui/text/font/TypefaceResult;\nreturn-object v0",
                )
            }
            method(compat, "getFont") { it.parameterTypes == listOf("I", "Landroid/content/Context;") }.run {
                check(registers == 9)
                intercept(
                    "invoke-static/range {p0 .. p1}, Lslick/android/Fonts;->resource(ILandroid/content/Context;)Landroid/graphics/Typeface;\n$RESULT",
                    "return-object v0",
                )
            }
            method(compat, "loadFont").run {
                val callback = parameterTypes.getOrNull(4)?.toString()
                check(
                    parameterTypes.take(4) ==
                        listOf(
                            "Landroid/content/Context;",
                            "I",
                            "Landroid/util/TypedValue;",
                            "I",
                        ) &&
                        parameterTypes.drop(5) == listOf("Z", "Z") &&
                        callback?.startsWith("L") == true && returnType == "Landroid/graphics/Typeface;",
                ) { "Unexpected font loader signature: $parameterTypes -> $returnType" }
                check(
                    classDefBy(callback!!).methods.any {
                        it.name == "onFontRetrieved" && it.parameterTypes == listOf("Landroid/graphics/Typeface;") && it.returnType == "V"
                    },
                ) { "Font callback contract changed: $callback" }
                check(registers == 19) { "Font loader register layout changed: $registers" }
                intercept(
                    "invoke-static/range {p0 .. p6}, Lslick/android/Fonts;->load(Landroid/content/Context;ILandroid/util/TypedValue;ILjava/lang/Object;ZZ)Landroid/graphics/Typeface;\n$RESULT",
                    "return-object v0",
                )
            }
            method("Lslack/theming/darkmode/DarkModeHelperImpl;", "isTrueDarkMode") { it.parameterTypes.isEmpty() }.run {
                check(registers > 1)
                intercept("invoke-static {}, Lslick/android/Features;->amoled()Z\nmove-result v0", "return v0")
            }

            method("Lslack/theming/ThemeOverlays;", "<init>").run {
                check(parameterTypes == List(10) { "Ljava/lang/Integer;" } + "I")
                addInstructions(0, wrap("p9", "Appearance;->overlay(Ljava/lang/Integer;)Ljava/lang/Integer;"))
            }
            method("Lcom/google/android/material/bottomsheet/BottomSheetDialog;", "<init>").run {
                check(parameterTypes == listOf("Landroid/content/Context;", "I"))
                addInstructions(
                    code.indexOfLast { it.opcode == Opcode.RETURN_VOID },
                    call("p0", "Appearance;->sheet(Landroid/app/Dialog;)V"),
                )
            }

            method("Lslack/uikit/components/bottomsheet/compose/SKBottomSheetKt;", "getSKBottomSheetDefaultContainerColor").run {
                check(registers == 3)
                intercept(
                    """
                invoke-static {p0}, Lslack/kit/usertheme/SlackTheme;->isDarkTheme(Landroidx/compose/runtime/Composer;)Z
                move-result v0
                invoke-static {v0}, Lslick/android/Appearance;->blackSheet(Z)Z
                move-result v0
            """,
                    "const-wide/high16 v0, -0x100000000000000L\nreturn-wide v0",
                )
            }

            method("Lslack/home/header/components/WorkspaceItemKt;", "WorkspaceItem").run {
                val (i, x) =
                    indexed { x ->
                        val f = x.field
                        x.opcode == Opcode.IGET_OBJECT &&
                            f?.definingClass == "Lslack/home/header/components/WorkspaceItemState\$WorkspaceData;" && f.name == "title"
                    }.one()
                addInstructions(i + 1, wrap("v${x.reg}", "Appearance;->headerTitle(Ljava/lang/String;)Ljava/lang/String;"))
            }
            method("Lslack/kit/usertheme/SlackThemeKt\$\$ExternalSyntheticLambda2;", "invoke").run {
                val palettes = setOf("SKColorSetDark", "SKColorSetTrueDark", "SKColorSetHighContrastDark")
                indexed { x ->
                    val f = x.field
                    x.opcode == Opcode.SGET_OBJECT && f?.definingClass == "Lslack/kit/usertheme/SKColorSetKt;" && f.name in palettes
                }.also { check(it.size == 3) }.reversed().forEach { (i, x) ->
                    addInstructions(i + 1, wrap("v${x.reg}", "Appearance;->core$OBJ", "Lslack/kit/usertheme/SKColorSet;"))
                }
            }
            method("Lslack/theming/ThemeValuesColorSetsKt;", "colorSetForDark").run {
                // Keep branch targets on the hook, including Slack's shared return label.
                indexed(Opcode.RETURN_OBJECT).reversed().forEach { (i, x) ->
                    wrapReturn(i, x.reg, "Appearance;->compose", "Lslack/kit/usertheme/SKThemeColorSet;")
                }
            }

            // R8 merged the user-header renderer into this coroutine. Hook only its header branch.
            method("Lslack/reactorsview/ReactorsViewDataProviderImpl\$invoke\$2;", "invokeSuspend").run {
                check(parameterTypes == listOf("Ljava/lang/Object;") && returnType == "Ljava/lang/Object;")
                val (end, badge) =
                    indexed {
                        it.opcode == Opcode.IGET_OBJECT &&
                            it.field?.definingClass == "Lslack/messagerendering/impl/binders/HeaderBindingMetadata;" &&
                            it.field?.name == "guestBadgeVerified"
                    }.one()
                val start = code.take(end).indexOfLast { it.opcode == Opcode.CHECK_CAST && it.cast == "Lslack/messagerendering/impl/binders/HeaderBindingMetadata;" }
                check(start >= 0)
                val binding = code[start].reg
                check((badge as TwoRegisterInstruction).registerB == binding)
                val views =
                    (start until end)
                        .map { code[it] }
                        .single {
                            it.opcode == Opcode.CHECK_CAST && it.cast == "Lslack/messagerendering/api/binders/MessageHeaderBinder\$HeaderViews;"
                        }.reg
                val metadata =
                    (start until end).single {
                        code[it].opcode == Opcode.CHECK_CAST && code[it].cast == "Lslack/messagerendering/model/MessageMetadata;"
                    }
                addInstructions(
                    metadata + 1,
                    "invoke-static {v$views, v${code[metadata].reg}, v$binding}, Lslick/android/Features;->timestampPronouns(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V",
                )
            }

            val messages = "Lslack/services/messages/delegate/MessagesDelegateImpl;"
            method(messages, "updateChannel").run {
                check(parameterTypes.first() == "Lslack/messagerendering/model/ChannelMetadata;")
                addInstructions(
                    0,
                    "invoke-static/range {p0 .. p1}, Lslick/android/InlineHistory;->channel(Ljava/lang/Object;Ljava/lang/Object;)V",
                )
            }
            method(messages, "updateData").run {
                check(parameterTypes == listOf("Ljava/lang/String;", "Ljava/util/List;"))
                addInstructions(
                    0,
                    "invoke-static/range {p0 .. p2}, Lslick/android/InlineHistory;->messages(Ljava/lang/Object;Ljava/lang/String;Ljava/util/List;)Ljava/util/List;\nmove-result-object p2",
                )
            }
            method("Lslack/services/messages/delegate/adapters/BaseMessagesAdapter;", "setMessages").run {
                check(parameterTypes == listOf("Ljava/util/List;", "Z"))
                addInstructions(
                    0,
                    "invoke-static/range {p0 .. p2}, Lslick/android/InlineHistory;->thread(Ljava/lang/Object;Ljava/util/List;Z)Ljava/util/List;\nmove-result-object p1",
                )
            }

            for ((name, count, hook) in listOf(
                Triple(
                    "loadedMessageRows",
                    13,
                    "invoke-static/range {p0 .. p5}, Lslick/android/InlineHistory;->threadLoaded(Ljava/lang/Object;IIILjava/util/List;Z)Z",
                ),
                Triple(
                    "removeMessageRows",
                    8,
                    "invoke-static {p0, p1}, Lslick/android/InlineHistory;->threadUpdate(Ljava/lang/Object;Ljava/util/List;)Z",
                ),
            )) {
                method("Lslack/features/messagepane/MessagesFragment\$onResume\$3;", name).run {
                    check(registers == count)
                    check(
                        parameterTypes ==
                            if (count == 13) listOf("I", "I", "I", "Ljava/util/List;", "Z") else listOf("Ljava/util/List;", "I", "I"),
                    )
                    intercept("$hook\nmove-result v0", "return-void")
                }
            }

            for ((type, holder) in listOf(
                "Lslack/messagerendering/impl/viewbinders/MessageViewBinderImpl;" to
                    "Lslack/messagerendering/api/viewholders/BaseViewHolder;",
                "Lslack/features/messagedetails/messages/viewbinders/MessageDetailsViewBinder;" to
                    "Lslack/features/messagedetails/messages/viewholders/MessageDetailsViewHolder;",
            )) {
                method(type, "bind") { it.parameterTypes.first() == holder }
                    .addInstructions(
                        0,
                        "invoke-static/range {p1 .. p2}, Lslick/android/InlineEdits;->bind(Ljava/lang/Object;Ljava/lang/Object;)V",
                    )
            }

            val reactionView = "Lslack/widgets/messages/reactions/ReactionView;"
            method(reactionView, "updateReaction").run {
                val (i) =
                    indexed { x ->
                        val f = x.field
                        x.opcode == Opcode.IPUT_OBJECT && f?.definingClass == reactionView && f.name == "viewModel"
                    }.one()
                check(code[i + 1].opcode == Opcode.RETURN_VOID)
                addInstructions(i + 1, call("p0", "Reactors;->bind(Ljava/lang/Object;)V"))
            }
            method("Lslack/corelib/repository/member/UserRepositoryImpl;", "<init>").run {
                addInstructions(code.indexOfLast { it.opcode == Opcode.RETURN_VOID }, call("p0", "Reactors;->repository(Ljava/lang/Object;)V"))
            }

            // Rewrite upload metadata, never the local path or bytes read from it.
            val anonymous = { p: String -> wrap(p, "Features;->anonymousName(Ljava/lang/String;)Ljava/lang/String;") }
            for ((type, parameters) in listOf(
                "Lslack/services/fileupload/commons/model/FileMeta;" to listOf(1),
                "Lslack/api/files/request/PartialFileUpload;" to listOf(5),
                "Lslack/http/api/request/FileUpload;" to listOf(5),
                "Lslack/api/methods/files/CompleteUploadRequest\$Files;" to listOf(2),
                "Lslack/api/methods/files/GetUploadURLForFileStoreRequest\$Files;" to listOf(1),
                "Lslack/api/methods/files/CompleteUploadForFileStoreRequest\$Files;" to listOf(2, 3),
            )) {
                method(type, "<init>").let { m -> parameters.forEach { m.addInstructions(0, anonymous("p$it")) } }
            }
            method("Lslack/fileupload/uploader/ConsolidatedFilesApiImpl;", "getUploadURL").run {
                check(parameterTypes.take(2) == listOf("J", "Ljava/lang/String;"))
                addInstructions(0, anonymous("p3"))
            }

            val handler = mutableClassDefBy("Lslack/services/messages/eventhandlers/MessageEventHandler;")
            method(
                "Lslack/intune/NoOpIntuneIntegration\$\$ExternalSyntheticLambda0;",
                "invoke\$slack\$messages\$impl\$v2\$MessageRangeTransactionDaoImpl\$persistMessagesAndRanges\$2\$\$ExternalSyntheticLambda0",
            ).run {
                check(registers == 18)
                val (i, x) =
                    indexed { it.opcode == Opcode.CHECK_CAST && it.cast == "Lslack/persistence/messages/MessageHistoryChunk;" }
                        .one()
                check(x.reg == 2)
                // Pinned transaction locals: owner v3, chunk v2, nullable thread v9, trace v11.
                addInstructions(
                    i + 1,
                    "invoke-static {v3, v2, v9, v11}, Lslick/android/Archive;->history(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V",
                )
            }
            for ((name, type, callback) in listOf(
                Triple("onNewMessage", "Lslack/model/Message;", "newMessage"),
                Triple("updateMessage", "Lslack/corelib/rtm/msevents/MessageChangedEvent;", "changed"),
                Triple("removeMessage", "Lslack/corelib/rtm/msevents/MessageDeletedEvent;", "deleted"),
            )) {
                handler.methods.single { it.name == name }.run {
                    val i = code.indexOfFirst { it.opcode == Opcode.CHECK_CAST && it.cast == type }
                    check(i >= 0)
                    addInstructions(i + 1, call("v${code[i].reg}", "Archive;->$callback(Ljava/lang/Object;)V"))
                    addInstructions(0, call("p0", "Archive;->begin(Ljava/lang/Object;)V"))
                }
            }
        }
    }
