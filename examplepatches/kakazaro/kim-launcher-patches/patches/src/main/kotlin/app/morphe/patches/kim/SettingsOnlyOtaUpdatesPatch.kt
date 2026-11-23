package app.morphe.patches.kim

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * The native update routine behind the `byd/update` channel (byd/ke.c in 1.0.2796):
 * `c(int flags, String source, boolean install, boolean automatic)` calls otaAndroidLatestV2, caches the
 * result for the update UI and, when `install` is true and an update exists, downloads
 * kim-launcher-update.apk and opens the installer.
 *
 * Callers: the settings screen's manual "check" (automatic=false), the automatic "check" and the
 * background refresh (automatic=true), and "install" (install=true).
 *
 *  - automatic: return `{updateAvailable: false}` at once, no request and nothing cached, so no popup.
 *  - manual: still checks and caches, so the settings screen shows the new version.
 *  - install is always forced to false: nothing is downloaded or installed (the upstream update is
 *    signed differently and cannot install over a patched build).
 */
private object OtaUpdateFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/util/LinkedHashMap;",
    parameters = listOf("I", "Ljava/lang/String;", "Z", "Z"),
    strings = listOf(
        "https://asia-southeast1-byd-car-tracker.cloudfunctions.net/otaAndroidLatestV2?vehicleId=",
        "kim-launcher-update.apk",
        "Downloaded APK checksum does not match.",
    ),
)

@Suppress("unused")
val settingsOnlyOtaUpdatesPatch = bytecodePatch(
    name = "Settings-only in-app updates",
    description = "Shows a newer upstream version only in the settings screen: no automatic " +
        "update check or popup on the main screen, and updates are never downloaded or installed " +
        "(the upstream update is signed differently and cannot install over a patched build).",
    default = true,
) {
    compatibleWith(compatibility)

    execute {
        OtaUpdateFingerprint.method.addInstructions(
            0,
            """
                const/16 p2, 0x0
                if-eqz p3, :manual
                new-instance v0, Ljava/util/LinkedHashMap;
                invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V
                const-string v1, "updateAvailable"
                sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                return-object v0
                :manual
                nop
            """,
        )
    }
}
