package mightymich.morphe.patches.eset

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

/**
 * Best-effort Enable Premium for ESET Mobile Security (com.eset.ems2.gp).
 *
 * RE notes (12.0.17.0):
 * - License model: sealed LicenseUpdate (NoLicence / LicenseLoaded) under obfuscated fs/f*
 * - Status enum: INACTIVE, EXPIRED, SUSPENDED, CANCELED, PRODUCTIVE, FREE_OR_TRIAL, …
 * - UI / analytics data classes carry boolean isPremium / isPremiumLicense
 * - Core engine lives in native libems.so — server + native checks may still apply
 *
 * Strategy:
 * 1) Force ()Z getters whose class/toString references isPremium / isPremiumLicense → true
 * 2) Force TokenLicense-style isPremium accessors → true
 * 3) Soft-patch LicenseUpdate "has license" helpers that return false for NoLicence
 *
 * This can unlock UI premium states and some client gates. Full offline premium
 * (all modules, no server) is NOT guaranteed because of native/server validation.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable premium license",
    description = "Best-effort unlock of ESET premium UI / client-side license flags. " +
        "Native libems + server checks may still limit some features.",
    default = true
) {
    compatibleWith(EsetCompatibility.EMS)

    execute {
        val returnTrue = """
            const/4 v0, 0x1
            return v0
        """
        var patched = 0

        // --- 1) Data-class isPremium / isPremiumLicense boolean getters ---
        // Classes whose toString embeds ", isPremium=" or "isPremiumLicense="
        val premiumStringMarkers = listOf(
            ", isPremium=",
            "isPremiumLicense=",
            "TokenLicense(isPremium="
        )

        for (classDef in classes) {
            val classText = classDef.methods.joinToString("\n") { m ->
                m.implementation?.instructions?.joinToString("\n") { it.toString() } ?: ""
            }
            val looksPremium = premiumStringMarkers.any { classText.contains(it) } ||
                classText.contains("const-string") && classText.contains("isPremium")

            if (!looksPremium) continue

            for (method in classDef.methods) {
                if (method.returnType != "Z") continue
                if (method.parameters.isNotEmpty()) continue
                // Skip equals/hashCode-style
                if (method.name == "equals") continue
                try {
                    method.addInstructions(0, returnTrue)
                    patched++
                } catch (_: Exception) {
                }
            }
        }

        // --- 2) Fingerprint: methods that only return a boolean field named via isPremium strings ---
        val isPremiumGetterFp = Fingerprint(
            returnType = "Z",
            parameters = emptyList(),
            custom = { method, classDef ->
                val body = method.implementation?.instructions
                    ?.joinToString("\n") { it.toString() }
                    ?: return@Fingerprint false
                // Typical Kotlin property: iget-boolean + return
                val short = (method.implementation?.instructions?.size ?: 99) <= 12
                val hasIget = body.contains("iget-boolean")
                val classHasPremiumMarker = classDef.methods.any { m ->
                    val t = m.implementation?.instructions
                        ?.joinToString("\n") { it.toString() } ?: ""
                    t.contains("isPremium")
                }
                short && hasIget && classHasPremiumMarker
            }
        )

        try {
            isPremiumGetterFp.matchAllOrNull()?.forEach { match ->
                try {
                    match.method.addInstructions(0, returnTrue)
                    patched++
                } catch (_: Exception) {
                }
            }
        } catch (_: Exception) {
        }

        // --- 3) Known stable-ish UI TokenLicense accessor (setup flow) ---
        // com.eset.ems.next.feature.setup...g$e$f.a()Z  — TokenLicense(isPremium=)
        val tokenLicenseFp = Fingerprint(
            returnType = "Z",
            parameters = emptyList(),
            custom = { method, classDef ->
                val all = classDef.methods.joinToString("\n") { m ->
                    m.implementation?.instructions?.joinToString("\n") { it.toString() } ?: ""
                }
                all.contains("TokenLicense(isPremium=") &&
                    method.implementation?.instructions
                        ?.joinToString("\n") { it.toString() }
                        ?.contains("iget-boolean") == true
            }
        )

        try {
            tokenLicenseFp.matchAllOrNull()?.forEach { match ->
                match.method.addInstructions(0, returnTrue)
                patched++
            }
        } catch (_: Exception) {
        }

        // --- 4) LicenseUpdate helper: NoLicence → false, try force true ---
        // wx0/a.b(Lfs/f;)Z currently returns false for NoLicence; force true always
        val licenseUpdateBoolFp = Fingerprint(
            returnType = "Z",
            parameters = listOf("Lfs/f;"),
            custom = { method, _ ->
                val body = method.implementation?.instructions
                    ?.joinToString("\n") { it.toString() }
                    ?: return@Fingerprint false
                body.contains("Lfs/f\$c") && body.contains("Lfs/f\$b")
            }
        )

        try {
            licenseUpdateBoolFp.matchAllOrNull()?.forEach { match ->
                match.method.addInstructions(0, returnTrue)
                patched++
            }
        } catch (_: Exception) {
        }

        // Same pattern without relying on obfuscated parameter type name
        val licenseUpdateBoolLooseFp = Fingerprint(
            returnType = "Z",
            parameters = listOf("Lfs/f;"),
            custom = { method, classDef ->
                val body = method.implementation?.instructions
                    ?.joinToString("\n") { it.toString() }
                    ?: return@Fingerprint false
                body.contains("NoLicence") ||
                    (body.contains("instance-of") && body.contains("\$c") && body.contains("\$b"))
            }
        )

        try {
            licenseUpdateBoolLooseFp.matchAllOrNull()?.forEach { match ->
                try {
                    match.method.addInstructions(0, returnTrue)
                    patched++
                } catch (_: Exception) {
                }
            }
        } catch (_: Exception) {
        }

        if (patched == 0) {
            throw PatchException(
                "Enable premium: no isPremium / license hooks found. " +
                    "Obfuscation may have changed; share Morphe log."
            )
        }
    }
}
