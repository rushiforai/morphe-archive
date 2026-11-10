package app.serajr.patches.navigationbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.serajr.patches.Constants
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/**
 * D3-K1A.7A — experimental transparent-background root navigation Haze.
 *
 * X 12.40.1-prod.01 only.
 *
 * Preserves the D3-K1A.5 root HazeState and source wrapper.
 * Replaces only the root navigation-inset Spacer effect builder:
 * o0.d -> o0.e, with Color.Transparent (0x0) background.
 *
 * Preserved: native tint @0.75, blur radius 32f, noise 0.05f,
 * alpha 1.0f, null mask/progressive, and stock Bottom Bar behavior.
 *
 * No extension, new class, register allocation, or .locals modification.
 * Do not combine with the obsolete C2.4 diagnostic patch.
 */
private const val MAIN_ACTIVITY =
    "Lcom/x/android/main/MainActivity;"
private const val SOURCE_WRAPPER =
    "Lcom/x/compose/theme/j;"
private const val HAZE_STATE_HELPER =
    "Lcom/x/ui/common/post/b;"
private const val HAZE_EFFECT_HELPER =
    "Lcom/x/compose/core/o0;"
private const val HAZE_STYLE_HELPER =
    "Lcom/x/compose/core/m0;"
private const val HAZE_TINT_CLASS =
    "Ldev/chrisbanes/haze/blur/g0;"

private const val CONTENT_INVOKE =
    "Landroidx/compose/runtime/internal/g;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"

private const val SPACER_CALL =
    "Landroidx/compose/foundation/layout/e;->d(Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;)V"

private const val BOTTOM_CENTER =
    "Landroidx/compose/ui/b;->h:Landroidx/compose/ui/i;"

private const val POINTER_INPUT =
    "Landroidx/compose/ui/input/pointer/g0;->b("

private const val NAV_HANDLER =
    "Lcom/x/compose/navbars/i;"

private const val STATE_FACTORY =
    "${HAZE_STATE_HELPER}->f(Landroidx/compose/runtime/Composer;)Ldev/chrisbanes/haze/a1;"

private const val TINT_FACTORY =
    "${HAZE_STYLE_HELPER}->c(Landroidx/compose/runtime/Composer;)${HAZE_TINT_CLASS}"

private const val TINT_FIELD =
    "${HAZE_TINT_CLASS}->a:J"

private const val EFFECT_FACTORY =
    "${HAZE_EFFECT_HELPER}->e(Landroidx/compose/ui/Modifier;Ldev/chrisbanes/haze/a1;JJFLandroidx/compose/runtime/Composer;II)Landroidx/compose/ui/Modifier;"

private const val SOURCE_MODIFIER =
    "${HAZE_STATE_HELPER}->e(Landroidx/compose/ui/Modifier;Ldev/chrisbanes/haze/a1;FI)Landroidx/compose/ui/Modifier;"

private const val LAMBDA_FACTORY =
    "Landroidx/compose/runtime/internal/h;->e(ILkotlin/Function;Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/internal/g;"

private const val WRAPPER_CTOR =
    "${SOURCE_WRAPPER}-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V"

private fun Method.refAt(index: Int): String? =
    (implementation?.instructions?.elementAtOrNull(index) as? ReferenceInstruction)
        ?.reference?.toString()

@Suppress("unused")
val fixNavigationBarHazePatch = bytecodePatch(
    name = "Fix Navigation Bar Haze",
    description = "Experimental persistent native Haze behind the Android navigation bar with a transparent effect background.",
    default = false
) {
    compatibleWith(Constants.COMPATIBILITY_X)

    execute {
        var originalRoot: Method? = null
        var wrapperVerified = false
        var stateVerified = false
        var effectVerified = false
        var tintVerified = false
        var tintFieldVerified = false

        classDefForEach { classDef ->
            when (classDef.type.toString()) {
                MAIN_ACTIVITY -> {
                    originalRoot = classDef.methods.firstOrNull { method ->
                        method.name == "P" &&
                            method.returnType == "V" &&
                            method.parameterTypes.map { it.toString() } == listOf(
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
                            method.parameterTypes.map { it.toString() } == listOf(
                                "Ljava/lang/Object;",
                                "Ljava/lang/Object;",
                                "B"
                            )
                    }

                    val sourceCalls = classDef.methods.any { method ->
                        method.name == "invoke" &&
                            method.implementation?.instructions?.any { instruction ->
                                (instruction as? ReferenceInstruction)
                                    ?.reference?.toString() == SOURCE_MODIFIER
                            } == true
                    }

                    wrapperVerified = constructor && sourceCalls
                }

                HAZE_STATE_HELPER -> {
                    stateVerified = classDef.methods.any { method ->
                        method.name == "f" &&
                            method.returnType == "Ldev/chrisbanes/haze/a1;" &&
                            method.parameterTypes.map { it.toString() } ==
                                listOf("Landroidx/compose/runtime/Composer;")
                    }
                }

                HAZE_EFFECT_HELPER -> {
                    effectVerified = classDef.methods.any { method ->
                        method.name == "e" &&
                            method.returnType == "Landroidx/compose/ui/Modifier;" &&
                            method.parameterTypes.map { it.toString() } == listOf(
                                "Landroidx/compose/ui/Modifier;",
                                "Ldev/chrisbanes/haze/a1;",
                                "J",
                                "J",
                                "F",
                                "Landroidx/compose/runtime/Composer;",
                                "I",
                                "I"
                            )
                    }
                }

                HAZE_STYLE_HELPER -> {
                    tintVerified = classDef.methods.any { method ->
                        method.name == "c" &&
                            method.returnType == HAZE_TINT_CLASS &&
                            method.parameterTypes.map { it.toString() } ==
                                listOf("Landroidx/compose/runtime/Composer;")
                    }
                }

                HAZE_TINT_CLASS -> {
                    tintFieldVerified = classDef.fields.any { field ->
                        field.name == "a" && field.type == "J"
                    }
                }
            }
        }

        require(
            wrapperVerified &&
                stateVerified &&
                effectVerified &&
                tintVerified &&
                tintFieldVerified
        ) {
            "FixNavigationBarHaze: D3-K1A.7A native helpers do not match X 12.40.1."
        }

        val root = originalRoot
            ?: error("FixNavigationBarHaze: MainActivity.P not found.")

        val mutableRoot = mutableClassDefBy(root.definingClass)
            .methods.firstOrNull { it.toString() == root.toString() }
            ?: error("FixNavigationBarHaze: mutable MainActivity.P not found.")

        val implementation = mutableRoot.implementation
            ?: error("FixNavigationBarHaze: MainActivity.P has no implementation.")

        require(implementation.registerCount == 15) {
            "FixNavigationBarHaze: unexpected MainActivity.P register count."
        }

        val instructions = implementation.instructions.toList()

        val contentCandidates = instructions.indices.filter { index ->
            if (root.refAt(index) != CONTENT_INVOKE) {
                return@filter false
            }

            val call = instructions[index] as? FiveRegisterInstruction
                ?: return@filter false

            if (
                call.registerCount != 3 ||
                call.registerC != 12 ||
                call.registerD != 4 ||
                call.registerE != 13
            ) {
                return@filter false
            }

            (index + 1 until minOf(index + 6, instructions.size)).any { nearby ->
                root.refAt(nearby) == BOTTOM_CENTER
            }
        }

        require(contentCandidates.size == 1) {
            "FixNavigationBarHaze: expected one root content invocation before BottomCenter."
        }

        val contentIndex = contentCandidates.single()

        val spacerCandidates = instructions.indices.filter { index ->
            if (root.refAt(index) != SPACER_CALL || index <= contentIndex) {
                return@filter false
            }

            val call = instructions[index] as? FiveRegisterInstruction
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
            } && (contentIndex + 1 until index).any { nearby ->
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

        /*
         * D3-K1A.7A — background-only experiment.
         *
         * Replace the D3-K1A.5 o0.d call with o0.e.
         *
         * Argument range:
         * v0       Modifier
         * v1       HazeState
         * v2/v3    Native XDS tint J (@0.75)
         * v4/v5    Color.Transparent J (0x0)
         * v6       Blur radius 32f
         * v7       Composer
         * v8       Flags 6
         * v9       Default mask 0xc0
         *
         * v4 (Composer) and v9 (1) must be restored.
         * p2 must remain untouched for the restart lambda.
         *
         * No new jump targets, register allocation or .locals change.
         */

        mutableRoot.addInstructions(
            spacerIndex,
            """
                move-object v7, v4

                invoke-static {v7}, $TINT_FACTORY
                move-result-object v6
                iget-wide v2, v6, $TINT_FIELD

                move-object v1, v8
                move-object v0, p3

                const-wide/16 v4, 0x0
                const/high16 v6, 0x42000000
                const/4 v8, 0x6
                const/16 v9, 0xc0

                invoke-static/range {v0 .. v9}, $EFFECT_FACTORY
                move-result-object p3

                move-object v4, v7
                const/4 v9, 0x1
            """.trimIndent()
        )

        /*
         * Original D3-K1A.5 source wrapper.
         *
         * Kept unchanged to preserve HazeState identity,
         * source capture and Compose behavior.
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
