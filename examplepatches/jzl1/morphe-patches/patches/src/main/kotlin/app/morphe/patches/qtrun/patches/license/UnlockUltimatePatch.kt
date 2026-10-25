package lab.qtrun.patches.license

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import lab.qtrun.patches.config.bundleQtrunConfigPatch
import lab.qtrun.patches.shared.COMPATIBILITY_QUICKTEST

/**
 * Original QTRUN signer public-key SHA-256, Base64:
 * `SHA256(APK signing certificate public key)` = d78580e8...d368bd.
 *
 * Morphe re-signs the patched APK with its own key, so the native `Application`
 * constructor would otherwise report Morphe's key in the identity JSON. Feeding the
 * original digest keeps `application.public` identical to the official build.
 */
private const val ORIGINAL_SIGNER_DIGEST_B64 = "14WA6DW+ZnxG+z/vFrdj028p6IdBiDXfFDW/WXHTaL0="

/**
 * Unlocks the Ultimate tier and makes the build start without a live /cgi/report.
 *
 * 1. `Application.d()Z` — force the single Ultimate entitlement gate to true.
 * 2. `Application.<init>` — replace the runtime signer digest with the original QTRUN
 *    digest before the native `construct(...)` call.
 * 3. `c6.j0.e(Object)` — load the bundled `assets/configuration.xml` instead of the
 *    missing cached file, so `Application.m2507g()` becomes true even when the server
 *    returns 404.
 */
@Suppress("unused")
val unlockUltimatePatch = bytecodePatch(
    name = "Unlock Ultimate",
    description = "Unlocks all Ultimate features and makes the app usable on a clean " +
            "install by bundling a signed config and bypassing the native config-integrity gate.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_QUICKTEST)
    dependsOn(bundleQtrunConfigPatch)

    execute {
        // 1. Ultimate gate: return true unconditionally.
        UltimateGateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )

        // 2. Feed the original signer digest to native construct(...).
        val constructor = ApplicationConstructorFingerprint.method
        val constructIndex = constructor.indexOfMethodCall(
            definingClass = "Lcom/qtrun/sys/Application;",
            name = "construct",
        )
        if (constructIndex < 0) {
            throw PatchException("Could not find Application.construct(...) call in the constructor.")
        }
        constructor.addInstructions(
            constructIndex,
            """
                const-string v2, "$ORIGINAL_SIGNER_DIGEST_B64"
                const/4 v1, 0x0
                invoke-static {v2, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B
                move-result-object v2
            """.trimIndent(),
        )

        // 3. Load the bundled config asset instead of c6.h1.d()'s file read.
        val loader = ConfigLoaderFingerprint.method
        val configReadIndex = loader.indexOfMethodCall(
            definingClass = "Lc6/h1;",
            name = "d",
        )
        if (configReadIndex < 0) {
            throw PatchException("Could not find the c6.h1.d() config read in the launcher callback.")
        }
        loader.removeInstructions(configReadIndex, 3)
        loader.addInstructions(
            configReadIndex,
            """
                iget-object v0, p0, Lc6/j0;->b:Lcom/qtrun/nsg/LauncherActivity;
                invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;
                move-result-object v0
                const-string v1, "configuration.xml"
                invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
                move-result-object v0
                invoke-static {v0}, Lu5/c;->d(Ljava/io/InputStream;)Ljava/lang/String;
                move-result-object v0
                invoke-static {v0}, Lcom/qtrun/sys/Application;->j(Ljava/lang/String;)V
            """.trimIndent(),
        )
    }
}

/**
 * Index of the first instruction that invokes [definingClass]->[name], or -1.
 */
private fun app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.indexOfMethodCall(
    definingClass: String,
    name: String,
): Int {
    val instructions = implementation?.instructions ?: return -1
    instructions.forEachIndexed { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (reference != null &&
            reference.definingClass == definingClass &&
            reference.name == name
        ) {
            return index
        }
    }
    return -1
}
