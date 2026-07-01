// TODO: Figure out why this causes problems.
rootProject.name = "morphe-library"

buildCache {
    local {
        isEnabled = "CI" !in System.getenv()
    }
}

pluginManagement {
    repositories {
        mavenLocal()
        google()
        mavenCentral()
    }
}
