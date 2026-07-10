package app.utsavrajput.extension

import android.app.Activity
import android.content.ActivityNotFoundException
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.TextView

/**
 * Plays a direct video URL (http/https/rtsp/etc.) via the system's video
 * intent. Since MX Player is a registered video handler, this typically
 * opens straight in MX Player's own player - no bundled player of our own
 * needed.
 */
class UrlStreamActivity : Activity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_url_stream)

        val urlInput = findViewById<EditText>(R.id.url_stream_input)
        val statusText = findViewById<TextView>(R.id.url_stream_status)

        findViewById<Button>(R.id.url_stream_play_button).setOnClickListener {
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
}
