package app.utsavrajput.extension

import android.content.Context
import android.content.Intent

/**
 * Entry points called FROM bytecode patches (raw smali `invoke-static`)
 * inside MX Player's obfuscated code. The patch only ever needs one stable
 * `invoke-static` call per tab - all real logic (building the Intent,
 * extras, flags, etc.) lives here in normal Kotlin instead of hand-written
 * smali.
 *
 * @JvmStatic is required so these compile to true `public static` methods
 * that smali can invoke-static directly, instead of only being reachable
 * via the Kotlin `INSTANCE` singleton field.
 */
object ExtensionHooks {

    @JvmStatic
    fun launchAbout(context: Context) = launch(context, AboutActivity::class.java)

    @JvmStatic
    fun launchTools(context: Context) = launch(context, ToolsActivity::class.java)

    private fun launch(context: Context, activity: Class<*>) {
        val intent = Intent(context, activity)
        if (context !is android.app.Activity) {
            // Called with a non-Activity context - needs NEW_TASK to
            // start an Activity from there.
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        }
        context.startActivity(intent)
    }
}
