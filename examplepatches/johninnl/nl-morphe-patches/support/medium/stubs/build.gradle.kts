plugins { `java-library` }

val androidSdk = providers.environmentVariable("ANDROID_HOME").orElse("${System.getProperty("user.home")}/Library/Android/sdk")
dependencies { compileOnly(files(androidSdk.map { "$it/platforms/android-36/android.jar" })) }

java {
    sourceCompatibility = JavaVersion.VERSION_1_8
    targetCompatibility = JavaVersion.VERSION_1_8
}

tasks.withType<JavaCompile>().configureEach { options.release.set(8) }
