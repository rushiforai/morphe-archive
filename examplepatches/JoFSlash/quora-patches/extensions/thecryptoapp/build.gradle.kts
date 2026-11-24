extension {
    name = "extensions/thecryptoapp.mpe"
}

android {
    namespace = "app.jofslash.extension.thecryptoapp"

    lint {
        // POST_NOTIFICATIONS is declared and granted by the host app; this is intentional.
        disable += "NotificationPermission"
        abortOnError = false
    }
}
