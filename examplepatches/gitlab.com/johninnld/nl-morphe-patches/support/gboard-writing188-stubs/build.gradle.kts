plugins { `java-library` }
java { toolchain { languageVersion.set(JavaLanguageVersion.of(17)) } }
val sdk = providers.environmentVariable("ANDROID_HOME").orElse(providers.environmentVariable("ANDROID_SDK_ROOT"))
dependencies { compileOnly(files(sdk.map { "$it/platforms/android-36/android.jar" })) }
