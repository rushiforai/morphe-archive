package app.utsavrajput.extension

import android.app.Activity
import android.os.Bundle
import android.widget.TextView

/**
 * "About" tab screen. Lives in the extension module (extensions/core) -
 * Morphe compiles this module and merges its classes + resources directly
 * into MX Player's APK, so this is real, non-obfuscated app code, not
 * smali injected into an existing MX Player class.
 */
class AboutActivity : Activity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_about)

        findViewById<TextView>(R.id.about_text).text =
            "Modx-Patches\n\nCustom patches for MX Player.\nBuilt by Utsav Rajput."
    }
}
