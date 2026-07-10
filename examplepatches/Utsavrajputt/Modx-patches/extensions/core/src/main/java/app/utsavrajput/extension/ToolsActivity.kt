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
 */
class ToolsActivity : Activity() {

    private data class ToolEntry(val title: String, val subtitle: String, val target: Class<*>)

    private val tools = listOf(
        ToolEntry("Transfer Files", "Send files nearby via Android Nearby Share", TransferFilesActivity::class.java),
        ToolEntry("WhatsApp Status Saver", "Save and share WhatsApp statuses", StatusSaverActivity::class.java),
        ToolEntry("Playlist", "Create and manage local video playlists", PlaylistActivity::class.java),
        ToolEntry("Secure Folder", "PIN-protected private file vault", SecureFolderPinActivity::class.java),
        ToolEntry("URL Stream", "Play a video from a direct URL", UrlStreamActivity::class.java),
        ToolEntry("Recycle Bin", "Restore or permanently delete trashed files", RecycleBinActivity::class.java),
    )

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_tools)

        val container = findViewById<LinearLayout>(R.id.tools_container)
        tools.forEach { tool -> container.addView(buildToolRow(tool)) }
    }

    private fun buildToolRow(tool: ToolEntry): View {
        val row = LinearLayout(this).apply {
            orientation = LinearLayout.VERTICAL
            setPadding(24, 24, 24, 24)
            setBackgroundColor(Color.parseColor("#1C1C1C"))
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
                setTextColor(Color.parseColor("#AAAAAA"))
                textSize = 13f
                gravity = Gravity.START
            },
        )
        return row
    }
}
