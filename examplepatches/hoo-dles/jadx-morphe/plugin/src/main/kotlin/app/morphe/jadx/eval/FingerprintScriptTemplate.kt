package app.morphe.jadx.eval

import kotlin.script.experimental.annotations.KotlinScript
import kotlin.script.experimental.api.*
import kotlin.script.experimental.jvm.dependenciesFromClassloader
import kotlin.script.experimental.jvm.jvm

@KotlinScript(
    displayName = "Fingerprint Script",
    fileExtension = "fp.kts",
    compilationConfiguration = FingerprintScriptCompilationConfiguration::class
)
abstract class FingerprintScript

object FingerprintScriptCompilationConfiguration :
    ScriptCompilationConfiguration({
        defaultImports(
            "app.morphe.patcher.*",
            "app.morphe.patcher.InstructionLocation.*",
            "com.android.tools.smali.dexlib2.*"
        )
        jvm {
            dependenciesFromClassloader(
                wholeClasspath = true,
                classLoader = FingerprintScript::class.java.classLoader,
            )
        }
        ide {
            acceptedLocations(ScriptAcceptedLocation.Everywhere)
        }
        isStandalone(true)

        // Forcing compiler to not use modules while building script classpath
        // because shadow jar remove all modules-info.class (https://github.com/GradleUp/shadow/issues/710)
        compilerOptions.append("-Xjdk-release=1.8")
    })