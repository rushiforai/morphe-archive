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
 * The vault contents screen. Built entirely in code - no XML layout /
 * R.layout reference (see UiUtils.kt for why).
 */
class SecureFolderActivity : Activity() {

    private lateinit var container: LinearLayout
    private val vaultDir: File by lazy { File(filesDir, "secure_vault").apply { mkdirs() } }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val scaffold = UiUtils.scaffold(this)
        val scroll = scaffold.scroll
        val content = scaffold.content

        val addButton = Button(this).apply {
            text = "+ Add"
            setOnClickListener { pickFile() }
        }
        content.addView(UiUtils.titleRow(this, "Secure Folder", 22f, addButton))

        container = UiUtils.container(this)
        content.addView(container)

        setContentView(scroll)
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
            java.io.FileOutputStream(destination).use { output -> FileUtils.copyStream(input, output) }
        }
        render()
    }

    private fun render() {
        container.removeAllViews()
        val filesArray = vaultDir.listFiles()
        val files = ArrayList<File>()
        if (filesArray != null) {
            for (f in filesArray) files.add(f)
            java.util.Collections.sort(files) { a, b -> b.lastModified().compareTo(a.lastModified()) }
        }

        if (files.isEmpty()) {
            container.addView(
                TextView(this).apply {
                    text = "Vault is empty. Tap + Add to move a file in."
                    setTextColor(Color.parseColor(UiUtils.TEXT_SECONDARY))
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
                    val ext = FileUtils.fileExtension(file.name)
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
