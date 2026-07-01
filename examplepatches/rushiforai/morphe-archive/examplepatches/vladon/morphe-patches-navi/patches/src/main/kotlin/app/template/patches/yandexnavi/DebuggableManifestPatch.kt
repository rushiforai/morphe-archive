package app.template.patches.yandexnavi

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_YANDEX_NAVIGATOR
import org.w3c.dom.Element

/**
 * Sets **`android:debuggable="true"`** on `<application>` so Passport `releaseRuntimeChecks` hits the
 * *“application is debuggable: passed”* branch (`Lcom/yandex/passport/common/util/c;->b()`).
 *
 * **Use only on a dedicated research device** — any process can attach a debugger.
 */
@Suppress("unused")
val debuggableApplicationManifestPatch = resourcePatch(
    name = "Debuggable application manifest",
    description = "Sets android:debuggable=true on <application> (Passport allows non-Play signature on that path).",
    default = false,
) {
    compatibleWith(COMPATIBILITY_YANDEX_NAVIGATOR)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val ns = "http://schemas.android.com/apk/res/android"
            val apps = doc.getElementsByTagName("application")
            for (i in 0 until apps.length) {
                val el = apps.item(i) as Element
                el.setAttributeNS(ns, "debuggable", "true")
            }
        }
    }
}
