group = "app.fluffy"

patches {
    about {
        name = "0x11DFE Morphe patches"
        description = "Patches for apps I use - currently Waypoint (com.greycastel.waypoint) and Scene (com.omarea.vtools)"
        source = "https://github.com/0x11DFE/morphe-patches"
        author = "0x11DFE"
        contact = "https://github.com/0x11DFE"
        website = "https://github.com/0x11DFE/morphe-patches"
        license = "GPLv3"
    }
}

java {
    sourceCompatibility = JavaVersion.VERSION_17
    targetCompatibility = JavaVersion.VERSION_17
}

kotlin {
    compilerOptions {
        jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17)
    }
}

val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"
        dependsOn(build)
        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }
    publish {
        dependsOn("generatePatchesList")
    }
}
