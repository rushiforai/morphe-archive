package app.sadmod.client.data.bridge

import android.content.Context
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json

@Serializable
data class BridgeConfig(
    val appVersion: String = "3.4.5",
    val aid: String = "",
    val stampKey: String = "",
    val hashSalt: String = "",
    val apiBase: String = "",
    val downloadBase: String = ""
)

object SadModBridge {
    private val json = Json { ignoreUnknownKeys = true }

    @Volatile
    var current: BridgeConfig = BridgeConfig()
        private set

    fun init(context: Context) {
        if (current.apiBase.isNotBlank() && current.stampKey.isNotBlank()) return
        val raw = runCatching {
            context.applicationContext.assets.open(BRIDGE_ASSET).bufferedReader().use { it.readText() }
        }.getOrElse {
            runCatching {
                context.assets.open(BRIDGE_ASSET).bufferedReader().use { it.readText() }
            }.getOrNull()
        } ?: return

        runCatching {
            current = json.decodeFromString<BridgeConfig>(raw)
        }
    }

    /** Allows unit tests or custom configurations to supply synthetic bridge parameters. */
    internal fun overrideForTesting(config: BridgeConfig) {
        current = config
    }

    private const val BRIDGE_ASSET = "sadmod_bridge.json"
}
