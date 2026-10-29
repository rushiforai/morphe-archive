package lab.fonometro.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Fonometro 11.5 (versionCode 82, com.ktwapps.soundmeter).
 * Analisi del base.apk presente nell'archivio ASPK: classes2.dex.
 *
 * Nasconde gli spazi dei banner usando i percorsi di pulizia gia' presenti
 * nell'app, impedisce il precaricamento degli annunci e, per gli interstitial,
 * notifica il chiamante senza mostrare la pubblicita'.
 *
 * IMPORTANTE: non modifica getInt("premium", -1), BillingClient, acquisti,
 * preferenze, dati di licenza o altri controlli Premium.
 */
@Suppress("unused")
val fonometroDisableAdsPatch = bytecodePatch(
    name = "Fonometro - Remove ads",
    description = "Removes banner and interstitial ads without modifying Premium status, licenses, or in-app purchases.",
    default = false
) {
    compatibleWith(
        Compatibility(
            name = "Fonometro",
            packageName = "com.ktwapps.soundmeter",
            targets = listOf(AppTarget(version = "11.5"))
        )
    )

    execute {
        val mainClass = "Lcom/ktwapps/soundmeter/MainActivity;"
        val detailClass = "Lcom/ktwapps/soundmeter/Detail;"
        val adClass = "Lc5/a;"

        // Fallisce in modo esplicito se una versione non contiene il codice
        // verificato: non patchiamo metodi omonimi senza i riferimenti attesi.
        fun checkedMethod(
            definingClass: String,
            name: String,
            params: List<String>,
            registers: Int,
            vararg expectedCalls: String
        ): MutableMethod {
            val method = Fingerprint(
                definingClass = definingClass,
                name = name,
                returnType = "V",
                parameters = params
            ).method
            val body = method.implementation
                ?: error("Fonometro: metodo " + name + " privo di bytecode")
            val calls = body.instructions.mapNotNull {
                (it as? ReferenceInstruction)?.reference as? MethodReference
            }.map { it.definingClass + "->" + it.name }.toSet()

            require(body.registerCount == registers &&
                expectedCalls.all { it in calls }) {
                "Fonometro: bytecode inatteso in " + definingClass + "->" + name
            }
            return method
        }

        val main = checkedMethod(
            mainClass, "C1", emptyList(), 3,
            "Lc5/v;->f", mainClass + "->n1", mainClass + "->j1", adClass + "->m"
        )
        val detail = checkedMethod(
            detailClass, "m1", emptyList(), 3,
            "Lc5/v;->f", detailClass + "->Z0", adClass + "->l"
        )
        val loadDetailAd = checkedMethod(
            adClass, "l", listOf("Landroid/app/Activity;"), 4,
            adClass + "->n", adClass + "->g"
        )
        val loadMainAd = checkedMethod(
            adClass, "m", listOf("Landroid/app/Activity;"), 4,
            adClass + "->n", adClass + "->f", adClass + "->h"
        )
        val showInterstitial = checkedMethod(
            adClass, "o", listOf("Landroid/app/Activity;", "I"), 7,
            "Lc5/v;->f", "Lc5/a${'$'}e;->E"
        )
        val callbackFieldPresent = showInterstitial.implementation!!.instructions.any {
            val ref = (it as? ReferenceInstruction)?.reference as? FieldReference
            ref?.definingClass == adClass && ref.name == "d" &&
                ref.type == "Lc5/a${'$'}e;"
        }
        require(callbackFieldPresent) {
            "Fonometro: callback interstitial non trovata"
        }

        // Replica il percorso originale che nasconde il banner e sgancia
        // gli oggetti pubblicitari; mantiene il riadattamento della UI.
        main.addInstructions(
            0,
            """
                invoke-direct {p0}, Lcom/ktwapps/soundmeter/MainActivity;->n1()V
                iget-object v0, p0, Lcom/ktwapps/soundmeter/MainActivity;->M:Lc5/a;
                const/4 v1, 0x0
                invoke-virtual {v0, v1}, Lc5/a;->i(Lz2/i;)V
                iget-object v0, p0, Lcom/ktwapps/soundmeter/MainActivity;->M:Lc5/a;
                invoke-virtual {v0, v1}, Lc5/a;->j(LM2/a;)V
                invoke-direct {p0}, Lcom/ktwapps/soundmeter/MainActivity;->j1()V
                return-void
            """.trimIndent()
        )

        // Z0() e' il percorso originale che rimuove il banner dai dettagli.
        detail.addInstructions(
            0,
            """
                invoke-direct {p0}, Lcom/ktwapps/soundmeter/Detail;->Z0()V
                return-void
            """.trimIndent()
        )

        // Nessun caricamento in background degli annunci dai due ingressi.
        loadDetailAd.addInstructions(0, "return-void")
        loadMainAd.addInstructions(0, "return-void")

        // Non fare un semplice return: E(int) e' la callback applicativa
        // usata dal percorso originale quando non esiste un annuncio da mostrare.
        // p0 = gestore annunci; p2 = argomento originale per il chiamante.
        showInterstitial.addInstructions(
            0,
            """
                iget-object v0, p0, Lc5/a;->d:Lc5/a${'$'}e;
                invoke-interface {v0, p2}, Lc5/a${'$'}e;->E(I)V
                return-void
            """.trimIndent()
        )
    }
}
