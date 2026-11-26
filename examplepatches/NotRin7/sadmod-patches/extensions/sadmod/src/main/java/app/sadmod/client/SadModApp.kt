package app.sadmod.client

import android.app.Application
import app.sadmod.client.data.bridge.SadModBridge
import app.sadmod.client.data.download.DownloadManager
import app.sadmod.client.data.prefs.AppPreferences
import app.sadmod.client.data.remote.HappyModApi

class SadModApp : Application() {
    val preferences: AppPreferences by lazy { AppPreferences(this) }
    val api: HappyModApi by lazy { HappyModApi(preferences) }
    val downloadManager: DownloadManager by lazy { DownloadManager(this, api) }

    override fun onCreate() {
        super.onCreate()
        SadModBridge.init(this)
    }
}
