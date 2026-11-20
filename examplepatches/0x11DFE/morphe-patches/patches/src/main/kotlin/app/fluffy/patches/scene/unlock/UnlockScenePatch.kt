package app.fluffy.patches.scene.unlock

import app.fluffy.patches.scene.ActivationRequestFingerprint
import app.fluffy.patches.scene.LicenseStateParserFingerprint
import app.fluffy.patches.scene.fragmentedStringSmali
import app.fluffy.patches.scene.SignatureMd5Fingerprint
import app.fluffy.patches.shared.Constants.COMPATIBILITY_SCENE
import app.fluffy.patches.waypoint.clearBody
import app.fluffy.patches.waypoint.ensureRegisters
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import java.time.LocalDate
import java.time.ZoneOffset
import kotlin.random.Random

@Suppress("unused")
val unlockSceneProPatch = bytecodePatch(
    name = "Unlock Scene N1",
    description = "Unlocks Scene N1 with a perpetual license and a configurable expiry date. " +
        "The signature MD5 reported to omarea is spoofed to the original signing key, so " +
        "re-signed builds still pass the activation binding.",) {
    compatibleWith(COMPATIBILITY_SCENE)

    val expiryDate by stringOption(
        key = "expiry-date",
        default = "2077-01-01",
        values = mapOf(
            "2077-01-01" to "2077 (default)",
            "3089-12-31" to "Far future",
            "2100-01-01" to "Year 2100",
            "2030-01-01" to "Year 2030",
        ),
        title = "License expiry date",
        description = "Date the spoofed Scene N1 license expires, as yyyy-MM-dd. " +
            "The app shows it on the user page; anything in the future keeps Pro active.",
        required = true,
        validator = { it != null && runCatching { LocalDate.parse(it) }.isSuccess },
    )

    execute {
        // Random time-of-day within the chosen date so two patched builds never
        // share the same baked constant; the app formats the date only.
        val millis = try {
            val day = LocalDate.parse(expiryDate).atStartOfDay(ZoneOffset.UTC)
            (day.toInstant().toEpochMilli() + Random.nextLong(0, 86_400_000)).toString()
        } catch (e: Exception) {
            throw PatchException("Invalid expiry-date '$expiryDate' (expected yyyy-MM-dd): ${e.message}")
        }

        // The license state parser (located by fingerprint) reads the stored
        // state via its first three instructions (this.b.toString()); swapping
        // them for a constant makes every caller see activated=true with the
        // configured expiry.
        LicenseStateParserFingerprint.method.apply {
            removeInstructions(0, 3)
            addInstructions(0, fragmentedStringSmali("success@$millis", "v0", "v1"))
        }

        // ActivationCodeResponse.getType() decides which license type gets stored
        // by the activation flow ("perpetual" / "trial" / "account" / ...). The
        // class is not obfuscated and has kept its name in every build so far.
        mutableClassDefBy("Lcom/omarea/model/ActivationCodeResponse;").methods.first {
            it.name == "getType" && it.parameterTypes.isEmpty() &&
                it.returnType == "Ljava/lang/String;"
        }.apply {
            clearBody()
            ensureRegisters(2)
            addInstructions(0, "const-string v0, \"perpetual\"\nreturn-object v0")
        }

        // The activation-request helper (app -> daemon -> server). Left alone it
        // can answer "expired"/"not-you" after an identity change and pop the
        // trial-expired dialog; stubbed here it answers success locally and the
        // daemon is never asked to activate.
        ActivationRequestFingerprint.method.apply {
            clearBody()
            ensureRegisters(4)
            addInstructions(0, fragmentedStringSmali("success@$millis", "v0", "v1") + "\nreturn-object v0")
        }

        // Signature MD5 of the APK cert (activation binding), located by
        // fingerprint since its class gets renamed by R8 on every build.
        SignatureMd5Fingerprint.method.apply {
            clearBody()
            ensureRegisters(4)
            addInstructions(
                0,
                fragmentedStringSmali("34ea0e93b18c7df94decd663857bb3bf", "v0", "v1") +
                    "\nreturn-object v0",
            )
        }
    }
}
