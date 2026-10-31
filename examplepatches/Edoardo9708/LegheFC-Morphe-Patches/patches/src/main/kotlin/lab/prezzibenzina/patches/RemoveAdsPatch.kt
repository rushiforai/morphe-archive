package lab.prezzibenzina.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

/**
 * Prezzi Benzina 3.26.10.10 (versionCode 312610100), base.apk / classes6.dex.
 *
 * Test A1: fa restituire false soltanto ai metodi che decidono se mostrare
 * banner e annunci interstitial. Non modifica RevenueCat, SharedPreferences,
 * entitlement Premium, storico prezzi, licenze o configurazioni d'acquisto.
 *
 * Il codice originale dei due metodi rimane presente ma non viene eseguito.
 * Logcat: PB-RemoveAds / PB-20261030-A1.
 *
 * Selezionare questa patch SENZA la precedente diagnostica D1: entrambe
 * modificano gli stessi metodi e la diagnostica e' deliberatamente rigorosa
 * sulla loro forma originale.
 */
@Suppress("unused")
val prezziBenzinaRemoveAdsPatch = bytecodePatch(
    name = "Prezzi Benzina - Remove ads A1",
    description = "Test: disables banner and interstitial ads without changing Premium, licenses or in-app purchases.",
    default = false
) {
    compatibleWith(
        Compatibility(
            name = "Prezzi Benzina",
            packageName = "org.vernazza.androidfuel",
            targets = listOf(AppTarget(version = "3.26.10.10"))
        )
    )

    execute {
        val target = "Lit/prezzibenzina/pb3/general/MySettings;"

        data class AdsMethod(
            val name: String,
            val expectedReturns: Int,
            val calledMethod: String,
            val logger: String
        )

        val specs = listOf(
            AdsMethod(
                name = "showBannerAds",
                expectedReturns = 1,
                calledMethod = "showInterstitialAds",
                logger = "morpheLogForcedBannerAds"
            ),
            AdsMethod(
                name = "showInterstitialAds",
                expectedReturns = 2,
                calledMethod = "actualAdsLevel",
                logger = "morpheLogForcedInterstitialAds"
            )
        )

        // 1) Controllare ENTRAMBI i metodi originali prima di alterarne uno.
        // Nel DEX 3.26.10.10 sono metodi d'istanza con un Context, ritorno Z,
        // tre registri complessivi (v0 locale; p0 e p1 sono parametri).
        val methods: List<Pair<AdsMethod, MutableMethod>> = specs.map { spec ->
            val method = Fingerprint(
                definingClass = target,
                name = spec.name,
                returnType = "Z",
                parameters = listOf("Landroid/content/Context;")
            ).method
            val body = method.implementation
                ?: error("Prezzi Benzina: " + spec.name + " senza bytecode")
            val original = body.instructions.toList()

            val calls = original.mapNotNull {
                (it as? ReferenceInstruction)?.reference as? MethodReference
            }
            val targetCalls = calls.count {
                it.definingClass == target &&
                    it.name == spec.calledMethod
            }
            require(
                body.registerCount == 3 &&
                    original.count { it.opcode == Opcode.RETURN } == spec.expectedReturns &&
                    targetCalls == 1
            ) {
                "Prezzi Benzina: " + spec.name +
                    " non corrisponde al DEX originale della versione 3.26.10.10"
            }
            spec to method
        }

        val mutableClass = mutableClassDefBy(target)
        require(specs.none { spec ->
            mutableClass.methods.any { it.name == spec.logger }
        }) {
            "Prezzi Benzina: helper diagnostico Remove Ads gia' presente"
        }

        // 2) Gli helper hanno REGISTRI PROPRI: non toccano i parametri originali.
        // Il marcatore e' diverso per banner/interstitial, cosi' il Logcat
        // mostra esattamente quale controllo viene consultato.
        for (spec in specs) {
            val message = "PB-20261030-A1 " + spec.name + " FORCED RETURN = false"
            mutableClass.methods.add(
                ImmutableMethod(
                    target,
                    spec.logger,
                    emptyList(),
                    "V",
                    AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                    null,
                    null,
                    MutableMethodImplementation(2)
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                            const-string v0, "PB-RemoveAds"
                            const-string v1, "$message"
                            invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
                            return-void
                        """.trimIndent()
                    )
                }
            )
        }

        // 3) Forzare false in ingresso, stampando prima il marcatore.
        // v0 e' un registro locale in entrambi i metodi, quindi non
        // sovrascriviamo p0 (MySettings) o p1 (Context).
        // I metodi Billing, Premium e price history non vengono toccati.
        for ((spec, method) in methods) {
            method.addInstructions(
                0,
                """
                    invoke-static {}, $target->${spec.logger}()V
                    const/4 v0, 0x0
                    return v0
                """.trimIndent()
            )
        }
    }
}
