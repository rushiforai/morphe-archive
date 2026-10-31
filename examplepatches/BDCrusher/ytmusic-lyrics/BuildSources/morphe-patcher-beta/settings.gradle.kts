rootProject.name = "morphe-patcher"

// Include Morphe forks of libraries as composite builds if they exist locally
mapOf(
    "ARSCLib-beta" to "com.github.MorpheApp:ARSCLib",
).forEach { (libraryPath, libraryName) ->
    val libDir = file("../$libraryPath")
    if (libDir.exists()) {
        includeBuild(libDir) {
            dependencySubstitution {
                substitute(module(libraryName)).using(project(":"))
            }
        }
    }
}

// Exact Smali 4220ae75f7 is built to the app-local Maven repository with Gradle 8.9.
