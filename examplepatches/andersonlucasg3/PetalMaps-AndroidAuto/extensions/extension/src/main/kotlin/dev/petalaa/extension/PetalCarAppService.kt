package dev.petalaa.extension

import androidx.car.app.CarAppService
import androidx.car.app.Session
import androidx.car.app.validation.HostValidator

/**
 * Android Auto CarAppService entry point.
 *
 * This service is declared in the extension's AndroidManifest and merged
 * into the Petal Maps APK. When Android Auto connects, the system binds
 * to this service, which creates a [PetalSession] to serve the head unit.
 */
class PetalCarAppService : CarAppService() {

    override fun onCreate() {
        super.onCreate()
        AALogger.init(this)
        AALogger.installCrashHandler()
    }

    override fun createHostValidator(): HostValidator {
        // Dev/debug: accept any host.
        // In production this should be restricted to known AA host packages.
        return HostValidator.ALLOW_ALL_HOSTS_VALIDATOR
    }

    override fun onCreateSession(): Session {
        AALogger.i("onCreateSession: creating PetalSession")
        return PetalSession()
    }
}
