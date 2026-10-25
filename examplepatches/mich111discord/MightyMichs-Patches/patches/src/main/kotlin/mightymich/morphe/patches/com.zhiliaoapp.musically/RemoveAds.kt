package mightymich.morphe.patches.tiktok

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Best-effort ad removal for TikTok / musically.
 * No-ops common commercial / ad load paths in Bytdance ad packages.
 */
@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Disables common TikTok ad / commercial load & show methods (best-effort).",
    default = true
) {
    compatibleWith(TikTokCompatibility.TIKTOK)

    execute {
        val prefixes = listOf(
            "Lcom/ss/android/ugc/aweme/commercialize/",
            "Lcom/ss/android/ugc/aweme/ads/",
            "Lcom/bytedance/sdk/openadsdk/",
            "Lcom/ss/android/ad/",
            "Lcom/ss/android/ugc/aweme/feed/adapter/widget/ad"
        )

        val names = setOf(
            "load", "loadAd", "show", "showAd", "bind", "mount",
            "tryShow", "display", "fetchAd", "requestAd"
        )

        var n = 0
        for (classDef in classes) {
            if (prefixes.none { classDef.type.startsWith(it) }) continue
            for (method in classDef.methods) {
                if (method.implementation == null) continue
                if (method.name !in names && names.none { method.name.startsWith(it) }) continue
                try {
                    when (method.returnType) {
                        "V" -> method.addInstructions(0, "return-void")
                        "Z" -> method.addInstructions(
                            0,
                            """
                                const/4 v0, 0x0
                                return v0
                            """
                        )
                        else -> method.addInstructions(
                            0,
                            """
                                const/4 v0, 0x0
                                return-object v0
                            """
                        )
                    }
                    n++
                } catch (_: Exception) {
                }
            }
        }
        // soft success even if 0 — ads may live in feature modules
    }
}
