// Root build configuration for DecontaPatches

tasks.register("generatePatchesList") {
    dependsOn(":patches:generatePatchesList")
}

