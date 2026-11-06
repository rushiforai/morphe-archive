/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3768
 * https://github.com/MorpheApp/morphe-patches/pull/3769
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-10-29
 */

package app.morphe.patches.youtube.feed.cardlayout

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.shared.drawable.addDrawableColorHook
import app.morphe.patches.shared.drawable.drawableColorHookPatch
import app.morphe.patches.shared.litho.relayout.COMPONENT_HOST_CLASS
import app.morphe.patches.shared.misc.fix.proto.fixProtoLibraryPatch
import app.morphe.patches.shared.misc.fix.proto.parseByteArrayWithRegistryMethodRef
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.extension.Constants.FEED_PATH
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.patch.PatchList.FEED_CARD_LAYOUT
import app.morphe.patches.youtube.utils.proto.elementProtoParserHookPatch
import app.morphe.patches.youtube.utils.proto.hookElement
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.settingsPatch
import app.morphe.util.Utils.printWarn
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstruction
import app.morphe.util.indexOfFirstInstructionReversedOrThrow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val EXTENSION_CLASS = "$FEED_PATH/FeedCardLayoutPatch;"

private const val EXTENSION_ELEMENT_ITEM_INTERFACE = $$"$$FEED_PATH/FeedCardLayoutPatch$ElementItemInterface;"

private const val RECYCLER_VIEW_CLASS = "Landroid/support/v7/widget/RecyclerView;"

private object CardHostDrawFingerprint : Fingerprint(
    definingClass = COMPONENT_HOST_CLASS,
    name = "dispatchDraw",
    returnType = "V",
    parameters = listOf("Landroid/graphics/Canvas;"),
)

/**
 * Litho mounts backgrounds as drawables, not View backgrounds. Follow the drawing helper referenced
 * by ComponentHost rather than its obfuscated name, and tint each background just before it is drawn.
 */
private fun BytecodePatchContext.hookMountedCardBackgrounds() {
    val hostDraw = CardHostDrawFingerprint.methodOrNull
    val helperClass = hostDraw?.implementation?.instructions?.firstNotNullOfOrNull { instruction ->
        val field = instruction.getReference<FieldReference>() ?: return@firstNotNullOfOrNull null
        if (field.definingClass != COMPONENT_HOST_CLASS) return@firstNotNullOfOrNull null

        classDefByOrNull(field.type)?.takeIf { candidate ->
            candidate.fields.any { it.type == "Landroid/graphics/Canvas;" } &&
                    candidate.fields.any { it.type == COMPONENT_HOST_CLASS }
        }
    }
    val drawableDraw = "Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V"
    val helperDrawsBackgrounds = helperClass?.methods?.any { method ->
        method.implementation?.instructions?.any {
            it.getReference<MethodReference>()?.toString() == drawableDraw
        } == true
    } == true

    if (hostDraw == null || helperClass == null || !helperDrawsBackgrounds) {
        printWarn("Feed card layout: mounted card backgrounds not found; keeping their original colors.")
        return
    }

    for (type in listOf(COMPONENT_HOST_CLASS, helperClass.type)) {
        mutableClassDefBy(type).methods.forEach { method ->
            val drawIndices = method.implementation?.instructions?.withIndex()?.filter {
                it.value.opcode == Opcode.INVOKE_VIRTUAL &&
                        it.value.getReference<MethodReference>()?.toString() == drawableDraw
            }?.map { it.index }.orEmpty()

            drawIndices.asReversed().forEach { index ->
                val drawableRegister = method.getInstruction<FiveRegisterInstruction>(index).registerC
                method.addInstruction(
                    index,
                    "invoke-static/range { v$drawableRegister .. v$drawableRegister }, " +
                            "$EXTENSION_CLASS->onCardDrawableDraw(Landroid/graphics/drawable/Drawable;)V"
                )
            }
        }
    }
}

/**
 * Calls the extension method with the list and the parameter at the start of a method of the list,
 * which overrides a method of ViewGroup. If the list doesn't override the method, the method is added
 * and calls the method of ViewGroup first.
 */
private fun MutableClass.hookViewGroupMethod(name: String, parameterType: String, extensionMethodName: String) {
    val extensionMethod = "$EXTENSION_CLASS->$extensionMethodName($RECYCLER_VIEW_CLASS$parameterType)V"
    val method = methods.firstOrNull { method ->
        method.name == name && method.returnType == "V" && method.parameterTypes == listOf(parameterType)
    }

    if (method != null) {
        method.addInstruction(0, "invoke-static/range { p0 .. p1 }, $extensionMethod")
        return
    }

    methods.add(
        ImmutableMethod(
            type,
            name,
            listOf(ImmutableMethodParameter(parameterType, null, null)),
            "V",
            AccessFlags.PUBLIC.value,
            null,
            null,
            MutableMethodImplementation(2),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                    invoke-super { p0, p1 }, Landroid/view/ViewGroup;->$name($parameterType)V
                    invoke-static { p0, p1 }, $extensionMethod
                    return-void
                """
            )
        }
    )
}

@Suppress("unused")
val feedCardLayoutPatch = bytecodePatch(
    name = FEED_CARD_LAYOUT.title,
    description = FEED_CARD_LAYOUT.summary,
) {
    dependsOn(
        sharedExtensionPatch,
        fixProtoLibraryPatch,
        settingsPatch,
        elementProtoParserHookPatch,
        drawableColorHookPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        addPreference(
            arrayOf(
                "PREFERENCE_SCREEN: FEED",
                "SETTINGS: FEED_CARD_LAYOUT"
            ),
            FEED_CARD_LAYOUT
        )

        // The layout is chosen by the experiments that the server sends in the context of every element.
        hookElement("$EXTENSION_CLASS->setFeedCardLayout([B)[B")

        // The theme patch changes the background of the cards to the background color of the feed.
        // The hook runs before the theme hook, with the original color.
        addDrawableColorHook(
            "$EXTENSION_CLASS->getCardColor(Landroid/graphics/drawable/Drawable;I)I",
            highPriority = true,
            passDrawable = true,
        )

        // Some lists, such as the Home feed, add a spacing between the items, and the cards have their own spacing.
        // The item is replaced by an item without spacing.
        var adapterPositionMethod: MethodReference? = null
        DividerInfoToStringFingerprint.originalClassDefOrNull?.let { dividerInfoClass ->
            DividerInfoLookupFingerprint(dividerInfoClass.type).methodOrNull?.let { dividerInfoLookupMethod ->
                // The header of a horizontal shelf has the label that finds the shelf in the list, and it is
                // not mounted while it is scrolled out of the list. The shelves are also found by their element,
                // which the list looks up with the view of the item when it sets the spacing of the item.
                DividerItemOffsetsFingerprint(dividerInfoLookupMethod).let {
                    it.methodOrNull?.apply {
                        val lookupIndex = it.instructionMatches.first().index
                        val itemRegister = getInstruction<FiveRegisterInstruction>(lookupIndex).registerD

                        // The item is replaced at the lookup of this list, so the other lookups of the item
                        // keep the spacing of the item.
                        addInstructions(
                            lookupIndex,
                            "invoke-static/range { v$itemRegister .. v$itemRegister }, " +
                                    "$EXTENSION_CLASS->setDividerItem(Ljava/lang/Object;)V\n" +
                                    "invoke-static/range { v$itemRegister .. v$itemRegister }, " +
                                    "$EXTENSION_CLASS->getDividerItem" +
                                    "(Ljava/lang/Object;)Ljava/lang/Object;\n" +
                                    "move-result-object v$itemRegister"
                        )
                        addInstruction(
                            0,
                            "invoke-static { p1, p2 }, " +
                                    "$EXTENSION_CLASS->setDividerItemView(" +
                                    "Landroid/graphics/Rect;Landroid/view/View;)V"
                        )

                        // The spacing of the item is set at the end of the method, after the spacing of the list,
                        // and the item above it is found with its position, which the list looks up with a method
                        // that is obfuscated.
                        val positionIndex = indexOfFirstInstruction {
                            opcode == Opcode.INVOKE_VIRTUAL &&
                                    getReference<MethodReference>()?.let { reference ->
                                        reference.definingClass == RECYCLER_VIEW_CLASS &&
                                                reference.returnType == "I" &&
                                                reference.parameterTypes.singleOrNull()?.toString() ==
                                                "Landroid/view/View;"
                                    } == true
                        }

                        if (positionIndex >= 0) {
                            adapterPositionMethod = getInstruction(positionIndex).getReference<MethodReference>()

                            addInstruction(
                                0,
                                "invoke-static {}, $EXTENSION_CLASS->markFeedSpacingAvailable()V"
                            )
                        }
                    }
                }
            }

            // The cards are found by the bytes of their element.
            ElementItemConstructorFingerprint.let {
                val elementBytesField = it.instructionMatches[1].getFieldAccessed()

                it.classDef.apply {
                    interfaces.add(EXTENSION_ELEMENT_ITEM_INTERFACE)

                    methods.add(
                        ImmutableMethod(
                            type,
                            "patch_getElementBytes",
                            listOf(),
                            "[B",
                            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                            null,
                            null,
                            MutableMethodImplementation(2),
                        ).toMutable().apply {
                            addInstructions(
                                0,
                                """
                                    iget-object v0, p0, $elementBytesField
                                    return-object v0
                                """
                            )
                        }
                    )
                }
            }
        }

        mutableClassDefBy(RECYCLER_VIEW_CLASS).apply {
            // The extension gets the position of an item, which the class looks up with a method
            // that is obfuscated.
            adapterPositionMethod?.let { positionMethod ->
                methods.add(
                    ImmutableMethod(
                        type,
                        "patch_getChildAdapterPosition",
                        listOf(
                            ImmutableMethodParameter(RECYCLER_VIEW_CLASS, null, null),
                            ImmutableMethodParameter("Landroid/view/View;", null, null),
                        ),
                        "I",
                        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                        null,
                        null,
                        MutableMethodImplementation(3),
                    ).toMutable().apply {
                        addInstructions(
                            0,
                            """
                                invoke-virtual {p0, p1}, $positionMethod
                                move-result v0
                                return v0
                            """
                        )
                    }
                )
            }

            // The cards have rounded corners, which are not part of the element.
            hookViewGroupMethod("onViewAdded", "Landroid/view/View;", "onChildAdded")

            // The Shorts shelf and the horizontal shelves have the background of the cards, which the list draws
            // below its items, because the views of the elements reset their own background.
            hookViewGroupMethod("onDraw", "Landroid/graphics/Canvas;", "onListDraw")
        }

        hookMountedCardBackgrounds()

        // The comment button opens the video, and the comments are opened when the watch page is ready.
        VideoPlaybackIntentFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p1 .. p2 }, " +
                    "$EXTENSION_CLASS->onWatchCommand(Ljava/lang/Object;Ljava/util/Map;)V"
        )

        val uiReadyCommandMethod = PlayerPopupPanelsFingerprint.method
        val commandType = uiReadyCommandMethod.parameterTypes.first().toString()
        val commandDefaultInstance = classDefBy(commandType).fields.single {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.type == commandType
        }
        // The command executor of the method, and its method that runs a command.
        val (executorField, executeMethod) = uiReadyCommandMethod.let {
            val executeIndex = it.indexOfFirstInstructionReversedOrThrow(Opcode.INVOKE_INTERFACE)
            val executorIndex = it.indexOfFirstInstructionReversedOrThrow(executeIndex, Opcode.IGET_OBJECT)

            Pair(
                it.getInstruction(executorIndex).getReference<FieldReference>()!!,
                it.getInstruction(executeIndex).getReference<MethodReference>()!!
            )
        }

        WatchNextUiReadyFingerprint(uiReadyCommandMethod).let {
            it.method.apply {
                val responseField = it.instructionMatches.first().getFieldAccessed()
                val uiReadyCommandField = it.instructionMatches[3].getFieldAccessed()
                val parameterType = parameterTypes.first().toString()

                it.classDef.methods.add(
                    ImmutableMethod(
                        definingClass,
                        "patch_openFeedCardComments",
                        listOf(ImmutableMethodParameter(parameterType, null, null)),
                        "V",
                        AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
                        null,
                        null,
                        MutableMethodImplementation(5),
                    ).toMutable().apply {
                        addInstructionsWithLabels(
                            0,
                            """
                                if-eqz p1, :exit
                                iget-object v0, p1, $responseField
                                invoke-static { v0 }, $EXTENSION_CLASS->getCommentsCommand(Ljava/lang/Object;)[B
                                move-result-object v1
                                if-eqz v1, :exit

                                # Parse the command with the extensions of the app.
                                sget-object v0, $commandDefaultInstance
                                invoke-static { }, Lcom/google/protobuf/ExtensionRegistryLite;->getGeneratedRegistry()Lcom/google/protobuf/ExtensionRegistryLite;
                                move-result-object v2
                                invoke-static { v0, v1, v2 }, ${parseByteArrayWithRegistryMethodRef.get()!!}
                                move-result-object v0
                                check-cast v0, $commandType

                                # Run the command, without the popup panel checks of the watch next command.
                                new-instance v1, Ljava/util/HashMap;
                                invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
                                iget-object v2, p0, $uiReadyCommandField
                                iget-object v2, v2, $executorField
                                check-cast v2, ${executeMethod.definingClass}
                                invoke-interface { v2, v0, v1 }, $executeMethod

                                :exit
                                return-void
                            """
                        )
                    }
                )

                addInstruction(
                    0,
                    "invoke-direct/range { p0 .. p1 }, $definingClass->patch_openFeedCardComments($parameterType)V"
                )
            }
        }
    }
}
