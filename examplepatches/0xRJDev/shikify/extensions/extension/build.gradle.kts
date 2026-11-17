extension {
    name = "extensions/extension.mpe"
}
android {
    namespace = "app.shiki.boost.extension"
    defaultConfig { minSdk = 24 } // Boost 1.14.2 requires Android 7.0.
    sourceSets.getByName("main").java.setSrcDirs(listOf("src/main/java/app/morphe/extension/boost"))
}
dependencies {
    // Toolbar and ActionMenuView are already in Boost. Never merge AndroidX into the APK.
    compileOnly("androidx.appcompat:appcompat:1.7.0")
}

// Only the verified renamed observer ABI is needed. The APK supplies its implementation.
val compileBoostObserverApi by tasks.registering(JavaCompile::class) {
    source(rootProject.file("extensions/native-api"))
    include("**/*.java")
    classpath = files(androidComponents.sdkComponents.bootClasspath)
    destinationDirectory.set(layout.buildDirectory.dir("boost-native-api"))
    options.release.set(17)
}
val boostObserverApiJar by tasks.registering(Jar::class) {
    from(compileBoostObserverApi.map { it.destinationDirectory })
    archiveFileName.set("boost-observer-api.jar")
    destinationDirectory.set(layout.buildDirectory.dir("boost-api-libs"))
}
dependencies {
    compileOnly(files(boostObserverApiJar))
}
