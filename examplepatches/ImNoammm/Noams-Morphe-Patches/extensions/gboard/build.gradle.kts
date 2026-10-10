extension {
    name = "extensions/nogoogle.mpe"
}

android {
    namespace = "app.nogoogle.gboard"

    // Gboard 18.2 runs on Android 12L and up.
    defaultConfig {
        minSdk = 32
    }

    lint {
        // The extension runs inside Gboard, which holds the permissions lint looks for here.
        disable += "MissingPermission"
        // Receivers get the export flag on Android 13 and up; below that the flag doesn't exist.
        disable += "UnspecifiedRegisterReceiverFlag"
    }
}

dependencies {
    // Plain Java: declaring the stdlib compile-only keeps the Kotlin plugin from packing a copy into the extension.
    compileOnly(libs.kotlin.stdlib)
}
