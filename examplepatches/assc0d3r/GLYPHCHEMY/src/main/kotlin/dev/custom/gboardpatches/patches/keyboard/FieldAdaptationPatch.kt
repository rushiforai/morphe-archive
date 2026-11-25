package dev.custom.gboardpatches.patches.keyboard

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import dev.custom.gboardpatches.patches.extras.injectStaticCallOnParamType

/** Gboard's InputMethodService subclass: the only class extending InputMethodService in the APK. */
private const val IME_SERVICE = "Lpbk;"
private const val EDITOR_INFO = "Landroid/view/inputmethod/EditorInfo;"
private const val HELPER_CLASS = "Ldev/custom/gboardpatches/keyboard/FieldProfileRuntime;"

/**
 * Adapts the typing profile to the field being edited: search boxes stop learning, URL, email,
 * password and code fields lose suggestions and auto-correct.
 *
 * The keyboard caches the editor in `onStartInput` before it builds the view, so both callbacks are
 * adapted. Each hook passes only the EditorInfo parameter to the runtime and returns nothing. The
 * call is emitted as a range invoke, because the EditorInfo sits in a register above v15 in these
 * methods and the inline smali compiler refuses those.
 */
val fieldAdaptationPatch = bytecodePatch(
    name = "Field adaptation",
    description = "Adjusts suggestions and auto-correct to the field being edited " +
        "(search, URL, email, password, code). Key size and glide sensitivity are not touched.",
    default = false,
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
        val service = mutableClassDefByOrNull(IME_SERVICE)
            ?: error("Gboard input method service class not found.")

        val adapted = service.methods.filter { method ->
            (method.name == "onStartInput" || method.name == "onStartInputView") &&
                method.returnType == "V" &&
                method.parameterTypes == listOf(EDITOR_INFO, "Z")
        }
        check(adapted.size == 2) {
            "Expected Gboard's onStartInput and onStartInputView, found " +
                adapted.map { it.name }.sorted()
        }

        adapted.forEach { method ->
            method.injectStaticCallOnParamType(
                hookOwner = HELPER_CLASS,
                hookName = "adapt",
                hookParameterTypes = listOf(EDITOR_INFO),
                targetType = EDITOR_INFO,
            )
        }
    }
}
