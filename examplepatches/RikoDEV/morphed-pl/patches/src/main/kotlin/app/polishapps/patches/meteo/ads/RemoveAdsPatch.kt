package app.polishapps.patches.meteo.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.polishapps.patches.inpost.shared.methodsOf
import app.polishapps.patches.inpost.shared.parameterTypeNames
import app.polishapps.patches.inpost.shared.singleMethod
import app.polishapps.patches.inpost.shared.strings
import app.polishapps.patches.shared.Constants.COMPATIBILITY_METEO_ICM
import app.polishapps.patches.shared.prependReturn

private val AD_PROVIDERS = listOf(
    "Lpl/wp/ads/render/GAMInitializer;",
    "Lpl/wp/ads/analytics/AnalyticsInitializer;",
)

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes the banner ads (WP ads / Google Ad Manager) and the interstitial ads, and stops the " +
        "ad SDK from starting at launch.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_METEO_ICM)

    execute {
        AD_PROVIDERS.forEach { type ->
            val onCreate: MutableMethod = methodsOf(classDefBy(type)) { method ->
                method.name == "onCreate" && method.returnType == "Z" && method.parameterTypeNames().isEmpty()
            }.singleOrNull() ?: throw PatchException("$type->onCreate()Z not found")
            onCreate.prependReturn(
                """
                    const/4 v0, 0x1
                    return v0
                """,
            )
        }

        singleMethod("banner loader") { _, method ->
            method.returnType == "V" &&
                method.parameterTypes.isEmpty() &&
                method.strings().let { "WPAdsBannerView" in it && "Failed to load banner ad" in it }
        }.prependReturn("return-void")

        singleMethod("interstitial loader") { _, method ->
            method.returnType == "V" &&
                method.parameterTypeNames() == listOf("Ljava/lang/String;") &&
                "Failed to load interstitial ad" in method.strings()
        }.prependReturn("return-void")

        // The MethodChannel handler for "pl.wp.ads/interstitial" returns Boolean.FALSE for
        // "show" when no ad is loaded (because we stubbed the loader above). Dart treats FALSE
        // as "ad not available" and blocks navigation to screens like meteogram profiles and
        // start screen settings. There is no EventChannel — no dismiss callback to Dart — so
        // the return value from "show" is the only signal. We inject code at the top of the
        // handler to return TRUE for "show" when the instance is for interstitial (the handler
        // class uses a byte discriminator: 0 = banner, 1 = interstitial).
        val showHandler = singleMethod("interstitial show handler") { _, method ->
            method.returnType == "V" &&
                method.parameterTypes.size == 2 &&
                method.strings().let { s -> "NO_TAG_ID" in s && "tagId is required" in s }
        }
        val shClass = showHandler.definingClass
        val mcType = showHandler.parameterTypes[0].toString()
        val rtType = showHandler.parameterTypes[1].toString()
        showHandler.addInstructions(
            0,
            """
                iget-byte v0, p0, $shClass->a:B
                const/4 v1, 0x1
                if-ne v0, v1, :original
                iget-object v0, p1, $mcType->b:Ljava/lang/Object;
                check-cast v0, Ljava/lang/String;
                const-string v1, "show"
                invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v1
                if-eqz v1, :original
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                invoke-virtual {p2, v0}, $rtType->c(Ljava/lang/Object;)V
                return-void
                :original
                nop
            """,
        )
    }
}
