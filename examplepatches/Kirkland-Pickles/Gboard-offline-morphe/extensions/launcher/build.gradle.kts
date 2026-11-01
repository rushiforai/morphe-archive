extension {
    name = "extensions/launcher.mpe"
}

android {
    namespace = "app.kirklandpickles.gboardofflinevoice"

    defaultConfig {
        minSdk = 23
    }

    lint {
        disable += "MissingPermission"
    }
}
