package app.utsavrajput.extension

import android.app.AlertDialog
import android.app.Activity
import android.content.Intent
import android.graphics.Color
import android.net.Uri
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.LinearLayout
import android.widget.TextView
import org.json.JSONArray
import org.json.JSONObject

/**
 * Simple local playlist manager. Playlists are stored as JSON in
 * SharedPreferences (no server, no external DB dependency). Each entry
 * stores the video's content:// Uri (persisted permission taken on add) and
 * a display name. Playing a video hands off to the system video intent -
 * on this device that resolves to MX Player itself in the normal case,
 * since MX Player is a registered video handler.
 */
class PlaylistActivity : Activity() {

    private lateinit var container: LinearLayout
    private val prefs by lazy { getSharedPreferences("modx_playlists", MODE_PRIVATE) }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_playlist)

        container = findViewById(R.id.playlist_container)
        findViewById<Button>(R.id.playlist_add_button).setOnClickListener { promptNewPlaylistName() }

        render()
    }

    private fun promptNewPlaylistName() {
        val input = EditText(this)
        AlertDialog.Builder(this)
            .setTitle("New playlist")
            .setView(input)
            .setPositiveButton("Create") { _, _ ->
                val name = input.text.toString().trim()
                if (name.isNotEmpty()) {
                    val data = loadData()
                    if (!data.has(name)) data.put(name, JSONArray())
                    saveData(data)
                    render()
                }
            }
            .setNegativeButton("Cancel", null)
            .show()
    }

    private fun render() {
        container.removeAllViews()
        val data = loadData()
        val names = data.keys().asSequence().toList()

        if (names.isEmpty()) {
            container.addView(
                TextView(this).apply {
                    text = "No playlists yet. Tap + to create one."
                    setTextColor(Color.parseColor("#AAAAAA"))
                },
            )
            return
        }

        names.forEach { name -> container.addView(buildPlaylistRow(name, data.getJSONArray(name))) }
    }

    private fun buildPlaylistRow(name: String, videos: JSONArray): LinearLayout {
        val row = LinearLayout(this).apply {
            orientation = LinearLayout.VERTICAL
            setPadding(24, 24, 24, 24)
            setBackgroundColor(Color.parseColor("#1C1C1C"))
            val params = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT,
            )
            params.bottomMargin = 16
            layoutParams = params
        }

        row.addView(
            TextView(this).apply {
                text = "$name (${videos.length()})"
                setTextColor(Color.WHITE)
                textSize = 16f
            },
        )

        val actions = LinearLayout(this).apply { orientation = LinearLayout.HORIZONTAL }
        actions.addView(
            Button(this).apply {
                text = "Add video"
                setOnClickListener { pendingPlaylist = name; pickVideo() }
            },
        )
        actions.addView(
            Button(this).apply {
                text = "Play all"
                setOnClickListener { playFirst(videos) }
            },
        )
        actions.addView(
            Button(this).apply {
                text = "Delete"
                setOnClickListener {
                    val data = loadData()
                    data.remove(name)
                    saveData(data)
                    render()
                }
            },
        )
        row.addView(actions)
        return row
    }

    private var pendingPlaylist: String? = null

    private fun pickVideo() {
        val intent = Intent(Intent.ACTION_OPEN_DOCUMENT).apply {
            type = "video/*"
            addCategory(Intent.CATEGORY_OPENABLE)
        }
        startActivityForResult(intent, REQUEST_PICK_VIDEO)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode != REQUEST_PICK_VIDEO || resultCode != RESULT_OK) return
        val uri = data?.data ?: return
        val playlistName = pendingPlaylist ?: return

        contentResolver.takePersistableUriPermission(uri, Intent.FLAG_GRANT_READ_URI_PERMISSION)

        val playlists = loadData()
        val videos = playlists.optJSONArray(playlistName) ?: JSONArray()
        val entry = JSONObject().apply {
            put("uri", uri.toString())
            put("name", uri.lastPathSegment ?: "video")
        }
        videos.put(entry)
        playlists.put(playlistName, videos)
        saveData(playlists)
        render()
    }

    private fun playFirst(videos: JSONArray) {
        if (videos.length() == 0) return
        val uri = Uri.parse(videos.getJSONObject(0).getString("uri"))
        val intent = Intent(Intent.ACTION_VIEW).apply {
            setDataAndType(uri, "video/*")
            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
        }
        startActivity(intent)
    }

    private fun loadData(): JSONObject {
        val raw = prefs.getString(KEY_PLAYLISTS, "{}") ?: "{}"
        return JSONObject(raw)
    }

    private fun saveData(data: JSONObject) {
        prefs.edit().putString(KEY_PLAYLISTS, data.toString()).apply()
    }

    companion object {
        private const val REQUEST_PICK_VIDEO = 4203
        private const val KEY_PLAYLISTS = "playlists_json"
    }
}
