extension { name = "extensions/demorgen.mpe" }
android {
 namespace = "nl.johninnl.demorgen"
 defaultConfig { minSdk = 32 }
 testOptions { unitTests.isReturnDefaultValues = true }
    lint {
        abortOnError = true
        checkReleaseBuilds = false
        checkOnly += "NewApi"
    }
}
dependencies {
 compileOnly("androidx.media3:media3-common:1.10.1")
 testImplementation("junit:junit:4.13.2")
}
configurations.matching { it.name == "releaseRuntimeClasspath" || it.name == "debugRuntimeClasspath" }
 .configureEach { exclude(group = "org.jetbrains.kotlin") }
