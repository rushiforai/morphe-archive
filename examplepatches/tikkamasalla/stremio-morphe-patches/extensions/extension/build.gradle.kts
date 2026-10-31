import org.gradle.api.tasks.compile.JavaCompile

extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.tikkamasalla.stremio.introskip"
}

val androidSdk = File(
    System.getenv("ANDROID_HOME") ?: System.getenv("ANDROID_SDK_ROOT")
        ?: error("Set ANDROID_HOME or ANDROID_SDK_ROOT"),
)
// android-34 when present, otherwise the newest installed platform.
val androidJar = File(androidSdk, "platforms/android-34/android.jar").takeIf { it.exists() }
    ?: File(androidSdk, "platforms").listFiles { f -> f.name.startsWith("android-") }
        ?.sortedBy { it.name.removePrefix("android-").toIntOrNull() ?: 0 }
        ?.lastOrNull()?.let { File(it, "android.jar") }
    ?: error("No Android platform found in $androidSdk")

// Vimu's own classes (PlayerFragment, e, B.D) are compile-only stubs: they resolve
// javac references in net.gtvbox.videoplayer but are never packaged into the .mpe,
// the real classes come from the patched app at runtime.
val vimuStubsDir = file("${layout.buildDirectory.get()}/vimu-stubs")

val compileVimuStubs = tasks.register<JavaCompile>("compileVimuStubs") {
    source = fileTree("src/vimu-stubs/java") { include("**/*.java") }
    classpath = files(androidJar)
    destinationDirectory.set(vimuStubsDir)
    options.release.set(8)
}

// The Morphe plugin wires module dependencies into the variant classpaths itself,
// which drops plain file dependencies. Put the stubs on the javac classpath directly.
afterEvaluate {
    tasks.withType<JavaCompile>().configureEach {
        if (name != compileVimuStubs.name && classpath != null) {
            dependsOn(compileVimuStubs)
            classpath = classpath + files(vimuStubsDir)
        }
    }
}

dependencies {
    compileOnly("androidx.media3:media3-common:1.8.0")
    compileOnly("androidx.preference:preference:1.2.1")
}
