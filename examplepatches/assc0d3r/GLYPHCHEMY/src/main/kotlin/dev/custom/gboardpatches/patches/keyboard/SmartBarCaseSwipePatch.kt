package dev.custom.gboardpatches.patches.keyboard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.custom.gboardpatches.patches.shared.commitFunnel
import dev.jason.gboardpatches.patches.gboard.shared.addHelperMethodIfMissing

private const val CANDIDATE_HOLDER_CLASS =
    "Lcom/google/android/apps/inputmethod/latin/keyboard/widget/LatinFixedCountCandidatesHolderView;"
private const val MOTION_EVENT = "Landroid/view/MotionEvent;"
private const val HELPER_CLASS = "Ldev/custom/gboardpatches/keyboard/SmartBarCaseSwipeRuntime;"

/**
 * Swiping up or down on a suggested word in the candidate strip changes the capitalization of the
 * inserted word: up capitalizes it, down lowercases it.
 *
 * Two hooks, and neither of them touches candidate data or injects synthetic input:
 * - The candidate strip (`LatinFixedCountCandidatesHolderView`, the view the Multilingual Suggestion
 *   patch already updates) gets a `dispatchTouchEvent` that only *watches* the gesture. It always
 *   forwards the event to the stock children, so an ordinary tap still commits through Gboard's own
 *   candidate path, with its trailing space, composing state and suggestion bookkeeping.
 * - Gboard's single `commitText` wrapper, `InputConnectionUtil.f(InputConnection, CharSequence,
 *   int)` (`Lowy.f` on 18.6.3 and 18.5.4, `Laerl.f` on 18.8.0), is the funnel every routed commit
 *   passes through. Its text argument is replaced by the runtime's answer, which is the same text
 *   unless a swipe just armed a capitalization for exactly that word.
 *
 * So the stock commit runs unchanged; only the capitalization of the committed word is different.
 */
val smartBarCaseSwipePatch = bytecodePatch(
    name = "Smart bar case swipe",
    description = "Swipe up on a suggested word to capitalize it, or swipe down to lowercase it " +
        "before it is inserted.",
    default = true,
) {
    compatibleWith(
        Compatibility(
            name = "Gboard",
            packageName = "com.google.android.inputmethod.latin",
            targets = listOf(
                AppTarget(version = "18.6.3.1002251336-release-arm64-v8a"),
                AppTarget(version = "18.8.0.1022711984-beta-arm64-v8a"),
                AppTarget(version = "18.8.1.1022711984-beta-arm64-v8a"),
                AppTarget(version = "18.5.4.993608717-release-arm64-v8a"),
                AppTarget(version = null, isExperimental = true),
            ),
        ),
    )
    extendWith("colorwheel.dex")

    execute {
        val strip = mutableClassDefByOrNull(CANDIDATE_HOLDER_CLASS)
            ?: error("Gboard candidate strip class not found.")

        strip.addHelperMethodIfMissing(
            name = "dispatchTouchEvent",
            parameterTypes = listOf(MOTION_EVENT),
            returnType = "Z",
            accessFlags = AccessFlags.PUBLIC.value,
            registerCount = 3,
            body = """
                invoke-static {p0, p1}, $HELPER_CLASS->handleTouch(Landroid/view/ViewGroup;$MOTION_EVENT)V
                invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchTouchEvent($MOTION_EVENT)Z
                move-result v0
                return v0
            """.trimIndent(),
        )

        val commit = commitFunnel { mutableClassDefByOrNull(it) }

        // The register is derived from the funnel's own signature, so the hook stays correct if
        // Gboard ever ships it as an instance method (where `this` shifts the text argument).
        // tools/check-case-swipe-hook.sh fails the build if this stops passing the CharSequence
        // parameter, because passing the flags int only fails on the device, as a VerifyError.
        if (!commit.callsCaseSwipeRuntime("applyCommittedCase")) {
            commit.addInstructions(
                0,
                CaseSwipeHook.instructions(
                    isStatic = commit.accessFlags and AccessFlags.STATIC.value != 0,
                    parameterTypes = commit.parameterTypes,
                ).joinToString("\n"),
            )
        }

        // Both hooks carry their call inside the installed code, so a second run is a no-op: the
        // helper refuses to duplicate the method and the guard above refuses to duplicate the hook.
        check(
            strip.methods.any { method ->
                method.name == "dispatchTouchEvent" &&
                    method.returnType == "Z" &&
                    method.parameterTypes == listOf(MOTION_EVENT)
            },
        ) { "Gboard candidate strip touch dispatch was not installed." }
        check(commit.callsCaseSwipeRuntime("applyCommittedCase")) {
            "Gboard commit funnel casing hook was not installed."
        }
    }
}

private fun MutableMethod.callsCaseSwipeRuntime(name: String): Boolean =
    implementation?.instructions?.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        reference != null && reference.definingClass == HELPER_CLASS && reference.name == name
    } == true
