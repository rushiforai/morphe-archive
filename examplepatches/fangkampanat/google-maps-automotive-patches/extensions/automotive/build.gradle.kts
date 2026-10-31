import com.android.build.api.dsl.ApplicationExtension

dependencies {
    implementation(libs.morphe.extensions.library)
    implementation(project(":extensions:shared:library"))
    compileOnly(libs.annotation)
}

// The problem report's server, set when the bundle is built and never committed: the Gradle
// properties mapsCarReportUrl and mapsCarReportKeyFile (the key is the file's first line), or the
// environment variables MAPS_CAR_REPORT_URL and MAPS_CAR_REPORT_KEY. Without them the app has no
// send button, so a build from this source never sends reports to someone else's server.
val reportUrl = (providers.gradleProperty("mapsCarReportUrl").orNull
    ?: providers.environmentVariable("MAPS_CAR_REPORT_URL").orNull)?.trim().orEmpty()
val reportKey = providers.gradleProperty("mapsCarReportKeyFile").orNull?.let { path ->
    val keyFile = file(path.trim())
    if (!keyFile.isFile) throw GradleException("mapsCarReportKeyFile is not a file: $keyFile")
    keyFile.useLines { lines -> lines.firstOrNull() }?.trim().orEmpty()
} ?: providers.environmentVariable("MAPS_CAR_REPORT_KEY").orNull?.trim().orEmpty()

if (reportUrl.isEmpty() != reportKey.isEmpty()) {
    throw GradleException("Set both the problem report URL and key, or neither (docs/build-setup.md)")
}
if (reportUrl.isNotEmpty()) {
    if (!Regex("https://[A-Za-z0-9.-]+").matches(reportUrl)) {
        throw GradleException("The problem report URL must be https://<host> without a path")
    }
    if (!Regex("[A-Za-z0-9_-]{32,}").matches(reportKey)) {
        throw GradleException("The problem report key must be 32 or more URL-safe base64 characters")
    }
}
logger.lifecycle(
    "Maps Car problem report: " +
        if (reportUrl.isEmpty()) "not configured (no send button)" else "configured for ${reportUrl.removePrefix("https://")}",
)

configure<ApplicationExtension> {
    namespace = "app.morphe.extension"
    compileSdk = 36

    defaultConfig {
        minSdk = 29
        buildConfigField("String", "MAPS_CAR_REPORT_URL", "\"$reportUrl\"")
        buildConfigField("String", "MAPS_CAR_REPORT_KEY", "\"$reportKey\"")
    }

    buildFeatures {
        buildConfig = true
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}
