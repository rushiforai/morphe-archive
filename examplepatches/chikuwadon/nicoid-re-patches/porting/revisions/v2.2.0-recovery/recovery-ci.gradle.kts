import java.io.File

// Isolated verification task, deliberately not wired to buildAndroid or publish.
val v220Root = rootProject.file("porting/revisions/v2.2.0-recovery")
val v220Input = providers.gradleProperty("nicoidV220InputDir")
val v220Output = providers.gradleProperty("nicoidV220Output")
val v220Java = providers.gradleProperty("nicoidV220JavaHome")
tasks.register<Exec>("rebuildV220Ci") {
    group = "verification"
    description = "Rebuild and compare the locked unpublished v2.2.0 MPP"
    workingDir(rootProject.projectDir)
    doFirst {
        val javaHome = rootProject.file(v220Java.get())
        check(javaHome.resolve("bin/java").isFile)
        environment("JAVA_HOME", javaHome.absolutePath)
        environment("PATH", javaHome.resolve("bin").absolutePath + File.pathSeparator + System.getenv("PATH"))
        commandLine("bash", v220Root.resolve("build-ci.sh").absolutePath, rootProject.projectDir.absolutePath,
            rootProject.file(v220Input.get()).absolutePath, rootProject.file(v220Output.get()).absolutePath)
    }
}
