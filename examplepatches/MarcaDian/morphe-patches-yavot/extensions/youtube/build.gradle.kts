import com.android.build.api.dsl.ApplicationExtension

// Compile against base morphe-patches' extension classes; nothing here is shipped.
// Precompile base before yavot: `:extensions:youtube:compileReleaseKotlin :compileReleaseJavaWithJavac`.
val baseExtDir = rootProject.file("../morphe-patches/extensions")
val baseClassesStaging = layout.buildDirectory.dir("base-classes-staging")

// AGP rejects raw classes.jar via compileOnly(files()), so we unpack lib jars +
// copy app-module class dirs into one staging tree.
val stageBaseClasses = tasks.register<Sync>("stageBaseClasses") {
    description = "Stages base morphe-patches' compiled extension classes into a single dir for compileOnly."
    group = "build"
    val libJars = fileTree(baseExtDir) {
        include("**/build/intermediates/compile_library_classes_jar/release/**/*.jar")
        include("**/build/intermediates/aar_main_jar/release/**/*.jar")
        include("**/build/intermediates/**/bundleLibCompileToJarRelease/**/*.jar")
    }
    libJars.forEach { from(zipTree(it)) }
    listOf(
        "youtube/build/intermediates/javac/release/compileReleaseJavaWithJavac/classes",
        "youtube/build/intermediates/built_in_kotlinc/release/compileReleaseKotlin/classes"
    ).forEach { from("$baseExtDir/$it") }
    into(baseClassesStaging)
    duplicatesStrategy = DuplicatesStrategy.EXCLUDE
}

dependencies {
    compileOnly(libs.annotation)
    compileOnly(libs.morphe.extensions.library)
}

// AGP's variant-aware compileClasspath drops raw file deps; inject staged classes into compile tasks directly.
val baseClassesFiles = files(baseClassesStaging).builtBy(stageBaseClasses)
afterEvaluate {
    tasks.matching { it.name.startsWith("compile") && it.name.endsWith("JavaWithJavac") }.configureEach {
        val jc = this as JavaCompile
        jc.classpath = (jc.classpath ?: files()) + baseClassesFiles
    }
    tasks.matching { it.name.startsWith("compile") && it.name.endsWith("Kotlin") }.configureEach {
        (this as org.jetbrains.kotlin.gradle.tasks.KotlinCompile).libraries.from(baseClassesFiles)
    }
}

configure<ApplicationExtension> {
    defaultConfig {
        minSdk = 26
    }
}
