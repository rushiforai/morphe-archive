package app.utsavrajput.extension

import android.app.Activity
import android.content.Intent
import android.graphics.Color
import android.net.Uri
import android.os.Bundle
import android.widget.Button
import android.widget.LinearLayout
import android.widget.TextView
import androidx.documentfile.provider.DocumentFile

/**
 * WhatsApp Status Saver. Built entirely in code - no XML layout / R.layout
 * reference (see UiUtils.kt for why).
 */
class StatusSaverActivity : Activity() {

    private lateinit var listContainer: LinearLayout
    private lateinit var statusText: TextView

    private val prefs by lazy { getSharedPreferences("modx_status_saver", MODE_PRIVATE) }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val scaffold = UiUtils.scaffold(this)
        val scroll = scaffold.scroll
        val content = scaffold.content
        content.addView(UiUtils.heading(this, "WhatsApp Status Saver", sizeSp = 22f))

        content.addView(
            Button(this).apply {
                text = "Select status folder"
                setOnClickListener { pickStatusFolder() }
            },
        )

        statusText = TextView(this).apply {
            setTextColor(Color.parseColor(UiUtils.TEXT_SECONDARY))
            val params = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT,
            )
            params.topMargin = 12
            params.bottomMargin = 16
            layoutParams = params
        }
        content.addView(statusText)

        listContainer = UiUtils.container(this)
        content.addView(listContainer)

        setContentView(scroll)

        prefs.getString(KEY_FOLDER_URI, null)?.let { uriString ->
            loadStatuses(Uri.parse(uriString))
        } ?: run {
            statusText.text = "Select your WhatsApp status folder to begin " +
                "(Android/media/com.whatsapp/WhatsApp/Media/.Statuses)."
        }
    }

    private fun pickStatusFolder() {
        val intent = Intent(Intent.ACTION_OPEN_DOCUMENT_TREE)
        startActivityForResult(intent, REQUEST_PICK_FOLDER)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode != REQUEST_PICK_FOLDER || resultCode != RESULT_OK) return
        val treeUri = data?.data ?: return

        contentResolver.takePersistableUriPermission(
            treeUri,
            Intent.FLAG_GRANT_READ_URI_PERMISSION or Intent.FLAG_GRANT_WRITE_URI_PERMISSION,
        )
        prefs.edit().putString(KEY_FOLDER_URI, treeUri.toString()).apply()
        loadStatuses(treeUri)
    }

    private fun loadStatuses(treeUri: Uri) {
        listContainer.removeAllViews()
        val folder = DocumentFile.fromTreeUri(this, treeUri)
        val fileArray = folder?.listFiles()
        val files = ArrayList<DocumentFile>()
        if (fileArray != null) {
            for (f in fileArray) {
                if (f.isFile && (f.type?.startsWith("image") == true || f.type?.startsWith("video") == true)) {
                    files.add(f)
                }
            }
        }

        if (files.isEmpty()) {
            statusText.text = "No statuses found. Make sure you selected the .Statuses folder " +
                "and someone has posted a status recently."
            return
        }

        statusText.text = "${files.size} status(es) found"
        files.forEach { file -> listContainer.addView(buildRow(file)) }
    }

    private fun buildRow(file: DocumentFile): LinearLayout {
        val row = LinearLayout(this).apply {
            orientation = LinearLayout.HORIZONTAL
            setPadding(16, 16, 16, 16)
            setBackgroundColor(Color.parseColor(UiUtils.ROW_BACKGROUND))
            val params = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT,
            )
            params.bottomMargin = 12
            layoutParams = params
        }

        row.addView(
            TextView(this).apply {
                text = file.name ?: "status"
                setTextColor(Color.WHITE)
                textSize = 13f
                layoutParams = LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f)
            },
        )

        row.addView(
            Button(this).apply {
                text = "Save"
                setOnClickListener { saveStatus(file) }
            },
        )
        row.addView(
            Button(this).apply {
                text = "Share"
                setOnClickListener {
                    FileUtils.shareUri(this@StatusSaverActivity, file.uri, file.type ?: "*/*")
                }
            },
        )
        return row
    }

    private fun saveStatus(file: DocumentFile) {
        val mimeType = file.type ?: return
        val name = file.name ?: "status_${System.currentTimeMillis()}"
        contentResolver.openInputStream(file.uri)?.use { input ->
            val saved = FileUtils.saveToGallery(this, input, name, mimeType)
            statusText.text = if (saved != null) "Saved: $name" else "Failed to save $name"
        }
    }

    companion object {
        private const val REQUEST_PICK_FOLDER = 4202
        private const val KEY_FOLDER_URI = "status_folder_uri"
    }
}
