package app.utsavrajput.extension

import android.app.Activity
import android.content.Intent
import android.graphics.Color
import android.net.Uri
import android.os.Bundle
import android.widget.Button
import android.widget.LinearLayout
import android.widget.TextView
import org.json.JSONArray
import org.json.JSONObject
import java.io.File

/**
 * Recycle Bin: a general-purpose trash for the Tools screens. Trashed
 * files are copied into getFilesDir()/recycle_bin (app-private storage)
 * with their original source Uri remembered, so "Restore" can attempt to
 * write back to a SAF-writable location if you extend this - as shipped,
 * Restore re-shares the file so you can save it back wherever you like
 * (writing to an arbitrary original path isn't always permitted without a
 * persisted write grant on that exact file).
 *
 * Use FileUtils / this Activity's `trash(context, uri, displayName)` from
 * other tool screens (e.g. Secure Folder "Remove", Status Saver "Delete")
 * once you wire a delete action there - trashing here instead of deleting
 * outright is what makes those actions recoverable.
 */
class RecycleBinActivity : Activity() {

    private lateinit var container: LinearLayout
    private val binDir: File by lazy { File(filesDir, "recycle_bin").apply { mkdirs() } }
    private val prefs by lazy { getSharedPreferences("modx_recycle_bin", MODE_PRIVATE) }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_recycle_bin)

        container = findViewById(R.id.recycle_bin_container)
        render()
    }

    private fun render() {
        container.removeAllViews()
        val metadata = loadMetadata()
        val files = binDir.listFiles()?.sortedByDescending { it.lastModified() } ?: emptyList()

        if (files.isEmpty()) {
            container.addView(
                TextView(this).apply {
                    text = "Recycle bin is empty."
                    setTextColor(Color.parseColor("#AAAAAA"))
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
                    val ext = file.extension
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
                destination.outputStream().use { output -> input.copyTo(output) }
            }

            val prefs = activity.getSharedPreferences("modx_recycle_bin", MODE_PRIVATE)
            val metadata = JSONObject(prefs.getString(KEY_METADATA, "{}") ?: "{}")
            metadata.put(storedName, JSONObject().put("originalName", originalName))
            prefs.edit().putString(KEY_METADATA, metadata.toString()).apply()
        }
    }
}
