import com.android.build.api.dsl.ApplicationExtension
import org.gradle.api.tasks.Sync
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream

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
}

// Owned features have one shared selectable runtime. Keep them out of Full's native MPE.
val prepareNativeMusicRuntime=tasks.register("prepareNativeMusicRuntime") {
    dependsOn("compileReleaseJavaWithJavac")
    val classes=layout.buildDirectory.dir("intermediates/javac/release/compileReleaseJavaWithJavac/classes")
    inputs.dir(classes)
    val output=layout.buildDirectory.dir("personal-native-runtime")
    outputs.file(output.map { it.file("classes.dex") })
    doLast {
        val folder=output.get().asFile.also {it.mkdirs()}
        val native=folder.resolve("native.jar");val contracts=folder.resolve("contracts.jar")
        val roots=listOf("music","shared/library","shared-youtube/library","shared-youtube/stub","youtube/stub").map {rootProject.file("extensions/$it/build/intermediates/javac/release/compileReleaseJavaWithJavac/classes")}
        for((target,program) in listOf(native to true,contracts to false)){
            val seen=mutableSetOf<String>()
            ZipOutputStream(target.outputStream()).use {zip->for((index,root) in roots.withIndex())if(root.exists())for(f in root.walkTopDown().filter {it.isFile&&it.extension=="class"}){
                val name=f.relativeTo(root).invariantSeparatorsPath
                val isNative=index==0&&!name.startsWith("app/bdcrusher/")
                if(isNative!=program||!seen.add(name))continue
                zip.putNextEntry(ZipEntry(name));f.inputStream().use {it.copyTo(zip)};zip.closeEntry()
            }}
        }
        com.android.tools.r8.D8.run(com.android.tools.r8.D8Command.builder().addProgramFiles(native.toPath()).addClasspathFiles(contracts.toPath())
            .addLibraryFiles(File(System.getenv("ANDROID_HOME"),"platforms/android-36/android.jar").toPath())
            .setMinApiLevel(26).setMode(com.android.tools.r8.CompilationMode.RELEASE).setOutput(folder.toPath(),com.android.tools.r8.OutputMode.DexIndexed).build())
    }
}
tasks.named<Sync>("syncExtension") {
    dependsOn(prepareNativeMusicRuntime)
    val nativeDex=layout.buildDirectory.file("personal-native-runtime/classes.dex")
    from(nativeDex)
    eachFile { if(file.canonicalFile!=nativeDex.get().asFile.canonicalFile)exclude() }
}
