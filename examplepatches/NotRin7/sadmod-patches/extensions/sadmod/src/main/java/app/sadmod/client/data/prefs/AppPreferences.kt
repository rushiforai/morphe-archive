package app.sadmod.client.data.prefs

import android.content.Context
import app.sadmod.client.data.crypto.HappyModCrypto
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import java.util.Locale
import java.util.UUID

enum class AppLanguage {
    SYSTEM,
    EN,
    DE;

    fun resolveIsGerman(): Boolean = when (this) {
        DE -> true
        EN -> false
        SYSTEM -> Locale.getDefault().language.equals("de", ignoreCase = true)
    }

    fun apiLangCode(): String = if (resolveIsGerman()) "de" else "en"
}

enum class ProxyMode {
    NONE,
    TOR_ORBOT,
    CUSTOM_SOCKS5,
    CUSTOM_HTTP
}

data class UserSettings(
    val language: AppLanguage = AppLanguage.SYSTEM,
    val dohEnabled: Boolean = true,
    val proxyMode: ProxyMode = ProxyMode.NONE,
    val proxyHost: String = "127.0.0.1",
    val proxyPort: Int = 9050,
    val saveSearchHistory: Boolean = false,
    val customApiBase: String = "",
    val sessionUid: String = HappyModCrypto.md5Hex(UUID.randomUUID().toString()),
    val recentSearches: List<String> = emptyList()
)

class AppPreferences(context: Context) {
    private val prefs = context.getSharedPreferences("sadmod_prefs", Context.MODE_PRIVATE)

    private val _settings = MutableStateFlow(loadInitial())
    val settings: StateFlow<UserSettings> = _settings.asStateFlow()

    private fun loadInitial(): UserSettings {
        val lang = runCatching {
            AppLanguage.valueOf(prefs.getString(KEY_LANG, AppLanguage.SYSTEM.name) ?: AppLanguage.SYSTEM.name)
        }.getOrDefault(AppLanguage.SYSTEM)

        val proxy = runCatching {
            ProxyMode.valueOf(prefs.getString(KEY_PROXY_MODE, ProxyMode.NONE.name) ?: ProxyMode.NONE.name)
        }.getOrDefault(ProxyMode.NONE)

        val saveHistory = prefs.getBoolean(KEY_SAVE_HISTORY, false)
        val history = if (saveHistory) {
            prefs.getString(KEY_RECENT_SEARCHES, "")
                ?.split("\n")
                ?.map { it.trim() }
                ?.filter { it.isNotEmpty() }
                .orEmpty()
        } else {
            emptyList()
        }

        return UserSettings(
            language = lang,
            dohEnabled = prefs.getBoolean(KEY_DOH, true),
            proxyMode = proxy,
            proxyHost = prefs.getString(KEY_PROXY_HOST, "127.0.0.1").orEmpty().ifBlank { "127.0.0.1" },
            proxyPort = prefs.getInt(KEY_PROXY_PORT, 9050).coerceIn(1, 65535),
            saveSearchHistory = saveHistory,
            customApiBase = prefs.getString(KEY_CUSTOM_API, "").orEmpty(),
            sessionUid = HappyModCrypto.md5Hex(UUID.randomUUID().toString()),
            recentSearches = history
        )
    }

    fun setLanguage(language: AppLanguage) {
        prefs.edit().putString(KEY_LANG, language.name).apply()
        _settings.update { it.copy(language = language) }
    }

    fun setDohEnabled(enabled: Boolean) {
        prefs.edit().putBoolean(KEY_DOH, enabled).apply()
        _settings.update { it.copy(dohEnabled = enabled) }
    }

    fun setProxy(mode: ProxyMode, host: String, port: Int) {
        val cleanHost = host.trim().ifBlank { "127.0.0.1" }
        val cleanPort = when (mode) {
            ProxyMode.TOR_ORBOT -> 9050
            else -> port.coerceIn(1, 65535)
        }
        prefs.edit()
            .putString(KEY_PROXY_MODE, mode.name)
            .putString(KEY_PROXY_HOST, cleanHost)
            .putInt(KEY_PROXY_PORT, cleanPort)
            .apply()
        _settings.update {
            it.copy(proxyMode = mode, proxyHost = cleanHost, proxyPort = cleanPort)
        }
    }

    fun setSaveSearchHistory(enabled: Boolean) {
        val editor = prefs.edit().putBoolean(KEY_SAVE_HISTORY, enabled)
        if (!enabled) {
            editor.remove(KEY_RECENT_SEARCHES)
        }
        editor.apply()
        _settings.update {
            it.copy(
                saveSearchHistory = enabled,
                recentSearches = if (enabled) it.recentSearches else emptyList()
            )
        }
    }

    fun recordSearch(query: String) {
        val trimmed = query.trim()
        if (trimmed.isEmpty()) return
        _settings.update { cur ->
            val updated = (listOf(trimmed) + cur.recentSearches.filterNot {
                it.equals(trimmed, ignoreCase = true)
            }).take(8)
            if (cur.saveSearchHistory) {
                prefs.edit().putString(KEY_RECENT_SEARCHES, updated.joinToString("\n")).apply()
            }
            cur.copy(recentSearches = updated)
        }
    }

    fun setCustomApiBase(baseUrl: String) {
        val clean = baseUrl.trim().trimEnd('/')
        prefs.edit().putString(KEY_CUSTOM_API, clean).apply()
        _settings.update { it.copy(customApiBase = clean) }
    }

    fun rotateAnonymousId() {
        val newUid = HappyModCrypto.md5Hex(UUID.randomUUID().toString())
        _settings.update { it.copy(sessionUid = newUid) }
    }

    private companion object {
        const val KEY_LANG = "language"
        const val KEY_DOH = "doh_enabled"
        const val KEY_PROXY_MODE = "proxy_mode"
        const val KEY_PROXY_HOST = "proxy_host"
        const val KEY_PROXY_PORT = "proxy_port"
        const val KEY_SAVE_HISTORY = "save_search_history"
        const val KEY_RECENT_SEARCHES = "recent_searches"
        const val KEY_CUSTOM_API = "custom_api_base"
    }
}
