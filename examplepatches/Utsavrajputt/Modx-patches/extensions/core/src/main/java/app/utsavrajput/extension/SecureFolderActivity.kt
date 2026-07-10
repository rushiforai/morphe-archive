package app.utsavrajput.extension

import android.app.Activity
import android.content.Intent
import android.graphics.Color
import android.os.Bundle
import android.webkit.MimeTypeMap
import android.widget.Button
import android.widget.LinearLayout
import android.widget.TextView
import java.io.File

/**
 * The vault contents screen. Files are moved into getFilesDir()/secure_vault
 * (app-private storage, invisible to other apps and the normal Gallery/file
 * manager) - copied in from the picked file, original left untouched unless
 * you extend this to also delete the source.
 */
class SecureFolderActivity : Activity() {

    private lateinit var container: LinearLayout
    private val vaultDir: File by lazy { File(filesDir, "secure_vault").apply { mkdirs() } }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_secure_folder)

        container = findViewById(R.id.secure_folder_container)
        findViewById<Button>(R.id.secure_folder_add_button).setOnClickListener { pickFile() }

        render()
    }

    private fun pickFile() {
        val intent = Intent(Intent.ACTION_OPEN_DOCUMENT).apply {
            type = "*/*"
            addCategory(Intent.CATEGORY_OPENABLE)
        }
        startActivityForResult(intent, REQUEST_PICK_FILE)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode != REQUEST_PICK_FILE || resultCode != RESULT_OK) return
        val uri = data?.data ?: return

        val name = uri.lastPathSegment?.substringAfterLast('/') ?: "file_${System.currentTimeMillis()}"
        val destination = File(vaultDir, name)
        contentResolver.openInputStream(uri)?.use { input ->
            destination.outputStream().use { output -> input.copyTo(output) }
        }
        render()
    }

    private fun render() {
        container.removeAllViews()
        val files = vaultDir.listFiles()?.sortedByDescending { it.lastModified() } ?: emptyList()

        if (files.isEmpty()) {
            container.addView(
                TextView(this).apply {
                    text = "Vault is empty. Tap + Add to move a file in."
                    setTextColor(Color.parseColor("#AAAAAA"))
                },
            )
            return
        }

        files.forEach { file -> container.addView(buildRow(file)) }
    }

    private fun buildRow(file: File): LinearLayout {
        val row = LinearLayout(this).apply {
            orientation = LinearLayout.HORIZONTAL
            setPadding(16, 16, 16, 16)
            setBackgroundColor(Color.parseColor("#1C1C1C"))
            val params = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT,
            )
            params.bottomMargin = 12
            layoutParams = params
        }

        row.addView(
            TextView(this).apply {
                text = file.name
                setTextColor(Color.WHITE)
                textSize = 13f
                layoutParams = LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f)
            },
        )
        row.addView(
            Button(this).apply {
                text = "Share"
                setOnClickListener {
                    val ext = file.extension
                    val mime = MimeTypeMap.getSingleton().getMimeTypeFromExtension(ext) ?: "*/*"
                    FileUtils.shareFile(this@SecureFolderActivity, file, mime)
                }
            },
        )
        row.addView(
            Button(this).apply {
                text = "Remove"
                setOnClickListener {
                    file.delete()
                    render()
                }
            },
        )
        return row
    }

    companion object {
        private const val REQUEST_PICK_FILE = 4204
    }
}
