package io.github.hiosdra.patches.extension.gms

import android.app.Activity
import android.app.AlertDialog
import android.content.pm.PackageManager

/**
 * Runtime companion of the Movie Paradise GmsCore support patch.
 *
 * The patch redirects every Google Play Services reference to the microG package
 * ([MICROG_PACKAGE]). If microG (MicroG-RE) is not installed, those redirected
 * service bindings silently fail and Google sign-in / GMS features break with no
 * explanation. [checkGmsCore] is injected at the top of the app's main activity
 * `onCreate` to detect that case and tell the user what to install.
 *
 * The dialog is posted to the UI thread so it is safe to invoke before the
 * activity has finished initialising.
 */
object GmsCoreSupport {
    private const val MICROG_PACKAGE = "app.revanced.android.gms"

    @JvmStatic
    fun checkGmsCore(activity: Activity) {
        if (isMicroGInstalled(activity)) return

        activity.runOnUiThread {
            if (activity.isFinishing) return@runOnUiThread
            AlertDialog.Builder(activity)
                .setTitle("MicroG RE required")
                .setMessage(
                    "This patched build routes Google Play Services through microG " +
                        "($MICROG_PACKAGE). It is not installed, so Google sign-in and " +
                        "other Google services will not work.\n\n" +
                        "Install MicroG RE (Morphe variant), then reopen the app.",
                )
                .setCancelable(false)
                .setPositiveButton("Close") { _, _ -> activity.finishAffinity() }
                .show()
        }
    }

    private fun isMicroGInstalled(activity: Activity): Boolean = try {
        activity.packageManager.getPackageInfo(MICROG_PACKAGE, 0)
        true
    } catch (_: PackageManager.NameNotFoundException) {
        false
    }
}
