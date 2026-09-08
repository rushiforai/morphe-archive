group = "com.morphe.friendsturner"

patches {
    about {
        name = "FriendsTurner Patches"
        description = "Patches for FriendsTurner (com.peter890331.friendsturner)"
        source = "git@github.com:miketweaver/friendsturner-patches.git"
        author = "miketweaver"
        contact = "na"
        website = "na"
        license = "GPLv3"
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
}
