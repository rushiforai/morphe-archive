plugins {
    kotlin("jvm")
}

group = "app.morphe.viber"
version = "1.0.0"

patches {
    about {
        name = "Viber Morphe Patches"
        description = "Feature enhancements, privacy controls, and ad removal for Viber (com.viber.voip)."
        source = "https://github.com/kal/viber-morphe-patches"
        author = "Kal"
        contact = "na"
        website = "https://morphe.software"
        license = "GPL-3.0"
    }
}

val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    implementation(libs.morphe.patcher)
    implementation("com.google.guava:guava:33.0.0-jre")
    implementation(libs.gson)

    testImplementation(kotlin("test"))
}

kotlin {
    jvmToolchain(17)
}
