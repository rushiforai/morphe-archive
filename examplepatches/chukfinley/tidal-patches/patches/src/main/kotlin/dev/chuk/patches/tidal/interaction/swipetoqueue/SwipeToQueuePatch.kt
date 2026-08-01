/*
 * Copyright 2026 chukfinley.
 * https://github.com/chukfinley/tidal-patches
 */

package dev.chuk.patches.tidal.interaction.swipetoqueue

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import dev.chuk.patches.tidal.shared.Constants.COMPATIBILITY_TIDAL

private const val EXTENSION_CLASS =
    "Ldev/chuk/extension/tidal/swipetoqueue/SwipeToQueue;"

private const val LIST_EXTENSION_CLASS =
    "Ldev/chuk/extension/tidal/swipetoqueue/RecyclerViewSwipe;"

private const val MODIFIER_TYPE = "Landroidx/compose/ui/Modifier;"
private const val CLICKABLE_CLASS = "Landroidx/compose/foundation/ClickableKt;"
private const val RECYCLER_VIEW_CLASS = "Landroidx/recyclerview/widget/RecyclerView;"
private const val ADAPTER_TYPE = "Landroidx/recyclerview/widget/RecyclerView\$Adapter;"
private const val BOTTOM_SHEET_DIALOG_CLASS =
    "Lcom/google/android/material/bottomsheet/BottomSheetDialog;"

private const val SOURCE_TYPE = "Lcom/aspiro/wamp/playqueue/source/model/Source;"
private const val TRACK_TYPE = "Lcom/aspiro/wamp/model/Track;"
private const val CONTEXTUAL_METADATA_TYPE =
    "Lcom/aspiro/wamp/eventtracking/model/ContextualMetadata;"
private const val NAVIGATION_INFO_TYPE = "Lcom/tidal/android/navigation/NavigationInfo;"
private const val ADD_TO_QUEUE_METHOD = "addAsLastInActives"

/** Register of the parameter at [index] of a static method, where the first parameter is `p0`. */
private fun parameterRegisterOfStatic(method: Method, index: Int): Int {
    var register = 0
    method.parameterTypes.forEachIndexed { current, type ->
        if (current == index) return register
        register += if (type == "J" || type == "D") 2 else 1
    }
    throw PatchException("Parameter $index does not exist in ${method.name}")
}

@Suppress("unused")
val swipeToQueuePatch = bytecodePatch(
    name = "Swipe to add to queue",
    description = "Adds a Spotify style swipe right gesture that adds the swiped item to the " +
        "play queue, on every screen that lists tracks, albums, playlists or mixes.",
) {
    compatibleWith(COMPATIBILITY_TIDAL)

    extendWith("extensions/tidal.mpe")

    execute {

        // region Add to queue.
        //
        // The extension cannot reach the play queue itself because its classes are renamed by the
        // app's minifier, so the body of its `addSourceToQueue` is written here. The queue is
        // reached the same way the app's own "Add to queue" menu entry reaches it:
        //
        //     PlayQueueProvider(PlayQueueHolder()).get().addAsLastInActives(source)

        val playQueueClass = classDefByOrNull { classDef ->
            classDef.methods.any { method ->
                method.name == ADD_TO_QUEUE_METHOD &&
                    method.parameterTypes.size == 1 &&
                    method.parameterTypes[0] == SOURCE_TYPE
            }
        } ?: throw PatchException("Could not find the play queue")

        // The provider is built from a single dependency that itself needs no arguments, which
        // makes it the one queue entry point reachable from outside the dependency graph.
        var holderType: String? = null
        val providerClass = classDefByOrNull { classDef ->
            val hasGetter = classDef.methods.any {
                it.parameterTypes.isEmpty() && it.returnType == playQueueClass.type
            }
            if (!hasGetter) return@classDefByOrNull false

            val constructor = classDef.methods.firstOrNull {
                it.name == "<init>" && it.parameterTypes.size == 1
            } ?: return@classDefByOrNull false

            val dependency = constructor.parameterTypes[0].toString()
            val hasDefaultConstructor = classDefByOrNull(dependency)?.methods?.any {
                it.name == "<init>" && it.parameterTypes.isEmpty()
            } == true

            if (hasDefaultConstructor) holderType = dependency
            hasDefaultConstructor
        } ?: throw PatchException("Could not find the play queue provider")

        val queueGetterName = providerClass.methods.first {
            it.parameterTypes.isEmpty() && it.returnType == playQueueClass.type
        }.name

        // Written into the provider class itself, because a method created here can be given the
        // scratch registers the calls need, which the compiled extension stub does not have.
        val queueBridge = ImmutableMethod(
            providerClass.type,
            "morpheAddToQueue",
            listOf(ImmutableMethodParameter("Ljava/lang/Object;", null, null)),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(4),
        ).toMutable()

        queueBridge.addInstructions(
            0,
            """
                new-instance v0, $holderType
                invoke-direct { v0 }, $holderType-><init>()V
                new-instance v1, ${providerClass.type}
                invoke-direct { v1, v0 }, ${providerClass.type}-><init>($holderType)V
                invoke-virtual { v1 }, ${providerClass.type}->$queueGetterName()${playQueueClass.type}
                move-result-object v1
                check-cast p0, $SOURCE_TYPE
                invoke-interface { v1, p0 }, ${playQueueClass.type}->$ADD_TO_QUEUE_METHOD($SOURCE_TYPE)V
                return-void
            """
        )

        mutableClassDefBy(providerClass).methods.add(queueBridge)

        mutableClassDefBy(EXTENSION_CLASS).methods.first {
            it.name == "addSourceToQueue"
        }.addInstructions(
            0,
            """
                invoke-static { p0 }, ${providerClass.type}->morpheAddToQueue(Ljava/lang/Object;)V
                return-void
            """
        )

        // endregion

        // region Compose rows.
        //
        // Every long clickable Compose component goes through one of the combinedClickable
        // overloads. The gesture is appended there and filters non row layouts itself, which
        // covers search, home, album, playlist, artist and mix screens with a single hook.

        val clickableClass = classDefByOrNull(CLICKABLE_CLASS)
            ?: throw PatchException("Could not find $CLICKABLE_CLASS")

        var composeHooks = 0
        mutableClassDefBy(clickableClass).methods.filter { method ->
            method.name.startsWith("combinedClickable") &&
                !method.name.contains("\$default") &&
                method.parameterTypes.firstOrNull() == MODIFIER_TYPE &&
                method.returnType == MODIFIER_TYPE
        }.forEach { method ->
            // In every overload the parameter order is
            // (..., onClickLabel: String, role: Role, onLongClickLabel: String, onLongClick, ...),
            // so the long click callback always follows the last string parameter.
            val lastStringParameter =
                method.parameterTypes.indexOfLast { it == "Ljava/lang/String;" }
            if (lastStringParameter == -1) return@forEach
            val onLongClickParameter = lastStringParameter + 1
            if (onLongClickParameter >= method.parameterTypes.size) return@forEach

            val implementation = method.implementation
                ?: throw PatchException("${method.name} has no implementation")
            val parameterRegisters = method.parameterTypes.sumOf { type ->
                if (type == "J" || type == "D") 2 else 1
            }
            val firstParameterRegister = implementation.registerCount - parameterRegisters
            val modifierRegister = firstParameterRegister + parameterRegisterOfStatic(method, 0)
            val onLongClickRegister =
                firstParameterRegister + parameterRegisterOfStatic(method, onLongClickParameter)

            // The overloads with long signatures keep their parameters above v15, which
            // invoke-static cannot address, so those are routed through two local registers.
            val instructions = if (modifierRegister < 16 && onLongClickRegister < 16) {
                """
                    invoke-static { v$modifierRegister, v$onLongClickRegister }, $EXTENSION_CLASS->wrapClickableModifier(${MODIFIER_TYPE}Ljava/lang/Object;)$MODIFIER_TYPE
                    move-result-object v$modifierRegister
                """
            } else {
                if (firstParameterRegister < 2) {
                    throw PatchException("Not enough local registers in ${method.name}")
                }
                """
                    move-object/from16 v0, v$modifierRegister
                    move-object/from16 v1, v$onLongClickRegister
                    invoke-static { v0, v1 }, $EXTENSION_CLASS->wrapClickableModifier(${MODIFIER_TYPE}Ljava/lang/Object;)$MODIFIER_TYPE
                    move-result-object v0
                    move-object/16 v$modifierRegister, v0
                """
            }

            method.addInstructions(0, instructions)
            composeHooks++
        }

        if (composeHooks == 0) {
            throw PatchException("Could not hook any combinedClickable overload")
        }

        // endregion

        // region Context menu manager.
        //
        // The gesture fires the row's own long press, which every screen answers by handing a
        // context menu to the manager below. The menu object carries the item and the play queue
        // source the app assembled for it, so a swipe consumes the call here: the source is
        // queued directly and no menu is ever built or shown.
        //
        // This also swallows a menu that the app's own long press detector may have started
        // while the finger was still moving.

        val bottomSheetSubclasses = HashSet<String>()
        classDefForEach { classDef ->
            if (classDef.superclass == BOTTOM_SHEET_DIALOG_CLASS) {
                bottomSheetSubclasses.add(classDef.type)
            }
        }

        var contextMenuMethod: Pair<ClassDef, Method>? = null
        classDefForEach { classDef ->
            if (contextMenuMethod != null) return@classDefForEach
            classDef.methods.forEach forEachMethod@{ method ->
                if (method.returnType != "V") return@forEachMethod
                if (method.parameterTypes.size != 2) return@forEachMethod
                if (method.parameterTypes[0] != "Landroid/app/Activity;") return@forEachMethod

                val constructsDialog = method.implementation?.instructions?.any { instruction ->
                    instruction.opcode == Opcode.NEW_INSTANCE &&
                        bottomSheetSubclasses.contains(
                            ((instruction as ReferenceInstruction).reference as TypeReference).type
                        )
                } == true

                if (constructsDialog) contextMenuMethod = classDef to method
            }
        }

        val (contextMenuClass, contextMenuShow) = contextMenuMethod
            ?: throw PatchException("Could not find the context menu manager")

        (contextMenuClass to contextMenuShow).let { (classDef, method) ->
            mutableClassDefBy(classDef).methods.first {
                it.name == method.name && it.parameterTypes == method.parameterTypes
            }.apply {
                val registerCount = implementation?.registerCount ?: 0
                if (registerCount - 3 < 2) {
                    throw PatchException("No free register in ${classDef.type}->$name")
                }

                addInstructionsWithLabels(
                    0,
                    """
                        move-object/from16 v0, v${registerCount - 2}
                        move-object/from16 v1, v${registerCount - 1}
                        invoke-static { v0, v1 }, $EXTENSION_CLASS->onContextMenuShown(Ljava/lang/Object;Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :morphe_show_menu
                        return-void
                    """,
                    ExternalLabel("morphe_show_menu", getInstruction(0))
                )
            }
        }

        // endregion

        // region Legacy lists.
        //
        // Screens that were not migrated to Compose, for example the favourite tracks list, get
        // the gesture through the RecyclerView they are built on.

        mutableClassDefBy(RECYCLER_VIEW_CLASS).methods.first {
            it.name == "setAdapter" &&
                it.parameterTypes.size == 1 &&
                it.parameterTypes[0] == ADAPTER_TYPE
        }.addInstructions(
            0,
            "invoke-static { p0 }, $LIST_EXTENSION_CLASS->attach($RECYCLER_VIEW_CLASS)V"
        )

        // endregion
    }
}
