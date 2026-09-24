group = "space.gonextstep.dnevniknextpatch"

patches {
    about {
        name = "DnevnikNextPatch"
        description = "Patch dnevnik the best"
        source = "git@github.com:NextStepTeam/DnevnikNextPatch.git"
        author = "NextStep"
        contact = "help@gonextstep.space"
        website = "https://gonextstep.space"
        license = "GPLv3"
    }
}

dependencies {
    // Для компиляции патчей
    compileOnly("app.morphe:morphe-patches-library:1.6.2")
    // Для работы PatchListGenerator
    implementation("com.google.code.gson:gson:2.10.1")
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Generate patches list"
        dependsOn(build)
        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    publish {
        dependsOn("generatePatchesList")
    }
}
