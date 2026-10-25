package mightymich.morphe.patches.tiktok

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import java.util.Locale

/**
 * Force TikTok content / store region.
 *
 * TikTok resolves region from:
 *  - TelephonyManager (SIM / network ISO)
 *  - Bytdance RegionManager / StoreRegionSource ("store_region", "priority_region", …)
 *
 * This patch:
 *  1) Spoofs TelephonyManager country ISO getters used by the app
 *  2) Forces StoreRegionSource-style getters that reference "store_region" to return the chosen ISO
 *
 * Option is set at patch time in Morphe (not a live in-app button — that needs an integrations DEX).
 * Values: ISO-3166-1 alpha-2, e.g. US, GB, JP, KR, PL, DE, BR, …
 */
@Suppress("unused")
val forceRegionPatch = bytecodePatch(
    name = "Force region",
    description = "Forces TikTok store/SIM region to a chosen country (ISO code). " +
        "Helps unlock regional feed / features. Set country in patch options.",
    default = true
) {
    compatibleWith(TikTokCompatibility.TIKTOK)

    val countries = Locale.getISOCountries()
        .associate { code ->
            val name = Locale("", code).displayCountry
            name to code
        }

    val region by stringOption(
        name = "Region (ISO country)",
        key = "region",
        default = "US",
        description = "ISO-3166-1 alpha-2 country code to spoof (e.g. US, GB, JP, KR, PL).",
        values = countries
    )

    execute {
        val iso = region?.trim()?.uppercase(Locale.US)
            ?: throw PatchException("Region option is required (e.g. US).")
        if (iso.length != 2 || !iso.all { it in 'A'..'Z' }) {
            throw PatchException("Invalid region \"$iso\". Use 2-letter ISO code.")
        }

        // Encode as const-string return for any ()Ljava/lang/String; we force
        val returnIso = """
            const-string v0, "$iso"
            return-object v0
        """

        var patched = 0

        // --- 1) TelephonyManager-style calls: after invoke getSimCountryIso / getNetworkCountryIso ---
        val tmMethods = setOf(
            "getSimCountryIso",
            "getNetworkCountryIso"
        )

        for (classDef in classes) {
            for (method in classDef.methods) {
                val impl = method.implementation ?: continue
                val insns = impl.instructions.toList()
                for ((index, insn) in insns.withIndex()) {
                    val s = insn.toString()
                    if (!tmMethods.any { s.contains(it) }) continue
                    if (!s.contains("TelephonyManager")) continue
                    // Insert after move-result-object if present
                    try {
                        // Find following move-result-object
                        var insertAt = index + 1
                        if (insertAt < insns.size &&
                            insns[insertAt].toString().contains("move-result-object")
                        ) {
                            val reg = Regex("""v(\d+)""")
                                .find(insns[insertAt].toString())
                                ?.groupValues?.get(1) ?: "0"
                            method.addInstructions(
                                insertAt + 1,
                                """
                                    const-string v$reg, "$iso"
                                """
                            )
                            patched++
                        }
                    } catch (_: Exception) {
                    }
                }
            }
        }

        // --- 2) StoreRegionSource / Region getters that mention store_region ---
        val storeRegionFingerprint = Fingerprint(
            returnType = "Ljava/lang/String;",
            parameters = emptyList(),
            custom = { method, classDef ->
                val type = classDef.type
                if (!type.contains("Region") && !type.contains("region")) {
                    // still allow if method body has the key
                }
                val text = method.implementation?.instructions
                    ?.joinToString("\n") { it.toString() }
                    ?: return@Fingerprint false
                text.contains("store_region") &&
                    (text.contains("const-string") || text.contains("invoke"))
            }
        )

        try {
            storeRegionFingerprint.matchAllOrNull()?.forEach { match ->
                match.method.addInstructions(0, returnIso)
                patched++
            } ?: run {
                storeRegionFingerprint.method.addInstructions(0, returnIso)
                patched++
            }
        } catch (_: Exception) {
            // optional if class renamed heavily
        }

        // --- 3) Also force methods that only return priority_region / current_region keys ---
        for (key in listOf("priority_region", "current_region", "sys_region", "carrier_region")) {
            val fp = Fingerprint(
                returnType = "Ljava/lang/String;",
                parameters = emptyList(),
                custom = { method, _ ->
                    val text = method.implementation?.instructions
                        ?.joinToString("\n") { it.toString() }
                        ?: return@Fingerprint false
                    // Short getter that loads this preference key
                    text.contains("\"$key\"") &&
                        (method.implementation?.instructions?.size ?: 99) < 40
                }
            )
            try {
                fp.matchAllOrNull()?.forEach { match ->
                    match.method.addInstructions(0, returnIso)
                    patched++
                }
            } catch (_: Exception) {
            }
        }

        if (patched == 0) {
            throw PatchException(
                "Force region: no SIM/store_region hooks found. App structure may have changed."
            )
        }
    }
}
