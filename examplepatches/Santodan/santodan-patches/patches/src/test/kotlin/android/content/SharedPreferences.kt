package android.content
import java.util.concurrent.ConcurrentHashMap
class SharedPreferences {
    private val values = ConcurrentHashMap<String, Boolean>()
    fun getBoolean(key: String, default: Boolean): Boolean = values[key] ?: default
    fun edit() = Editor()
    inner class Editor {
        fun putBoolean(key: String, value: Boolean): Editor { values[key] = value; return this }
        fun apply() {}
    }
}
