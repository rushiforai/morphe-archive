import java.util.zip.ZipOutputStream
import java.util.zip.ZipEntry
import java.util.zip.ZipFile
import org.jetbrains.kotlin.gradle.dsl.JvmTarget

group="app.bdcrusher.ytmusic"
patches {
    extensionsProjectPath=null
    about {
        name="BDCrusher YT-Music Lyrics Add-on"
        description="Lyrics-only companion for official Morphe Music patches. Disable official Third-party lyrics."
        source="local:YT-Music/Personal-Patches"
        contact="na"
        website=""
        author="BDCrusher; MorpheApp and Better Lyrics contributors"
        license="GNU GPL v3; upstream notices apply"
    }
}
java { sourceCompatibility=JavaVersion.VERSION_17;targetCompatibility=JavaVersion.VERSION_17;toolchain {languageVersion.set(JavaLanguageVersion.of(17))} }
kotlin {compilerOptions {jvmTarget.set(JvmTarget.JVM_17)}}
tasks.named<Jar>("jar") {
    // The upstream plugin wires extension artifacts at apply-time, before this DSL is configured.
    // Keep only the explicitly prepared personal runtime in this independent edition.
    eachFile { if(path.startsWith("extensions/")&&path!="extensions/lyrics-addon.mpe")exclude() }
    from(rootProject.file("patches/src/main/resources/bdcrusher-lyrics")) {into("bdcrusher-lyrics")}
    from(rootProject.file("patches/src/main/resources/bdcrusher-shaders")) {into("bdcrusher-shaders")}
    from(rootProject.file("patches/src/main/resources/bdcrusher-common")) {into("bdcrusher-common")}
    from(rootProject.file("patches/src/main/resources/copyvideolinkbutton/drawable/morphe_yt_copy_bold.xml")) {into("drawable")}
    from(rootProject.file("patches/src/main/resources/romanisationbutton/drawable/morphe_yt_romanize.xml")) {into("drawable")}
    from(rootProject.file("NOTICE"))
    from(rootProject.file("LICENSE"))
}



val prepareRuntime=tasks.register("prepareRuntime") {
    dependsOn(":extensions:music:compileReleaseJavaWithJavac")
    val output=layout.buildDirectory.file("runtime/lyrics-addon.mpe")
    outputs.file(output)
    // D8 consumes only personal .class files; native Morphe and Android types are classpath-only.
    inputs.dir(rootProject.file("extensions/music/build/intermediates/javac/release/compileReleaseJavaWithJavac/classes"))
    doLast {
        val folder=layout.buildDirectory.dir("runtime").get().asFile.also {it.mkdirs()}
        val own=folder.resolve("personal-classes.jar")
        val native=folder.resolve("native-contracts.jar")
        val classRoots=listOf("music","shared/library","shared-youtube/library","shared-youtube/stub","youtube/stub").map {rootProject.file("extensions/"+it+"/build/intermediates/javac/release/compileReleaseJavaWithJavac/classes")}
        fun pack(file:File,personal:Boolean){
            val names=mutableSetOf<String>()
            ZipOutputStream(file.outputStream()).use {zip->
                for(root in classRoots)if(root.exists())for(input in root.walkTopDown().filter {it.isFile&&it.extension=="class"}){
                    val name=input.relativeTo(root).invariantSeparatorsPath
                    if(name.startsWith("app/bdcrusher/")!=personal||!names.add(name))continue
                    zip.putNextEntry(ZipEntry(name));input.inputStream().use {it.copyTo(zip)};zip.closeEntry()
                }
            }
        }
        pack(own,true);pack(native,false)
        val sdk=File(System.getenv("ANDROID_HOME"))
        val command=com.android.tools.r8.D8Command.builder()
            .addProgramFiles(own.toPath()).addClasspathFiles(native.toPath())
            .addLibraryFiles(sdk.resolve("platforms/android-36/android.jar").toPath())
            .setMinApiLevel(26).setMode(com.android.tools.r8.CompilationMode.RELEASE)
            .setOutput(folder.resolve("lyrics-addon.zip").toPath(),com.android.tools.r8.OutputMode.DexIndexed).build()
        com.android.tools.r8.D8.run(command)
        ZipFile(folder.resolve("lyrics-addon.zip")).use {zip->
            check(zip.entries().asSequence().count {it.name.endsWith(".dex")}==1) {"Personal runtime unexpectedly needs multidex"}
            zip.getInputStream(zip.getEntry("classes.dex")).use {input->output.get().asFile.outputStream().use {input.copyTo(it)}}
        }
    }
}
tasks.named<Jar>("jar") {
    dependsOn(prepareRuntime)
    from(layout.buildDirectory.file("runtime/lyrics-addon.mpe")) {into("extensions")}
}




kotlin.sourceSets.named("main") { kotlin.srcDir(rootProject.file("shared-lyrics-patches/src/main/kotlin")) }
