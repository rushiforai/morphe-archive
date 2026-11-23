import org.gradle.api.tasks.Copy
import org.gradle.api.tasks.bundling.Zip

tasks.register<Copy>("copyMppToDist") {
    group = "distribution"
    description = "Copies the compiled .mpp patch bundle to dist/"
    dependsOn(":patches:buildAndroid")

    from(layout.projectDirectory.dir("patches/build/libs")) {
        include("patches-${project.version}.mpp")
        exclude("*-sources.*", "*-javadoc.*")
        rename { "MaterialTidal-patches-${project.version}.mpp" }
    }
    into(layout.projectDirectory.dir("dist"))
}

tasks.register<Zip>("packageZip") {
    group = "distribution"
    description = "Packages the compiled .mpp bundle and README into MaterialTidal-patches.zip"
    dependsOn(":patches:buildAndroid", "copyMppToDist")

    archiveFileName.set("MaterialTidal-patches.zip")
    destinationDirectory.set(layout.projectDirectory)

    from(layout.projectDirectory.dir("patches/build/libs")) {
        include("patches-${project.version}.mpp")
        exclude("*-sources.*", "*-javadoc.*")
    }
    from(layout.projectDirectory.file("README.md"))
}
