package app.morphe.extension.pixiv.novelcopy

import android.app.Activity
import android.content.ClipData
import android.content.ClipboardManager
import android.content.ContentValues
import android.content.Context
import android.content.ContextWrapper

import android.net.Uri
import android.os.Build
import android.os.Environment
import android.os.Handler
import android.os.Looper
import android.provider.MediaStore
import android.util.Log
import android.view.Menu
import android.view.MenuItem
import android.view.View
import android.view.ViewGroup
import android.webkit.ValueCallback
import android.webkit.WebView
import android.widget.TextView
import android.widget.Toast
import app.morphe.extension.pixiv.ui.Strings
import org.json.JSONTokener
import java.util.concurrent.Executors

/**
 * Text handling for the novel surfaces.
 *
 * The reader body is a server-rendered page inside a WebView, so selection there is restored by
 * injecting CSS once the page finished loading. The caption and the series header are native
 * TextViews and only need `setTextIsSelectable`.
 */
object NovelCopyHelper {

    private const val TAG = "MorpheNovelCopy"

    private const val NOVEL_ACTIVITY = "jp.pxv.android.feature.novelviewer.noveltext.NovelTextActivity"

    /**
     * Ids are mine, not the app's: they only have to stay unique inside this menu and must not
     * collide with the app's generated ids (0x7f0a....).
     */
    private const val MENU_ID_COPY_TITLE = 0x7f09a0c1
    private const val MENU_ID_COPY_AUTHOR = 0x7f09a0c2
    private const val MENU_ID_DOWNLOAD = 0x7f09a0c3

    /** Readable copy on the novel surfaces. Navigation rows are skipped, see [isPlainText]. */
    private val SELECTABLE_ID_NAMES = listOf(
        "caption_text_view",
        "caption",
        "series_detail",
        "series_title"
    )

    private val selectableIdsByPackage = HashMap<String, Set<Int>>()

    private val mainHandler = Handler(Looper.getMainLooper())
    private val fileExecutor = Executors.newSingleThreadExecutor()

    private const val SELECTION_JS = """(function(){try{var d=document;var s=d.getElementById('morphe_novel_select');if(!s){s=d.createElement('style');s.id='morphe_novel_select';s.textContent='html,body,*{-webkit-user-select:text !important;user-select:text !important;-webkit-touch-callout:default !important;}';var h=d.head||d.documentElement;if(h){h.appendChild(s);}}var b=d.body;if(b){b.onmousedown=null;b.onselectstart=null;b.oncontextmenu=null;}return 'ok';}catch(e){return 'err';}})()"""

    /**
     * innerText is read from the live node (a detached clone falls back to textContent and loses
     * every paragraph break). Ruby readings are hidden for the duration of the read so the saved
     * text stays clean, then restored.
     */
    private const val EXTRACT_BODY_JS = """(function(){try{var sels=['#novel-text-container','#novel-text','.novel-text','[data-testid=novel-text]','main'];var root=null;for(var i=0;i<sels.length;i++){var n=document.querySelector(sels[i]);if(n&&n.innerText&&n.innerText.length>200){root=n;break;}}if(!root){root=document.body;}var rts=root.querySelectorAll('rt,rp');for(var j=0;j<rts.length;j++){rts[j].setAttribute('data-morphe-prev',rts[j].style.display);rts[j].style.display='none';}var t=root.innerText||root.textContent||'';for(var k=0;k<rts.length;k++){rts[k].style.display=rts[k].getAttribute('data-morphe-prev')||'';}t=t.replace(/\n{3,}/g,'\n\n').replace(/[ \t]+\n/g,'\n').trim();return t;}catch(e){return '';}})()"""

    // ---------------------------------------------------------------- hooks

    /** NovelTextActivity.onCreate, NovelSeriesDetailActivity.onCreate */
    @JvmStatic
    fun onScreenCreated(activity: Activity?) {
        if (activity == null) return
        // The screens fill their lists asynchronously, so look twice.
        for (delay in longArrayOf(350L, 1200L)) {
            mainHandler.postDelayed({
                try {
                    enableSelectableText(activity.window?.decorView)
                    enableToolbarTitle(activity)
                } catch (t: Throwable) {
                    Log.w(TAG, "selectable pass failed", t)
                }
            }, delay)
        }
    }

    /** NovelTextActivity.onCreateOptionsMenu */
    @JvmStatic
    fun onCreateOptionsMenu(menu: Menu?) {
        if (menu == null) return
        try {
            addMenuItem(menu, MENU_ID_COPY_TITLE, Strings.novelCopyTitle, 101)
            addMenuItem(menu, MENU_ID_COPY_AUTHOR, Strings.novelCopyAuthor, 102)
            addMenuItem(menu, MENU_ID_DOWNLOAD, Strings.novelDownloadText, 103)
        } catch (t: Throwable) {
            Log.w(TAG, "menu injection failed", t)
        }
    }

    /** NovelTextActivity.u(activity, item), the handler behind the reader toolbar listener. */
    @JvmStatic
    fun onMenuItemClicked(activity: Activity?, item: MenuItem?) {
        if (activity == null || item == null) return
        try {
            when (item.itemId) {
                MENU_ID_COPY_TITLE -> copyToClipboard(activity, resolveTitle(activity))
                MENU_ID_COPY_AUTHOR -> copyToClipboard(activity, resolveAuthor(activity))
                MENU_ID_DOWNLOAD -> requestFullText(activity)
            }
        } catch (t: Throwable) {
            Log.e(TAG, "menu action failed", t)
            toast(activity, Strings.novelCopyFailed)
        }
    }

    /**
     * DetailCaptionAndTagsView.b(String). The same view serves illustrations, and there the app's
     * LinkMovementMethod is worth keeping, so only novel screens are touched.
     */
    @JvmStatic
    fun onCaptionBound(view: View?) {
        if (view == null) return
        val activity = activityOf(view.context) ?: return
        if (!isNovelSurface(activity)) return
        schedulePass(view, 0L)
        schedulePass(view, 400L)
    }

    /** WebViewClient.onPageFinished: only the novel reader is touched. */
    @JvmStatic
    fun onPageFinished(webView: WebView?) {
        if (webView == null) return
        try {
            if (activityOf(webView.context)?.javaClass?.name != NOVEL_ACTIVITY) return
            webView.evaluateJavascript(SELECTION_JS, null)
        } catch (t: Throwable) {
            Log.w(TAG, "selection injection failed", t)
        }
    }

    // ---------------------------------------------------------------- menu actions

    private fun requestFullText(activity: Activity) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) {
            toast(activity, Strings.novelDownloadUnsupported)
            return
        }
        val webView = findWebView(activity)
        if (webView == null) {
            toast(activity, Strings.novelDownloadFailed)
            return
        }
        webView.evaluateJavascript(EXTRACT_BODY_JS, object : ValueCallback<String> {
            override fun onReceiveValue(value: String?) {
                handleExtractedBody(activity, webView, value)
            }
        })
    }

    private fun handleExtractedBody(activity: Activity, webView: WebView, raw: String?) {
        if (activity.isFinishing || activity.isDestroyed) return

        val body = decodeJsString(raw)?.trim()
        if (body.isNullOrEmpty()) {
            toast(activity, Strings.novelNothingToCopy)
            return
        }

        val title = resolveTitle(activity)
        val caption = textOf(activity, "caption_text_view")
        val url = webView.url.orEmpty()
        val novelId = Uri.parse(url).getQueryParameter("id")
        val link = if (novelId != null) "https://www.pixiv.net/novel/show.php?id=$novelId" else url

        val content = buildText(title, caption, link, body)
        val name = fileName(novelId, title)
        val appContext = activity.applicationContext

        fileExecutor.execute {
            val saved = saveToDownloads(appContext, name, content)
            mainHandler.post {
                toast(activity, if (saved) Strings.novelDownloadDone else Strings.novelDownloadFailed)
            }
        }
    }

    private fun buildText(title: String?, caption: String?, link: String, body: String): String {
        val builder = StringBuilder()
        if (!title.isNullOrBlank()) builder.append(title).append("\n\n")
        if (!caption.isNullOrBlank()) builder.append(caption).append("\n\n")
        if (link.isNotBlank()) builder.append(link).append("\n\n")
        builder.append(body)
        if (!builder.endsWith("\n")) builder.append("\n")
        return builder.toString()
    }

    private fun fileName(novelId: String?, title: String?): String {
        val safeTitle = title.orEmpty()
            .replace(Regex("[\\\\/:*?\"<>|\\r\\n\\t]+"), "_")
            .trim()
            .take(80)
        val base = listOfNotNull(novelId?.takeIf { it.isNotBlank() }, safeTitle.takeIf { it.isNotBlank() })
            .joinToString("_")
            .ifBlank { "pixiv_novel" }
        return "$base.txt"
    }

    private fun saveToDownloads(context: Context, name: String, content: String): Boolean {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) return false
        val resolver = context.contentResolver
        var uri: Uri? = null
        return try {
            val values = ContentValues().apply {
                put(MediaStore.MediaColumns.DISPLAY_NAME, name)
                put(MediaStore.MediaColumns.MIME_TYPE, "text/plain")
                put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_DOWNLOADS)
                put(MediaStore.MediaColumns.IS_PENDING, 1)
            }
            uri = resolver.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, values) ?: return false
            val stream = resolver.openOutputStream(uri) ?: return false
            stream.use { it.write(content.toByteArray(Charsets.UTF_8)) }
            values.clear()
            values.put(MediaStore.MediaColumns.IS_PENDING, 0)
            resolver.update(uri, values, null, null)
            true
        } catch (t: Throwable) {
            Log.e(TAG, "saveToDownloads failed", t)
            // A half-written pending row would stay invisible in the Downloads app forever.
            runCatching { uri?.let { resolver.delete(it, null, null) } }
            false
        }
    }

    private fun decodeJsString(raw: String?): String? {
        if (raw.isNullOrEmpty() || raw == "null") return null
        return runCatching { JSONTokener(raw).nextValue() as? String }.getOrNull()
    }

    private fun copyToClipboard(activity: Activity, text: String?) {
        if (text.isNullOrBlank()) {
            toast(activity, Strings.novelNothingToCopy)
            return
        }
        val manager = activity.getSystemService(Context.CLIPBOARD_SERVICE) as? ClipboardManager
        if (manager == null) {
            toast(activity, Strings.novelCopyFailed)
            return
        }
        manager.setPrimaryClip(ClipData.newPlainText("Pixiv", text))
        toast(activity, Strings.novelCopied)
    }

    // ---------------------------------------------------------------- view helpers

    private fun schedulePass(root: View?, delay: Long) {
        if (root == null) return
        val runnable = Runnable {
            try {
                enableSelectableText(root)
            } catch (t: Throwable) {
                Log.w(TAG, "selectable pass failed", t)
            }
        }
        if (delay <= 0L) mainHandler.post(runnable) else mainHandler.postDelayed(runnable, delay)
    }

    private fun enableSelectableText(root: View?) {
        if (root == null) return
        val ids = selectableIds(root.context)
        if (ids.isEmpty()) return
        walkForSelectable(root, ids, 0)
    }

    private fun walkForSelectable(view: View, ids: Set<Int>, depth: Int) {
        if (depth > 48) return
        if (view is TextView && view.id in ids && isPlainText(view)) {
            view.setTextIsSelectable(true)
        }
        if (view is ViewGroup) {
            for (index in 0 until view.childCount) walkForSelectable(view.getChildAt(index), ids, depth + 1)
        }
    }

    /**
     * The toolbar title has no id, so the toolbar's children are switched on as a whole. Menu
     * buttons live in the same toolbar and must be left alone, or they stop reacting to taps.
     */
    private fun enableToolbarTitle(activity: Activity) {
        val toolbar = findById(activity, "detail_tool_bar") ?: return
        enableTitleTextViews(toolbar)
    }

    private fun enableTitleTextViews(view: View) {
        if (view is TextView && !isMenuButton(view) && isPlainText(view)) view.setTextIsSelectable(true)
        if (view is ViewGroup) {
            for (index in 0 until view.childCount) enableTitleTextViews(view.getChildAt(index))
        }
    }

    private fun isMenuButton(view: View): Boolean = view.javaClass.name.contains("ActionMenuItem")

    private fun selectableIds(context: Context): Set<Int> {
        val packageName = context.packageName
        selectableIdsByPackage[packageName]?.let { return it }
        val resources = context.resources
        val ids = mutableSetOf<Int>()
        for (name in SELECTABLE_ID_NAMES) {
            val id = resources.getIdentifier(name, "id", packageName)
            if (id != 0) ids.add(id)
        }
        val frozen = ids.toSet()
        selectableIdsByPackage[packageName] = frozen
        return frozen
    }

    /**
     * Rows that open another screen keep their click behaviour: making their label selectable would
     * swallow the tap, so those titles are copied from the menu instead.
     */
    private fun isPlainText(view: TextView): Boolean = !view.isClickable && !hasClickableAncestor(view)

    private fun hasClickableAncestor(view: View): Boolean {
        var parent = view.parent
        var guard = 0
        while (parent is View && guard < 16) {
            if (parent.isClickable) return true
            parent = parent.parent
            guard++
        }
        return false
    }

    private fun textOf(activity: Activity, idName: String): String? {
        val view = findById(activity, idName) as? TextView ?: return null
        return view.text?.toString()?.trim()?.takeIf { it.isNotEmpty() }
    }

    /** The same id is used by the bottom bar and by every comment row, so the lookup is scoped. */
    private fun resolveAuthor(activity: Activity): String? =
        textInContainer(activity, "detail_bottom_bar_view", "user_name_text_view")
            ?: textInContainer(activity, "bottom_bar_view", "user_name_text_view")

    private fun textInContainer(activity: Activity, containerIdName: String, idName: String): String? {
        val container = findById(activity, containerIdName)
        val id = activity.resources.getIdentifier(idName, "id", activity.packageName)
        if (container == null || id == 0) return null
        val view = container.findViewById<View>(id) as? TextView ?: return null
        return view.text?.toString()?.trim()?.takeIf { it.isNotEmpty() }
    }

    private fun resolveTitle(activity: Activity): String? =
        textOf(activity, "title_text_view") ?: toolbarTitle(activity)

    private fun toolbarTitle(activity: Activity): String? {
        val toolbar = findById(activity, "detail_tool_bar") ?: return null
        val title = runCatching {
            toolbar.javaClass.getMethod("getTitle").invoke(toolbar) as? CharSequence
        }.getOrNull()
        return title?.toString()?.trim()?.takeIf { it.isNotEmpty() }
    }

    private fun findById(activity: Activity, idName: String): View? {
        val id = activity.resources.getIdentifier(idName, "id", activity.packageName)
        if (id == 0) return null
        return runCatching { activity.findViewById<View>(id) }.getOrNull()
    }

    private fun findWebView(activity: Activity): WebView? {
        (findById(activity, "web_view") as? WebView)?.let { return it }
        val decor = activity.window?.decorView ?: return null
        return findWebViewIn(decor)
    }

    private fun findWebViewIn(view: View): WebView? {
        if (view is WebView) return view
        if (view is ViewGroup) {
            for (index in 0 until view.childCount) {
                findWebViewIn(view.getChildAt(index))?.let { return it }
            }
        }
        return null
    }

    private fun isNovelSurface(activity: Activity): Boolean {
        val name = activity.javaClass.name.lowercase()
        return name.contains("novelviewer") || name.contains("novelseries")
    }

    private fun activityOf(context: Context?): Activity? {
        var current = context
        var guard = 0
        while (current is ContextWrapper && guard < 8) {
            if (current is Activity) return current
            current = current.baseContext
            guard++
        }
        return context as? Activity
    }

    private fun addMenuItem(menu: Menu, id: Int, title: String, order: Int) {
        if (menu.findItem(id) != null) return
        menu.add(Menu.NONE, id, order, title).setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER)
    }

    private fun toast(activity: Activity, message: String) {
        mainHandler.post { Toast.makeText(activity, message, Toast.LENGTH_SHORT).show() }
    }
}
