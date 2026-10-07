extension { name = "extensions/railsgo-bus.mpe" }
android { namespace = "app.pigfoot.extension.railsgo" }
dependencies { compileOnly(project(":extensions:railsgo:stubs")) }

android {
    buildTypes.getByName("release") {
        isMinifyEnabled = true
        proguardFiles("proguard-rules.pro")
    }
}
