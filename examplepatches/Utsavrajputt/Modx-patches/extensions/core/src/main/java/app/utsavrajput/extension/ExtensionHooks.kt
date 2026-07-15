package app.utsavrajput.extension

import android.app.Activity
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
        if (context !is Activity) {
            // Called with a non-Activity context - needs NEW_TASK to
            // start an Activity from there.
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        }
        context.startActivity(intent)
        if (context is Activity) {
            // Kill the default window scale/fade transition so switching
            // into Tools/About feels as instant as the native
            // Local<->Fatafat fragment swap.
            context.overridePendingTransition(0, 0)
        }
    }

    private var tabHostRef: java.lang.ref.WeakReference<Any>? = null

    /**
     * Called on every n4d.j0() (fragment onResume) via CaptureTabHostPatch.
     * Stores a weak reference to the live tab-host fragment instance so we can
     * later trigger a real tab switch instead of just finish()ing back to
     * whatever tab happened to be visible before.
     */
    @JvmStatic
    fun captureTabHost(host: Any) {
        tabHostRef = java.lang.ref.WeakReference(host)
    }

    /**
     * Switches MX Player's bottom nav to the given internal tab name
     * ("local", "fatafat", "games", "online") by reflectively invoking the
     * fragment's own public O1(String, boolean) method — the exact same
     * method MX Player's own tab-switch logic uses.
     *
     * Safe no-op if we haven't captured a host yet, or if reflection fails
     * for any reason (e.g. method renamed on an MX Player update) — caller
     * should still finish() the extension Activity regardless.
     */
    @JvmStatic
    fun switchTab(tabName: String) {
        val host = tabHostRef?.get() ?: return
        try {
            val method = host.javaClass.getMethod("O1", String::class.java, java.lang.Boolean.TYPE)
            method.invoke(host, tabName, false)
        } catch (e: Exception) {
            // Silently ignore — worst case the tab just doesn't switch and the
            // user sees whatever was underneath, same as before this fix.
        }
    }
}