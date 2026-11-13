import com.github.jengelman.gradle.plugins.shadow.tasks.ShadowJar
import java.util.zip.ZipFile

plugins {
    id("com.gradleup.shadow") version "9.6.1" apply false
}

extension {
    name = "extensions/cutlog.mpe"
}

android {
    namespace = "dev.utaa.cutlog.extension"
}

// setlog 本体にも media3 や Kotlin などのクラスが元の名前のまま一部残っているため、
// 同梱するライブラリはすべて cutlog 専用のパッケージ名へ付け替えて衝突を避ける。
val media3Shade: Configuration = configurations.create("media3Shade") {
    isCanBeConsumed = false
    isCanBeResolved = true
}

dependencies {
    media3Shade("androidx.media3:media3-transformer:1.11.1")
    media3Shade("androidx.media3:media3-effect:1.11.1")
    media3Shade("androidx.media3:media3-exoplayer:1.11.1")
}

afterEvaluate {
    val source = configurations.getByName("releaseRuntimeClasspath").attributes
    source.keySet().forEach { key ->
        @Suppress("UNCHECKED_CAST")
        val attribute = key as Attribute<Any>
        media3Shade.attributes.attribute(attribute, source.getAttribute(attribute)!!)
    }
}

val shadedPrefix = "dev.utaa.cutlog.shaded"
val relocatedPackages = listOf(
    "androidx",
    "com.google",
    "kotlin",
    "kotlinx",
    "org.checkerframework",
    "org.jspecify",
    "javax.annotation",
    "org.intellij",
    "org.jetbrains",
)
val artifactType: Attribute<String> = Attribute.of("artifactType", String::class.java)

val shadeMedia3 = tasks.register<ShadowJar>("shadeMedia3") {
    archiveFileName.set("media3-shaded.jar")
    destinationDirectory.set(layout.buildDirectory.dir("shaded"))
    val classJars = media3Shade.incoming.artifactView {
        attributes {
            attribute(artifactType, "android-classes-jar")
        }
    }.files
    from(classJars.elements.map { jars -> jars.map { zipTree(it.asFile) } })
    exclude("META-INF/*.version", "META-INF/*.kotlin_module", "META-INF/versions/**", "module-info.class")
    for (prefix in relocatedPackages) {
        relocate(prefix, "$shadedPrefix.$prefix")
    }
}

// AAR に同梱された R8 用の keep 規則も、付け替え後のパッケージ名へ書き換えて使う。
val media3Rules = layout.buildDirectory.file("shaded/media3-rules.pro")
val relocateMedia3Rules = tasks.register("relocateMedia3Rules") {
    val aars = media3Shade.incoming.artifactView {
        attributes { attribute(artifactType, "aar") }
    }.files
    inputs.files(aars)
    outputs.file(media3Rules)
    val output = media3Rules
    val packages = relocatedPackages
    val prefix = shadedPrefix
    doLast {
        val pattern = Regex("(?<![\\w.$])(" + packages.joinToString("|") { Regex.escape(it) } + ")\\.")
        val rules = aars.files.filter { it.name.endsWith(".aar") }.sortedBy { it.name }.joinToString("\n") { aar ->
            ZipFile(aar).use { zip ->
                val entry = zip.getEntry("proguard.txt") ?: return@use ""
                val text = zip.getInputStream(entry).bufferedReader().readText()
                "# ${aar.name}\n" + pattern.replace(text) { "$prefix.${it.groupValues[1]}." }
            }
        }
        output.get().asFile.writeText(rules)
    }
}

android {
    // setlog 1.3 の minSdkVersion。これより古い端末にはインストールされない。
    defaultConfig {
        minSdk = 32
    }
    lint {
        // 付け替えた media3 の NotificationUtil を検出するが、cutlog は通知を出さない。
        disable += "NotificationPermission"
    }
    buildTypes {
        getByName("release") {
            proguardFile(media3Rules)
        }
    }
}

// R8 と lint のモデル生成が付け替えた keep 規則を読む。
tasks.matching { it.name.startsWith("minifyRelease") || it.name.contains("Lint", ignoreCase = true) }.configureEach {
    dependsOn(relocateMedia3Rules)
}

dependencies {
    implementation(files(shadeMedia3))
}

dependencies {
    testImplementation("junit:junit:4.13.2")
}
