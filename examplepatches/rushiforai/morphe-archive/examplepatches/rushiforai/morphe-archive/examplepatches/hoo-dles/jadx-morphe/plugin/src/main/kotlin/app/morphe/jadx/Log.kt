package app.morphe.jadx

import app.morphe.jadx.Plugin.Companion.ID
import app.morphe.patcher.Fingerprint
import io.github.oshai.kotlinlogging.KLogger
import io.github.oshai.kotlinlogging.KotlinLogging
import kotlin.script.experimental.api.EvaluationResult
import kotlin.script.experimental.api.ResultValue
import kotlin.script.experimental.api.ResultWithDiagnostics

val Log = KotlinLogging.logger("$ID/plugin")

fun KLogger.logEvalResult(result: ResultWithDiagnostics<EvaluationResult>) {
    if (result is ResultWithDiagnostics.Failure) {
        val logSb = StringBuilder("Script evaluation FAILED")
        result.reports.forEach { report ->
            logSb.appendLine("  ${report.severity}: ${report.message}")
            report.exception?.let { logSb.appendLine("    ${it.message}") }
        }
        warn { logSb.toString() }
    }
    else if (result is ResultWithDiagnostics.Success){
        val prefix = "Script evaluation SUCCEEDED and returned "
        when (val returnValue = result.value.returnValue) {
            is ResultValue.NotEvaluated -> warn { prefix + "NOT_EVALUATED" }
            is ResultValue.Unit -> warn { prefix + "UNIT" }
            is ResultValue.Error -> warn { prefix + "ERROR: ${returnValue.error.message}" }
            is ResultValue.Value -> {
                val log = prefix + "VALUE (${returnValue.value?.javaClass?.name})"
                if (returnValue.value !is Fingerprint) warn { log }
                else info { log }
            }
        }
    }
}