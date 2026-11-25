package dev.custom.gboardpatches.patches.punctuation

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val COMMIT_UTIL_CLASS = "Lowy;"
private const val INPUT_CONNECTION = "Landroid/view/inputmethod/InputConnection;"
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"
private const val CASE_SWIPE_HELPER = "Ldev/custom/gboardpatches/keyboard/SmartBarCaseSwipeRuntime;"
private const val HELPER_CLASS = "Ldev/custom/gboardpatches/punctuation/PunctuationSpacingRuntime;"

/**
 * Pulls a stray space back before punctuation the language writes tight against the word, so a
 * typed period after a completed sentence leaves `Hey.` instead of `Hey .`.
 *
 * The hook is on Gboard's single commit funnel (`Lowy.f(InputConnection, CharSequence, int)`, the
 * same wrapper the Smart bar case swipe patch rewrites) rather than on
 * `AbstractAutoSpaceProcessor`. That processor looks like the natural home, but in 18.6.3 it is
 * only wired into the CJK input methods: the five subclasses are Chinese, Cantonese, Taiwan,
 * Korean and Korean 10-key, and no Latin IME definition instantiates it. Hooking it would compile
 * and apply while never running for the typing this feature is for.
 *
 * The commit funnel, by contrast, sees every routed commit with the InputConnection in hand, which
 * is what deleting the stray space needs. The stock commit still runs unchanged: the runtime only
 * deletes surrounding whitespace when the committed text is a single punctuation mark, the cursor
 * is not over a selection, and the language in use does not put a space before that mark.
 */
val punctuationSpacingPatch = bytecodePatch(
    name = "Punctuation spacing",
    description = "Deletes the space Gboard leaves before punctuation that the language sets " +
        "tight against the word, so a typed \".\" after \"Hey \" commits as \"Hey.\".",
    default = true,
) {
    compatibleWith(
        Compatibility(
            name = "Gboard",
            packageName = "com.google.android.inputmethod.latin",
            targets = listOf(
                AppTarget(version = "18.6.3.1002251336-release-arm64-v8a"),
                AppTarget(version = "18.5.4.993608717-release-arm64-v8a"),
                AppTarget(version = null, isExperimental = true),
            ),
        ),
    )
    extendWith("colorwheel.dex")

    execute {
        val commit = mutableClassDefByOrNull(COMMIT_UTIL_CLASS)
            ?.methods
            ?.firstOrNull { method ->
                method.name == "f" && method.returnType == "V" &&
                    method.parameterTypes == listOf(INPUT_CONNECTION, CHAR_SEQUENCE, "I")
            } ?: error("Gboard commit funnel $COMMIT_UTIL_CLASS->f not found.")

        // The hook carries its own call inside the installed code, so a second run is a no-op.
        if (!commit.callsPunctuationRuntime("beforeCommit")) {
            commit.addInstructions(
                commit.insertionIndex(),
                hookInstructions(
                    isStatic = commit.accessFlags and AccessFlags.STATIC.value != 0,
                    parameterTypes = commit.parameterTypes,
                ).joinToString("\n"),
            )
        }

        check(commit.callsPunctuationRuntime("beforeCommit")) {
            "Gboard punctuation spacing hook was not installed."
        }
    }
}

/**
 * The registers are numbered from the funnel's own signature rather than guessed: a static method
 * starts at `p0`, an instance method spends `p0` on `this` first. Passing the wrong one here fails
 * only on the device, as a VerifyError, which is why the registers are derived instead of written
 * out.
 */
private fun hookInstructions(isStatic: Boolean, parameterTypes: List<CharSequence>): List<String> {
    val connection = parameterRegister(isStatic, parameterTypes, INPUT_CONNECTION)
    val text = parameterRegister(isStatic, parameterTypes, CHAR_SEQUENCE)
    return listOf(
        "invoke-static {$connection, $text}, $HELPER_CLASS->" +
            "beforeCommit($INPUT_CONNECTION$CHAR_SEQUENCE)V",
    )
}

private fun parameterRegister(
    isStatic: Boolean,
    parameterTypes: List<CharSequence>,
    type: CharSequence,
): String {
    val index = parameterTypes.indexOf(type)
    check(index >= 0) {
        "Punctuation spacing hook: the commit funnel has no $type parameter ($parameterTypes)."
    }
    return "p" + if (isStatic) index else index + 1
}

/**
 * The Smart bar case swipe patch prepends its own hook to this same funnel. Going in after its
 * `move-result-object` keeps the two from fighting over instruction index 0 whichever order the
 * patcher applies them in; on an unpatched funnel the hook goes to the top as usual.
 */
private fun MutableMethod.insertionIndex(): Int {
    val index = instructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        reference != null && reference.definingClass == CASE_SWIPE_HELPER
    }
    return if (index >= 0) index + 2 else 0
}

private fun MutableMethod.callsPunctuationRuntime(name: String): Boolean =
    instructions.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        reference != null && reference.definingClass == HELPER_CLASS && reference.name == name
    }
