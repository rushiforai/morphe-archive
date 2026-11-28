package mightymich.morphe.patches.com.whatsapp

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import java.util.logging.Logger

private const val FALCO_LOGGER =
    "Lcom/whatsapp/infra/analytics/WAFalcoLoggerImpl;"

/**
 * Disables WhatsApp's Falco analytics logger.
 *
 * `WAFalcoLoggerImpl.logFalcoEvent` is the central entry point used by the app's
 * analytics/Falco event pipeline. `triggerUpload` flushes queued Falco events and
 * `bumpHealthCounter` emits Falco health counters.
 *
 * This intentionally does not touch crash reporting, WAM registration/performance
 * telemetry, or the registration WAMSYS path. Those are separate systems and
 * disabling them can affect account setup or diagnostics.
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Usage data",
    description = "Disables Falco analytics event logging and uploads. Leaves crash " +
        "reporting and core WAM/registration telemetry alone.",
    default = true,
) {
    compatibleWith(WhatsAppCompatibility.WHATSAPP)

    execute {
        val logger = Logger.getLogger("DisableTelemetry")
        val clazz = classDefByOrNull(FALCO_LOGGER)

        if (clazz == null) {
            // Keep soft success for older builds where the class may be absent.
            logger.warning("Usage data: $FALCO_LOGGER not found; patch is a no-op.")
            return@execute
        }

        var hits = 0
        val mutable = mutableClassDefBy(clazz)

        for (method in mutable.methods) {
            if (method.name == "<init>" || method.name == "<clinit>") continue
            if (method.returnType != "V") continue
            if (method.name != "logFalcoEvent" &&
                method.name != "triggerUpload" &&
                method.name != "bumpHealthCounter"
            ) {
                continue
            }
            try {
                method.addInstructions(0, "return-void")
                hits++
            } catch (_: Exception) {
                // Ignore individual method failures; keep the session alive.
            }
        }

        if (hits == 0) {
            throw PatchException("Usage data: $FALCO_LOGGER did not contain any Falco send methods.")
        }

        logger.info("Usage data: disabled $hits Falco analytics method(s).")
    }
}
