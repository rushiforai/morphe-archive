import com.android.build.api.variant.AndroidComponentsExtension

extension {
    name = "extensions/extension.mpe"
}

val cronetStubsClasses = layout.buildDirectory.dir("cronet-stubs/classes")
val androidComponents = extensions.getByType(AndroidComponentsExtension::class.java)

val compileCronetStubs by tasks.registering(JavaCompile::class) {
    source = fileTree("../cronet-stubs/src/main/java") {
        include("**/*.java")
    }
    classpath = files(androidComponents.sdkComponents.bootClasspath)
    destinationDirectory.set(cronetStubsClasses)
    sourceCompatibility = JavaVersion.VERSION_17.toString()
    targetCompatibility = JavaVersion.VERSION_17.toString()
}

val cronetStubsJar by tasks.registering(Jar::class) {
    dependsOn(compileCronetStubs)
    from(cronetStubsClasses)
    archiveClassifier.set("cronet-stubs")
}

android {
    namespace = "app.kontsevoye.ytmusicproxy.extension"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

dependencies {
    compileOnly(files(cronetStubsJar.flatMap { it.archiveFile }))
}
