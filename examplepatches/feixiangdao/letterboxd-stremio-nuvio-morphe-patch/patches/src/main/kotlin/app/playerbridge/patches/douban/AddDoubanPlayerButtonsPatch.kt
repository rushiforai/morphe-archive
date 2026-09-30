package app.playerbridge.patches.douban

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.playerbridge.patches.shared.Constants.COMPATIBILITY_DOUBAN
import com.android.tools.smali.dexlib2.Opcode

private const val BOOTSTRAP_CLASS =
    "Lapp/playerbridge/douban/DoubanBootstrapExtension;"

/**
 * Safer runtime bridge for the NIS-protected Douban APK.
 *
 * Instead of touching InstrumentationProxy.callActivityOnCreate(), this patch
 * waits until the wrapper Application.onCreate() is about to return and only
 * then registers an ActivityLifecycleCallbacks listener. The heavier runtime
 * code is not loaded until MovieActivity2 is already resumed.
 */
@Suppress("unused")
val addDoubanPlayerButtonsPatch = bytecodePatch(
    name = "Add Stremio + Nuvio buttons (Douban)",
    description = "Adds independent Stremio and Nuvio buttons to Douban 7.135.0 " +
        "using a delayed Application lifecycle hook.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_DOUBAN)

    extendWith("extensions/douban.mpe")

    execute {
        val method = DoubanApplicationOnCreateFingerprint.method
        val instructions = method.implementation?.instructions
            ?: throw IllegalStateException("Douban wrapper onCreate has no implementation")

        val returnIndices = instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_VOID }
            .map { it.index }
            .reversed()

        if (returnIndices.isEmpty()) {
            throw IllegalStateException("No return-void found in Douban wrapper onCreate")
        }

        returnIndices.forEach { index ->
            method.addInstructions(
                index,
                "invoke-static { p0 }, " +
                    "$BOOTSTRAP_CLASS->install(Landroid/app/Application;)V",
            )
        }
    }
}

/**
 * Diagnostic patch: intentionally changes no bytecode and injects no extension.
 * Applying only this patch tests whether Morphe's rebuild/re-sign operation
 * itself is accepted by this Douban/NIS build.
 */
@Suppress("unused")
val doubanRepackagingProbePatch = bytecodePatch(
    name = "Diagnostic: Douban repackaging only",
    description = "Makes no functional changes. Use only to test whether this " +
        "Douban build accepts a Morphe-rebuilt/re-signed APK.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DOUBAN)

    execute {
        // Intentionally empty.
    }
}
