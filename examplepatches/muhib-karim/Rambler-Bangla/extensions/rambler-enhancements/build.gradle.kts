import java.nio.charset.StandardCharsets

extension {
    name = "extensions/rambler-enhancements.rve"
}

android {
    namespace = "dev.abotmaker.ramblerenhancements"

    defaultConfig {
        minSdk = 26
    }

    lint {
        abortOnError = true
        checkReleaseBuilds = false
        checkOnly += "NewApi"
    }
}

dependencies {
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.robolectric:robolectric:4.14.1")
}

tasks.named("syncExtension") {
    dependsOn("lintDebug")
    doLast {
        val extensionDex = layout.buildDirectory.file(
            "morphe/extensions/rambler-enhancements.rve"
        ).get().asFile
        check(extensionDex.isFile) {
            "Morphe extension dex was not generated: $extensionDex"
        }
        val dexText = String(extensionDex.readBytes(), StandardCharsets.ISO_8859_1)
        listOf(
            "Ldev/abotmaker/ramblerenhancements/RamblerDynamicConfig;",
            "Ldev/abotmaker/ramblerenhancements/RamblerFlagRuntime;",
            "Ldev/abotmaker/ramblerenhancements/RamblerMuseStatsBridge;",
            "Ldev/abotmaker/ramblerenhancements/RamblerContactsRuntime;",
            "Ldev/abotmaker/ramblerenhancements/RamblerWaveformRuntime;",
            "Ldev/abotmaker/ramblerenhancements/RamblerEnhancementsActivity;",
            "Lcom/akshaykadam/pixelboard/extension/ramblerlite/GboardRamblerLiteScriptRuntime;",
            "Lcom/akshaykadam/pixelboard/extension/rambler/GboardRamblerScriptFix;",
            "Lcom/akshaykadam/pixelboard/extension/rambler/GboardRamblerSegmentLock;",
            "Lcom/akshaykadam/pixelboard/extension/rambler/GboardRamblerSentenceLang;",
            "Lcom/akshaykadam/pixelboard/extension/rambler/GboardRamblerLoanSpell;",
        ).forEach { descriptor ->
            check(dexText.contains(descriptor)) {
                "Morphe extension dex is missing required type: $descriptor"
            }
        }
    }
}
