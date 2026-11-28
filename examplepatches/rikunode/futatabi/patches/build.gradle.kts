group = "dev.rikunode.futatabi"
patches {
    about {
        name = "futatabi"
        description = "Morphe patches for futatter 3.1.1"
        source = "https://github.com/rikunode/futatabi"
        author = "rikunode"
        contact = "https://github.com/rikunode"
        website = "https://github.com/rikunode/futatabi"
        license = "GPLv3"
    }
}
// Public bundles must not compile or package the optional private ad patch.
val privateAds = providers.gradleProperty("futatabiPrivateAds").map { it == "true" }.getOrElse(false)
if (!privateAds) {
    kotlin.sourceSets.named("main") {
        kotlin.exclude("**/BlockBannerAdsPatch.kt")
    }
}
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")
dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}
tasks {
    named<ProcessResources>("processResources") {
        val bundleVersion = project.version.toString()
        inputs.property("futatabiBundleVersion", bundleVersion)
        doLast {
            destinationDir.resolve("futatabi-patch-version.txt").writeText(bundleVersion, Charsets.UTF_8)
        }
    }
    named<Jar>("jar") {
        from(rootProject.file("LICENSE")) { into("META-INF") }
        from(rootProject.file("THIRD_PARTY_NOTICES")) { into("META-INF/THIRD_PARTY_NOTICES") }
    }
    register<JavaExec>("generatePatchesList") {
        dependsOn("buildAndroid")
        systemProperty("patchesVersion", project.version.toString())
        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }
    publish { dependsOn("generatePatchesList") }
}
