package app.utsavrajput.extension

import android.app.Activity
import android.content.ActivityNotFoundException
import android.content.Intent
import android.graphics.Color
import android.net.Uri
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.LinearLayout
import android.widget.TextView

/**
 * Plays a direct video URL via the system's video intent. Built entirely
 * in code - no XML layout / R.layout reference (see UiUtils.kt for why).
 */
class UrlStreamActivity : Activity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val root = UiUtils.rootColumn(this)
        root.addView(UiUtils.heading(this, "URL Stream", sizeSp = 24f))

        val urlInput = EditText(this).apply {
            hint = "https://example.com/video.mp4"
            setTextColor(Color.WHITE)
            val params = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT,
            )
            params.bottomMargin = 16
            layoutParams = params
        }
        root.addView(urlInput)

        val statusText = TextView(this).apply {
            setTextColor(Color.parseColor(UiUtils.TEXT_SECONDARY))
            val params = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT,
            )
            params.topMargin = 16
            layoutParams = params
        }

        val playButton = Button(this).apply {
            text = "Play"
            setOnClickListener {
                val url = urlInput.text.toString().trim()
                if (url.isEmpty()) {
                    statusText.text = "Enter a URL first."
                    return@setOnClickListener
                }

                val intent = Intent(Intent.ACTION_VIEW).apply {
                    setDataAndType(Uri.parse(url), "video/*")
                    addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                }
                try {
                    startActivity(intent)
                } catch (e: ActivityNotFoundException) {
                    statusText.text = "No app could open this URL."
                }
            }
        }
        root.addView(playButton)
        root.addView(statusText)

        setContentView(root)
    }
}
