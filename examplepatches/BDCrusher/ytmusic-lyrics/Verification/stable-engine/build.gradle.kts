plugins { kotlin("jvm") version "2.4.21" }
tasks.register<JavaExec>("auditPersonalFeatures"){dependsOn("classes");classpath=sourceSets["main"].runtimeClasspath;mainClass.set("app.bdcrusher.lyrics.AuditPersonalFeaturesKt");workingDir=rootDir;maxHeapSize="5g";doFirst {setArgs(listOf(providers.gradleProperty("auditManifest").get()))}}
tasks.register<JavaExec>("inspectPersonalFeatures") {dependsOn("classes");classpath=sourceSets["main"].runtimeClasspath;mainClass.set("app.bdcrusher.lyrics.InspectPersonalFeaturesKt");workingDir=rootDir;maxHeapSize="4g"}
repositories { mavenLocal(); mavenCentral(); google(); maven { url=uri("https://jitpack.io") } }

tasks.register<JavaExec>("inspectMusicActions") {
 dependsOn("classes");classpath=sourceSets["main"].runtimeClasspath
 mainClass.set("app.bdcrusher.lyrics.InspectMusicActionsKt");workingDir=rootDir;maxHeapSize="4g"
}

tasks.register<JavaExec>("inspectNativeProtocol") {
 dependsOn("classes");classpath=sourceSets["main"].runtimeClasspath
 mainClass.set("app.bdcrusher.lyrics.InspectNativeProtocolKt");workingDir=rootDir
}
dependencies {
    implementation("app.morphe:morphe-patcher:2.0.0")
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
    implementation("com.github.MorpheApp.smali:smali:4220ae75f7")
}
tasks.register<JavaExec>("verifyBundle") {
    dependsOn("classes")
    classpath = sourceSets["main"].runtimeClasspath
    mainClass.set("app.bdcrusher.lyrics.ValidateLyricsKt")
    workingDir = rootDir.resolve("../../Personal-Patches")
    maxHeapSize = "6g"
    doFirst {
        setArgs(listOf(
            providers.gradleProperty("inputApk").getOrElse(rootDir.resolve("../../Inputs/youtube-music-9.42.52-original.apk").canonicalPath),
            providers.gradleProperty("bundlePath").getOrElse(rootDir.resolve("../../Personal-Patches/patches/build/libs/patches-0.2.0-beta.1.mpp").canonicalPath),
            rootDir.resolve(providers.gradleProperty("verificationDir").get()).canonicalPath,
            providers.gradleProperty("mode").getOrElse("defaults")
        ) + (providers.gradleProperty("officialPath").orNull?.let {listOf(it)} ?: emptyList()))
    }
}

tasks.register<JavaExec>("auditEntry") {
    dependsOn("classes")
    classpath=sourceSets["main"].runtimeClasspath
    mainClass.set("app.bdcrusher.lyrics.AuditEntryKt")
    workingDir=rootDir
    doFirst { setArgs(listOf(providers.gradleProperty("auditManifest").get())) }
}
tasks.register<JavaExec>("inspectEntryHost") {
    dependsOn("classes")
    classpath=sourceSets["main"].runtimeClasspath
    mainClass.set("app.bdcrusher.lyrics.InspectEntryHostKt")
    workingDir=rootDir
}
tasks.register<JavaExec>("inspectEntryBindings") {
    dependsOn("classes")
    classpath=sourceSets["main"].runtimeClasspath
    mainClass.set("app.bdcrusher.lyrics.InspectEntryBindingsKt")
    workingDir=rootDir
}

tasks.register<JavaExec>("inspectMusicEngagement") { dependsOn("classes");classpath=sourceSets["main"].runtimeClasspath;mainClass.set("app.bdcrusher.lyrics.InspectMusicEngagementKt");workingDir=rootDir;maxHeapSize="4g" }

tasks.register<JavaExec>("inspectButtonSchemas") { dependsOn("classes");classpath=sourceSets["main"].runtimeClasspath;mainClass.set("app.bdcrusher.lyrics.InspectButtonSchemasKt");workingDir=rootDir;maxHeapSize="4g" }

tasks.register<JavaExec>("auditModelEntry") { dependsOn("classes");classpath=sourceSets["main"].runtimeClasspath;mainClass.set("app.bdcrusher.lyrics.AuditModelEntryKt");workingDir=rootDir;doFirst {setArgs(listOf(providers.gradleProperty("auditManifest").get()))} }
tasks.register<JavaExec>("inspectModelContracts") { dependsOn("classes");classpath=sourceSets["main"].runtimeClasspath;mainClass.set("app.bdcrusher.lyrics.InspectModelContractsKt");workingDir=rootDir }
tasks.register<JavaExec>("inspectActionReplay") { dependsOn("classes");classpath=sourceSets["main"].runtimeClasspath;mainClass.set("app.bdcrusher.lyrics.InspectActionReplayKt");workingDir=rootDir }
tasks.register<JavaExec>("inspectLyricsPresentation") { dependsOn("classes");classpath=sourceSets["main"].runtimeClasspath;mainClass.set("app.bdcrusher.lyrics.InspectLyricsPresentationKt");workingDir=rootDir }
tasks.register<JavaExec>("inspectLyricsBackground") { dependsOn("classes");classpath=sourceSets["main"].runtimeClasspath;mainClass.set("app.bdcrusher.lyrics.InspectLyricsBackgroundKt");workingDir=rootDir }
tasks.register<JavaExec>("inspectShaderVideo") { dependsOn("classes");classpath=sourceSets["main"].runtimeClasspath;mainClass.set("app.bdcrusher.lyrics.InspectShaderVideoKt");workingDir=rootDir;maxHeapSize="4g" }
tasks.register<JavaExec>("inspectLifecycle") { dependsOn("classes");classpath=sourceSets["main"].runtimeClasspath;mainClass.set("app.bdcrusher.lyrics.InspectLifecycleKt");workingDir=rootDir;maxHeapSize="4g" }

tasks.register<JavaExec>("auditInvokeAccess"){dependsOn("classes");classpath=sourceSets["main"].runtimeClasspath;mainClass.set("app.bdcrusher.lyrics.AuditInvokeAccessKt");workingDir=rootDir;maxHeapSize="4g";doFirst{setArgs(listOf(providers.gradleProperty("accessApk").get(),providers.gradleProperty("accessExpected").getOrElse("expect-pass")))}}
tasks.register<JavaExec>("inspectDownload40"){dependsOn("classes");classpath=sourceSets["main"].runtimeClasspath;mainClass.set("app.bdcrusher.lyrics.InspectDownload40Kt");workingDir=rootDir;maxHeapSize="4g";doFirst{setArgs(listOf(providers.gradleProperty("target40").get()))}}
tasks.register<JavaExec>("auditDownloads40"){dependsOn("classes");classpath=sourceSets["main"].runtimeClasspath;mainClass.set("app.bdcrusher.lyrics.AuditDownloads40Kt");workingDir=rootDir;maxHeapSize="5g";doFirst{setArgs(listOf(providers.gradleProperty("auditManifest").get()))}}
tasks.register<JavaExec>("inspectDownloads41"){dependsOn("classes");classpath=sourceSets["main"].runtimeClasspath;mainClass.set("app.bdcrusher.lyrics.InspectDownloads41Kt");workingDir=rootDir;maxHeapSize="4g";doFirst{setArgs(listOf(providers.gradleProperty("target41").get()))}}
tasks.register<JavaExec>("auditDownloads41"){dependsOn("classes");classpath=sourceSets["main"].runtimeClasspath;mainClass.set("app.bdcrusher.lyrics.AuditDownloads41Kt");workingDir=rootDir;maxHeapSize="5g";doFirst{setArgs(listOf(providers.gradleProperty("auditManifest").get()))}}
tasks.register<JavaExec>("inspectDownloads42"){dependsOn("classes");classpath=sourceSets["main"].runtimeClasspath;mainClass.set("app.bdcrusher.lyrics.InspectDownloads42Kt");workingDir=rootDir;maxHeapSize="4g";doFirst{setArgs(listOf(providers.gradleProperty("target42").get(),providers.gradleProperty("phase42").getOrElse("action"),providers.gradleProperty("focus42").getOrElse("")))}}
tasks.register<JavaExec>("auditDownloads42"){dependsOn("classes");classpath=sourceSets["main"].runtimeClasspath;mainClass.set("app.bdcrusher.lyrics.AuditDownloads42Kt");workingDir=rootDir;maxHeapSize="5g";doFirst{setArgs(listOf(providers.gradleProperty("auditManifest").get()))}}
