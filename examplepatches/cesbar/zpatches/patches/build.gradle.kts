group = "app.cesbar.patches"

patches {
    about {
        name = "zPatches"
        description = "morphe patches by cesbar"
        source = "git@github.com:cesbar/zpatches.git"
        author = "cesbar"
        contact = "na"
        website = "https://github.com/cesbar/zpatches"
        license = "GPLv3"
    }
}

dependencies {
    // Used by JsonGenerator.
    implementation(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
    }
    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

kotlin {
    jvmToolchain(21)
    
    compilerOptions {
        jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_11)
        freeCompilerArgs.add("-Xcontext-parameters") 
    }
}