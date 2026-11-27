extension {
    name = "extensions/all/misc/connectivity/wifi/spoof/spoof-wifi.mpe"
}

android {
    namespace = "app.morphe.extension.all.misc.connectivity.wifi.spoof"

    defaultConfig {
        minSdk = 23
    }
}

dependencies {
    compileOnly(libs.annotation)
}
