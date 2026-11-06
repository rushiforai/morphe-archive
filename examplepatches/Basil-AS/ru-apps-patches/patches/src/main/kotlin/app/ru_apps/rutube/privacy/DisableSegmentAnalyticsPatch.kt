package app.ru_apps.rutube.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.privacy.patches.analytics.jl4ctuk.disableAnalyticsDependency
import app.ru_apps.rutube.shared.Constants.COMPATIBILITY_RUTUBE
import java.util.logging.Logger

/**
 * RuTube bundles Segment's Kotlin analytics SDK (`com.segment.analytics.kotlin:android`,
 * confirmed live via `dexdump` class-descriptor scan of ru.rutube.app 31.17.2-rustore — the
 * package is present with its full, unobfuscated class/method surface, not a stripped unused
 * transitive dependency) outside the 31-SDK checklist this repo's patches already cover.
 *
 * Every public recording entry point on the SDK's facade (`track`, `identify`, `screen`,
 * `group`, `alias`, each with several Kotlin-default-arg overloads) funnels through a single
 * internal choke point before anything is queued or uploaded: `Analytics.process(BaseEvent,
 * Continuation)` (confirmed live: it is the only non-synthetic caller of the event pipeline
 * inside Analytics.smali, and the class's own `enabled` flag already gates it — this patch
 * forces that gate shut unconditionally instead of relying on app code to set it). Disabling
 * that one method, rather than every current and future overload of the public API, survives
 * any app-level call-site changes between RuTube releases.
 *
 * The method is matched by name + first-parameter type only (not the full parameter list):
 * its second parameter is a Kotlin coroutine `Continuation`, and R8 renames that SAM interface
 * to an app-wide, per-build-unstable short name (confirmed `Lfo/k;` in 31.17.2-rustore) since
 * Segment's own `-keep` rules protect the class/method names but not that implicit parameter
 * type.
 */
private const val SEGMENT_ANALYTICS_CLASS = "Lcom/segment/analytics/kotlin/core/Analytics;"
private const val BASE_EVENT_CLASS = "Lcom/segment/analytics/kotlin/core/BaseEvent;"

private val logger = Logger.getLogger("DisableSegmentAnalytics")

private fun MutableMethod.disable() {
    addInstructions(0, "return-void")
}

@Suppress("unused")
val disableSegmentAnalyticsPatch = bytecodePatch(
    name = "Disable Segment analytics",
    description = "Disables Segment (segment.com) event tracking by no-opping its event-processing entry point.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RUTUBE)

    dependsOn(disableAnalyticsDependency)

    execute {
        var processMethod: MutableMethod? = null
        classDefForEach { classDef ->
            if (classDef.type == SEGMENT_ANALYTICS_CLASS) {
                val candidates = classDef.methods.filter { method ->
                    method.name == "process" &&
                        method.returnType == "V" &&
                        method.parameterTypes.size == 2 &&
                        method.parameterTypes[0].toString() == BASE_EVENT_CLASS &&
                        method.implementation != null
                }
                if (candidates.size != 1) {
                    throw PatchException(
                        "Expected one Segment Analytics.process(BaseEvent, Continuation) " +
                            "method, found ${candidates.size}",
                    )
                }
                processMethod = mutableClassDefBy(classDef).methods.first { method ->
                    method.name == "process" &&
                        method.returnType == "V" &&
                        method.parameterTypes.size == 2 &&
                        method.parameterTypes[0].toString() == BASE_EVENT_CLASS
                }
            }
        }

        val method = processMethod
        if (method == null) {
            logger.info("Segment analytics: not found — nothing to disable")
        } else {
            method.disable()
            logger.info("Segment analytics: disabled event processing (Analytics.process)")
        }
    }
}
