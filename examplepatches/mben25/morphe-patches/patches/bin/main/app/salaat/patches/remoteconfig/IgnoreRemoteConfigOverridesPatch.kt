package app.salaat.patches.remoteconfig

import app.salaat.patches.integrity.neutralizeSignatureCheckPatch
import app.salaat.patches.shared.Constants.COMPATIBILITY_SALAAT
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * `MobileRemoteConfigProvider.getDelegate()` is the single funnel every remote read goes
 * through: `getBoolean`/`getString`/`getLong`/`getDouble` and `execute` all call it. It reads
 * the `"use_flagsmith"` boolean and, when true, returns the Flagsmith-backed provider;
 * otherwise it returns the Firebase provider (which falls back to the app's bundled defaults).
 *
 * Forcing it to always return the Firebase provider severs the Flagsmith remote-override
 * channel without breaking config reads, so server-side flags like `enable_opensignal`,
 * `enable_cellrebel`, `show_interstitials_when_stopping_adhan` and `older_usable_version`
 * cannot be flipped on remotely against a patched build.
 */
private object GetDelegateFingerprint : Fingerprint(
    definingClass = "Lorg/hicham/salaat/remoteconfig/MobileRemoteConfigProvider;",
    name = "getDelegate",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lorg/hicham/salaat/data/IRemoteConfigProvider;",
    parameters = emptyList(),
    strings = listOf("use_flagsmith"),
)

@Suppress("unused")
val ignoreRemoteConfigOverridesPatch = bytecodePatch(
    name = "Ignore Remote-Config Overrides",
    description = "Severs the Flagsmith remote-override channel by forcing the remote-config " +
        "delegate to always resolve to the Firebase provider (which uses the app's bundled " +
        "defaults). Server-side flags can no longer be flipped on against a patched build. " +
        "Config reads keep working normally.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SALAAT)

    dependsOn(neutralizeSignatureCheckPatch)

    execute {
        // Return the firebaseRemoteConfigProvider field immediately, skipping the use_flagsmith
        // branch. The field type is FirebaseRemoteConfigProvider, which implements the declared
        // IRemoteConfigProvider return type, so the early return is type-safe.
        GetDelegateFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lorg/hicham/salaat/remoteconfig/MobileRemoteConfigProvider;->firebaseRemoteConfigProvider:Lorg/hicham/salaat/remoteconfig/FirebaseRemoteConfigProvider;
                return-object v0
            """,
        )
    }
}
