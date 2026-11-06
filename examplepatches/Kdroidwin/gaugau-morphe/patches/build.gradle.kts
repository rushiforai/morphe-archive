group = "jp.futabanet.gaugau.patches"

repositories {
    maven {
        name = "GitHubPackages"
        url = uri("https://maven.pkg.github.com/MorpheApp/registry")
        credentials {
            username = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")
            password = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")
        }
    }
    maven { url = uri("https://jitpack.io") }
    google()
    mavenCentral()
}

patches {
    about {
        name = "GauGau Extras"
        description = "Privacy controls and favorites transfer for GauGau Manga"
        source = "https://github.com/Kdroidwin/gaugau-morphe"
        author = "Kdroidwin"
        contact = ""
        website = "https://github.com/Kdroidwin/gaugau-morphe"
        license = "GPLv3"
    }
}

val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")
dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks.register<JavaExec>("generatePatchesList") {
    description = "Build a JSON index for the patch bundle"
    dependsOn("build")
    classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
    mainClass.set("util.PatchListGeneratorKt")
    systemProperty("patch.version", providers.gradleProperty("version").get())
}

tasks.named("publish") { dependsOn("generatePatchesList") }
