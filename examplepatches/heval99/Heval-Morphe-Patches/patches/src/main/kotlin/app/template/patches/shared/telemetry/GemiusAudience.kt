package app.template.patches.shared.telemetry

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.util.returnEarly

// Gemius audience measurement (the "gemius" / AdOcean SDK). The three event classes keep their
// names, and each overrides sendEvent(), so all three must be no-opped.
private val GEMIUS_AUDIENCE_EVENTS = listOf(
    "Lcom/gemius/sdk/audience/BaseEvent;",
    "Lcom/gemius/sdk/audience/NetpanelEvent;",
    "Lcom/gemius/sdk/audience/AudienceEvent;",
)

/**
 * Makes every Gemius audience event a no-op. The buffers, consent/config objects and the AdOcean ad
 * classes are untouched; only the three sendEvent() implementations are neutered.
 */
internal fun BytecodePatchContext.disableGemiusAudience() {
    for (type in GEMIUS_AUDIENCE_EVENTS) {
        val method = mutableClassDefBy(type).methods.singleOrNull {
            it.name == "sendEvent" && it.returnType == "V" &&
                it.parameterTypes.isEmpty() && it.implementation != null
        } ?: throw PatchException("$type.sendEvent() not found")
        method.returnEarly()
    }
}
