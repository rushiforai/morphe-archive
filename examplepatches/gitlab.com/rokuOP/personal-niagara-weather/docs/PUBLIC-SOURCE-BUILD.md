# Public-source build

The template pins plugin 2.0.0 and patcher 1.15.1. Build their public sources as Gradle composite builds to avoid GitHub Packages authentication.

```powershell
git clone --branch v2.0.0 https://github.com/MorpheApp/morphe-patches-gradle-plugin.git C:\dev\morphe-gradle-plugin
git clone --branch v1.15.1 https://github.com/MorpheApp/morphe-patcher.git C:\dev\morphe-patcher
```

Verified revisions:

- Template: e721536ab19e30d16ce9d31ae1830ca299aad383
- Gradle plugin: c158697065aa77ee87996991281220949e603728
- Patcher: 812e96eaac173cd058ba49e242325371959befae

In the plugin's src/main/kotlin/app/morphe/patches/gradle/SettingsPlugin.kt, replace the final GitHub maven block inside configureDependencies with:

```kotlin
val githubUser = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")
val githubKey = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")
if (githubUser != null && githubKey != null) maven { repository ->
    repository.url = URI("https://maven.pkg.github.com/MorpheApp/registry")
    repository.credentials {
        it.username = githubUser
        it.password = githubKey
    }
}
```

This skips the authenticated repository when credentials are absent. The plugin and patcher come from local sources; other dependencies use their normal public repositories.

Set JAVA_HOME (JDK 21), ANDROID_HOME (SDK platform 35, Build Tools 36.0.0), and optionally GRADLE_USER_HOME. From this project:

```powershell
Copy-Item gradle.properties.example gradle.properties
.\gradlew.bat buildAndroid '-PmorphePluginSource=C:\dev\morphe-gradle-plugin' '-PmorphePatcherSource=C:\dev\morphe-patcher' --console=plain
.\gradlew.bat :patches:verifyBundle '-PmorphePluginSource=C:\dev\morphe-gradle-plugin' '-PmorphePatcherSource=C:\dev\morphe-patcher' '-PniagaraApk=C:\path\original.apk' --console=plain
```

The template's patch-list generator accessed formFactor, which is absent from its own pinned patcher API. This project sets that optional output field to null. Generated patch-list and release metadata were not edited by hand.
