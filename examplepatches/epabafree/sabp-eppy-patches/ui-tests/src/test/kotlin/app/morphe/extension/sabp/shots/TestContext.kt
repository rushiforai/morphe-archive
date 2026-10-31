package app.morphe.extension.sabp.shots

import android.content.Context
import android.content.ContextWrapper
import android.content.SharedPreferences

/** layoutlib has no real SharedPreferences; eppy reads its settings through this in-memory store. */
class TestContext(base: Context, values: Map<String, Any?> = emptyMap()) : ContextWrapper(base) {
    private val stores = HashMap<String, FakePrefs>()

    init {
        val ui = store("eppy_ui")
        for ((k, v) in values) ui.map[k] = v
    }

    private fun store(name: String) = stores.getOrPut(name) { FakePrefs() }

    override fun getSharedPreferences(name: String, mode: Int): SharedPreferences = store(name)

    override fun getApplicationContext(): Context = this
}

class FakePrefs : SharedPreferences {
    val map = HashMap<String, Any?>()

    override fun getAll(): MutableMap<String, *> = HashMap(map)
    override fun getString(key: String, defValue: String?) = map[key] as? String ?: defValue
    @Suppress("UNCHECKED_CAST")
    override fun getStringSet(key: String, defValues: MutableSet<String>?) = map[key] as? MutableSet<String> ?: defValues
    override fun getInt(key: String, defValue: Int) = map[key] as? Int ?: defValue
    override fun getLong(key: String, defValue: Long) = map[key] as? Long ?: defValue
    override fun getFloat(key: String, defValue: Float) = map[key] as? Float ?: defValue
    override fun getBoolean(key: String, defValue: Boolean) = map[key] as? Boolean ?: defValue
    override fun contains(key: String) = map.containsKey(key)
    override fun registerOnSharedPreferenceChangeListener(l: SharedPreferences.OnSharedPreferenceChangeListener?) {}
    override fun unregisterOnSharedPreferenceChangeListener(l: SharedPreferences.OnSharedPreferenceChangeListener?) {}

    override fun edit(): SharedPreferences.Editor = object : SharedPreferences.Editor {
        private val pending = HashMap<String, Any?>()
        private val removed = HashSet<String>()
        private var clear = false
        override fun putString(key: String, value: String?) = apply { pending[key] = value }
        override fun putStringSet(key: String, values: MutableSet<String>?) = apply { pending[key] = values }
        override fun putInt(key: String, value: Int) = apply { pending[key] = value }
        override fun putLong(key: String, value: Long) = apply { pending[key] = value }
        override fun putFloat(key: String, value: Float) = apply { pending[key] = value }
        override fun putBoolean(key: String, value: Boolean) = apply { pending[key] = value }
        override fun remove(key: String) = apply { removed.add(key) }
        override fun clear() = apply { clear = true }
        override fun commit(): Boolean {
            if (clear) map.clear()
            removed.forEach { map.remove(it) }
            map.putAll(pending)
            return true
        }
        override fun apply() {
            commit()
        }
    }
}
