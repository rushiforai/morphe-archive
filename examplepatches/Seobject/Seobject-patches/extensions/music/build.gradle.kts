import com.android.build.api.dsl.ApplicationExtension
import org.gradle.api.tasks.compile.JavaCompile

dependencies {
    compileOnly(libs.morphe.extensions.library)
    compileOnly(project(":extensions:shared-youtube:library"))
    compileOnly(project(":extensions:shared:library"))
    compileOnly(libs.annotation)
}

configure<ApplicationExtension> {
    defaultConfig {
        minSdk = 26
    }
}

afterEvaluate {
    tasks.withType<JavaCompile>().configureEach {
        setSource(
            fileTree("src/main/java") {
                include(
                    "app/morphe/extension/music/patches/pinplaylist/PinPlaylistPatch.java",
                    "app/morphe/extension/music/patches/pinplaylist/PinPlaylistSettings.java",
                    "app/morphe/extension/music/patches/pinplaylist/PinStore.java",
                )
            }
        )
    }
}
