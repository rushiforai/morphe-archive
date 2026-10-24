package io.github.forsigh.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * New alert icons (opt-in, default off).
 *
 * `CONFIG_VALUE_ALERTS_NEW_ALERT_ICONS_ENABLED` (config id 0x2d1, category ALERTS) has **no Java
 * reader** on 5.26.0.0 - the only Java references are the declaration in `ConfigValues` and the
 * id->key table in `config/cw`, which nothing but the debug screen and `car_lib` touch. The map
 * engine reads the flag natively by id, so the usual read-path override cannot reach it.
 *
 * The way in is the write path: `ConfigManager.setConfigValueBoolNTV(IZ)V` is a public native
 * setter that takes the numeric id. This row calls it once per config sync, at the tail of
 * `ConfigManagerBase.onConfigSyncedFromServerJNI()V` - after the server payload has landed, so the
 * forced value is the one the engine keeps. The `check-cast` turns the callback's receiver into the
 * ConfigManager the native setter lives on; the tail position means the original body has already
 * finished with p0.
 *
 * Sight-unseen by design: whether Waze still ships the newer icon set behind this flag cannot be
 * checked on an offline emulator. The row is Experimental until a phone says otherwise.
 */
private val ConfigSyncedFingerprint = Fingerprint(
    name = "onConfigSyncedFromServerJNI",
    returnType = "V",
    parameters = emptyList(),
)

@Suppress("unused")
val newAlertIconsPatch = bytecodePatch(
    name = "New alert icons",
    description = "Uses Waze's newer alert icons.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Experimental")

    execute {
        val method = ConfigSyncedFingerprint.method
        val implementation = method.implementation
            ?: throw PatchException(
                "newAlertIconsPatch: ${method.definingClass}->${method.name} has no implementation - " +
                    "refusing to report a switch flip that never happens",
            )

        val tail = implementation.instructions.count() - 1
        val last = implementation.instructions.elementAt(tail)
        if (last.opcode != com.android.tools.smali.dexlib2.Opcode.RETURN_VOID) {
            throw PatchException(
                "newAlertIconsPatch: the sync callback no longer ends in return-void (${last.opcode}) - " +
                    "Waze moved it; refusing to inject at an unknown position",
            )
        }

        method.addInstructions(
            tail,
            """
                check-cast p0, Lcom/waze/ConfigManager;
                sget-object v0, Lcom/waze/config/ConfigValues;->CONFIG_VALUE_ALERTS_NEW_ALERT_ICONS_ENABLED:Lcom/waze/config/b;
                invoke-virtual {v0}, Lcom/waze/config/f;->e()I
                move-result v0
                const/4 v1, 0x1
                invoke-virtual {p0, v0, v1}, Lcom/waze/ConfigManager;->setConfigValueBoolNTV(IZ)V
            """.trimIndent(),
        )

        println(
            "newAlertIconsPatch: CONFIG_VALUE_ALERTS_NEW_ALERT_ICONS_ENABLED written to the native " +
                "store on every sync (id resolved at runtime, not baked in)",
        )
    }
}
