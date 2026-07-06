package app.morphe.jadx.eval

import app.morphe.jadx.Log
import app.morphe.jadx.logEvalResult
import kotlin.script.experimental.api.EvaluationResult
import kotlin.script.experimental.api.ResultWithDiagnostics
import kotlin.script.experimental.api.ScriptEvaluationConfiguration
import kotlin.script.experimental.host.ScriptingHostConfiguration
import kotlin.script.experimental.host.toScriptSource
import kotlin.script.experimental.jvm.baseClassLoader
import kotlin.script.experimental.jvm.jvm
import kotlin.script.experimental.jvmhost.BasicJvmScriptingHost
import kotlin.time.measureTime
import kotlin.time.measureTimedValue

object ScriptingHost {
    private val configuration = ScriptEvaluationConfiguration {
        jvm {
            // Use the classloader of the FingerprintScript class, which should be the plugin's classloader
            baseClassLoader(FingerprintScript::class.java.classLoader)
        }
    }
    private val scriptingHost = BasicJvmScriptingHost(
        baseHostConfiguration = ScriptingHostConfiguration {
            jvm {
                baseClassLoader(FingerprintScript::class.java.classLoader)
            }
        },
    )

    fun preload() {
        Log.info { "Preloading BasicJvmScriptingHost..." }
        val execTime = measureTime {
            // This is a no-op, but it forces the BasicJvmScriptingHost to initialize
            evaluate("", false)
        }
        Log.info { "Preloading completed in ${execTime.inWholeMilliseconds}ms" }
    }

    fun evaluate(script: String, log: Boolean = true): ResultWithDiagnostics<EvaluationResult> {
        if (log) Log.info { "Evaluating script:\n$script" }
        val (result, duration) = measureTimedValue {
            scriptingHost.eval(
                script.toScriptSource(),
                FingerprintScriptCompilationConfiguration,
                configuration
            )
        }
        if (log) {
            Log.info { "Script evaluation completed in ${duration.inWholeMilliseconds}ms" }
            Log.logEvalResult(result)
        }

        return result
    }
}



