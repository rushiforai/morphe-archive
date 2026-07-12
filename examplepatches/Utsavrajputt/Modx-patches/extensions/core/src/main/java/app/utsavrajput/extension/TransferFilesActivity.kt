package app.utsavrajput.extension

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.widget.Button
import android.widget.LinearLayout
import android.widget.TextView

/**
 * Lets the user pick one or more files and share them through the system
 * share sheet. Built entirely in code - no XML layout / R.layout reference
 * (see UiUtils.kt for why).
 */
class TransferFilesActivity : Activity() {

    private lateinit var statusText: TextView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val root = UiUtils.rootColumn(this)
        root.addView(UiUtils.heading(this, "Transfer Files", sizeSp = 24f))

        root.addView(
            Button(this).apply {
                text = "Pick files to send"
                setOnClickListener { pickFiles() }
            },
        )

        statusText = TextView(this).apply {
            setTextColor(android.graphics.Color.parseColor(UiUtils.TEXT_SECONDARY))
            val params = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT,
            )
            params.topMargin = 16
            layoutParams = params
        }
        root.addView(statusText)

        setContentView(root)
    }

    private fun pickFiles() {
        val intent = Intent(Intent.ACTION_OPEN_DOCUMENT).apply {
            type = "*/*"
            putExtra(Intent.EXTRA_ALLOW_MULTIPLE, true)
            addCategory(Intent.CATEGORY_OPENABLE)
        }
        startActivityForResult(intent, REQUEST_PICK_FILES)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode != REQUEST_PICK_FILES || resultCode != RESULT_OK || data == null) return

        val uris = ArrayList<Uri>()
        val clip = data.clipData
        if (clip != null) {
            for (i in 0 until clip.itemCount) uris.add(clip.getItemAt(i).uri)
        } else {
            data.data?.let { uris.add(it) }
        }
        if (uris.isEmpty()) return

        for (i in uris.indices) {
            runCatching {
                contentResolver.takePersistableUriPermission(uris[i], Intent.FLAG_GRANT_READ_URI_PERMISSION)
            }
        }

        statusText.text = "${uris.size} file(s) selected. Opening share sheet..."

        val sendIntent = Intent(Intent.ACTION_SEND_MULTIPLE).apply {
            type = "*/*"
            putParcelableArrayListExtra(Intent.EXTRA_STREAM, uris)
            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
        }
        startActivity(Intent.createChooser(sendIntent, "Send via"))
    }

    companion object {
        private const val REQUEST_PICK_FILES = 4201
    }
}
