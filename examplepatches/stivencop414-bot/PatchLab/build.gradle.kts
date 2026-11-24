val reviewedBouncyCastle = libs.versions.bouncycastle.get()
val reviewedGuava = libs.versions.guava.get()

allprojects {
    configurations.configureEach {
        resolutionStrategy.eachDependency {
            if (requested.group == "org.bouncycastle") {
                useVersion(reviewedBouncyCastle)
            }
            if (requested.group == "com.google.guava" && requested.name == "guava") {
                useVersion(reviewedGuava)
            }
        }
    }
}
