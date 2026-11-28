// Isolated reproducibility tasks. Never replace the standard buildAndroid or publish task.
val recoveryRoot = rootProject.file("porting/revisions/v2.2.0-recovery")
val fixedZip = providers.gradleProperty("nicoidV220FixedZip")
val jvmZip = providers.gradleProperty("nicoidV220JvmZip")
val runtimeZip = providers.gradleProperty("nicoidV220RuntimeZip")
val recoveryOutput = providers.gradleProperty("nicoidV220Output")
val verifyOutput = providers.gradleProperty("nicoidV220VerifyOutput")
val stockApk = providers.gradleProperty("nicoidV220StockApk")
val referenceMpp = providers.gradleProperty("nicoidV220ReferenceMpp")
tasks.register<Exec>("rebuildV220Recovered") {
    group = "verification"
    description = "Reconstruct the unpublished 2.2.0 candidate from locked dev.5 sources and cumulative overlays"
    workingDir(rootProject.projectDir)
    doFirst {
        commandLine("bash", recoveryRoot.resolve("build-from-dev5.sh").absolutePath,
            rootProject.file(fixedZip.get()).absolutePath, rootProject.file(jvmZip.get()).absolutePath,
            rootProject.file(runtimeZip.get()).absolutePath, rootProject.file(recoveryOutput.get()).absolutePath)
    }
}
tasks.register<Exec>("verifyV220Recovered") {
    group = "verification"
    description = "Compare the locally rebuilt unpublished candidate with the locked reference MPP"
    workingDir(rootProject.projectDir)
    doFirst {
        commandLine("bash", recoveryRoot.resolve("verify.sh").absolutePath,
            rootProject.file(recoveryOutput.get()).absolutePath, rootProject.file(stockApk.get()).absolutePath,
            rootProject.file(referenceMpp.get()).absolutePath, rootProject.file(verifyOutput.get()).absolutePath)
    }
}
