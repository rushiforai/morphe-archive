package app.edoardo9708.twilight.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

// Limitiamo il test alla versione dell'APK effettivamente analizzata.
private val TWILIGHT = Compatibility(
    name = "Twilight",
    packageName = "com.urbandroid.lux",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0xFF6F43,
    targets = listOf(AppTarget(version = "14.32"))
)

// Identifica esclusivamente il getter booleano di TrialFilter.
private object TrialStatusFingerprint : Fingerprint(
    definingClass = "Lcom/urbandroid/lux/util/TrialFilter;",
    name = "isTrial",
    returnType = "Z",
    parameters = emptyList()
)

@Suppress("unused")
val trialStatusExperimentPatch = bytecodePatch(
    name = "Twilight - Test stato trial",
    description = "Unlock Pro",
    default = false
) {
    compatibleWith(TWILIGHT)

    execute {
        // isTrial() dispone di un solo registro (v0 = p0 all'ingresso).
        // Log.d richiede due stringhe: riutilizziamo v0 per tag e messaggio.
        // Dopo la stampa rimettiamo in v0 il booleano effettivamente restituito.
        TrialStatusFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "TW-isTrial=false"
                invoke-static {v0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
                const/4 v0, 0x0
                return v0
            """.trimIndent()
        )
    }
}
