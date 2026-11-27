import com.android.build.api.dsl.ApplicationExtension
import org.gradle.api.tasks.compile.JavaCompile

extension {
    name = "extensions/m3navigation.mpe"
}

dependencies {
    compileOnly(libs.morphe.extensions.library)
    compileOnly(project(":extensions:shared-youtube:library"))
    compileOnly(project(":extensions:shared-youtube:stub"))
    compileOnly(project(":extensions:shared:library"))
    compileOnly(project(":extensions:youtube:stub"))
    compileOnly(libs.annotation)
    compileOnly(libs.protobuf.javalite)
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
        // Keep only standalone add-on extension classes in extensions/m3navigation.mpe
        destinationDirectory.get().asFile.walkTopDown()
            .filter { it.isFile && it.extension == "class" }
            .filter {
                !it.name.startsWith("M3NavigationFilter") &&
                    !it.name.startsWith("M3NavigationPreference") &&
                    !it.name.startsWith("TransparentStatusBarFilter")
            }
            .forEach { it.delete() }
    }
}
