extension {
    name = "extensions/twitch.mpe"
}

android {
    namespace = "dev.twitchpatches.extension"
    compileSdk = 36
    defaultConfig {
        minSdk = 26
    }
}

val compileIvsApi by tasks.registering(JavaCompile::class) {
    source(rootProject.fileTree("shared/ivs-api/src/main/java") { include("**/*.java") })
    classpath = files()
    destinationDirectory.set(layout.buildDirectory.dir("ivs-api/classes"))
    options.release.set(8)
}
val ivsApiJar by tasks.registering(Jar::class) {
    dependsOn(compileIvsApi)
    from(compileIvsApi.flatMap { it.destinationDirectory })
    archiveFileName.set("ivs-api-compile-only.jar")
    destinationDirectory.set(layout.buildDirectory.dir("ivs-api"))
}

dependencies {
    compileOnly(files(ivsApiJar))
    testImplementation(files(ivsApiJar))
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.json:json:20240303")
}

configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
}
