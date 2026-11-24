package app.fluffy.patches.galaxymaxhz.license

import app.fluffy.patches.scene.generateRandomString
import app.fluffy.patches.shared.Constants.COMPATIBILITY_GALAXYMAXHZ
import app.fluffy.patches.waypoint.clearBody
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val randomiseDeviceIdPatch = bytecodePatch(
    name = "Random device ID",
    description = "Replaces the fixed salt in the native device fingerprint with a random " +
        "salt baked in when the patch is applied, so each patched APK reports its own " +
        "stable device id to the licensing server. Re-patch for a new id. The local " +
        "license check does not use the salt and keeps working.",
) {
    compatibleWith(COMPATIBILITY_GALAXYMAXHZ)

    execute {
        // Same shape as the stock salt "TR2IWE3S7uNtKeHz4A7GNA==": a 24-char
        // Base64 string, so the spoofed value does not stand out by format.
        val salt = generateRandomString(22, ('A'..'Z') + ('a'..'z') + ('0'..'9') + listOf('+', '/')) + "=="

        // t0.c1.hh() feeds libgmh-lib.so a reflection spec plus the digest salt:
        // [key, class, method, signature, salt]. The native side digests
        // android_id + salt (+ the APK signature) into the device id. Only the
        // salt is replaced; the reflection spec stays stock so the lookup and
        // the local verdicts are unaffected.
        mutableClassDefBy("Lt0/c1;")
            .methods.first { it.name == "hh" && it.returnType == "Ljava/util/List;" }
            .apply {
                clearBody()
                addInstructions(
                    0,
                    """
                        const/4 v0, 0x5
                        new-array v0, v0, [Ljava/lang/String;
                        const/4 v3, 0x0
                        const-string v1, "android_id"
                        aput-object v1, v0, v3
                        const/4 v3, 0x1
                        const-string v1, "android/provider/Settings${'$'}Secure"
                        aput-object v1, v0, v3
                        const/4 v3, 0x2
                        const-string v1, "getString"
                        aput-object v1, v0, v3
                        const/4 v3, 0x3
                        const-string v1, "(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;"
                        aput-object v1, v0, v3
                        const-string v2, "${salt}"
                        const/4 v3, 0x4
                        aput-object v2, v0, v3
                        invoke-static {v0}, La/b;->D([Ljava/lang/Object;)Ljava/util/List;
                        move-result-object v0
                        return-object v0
                    """,
                )
            }
    }
}
