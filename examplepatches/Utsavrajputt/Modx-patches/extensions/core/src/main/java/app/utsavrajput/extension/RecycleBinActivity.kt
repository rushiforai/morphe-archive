package app.utsavrajput.extension

import android.app.Activity
import android.content.Intent
import android.graphics.Color
import android.net.Uri
import android.os.Bundle
import android.widget.Button
import android.widget.LinearLayout
import android.widget.TextView
import org.json.JSONObject
import java.io.File

/**
 * Recycle Bin: a general-purpose trash for the Tools screens. Built
 * entirely in code - no XML layout / R.layout reference (see UiUtils.kt
 * for why).
 */
class RecycleBinActivity : Activity() {

    private lateinit var container: LinearLayout
    private val binDir: File by lazy { File(filesDir, "recycle_bin").apply { mkdirs() } }
    private val prefs by lazy { getSharedPreferences("modx_recycle_bin", MODE_PRIVATE) }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val scaffold = UiUtils.scaffold(this)
        val scroll = scaffold.scroll
        val content = scaffold.content
        content.addView(UiUtils.heading(this, "Recycle Bin", sizeSp = 22f))

        container = UiUtils.container(this)
        content.addView(container)

        setContentView(scroll)
        render()
    }

    private fun render() {
        container.removeAllViews()
        val metadata = loadMetadata()
        val filesArray = binDir.listFiles()
        val files = ArrayList<File>()
        if (filesArray != null) {
            for (f in filesArray) files.add(f)
            java.util.Collections.sort(files) { a, b -> b.lastModified().compareTo(a.lastModified()) }
        }

        if (files.isEmpty()) {
            container.addView(
                TextView(this).apply {
                    text = "Recycle bin is empty."
                    setTextColor(Color.parseColor(UiUtils.TEXT_SECONDARY))
                },
            )
            return
        }

        files.forEach { file -> container.addView(buildRow(file, metadata)) }
    }

    private fun buildRow(file: File, metadata: JSONObject): LinearLayout {
        val originalName = metadata.optJSONObject(file.name)?.optString("originalName", file.name) ?: file.name

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
                text = originalName
                setTextColor(Color.WHITE)
                textSize = 13f
                layoutParams = LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f)
            },
        )
        row.addView(
            Button(this).apply {
                text = "Share/Restore"
                setOnClickListener {
                    val ext = FileUtils.fileExtension(file.name)
                    val mime = android.webkit.MimeTypeMap.getSingleton()
                        .getMimeTypeFromExtension(ext) ?: "*/*"
                    FileUtils.shareFile(this@RecycleBinActivity, file, mime)
                }
            },
        )
        row.addView(
            Button(this).apply {
                text = "Delete forever"
                setOnClickListener {
                    file.delete()
                    val meta = loadMetadata()
                    meta.remove(file.name)
                    saveMetadata(meta)
                    render()
                }
            },
        )
        return row
    }

    private fun loadMetadata(): JSONObject = JSONObject(prefs.getString(KEY_METADATA, "{}") ?: "{}")

    private fun saveMetadata(data: JSONObject) {
        prefs.edit().putString(KEY_METADATA, data.toString()).apply()
    }

    companion object {
        private const val KEY_METADATA = "recycle_bin_metadata"

        /**
         * Call from other tool screens to trash a file instead of deleting
         * it outright: `RecycleBinActivity.trash(context, sourceUri, "photo.jpg")`
         */
        fun trash(activity: Activity, sourceUri: Uri, originalName: String) {
            val binDir = File(activity.filesDir, "recycle_bin").apply { mkdirs() }
            val storedName = "${System.currentTimeMillis()}_$originalName"
            val destination = File(binDir, storedName)

            activity.contentResolver.openInputStream(sourceUri)?.use { input ->
                java.io.FileOutputStream(destination).use { output -> FileUtils.copyStream(input, output) }
            }

            val prefs = activity.getSharedPreferences("modx_recycle_bin", MODE_PRIVATE)
            val metadata = JSONObject(prefs.getString(KEY_METADATA, "{}") ?: "{}")
            metadata.put(storedName, JSONObject().put("originalName", originalName))
            prefs.edit().putString(KEY_METADATA, metadata.toString()).apply()
        }
    }
}
