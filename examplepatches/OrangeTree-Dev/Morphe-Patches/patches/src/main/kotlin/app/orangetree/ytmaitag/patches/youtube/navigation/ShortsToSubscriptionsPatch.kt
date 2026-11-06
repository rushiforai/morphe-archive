package app.orangetree.ytmaitag.patches.youtube.navigation

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.orangetree.ytmaitag.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val EXTENSION_CLASS =
    "Lapp/orangetree/ytmaitag/extension/ShortsToSubscriptionsPatch;"

private const val EXTENSION_PIVOT_BAR_ITEM_INTERFACE =
    "Lapp/orangetree/ytmaitag/extension/ShortsToSubscriptionsPatch\$PivotBarItem;"

/**
 * Extension method whose body is replaced, so the extension can create a navigation bar item.
 */
private object CreateSubscriptionsItemFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS,
    name = "createSubscriptionsItem",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "I")
)

@Suppress("unused")
val shortsToSubscriptionsPatch = bytecodePatch(
    name = "Shorts to Subscriptions",
    description = "Replaces the Shorts button in the bottom navigation bar with a Subscriptions button.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    extendWith("extensions/extension.mpe")

    execute {
        // region Let the extension read the proto of navigation bar items.

        PivotBarRendererFingerprint.let { match ->
            match.classDef.apply {
                val messageLiteField = fields.first { field ->
                    field.type == "Lcom/google/protobuf/MessageLite;"
                }
                // The field can also hold PivotBarIconOnlyItemRenderer or other renderers.
                val pivotBarItemRendererType = match.instructionMatches[2]
                    .instruction.getReference<TypeReference>()!!.type

                interfaces.add(EXTENSION_PIVOT_BAR_ITEM_INTERFACE)
                methods.add(
                    ImmutableMethod(
                        type,
                        "orangetree_getPivotBarItemRendererBytes",
                        listOf(),
                        "[B",
                        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                        null,
                        null,
                        MutableMethodImplementation(3),
                    ).toMutable().apply {
                        addInstructionsWithLabels(
                            0,
                            """
                                iget-object v0, p0, $messageLiteField
                                instance-of v1, v0, $pivotBarItemRendererType
                                if-eqz v1, :not_renderer
                                invoke-interface { v0 }, Lcom/google/protobuf/MessageLite;->toByteArray()[B
                                move-result-object v0
                                return-object v0
                                :not_renderer
                                const/4 v0, 0x0
                                return-object v0
                            """
                        )
                    }
                )
            }
        }

        // endregion

        // region Let the extension create a Subscriptions navigation bar item.

        val factoryMethod = PivotBarItemProtoFactoryFingerprint.method
        val iconType = factoryMethod.parameterTypes[2].toString()
        // Enum constant names are obfuscated, so the icon type is found by its value.
        val iconTypeLookupMethod = Fingerprint(
            definingClass = iconType,
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
            returnType = iconType,
            parameters = listOf("I")
        ).originalMethod
        val optionalType = PivotBarRendererFingerprint.method.returnType
        // Newer app versions have a boolean parameter at the end.
        val hasBooleanParameter = factoryMethod.parameterTypes.size == 4

        CreateSubscriptionsItemFingerprint.let { stub ->
            val stubMethod = stub.method
            stub.classDef.methods.apply {
                remove(stubMethod)
                add(
                    ImmutableMethod(
                        stubMethod.definingClass,
                        stubMethod.name,
                        listOf(
                            ImmutableMethodParameter("Ljava/lang/String;", null, null),
                            ImmutableMethodParameter("Ljava/lang/String;", null, null),
                            ImmutableMethodParameter("I", null, null),
                        ),
                        stubMethod.returnType,
                        AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                        null,
                        null,
                        // 3 locals and 3 parameters.
                        MutableMethodImplementation(6),
                    ).toMutable().apply {
                        val factoryCall = if (hasBooleanParameter) {
                            """
                                const/4 v1, 0x0
                                invoke-static { p0, p1, v0, v1 }, $factoryMethod
                            """
                        } else {
                            "invoke-static { p0, p1, v0 }, $factoryMethod"
                        }

                        addInstructions(
                            0,
                            """
                                invoke-static { p2 }, $iconTypeLookupMethod
                                move-result-object v0
                                $factoryCall
                                move-result-object v0
                                invoke-static { v0 }, ${PivotBarRendererFingerprint.method}
                                move-result-object v0
                                const/4 v1, 0x0
                                invoke-virtual { v0, v1 }, $optionalType->orElse(Ljava/lang/Object;)Ljava/lang/Object;
                                move-result-object v0
                                return-object v0
                            """
                        )
                    }
                )
            }
        }

        // endregion

        // region Swap the items when the navigation bar list is stored.

        PivotBarRendererListFingerprint.let {
            it.method.apply {
                val insertMatch = it.instructionMatches[2]
                val insertIndex = insertMatch.index
                val listRegister = getInstruction<TwoRegisterInstruction>(insertIndex).registerA

                val listType = insertMatch.instruction.getReference<FieldReference>()!!.type
                val listBuilderMethod = Fingerprint(
                    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
                    returnType = listType,
                    parameters = listOf("Ljava/util/Collection;")
                ).method

                val freeRegister = findFreeRegister(insertIndex, listRegister)

                addInstructionsWithLabels(
                    insertIndex,
                    """
                        invoke-static/range { v$listRegister .. v$listRegister }, $EXTENSION_CLASS->swapShortsWithSubscriptions(Ljava/util/List;)Ljava/util/List;
                        move-result-object v$freeRegister
                        if-eqz v$freeRegister, :orangetree_keep_list
                        invoke-static/range { v$freeRegister .. v$freeRegister }, $listBuilderMethod
                        move-result-object v$listRegister
                        :orangetree_keep_list
                        nop
                    """
                )
            }
        }

        // endregion
    }
}
