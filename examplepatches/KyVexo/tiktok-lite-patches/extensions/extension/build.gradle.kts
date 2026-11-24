extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.tiktoklitepatches.extension"
}

val patchVersion = providers.gradleProperty("version")
val generatePatchVersion = tasks.register("generatePatchVersion") {
    val output = layout.buildDirectory.dir("generated/patchVersion")
    inputs.property("patchVersion", patchVersion)
    outputs.dir(output)
    doLast {
        val source = output.get().file("app/tiktoklitepatches/extension/PatchVersion.java").asFile
        source.parentFile.mkdirs()
        source.writeText(
            "package app.tiktoklitepatches.extension;\n" +
                "final class PatchVersion { static final String NAME = \"${patchVersion.get()}\"; }\n"
        )
    }
}
android.sourceSets.getByName("main").java.srcDir("build/generated/patchVersion")
tasks.named("preBuild") { dependsOn(generatePatchVersion) }
