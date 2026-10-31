package app.ahmedyarub.patches.x.timeline

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_X
import app.ahmedyarub.patches.x.shared.EXTENSION_PACKAGE
import app.ahmedyarub.patches.x.shared.featureFlagsPatch
import app.ahmedyarub.patches.x.shared.forceFeatureFlag
import app.ahmedyarub.patches.x.shared.xExtensionPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val STATEFUL_FOLLOW_BUTTON = "android_x_lite_stateful_follow_button_enabled"
private const val FOLLOW_BUTTON_CLASS = "$EXTENSION_PACKAGE/FollowButton;"
private const val COMPOSER = "Landroidx/compose/runtime/Composer;"
private const val MODIFIER = "Landroidx/compose/ui/Modifier;"
private const val HELPER = "morpheFollowButton"

/**
 * The focal post's presenter, which works out the follow button its header shows for the author:
 * none for your own posts or authors you follow (or have asked to follow), the author's follow
 * state otherwise, and Following only for authors followed from that very button. Timeline
 * posts have no follow button at all.
 */
private object PostPresenterFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Landroidx/compose/runtime/Composer;", "I"),
    strings = listOf(STATEFUL_FOLLOW_BUTTON, "xchat_post_details_enabled"),
)

private fun Instruction.methodRef() = getReference<MethodReference>()
private fun MethodReference.params() = parameterTypes.map { it.toString() }

@Suppress("unused")
val followButtonOnPostsPatch = bytecodePatch(
    name = "Follow button on posts",
    description = "Shows a Follow / Following button at the top right of every post that is not yours, " +
        "in timelines and threads. Tapping it follows or unfollows the author.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(xExtensionPatch, featureFlagsPatch)

    execute {
        // The button keeps showing Following after a tap rather than disappearing.
        forceFeatureFlag(STATEFUL_FOLLOW_BUTTON, true)

        val presenter = PostPresenterFingerprint.method
        val presenterInstructions = presenter.instructions.toList()
        val flagIndex = presenterInstructions.indexOfFirst {
            it.getReference<StringReference>()?.string == STATEFUL_FOLLOW_BUTTON
        }
        // The author's follow state is compared with Following right after the presenter checks
        // whether the author is followed or requested.
        val followingIndex = presenterInstructions.withIndex().indexOfFirst { (index, instruction) ->
            index > flagIndex && instruction.opcode == Opcode.SGET_OBJECT &&
                instruction.getReference<FieldReference>()?.name == "Following"
        }
        if (flagIndex < 0 || followingIndex < 0) throw PatchException("The post presenter never checks for Following")

        // region The model the presenter works with

        val followState = presenterInstructions[followingIndex].getReference<FieldReference>()!!.definingClass
        val stateOf = presenterInstructions.first { instruction ->
            instruction.opcode == Opcode.INVOKE_STATIC &&
                instruction.methodRef()?.let { it.returnType == followState && it.parameterTypes.size == 1 } == true
        }.methodRef()!!
        val friendshipType = stateOf.parameterTypes.single().toString()
        val friendshipOf = presenterInstructions.first { instruction ->
            instruction.opcode == Opcode.INVOKE_INTERFACE &&
                instruction.methodRef()?.let { it.returnType == friendshipType && it.parameterTypes.isEmpty() } == true
        }.methodRef()!!
        val userType = friendshipOf.definingClass
        val authorField = presenterInstructions.drop(flagIndex).first { instruction ->
            instruction.opcode == Opcode.IGET_OBJECT && instruction.getReference<FieldReference>()?.type == userType
        }.getReference<FieldReference>()!!
        val postState = authorField.definingClass
        val idOf = presenterInstructions.first { instruction ->
            instruction.methodRef()?.let { it.definingClass == userType && it.name == "getId" } == true
        }.methodRef()!!
        val idValue = classDefBy(idOf.returnType).fields.single {
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == "J"
        }

        // endregion

        // region The app's follow button and what it needs

        var followButton: Method? = null
        classDefForEach { classDef ->
            classDef.methods.firstOrNull { method ->
                AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
                    method.parameterTypes.size > 10 &&
                    method.parameterTypes[0].toString() == followState &&
                    method.parameterTypes[1].toString() == userType &&
                    method.parameterTypes.any { it.toString() == COMPOSER }
            }?.let { followButton = it }
        }
        val button = followButton ?: throw PatchException("No follow button composable")
        val buttonParams = button.parameterTypes.map { it.toString() }
        val handlerType = buttonParams[2]
        val styleType = buttonParams[4]

        // The focal post draws it with a style instance and a defaults mask, both reused here.
        var style: String? = null
        var defaultsMask: Int? = null
        val focalCaller = presenter.definingClass.substringBeforeLast('/')
        classDefForEach { classDef ->
            if (!classDef.type.startsWith(focalCaller) || style != null) return@classDefForEach
            classDef.methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                val call = instructions.indexOfFirst { instruction ->
                    instruction.methodRef()?.let {
                        it.definingClass == button.definingClass && it.name == button.name && it.params() == buttonParams
                    } == true
                }
                if (call < 0) return@forEach
                val last = (instructions[call] as RegisterRangeInstruction).let { it.startRegister + it.registerCount - 1 }
                defaultsMask = (instructions.subList(0, call).last { instruction ->
                    instruction is NarrowLiteralInstruction && instruction is OneRegisterInstruction && instruction.registerA == last
                } as NarrowLiteralInstruction).narrowLiteral
                style = instructions.subList(0, call).last { instruction ->
                    instruction.opcode == Opcode.NEW_INSTANCE &&
                        classDefByOrNull(instruction.getReference<TypeReference>()!!.type)?.let {
                            it.superclass == styleType || it.interfaces.contains(styleType)
                        } == true
                }.getReference<TypeReference>()!!.type
            }
        }
        if (style == null || defaultsMask == null) throw PatchException("The focal post never draws the follow button")

        // The friendship factory makes the handler a follow button follows and unfollows through.
        var factoryType: String? = null
        var factoryMethod: Method? = null
        classDefForEach { classDef ->
            classDef.methods.firstOrNull { method ->
                AccessFlags.STATIC.isSet(method.accessFlags) && method.params() == listOf(classDef.type) &&
                    classDefByOrNull(method.returnType)?.interfaces?.contains(handlerType) == true
            }?.let {
                factoryType = classDef.type
                factoryMethod = it
            }
        }
        val factory = factoryType ?: throw PatchException("No friendship factory")
        val makeHandler = factoryMethod!!

        // The button calls its first callback on every tap (the opened post logs the tap there),
        // so it gets one of the app's own callbacks that does nothing.
        var noOp: String? = null
        classDefForEach { classDef ->
            if (noOp != null || !classDef.interfaces.contains("Lkotlin/jvm/functions/Function0;")) return@classDefForEach
            val self = classDef.fields.firstOrNull { AccessFlags.STATIC.isSet(it.accessFlags) && it.type == classDef.type }
                ?: return@classDefForEach
            val invoke = classDef.methods.firstOrNull { it.name == "invoke" && it.parameterTypes.isEmpty() }
                ?.implementation?.instructions?.toList() ?: return@classDefForEach
            if (invoke.size == 2 && invoke[0].getReference<FieldReference>()?.definingClass == "Lkotlin/Unit;" &&
                invoke[1].opcode == Opcode.RETURN_OBJECT
            ) {
                noOp = "${classDef.type}->${self.name}:${classDef.type}"
            }
        }
        val doNothing = noOp ?: throw PatchException("No callback that does nothing")

        var modifierCompanion: String? = null
        classDefForEach { classDef ->
            if (!classDef.interfaces.contains(MODIFIER)) return@classDefForEach
            if (classDef.fields.any { !AccessFlags.STATIC.isSet(it.accessFlags) }) return@classDefForEach
            classDef.fields.firstOrNull { AccessFlags.STATIC.isSet(it.accessFlags) && it.type == classDef.type }
                ?.let { modifierCompanion = "${classDef.type}->${it.name}:${classDef.type}" }
        }
        val emptyModifier = modifierCompanion ?: throw PatchException("No empty Modifier")

        // endregion

        // The factory is created with the app's object graph, before any timeline is drawn.
        mutableClassDefBy(factory).methods.filter { it.name == "<init>" }.forEach { constructor ->
            constructor.instructions.withIndex()
                .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_VOID }
                .map { it.index }
                .sortedDescending()
                .forEach { index ->
                    constructor.addInstruction(index, "invoke-static/range { p0 .. p0 }, $FOLLOW_BUTTON_CLASS->onFactory(Ljava/lang/Object;)V")
                }
        }

        // region Timeline posts

        // Post headers end with the ⋯ menu button: an icon drawn in a group of its own when the
        // post state says so. The follow button goes in a group of its own right before it, at
        // the top right of the post. The focal post already draws one in its header.
        class Slot(
            val classType: String,
            val method: Method,
            val index: Int,
            val postRegister: Int,
            val composerRegister: Int,
            val startGroup: MethodReference,
            val endGroup: MethodReference,
        )
        val slots = mutableListOf<Slot>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                val drawsFollowButton = instructions.any { instruction ->
                    instruction.methodRef()?.let { it.definingClass == button.definingClass && it.name == button.name } == true
                }
                if (drawsFollowButton) return@forEach
                for (index in 0 until instructions.size - 6) {
                    val flag = instructions[index]
                    if (flag.opcode != Opcode.IGET_BOOLEAN || flag.getReference<FieldReference>()?.definingClass != postState) continue
                    val check = (index + 1..index + 2).firstOrNull { instructions[it].opcode == Opcode.IF_EQZ } ?: continue
                    val group = (check + 1..check + 3).firstOrNull { i ->
                        instructions[i].opcode == Opcode.INVOKE_VIRTUAL && instructions[i].methodRef()?.let {
                            it.params() == listOf("I") && it.returnType == "V"
                        } == true
                    } ?: continue
                    // The menu button: an icon from the icon set, drawn by a composable taking it first.
                    val window = (group + 1 until minOf(group + 80, instructions.size))
                    val icon = window.firstOrNull { i ->
                        instructions[i].opcode == Opcode.SGET_OBJECT &&
                            instructions[i].getReference<FieldReference>()?.type?.startsWith("Lcom/x/icons/") == true
                    } ?: continue
                    val iconType = instructions[icon].getReference<FieldReference>()!!.type
                    val drawsIcon = (icon + 1 until minOf(icon + 12, instructions.size)).any { i ->
                        instructions[i].opcode.let { it == Opcode.INVOKE_STATIC || it == Opcode.INVOKE_STATIC_RANGE } &&
                            instructions[i].methodRef()?.parameterTypes?.firstOrNull()?.toString() == iconType
                    }
                    if (!drawsIcon) continue

                    val startGroup = instructions[group].methodRef()!!
                    // The menu button's group is closed by the composer's end call: either the one
                    // taking no arguments or the one taking a Boolean, depending on the layout.
                    val endGroup = instructions.drop(group + 1).first { instruction ->
                        instruction.opcode == Opcode.INVOKE_VIRTUAL && instruction.methodRef()?.let {
                            it.definingClass == startGroup.definingClass && it.returnType == "V" &&
                                it.name != startGroup.name && (it.params().isEmpty() || it.params() == listOf("Z"))
                        } == true
                    }.methodRef()!!
                    slots += Slot(
                        classDef.type,
                        method,
                        index,
                        (flag as TwoRegisterInstruction).registerB,
                        (instructions[group] as FiveRegisterInstruction).registerC,
                        startGroup,
                        endGroup,
                    )
                    break
                }
            }
        }
        if (slots.isEmpty()) throw PatchException("No post header with a menu button")

        slots.groupBy { it.classType }.forEach { (classType, classSlots) ->
            val headerDef = mutableClassDefBy(classType)
            val composerImpl = classSlots.first().startGroup.definingClass
            val startGroup = classSlots.first().startGroup
            val endGroup = classSlots.first().endGroup
            val closeGroup = if (endGroup.parameterTypes.isEmpty()) {
                "invoke-virtual { v4 }, $endGroup"
            } else {
                "const/4 v1, 0x0\ninvoke-virtual { v4, v1 }, $endGroup"
            }
            headerDef.methods.add(
                ImmutableMethod(
                    headerDef.type,
                    HELPER,
                    listOf(
                        ImmutableMethodParameter("Ljava/lang/Object;", null, null),
                        ImmutableMethodParameter("Ljava/lang/Object;", null, null),
                    ),
                    "V",
                    AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                    null,
                    null,
                    MutableMethodImplementation(24),
                ).toMutable().apply {
                    addInstructionsWithLabels(
                        0,
                        """
                            move-object/from16 v0, p0
                            check-cast v0, $postState
                            invoke-static { }, $FOLLOW_BUTTON_CLASS->handler()Ljava/lang/Object;
                            move-result-object v2
                            if-nez v2, :have_handler
                            invoke-static { }, $FOLLOW_BUTTON_CLASS->factory()Ljava/lang/Object;
                            move-result-object v2
                            if-eqz v2, :hide
                            check-cast v2, $factory
                            invoke-static { v2 }, $factory->${makeHandler.name}($factory)${makeHandler.returnType}
                            move-result-object v2
                            invoke-static { v2 }, $FOLLOW_BUTTON_CLASS->setHandler(Ljava/lang/Object;)V
                            :have_handler
                            iget-object v0, v0, $authorField
                            if-eqz v0, :hide
                            invoke-interface { v0 }, $idOf
                            move-result-object v3
                            iget-wide v3, v3, ${idOf.returnType}->${idValue.name}:J
                            invoke-static { v3, v4 }, $FOLLOW_BUTTON_CLASS->shouldShow(J)Z
                            move-result v1
                            if-eqz v1, :hide
                            move-object/from16 v4, p1
                            check-cast v4, $composerImpl
                            const v1, 0x4d6f7270
                            invoke-virtual { v4, v1 }, $startGroup
                            invoke-interface { v0 }, $friendshipOf
                            move-result-object v3
                            invoke-static { v3 }, $stateOf
                            move-result-object v5
                            move-object v6, v0
                            check-cast v2, $handlerType
                            move-object v7, v2
                            sget-object v8, $emptyModifier
                            new-instance v9, $style
                            invoke-direct { v9 }, $style-><init>()V
                            const/4 v10, 0x0
                            const/4 v11, 0x0
                            const/4 v12, 0x0
                            const/4 v13, 0x0
                            sget-object v14, $doNothing
                            const/4 v15, 0x0
                            const/16 v16, 0x0
                            const/16 v17, 0x0
                            const/16 v18, 0x0
                            move-object/from16 v19, v4
                            const/16 v20, 0x0
                            const v21, $defaultsMask
                            invoke-static/range { v5 .. v21 }, ${button.definingClass}->${button.name}(${buttonParams.joinToString("")})V
                            $closeGroup
                            return-void
                            :hide
                            move-object/from16 v4, p1
                            check-cast v4, $composerImpl
                            const v1, 0x4d6f7271
                            invoke-virtual { v4, v1 }, $startGroup
                            $closeGroup
                            return-void
                        """,
                    )
                },
            )

            classSlots.sortedByDescending { it.index }.forEach { slot ->
                if (slot.postRegister > 15 || slot.composerRegister > 15) {
                    throw PatchException("The post header's registers are out of reach")
                }
                headerDef.methods.first {
                    it.name == slot.method.name && it.parameterTypes == slot.method.parameterTypes &&
                        it.returnType == slot.method.returnType
                }.addInstructionsAtControlFlowLabel(
                    // Branches that reach the menu button reach the follow button first.
                    slot.index,
                    "invoke-static { v${slot.postRegister}, v${slot.composerRegister} }, " +
                        "${headerDef.type}->$HELPER(Ljava/lang/Object;Ljava/lang/Object;)V",
                )
            }
        }

        // endregion

        // region Focal posts

        presenter.apply {
            val followedCheck = getInstruction(followingIndex - 1)
            val sessionCheckIndex = (followingIndex + 2 until instructions.size).first {
                getInstruction(it).opcode == Opcode.IF_EQZ
            }
            if (followedCheck.opcode != Opcode.IF_NEZ || getInstruction(followingIndex + 1).opcode != Opcode.IF_NE) {
                throw PatchException("Unexpected follow state checks in the post presenter")
            }

            // Later index first, so the earlier one does not move.
            val sessionRegister = getInstruction<OneRegisterInstruction>(sessionCheckIndex).registerA
            addInstruction(sessionCheckIndex, "const/16 v$sessionRegister, 0x1")
            val followedRegister = (followedCheck as OneRegisterInstruction).registerA
            addInstruction(followingIndex - 1, "const/16 v$followedRegister, 0x0")
        }

        // endregion
    }
}
