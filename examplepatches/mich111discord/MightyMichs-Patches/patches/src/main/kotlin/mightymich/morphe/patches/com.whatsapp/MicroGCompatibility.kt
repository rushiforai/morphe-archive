package mightymich.morphe.patches.com.whatsapp

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Soft MicroG / non-GMS friendliness for WhatsApp.
 *
 * Forces common Google Play Services availability checks to report SUCCESS (0)
 * so WhatsApp is less likely to refuse push registration or backup UI when
 * microG is installed instead of proprietary GMS.
 *
 * Limits:
 *  - Does not install or configure microG; that stays a system concern.
 *  - Signature spoofing / privileged microG still required on most ROMs for
 *    reliable FCM.
 *  - Drive backup may still fail without a working account + Drive stack;
 *    prefer local Databases backup on degoogled devices.
 */
@Suppress("unused")
val microGCompatibilityPatch = bytecodePatch(
    name = "MicroG compatibility",
    description = "Treats Google Play Services checks as successful so WhatsApp " +
        "works better with microG. Does not replace microG itself.",
    default = true,
) {
    compatibleWith(WhatsAppCompatibility.WHATSAPP)

    execute {
        val returnSuccess = """
            const/4 v0, 0x0
            return v0
        """
        val returnTrue = """
            const/4 v0, 0x1
            return v0
        """
        val returnFalse = """
            const/4 v0, 0x0
            return v0
        """

        var hits = 0
        val seen = mutableSetOf<String>()

        val anchors = listOf(
            "GoogleApiAvailability",
            "isGooglePlayServicesAvailable",
            "GooglePlayServicesUtil",
            "play services",
            "Play Services",
            "com.google.android.gms",
        )

        for (anchor in anchors) {
            val defs = try {
                classDefByStrings(anchor)
            } catch (_: Exception) {
                emptyList()
            }
            for (def in defs) {
                if (!seen.add(def.type)) continue
                if (AccessFlags.INTERFACE.isSet(def.accessFlags)) continue
                val t = def.type
                if (t.startsWith("Landroid") || t.startsWith("Ljava") || t.startsWith("Lkotlin")) {
                    continue
                }
                val clazz = try {
                    mutableClassDefBy(def)
                } catch (_: Exception) {
                    continue
                }
                for (method in clazz.methods) {
                    if (AccessFlags.ABSTRACT.isSet(method.accessFlags)) continue
                    if (AccessFlags.NATIVE.isSet(method.accessFlags)) continue
                    if (method.parameterTypes.size > 2) continue
                    val n = method.name
                    val nl = n.lowercase()
                    try {
                        when {
                            (n == "isGooglePlayServicesAvailable" ||
                                nl.contains("playservicesavailable")) &&
                                method.returnType == "I" -> {
                                method.addInstructions(0, returnSuccess)
                                hits++
                            }
                            n == "isUserResolvableError" && method.returnType == "Z" -> {
                                method.addInstructions(0, returnFalse)
                                hits++
                            }
                            method.returnType == "Z" &&
                                (nl.contains("playservicesavailable") ||
                                    nl == "isgmsavailable" ||
                                    nl.contains("hasplayservices") ||
                                    nl.contains("play_services_available")) -> {
                                method.addInstructions(0, returnTrue)
                                hits++
                            }
                            method.returnType == "Z" &&
                                (nl == "isplayservicespossiblyupdating" ||
                                    nl == "isplaystorepossiblyupdating") -> {
                                method.addInstructions(0, returnFalse)
                                hits++
                            }
                        }
                    } catch (_: Exception) {
                    }
                }
            }
        }
        // Soft success — zero hits still installs (GMS client may be stripped).
    }
}
