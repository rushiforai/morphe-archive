extension { name = "extensions/hln.mpe" }
android {
 namespace = "nl.johninnl.hln"
 defaultConfig { minSdk = 29 }
 testOptions { unitTests.isReturnDefaultValues = true }
    lint {
        abortOnError = true
        checkReleaseBuilds = false
        checkOnly += "NewApi"
    }
}
dependencies { testImplementation("junit:junit:4.13.2") }
configurations.matching { it.name == "releaseRuntimeClasspath" || it.name == "debugRuntimeClasspath" }
 .configureEach { exclude(group = "org.jetbrains.kotlin") }
