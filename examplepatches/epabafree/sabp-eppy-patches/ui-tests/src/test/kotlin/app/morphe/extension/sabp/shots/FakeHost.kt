package app.morphe.extension.sabp.shots

import android.app.Activity
import android.content.Context
import android.content.ContextWrapper
import android.net.Uri
import android.view.ViewGroup
import android.widget.FrameLayout
import app.morphe.extension.sabp.EppyPlayer
import app.morphe.extension.sabp.EppyTheme
import app.morphe.extension.sabp.ui.Host
import java.util.function.Consumer

/** A Host for rendering screens without SABP: an Activity shell around the test context. */
class FakeHost(base: Context, private val theme: EppyTheme) : Host {
    private val act: Activity = Activity().also {
        val m = ContextWrapper::class.java.getDeclaredMethod("attachBaseContext", Context::class.java)
        m.isAccessible = true
        m.invoke(it, base)
        // Activity.onApplyThemeResource talks to the system server; hand it a ready theme instead.
        val f = android.view.ContextThemeWrapper::class.java.getDeclaredField("mTheme")
        f.isAccessible = true
        f.set(it, base.theme)
    }
    val overlay = FrameLayout(base)
    val pushed = ArrayList<String>()

    override fun activity(): Activity = act
    override fun theme(): EppyTheme = theme
    override fun player(): EppyPlayer? = null
    override fun overlayRoot(): ViewGroup = overlay
    override fun openPlayer() {}
    override fun closePlayer() {}
    override fun openSabp(activityClass: String?) {}
    override fun showMoreSheet() {}
    override fun selectTab(tab: Int) {}
    override fun rebuild() {}
    override fun playBook(book: EppyPlayer.Book?, openPlayer: Boolean) {}
    override fun bookmarkAction(kind: Int) {}
    override fun showUndo(message: String?, undo: Runnable?) {}
    override fun pickDocument() {}
    override fun ensureSpeechPermission(action: Runnable?) {}
    override fun pushPage(key: String, arg: String?) {
        pushed.add(key)
    }
    override fun popPage() {}
    override fun requestDocument(create: Boolean, mime: String?, suggestedName: String?, result: Consumer<Uri>?) {}
}
