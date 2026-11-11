package app.serajr.patches.navigationbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.serajr.patches.Constants
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val MAIN_ACTIVITY =
    "Lcom/x/android/main/MainActivity;"

private const val SOURCE_WRAPPER =
    "Lcom/x/compose/theme/j;"

private const val HAZE_STATE_HELPER =
    "Lcom/x/ui/common/post/b;"

private const val HAZE_EFFECT_OWNER =
    "Lcom/x/compose/core/o0;"

private const val HAZE_EFFECT_METHOD =
    "${HAZE_EFFECT_OWNER}->c(" +
        "Landroidx/compose/ui/Modifier;" +
        "Ldev/chrisbanes/haze/a1;" +
        "JLjava/util/List;FZFLdev/chrisbanes/haze/k0;" +
        "Lkotlin/jvm/functions/Function1;" +
        "Landroidx/compose/runtime/Composer;II" +
        ")Landroidx/compose/ui/Modifier;"

private const val BACKGROUND_HELPER =
    "Landroidx/compose/foundation/p;"

private const val BACKGROUND_BRUSH_OWNER =
    "Landroidx/compose/ui/graphics/m0;"

private const val BACKGROUND_BRUSH_CLASS =
    "Landroidx/compose/ui/graphics/h1;"

private const val ALIGNMENT_OWNER =
    "Landroidx/compose/ui/b;"

private const val BOTTOM_START =
    "${ALIGNMENT_OWNER}->g:Landroidx/compose/ui/i;"

private const val BOTTOM_CENTER =
    "${ALIGNMENT_OWNER}->h:Landroidx/compose/ui/i;"

private const val BOX_SCOPE =
    "Landroidx/compose/foundation/layout/x;"

private const val BOX_SCOPE_INSTANCE =
    "${BOX_SCOPE}->a:Landroidx/compose/foundation/layout/x;"

private const val BOX_ALIGN =
    "${BOX_SCOPE}->a(" +
        "Landroidx/compose/ui/Modifier;" +
        "Landroidx/compose/ui/d;" +
        ")Landroidx/compose/ui/Modifier;"

private const val MODIFIER_SINGLETON =
    "Landroidx/compose/ui/q;->a:Landroidx/compose/ui/q;"

private const val FILL_WIDTH =
    "Landroidx/compose/foundation/layout/m3;->g(" +
        "Landroidx/compose/ui/Modifier;F" +
        ")Landroidx/compose/ui/Modifier;"

private const val NAV_INSETS_FACTORY =
    "Landroidx/compose/foundation/layout/e;->u(" +
        "Landroidx/compose/runtime/Composer;" +
        ")Landroidx/compose/foundation/layout/z3;"

private const val NAV_INSETS_FIELD =
    "Landroidx/compose/foundation/layout/z3;" +
        "->e:Landroidx/compose/foundation/layout/c;"

private const val INSETS_PADDING =
    "Landroidx/compose/foundation/layout/e;->R(" +
        "Landroidx/compose/ui/Modifier;" +
        "Landroidx/compose/foundation/layout/y3;" +
        ")Landroidx/compose/ui/Modifier;"

private const val CONTENT_INVOKE =
    "Landroidx/compose/runtime/internal/g;->invoke(" +
        "Ljava/lang/Object;Ljava/lang/Object;" +
        ")Ljava/lang/Object;"

private const val SPACER_CALL =
    "Landroidx/compose/foundation/layout/e;->d(" +
        "Landroidx/compose/runtime/Composer;" +
        "Landroidx/compose/ui/Modifier;)V"

private const val POINTER_INPUT =
    "Landroidx/compose/ui/input/pointer/g0;->b("

private const val NAV_HANDLER =
    "Lcom/x/compose/navbars/i;"

private const val STATE_FACTORY =
    "${HAZE_STATE_HELPER}->f(" +
        "Landroidx/compose/runtime/Composer;" +
        ")Ldev/chrisbanes/haze/a1;"

private const val SOURCE_MODIFIER =
    "${HAZE_STATE_HELPER}->e(" +
        "Landroidx/compose/ui/Modifier;" +
        "Ldev/chrisbanes/haze/a1;FI" +
        ")Landroidx/compose/ui/Modifier;"

private const val BACKGROUND_FACTORY =
    "${BACKGROUND_HELPER}->j(" +
        "Landroidx/compose/ui/Modifier;" +
        "J${BACKGROUND_BRUSH_CLASS}" +
        ")Landroidx/compose/ui/Modifier;"

private const val BACKGROUND_BRUSH =
    "${BACKGROUND_BRUSH_OWNER}" +
        "->b:Landroidx/compose/ui/graphics/b1;"

private const val LAMBDA_FACTORY =
    "Landroidx/compose/runtime/internal/h;->e(" +
        "ILkotlin/Function;" +
        "Landroidx/compose/runtime/Composer;" +
        ")Landroidx/compose/runtime/internal/g;"

private const val WRAPPER_CTOR =
    "${SOURCE_WRAPPER}-><init>(" +
        "Ljava/lang/Object;Ljava/lang/Object;B)V"

private const val HOOK_NAME =
    "serajrApplyNavigationHaze"

private const val HOOK_DESCRIPTOR =
    "${MAIN_ACTIVITY}->${HOOK_NAME}(" +
        "Landroidx/compose/ui/Modifier;" +
        "Ldev/chrisbanes/haze/a1;" +
        "Landroidx/compose/runtime/Composer;" +
        ")Landroidx/compose/ui/Modifier;"

private fun Method.refAt(index: Int): String? =
    (implementation?.instructions
        ?.elementAtOrNull(index) as? ReferenceInstruction)
        ?.reference?.toString()

@Suppress("unused")
val fixNavigationBarHazePatch = bytecodePatch(
    name = "Fix Navigation Bar Haze",
    description = "D3-K1A.9C-T1: native solid Haze on the root navigation inset with transparent background, no tints, and 32f blur.",
    default = false
) {
    compatibleWith(Constants.COMPATIBILITY_X)

    execute {
        var originalRoot: Method? = null

        var wrapperVerified = false
        var stateVerified = false
        var effectVerified = false
        var alignmentVerified = false
        var boxScopeVerified = false
        var modifierVerified = false
        var widthVerified = false
        var insetsVerified = false
        var spacerVerified = false

        classDefForEach { classDef ->
            when (classDef.type.toString()) {
                MAIN_ACTIVITY -> {
                    originalRoot = classDef.methods.firstOrNull { method ->
                        method.name == "P" &&
                            method.returnType == "V" &&
                            method.parameterTypes.map { it.toString() } ==
                            listOf(
                                "Z",
                                "Landroidx/compose/runtime/internal/g;",
                                "Landroidx/compose/runtime/Composer;",
                                "I"
                            )
                    }
                }

                SOURCE_WRAPPER -> {
                    val constructor = classDef.methods.any { method ->
                        method.name == "<init>" &&
                            method.returnType == "V" &&
                            method.parameterTypes.map { it.toString() } ==
                            listOf(
                                "Ljava/lang/Object;",
                                "Ljava/lang/Object;",
                                "B"
                            )
                    }

                    val sourceCalls = classDef.methods.any { method ->
                        method.name == "invoke" &&
                            method.implementation?.instructions?.any {
                                instruction ->
                                (instruction as? ReferenceInstruction)
                                    ?.reference?.toString() ==
                                    SOURCE_MODIFIER
                            } == true
                    }

                    wrapperVerified = constructor && sourceCalls
                }

                HAZE_STATE_HELPER -> {
                    stateVerified = classDef.methods.any { method ->
                        method.name == "f" &&
                            method.returnType ==
                            "Ldev/chrisbanes/haze/a1;" &&
                            method.parameterTypes.map { it.toString() } ==
                            listOf(
                                "Landroidx/compose/runtime/Composer;"
                            )
                    }
                }

                HAZE_EFFECT_OWNER -> {
                    effectVerified = classDef.methods.any { method ->
                        method.name == "c" &&
                            method.returnType ==
                            "Landroidx/compose/ui/Modifier;" &&
                            method.parameterTypes.map { it.toString() } ==
                            listOf(
                                "Landroidx/compose/ui/Modifier;",
                                "Ldev/chrisbanes/haze/a1;",
                                "J",
                                "Ljava/util/List;",
                                "F",
                                "Z",
                                "F",
                                "Ldev/chrisbanes/haze/k0;",
                                "Lkotlin/jvm/functions/Function1;",
                                "Landroidx/compose/runtime/Composer;",
                                "I",
                                "I"
                            )
                    }
                }

                ALIGNMENT_OWNER -> {
                    alignmentVerified =
                        classDef.fields.any { field ->
                            field.name == "g" &&
                                field.type ==
                                "Landroidx/compose/ui/i;"
                        } &&
                        classDef.fields.any { field ->
                            field.name == "h" &&
                                field.type ==
                                "Landroidx/compose/ui/i;"
                        }
                }

                BOX_SCOPE -> {
                    val singleton = classDef.fields.any { field ->
                        field.name == "a" &&
                            field.type == BOX_SCOPE
                    }

                    val alignMethod = classDef.methods.any { method ->
                        method.name == "a" &&
                            method.returnType ==
                            "Landroidx/compose/ui/Modifier;" &&
                            method.parameterTypes.map { it.toString() } ==
                            listOf(
                                "Landroidx/compose/ui/Modifier;",
                                "Landroidx/compose/ui/d;"
                            )
                    }

                    boxScopeVerified = singleton && alignMethod
                }

                "Landroidx/compose/ui/q;" -> {
                    modifierVerified = classDef.fields.any { field ->
                        field.name == "a" &&
                            field.type ==
                            "Landroidx/compose/ui/q;"
                    }
                }

                "Landroidx/compose/foundation/layout/m3;" -> {
                    widthVerified = classDef.methods.any { method ->
                        method.name == "g" &&
                            method.returnType ==
                            "Landroidx/compose/ui/Modifier;" &&
                            method.parameterTypes.map { it.toString() } ==
                            listOf(
                                "Landroidx/compose/ui/Modifier;",
                                "F"
                            )
                    }
                }

                "Landroidx/compose/foundation/layout/e;" -> {
                    val insetFactory = classDef.methods.any { method ->
                        method.name == "u" &&
                            method.returnType ==
                            "Landroidx/compose/foundation/layout/z3;" &&
                            method.parameterTypes.map { it.toString() } ==
                            listOf(
                                "Landroidx/compose/runtime/Composer;"
                            )
                    }

                    val insetPadding = classDef.methods.any { method ->
                        method.name == "R" &&
                            method.returnType ==
                            "Landroidx/compose/ui/Modifier;" &&
                            method.parameterTypes.map { it.toString() } ==
                            listOf(
                                "Landroidx/compose/ui/Modifier;",
                                "Landroidx/compose/foundation/layout/y3;"
                            )
                    }

                    spacerVerified = classDef.methods.any { method ->
                        method.name == "d" &&
                            method.returnType == "V" &&
                            method.parameterTypes.map { it.toString() } ==
                            listOf(
                                "Landroidx/compose/runtime/Composer;",
                                "Landroidx/compose/ui/Modifier;"
                            )
                    }

                    insetsVerified = insetFactory && insetPadding
                }
            }
        }

        require(
            wrapperVerified &&
                stateVerified &&
                effectVerified &&
                alignmentVerified &&
                boxScopeVerified &&
                modifierVerified &&
                widthVerified &&
                insetsVerified &&
                spacerVerified
        ) {
            "FixNavigationBarHaze: D3-K1A.9C-T1 helpers do not match X 12.40.1."
        }

        val root = originalRoot
            ?: error(
                "FixNavigationBarHaze: MainActivity.P not found."
            )

        val mutableClass = mutableClassDefBy(root.definingClass)

        require(
            mutableClass.methods.none { method ->
                method.name == HOOK_NAME
            }
        ) {
            "FixNavigationBarHaze: helper method already exists."
        }

        val mutableRoot = mutableClass.methods.firstOrNull {
            it.toString() == root.toString()
        } ?: error(
            "FixNavigationBarHaze: mutable MainActivity.P not found."
        )

        val implementation = mutableRoot.implementation
            ?: error(
                "FixNavigationBarHaze: MainActivity.P has no implementation."
            )

        require(implementation.registerCount == 15) {
            "FixNavigationBarHaze: unexpected MainActivity.P register count."
        }

        val instructions = implementation.instructions.toList()

        val contentCandidates = instructions.indices.filter { index ->
            if (root.refAt(index) != CONTENT_INVOKE) {
                return@filter false
            }

            val call =
                instructions[index] as? FiveRegisterInstruction
                    ?: return@filter false

            if (
                call.registerCount != 3 ||
                call.registerC != 12 ||
                call.registerD != 4 ||
                call.registerE != 13
            ) {
                return@filter false
            }

            (index + 1 until minOf(index + 6, instructions.size))
                .any { nearby ->
                    root.refAt(nearby) == BOTTOM_CENTER
                }
        }

        require(contentCandidates.size == 1) {
            "FixNavigationBarHaze: expected one root content invocation."
        }

        val contentIndex = contentCandidates.single()

        val spacerCandidates = instructions.indices.filter { index ->
            if (
                root.refAt(index) != SPACER_CALL ||
                index <= contentIndex
            ) {
                return@filter false
            }

            val call =
                instructions[index] as? FiveRegisterInstruction
                    ?: return@filter false

            if (
                call.registerCount != 2 ||
                call.registerC != 4 ||
                call.registerD != 13
            ) {
                return@filter false
            }

            (contentIndex + 1 until index).any { nearby ->
                root.refAt(nearby)?.startsWith(POINTER_INPUT) == true
            } &&
                (contentIndex + 1 until index).any { nearby ->
                    root.refAt(nearby)?.contains(NAV_HANDLER) == true
                }
        }

        require(spacerCandidates.size == 1) {
            "FixNavigationBarHaze: expected one bottom navigation-inset Spacer."
        }

        val spacerIndex = spacerCandidates.single()

        require(
            spacerIndex > contentIndex &&
                spacerIndex - contentIndex < 55
        ) {
            "FixNavigationBarHaze: unexpected root content/Spacer structure."
        }

        require(
            root.refAt(spacerIndex + 1) ==
                "Landroidx/compose/runtime/o0;->u(Z)V"
        ) {
            "FixNavigationBarHaze: unexpected root Box closing structure."
        }

        /*
         * D3-K1A.9C-T1
         *
         * Private static hook.
         *
         * Parameters:
         *   p0 = Modifier
         *   p1 = HazeState
         *   p2 = Composer
         *
         * Register count: 16
         * Locals: v0..v12
         * Parameters: v13..v15
         *
         * The 13 contiguous local registers are used to call
         * the native X Haze method o0.c().
         */

        val hook = ImmutableMethod(
            MAIN_ACTIVITY,
            HOOK_NAME,
            listOf(
                ImmutableMethodParameter(
                    "Landroidx/compose/ui/Modifier;",
                    null,
                    null
                ),
                ImmutableMethodParameter(
                    "Ldev/chrisbanes/haze/a1;",
                    null,
                    null
                ),
                ImmutableMethodParameter(
                    "Landroidx/compose/runtime/Composer;",
                    null,
                    null
                )
            ),
            "Landroidx/compose/ui/Modifier;",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(16)
        ).toMutable()

        hook.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                move-object/from16 v1, p1

                const-wide/16 v2, 0x0

                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object v4

                const/high16 v5, 0x42000000

                const/4 v6, 0x1

                const v7, 0x3d4ccccd

                const/4 v8, 0x0
                const/4 v9, 0x0

                move-object/from16 v10, p2

                const/4 v11, 0x0
                const/4 v12, 0x0

                invoke-static/range {v0 .. v12}, $HAZE_EFFECT_METHOD
                move-result-object v0

                return-object v0
            """.trimIndent()
        )

        mutableClass.methods.add(hook)

        /*
         * Insert the second Spacer immediately after the
         * original navigation-inset Spacer.
         *
         * Preserve:
         *   v4 = Composer
         *   v8 = shared HazeState
         *   v9 = original Box closing boolean
         *
         * The second Spacer uses:
         *   BottomStart
         *   fillMaxWidth(1.0f)
         *   navigationBars window insets
         *   native Haze effect through our static hook
         */

        mutableRoot.addInstructions(
            spacerIndex + 1,
            """
                sget-object v0, $MODIFIER_SINGLETON

                sget-object v1, $BOTTOM_START

                sget-object v2, $BOX_SCOPE_INSTANCE

                invoke-virtual {v2, v0, v1}, $BOX_ALIGN
                move-result-object v0

                const/high16 v1, 0x3f800000

                invoke-static {v0, v1}, $FILL_WIDTH
                move-result-object v0

                invoke-static {v4}, $NAV_INSETS_FACTORY
                move-result-object v3

                iget-object v3, v3, $NAV_INSETS_FIELD

                invoke-static {v0, v3}, $INSETS_PADDING
                move-result-object v0

                invoke-static {v0, v8, v4}, $HOOK_DESCRIPTOR
                move-result-object p3

                invoke-static {v4, p3}, $SPACER_CALL
            """.trimIndent()
        )

        /*
         * Replace the original content invocation with
         * the validated source wrapper.
         *
         * The shared HazeState is stored in v8.
         * The original content lambda remains unchanged.
         */

        mutableRoot.removeInstruction(contentIndex)

        mutableRoot.addInstructions(
            contentIndex,
            """
                invoke-static {v4}, $STATE_FACTORY
                move-result-object v8

                new-instance v5, $SOURCE_WRAPPER

                const/16 v6, 0x19

                invoke-direct {v5, v8, p2, v6}, $WRAPPER_CTOR

                const v6, 0x6e3a1b2c

                invoke-static {v6, v5, v4}, $LAMBDA_FACTORY
                move-result-object v5

                invoke-virtual {v5, v4, p3}, $CONTENT_INVOKE
            """.trimIndent()
        )
    }
}
