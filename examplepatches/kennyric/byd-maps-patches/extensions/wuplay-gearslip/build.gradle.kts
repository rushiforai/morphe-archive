import java.util.zip.ZipFile
import java.util.zip.ZipInputStream
import java.util.jar.JarOutputStream
import java.util.jar.JarEntry

extension { name = "extensions/wuplay-gearslip.mpe" }
android {
    namespace = "nl.johninnl.wuplaycar"
    compileSdk = 36
    defaultConfig { minSdk = 24 }
    buildTypes { getByName("release") { proguardFiles("proguard-rules.pro") } }
}
dependencies {
    implementation("androidx.car.app:app:1.8.0-rc01") { isTransitive = false }
    compileOnly("org.jetbrains.kotlin:kotlin-stdlib:2.2.10")
    compileOnly("androidx.lifecycle:lifecycle-common:2.8.7")
    compileOnly("androidx.lifecycle:lifecycle-runtime:2.8.7")
    compileOnly("androidx.core:core:1.15.0")
}
configurations.matching { it.name == "releaseRuntimeClasspath" || it.name == "debugRuntimeClasspath" }
    .configureEach { exclude(group = "org.jetbrains.kotlin") }

// Bundler checks Person even for ordinary templates. WuPlay R8 removes that class;
// retain only these upstream classes, never a second full AndroidX Core runtime.
val carCore = configurations.create("carCore")
dependencies { carCore("androidx.core:core:1.15.0") { isTransitive = false } }
val coreSubset = layout.buildDirectory.file("generated/car-core-person.jar")
val prepareCarCore = tasks.register("prepareCarCore") {
    inputs.files(carCore)
    outputs.file(coreSubset)
    doLast {
        val destination = coreSubset.get().asFile
        destination.parentFile.mkdirs()
        val aar = carCore.singleFile
        ZipFile(aar).use { archive ->
            ZipInputStream(archive.getInputStream(archive.getEntry("classes.jar"))).use { classes ->
                JarOutputStream(destination.outputStream()).use { output ->
                    var entry = classes.nextEntry
                    var count = 0
                    while (entry != null) {
                        if (entry.name.startsWith("androidx/core/app/Person") && entry.name.endsWith(".class")) {
                            output.putNextEntry(JarEntry(entry.name))
                            classes.copyTo(output)
                            output.closeEntry()
                            count++
                        }
                        entry = classes.nextEntry
                    }
                    check(count > 0) { "AndroidX Person compatibility classes missing" }
                }
            }
        }
    }
}
dependencies { implementation(files(coreSubset).builtBy(prepareCarCore)) }
