extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.morphe.extension"
}

dependencies {
    testImplementation("org.junit.jupiter:junit-jupiter:5.10.3")
    testRuntimeOnly("org.junit.platform:junit-platform-launcher:1.10.3")
}

tasks.withType<Test> {
    useJUnitPlatform()
}
