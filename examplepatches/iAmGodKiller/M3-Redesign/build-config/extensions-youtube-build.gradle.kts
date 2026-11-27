import com.android.build.api.dsl.ApplicationExtension
import org.gradle.api.tasks.compile.JavaCompile

extension {
    name = "extensions/ytfullscreen.mpe"
}

dependencies {
    compileOnly(libs.morphe.extensions.library)
    compileOnly(libs.annotation)
}

configure<ApplicationExtension> {
    defaultConfig {
        minSdk = 26
    }
    testOptions {
        unitTests.isReturnDefaultValues = true
    }
}

tasks.withType<JavaCompile>().configureEach {
    doLast {
        // Keep only standalone YouTube fullscreen extension classes in extensions/ytfullscreen.mpe
        destinationDirectory.get().asFile.walkTopDown()
            .filter { it.isFile && it.extension == "class" }
            .filter { !it.name.startsWith("YouTubeFullscreenFilter") }
            .forEach { it.delete() }
    }
}
