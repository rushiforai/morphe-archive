extension {
    name = "extensions/waze.mpe"
}

dependencies {
    compileOnly(project(":extensions:waze:stub"))
}

android {
    namespace = "app.wazeytm.extension.waze"
    buildTypes { getByName("release") { proguardFiles("proguard-rules.pro") } }
}
configurations.matching { it.name == "releaseRuntimeClasspath" || it.name == "debugRuntimeClasspath" }
    .configureEach { exclude(group = "org.jetbrains.kotlin") }
