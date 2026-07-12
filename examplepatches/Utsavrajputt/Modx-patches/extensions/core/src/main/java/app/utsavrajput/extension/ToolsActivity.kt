package app.utsavrajput.extension

import android.app.Activity
import android.content.Intent
import android.graphics.Color
import android.os.Bundle
import android.view.Gravity
import android.view.View
import android.widget.LinearLayout
import android.widget.TextView

/**
 * "Tools" tab screen - a simple menu listing each tool. Tapping a row
 * launches that tool's own Activity.
 *
 * Built entirely in code - no XML layout / R.layout reference (see
 * UiUtils.kt for why).
 *
 * The tool list is built with a plain java.util.ArrayList + add() calls
 * instead of Kotlin's listOf(vararg) - confirmed crash cause:
 * java.lang.NoSuchMethodError: No static method
 * listOf([Ljava/lang/Object;)Ljava/util/List; in class
 * Lkotlin/collections/CollectionsKt. MX Player's own base.apk already
 * contains a (R8-shrunk) copy of kotlin.collections.CollectionsKt with
 * unused overloads stripped, and the classloader resolves against that
 * existing class instead of pulling in this module's full copy - so any
 * Kotlin stdlib call not already used elsewhere in MX Player's own code can
 * be missing at runtime even though it compiles fine. Sticking to plain
 * java.util collection calls avoids CollectionsKt entirely.
 */
class ToolsActivity : Activity() {

    private data class ToolEntry(val title: String, val subtitle: String, val target: Class<*>)

    private val tools: List<ToolEntry> = ArrayList<ToolEntry>().apply {
        add(ToolEntry("Transfer Files", "Send files nearby via Android Nearby Share", TransferFilesActivity::class.java))
        add(ToolEntry("WhatsApp Status Saver", "Save and share WhatsApp statuses", StatusSaverActivity::class.java))
        add(ToolEntry("Playlist", "Create and manage local video playlists", PlaylistActivity::class.java))
        add(ToolEntry("Secure Folder", "PIN-protected private file vault", SecureFolderPinActivity::class.java))
        add(ToolEntry("URL Stream", "Play a video from a direct URL", UrlStreamActivity::class.java))
        add(ToolEntry("Recycle Bin", "Restore or permanently delete trashed files", RecycleBinActivity::class.java))
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val scaffold = UiUtils.scaffold(this)
        val scroll = scaffold.scroll
        val content = scaffold.content
        content.addView(UiUtils.heading(this, "Tools", sizeSp = 28f))

        val container = UiUtils.container(this)
        for (i in tools.indices) {
            container.addView(buildToolRow(tools[i]))
        }
        content.addView(container)

        setContentView(scroll)
    }

    private fun buildToolRow(tool: ToolEntry): View {
        val row = LinearLayout(this).apply {
            orientation = LinearLayout.VERTICAL
            setPadding(24, 24, 24, 24)
            setBackgroundColor(Color.parseColor(UiUtils.ROW_BACKGROUND))
            isClickable = true
            isFocusable = true
            val params = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT,
            )
            params.bottomMargin = 16
            layoutParams = params
            setOnClickListener { startActivity(Intent(this@ToolsActivity, tool.target)) }
        }

        row.addView(
            TextView(this).apply {
                text = tool.title
                setTextColor(Color.WHITE)
                textSize = 16f
                gravity = Gravity.START
            },
        )
        row.addView(
            TextView(this).apply {
                text = tool.subtitle
                setTextColor(Color.parseColor(UiUtils.TEXT_SECONDARY))
                textSize = 13f
                gravity = Gravity.START
            },
        )
        return row
    }
}
