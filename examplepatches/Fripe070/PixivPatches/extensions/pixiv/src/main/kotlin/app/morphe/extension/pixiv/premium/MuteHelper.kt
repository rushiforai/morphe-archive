package app.morphe.extension.pixiv.premium

import android.app.Activity
import android.app.AlertDialog
import android.content.ClipData
import android.content.ClipboardManager
import android.content.Context
import android.content.Intent
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.ColorFilter
import android.graphics.Paint
import android.graphics.Path
import android.graphics.PixelFormat
import android.graphics.Rect
import android.graphics.Typeface
import android.graphics.drawable.Drawable
import android.graphics.drawable.GradientDrawable
import android.os.Build
import android.util.TypedValue
import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.widget.EditText
import android.widget.FrameLayout
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.PopupMenu
import android.widget.ScrollView
import android.widget.TextView
import android.widget.Toast
import java.lang.ref.WeakReference
import java.lang.reflect.Constructor
import java.lang.reflect.Field
import java.util.concurrent.ConcurrentHashMap
import org.json.JSONArray
import org.json.JSONObject

object MuteHelper {

    private const val PREFS_NAME = "pixiv_morphe_mute_prefs"
    private const val KEY_MUTED_TAGS = "muted_tags"
    private const val KEY_MUTED_USERS = "muted_users"

    data class MutedUserData(
        val id: Long,
        val name: String,
        val account: String,
        val avatarUrl: String
    )

    enum class ImportMode {
        MERGE,
        REPLACE
    }

    data class ParsedMuteData(
        val tags: Set<String>,
        val users: List<MutedUserData>
    )

    private val userCache = ConcurrentHashMap<Long, MutedUserData>()
    private var activeSa6: WeakReference<Any>? = null

    private var pixivTagCtor: Constructor<*>? = null
    private var pixivMutedTagCtor: Constructor<*>? = null
    private var pixivUserCtor: Constructor<*>? = null
    private var pixivProfileImageUrlsCtor: Constructor<*>? = null
    private var pixivMutedUserCtor: Constructor<*>? = null

    private fun getContext(): Context? {
        return runCatching {
            val activityThreadClass = Class.forName("android.app.ActivityThread")
            val currentAppMethod = activityThreadClass.getMethod("currentApplication")
            currentAppMethod.invoke(null) as? Context
        }.getOrNull()
    }

    private fun dpToPx(context: Context, dp: Float): Float {
        return TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_DIP,
            dp,
            context.resources.displayMetrics
        )
    }

    private fun getStatusBarHeight(context: Context): Int {
        if (context is Activity && Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            val insets = context.window.decorView.rootWindowInsets
            val statusBarInsets = insets?.getInsets(android.view.WindowInsets.Type.statusBars())
            if (statusBarInsets != null && statusBarInsets.top > 0) {
                return statusBarInsets.top
            }
        }
        val resourceId = context.resources.getIdentifier("status_bar_height", "dimen", "android")
        return if (resourceId > 0) context.resources.getDimensionPixelSize(resourceId) else 0
    }

    @JvmStatic
    fun rememberUser(id: Long, name: String, account: String? = null, avatarUrl: String? = null) {
        val data = MutedUserData(
            id = id,
            name = name,
            account = account ?: "$id",
            avatarUrl = avatarUrl ?: ""
        )
        userCache[id] = data
    }

    @JvmStatic
    fun initSa6(sa6: Any?) {
        if (sa6 == null) return
        activeSa6 = WeakReference(sa6)
        try {
            val eField = sa6.javaClass.getDeclaredField("e").apply { isAccessible = true }
            val fField = sa6.javaClass.getDeclaredField("f").apply { isAccessible = true }
            @Suppress("UNCHECKED_CAST")
            val usersMap = eField.get(sa6) as? MutableMap<Long, Boolean> ?: return
            @Suppress("UNCHECKED_CAST")
            val tagsMap = fField.get(sa6) as? MutableMap<String, Boolean> ?: return

            for (user in getLocalMutedUsers()) {
                usersMap[user.id] = true
            }
            for (tag in getLocalMutedTags()) {
                tagsMap[tag] = true
            }
        } catch (_: Throwable) {
        }
    }

    @JvmStatic
    fun updateActiveSa6(clearFirst: Boolean = false) {
        val sa6 = activeSa6?.get() ?: return
        try {
            val eField = sa6.javaClass.getDeclaredField("e").apply { isAccessible = true }
            val fField = sa6.javaClass.getDeclaredField("f").apply { isAccessible = true }
            @Suppress("UNCHECKED_CAST")
            val usersMap = eField.get(sa6) as? MutableMap<Long, Boolean> ?: return
            @Suppress("UNCHECKED_CAST")
            val tagsMap = fField.get(sa6) as? MutableMap<String, Boolean> ?: return

            if (clearFirst) {
                usersMap.clear()
                tagsMap.clear()
            }
            for (user in getLocalMutedUsers()) {
                usersMap[user.id] = true
            }
            for (tag in getLocalMutedTags()) {
                tagsMap[tag] = true
            }
        } catch (_: Throwable) {
        }
    }

    @JvmStatic
    fun onMuteSettingUpdated(
        addUserIds: List<*>?,
        deleteUserIds: List<*>?,
        addTags: List<*>?,
        deleteTags: List<*>?
    ) {
        try {
            updateLocalMutedTags(addTags, deleteTags)
            updateLocalMutedUsers(addUserIds, deleteUserIds)
            updateActiveSa6()
        } catch (_: Throwable) {
        }
    }

    @JvmStatic
    fun getLocalMutedTags(): Set<String> {
        val ctx = getContext() ?: return emptySet()
        val prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        return prefs.getStringSet(KEY_MUTED_TAGS, null)?.toSet() ?: emptySet()
    }

    @Synchronized
    private fun updateLocalMutedTags(addTags: List<*>?, deleteTags: List<*>?) {
        val ctx = getContext() ?: return
        val prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val current = HashSet(prefs.getStringSet(KEY_MUTED_TAGS, null) ?: emptySet())
        var changed = false

        if (addTags != null) {
            for (tag in addTags) {
                val str = tag?.toString()?.trim()
                if (!str.isNullOrEmpty() && current.add(str)) {
                    changed = true
                }
            }
        }
        if (deleteTags != null) {
            for (tag in deleteTags) {
                val str = tag?.toString()?.trim()
                if (!str.isNullOrEmpty() && current.remove(str)) {
                    changed = true
                }
            }
        }

        if (changed) {
            prefs.edit().putStringSet(KEY_MUTED_TAGS, current).apply()
        }
    }

    @JvmStatic
    fun getLocalMutedUsers(): List<MutedUserData> {
        val ctx = getContext() ?: return emptyList()
        val prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val jsonStr = prefs.getString(KEY_MUTED_USERS, null) ?: return emptyList()
        return runCatching {
            val array = JSONArray(jsonStr)
            val list = ArrayList<MutedUserData>(array.length())
            for (i in 0 until array.length()) {
                val obj = array.getJSONObject(i)
                val id = obj.getLong("id")
                val name = obj.optString("name", "User #$id")
                val account = obj.optString("account", "$id")
                val avatarUrl = obj.optString("avatarUrl", "")
                list.add(MutedUserData(id, name, account, avatarUrl))
            }
            list
        }.getOrDefault(emptyList())
    }

    @Synchronized
    private fun updateLocalMutedUsers(addUserIds: List<*>?, deleteUserIds: List<*>?) {
        val ctx = getContext() ?: return
        val prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val currentUsers = getLocalMutedUsers().toMutableList()
        var changed = false

        if (deleteUserIds != null) {
            val toDelete = deleteUserIds.mapNotNull {
                (it as? Number)?.toLong() ?: it?.toString()?.toLongOrNull()
            }.toSet()
            if (toDelete.isNotEmpty()) {
                val removed = currentUsers.removeAll { toDelete.contains(it.id) }
                if (removed) changed = true
            }
        }

        if (addUserIds != null) {
            for (item in addUserIds) {
                val id = (item as? Number)?.toLong() ?: item?.toString()?.toLongOrNull() ?: continue
                if (currentUsers.none { it.id == id }) {
                    val cached = userCache[id]
                    val name = cached?.name ?: "User #$id"
                    val account = cached?.account ?: "$id"
                    val avatar = cached?.avatarUrl ?: ""
                    currentUsers.add(MutedUserData(id, name, account, avatar))
                    changed = true
                }
            }
        }

        if (changed) {
            saveUsersToPrefs(prefs, currentUsers)
        }
    }

    @Synchronized
    fun setLocalMutedData(tags: Set<String>, users: List<MutedUserData>, mode: ImportMode) {
        val ctx = getContext() ?: return
        val prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)

        val finalTags = if (mode == ImportMode.MERGE) {
            val current = HashSet(getLocalMutedTags())
            current.addAll(tags)
            current
        } else {
            tags
        }

        val finalUsers = if (mode == ImportMode.MERGE) {
            val current = getLocalMutedUsers().toMutableList()
            for (user in users) {
                val idx = current.indexOfFirst { it.id == user.id }
                if (idx >= 0) {
                    val existing = current[idx]
                    val name = if (user.name != "User #${user.id}") user.name else existing.name
                    val account = if (user.account != "${user.id}") user.account else existing.account
                    val avatar = if (user.avatarUrl.isNotEmpty()) user.avatarUrl else existing.avatarUrl
                    current[idx] = MutedUserData(user.id, name, account, avatar)
                } else {
                    current.add(user)
                }
            }
            current
        } else {
            users
        }

        prefs.edit().putStringSet(KEY_MUTED_TAGS, finalTags).apply()
        saveUsersToPrefs(prefs, finalUsers)
        updateActiveSa6(clearFirst = (mode == ImportMode.REPLACE))
    }

    @Synchronized
    fun clearLocalMutes() {
        val ctx = getContext() ?: return
        val prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        prefs.edit()
            .remove(KEY_MUTED_TAGS)
            .remove(KEY_MUTED_USERS)
            .apply()
        updateActiveSa6(clearFirst = true)
    }

    private fun saveUsersToPrefs(prefs: android.content.SharedPreferences, users: List<MutedUserData>) {
        val array = JSONArray()
        for (user in users) {
            val obj = JSONObject().apply {
                put("id", user.id)
                put("name", user.name)
                put("account", user.account)
                put("avatarUrl", user.avatarUrl)
            }
            array.put(obj)
        }
        prefs.edit().putString(KEY_MUTED_USERS, array.toString()).apply()
    }

    @JvmStatic
    fun exportMuteSettingsJson(): String {
        val tags = getLocalMutedTags().sorted()
        val users = getLocalMutedUsers().sortedBy { it.name }

        val root = JSONObject().apply {
            put("version", 1)
            put("type", "pixiv_morphe_mute_backup")
            put("exported_at", System.currentTimeMillis())

            val tagsArray = JSONArray()
            for (t in tags) {
                tagsArray.put(t)
            }
            put("tags", tagsArray)

            val usersArray = JSONArray()
            for (u in users) {
                val uObj = JSONObject().apply {
                    put("id", u.id)
                    put("name", u.name)
                    put("account", u.account)
                    put("avatarUrl", u.avatarUrl)
                }
                usersArray.put(uObj)
            }
            put("users", usersArray)
        }
        return root.toString(2)
    }

    @JvmStatic
    fun parseImportData(raw: String): ParsedMuteData? {
        val trimmed = raw.trim()
        if (trimmed.isEmpty()) return null

        val parsedTags = LinkedHashSet<String>()
        val parsedUsers = ArrayList<MutedUserData>()
        val seenUserIds = HashSet<Long>()

        fun addUser(id: Long, name: String?, account: String?, avatarUrl: String?) {
            if (id > 0 && seenUserIds.add(id)) {
                parsedUsers.add(
                    MutedUserData(
                        id = id,
                        name = if (!name.isNullOrBlank()) name else "User #$id",
                        account = if (!account.isNullOrBlank()) account else "$id",
                        avatarUrl = avatarUrl ?: ""
                    )
                )
            }
        }

        fun addTag(tag: String?) {
            val t = tag?.trim()
            if (!t.isNullOrEmpty()) {
                parsedTags.add(t)
            }
        }

        if (trimmed.startsWith("{")) {
            runCatching {
                val obj = JSONObject(trimmed)
                val tagsArr = obj.optJSONArray("tags")
                    ?: obj.optJSONArray("muted_tags")
                    ?: obj.optJSONArray("tagList")
                if (tagsArr != null) {
                    for (i in 0 until tagsArr.length()) {
                        val item = tagsArr.opt(i)
                        if (item is String) {
                            addTag(item)
                        } else if (item is JSONObject) {
                            addTag(item.optString("name", item.optString("tag")))
                        }
                    }
                }
                val usersArr = obj.optJSONArray("users")
                    ?: obj.optJSONArray("muted_users")
                    ?: obj.optJSONArray("userList")
                if (usersArr != null) {
                    for (i in 0 until usersArr.length()) {
                        val item = usersArr.opt(i)
                        if (item is JSONObject) {
                            val id = item.optLong("id")
                            val name = item.optString("name")
                            val account = item.optString("account")
                            val avatar = item.optString("avatarUrl")
                            addUser(id, name, account, avatar)
                        } else if (item is Number) {
                            addUser(item.toLong(), null, null, null)
                        }
                    }
                }
            }
        } else if (trimmed.startsWith("[")) {
            runCatching {
                val arr = JSONArray(trimmed)
                for (i in 0 until arr.length()) {
                    val item = arr.opt(i)
                    if (item is String) {
                        addTag(item)
                    } else if (item is Number) {
                        addUser(item.toLong(), null, null, null)
                    } else if (item is JSONObject) {
                        if (item.has("id")) {
                            addUser(
                                item.optLong("id"),
                                item.optString("name"),
                                item.optString("account"),
                                item.optString("avatarUrl")
                            )
                        } else if (item.has("name")) {
                            addTag(item.optString("name"))
                        }
                    }
                }
            }
        } else {
            for (line in trimmed.lines()) {
                val t = line.trim()
                if (t.isNotEmpty() && !t.startsWith("#")) {
                    addTag(t)
                }
            }
        }

        if (parsedTags.isEmpty() && parsedUsers.isEmpty()) {
            return null
        }
        return ParsedMuteData(parsedTags, parsedUsers)
    }

    fun reloadActivity(activity: Activity) {
        activity.finish()
        activity.startActivity(activity.intent)
        if (Build.VERSION.SDK_INT >= 34) {
            activity.overrideActivityTransition(Activity.OVERRIDE_TRANSITION_OPEN, 0, 0)
            activity.overrideActivityTransition(Activity.OVERRIDE_TRANSITION_CLOSE, 0, 0)
        } else {
            @Suppress("DEPRECATION")
            activity.overridePendingTransition(0, 0)
        }
    }

    @JvmStatic
    @JvmOverloads
    fun showBackupMenu(activity: Activity, anchor: View? = null) {
        val tagsCount = getLocalMutedTags().size
        val usersCount = getLocalMutedUsers().size

        if (anchor != null) {
            val popup = PopupMenu(activity, anchor, Gravity.END)
            popup.menu.add(0, 1, 0, "📤 Export Mutes ($tagsCount tags, $usersCount users)")
            popup.menu.add(0, 2, 1, "📥 Import Mutes...")
            if (tagsCount > 0 || usersCount > 0) {
                popup.menu.add(0, 3, 2, "🗑️ Clear Local Mutes")
            }
            popup.setOnMenuItemClickListener { item ->
                when (item.itemId) {
                    1 -> {
                        exportMuteSettingsDialog(activity)
                        true
                    }
                    2 -> {
                        importMuteSettingsDialog(activity) { reloadActivity(activity) }
                        true
                    }
                    3 -> {
                        AlertDialog.Builder(activity)
                            .setTitle("Clear Local Mutes")
                            .setMessage("Are you sure you want to remove all locally stored muted tags and users?")
                            .setPositiveButton("Clear") { _, _ ->
                                clearLocalMutes()
                                Toast.makeText(activity, "Local mute settings cleared", Toast.LENGTH_SHORT).show()
                                reloadActivity(activity)
                            }
                            .setNegativeButton("Cancel", null)
                            .show()
                        true
                    }
                    else -> false
                }
            }
            popup.show()
            return
        }

        val items = arrayOf(
            "📤 Export Mute Settings",
            "📥 Import Mute Settings",
            "🗑️ Clear Local Mutes"
        )
        AlertDialog.Builder(activity)
            .setTitle("Mute Settings ($tagsCount tags, $usersCount users)")
            .setItems(items) { _, which ->
                when (which) {
                    0 -> exportMuteSettingsDialog(activity)
                    1 -> importMuteSettingsDialog(activity) { reloadActivity(activity) }
                    2 -> {
                        AlertDialog.Builder(activity)
                            .setTitle("Clear Local Mutes")
                            .setMessage("Are you sure you want to remove all locally stored muted tags and users?")
                            .setPositiveButton("Clear") { _, _ ->
                                clearLocalMutes()
                                Toast.makeText(activity, "Local mute settings cleared", Toast.LENGTH_SHORT).show()
                                reloadActivity(activity)
                            }
                            .setNegativeButton("Cancel", null)
                            .show()
                    }
                }
            }
            .setNegativeButton("Close", null)
            .show()
    }

    @JvmStatic
    fun exportMuteSettingsDialog(activity: Activity) {
        val jsonStr = exportMuteSettingsJson()
        val tagsCount = getLocalMutedTags().size
        val usersCount = getLocalMutedUsers().size

        val clipboard = activity.getSystemService(Context.CLIPBOARD_SERVICE) as? ClipboardManager
        val clip = ClipData.newPlainText("Pixiv Mute Settings", jsonStr)
        clipboard?.setPrimaryClip(clip)
        Toast.makeText(activity, "Copied to clipboard! ($tagsCount tags, $usersCount users)", Toast.LENGTH_SHORT).show()

        AlertDialog.Builder(activity)
            .setTitle("Export Mute Settings")
            .setMessage("Mute backup ($tagsCount tag(s), $usersCount user(s)) copied to clipboard.\n\nWould you like to share or save as a file?")
            .setPositiveButton("Share / Save") { _, _ ->
                val sendIntent = Intent().apply {
                    action = Intent.ACTION_SEND
                    putExtra(Intent.EXTRA_TEXT, jsonStr)
                    putExtra(Intent.EXTRA_SUBJECT, "Pixiv Mute Settings Backup")
                    type = "text/plain"
                }
                activity.startActivity(Intent.createChooser(sendIntent, "Export Mute Settings"))
            }
            .setNegativeButton("Done", null)
            .show()
    }

    @JvmStatic
    fun importMuteSettingsDialog(activity: Activity, onImportSuccess: (() -> Unit)? = null) {
        val clipboard = activity.getSystemService(Context.CLIPBOARD_SERVICE) as? ClipboardManager
        val clipText = clipboard?.primaryClip?.getItemAt(0)?.text?.toString()?.trim() ?: ""

        val layout = LinearLayout(activity).apply {
            orientation = LinearLayout.VERTICAL
            val p = dpToPx(activity, 16f).toInt()
            setPadding(p, p, p, 0)
        }

        val prompt = TextView(activity).apply {
            text = "Paste JSON backup below or click 'Paste from Clipboard':"
            textSize = 14f
            val pb = dpToPx(activity, 8f).toInt()
            setPadding(0, 0, 0, pb)
        }
        layout.addView(prompt)

        val editText = EditText(activity).apply {
            hint = "{\n  \"tags\": [...],\n  \"users\": [...]\n}"
            minLines = 6
            maxLines = 10
            gravity = Gravity.TOP or Gravity.START
            textSize = 13f
            typeface = Typeface.MONOSPACE
            if (clipText.startsWith("{") || clipText.startsWith("[")) {
                setText(clipText)
                setSelection(text.length)
            }
        }
        val scroll = ScrollView(activity).apply {
            layoutParams = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                dpToPx(activity, 140f).toInt()
            )
            addView(editText)
        }
        layout.addView(scroll)

        val pasteButton = TextView(activity).apply {
            text = "📋 Paste from Clipboard"
            textSize = 13f
            typeface = Typeface.DEFAULT_BOLD
            val hp = dpToPx(activity, 12f).toInt()
            val vp = dpToPx(activity, 8f).toInt()
            setPadding(hp, vp, hp, vp)
            gravity = Gravity.CENTER
            val topMargin = dpToPx(activity, 8f).toInt()
            layoutParams = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
            ).apply {
                this.topMargin = topMargin
            }
            background = GradientDrawable().apply {
                shape = GradientDrawable.RECTANGLE
                cornerRadius = dpToPx(activity, 6f)
                setStroke(dpToPx(activity, 1f).toInt(), 0xFF888888.toInt())
            }
            setOnClickListener {
                val clip = (activity.getSystemService(Context.CLIPBOARD_SERVICE) as? ClipboardManager)
                    ?.primaryClip?.getItemAt(0)?.text?.toString() ?: ""
                if (clip.isNotEmpty()) {
                    editText.setText(clip)
                    editText.setSelection(editText.text.length)
                    Toast.makeText(activity, "Pasted from clipboard", Toast.LENGTH_SHORT).show()
                } else {
                    Toast.makeText(activity, "Clipboard is empty", Toast.LENGTH_SHORT).show()
                }
            }
        }
        layout.addView(pasteButton)

        AlertDialog.Builder(activity)
            .setTitle("Import Mute Settings")
            .setView(layout)
            .setPositiveButton("Next") { _, _ ->
                val text = editText.text.toString().trim()
                val parsed = parseImportData(text)
                if (parsed == null || (parsed.tags.isEmpty() && parsed.users.isEmpty())) {
                    Toast.makeText(activity, "Failed to parse mute settings. Invalid format.", Toast.LENGTH_LONG).show()
                    return@setPositiveButton
                }

                AlertDialog.Builder(activity)
                    .setTitle("Apply Mute Settings")
                    .setMessage("Found ${parsed.tags.size} tag(s) and ${parsed.users.size} user(s).\n\nHow would you like to apply them?")
                    .setPositiveButton("Merge") { _, _ ->
                        setLocalMutedData(parsed.tags, parsed.users, ImportMode.MERGE)
                        Toast.makeText(activity, "Merged ${parsed.tags.size} tag(s) and ${parsed.users.size} user(s)", Toast.LENGTH_SHORT).show()
                        if (onImportSuccess != null) {
                            onImportSuccess.invoke()
                        } else {
                            reloadActivity(activity)
                        }
                    }
                    .setNeutralButton("Replace") { _, _ ->
                        setLocalMutedData(parsed.tags, parsed.users, ImportMode.REPLACE)
                        Toast.makeText(activity, "Replaced with ${parsed.tags.size} tag(s) and ${parsed.users.size} user(s)", Toast.LENGTH_SHORT).show()
                        if (onImportSuccess != null) {
                            onImportSuccess.invoke()
                        } else {
                            reloadActivity(activity)
                        }
                    }
                    .setNegativeButton("Cancel", null)
                    .show()
            }
            .setNegativeButton("Cancel", null)
            .show()
    }

    class ImportExportIconDrawable(private val color: Int = Color.WHITE) : Drawable() {
        private val paint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            color = this@ImportExportIconDrawable.color
            style = Paint.Style.FILL
        }
        private val path = Path()

        override fun onBoundsChange(bounds: Rect) {
            super.onBoundsChange(bounds)
            path.reset()
            val width = bounds.width().toFloat()
            val height = bounds.height().toFloat()
            val size = minOf(width, height)
            val s = size / 24f
            val ox = bounds.left + (width - size) / 2f
            val oy = bounds.top + (height - size) / 2f

            // Up arrow (import / upload - left)
            path.moveTo(ox + 9f * s, oy + 3f * s)
            path.lineTo(ox + 5f * s, oy + 7f * s)
            path.lineTo(ox + 8f * s, oy + 7f * s)
            path.lineTo(ox + 8f * s, oy + 14f * s)
            path.lineTo(ox + 10f * s, oy + 14f * s)
            path.lineTo(ox + 10f * s, oy + 7f * s)
            path.lineTo(ox + 13f * s, oy + 7f * s)
            path.close()

            // Down arrow (export / download - right)
            path.moveTo(ox + 15f * s, oy + 21f * s)
            path.lineTo(ox + 19f * s, oy + 17f * s)
            path.lineTo(ox + 16f * s, oy + 17f * s)
            path.lineTo(ox + 16f * s, oy + 10f * s)
            path.lineTo(ox + 14f * s, oy + 10f * s)
            path.lineTo(ox + 14f * s, oy + 17f * s)
            path.lineTo(ox + 11f * s, oy + 17f * s)
            path.close()
        }

        override fun draw(canvas: Canvas) {
            canvas.drawPath(path, paint)
        }

        override fun setAlpha(alpha: Int) {
            paint.alpha = alpha
        }

        override fun setColorFilter(colorFilter: ColorFilter?) {
            paint.colorFilter = colorFilter
        }

        @Deprecated("Deprecated in Java")
        override fun getOpacity(): Int = PixelFormat.TRANSLUCENT
    }

    @JvmStatic
    fun setupMuteSettingsActivity(activity: Activity) {
        activity.window.decorView.post {
            try {
                if (activity.isFinishing || activity.isDestroyed) return@post
                val content = activity.findViewById<ViewGroup>(android.R.id.content) as? FrameLayout ?: return@post
                val existing = content.findViewWithTag<View>("pixiv_morphe_mute_backup_btn")
                if (existing != null) {
                    content.removeView(existing)
                }

                val statusBarHeight = getStatusBarHeight(activity)
                val buttonSize = dpToPx(activity, 48f).toInt()
                val toolbarHeight = dpToPx(activity, 56f).toInt()
                val topOffset = statusBarHeight + (toolbarHeight - buttonSize) / 2

                val backupButton = ImageView(activity).apply {
                    tag = "pixiv_morphe_mute_backup_btn"
                    contentDescription = "Import or export mute settings"
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                        tooltipText = "Import / Export"
                    }
                    val pad = dpToPx(activity, 12f).toInt()
                    setPadding(pad, pad, pad, pad)
                    setImageDrawable(ImportExportIconDrawable(Color.WHITE))

                    val outValue = TypedValue()
                    if (activity.theme.resolveAttribute(android.R.attr.selectableItemBackgroundBorderless, outValue, true)) {
                        setBackgroundResource(outValue.resourceId)
                    }

                    setOnClickListener { v ->
                        showBackupMenu(activity, v)
                    }
                }

                val lp = FrameLayout.LayoutParams(buttonSize, buttonSize).apply {
                    gravity = Gravity.TOP or Gravity.END
                    topMargin = topOffset
                    marginEnd = dpToPx(activity, 4f).toInt()
                }

                content.addView(backupButton, lp)
            } catch (_: Throwable) {
            }
        }
    }

    private fun extractTagName(item: Any?): String? {
        if (item == null) return null
        return runCatching {
            val tag = item.javaClass.getDeclaredField("tag").apply { isAccessible = true }.get(item) ?: return null
            tag.javaClass.getDeclaredField("name").apply { isAccessible = true }.get(tag) as? String
        }.getOrNull()
    }

    private fun extractUserData(item: Any?): MutedUserData? {
        if (item == null) return null
        return runCatching {
            val user = item.javaClass.getDeclaredField("user").apply { isAccessible = true }.get(item) ?: return null
            val idObj = user.javaClass.getDeclaredField("id").apply { isAccessible = true }.get(user)
            val id = (idObj as? Number)?.toLong() ?: return null
            val name = runCatching { user.javaClass.getDeclaredField("name").apply { isAccessible = true }.get(user) as? String }.getOrNull() ?: "User #$id"
            val account = runCatching { user.javaClass.getDeclaredField("account").apply { isAccessible = true }.get(user) as? String }.getOrNull() ?: "$id"
            val avatarUrl = runCatching {
                val urls = user.javaClass.getDeclaredField("profileImageUrls").apply { isAccessible = true }.get(user) ?: return@runCatching ""
                urls.javaClass.getDeclaredField("px_170x170").apply { isAccessible = true }.get(urls) as? String ?: ""
            }.getOrDefault("")
            MutedUserData(id, name, account, avatarUrl)
        }.getOrNull()
    }

    private fun extractUserId(item: Any?): Long? {
        if (item == null) return null
        return runCatching {
            val user = item.javaClass.getDeclaredField("user").apply { isAccessible = true }.get(item) ?: return null
            val idObj = user.javaClass.getDeclaredField("id").apply { isAccessible = true }.get(user)
            (idObj as? Number)?.toLong()
        }.getOrNull()
    }

    private fun createPixivMutedTag(tagName: String): Any? {
        return runCatching {
            if (pixivTagCtor == null) {
                val tagCls = Class.forName("jp.pxv.android.domain.commonentity.PixivTag")
                pixivTagCtor = tagCls.getConstructor(String::class.java, String::class.java)
            }
            if (pixivMutedTagCtor == null) {
                val mutedTagCls = Class.forName("jp.pxv.android.domain.commonentity.PixivMutedTag")
                val tagCls = Class.forName("jp.pxv.android.domain.commonentity.PixivTag")
                pixivMutedTagCtor = mutedTagCls.getConstructor(tagCls, java.lang.Boolean.TYPE)
            }
            val tag = pixivTagCtor!!.newInstance(tagName, null)
            pixivMutedTagCtor!!.newInstance(tag, true)
        }.getOrNull()
    }

    private fun createPixivMutedUser(user: MutedUserData): Any? {
        return runCatching {
            if (pixivProfileImageUrlsCtor == null) {
                val cls = Class.forName("jp.pxv.android.domain.commonentity.PixivProfileImageUrls")
                pixivProfileImageUrlsCtor = cls.getConstructor(String::class.java)
            }
            if (pixivUserCtor == null) {
                val userCls = Class.forName("jp.pxv.android.domain.commonentity.PixivUser")
                val profileUrlsCls = Class.forName("jp.pxv.android.domain.commonentity.PixivProfileImageUrls")
                pixivUserCtor = userCls.getConstructor(
                    java.lang.Long.TYPE,
                    String::class.java,
                    String::class.java,
                    String::class.java,
                    profileUrlsCls,
                    java.lang.Boolean.TYPE,
                    java.lang.Boolean::class.java,
                    java.lang.Boolean.TYPE,
                    List::class.java
                )
            }
            if (pixivMutedUserCtor == null) {
                val mutedUserCls = Class.forName("jp.pxv.android.domain.commonentity.PixivMutedUser")
                val userCls = Class.forName("jp.pxv.android.domain.commonentity.PixivUser")
                pixivMutedUserCtor = mutedUserCls.getConstructor(userCls, java.lang.Boolean.TYPE)
            }
            val avatarUrl = if (user.avatarUrl.isNotEmpty()) user.avatarUrl else "https://s.pximg.net/common/images/no_profile.png"
            val profileUrls = pixivProfileImageUrlsCtor!!.newInstance(avatarUrl)
            val pixivUser = pixivUserCtor!!.newInstance(
                user.id,
                user.name,
                user.account,
                null,
                profileUrls,
                false,
                null,
                false,
                null
            )
            pixivMutedUserCtor!!.newInstance(pixivUser, true)
        }.getOrNull()
    }

    @JvmStatic
    fun getMergedMutedTags(response: Any?): List<*> {
        if (response == null) return emptyList<Any>()
        return try {
            val field = response.javaClass.getDeclaredField("mutedTags").apply { isAccessible = true }
            val serverList = (field.get(response) as? List<*>) ?: emptyList<Any>()
            val existingNames = HashSet<String>()
            val serverTagNames = ArrayList<String>()
            for (item in serverList) {
                val name = extractTagName(item)
                if (name != null) {
                    existingNames.add(name)
                    serverTagNames.add(name)
                }
            }
            if (serverTagNames.isNotEmpty()) {
                updateLocalMutedTags(serverTagNames, null)
            }
            val localTags = getLocalMutedTags()
            val merged = ArrayList<Any>(serverList.size + localTags.size)
            merged.addAll(serverList.filterNotNull())
            for (tag in localTags) {
                if (!existingNames.contains(tag)) {
                    val mutedTag = createPixivMutedTag(tag)
                    if (mutedTag != null) {
                        merged.add(mutedTag)
                    }
                }
            }
            merged
        } catch (_: Throwable) {
            runCatching {
                val field = response.javaClass.getDeclaredField("mutedTags").apply { isAccessible = true }
                field.get(response) as? List<*>
            }.getOrNull() ?: emptyList<Any>()
        }
    }

    @JvmStatic
    fun getMergedMutedUsers(response: Any?): List<*> {
        if (response == null) return emptyList<Any>()
        return try {
            val field = response.javaClass.getDeclaredField("mutedUsers").apply { isAccessible = true }
            val serverList = (field.get(response) as? List<*>) ?: emptyList<Any>()
            val existingIds = HashSet<Long>()
            for (item in serverList) {
                val userData = extractUserData(item)
                if (userData != null) {
                    existingIds.add(userData.id)
                    userCache[userData.id] = userData
                } else {
                    val id = extractUserId(item)
                    if (id != null) existingIds.add(id)
                }
            }
            val localUsers = getLocalMutedUsers()
            val merged = ArrayList<Any>(serverList.size + localUsers.size)
            merged.addAll(serverList.filterNotNull())
            for (user in localUsers) {
                if (!existingIds.contains(user.id)) {
                    val mutedUser = createPixivMutedUser(user)
                    if (mutedUser != null) {
                        merged.add(mutedUser)
                    }
                }
            }
            merged
        } catch (_: Throwable) {
            runCatching {
                val field = response.javaClass.getDeclaredField("mutedUsers").apply { isAccessible = true }
                field.get(response) as? List<*>
            }.getOrNull() ?: emptyList<Any>()
        }
    }
}
