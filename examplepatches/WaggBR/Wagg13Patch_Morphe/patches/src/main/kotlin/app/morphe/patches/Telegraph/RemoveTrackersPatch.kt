package app.morphe.patches.telegraph

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

// Neutraliza o AppMetrica (activate + putErrorEnvironmentValue), os únicos pontos do código
// do app que o acionam (Application.onCreate — l0 na 13.0.2.0 — e ActionBarLayout).
// getLibraryApiLevel()I e getReporter() também aparecem na 13.0.2.0, mas devolvem valor e por
// isso não são tocados: só chamadas static void são trocadas por nop.
@Suppress("unused")
val removeTrackersPatch = bytecodePatch(
    name = "Remove Telegraph trackers",
    description = "Disables AppMetrica (usage analytics and crash reports).",
    default = true
) {
    compatibleWith(TelegraphCompatibility.TELEGRAPH)

    val appMetricaCallFingerprint = Fingerprint(
        filters = listOf(
            methodCall(definingClass = "Lio/appmetrica/analytics/AppMetrica;")
        )
    )

    execute {
        val matches = appMetricaCallFingerprint.matchAllOrNull()
            ?: throw PatchException("Nenhuma chamada ao AppMetrica encontrada.")

        // Todas as chamadas são static void sem move-result, então nop é seguro.
        matches.forEach { it.method.nopStaticCallsTo("Lio/appmetrica/analytics/AppMetrica;") }
    }
}
