package dev.aayy.bwpatches.nativealpha

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import dev.aayy.bwpatches.shared.Constants.COMPATIBILITY_NATIVE_ALPHA

private const val EXTENSION_CLASS = "Ldev/aayy/bwpatches/extension/WebAppCookies;"

/**
 * The web app screen and the sandboxed copies of it: `WebViewActivity` and `__WebViewActivity_0` to
 * `__WebViewActivity_N`. Native Alpha's release builds are not minified, so these names are stable.
 */
private val WEB_APP_ACTIVITY_CLASS =
    Regex("""^Lcom/cylonid/nativealpha/(__)?WebViewActivity(_\d+)?;$""")

@Suppress("unused")
val persistWebAppCookiesPatch = patch(
    name = "Persist web app logins",
    description = "Saves a web app's cookies to disk every time you leave it, so logins and " +
        "sessions survive closing the web app — including web apps opened straight from a home " +
        "screen shortcut. Native Alpha otherwise keeps cookies only in memory and loses them when " +
        "the web app's process ends.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NATIVE_ALPHA)

    extendWith("extensions/extension.mpe")

    execute {
        // Flush WebView's cookie store whenever a web app screen is paused (home, app switch, or
        // close). The call is a no-arg static void, so it needs no registers and can be prepended
        // to onPause() without touching the method's register layout.
        var patched = 0
        classDefForEach { classDef ->
            if (!WEB_APP_ACTIVITY_CLASS.matches(classDef.type)) return@classDefForEach

            val hasOnPause = classDef.methods.any {
                it.name == "onPause" && it.parameterTypes.isEmpty() && it.returnType == "V"
            }
            if (!hasOnPause) return@classDefForEach

            val mutableClass = mutableClassDefBy(classDef)
            val mutableOnPause = mutableClass.methods.first {
                it.name == "onPause" && it.parameterTypes.isEmpty() && it.returnType == "V"
            }
            mutableOnPause.addInstructions(
                0,
                "invoke-static {}, $EXTENSION_CLASS->flush()V",
            )
            patched++
        }

        if (patched == 0) {
            throw PatchException(
                "Could not find Native Alpha's WebViewActivity.onPause to persist cookies. " +
                    "The app's layout may have changed; the patch needs updating.",
            )
        }
    }
}
