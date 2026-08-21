plugins {
    base
    id("com.android.library") version "8.7.3" apply false
    kotlin("jvm") version "2.2.21" apply false
}

tasks {
    named<Delete>("clean") {
        delete(rootProject.layout.buildDirectory)
    }
}
