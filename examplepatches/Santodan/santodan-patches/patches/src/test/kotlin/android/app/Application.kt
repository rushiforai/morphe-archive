package android.app

import android.content.SharedPreferences
import android.content.pm.PackageManager
import java.util.concurrent.ConcurrentHashMap

class Application {
    val packageManager = PackageManager()
    val packageName = "com.nuvio.tv"
    private val stores = ConcurrentHashMap<String, SharedPreferences>()
    fun getSharedPreferences(name: String, mode: Int): SharedPreferences =
        stores.getOrPut(name) { SharedPreferences() }
}
object ActivityThread {
    private val application = Application()
    @JvmStatic fun currentApplication(): Application = application
}
