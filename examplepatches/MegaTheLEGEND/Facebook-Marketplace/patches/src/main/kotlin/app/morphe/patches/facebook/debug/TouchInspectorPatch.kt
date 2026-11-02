package app.morphe.patches.facebook.debug

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

/**
 * Standalone hook: `onCreate()V` of the class that directly extends android.app.Application.
 * Independent of the Marketplace patch (no shared hook point, no tab bar involvement).
 */
private fun appFingerprint(match: (String, String?) -> Boolean) = Fingerprint(
    returnType = "V",
    parameters = listOf(),
    custom = { method, classDef -> method.name == "onCreate" && match(classDef.type, classDef.superclass) }
)

// Tried in order; the first that matches is hooked. All are "app starts" points, independent of any
// other patch's hook, so this can be combined with every patch.
private val hookCandidates = listOf(
    appFingerprint { _, sup -> sup == "Landroid/app/Application;" },
    appFingerprint { _, sup -> sup != null && sup.endsWith("Application;") },
    appFingerprint { type, _ -> type.endsWith("Application;") },
)

/**
 * DEBUG ONLY. Adds the touch inspector to the APK; never ship it, and safe to combine with any other patch.
 * Drive it with `python3 tools/inspect.py`.
 */
@Suppress("unused")
val touchInspectorPatch = bytecodePatch(
    name = "Debug touch inspector",
    description = "Debug build helper: logs the view chain, ids and click-listener classes under every " +
        "touch (logcat tag Inspect), toggled via adb broadcast. Do not ship.",
    default = false
) {
    extendWith("extensions/facebook.mpe")

    execute {
        val method = hookCandidates.firstNotNullOfOrNull { runCatching { it.method }.getOrNull() }
            ?: throw IllegalStateException("No Application.onCreate found; send the app's Application class name")
        method.apply {
            implementation!!.instructions
                .withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
                .reversed()
                .forEach { index ->
                    addInstructions(
                        index,
                        "invoke-static {}, Lapp/morphe/extension/facebook/debug/TouchInspector;->install()V"
                    )
                }
        }
    }
}
