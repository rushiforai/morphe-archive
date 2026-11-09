package dev.aayy.bwpatches.nativealpha

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import dev.aayy.bwpatches.shared.Constants.COMPATIBILITY_NATIVE_ALPHA
import org.w3c.dom.Element

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"

/**
 * The screen that shows a web app, and the sandboxed copies of it that Native Alpha's build
 * generates for web apps kept in a separate container: `WebViewActivity` and
 * `__WebViewActivity_0` to `__WebViewActivity_N`.
 */
private val WEB_APP_ACTIVITY = Regex("""^(__)?WebViewActivity(_\d+)?$""")

@Suppress("unused")
val openWebAppsFromOtherAppsPatch = patch(
    name = "Open web apps from other apps",
    description = "Lets shortcut apps such as Shortcut Maker open a saved web app directly, " +
        "so you can make the home screen shortcut there instead of in Native Alpha. Other apps " +
        "can only open web apps you have already saved, and fingerprint-locked web apps still " +
        "ask for your fingerprint.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NATIVE_ALPHA)

    execute {
        // Native Alpha's web app screens declare no android:exported and no intent filter, so
        // Android keeps them private to the app; its own pinned shortcuts only work because the
        // launcher starts them on Native Alpha's behalf. Marking them exported lets any app start
        // them with an explicit component and the integer extra "webappID". The screen reads
        // nothing else from the intent and runs its own biometric check, so this adds no way in
        // beyond opening a web app the user saved.
        document("AndroidManifest.xml").use { manifest ->
            val activities = manifest.getElementsByTagName("activity")
            var exported = 0
            for (i in 0 until activities.length) {
                val activity = activities.item(i) as Element
                val simpleName = activity.getAttributeNS(ANDROID_NAMESPACE, "name").substringAfterLast('.')
                if (WEB_APP_ACTIVITY.matches(simpleName)) {
                    activity.setAttributeNS(ANDROID_NAMESPACE, "android:exported", "true")
                    exported++
                }
            }

            if (exported == 0) {
                throw PatchException(
                    "Could not find Native Alpha's WebViewActivity in the manifest. " +
                        "The app's layout may have changed; the patch needs updating.",
                )
            }
        }
    }
}
