plugins {
    base
}

tasks {
    val cleanGenerated = register<Delete>("cleanGenerated") {
        delete(project.project("extensions").projectDir.resolve("__generated__"))
    }

    register<GeneratePairipExtensionTask>("codegen") {
        description = "Generates extension modules based on reflection mappings defined in " +
                "`patches/resources/pairip/[app_name].json`."

        dependsOn(cleanGenerated)
    }

    named<Delete>("clean") {
        dependsOn(cleanGenerated)
    }
}